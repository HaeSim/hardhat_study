// SPDX-License-Identifier: MIT
/**
 * mapping(keyType => valueType)를 통해서 Map 자료구조를 만들 수 있다.
 * keyType에는 primitives, bytes, string, address 모두 가능합니다.
 * valueType에는 무엇이든 올 수 있습니다. (내부에 또 map구조를 맵핑할 수 있음)
 * Mappings은 iterable 하지 않습니다.
 */
pragma solidity ^0.8.13;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping 항상 값을 반환합니다.
        // 매핑된 값이 없다면, 초기값을 반환합니다.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // delete를 사용하여 set애서 제거할 수 있습니다.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // 중첩 mapping(mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // 중첩 맵핑의 경우에도, 최기화 하지 않더라도 값을 반환합니다.
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}
