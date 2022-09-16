// SPDX-License-Identifier: MIT
/**
 * Event는 블록체인에 loggin(로깅)하도록 만들어줍니다. 사용 예시는 아래와 같스빈다.
 * 이벤트 리스닝과 동시에 사용자 인터페이스를 업데이트하는 경우
 * 저렴한 형태의 스토리지로 사용할 경우
 * 
 */
pragma solidity ^0.8.13;

contract Event {
    // 이벤트 정의
    // 3개 파라미터 까지 indexed할 수 있습니다.
    // 인덱싱된 파라미터는 로그들을 필터링 할 때 사용됩니다.
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
