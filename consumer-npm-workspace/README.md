# Consumer NPM Workspace

This Angular application demonstrates how to consume a shared library (`sa-shared-lib`) using the NPM package approach.

## NPM Package Approach

This project uses NPM to install the shared library as a package directly. This is different from the path mapping approach used in the other consumer workspace. The NPM approach offers several benefits:

- Clear versioning of the library
- More standardized approach for production environments
- Follows typical package distribution workflows

### How it works

1. The shared library is built and packaged in the sa-workspace:

   ```bash
   # In the sa-workspace directory
   ng build sa-shared-lib
   cd dist/sa-shared-lib
   npm pack # Creates a .tgz file
   ```

2. The package is installed in the consumer app:

   ```bash
   # In the consumer-npm-workspace directory
   npm install <path-to-tgz-file>
   ```

3. The Angular module imports the library module:

   ```typescript
   import { SaSharedLibModule } from 'sa-shared-lib';

   @NgModule({
     imports: [
       // ...
       SaSharedLibModule
     ]
   })
   export class AppModule { }
   ```

4. The app component HTML includes the library component:

   ```html
   <lib-sa-shared-lib></lib-sa-shared-lib>
   ```

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
