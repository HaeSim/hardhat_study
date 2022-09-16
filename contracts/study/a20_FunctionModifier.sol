// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * Modifier(수정자)는 함수 호출 전/후로 실행되는 코드 입니다.
 * Modifier는 아래 경우에 사용됩니다.
 * - 접근 제한
 * - 입력값 평가
 * - Reentrancy Hack(재진입성 공격)을 방어
 * => 검증 및 신뢰되지 않은 외부 스마트 컨트랙트가 보안에 취약한 함수를 호출하고, 다시 취약성을 가지는 컨트랙트로 진입 하는 것
 * 참고 : https://medium.com/proofer-tech/%EC%8A%A4%EB%A7%88%ED%8A%B8-%EC%BB%A8%ED%8A%B8%EB%9E%99%ED%8A%B8-%EB%B3%B4%EC%95%88-%EC%9D%B4%EC%8A%88-1-re-entrancy-%EC%9E%AC%EC%A7%84%EC%9E%85%EC%84%B1-7d4caf24803c
 */

import "hardhat/console.sol";

contract FunctionModifier {
    // 아래 변수들을 입증하는데 사용하므로써 어떻게 Modifier를 사용하는 지 알 수 있습니다.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // 배포자를 컨트랙트 owner로 설정합니다.
        owner = msg.sender;
    }

    // 아래 Modifier는 message sender가 owner인지 판별합니다.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // 아래 _(Underscore)는 modifier에서만 사용되는 특별한 문자인데,
        // 아직 soldidity에서 실행할 코드가 남아있다는 의미입니다.
        _;
    }

    // Modifiers는 입력값을 가져가서 사용할 수 있습니다. 아래 예제는
    // 입력받은 address가 0이 아닌지 체크하는 것 입니다.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers는 함수 전 후에 호출될 수 있습니다.
    // 이 Modifier는 실행 간 함수가 호출되는 것을 방지합니다.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        console.log('decrement test .. : %d | %d', x, i);
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
