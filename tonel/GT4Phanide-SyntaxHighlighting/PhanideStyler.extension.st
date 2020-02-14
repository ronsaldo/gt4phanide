Extension { #name : #PhanideStyler }

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideStyler >> asBlocStyler [
	^ PhanideBlTextStylerAdapter new
		phanideStyler: self;
		yourself
]

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideStyler >> styleBlocText: aText fromFileReference: fileReference [
	^ self styleBlocText: aText fromFileReference: fileReference withStyleTable: PhanideSyntaxStyleTable current
]

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideStyler >> styleBlocText: aText fromFileReference: fileReference withStyleTable: styleTable [
	self subclassResponsibility
]
