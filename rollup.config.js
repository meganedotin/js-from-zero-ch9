import riot from 'rollup-plugin-riot'
import nodeResolve from 'rollup-plugin-node-resolve'
import commonjs from 'rollup-plugin-commonjs'
import buble from 'rollup-plugin-buble'
import asyncToGen from 'rollup-plugin-async'

export default {
  entry: 'src/main.js',
  dest: 'dist/main.js',
  plugins: [
    riot(),
    nodeResolve({ jsnext: true }),
    commonjs(),
    buble(),
    asyncToGen()
  ],
  context: 'window',
  format: 'iife'
}
