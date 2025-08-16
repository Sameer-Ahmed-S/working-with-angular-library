import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SaSharedLibModule } from 'sa-shared-lib';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    SaSharedLibModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
