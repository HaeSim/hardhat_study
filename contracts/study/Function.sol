// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * function으로 반환값을 받는 방법은 여러가지가 있습니다.
 * Public 함수는 특정 데이터 타입을 입력받거나 반환할 수 없습니다.
 */
contract Function {
    // 함수에서 복수 개의 값들을 반환 가능합니다.
    function returnMany()
        public
        pure
        returns (
            uint,
            bool,
            uint
        )
    {
        return (1, true, 2);
    }

    // 반환값에 이름을 지정할 수 있습니다.
    function named()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        return (1, true, 2);
    }

    // 반환 값에 이름을 할당하면, return 구문을 생략할 수 있습니다.
    function assigned()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

    // 여러 개의 값을 반환하는 다른 함수에서 불러온 값들을 구조분해 할당할 수 있습니다.
    function destructuringAssignments()
        public
        pure
        returns (
            uint,
            bool,
            uint,
            uint,
            uint
        )
    {
        (uint i, bool b, uint j) = returnMany();

        // 값을 생략할 수도 있습니다.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // map 자료형은 입력이나 출력할 수 없습니다.

    // array는 입력값으로 사용 가능합니다. 
    function arrayInput(uint[] memory _arr) public {}

    // array는 반환값으로도 사용 가능합니다.
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}
