Class {
	#name : #BlPhanideBrowserFileTreeTab,
	#superclass : #BlPhanideBrowserComponent,
	#instVars : [
		'tree'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserFileTreeTab class >> isPermanentComponent [
	^ true
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileTreeTab >> blockElement [
	tree := BrSimpleTree new.
	tree items: {browser baseDirectory} children: [ :fileRef | self childrenFor: fileRef].
	tree stencil:
			(BrPhanideFileTreeRowStencilBuilder new
				icon: [ :aFileReference | aFileReference isDirectory
						ifTrue: [ GLMUIThemeExtraIcons glamorousFolder ]
						ifFalse: [ GLMUIThemeExtraIcons glamorousBrowse ]];
				text: [ :aFileReference | aFileReference basename asRopedText glamorousRegularFontAndSize ]).
	tree when: BrSelectionDoubleClicked do: [ :anEvent |
		tree selectedNodeDo: [ :selectedNode |
			browser openFileView: selectedNode value
		]
	].
	tree when: BrSelectionChanged do: [:anEvent |
		tree selectedNodeDo: [ :selectedNode |
			browser openFileViewTemporarily: selectedNode value
		]
	].
	^ tree
]

{ #category : #api }
BlPhanideBrowserFileTreeTab >> childrenFor: fileReference [
	fileReference isDirectory ifFalse: [
		^ #()
	] ifTrue: [ 
		^ fileReference children sorted: [ :a :b |
			a isDirectory == b isDirectory ifTrue: [ 
				a basename <= b basename
			] ifFalse: [
				a isDirectory asBit >= b isDirectory asBit
			]
		]
	]
]

{ #category : #accessing }
BlPhanideBrowserFileTreeTab >> defaultLabel [
	^ 'Files'
]

{ #category : #accessing }
BlPhanideBrowserFileTreeTab >> defaultName [
	^ #FileTree
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserFileTreeTab >> installLocation [
	^ #leftTabs
]
