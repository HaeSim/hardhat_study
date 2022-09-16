// SPDX-License-Identifier: MIT

/**
 * Solidity는 다중 상속을 지원합니다. 컨트랙트는 "is" 키워드를 통해서  다른 컨트랙트에 상속할 수 있습니다.
 * 자식 컨트랙트에서 오버라이딩 될 부모컨트랙트의 함수는 반드시 "virtual"로 선언되어야 합니다.
 * 그리고 부모 컨트랙트의 함수를 오버라이딩할 자식컨트랙트의 함수는 반드시 "override"로 선언되어야합니다.
 * 상속의 순서는 매우 중요합니다. 
 * 상속 순서는 "가장 기본이 되는 것" 부터 "가장 파생적인 것" 순서로 나열해야합니다.
 */
pragma solidity ^0.8.13;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// 계약은 여러 상위 계약에서 상속할 수 있습니다.
// 서로 다른 계약에서 여러 번 정의된 함수를 호출하면 상위 계약이 오른쪽에서 왼쪽으로, 깊이 우선 방식으로 검색됩니다.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// 상속 순서는 "가장 기본이 되는 것" 부터 "가장 파생적인 것" 순서로 나열해야 하므로
// 아래 처럼하면, 상속 에러가 납니다.
// contract F is B, A {
//     function foo() public pure override(A, B) returns (string memory) {
//         return super.foo();
//     }
// }
