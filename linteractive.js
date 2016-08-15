#! /usr/bin/env node
//https://i.sli.mg/WPITvq.gifv
const path = require('path')
const fs = require('fs')
const cp = require('child_process')
const os = require('os')
const isWin = /^win/.test(os.platform())
const cmd = isWin ? 'powershell.exe' : 'vim'
const begArgs = isWin ? ['vim'] : []

let Engine;
try {
  Engine = require(path.resolve(process.cwd()+'/node_modules/eslint')).CLIEngine
} catch (e) {
  console.log('Must have a local version of eslint, to ensure consistency')
}

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
  let vim = cp.spawn(
    cmd,
    begArgs.concat([`+${line} -c "echo '${rule}'"`, file]),
    { stdio: 'inherit' }
  )
  vim.on('exit', () => iter < mistakes.length && spawnVim(...mistakes[++iter]))
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
