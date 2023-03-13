//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// three ways to send ether

// 1. via transfer - 2300 gas, revert
// 2. via send - 2300 gas, returns bool
// 3. via call - all gas, returns bool and data


contract sendETH{

    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    mapping(bytes32 => mapping(address => bool)) public role;

    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 public ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 public USER = keccak256(abi.encodePacked("USER"));

    constructor () {
        _assignRole(ADMIN, msg.sender);
    }

    modifier onlyRole(bytes32 _admin) {
        require(role[_admin][msg.sender], "not authorized");
        _;
    }

    function _assignRole(bytes32 _role, address _account) internal {
        role[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    function _revokeRole(bytes32 _role, address _account) internal {
        role[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }

    function assignRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        _assignRole(_role, _account);
    }

    function revokeRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        _revokeRole(_role, _account);
    }
}