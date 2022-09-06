// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * 트랜잭션에는 얼마나 많은 ether를 지불해야할까요?
 * 정답은 (gas spent) x (gas price) 의 ether를 지불해야합니다.
 *   - gas는 계산 작업의 단위 입니다.
 *   - gas spent 는 트랜잭션에 사용되는 가스의 총 양입니다.
 *   - gas price 는 gas 당 지불할 최대 ether의 값입니다.
 * 블럭 안에서 더 높은 gas price의 트랜잭션은 더 높은 우선순위를 갖습니다.
 * 소모되지 않은 gas는 환불됩니다.
 * 
 * Gas Limit
 * gas 소모량에는 2개의 상한선이 있습니다.
 * gas limit (트랜잭션을 보내는 사람에 의해서 결정되는 최대 지불 가스량)
 * block gas limit (네트워크에서 설정되는 블럭 내 최대 지불 가스량)
 */
import "hardhat/console.sol";

contract Gas {
    uint public i = 0;

    // 당신이 보내는 가스를 다 쓰면 당신의 거래가 실패하게 된다.
    // 상태 변경이 실행 취소됨
    // 소모된 가스는 환불되지 않습니다.
    function forever() public {
        // 가스를 다 소모할 때 까지 실행되는 반복문입니다. (가스 다쓰면 취소될 예정)
        while (true) {
            i += 1;
            console.log('i : %d', i);
        }
    }
}