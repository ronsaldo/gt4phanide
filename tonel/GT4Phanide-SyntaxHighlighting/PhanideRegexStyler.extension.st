Extension { #name : #PhanideRegexStyler }

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideRegexStyler >> styleBlocText: aText fromFileReference: fileReference withStyleTable: styleTable [
	lexer styleBlocText: aText withStyleTable: styleTable
]
