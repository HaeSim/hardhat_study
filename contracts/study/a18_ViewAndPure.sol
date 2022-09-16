// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * Getter 함수는 view 나 pure로 선언합니다.
 * View 함수는 state 변수를 수정하지 않을 때 선언합니다.
 * Pure 함수는 state 변수 자체를 read하지 않을 때 선언됩니다. (state 값의 변경에 따라 출력이 달라지지 않는 순수함수)
 */
contract ViewAndPure {
    uint public x = 1;

    // Promise not to modify the state.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}