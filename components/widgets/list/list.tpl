<section class="main" v-show="todos.length" v-cloak>
    <input class="toggle-all" type="checkbox" v-model="allDone">
    <ul class="todo-list">
        <li class="todo" v-for="todo in filteredTodos" :class="{completed: todo.completed, editing: todo == editedTodo}">
            <div class="view">
                <input class="toggle" type="checkbox" v-model="todo.completed">
                <label v-on:dblclick="editTodo(todo)">{{todo.title}}</label>
                <button class="destroy" v-on:click="removeTodo(todo)"></button>
            </div>
            <input class="edit" type="text" v-model="todo.title" v-todo-focus="todo == editedTodo" v-on:blur="doneEdit(todo)" v-on:keyup.enter="doneEdit(todo)" v-on:keyup.esc="cancelEdit(todo)" />
        </li>
    </ul>
</section>
<footer class="footer" v-show="todos.length" v-cloak>
				<span class="todo-count">
					<strong v-text="remaining"></strong> {{remaining | pluralize 'item'}} left
				</span>
    <ul class="filters">
        <li><a href="#/all" :class="{selected: visibility == 'all'}">All</a></li>
        <li><a href="#/active" :class="{selected: visibility == 'active'}">Active</a></li>
        <li><a href="#/completed" :class="{selected: visibility == 'completed'}">Completed</a></li>
    </ul>
    <button class="clear-completed" v-on:click="removeCompleted" v-show="todos.length > remaining">
        Clear completed
    </button>
</footer>