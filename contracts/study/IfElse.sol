// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * Solidity에서 조건물을 쓸 수 있습니다. (if, else if, else)
 */
contract IfElse {
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // 삼항 연산자도 사용 가능합니다.
        return _x < 10 ? 1 : 2;
    }
}
