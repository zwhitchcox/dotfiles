#! /usr/bin/env node
'use strict';
const path = require('path')
const Engine = require(path.resolve(process.cwd()+'/node_modules/eslint')).CLIEngine
const spawn = require('child_process').spawn

const options = { 
  extensions: [ '.js' ],
  ignore: true,
  useEslintrc: true,
  cache: false,
  cacheFile: '.eslintcache',
  allowInlineConfig: true
}
console.log('Linting...')
const {results} = new Engine(options).executeOnFiles(['src/**/*-test.js*'])

function spawnVim(file, line, rule) {
  let vim = spawn(editor, [`+${line} -c "echo '${rule}'"`, file], {stdio: 'inherit'})
	vim.on('exit', function() {
		if (iter <= mistakes.length) {
			spawnVim(...mistakes[++iter])
		}
	})
}
const mistakes = results.reduce((mistakes, result) => (result.errorCount 
  && mistakes.concat(result.messages.map(msg => [
    result.filePath,
    msg.line,
    msg.ruleId,
  ]))) || mistakes
, [])
	.reverse()

console.log(`There were ${mistakes.length} mistakes found`)

let iter = 0
mistakes.length && spawnVim(...mistakes[iter])
