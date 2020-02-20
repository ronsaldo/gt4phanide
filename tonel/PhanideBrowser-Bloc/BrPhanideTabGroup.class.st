Class {
	#name : #BrPhanideTabGroup,
	#superclass : #BrTabGroup,
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'as yet unclassified' }
BrPhanideTabGroup >> installBlPhanideComponentPresenter: component [
	| tab |
	tab := BrTab new
		look: BrGlamorousTabLook new;
		label: component label;
		stencil: [component blockElement
			constraintsDo: [:c |
				c horizontal matchParent.
				c vertical matchParent ]].
	component anchor: tab.
	self addTab: tab
]
