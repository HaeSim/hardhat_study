// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * struct를 통해서 커스텀 구조체를 만들 수 있습니다.
 * 서로 관련있는 데이터를 묶을 때 유용합니다.
 * Enum과 마찬가지로, contract 밖에서 선언될 수 있으며, 외부 파일이나 다른 컨트랙트에서
 * import도 가능합니다.
 */

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // 'Todo' 구조체 배열을 선언합니다.
    Todo[] public todos;

    function create(string calldata _text) public {
        // 구조체 초기화에는 3가지 방법이 있습니다.
        // - 함수처럼 호출하기
        todos.push(Todo(_text, false));

        // key-value 맵핑하기
        todos.push(Todo({text: _text, completed: false}));

        // 빈 구조체를 초기화 한 후에, 업데이트 하기
        Todo memory todo;
        todo.text = _text;
        // complete 부분은 초기값인 false로 초기화 될 것 입니다.

        todos.push(todo);
    }

    // Solidity에서는 구조체에 대한 getter를 자동으로 만들어 줍니다.
    // 때문에 사실 아래 함수는 필요가 없습니다.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // test 수정
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // 완료 처리
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
/**
 * 아래와 같이 외부에서 import하여 사용도 가능합니다.
 */
import "./a15_StructDeclaration.sol";

contract TodosImport {
    // An array of 'Todo' structs
    TodoStruct[] public todos;
}