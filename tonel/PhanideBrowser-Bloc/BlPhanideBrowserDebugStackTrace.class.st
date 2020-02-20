Class {
	#name : #BlPhanideBrowserDebugStackTrace,
	#superclass : #BlPhanideBrowserComponent,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserDebugStackTrace class >> isPermanentComponent [
	^ true
]

{ #category : #accessing }
BlPhanideBrowserDebugStackTrace >> defaultLabel [
	^ 'Stack trace'
]

{ #category : #accessing }
BlPhanideBrowserDebugStackTrace >> defaultName [
	^ #DebugStackTrace
]

{ #category : #'as yet unclassified' }
BlPhanideBrowserDebugStackTrace >> installLocation [
	^ #rightMiddleTabs
]
