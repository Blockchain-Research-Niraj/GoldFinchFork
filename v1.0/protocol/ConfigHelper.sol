// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import "./GoldfinchConfig.sol";
import "../interfaces/IPool.sol";
import "../interfaces/IToken.sol";
import "../interfaces/ICreditDesk.sol";
import "../interfaces/IERC20withDec.sol";

/**
 * @title ConfigHelper
 * @notice A convenience library for getting easy access to other contracts and constants within the
 *  protocol, through the use of the GoldfinchConfig contract
 * @author Goldfinch
 */

library ConfigHelper {
  function getPool(GoldfinchConfig config) internal view returns (IPool) {
    return IPool(poolAddress(config));
  }

  function getUSDC(GoldfinchConfig config) internal view returns (IERC20withDec) {
    return IERC20withDec(config.getAddress(uint256(ConfigOptions.Addresses.USDC)));
  }

  function getCreditDesk(GoldfinchConfig config) internal view returns (ICreditDesk) {
    return ICreditDesk(creditDeskAddress(config));
  }

  function getToken(GoldfinchConfig config) internal view returns (IToken) {
    return IToken(tokenAddress(config));
  }

  function poolAddress(GoldfinchConfig config) internal view returns (address) {
    return config.getAddress(uint256(ConfigOptions.Addresses.Pool));
  }

  function creditDeskAddress(GoldfinchConfig config) internal view returns (address) {
    return config.getAddress(uint256(ConfigOptions.Addresses.CreditDesk));
  }

  function tokenAddress(GoldfinchConfig config) internal view returns (address) {
    return config.getAddress(uint256(ConfigOptions.Addresses.Token));
  }

  function reserveAddress(GoldfinchConfig config) internal view returns (address) {
    return config.getAddress(uint256(ConfigOptions.Addresses.TreasuryReserve));
  }

  function protocolAdminAddress(GoldfinchConfig config) internal view returns (address) {
    return config.getAddress(uint256(ConfigOptions.Addresses.ProtocolAdmin));
  }

  function getReserveDenominator(GoldfinchConfig config) internal view returns (uint256) {
    return config.getNumber(uint256(ConfigOptions.Numbers.ReserveDenominator));
  }

  function getWithdrawFeeDenominator(GoldfinchConfig config) internal view returns (uint256) {
    return config.getNumber(uint256(ConfigOptions.Numbers.WithdrawFeeDenominator));
  }

  function getLatenessGracePeriodInDays(GoldfinchConfig config) internal view returns (uint256) {
    return config.getNumber(uint256(ConfigOptions.Numbers.LatenessGracePeriodInDays));
  }

  function getLatenessMaxDays(GoldfinchConfig config) internal view returns (uint256) {
    return config.getNumber(uint256(ConfigOptions.Numbers.LatenessMaxDays));
  }
}
