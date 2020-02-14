Class {
	#name : #BaselineOfGT4Phanide,
	#superclass : #BaselineOf,
	#category : #BaselineOfGT4Phanide
}

{ #category : #baselines }
BaselineOfGT4Phanide >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec baseline: #'PhanideCore' with: [ spec repository: 'github://ronsaldo/phanide' ].
		spec
			package: #'GT4Phanide-SyntaxHighlighting' with: [
				spec requires: #('PhanideCore')
			].
	].
]
