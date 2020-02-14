Extension { #name : #PhanideCommandHighlighterStyler }

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideCommandHighlighterStyler >> styleBlocText: aText fromFileReference: fileReference withStyleTable: styleTable [
	| commands |
	commands := highlighter new parse: aText asString; commands.
	^ self styleBlocText: aText withCommands: commands withStyleTable: styleTable
]

{ #category : #'*GT4Phanide-SyntaxHighlighting' }
PhanideCommandHighlighterStyler >> styleBlocText: aBlText withCommands: commands withStyleTable: styleTable [
	commands do: [ :command |
		command executeOnBlocText: aBlText withStyleTable: styleTable
	].

	^ aBlText
]
