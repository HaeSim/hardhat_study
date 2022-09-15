// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * Solidity에서는 enum을 지원합니다. 상태 변화를 추적할 때 enum을 활용하면 좋습니다.
 * Enum은 contract 밖에 선언될 수 있습니다.
 */

contract Enum {
    // Shipping 상태에 관한 Enum 입니다.
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Enum의 초기값은 0, 즉 첫번째 값입니다.
    // 여기서는 Pending 입니다.
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4

    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
/**
 * 이런 식으로 밖에서 별도 파일로 분리한 Enum을 불러와서 사용도 가능합니다.
 */
import "./a14_EnumDeclaration.sol";

contract Enums {
    Estatus public status;
}