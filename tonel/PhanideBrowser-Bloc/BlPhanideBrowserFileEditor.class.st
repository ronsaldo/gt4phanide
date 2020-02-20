Class {
	#name : #BlPhanideBrowserFileEditor,
	#superclass : #BlPhanideBrowserComponent,
	#instVars : [
		'fileReference',
		'temporaryEditor',
		'unsavedChanges'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #api }
BlPhanideBrowserFileEditor >> closeable [
	^ true
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> defaultLabel [
	^ self labelPrefix , fileReference basename , self labelSuffix
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> fileChanged [
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> fileName [
	^ fileReference ifNil: [ 'Unnamed' ] ifNotNil: [ fileReference basename ]
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> fileReference [
	^ fileReference
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> fileReference: anObject [
	fileReference := anObject.
	self fileChanged
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> initialize [
	temporaryEditor := false.
	unsavedChanges := false.
	super initialize.
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> installLocation [
	^ #mainTabs
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> labelPrefix [
	^ temporaryEditor ifTrue: [ '- ' ] ifFalse: [ '' ]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> labelSuffix [
	^ unsavedChanges ifTrue: [ '*' ] ifFalse: [ '' ]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> makeDirty [
	self unsavedChanges: true.
	self makeTemporaryEditorPermanent.
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> makeTemporaryEditorPermanent [
	temporaryEditor ifTrue: [ 
		browser makeTemporaryEditorPermanent: self
	]

]

{ #category : #controlling }
BlPhanideBrowserFileEditor >> okToClose [
	| choice |
	unsavedChanges ifTrue: [ 
		choice := self promptForCancel.
		choice ifNil: [ ^ false ].
		choice ifTrue: [
			choice := self save.
			choice ifNil: [ ^ false ]
		].
	].
	^ super okToClose
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> onAnchorDoubleClick [
	temporaryEditor ifTrue: [ self makeTemporaryEditorPermanent ]
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> promptForCancel [
	"Ask for the appropriate action to take when unaccepted contents
	would be overwritten."

	| choice |
	choice := UIManager default
		confirm: ('The contents of {1} has been modified.\What do you want to do?' translated withCRs format: { self fileName })
		trueChoice: 'Saved' translated
		falseChoice: 'Discard' translated
		cancelChoice: 'Cancel' translated
		default: nil.
	^ choice
	
]

{ #category : #actions }
BlPhanideBrowserFileEditor >> save [
	fileReference ifNil: [ ^ self saveAs ].
	self saveInto: fileReference.
	self unsavedChanges: false.
	^ true
]

{ #category : #'menu actions' }
BlPhanideBrowserFileEditor >> saveAs [
	| targetFile |
	targetFile := UIManager default fileSave: 'Save as' extensions: self validFileExtensions path: (fileReference ifNotNil: [fileReference parent fullName]).
	targetFile ifNil: [ ^ nil ].
	
	"Rename myself"
	fileReference := targetFile asAbsolute.
	self name: fileReference printString.
	
	"Save into the target file."
	self saveInto: fileReference.
	^ true
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> saveInto: targetFileReference [
	self subclassResponsibility
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> temporaryEditor [
	^ temporaryEditor
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> temporaryEditor: anObject [
	temporaryEditor := anObject.
	self updateLabel.
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> tryToReloadForStartup [
	self fileChanged
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> unsavedChanges [
	^ unsavedChanges
]

{ #category : #accessing }
BlPhanideBrowserFileEditor >> unsavedChanges: aBoolean [
	unsavedChanges == aBoolean ifTrue: [ ^ self ].
	unsavedChanges := aBoolean.
	self updateLabel
]

{ #category : #updating }
BlPhanideBrowserFileEditor >> updateLabel [
	label ifNotNil: [ self label: self defaultLabel ]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileEditor >> validFileExtensions [
	^ nil
]
