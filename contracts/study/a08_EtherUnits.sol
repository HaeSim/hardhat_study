// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * 트랜잭션을 ether를 수수료로 지불해야합니다.
 * 1달러가 100센트인 것 처럼, 1 ether는 10의 18승 wei입니다.
 */
contract EtherUnits {
    uint public oneWei = (1 wei);
    // 1 wei is equal to 1
    bool public isOneWei = (1 wei) == 1;

    uint public oneEther = (1 ether);
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = (1 ether) == 1e18;
}
