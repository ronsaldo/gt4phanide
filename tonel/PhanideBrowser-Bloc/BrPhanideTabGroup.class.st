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
			padding: (BlInsets all: 10);
			constraintsDo: [:c |
				c horizontal matchParent.
				c vertical matchParent ]].
	component anchor: (BlPhanideComponentTabAnchor new
		component: component;
		tabGroup: self;
		tab: tab;
		yourself).
	self addTab: tab
]
