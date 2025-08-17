import { Component } from '@angular/core';

@Component({
  selector: 'lib-simple-component',
  template: `
    <div style="border: 2px solid blue; padding: 10px;">
      <p>Simple shared component works!</p>
    </div>
  `
})
export class SimpleComponent {
  constructor() {
    console.log('SimpleComponent initialized');
  }
}
