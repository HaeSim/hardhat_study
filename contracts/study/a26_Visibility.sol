// SPDX-License-Identifier: MIT
/**
 * 함수와 상태 변수는 다른 컨트랙트에서 접근할 수 있는지 선언시에 명시해야합니다.
 * 아래와 같이 선언합니다.
 * public - 어떤 컨트랙트나 계정에서 호출할 수 있습니다.
 * private - 해당 함수가 정의된 컨트랙트 내부에서만 호출할 수 있습니다.
 * internal- 해당 함수를 상속받은 컨트랙트만 호출할 수 있습니다.
 * external - 외부 함수나 계정에서 호출할 수 있다.
 * 상태변수는 external로 선언할 수 없고 public, private, internal로 선언될 수 있습니다.
 */
pragma solidity ^0.8.13;

contract Base {
    // Private 함수는 해당 컨트랙트 내부에서만 호출 가능합니다.
    // 해당 컨트랙트를 상속받은 컨트랙트라도 호출할 수 없습니다.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Private 함수는 해당 컨트랙트, 그리고 상속받은 컨트랙트 내부에서만 호출 가능합니다.
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public 함수는 해당 컨트랙트, 해당 컨트랙트를 상속받은 컨트랙트,
    // 그리고 다른컨트랙트, 그리고 다른 계정에서 접근이 가능합니다.
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External 함수는 다른 컨트랙트 혹은 계정에서 접근 가능합니다.
    // - by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // 아래 함수는 external 함수를 내부에서 호출하려고 하기 때문에 컴파일에서 오류가 납니다.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // 상태 변수들
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // 상태변수는 external로 선언될 수 없기 때문에 아래 코드는 컴파일 되지 않습니다.
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // 상속받은 컨트랙트라도, private로 선언된 함수나 상태변수에는 접근할 수 없습니다.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal 함수는 상속받은 컨트랙트에서 호출 될 수 있습니다.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
