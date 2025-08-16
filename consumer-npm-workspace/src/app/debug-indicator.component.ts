import { Component, OnInit } from '@angular/core';
import { SaSharedLibModule, SaSharedLibComponent } from 'sa-shared-lib';

@Component({
  selector: 'app-debug-indicator',
  template: `
    <div style="background-color: {{ statusColor }}; padding: 10px; margin: 10px; border-radius: 5px;">
      <h3>Library Import Status</h3>
      <p>Module imported: {{ moduleImported ? 'YES' : 'NO' }}</p>
      <p>Component imported: {{ componentImported ? 'YES' : 'NO' }}</p>
      <p>Message: {{ message }}</p>
    </div>
  `
})
export class DebugIndicatorComponent implements OnInit {
  moduleImported = false;
  componentImported = false;
  message = 'Checking imports...';
  statusColor = 'yellow';

  constructor() {}

  ngOnInit(): void {
    try {
      // Check if module is imported
      this.moduleImported = !!SaSharedLibModule;
      
      // Check if component is imported
      this.componentImported = !!SaSharedLibComponent;
      
      if (this.moduleImported && this.componentImported) {
        this.message = 'Library successfully imported!';
        this.statusColor = 'lightgreen';
      } else {
        this.message = 'Library partially imported.';
        this.statusColor = 'orange';
      }
    } catch (error: any) {
      this.message = 'Error importing library: ' + (error?.message || 'Unknown error');
      this.statusColor = 'lightcoral';
    }

    console.log('Debug Indicator Status:', {
      moduleImported: this.moduleImported,
      componentImported: this.componentImported,
      message: this.message
    });
  }
}
