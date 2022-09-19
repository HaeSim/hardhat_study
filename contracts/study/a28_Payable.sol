// SPDX-License-Identifier: MIT
/**
 * payable로 선언된 함수나 지갑주소는 컨트랙트에 이더를 받을 수 있습니다. 
 */
pragma solidity ^0.8.13;

contract Payable {
    // Payable address can receive Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // 이 계약에 이더를 저금하는 함수 입닌다.
    // 이 함수를 이용하려면 이더를 전송하면서 함께 호출 하면 된다.
    // 그러면 이 계약의 이더 잔액은 자동으로 업데이트 된다.
    function deposit() public payable {}

    // 이 함수를 이더를 전송하면서 함께 호출하면 에러가 발생한다.
    // 왜냐하면 이함수는 payable로 선언되지 않았기 때문이다.
    function notPayable() public {}

    // 컨트랙트의 이더 잔고로부터 인출하는 함수이다.
    function withdraw() public {
        // 이 컨트랙트의 잔액 구하기
        uint amount = address(this).balance;

        // 모든 이더를 owner에게 전송하기
        // Owner는 반드시 payable로 선언된 인원만 전송받을 수 있다.
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // 이더를 이 계약에서 다른 주소로 전송하는 함수이다.
    function transfer(address payable _to, uint _amount) public {
        // 파라미터에서 _to가 payable로 선언되어있다는 것에 주목
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}
