import { Component } from '@angular/core';
import { SaSharedLibComponent } from 'sa-shared-lib';

@Component({
  selector: 'app-test',
  template: `
    <div>
      <h2>Test Component</h2>
      <p>Testing library import:</p>
      <lib-sa-shared-lib></lib-sa-shared-lib>
    </div>
  `
})
export class TestComponent {
  constructor() {
    console.log('TestComponent initialized');
    console.log('SaSharedLibComponent:', SaSharedLibComponent);
  }
}
