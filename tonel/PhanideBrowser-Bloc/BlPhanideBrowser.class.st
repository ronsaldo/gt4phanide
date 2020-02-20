Class {
	#name : #BlPhanideBrowser,
	#superclass : #Object,
	#instVars : [
		'space',
		'baseDirectory',
		'menuBar',
		'statusBar',
		'toolbar',
		'componentDictionary',
		'leftTabs',
		'mainTabs',
		'bottomTabs',
		'rightTopTabs',
		'rightMiddleTabs',
		'rightBottomTabs'
	],
	#category : #'PhanideBrowser-Bloc'
}

{ #category : #'instance creation' }
BlPhanideBrowser class >> directory: aDirectory [
	^ self newWithDirectory: aDirectory
]

{ #category : #'instance creation' }
BlPhanideBrowser class >> new [
	^ self newWithDirectory: '.'
]

{ #category : #'instance creation' }
BlPhanideBrowser class >> newWithDirectory: aDirectory [
	^ self basicNew initializeWithDirectory: aDirectory
]

{ #category : #accessing }
BlPhanideBrowser >> baseDirectory [
	^ baseDirectory
]

{ #category : #accessing }
BlPhanideBrowser >> bottomTabs [
	^ bottomTabs
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> createBottomTabGroup [
	^ BrPhanideTabGroup new
		look: BrPhanideBottomTabGroupLook new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent
		]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> createMenuBar [
	menuBar := BrToolbar new
		look: BrGlamorousToolbarLook new;
		addItem: ((BrButton new
						look: BrGlamorousButtonWithLabelLook;
						label: 'File';
						action: [ ];
						yourself))
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> createStatusBar [
	statusBar := BlElement new
		background: Color veryLightGray muchLighter;
		layout: BlLinearLayout horizontal;
		addChild: (BrLabel new
			look: BrGlamorousLabelLook;
			constraintsDo: [ :c |
				c vertical fitContent.
				c horizontal fitContent ];
			text: 'Status description')
	
	
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> createToolbar [
	toolbar := BrToolbar new
		look: BrGlamorousToolbarLook new;
		addItem: ((BrButton new
						look: BrGlamorousButtonWithIconLook;
						icon: BrGlamorousIcons open asElement;
						action: [ ];
						yourself))
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> createTopTabGroup [
	^ BrPhanideTabGroup new
		look: BrPhanideTopTabGroupLook new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent
		]
]

{ #category : #initialization }
BlPhanideBrowser >> initialize [
	super initialize.
	componentDictionary := Dictionary new.
]

{ #category : #initialization }
BlPhanideBrowser >> initializeWithDirectory: aDirectory [
	baseDirectory := aDirectory asFileReference asAbsolute.
	self assert: baseDirectory isDirectory.
	self initialize
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> installComponentModel: aComponentModel [
	| anchorHolder |
	self registerNamedComponent: aComponentModel.

	anchorHolder := self perform: aComponentModel installLocation.
	Stdio stdout nextPutAll: 'installBlPhanideComponentPresenter:'; lf.
	anchorHolder installBlPhanideComponentPresenter: aComponentModel

]

{ #category : #accessing }
BlPhanideBrowser >> leftTabs [
	^ leftTabs
]

{ #category : #accessing }
BlPhanideBrowser >> mainTabs [
	^ mainTabs
]

{ #category : #'instance creation' }
BlPhanideBrowser >> open [
	^ self space show
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> populateComponent: aComponentClass [
	| componentModel |

	"Create the component model"
	componentModel := aComponentClass for: self.
	self installComponentModel: componentModel

]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> populateComponents [
	BlPhanideBrowserComponent allSubclassesDo: [ :sc |
		sc isPermanentComponent ifTrue: [ 
			self populateComponent: sc
		]
	]
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> populateSpace [
	| container mainContainer centerColumn rightColumn |
	self
		createMenuBar;
		createToolbar;
		createStatusBar.

	container := BlElement new 
			layout: BlLinearLayout vertical;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent].
	centerColumn := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		addChild: (mainTabs := self createTopTabGroup);
		addChild: (bottomTabs := self createBottomTabGroup).
		
	rightColumn := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		addChild: (rightTopTabs := self createBottomTabGroup);
		addChild: (rightMiddleTabs := self createBottomTabGroup);
		addChild: (rightBottomTabs := self createBottomTabGroup).
	mainContainer := BlElement new
		layout: BlLinearLayout horizontal;
		addChild: (leftTabs := self createBottomTabGroup);
		addChild: centerColumn;
		addChild: rightColumn.

	space addChild: container.
	container
		addChild: (menuBar
			constraintsDo: [:c |
				c horizontal matchParent.
				c vertical fitContent
			]);
		addChild: (toolbar
			constraintsDo: [:c |
				c horizontal matchParent.
				c vertical fitContent
			]);
		addChild: (mainContainer
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent.]);
		addChild: (statusBar
			constraintsDo: [:c |
				c horizontal matchParent.
				c vertical fitContent
			]).
		self populateComponents
]

{ #category : #'as yet unclassified' }
BlPhanideBrowser >> registerNamedComponent: tabModel [
	componentDictionary at: tabModel name
		ifPresent: [ self error: 'Adding clashing Phanide browser component.' ]
		ifAbsentPut: [ tabModel ]
]

{ #category : #accessing }
BlPhanideBrowser >> rightBottomTabs [
	^ rightBottomTabs
]

{ #category : #accessing }
BlPhanideBrowser >> rightMiddleTabs [
	^ rightMiddleTabs
]

{ #category : #accessing }
BlPhanideBrowser >> rightTopTabs [
	^ rightTopTabs
]

{ #category : #'instance creation' }
BlPhanideBrowser >> space [
	space := BlSpace new
		title: 'Phanide';
		extent: 1024@768;
		yourself.
	self populateSpace.
	^ space
]