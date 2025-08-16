# Consumer App Workspace

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 17.3.16.

## Shared Library Integration

This Angular application demonstrates how to consume a shared library (`sa-shared-lib`) using TypeScript path mapping instead of npm package linking.

### Path Mapping Setup

This project uses TypeScript path mapping to reference the `sa-shared-lib` directly from its source location. This approach offers several benefits:

- Allows real-time development of the library without rebuilding
- Ensures the consumer app always uses the latest library code
- Simplifies the development workflow

### How it works

1. The `tsconfig.json` file includes a path mapping for the `sa-shared-lib`:

   ```json
   "paths": {
     "sa-shared-lib": ["../sa-workspace/dist/sa-shared-lib"],
     "sa-shared-lib/*": ["../sa-workspace/dist/sa-shared-lib/*"]
   }
   ```

1. The `angular.json` file has `preserveSymlinks` set to `true` to ensure that symbolic links are preserved when building:

   ```json
   "build": {
     "builder": "@angular-devkit/build-angular:application",
     "options": {
       "preserveSymlinks": true,
       // other options...
     }
   }
   ```

1. The Angular module imports the library module:

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

1. The app component HTML includes the library component:

   ```html
   <lib-sa-shared-lib></lib-sa-shared-lib>
   ```

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

### Using the shared library

For this path mapping approach to work, you need to:

1. Build the shared library first:

   ```bash
   cd ../sa-workspace
   ng build sa-shared-lib
   ```

2. Then run the consumer app:

   ```bash
   cd ../consumer-app-workspace
   ng serve
   ```

Any changes to the shared library will require rebuilding the library before they appear in the consumer app.

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
