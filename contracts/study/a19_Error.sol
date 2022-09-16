// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * 에러가 발생하면 트랜잭션이 진행되면서 발생한 모든 변경사항을 되돌립니다.
 * require, revert, assert 문을 호출하여 에러를 발생시킬 수 있습니다.
 * require는 보통 계산 전, 입력값의 유효성을 평가하는데 사용됩니다.
 * revet는 require문과 유사하지만, 상세한 내용은 아래 예제 코드를 보기 바랍니다.
 * assert는 false가 절대로 되면 안되는 값들을 평가하는데 사용되빈다. assert에 실패한다는 것은 곧 버그가 발생한다는 것을 의미합니다.
 * 또는 커스텀 에러를 발생시킴으로서 gas를 절약할 수 있습니다.
 */

contract Error {
    function testRequire(uint _i) public pure {
        // Require문은 반드시 아래 내용들의 유효성을 평가해야합니다.
        // - 입력값
        // - 계산 전 조건
        // - 다른 함수를 호출해서 반환받은 값들
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // Revert는 유효성 검증 조건이 까다로울 때 유용합니다.
        // 위의 예제와 같은 내용입니다. 즉, edge case에 적용하면 좋은 방식.
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // Assert는 내부 에러, 혹은 불변속성을 테스트하는 용도로만 사용해야합니다.
        // 불변속성이란, 항상 정상적으로 작동해야하는 비즈니스 로직이라고 생각하면 쉽다.

        // 아래 예제는 num 변수가 항상 0이어야한다는 의미의 예제 코드이다.
        // num 값이 업데이트 되면 안된다.
        assert(num == 0);
    }

    // 커스텀 에러
    // 커스텀 에러는 revert문과 함께 사용해야한다.
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}
