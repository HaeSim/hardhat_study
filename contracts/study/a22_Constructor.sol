// SPDX-License-Identifier: MIT
/**
 * 생성자는 컨트랙트가 생성될 때 실행되는 선택적으로 선언하는 함수입니다.
 * 아래 예시 코드는 생성자에게 인수를 전달하는 과정을 나타냅니다.
 */
pragma solidity ^0.8.13;

// Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// 부모 컨트랙트를 파라메터로 초기화하는 방법은 2가지 방법이 있습니다.

// 1. 상속 목록 안에 파라메터를 넣는 방법
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    // 2. modifier 처럼 써서 파라미터를 전달하는 방법(인풋값 훔쳐감)
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// 자식 컨트랙트의 생성자에서 호출된 순서에 상관없이 부모 생성자는 항상 상속된 순서대로 호출됩니다.

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
