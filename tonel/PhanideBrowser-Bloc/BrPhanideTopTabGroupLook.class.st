Class {
	#name : #BrPhanideTopTabGroupLook,
	#superclass : #BrLook,
	#instVars : [
		'headerLook'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'api - style' }
BrPhanideTopTabGroupLook >> buildLayout [
	self addAll: {
		headerLook := BrGlamorousTabGroupHeaderLook new.
		BrTabGroupSplitterLook new.
		BrTabGroupContentLook new.
		BrLayoutResizerLook inherit }.
]

{ #category : #'api - style' }
BrPhanideTopTabGroupLook >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #'api - style' }
BrPhanideTopTabGroupLook >> initialize [
	super initialize.

	self buildLayout.

	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ]
]
