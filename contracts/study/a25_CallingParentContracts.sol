// SPDX-License-Identifier: MIT
/**
 * 부모컨트랙트는 직접 호출 혹은, "super" 키워드를 통해서 호출할 수 있다.
 * super 키워드를 사용하면, 
 * super 키워드를 이용하면 모든 직계 부모 컨트랙트가 호출 된다.
 */
pragma solidity ^0.8.13;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract AAA {
    // This is called an event. You can emit events from your function
    // and they are logged into the transaction log.
    // In our case, this will be useful for tracing function calls.
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract BBB is AAA {
    function foo() public virtual override {
        emit Log("B.foo called");
        AAA.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract CCC is AAA {
    function foo() public virtual override {
        emit Log("C.foo called");
        AAA.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract DDD is BBB, CCC {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.

    function foo() public override(BBB, CCC) {
        super.foo();
    }

    function bar() public override(BBB, CCC) {
        super.bar();
    }
}
