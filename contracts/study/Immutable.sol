// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * Immutable 변수는 상수 변수와 유사합니다.
 * immutable 변수의 값은 최초 생성자 안에서만 지정되며, 이후에는 변경되지 않습니다.
 */
contract Immutable {
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
