Class {
	#name : #BlPhanideComponentTabAnchor,
	#superclass : #BrSimpleTreeRowStencilBuilder,
	#instVars : [
		'tabGroup',
		'tab',
		'component'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #accessing }
BlPhanideComponentTabAnchor >> component [
	^ component
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> component: anObject [
	component := anObject
]

{ #category : #deleting }
BlPhanideComponentTabAnchor >> destroy [
	tabGroup removeTab: tab
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> label: aLabel [
	tab label: aLabel
]

{ #category : #deleting }
BlPhanideComponentTabAnchor >> makeActive [
	tab select
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> tab [
	^ tab
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> tab: anObject [
	tab := anObject
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> tabGroup [
	^ tabGroup
]

{ #category : #accessing }
BlPhanideComponentTabAnchor >> tabGroup: anObject [
	tabGroup := anObject
]
