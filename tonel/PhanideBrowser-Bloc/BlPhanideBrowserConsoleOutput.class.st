Class {
	#name : #BlPhanideBrowserConsoleOutput,
	#superclass : #BlPhanideBrowserComponent,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #testing }
BlPhanideBrowserConsoleOutput class >> isPermanentComponent [
	^ true
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
