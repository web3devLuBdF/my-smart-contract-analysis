// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

interface IHubBase {
    function getAssetId(address underlying) external view returns (uint256);
    function getAssetLiquidity(uint256 assetId) external view returns (uint256);
    function getAddedShares(uint256 assetId) external view returns (uint256);
    function getSpokeAddedShares(uint256 assetId, address spoke) external view returns (uint256);
    function previewRemoveByShares(uint256 assetId, uint256 shares) external view returns (uint256);
}

interface ISpoke {
    function getReserveId(address hub, uint256 assetId) external view returns (uint256);
    function supply(uint256 reserveId, uint256 amount, address onBehalfOf) external returns (uint256, uint256);
    function borrow(uint256 reserveId, uint256 amount, address onBehalfOf) external returns (uint256, uint256);
    function setUsingAsCollateral(uint256 reserveId, bool usingAsCollateral, address onBehalfOf) external;
    function getUserAccountData(address user) external view returns (UserAccountData memory);

    struct UserAccountData {
        uint256 totalCollateralValue;
        uint256 totalDebtValue;
        uint256 healthFactor;
        uint256 riskPremium;
    }
}