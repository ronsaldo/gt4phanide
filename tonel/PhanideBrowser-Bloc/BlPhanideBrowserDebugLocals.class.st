Class {
	#name : #BlPhanideBrowserDebugLocals,
	#superclass : #BlPhanideBrowserComponent,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserDebugLocals class >> isPermanentComponent [
	^ true
]

{ #category : #accessing }
BlPhanideBrowserDebugLocals >> defaultLabel [
	^ 'Locals'
]

{ #category : #accessing }
BlPhanideBrowserDebugLocals >> defaultName [
	^ #DebugLocals
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserDebugLocals >> installLocation [
	^ #rightTopTabs
]
