// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Primitives {
    bool public boo = true;

    /*
    uint는 부호없는 정수를 나타내며, 양수를 의미합니다.
    뒤에 숫자를 붙임으로서 다양한 수를 나타낼 수 있습니다.
        uint8   0 부터 2 ** 8 - 1 까지
        uint16  0 부터 2 ** 16 - 1 까지
        ...
        uint256 0 부터 2 ** 256 - 1 까지
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint로만 쓰면, uint256로 인식합니다. 

    /*
    int는 음수를 사용할 수 있는 정수 입니다.
    uint와 마찬가지로 숫자를 뒤에 붙여 다양함 범위(int8 ~ int256)를 표현할 수 있습니다.
    
    int256 -2 ** 255 부터 2 ** 255 - 1 까지
    int128 -2 ** 127 부터 2 ** 127 - 1 까지
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int도  int256과 동일합니다.

    // minimum and maximum of int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    Solidity에서, 데이터 타입 byte는 byte들의 시퀀스를 표현합니다. 
    byte는 두가지 유형이 있습니다.

     - 고정 사이즈 byte 배열
     - 동적 사이즈 byte 배열
     
     Solidity에서 bytes라는 단어는 bytes의 동적배열을 표현하는 것입니다.
     즉, byte[]을 줄여서 표현한 것이라고 생각하면 된다.
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    // 원시자료형들은 초기값이 있습니다.
    // 초기화 되지 않은 변수들의 초기값은 아래와 같습니다.
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
