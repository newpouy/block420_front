import React, { Component } from 'react';
import { Button, ButtonToolbar } from 'react-bootstrap';

import './Artist.css';

class Artist extends Component {
  
  render() {
    console.log('dd',this.props.contract)
    return (
      <div>
        <div id="upload-box" >
          <input className="upload" type="file" />
          <ButtonToolbar className="btn-wrapper">
            <Button bsStyle="primary">업로드</Button>
          </ButtonToolbar>
        </div>
      </div>
    )
  }
}

export default Artist;
