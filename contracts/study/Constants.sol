// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * Constants 는 수정할 수 없는 변수 입니다.
 * 상수를 하드 코딩하여 사용하면 가스 비용을 절약할 수 있습니다. (다른 함수에서도 재사용이 가능하기 때문)
 */
contract Constants {
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}
