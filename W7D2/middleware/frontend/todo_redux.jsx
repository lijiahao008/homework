import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { applyMiddleware } from 'redux';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  let newStore = applyMiddlewares(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={newStore} />, root);
});


  const addLoggingToDispatch = store => next => action => {
    const jayDispatch = store.dispatch;
    console.log(store.getState());
    console.log(action);
    let returnValue = jayDispatch(action);
    console.log(store.getState());
    return returnValue;
  };

  const applyMiddlewares = function(store, ...args){
    let dispatch = store.dispatch;
    args.forEach( (arg) => {
      dispatch = arg(store)(dispatch);
    });
    return Object.assign({}, store, { dispatch });
  };
