// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);

        myStruct;
        myMemStruct;
    }

    function _f(
        uint[] memory _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal       pure
{
        _arr[1];
        _map;
        _myStruct;
    }

    // 메모리 변수도 리턴할 수 있습니다.
    function g(uint[] memory _arr) public pure returns (uint[] memory) {
        return _arr;
    }

    function h(uint[] calldata _arr)  external {
        arr = _arr;
    }
}

/**
 * 변수들은 특성에 따라 storage, memory, 그리고 calldata에 명시적으로 저장됩니다. 
 *      storage - 상태 변수가 저장되는 곳 입니다.(블록체인 상에 저장됨)
 *      memory - EVM 메모리에 저장되는 변수입니다. (함수가 호출될 때만 존재함)
 *      calldata - 함수의 인자 데이터들을 포함하는 변수 입니다. (memory와 유사하게 동작)
 *      자세한 내용은 https://opentutorials.org/course/2869/19664 참고
 */