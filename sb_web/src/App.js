import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Artist from './Artist'
import Listener from './Listener'

import { Tab, Tabs,Jumbotron, Button} from 'react-bootstrap';

class App extends Component {
  render() {
    return (
      <div className="App">
      <Jumbotron>
        <h1>SoundBlocks</h1>
        </Jumbotron>
        <Tabs defaultActiveKey={2} id="uncontrolled-tab-example">
          <Tab eventKey={1} title="Artist">
            <Artist/>
          </Tab>
          <Tab eventKey={2} title="Listener">
            <Listener/>
          </Tab>
        </Tabs>
      </div>
    );
  }
}

export default App;
