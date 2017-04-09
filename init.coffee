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

atom.commands.add 'atom-workspace', 'atom-restart', ->
  atom.restartApplication()
  
atom.commands.add 'atom-text-editor', 'xyzzy-calc', ->
  child_process.spawn('c:/Users/Public/apl/xyzzy/xyzzy.exe', ['-f calc'])

atom.commands.add 'atom-text-editor', 'xyzzy-open', ->
  editor = atom.workspace.getActiveTextEditor()
  child_process.spawn('c:/Users/Public/apl/xyzzy/xyzzy.exe', [editor.getPath(), '-g', editor.getCursorBufferPositions()[0].row]);

atom.commands.add 'atom-text-editor', 'gitk', ->
  child_process.spawn('gitk', [], {cwd: atom.project.getPaths()[0]})

atom.commands.add 'atom-text-editor', 'zsh-prompt', ->
  child_process.spawn("C:/cygwin/bin/mintty.exe", ['-e', '/bin/xhere', '/bin/zsh.exe', atom.project.getPaths()[0]])
   

