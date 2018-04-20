import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Artist from './Artist'
import Listener from './Listener'

import { Tab, Tabs } from 'react-bootstrap';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <Tabs defaultActiveKey={2} id="uncontrolled-tab-example">
          <Tab eventKey={1} title="Artist">
            <Artist/>
          </Tab>
          <Tab eventKey={2} title="Listener">
            <Listener/>
          </Tab>
        </Tabs>;
      </div>
    );
  }
}

export default App;
