# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

shell = require 'shell'
child_process = require 'child_process'

atom.commands.add 'atom-text-editor', 'explorer-from-here', ->
  editor = atom.workspace.getActiveTextEditor()
  shell.showItemInFolder(editor.getPath())

atom.commands.add 'atom-text-editor', 'xyzzy-calc', ->
  child_process = require('child_process')
  child = child_process.spawn('c:/Users/Public/apl/xyzzy/xyzzy.exe', ['-f calc'])

atom.commands.add 'atom-text-editor', 'gitk', ->
  prjdir = atom.project.getPaths()[0]
  child_process = require('child_process')
  child = child_process.spawn('gitk', [], {cwd: prjdir})

atom.commands.add 'atom-text-editor', 'zsh-prompt', ->
  prjdir = atom.project.getPaths()[0]
  child_process = require('child_process')    #\"#{editor.getPath()}\"
  child = child_process.spawn("C:/cygwin/bin/mintty.exe", ['-e', '/bin/xhere', '/bin/zsh.exe', prjdir])
   
atom.commands.add 'atom-text-editor', 'xyzzy-open', ->
  child_process = require('child_process');
  editor = atom.workspace.getActiveTextEditor()
  child = child_process.spawn('c:/Users/Public/apl/xyzzy/xyzzy.exe', [editor.getPath(), '-g', editor.getCursorBufferPositions()[0].row]);

