<header class="header">
    <h1>todos</h1>
    <input class="new-todo" autofocus autocomplete="off"  placeholder="What needs to be done?" v-model="newTodo" v-on:keyup.enter="addTodo">
</header>