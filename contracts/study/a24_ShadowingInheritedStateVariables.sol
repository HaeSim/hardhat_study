// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * 함수와 다르게, 상태 변수는 자식 컨트랙트에서 재선언하여 오버라이딩 될 수 없습니다. 
 * 그럼 상속된 상태 변수를 올바르게 오버라이딩하는 방법에 대해서 알아봅시다.
 */
contract AA {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing은 Solidity 0.6 버전에서는 허용되지 않습니다.
// 아래 내용은 컴파일 되지 않습니다.
// contract BB is AA {
//     string public name = "Contract B";
// }

contract CC is AA {
    // This is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }
    function setName(string calldata _input) public {

        name = _input;
    }

    // C.getName returns "Contract C"
}
