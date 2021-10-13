#!/usr/bin/env node
const fg = require('fast-glob'), path = require('path');
const cssModulesPlugin = require("esbuild-css-modules-plugin");

const COMPONENTS_SRC_DIR = path.resolve(__dirname, 'app/javascript/components'),
      COMPONENTS_OUTPUT_DIR = path.resolve(__dirname, 'app/assets/builds/components');

const components = fg.sync([
  path.resolve(__dirname, COMPONENTS_SRC_DIR) + '/**/*.{jsx,tsx}'
], { dot: true });

const outputComponents = components.map((component) => {
  return component.replace(/\.(tsx|jsx)/g, '.js')
                  .replace(COMPONENTS_SRC_DIR, COMPONENTS_OUTPUT_DIR)
})

components.forEach((c, i) => {
  const out = outputComponents[i]
  require("esbuild")
    .build({
      bundle: true,
      logLevel: "info",
      entryPoints: [c],
      bundle: true,
      outfile: out,
      plugins: [cssModulesPlugin()],
      watch: true,
    })
    .catch((error) => {
      console.log('*** Failed to build "' + out + '"')
      return process.exit(1)
    });
})
