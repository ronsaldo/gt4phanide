Class {
	#name : #BrPhanideBottomTabGroupLook,
	#superclass : #BrPhanideTopTabGroupLook,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'api - style' }
BrPhanideBottomTabGroupLook >> buildLayout [
	self addAll: {
		BrTabGroupContentLook new.
		BrLayoutResizerLook inherit.
		"BrTabGroupSplitterLook new."
		headerLook := BrGlamorousTabGroupHeaderLook new.}.
]
