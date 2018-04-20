import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import { Button, Badge } from 'react-bootstrap';

class Listener extends Component {
  componentDidMount() {

  }
  click(num) {
    console.log('click',num)
    var t0 = performance.now();
    console.log('click',num)
    console.log('click',num)

    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
    console.log('click',num)
var t1 = performance.now();
console.log("Call to doSomething took " + (t1 - t0) + " milliseconds.")
if((t1-t0)<500) {
  alert('listen more')
}
  }
  render() {
    return (
      <div>
        <div style={divStyle}>
          <div style={divS}>
            <Button onClick={()=>this.click(1)} bsStyle="primary">Primary</Button>
            <Badge>42</Badge>
          </div>  
          <iframe width="100%" height="100" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/396615804&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>
        </div>
        <div style={divStyle}>
          <div style={divS}>
            <Button onClick={()=>this.click(2)} bsStyle="primary">Primary</Button>
            <Badge>42</Badge>
          </div>
          <iframe width="100%" height="100" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/414446448&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>
        </div>
      </div>
    );
  }
}
const divS = {
  display: 'flex',
  flexDirection: 'column',
}
const divStyle = {
  display: 'flex',
  flexDirection: 'row',
  flex: '1 1 auto',
  backgroundColor: '#EFEFEF',
  alignItems: 'center',
  justifyContent: 'center',
  textAlign: 'center'
}

export default Listener;
