// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./Staker.sol";

contract ExampleExternalContract {
    Staker public stakerContract;
    address payable _stakerContractAddress;

    bool public completed;

    function complete(address payable stakerContractAddress) public payable {
        completed = true;
        _stakerContractAddress = stakerContractAddress;
    }

    function getStaterContractAddress() public returns (address) {
        _stakerContractAddress;
    }

    function externalReStake() public {
        require(address(this).balance > 0, "no funds to restake");
        stakerContract = Staker(_stakerContractAddress);

        stakerContract.restake{value: address(this).balance}(msg.sender);
        completed = false;
    }
}
