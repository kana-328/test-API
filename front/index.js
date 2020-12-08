import React from "react";
import ReactDOM from "react-dom";
import './index.css'
import Main from './Main';
import * as  serviceWorker from './serviceWorker'

const Index = () => {
  return <div>Hello React!</div>;
};

ReactDOM.render(<Main />, document.getElementById("root")); 