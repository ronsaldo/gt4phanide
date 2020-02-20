Class {
	#name : #BlPhanideDebugConsoleOutput,
	#superclass : #BlPhanideBrowserConsoleOutput,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #accessing }
BlPhanideDebugConsoleOutput >> defaultLabel [
	^ 'Debugger Console'
]

{ #category : #accessing }
BlPhanideDebugConsoleOutput >> defaultName [
	^ #DebugConsole
]

{ #category : #'as yet unclassified' }
BlPhanideDebugConsoleOutput >> installLocation [
	^ #rightBottomTabs
]
