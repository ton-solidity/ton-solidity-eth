/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
// SPDX-License-Identifier: GPL-3.0
/**
 * Virtual Machine type (EVM/TVM) and version specification.
 * Handles both the machine type and version capabilities for code generation.
 */

#pragma once

#include <cstdint>
#include <optional>
#include <string>

#include <boost/operators.hpp>
#include <libyul/YulStack.h> // for yul::Machine


namespace solidity::evmasm
{
/// Virtual machine bytecode instruction. Forward declared from libevmasm/Instruction.h
enum class Instruction: uint8_t;
}

namespace solidity::langutil
{

/**
 * A version specifier of the VM we want to compile to.
 * Defaults to some default TVM. //TODO
 */
class VMMachineAndVersion:
	boost::less_than_comparable<VMMachineAndVersion>,
	boost::equality_comparable<VMMachineAndVersion>
{
private:
	enum class Version {
		Homestead,
		TangerineWhistle,
		SpuriousDragon,
		Byzantium,
		Constantinople,
		Petersburg,
		Istanbul,
		Berlin,
		London,
		Paris,
		Shanghai,
		Cancun,
		Prague,
		TVMDefault
	};

	VMMachineAndVersion(Version _version):
		m_version(_version),
		m_machine(_version == Version::TVMDefault ? yul::Machine::TVM : yul::Machine::EVM)
	{}

	Version m_version = Version::TVMDefault;
	yul::Machine m_machine = yul::Machine::TVM;
public:
	VMMachineAndVersion() = default;

	static VMMachineAndVersion homestead() { return {Version::Homestead}; }
	static VMMachineAndVersion tangerineWhistle() { return {Version::TangerineWhistle}; }
	static VMMachineAndVersion spuriousDragon() { return {Version::SpuriousDragon}; }
	static VMMachineAndVersion byzantium() { return {Version::Byzantium}; }
	static VMMachineAndVersion constantinople() { return {Version::Constantinople}; }
	static VMMachineAndVersion petersburg() { return {Version::Petersburg}; }
	static VMMachineAndVersion istanbul() { return {Version::Istanbul}; }
	static VMMachineAndVersion berlin() { return {Version::Berlin}; }
	static VMMachineAndVersion london() { return {Version::London}; }
	static VMMachineAndVersion paris() { return {Version::Paris}; }
	static VMMachineAndVersion shanghai() { return {Version::Shanghai}; }
	static VMMachineAndVersion cancun() { return {Version::Cancun}; }
	static VMMachineAndVersion prague() { return {Version::Prague}; }
	static VMMachineAndVersion tvmDefault() { return {Version::TVMDefault}; }

	static std::optional<VMMachineAndVersion> fromString(std::string const& _version)
	{
		for (auto const& v: {
			homestead(),
			tangerineWhistle(),
			spuriousDragon(),
			byzantium(),
			constantinople(),
			petersburg(),
			istanbul(),
			berlin(),
			london(),
			paris(),
			shanghai(),
			cancun(),
			prague(),
			tvmDefault()
		})
			if (_version == v.name())
				return v;
		return std::nullopt;
	}

	bool operator==(VMMachineAndVersion const& _other) const {
		solRequire(m_machine == _other.m_machine, InternalCompilerError, "target machine doesn't match");
		return m_version == _other.m_version;
	}
	bool operator<(VMMachineAndVersion const& _other) const {
		solRequire(m_machine == _other.m_machine, InternalCompilerError, "target machine doesn't match");
		return m_version < _other.m_version;
	}

	std::string name() const
	{
		switch (m_version)
		{
		case Version::Homestead: return "homestead";
		case Version::TangerineWhistle: return "tangerineWhistle";
		case Version::SpuriousDragon: return "spuriousDragon";
		case Version::Byzantium: return "byzantium";
		case Version::Constantinople: return "constantinople";
		case Version::Petersburg: return "petersburg";
		case Version::Istanbul: return "istanbul";
		case Version::Berlin: return "berlin";
		case Version::London: return "london";
		case Version::Paris: return "paris";
		case Version::Shanghai: return "shanghai";
		case Version::Cancun: return "cancun";
		case Version::Prague: return "prague";
		case Version::TVMDefault: return "tvmDefault";
		}
		return "INVALID";
	}

	/// Has the RETURNDATACOPY and RETURNDATASIZE opcodes.
	bool supportsReturndata() const { return *this >= byzantium(); }
	bool hasStaticCall() const { return *this >= byzantium(); }
	bool hasBitwiseShifting() const { return *this >= constantinople(); }
	bool hasCreate2() const { return *this >= constantinople(); }
	bool hasExtCodeHash() const { return *this >= constantinople(); }
	bool hasChainID() const { return *this >= istanbul(); }
	bool hasSelfBalance() const { return *this >= istanbul(); }
	bool hasBaseFee() const { return *this >= london(); }
	bool hasBlobBaseFee() const { return *this >= cancun(); }
	bool hasPrevRandao() const { return *this >= paris(); }
	bool hasPush0() const { return *this >= shanghai(); }
	bool hasBlobHash() const { return *this >= cancun(); }
	bool hasMcopy() const { return *this >= cancun(); }
	bool supportsTransientStorage() const { return *this >= cancun(); }

	/// @returns true if this represents a TVM machine type
	bool isTVM() const { return m_machine == yul::Machine::TVM; }

	bool hasOpcode(evmasm::Instruction _opcode, std::optional<uint8_t> _eofVersion) const;

	yul::Machine const& machine() const { return m_machine; }

	/// Whether we have to retain the costs for the call opcode itself (false),
	/// or whether we can just forward easily all remaining gas (true).
	bool canOverchargeGasForCall() const { return *this >= tangerineWhistle(); }
};

}
