// SPDX-License-Identifier: MIT
/**
 * fallback 함수는 어떤 인자도 받지 않고, 아무것도 리턴하지 않는 함수를 말한다.
 * 실행 조건은 아래와 같다.It is executed either when
 * - 존재하지 안흔 함수가 호출 되거나,
 * - 이더가 바로 컨트랙트로 전송되었으나, receive 함수가 없거나,
 * - msg.data가 비어있지 않거나 할 때 실행된다.
 * fallback은 transfer나 send 함수로 호출되었을 때 2300 gas limit을 가진다. 
 * 즉, 컨트랙트가 이더를 받을 수 있게 하거나, 이더를 받고 어떤 실행을 하도록 하거나,
 * call로 없는 함수가 호출되었을 때 실행되는 코드를 작성할 수 있다.
 */
pragma solidity ^0.8.13;

contract Fallback {
    event Log(uint gas);

    // Fallback 함수는 반드시 external로 선언되어야한다.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log(gasleft());
    }

    // 컨트랙트의 잔액을 확인하는 Helper 함수이다.
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
