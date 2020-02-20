Class {
	#name : #BrPhanideFileTreeRowStencilBuilder,
	#superclass : #BrSimpleTreeRowStencilBuilder,
	#instVars : [
		'icon'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'api - instantiation' }
BrPhanideFileTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	
	| aContainer anIcon |
	aContainer := super buildDefault.

	anIcon := icon glamourValue: self treeNode value.
	anIcon ifNotNil: [
		(aContainer childNamed: #expander)
			addChild: (BrImageStencil new 
				image: anIcon;
				asElement) at: 2
	].

	^ aContainer
]

{ #category : #accessing }
BrPhanideFileTreeRowStencilBuilder >> icon [
	^ icon
]

{ #category : #accessing }
BrPhanideFileTreeRowStencilBuilder >> icon: anObject [
	icon := anObject
]
