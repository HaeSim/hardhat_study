// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * Array는 컴파일 타임 고정 크기 또는 동적 크기를 가질 수 있습니다.
 * 고정 크기 배열의 경우, 컴파일 타임에 최적화가 가능하기 때문에 효율적입니다.
 * 동적 크기 배열의 경우, 런타임에 배열의 크기가 결정되기 때문에 최적화가 불가능합니다.
 */
contract Array {
    // 배열 초기화하는 방법
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // 고정크기 배열의 경우, 모든 요소가 0으로 초기화 됩니다.
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity는 전체 배열을 반환할 수 있습니다.
    // 그러나 길이가 무한히 늘어나는 동적크기 배열인 경우, 해당 기능은 피하는 것이 좋습니다.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // 배열에 요소 추가
        // 배열 크기가 1만큼 늘어납니다.
        arr.push(i);
    }

    function pop() public {
        // 배열의 마지막 요소 제거
        // 배열 크기가 1만큼 감소합니다.
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete문은 배열의 길이를 줄이지 않습니다.
        // 다만, 해당 요소의 값을 초기값으로 변경할 뿐입니다.
        // 해당요소의 경우 uint 배열이기 때문에 0이 됩니다.
        delete arr[index];
    }

    function examples() external pure returns (uint) {
        // 메모리에 배열을 만들면, 고정크기 배열이 만들어집니다.
        uint[] memory a = new uint[](5);
        
        return a[1];
    }
}

/**
 * shift(오른쪽 -> 왼쪽)로 배열 요소 삭제 예제
 */
import "hardhat/console.sol";

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");
        for (uint i = _index; i < arr.length; i++) {
            console.log('initial array : %d', arr[i]);
        }
        // business logic here
        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        
        for (uint i = _index; i < arr.length; i++) {
            console.log('shift result : %d', arr[i]);
        }
    
        arr.pop();
        for (uint i = _index; i < arr.length; i++) {
            console.log('result : %d', arr[i]);
        }
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        // assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        // assert(arr.length == 0);
    }
}

/**
 * 배열의 마지막 요소를 삭제된 인덱스에 넣는 방식의 삭제 예제
 */

contract ArrayReplaceFromEnd {
    uint[] public arr;

    // 요소를 삭제하는 것은 배열 길이에 차이를 만듭니다.
    // 배열을 컴팩트하게 유지하는 한 가지 방법은 마지막 요소를 삭제할 위치로 이동시키는 것입니다.
    function remove(uint index) public {
        // 마지막 요소를 삭제되는 위치로 덮어쓰기 한 뒤,
        arr[index] = arr[arr.length - 1];
        // 마지막 요소를 뺍니다
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
