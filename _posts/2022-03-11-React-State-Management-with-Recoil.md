---

title: React State Management with Recoil

author: Chamika Goonetilaka

linkedin: https://lk.linkedin.com/in/chamikagoonetilaka

description : Over the years, the massive growth of React.JS has given birth to different state management libraries, amongst other things.

The state management libraries available in React at our disposal at the time of this article are enormous. Some developers tackle the challenge using React Hooks, while others combine them with application state management libraries like Redux or the newly released Recoil. In this article, we will discuss state management using **Recoil**, the new kid on the block!!!


---
___

Over the years, the massive growth of React.JS has given birth to different state management libraries, amongst other things.


The state management libraries available in React at our disposal at the time of this article are enormous. Some developers tackle the challenge using React Hooks, while others combine them with application state management libraries like Redux or the newly released Recoil. In this article, we will discuss state management using **Recoil**, the new kid on the block!!!


[Recoil](https://recoiljs.org/)  was invented by Dave McCabe, a Software Engineer at Facebook; the same company behind React. It provides a global state so that all components in a React application may easily exchange states, and it is more lightweight than Redux, requiring no boilerplate code setup.


In this article, we'll have a look at how to set up and use Recoil in your React applications by building a simple traditional to-do app.


#### **Installing Recoil**

you can install Recoil using npm or yarn.

```
npm i recoil

// or

yarn add recoil
```

#### **Configuring The App to Use Recoil**

Since Recoil uses a 100% hook-based approach, to use its state management mechanism in our entire app, we need to wrap our entire app with *RecoilRoot*; a Recoil component.

```
import React from "react";
import ReactDOM from "react-dom";
import { RecoilRoot } from "recoil";
import "./index.css";
import App from "./App";

ReactDOM.render(
  <RecoilRoot>
    <App />
  </RecoilRoot>,
  document.getElementById("root")
);
```

#### **Creating Atoms!!!**

After that, we must make an atom. In Recoil, an atom is a single piece of memory that stores data, which you can subscribe to from any component of your application. You are free to make as many atoms as you choose. When data changes in an atom, it will re-render the components subscribed to or using that atom. This is where the recoil's performance aspect comes into play. Recoil will ensure that only those components that are subscribed to that specific atom are re-rendered.


Creating an atom is extremely easy. Create a *src/recoil/atom/todoAtom.js* file and add the following code:

```
import { atom } from "recoil";

export const todoListAtom = atom({
  key: "todoListState",
  default: [],
});
```

*key* is the first entry in that item. This is a one-of-a-kind string that will be used to represent a particular atom. An atom's initial state is *default*. That's all there is to it!!!


#### **Adding Data to an Atom**

In our to-do app, we need a component to add to-do items. Let’s create the *TodoItemCreator* component for that.

```
import { useState } from "react";
import { useRecoilState } from "recoil";
import { todoListAtom } from "../recoil/atoms/todoAtom";
import { generateUID } from "../utils/uuid";

export const TodoItemCreator = () => {
  const [inputValue, setInputValue] = useState("");
  const [_, setTodoList] = useRecoilState(todoListAtom);

  const onChange = (event) => {
    setInputValue(event.target.value);
  };

  const addTodoItem = () => {
    if (inputValue) {
      setTodoList((oldTodoList) => [
        ...oldTodoList,
        {
          id: generateUID(),
          text: inputValue,
          isComplete: false
        }
      ]);
      setInputValue("");
    }
  };

  return (
    <div className="todo-creator">
      <input type="text" value={inputValue} onChange={onChange} />
      <button className="add-btn" onClick={addTodoItem}>
        Add Task
      </button>
    </div>
  );
};
```

Here, we have an input for the user to type the new to-dos. We can use the *useRecoilState* hook (which is provided by the recoil library to get the current state of the data inside the atom) along with a handy function to update the state. If you have used *useState* in React, this will look quite identical to what you're used to in your local component state. The *useRecoilState* hook takes an atom as the argument.


When the user types in the input and clicks the *Add Task* button, an *addTodoItem* function is called. This function simply calls the *setTodoList* function given by the hook. Because it's best not to update your global state directly, make a shallow copy of previous to-dos and add a new one instead. *GenerateUID* is a utility function in the preceding code snippet that returns a unique id that we'll later use to update a simple to-do from a list of to-dos.


#### **Consuming Data from the Atom**

Now let's create a component (*TodoMain.js*) to display the to-dos in a list and enable the user to update, delete, or mark the to-dos as done.

```
import { useRecoilValue } from "recoil";
import { TodoItemCreator } from "./TodoItemCreator";
import { TodoItem } from "./TodoItem";
import { todoListAtom } from "../recoil/atoms/todoAtom";
import "./todo.css";

export const TodoMain = () => {
  const todoList = useRecoilValue(todoListAtom);

  return (
    <div className="parent-container">
      <div>
        <TodoItemCreator />
        {todoList.length > 0 && (
          <div className="todos-list">
            {todoList.map((todoItem) => (
              <TodoItem key={todoItem.id} item={todoItem} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
};
```

Here we simply call the *useRecoilValue* is a hook provided by Recoil which returns the current state of date in the atom. We are using this hook to get all to-dos and map over them to display them on the screen.


#### **Updating Data in Atom**

Let's have another component, *TodoItem* that uses the same *useRecoilState* hook and some helper functions to find and update the state of a specific to-do.

```
import { useRecoilState } from "recoil";
import { todoListAtom } from "../recoil/atoms/todoAtom";

export const TodoItem = ({ item }) => {
  const [todoList, setTodoList] = useRecoilState(todoListAtom);
  const index = todoList.findIndex((listItem) => listItem === item);

  const editItemText = (event) => {
    const newList = replatItemAtIndex(todoList, index, {
      ...item,
      text: event.target.value
    });

    setTodoList(newList);
  };

  const toggleItemCompletion = () => {
    const newList = replatItemAtIndex(todoList, index, {
      ...item,
      isComplete: !item.isComplete
    });

    setTodoList(newList);
  };

  const deleteItem = () => {
    const newList = removeItemAtIndex(todoList, index);

    setTodoList(newList);
  };

  return (
    <div className="container">
      <input
        className={item.isComplete.toString() === "true" && "done-task"}
        type="text"
        value={item.text}
        onChange={editItemText}
      />
      <input
        type="checkbox"
        checked={item.isComplete}
        onChange={toggleItemCompletion}
      />
      <button className="del-btn" onClick={deleteItem}>
        X
      </button>
    </div>
  );
};

const replatItemAtIndex = (arr, index, newValue) => {
  return [...arr.slice(0, index), newValue, ...arr.slice(index + 1)];
};

const removeItemAtIndex = (arr, index) => {
  return [...arr.slice(0, index), ...arr.slice(index + 1)];
};

```

That's all there is to it. You can handle all your React application's state management needs with only two hooks and one function. Recoil's strength lies in its concise API and performance when compared to Redux.


#### **References**

•	[Recoil](https://recoiljs.org/)
•	[Using Recoil instead of Redux For State Management In React Applications | by Origho precious | StackAnatomy | Medium](https://medium.com/stackanatomy/using-recoil-instead-of-redux-for-state-management-in-react-applications-91dc7ca52986) 
•	[How to Use Recoil for State Management in Your React Projects (freecodecamp.org)](https://www.freecodecamp.org/news/how-to-use-recoil-for-state-management-in-your-react-projects/)  


