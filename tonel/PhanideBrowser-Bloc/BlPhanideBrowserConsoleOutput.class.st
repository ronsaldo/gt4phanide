Class {
	#name : #BlPhanideBrowserConsoleOutput,
	#superclass : #BlPhanideBrowserComponent,
	#instVars : [
		'textEditor',
		'editorElement'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserConsoleOutput class >> isPermanentComponent [
	^ true
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserConsoleOutput >> blockElement [
	| text |
	textEditor := BrTextEditor new.

	editorElement := BrEditorElement new
		editor: textEditor.
	text := '' asRopedText.
	text glamorousCodeFontDo: #beNotOverwritableByStyler; glamorousCodeSizeDo: #beNotOverwritableByStyler.
	textEditor text: text.

	^ editorElement
]

{ #category : #accessing }
BlPhanideBrowserConsoleOutput >> defaultLabel [
	^ 'Console Output'
]

{ #category : #accessing }
BlPhanideBrowserConsoleOutput >> defaultName [
	^ #MainConsoleOutput
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserConsoleOutput >> installLocation [
	^ #bottomTabs
]
