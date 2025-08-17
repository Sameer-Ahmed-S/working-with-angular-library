import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SaSharedLibComponent } from './sa-shared-lib.component';
import { SimpleComponent } from './simple-component.component';

@NgModule({
  declarations: [
    SaSharedLibComponent,
    SimpleComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    SaSharedLibComponent,
    SimpleComponent
  ]
})
export class SaSharedLibModule { }
