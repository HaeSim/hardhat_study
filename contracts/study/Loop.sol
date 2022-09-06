// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
/**
 * Solidity에서 반복문을 사용할 수 있습니다.(for, while, do-while)
 * 무한 루프는 작성하지 마십시오. gas limit에 도달하여 트랜잭션이 실패할 수 있습니다. 
 * 이러한 이유 때문에, while과 do-while문의 경우 잘 사용하지 않습니다.
 */
contract Loop {
    function loop() public pure {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // continue도 사용가능
                continue;
            }
            if (i == 5) {
                // 반복문 탈출
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}
