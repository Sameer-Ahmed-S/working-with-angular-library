import { Component } from '@angular/core';

@Component({
  selector: 'lib-sa-shared-lib',
  template: `
    <div style="border: 3px solid red; padding: 20px; margin: 20px; background-color: lightblue;">
      <h3>Shared Library Component</h3>
      <p>
        {{ message }} works9999!
      </p>
    </div>
  `
})
export class SaSharedLibComponent {

  message: string;
  constructor() {
    this.message = "Hello message!!!";
  }

}
