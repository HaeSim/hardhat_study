// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * Solidity에는 3가지 형태의 변수가 있습니다.
 * 1. 로컬(Local) 변수
 *     - 함수 내부에서 선언됨.
 *     - 블록체인 상에 저장안됨.
 * 2. 상태(State) 변수
 *     - 함수 밖에 선언됨.
 *     - 블록체인 상에 저장됨.
 * 3. 글로벌(Global) 변수
 *     - 블록체인에 대한 정보를 제공함
 */
import "hardhat/console.sol";

contract Variables {
    // 상태 변수(State variables) 블록체인 상에 저장됩니다.
    string public text = "Hello";
    uint public num = 123;

    function doSomething() view public {
        // 로컬 변수(Local variables)는 블록체인 상에 저장되지 않습니다.
        uint i = 456;

        // 글로벌 변수 입니다.
        uint timestamp = block.timestamp; // 현재 블록의 타임스템프 입니다.
        address sender = msg.sender; // caller의 주소입니다.
        console.log('timestamp : %d', timestamp);
        console.log('local variable : %d', i);
        console.log('sender : %s', sender);
    }
}
