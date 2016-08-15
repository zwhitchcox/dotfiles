#! /usr/bin/env node
'use strict';
const path = require('path')
const Engine = require(path.resolve(process.cwd()+'/node_modules/eslint')).CLIEngine
const fs = require('fs')
const cp = require('child_process')
const os = require('os')

const isWin = /^win/.test(os.platform())
const cmd = isWin ? 'powershell.exe' : 'vim'
const begArg = isWin ? '& \'C:\\Program Files (x86)\\Vim\\vim74\\vim.exe\'' : ''

function log(...args) {
	console.log(args)
	return true
}

const options = { 
  extensions: [ '.js' ],
  ignore: true,
  useEslintrc: true,
  cache: false,
  cacheFile: '.eslintcache',
  allowInlineConfig: true
}
const {results} = new Engine(options).executeOnFiles(['src/**/*-test.js*'])

function spawnVim(file, line, rule) {
  let vim = cp.spawn(cmd, [begArg,`+${line} -c "echo '${rule}'"`,file], {stdio: 'inherit'})
	vim.on('exit', function() {
		if (iter<=mistakes.length) {
			displayMistake()
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

console.log(`there were ${mistakes.length} mistakes found`)

let iter = 0
mistakes.length && spawnVim(...mistakes[iter])

function displayMistake() {
  console.log(...mistakes[iter]);
  return true
}
