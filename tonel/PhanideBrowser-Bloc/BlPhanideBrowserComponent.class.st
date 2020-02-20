Class {
	#name : #BlPhanideBrowserComponent,
	#superclass : #Object,
	#instVars : [
		'browser',
		'name',
		'label',
		'anchor'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'instance creation' }
BlPhanideBrowserComponent class >> for: aBrowser [
	^ self basicNew initializeWithBrowser: aBrowser
]

{ #category : #testing }
BlPhanideBrowserComponent class >> isPermanentComponent [
	^ false
]

{ #category : #accessing }
BlPhanideBrowserComponent >> anchor [
	^ anchor
]

{ #category : #accessing }
BlPhanideBrowserComponent >> anchor: anObject [
	anchor := anObject
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserComponent >> blockElement [
	^ BlElement new background: Color magenta
]

{ #category : #accessing }
BlPhanideBrowserComponent >> browser [
	^ browser
]

{ #category : #api }
BlPhanideBrowserComponent >> closeable [
	^ false
]

{ #category : #accessing }
BlPhanideBrowserComponent >> defaultLabel [
	^ 'Untitled'
]

{ #category : #accessing }
BlPhanideBrowserComponent >> defaultName [
	^ self class name
]

{ #category : #initialization }
BlPhanideBrowserComponent >> initializeWithBrowser: aBrowser [
	browser := aBrowser.
	self initialize.
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserComponent >> installLocation [
	^ self subclassResponsibility
]

{ #category : #accessing }
BlPhanideBrowserComponent >> label [
	^ label ifNil: [ label := self defaultLabel ]
]

{ #category : #accessing }
BlPhanideBrowserComponent >> label: aNewLabel [
	anchor ifNotNil: [ anchor label: aNewLabel ].
	label := aNewLabel

]

{ #category : #accessing }
BlPhanideBrowserComponent >> name [
	^ name ifNil: [ name := self defaultName ]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserComponent >> onAnchorDoubleClick [
]
