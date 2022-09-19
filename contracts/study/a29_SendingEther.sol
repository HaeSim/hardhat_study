// SPDX-License-Identifier: MIT
/**
 * 이더는 어떻게 전송 할까?
 * 아래와 같은 방법으로 다른 컨트랙트에 이더를 전송할 수 있다.
 * - 1. transfer (2300 gas, throws error)
 * - 2. send (2300 gas, returns bool)
 * - 3. call (forward all gas or set gas, returns bool)
 * 
 * 어떻게 이더를 전송 받을까?
 * 이더를 전송받는 컨트랙트느 반드시 아래중 한 개 이상의 함수가 필요하다.
 * - receive() external payable
 * - fallback() external payable
 * - receive() 함수는 msg.data가 비어있어야 호출되고, 아니면 fallback()이 호출된다.
 * 
 * 그럼 어떤 메소드를 사용하면 될까?
 * 2019년 12월 이후부터는 re-entrancy guard(재진입 공격 방지)와 함께 호출하는 것이 권장된다.
 * re-entrancy guard 는 아래와 같이 구현한다. 
 * - 다른 컨트랙트를 호출하기 전에 모든 상태변수 변경을 끝낸다.
 * - re-entrancy guard modifier를 사용한다.
 */
pragma solidity ^0.8.13;

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // 아래 함수는 더이상 추천되지 않는다.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send 함수는 성공여부에 대해서 boolean 값을 반환한다.
        // 하지만 아래 함수는 더이상 추천되지 않는다.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call 함수는 성공여부에 대해서 boolean 값을 반환한다.
        // 아래 함수가 현재 권장되는 전송 방법이다.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
