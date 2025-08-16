# Angular Library Debugging Guide

This guide explains how to debug the Angular library in Chrome DevTools.

## Setup

1. The advanced debugging script has already:
   - Built the library with source maps
   - Copied the original TypeScript source files to the package
   - Added debug info to help with source mapping
   - Installed the package in the consumer app

## Finding the Library Source Files in Chrome DevTools

Follow these steps to locate and debug the library source code:

1. **Open Chrome DevTools**
   - Press F12 or right-click and select "Inspect"

2. **Enable Source Maps**
   - Go to Settings (⚙️ or F1)
   - Navigate to "Sources" section
   - Ensure "Enable JavaScript source maps" is checked
   - Ensure "Enable CSS source maps" is checked

3. **Find Source Files Using Search**
   - Press Ctrl+P to open the file search
   - Type "sa-shared-lib.component.ts" in the search box
   - The file should appear in the search results

4. **Alternative: Browse Source Tree**
   - In the Sources tab, look for one of these paths:
     - `webpack://node_modules/sa-shared-lib/src/lib/`
     - `webpack://./node_modules/sa-shared-lib/src/lib/`
     - `webpack://sa-shared-lib/src/lib/`
     - `src/lib/` (in the `sa-shared-lib` folder)

5. **Use Source Map Helper in Console**
   - Check the console for source map debug messages
   - Look for "Source map debugging enabled" and other helper logs

## Debugging Methods

1. **Breakpoints in Library Code**
   - Once you locate the source file, click on a line number to add a breakpoint
   - The breakpoint will trigger when that code executes

2. **Use the Debugger Statement**
   - The library component already has a `debugger;` statement
   - This will automatically pause execution when hit

3. **Step Into Library Code**
   - Set a breakpoint in the consumer app where it uses the library
   - When it hits, use "Step Into" (F11) to enter the library code

4. **Source Map Verification**
   - In the console, you'll see debug info about the source maps
   - This helps verify that source maps are working correctly

## Troubleshooting

If you still can't see the readable source code:

1. **Check for TypeScript Files**
   - The original .ts files are copied to the package
   - They should be in `node_modules/sa-shared-lib/src/`

2. **Look for Source Map Files**
   - Check if .map files exist in the browser's network tab
   - Look for files ending with .js.map

3. **Try Chrome DevTools Experiments**
   - Enable "DevTools experiments" in chrome://flags
   - Then enable "Source Map Debugging" in DevTools Settings > Experiments

4. **Use the Command Line Source Map Viewer**
   - You can use tools like `source-map-explorer` to verify maps

## Direct Source Access

The original source files are directly accessible at:

```typescript
./sa-workspace/dist/sa-shared-lib/src/lib/sa-shared-lib.component.ts
```

This allows you to inspect and modify the source for debugging purposes.
