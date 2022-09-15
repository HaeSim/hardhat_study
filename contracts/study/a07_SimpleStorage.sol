// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * 상태 변수를 저장하거나, 업데이트하는 경우에는 반드시 트랜잭션을 전송해야합니다.
 * 반면에 단순히 상태변수를 읽는 것은 가스비가 들지 않습니다.
 */
contract SimpleStorage {
    uint public num;

    // 상태변수를 저장·업데이트 하는 경우, 트랜잭션을 전송해야합니다.
    function set(uint _num) public {
        num = _num;
    }

    // 트랜잭션 전송없이 상태변수를 읽을 수 있습니다.
    function get() public view returns (uint) {
        return num;
    }
}
