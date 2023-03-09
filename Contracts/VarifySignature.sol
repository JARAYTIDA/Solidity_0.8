// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract VarifySig{

    function varify(address _signer, string memory _message, bytes memory _sig) external pure returns(bool){

        bytes32 messageHash = getMessageHash(_message);
        bytes32 signedHash = getSignedHash(messageHash);

        return recover(signedHash, _sig) == _signer;

    }

    function getMessageHash(string memory _message) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_message));
    }

    function getSignedHash(bytes32 _msgHash) public pure returns(bytes32){
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _msgHash));
    }

    function recover(bytes32 _ethSignedMessage, bytes memory _sig) public pure returns(address){
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessage, v, r, s);
    }

    function _split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint8 v){
        require(_sig.length == 65, "not a valid signature");

        assembly{
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
    }

}