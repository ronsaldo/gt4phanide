Class {
	#name : #BlPhanideBrowserTextFileEditor,
	#superclass : #BlPhanideBrowserFileEditor,
	#instVars : [
		'textEditor',
		'editorElement'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserTextFileEditor class >> isFallbackEditorFor: aFileReference [
	[
		aFileReference contents 
	] on: Error do: [
		^ false
	].
	^ true
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserTextFileEditor >> blockElement [
	| text |
	textEditor := BrTextEditor new.
	self setupTextEditorStyler.
	editorElement := BrEditorElement new
		editor: textEditor.
	text := fileReference contents asRopedText.
	text glamorousCodeFontDo: #beNotOverwritableByStyler; glamorousCodeSizeDo: #beNotOverwritableByStyler.
	textEditor text: text.

	^ editorElement
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserTextFileEditor >> setupTextEditorStyler [
	| styler blocStyler |
	styler := PhanideStyler forFileReference: fileReference.
	styler ifNil: [ ^ self ].
	
	blocStyler := styler asBlocStyler.
	textEditor styler: blocStyler
]
