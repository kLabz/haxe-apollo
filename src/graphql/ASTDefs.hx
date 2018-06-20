package graphql;

/* Taken from https://raw.githubusercontent.com/jcward/haxe-graphql/master/proj/ast/src/graphql/ASTDefs.hx */
/* Will use the graphql ast lib as dependency instead once published */

typedef TokenKindEnum = TokenKind;

typedef Source = graphql.parser.StringSlice;

typedef BaseNode = {
	kind:String,
	?loc:Location
}

// Type nodes -- kind of a lie, but meh
typedef TypeNode = { > BaseNode,
	// Calling these optionals makes us able to simply null-check them:
	?name: NameNode, // Only for NamedTypeNode
	?type: TypeNode, // Not for NamedTypeNode
}

// typedef NamedOrListTypeNode = BaseNode; //	NamedTypeNode | ListTypeNode

// TokenKind
@:enum abstract TokenKind(String) to String from String {
	var SOF = '<SOF>';
	var EOF = '<EOF>';
	var BANG = '!';
	var DOLLAR = '$';
	var AMP = '&';
	var PAREN_L = '(';
	var PAREN_R = ')';
	var SPREAD = '...';
	var COLON = ':';
	var EQUALS = '=';
	var AT = '@';
	var BRACKET_L = '[';
	var BRACKET_R = ']';
	var BRACE_L = '{';
	var PIPE = '|';
	var BRACE_R = '}';
	var NAME = 'Name';
	var INT = 'Int';
	var FLOAT = 'Float';
	var STRING = 'String';
	var BLOCK_STRING = 'BlockString';
	var COMMENT = 'Comment';
}

// Kind
@:enum abstract Kind(String) to String from String {
	// Name
	var NAME = 'Name';

	// Document
	var DOCUMENT = 'Document';
	var OPERATION_DEFINITION = 'OperationDefinition';
	var VARIABLE_DEFINITION = 'VariableDefinition';
	var VARIABLE = 'Variable';
	var SELECTION_SET = 'SelectionSet';
	var FIELD = 'Field';
	var ARGUMENT = 'Argument';

	// Fragments
	var FRAGMENT_SPREAD = 'FragmentSpread';
	var INLINE_FRAGMENT = 'InlineFragment';
	var FRAGMENT_DEFINITION = 'FragmentDefinition';

	// Values
	var INT = 'IntValue';
	var FLOAT = 'FloatValue';
	var STRING = 'StringValue';
	var BOOLEAN = 'BooleanValue';
	var NULL = 'NullValue';
	var ENUM = 'EnumValue';
	var LIST = 'ListValue';
	var OBJECT = 'ObjectValue';
	var OBJECT_FIELD = 'ObjectField';

	// Directives
	var DIRECTIVE = 'Directive';

	// Types
	var NAMED_TYPE = 'NamedType';
	var LIST_TYPE = 'ListType';
	var NON_NULL_TYPE = 'NonNullType';

	// Type System Definitions
	var SCHEMA_DEFINITION = 'SchemaDefinition';
	var OPERATION_TYPE_DEFINITION = 'OperationTypeDefinition';

	// Type Definitions
	var SCALAR_TYPE_DEFINITION = 'ScalarTypeDefinition';
	var OBJECT_TYPE_DEFINITION = 'ObjectTypeDefinition';
	var FIELD_DEFINITION = 'FieldDefinition';
	var INPUT_VALUE_DEFINITION = 'InputValueDefinition';
	var INTERFACE_TYPE_DEFINITION = 'InterfaceTypeDefinition';
	var UNION_TYPE_DEFINITION = 'UnionTypeDefinition';
	var ENUM_TYPE_DEFINITION = 'EnumTypeDefinition';
	var ENUM_VALUE_DEFINITION = 'EnumValueDefinition';
	var INPUT_OBJECT_TYPE_DEFINITION = 'InputObjectTypeDefinition';

	// Type Extensions
	var SCALAR_TYPE_EXTENSION = 'ScalarTypeExtension';
	var OBJECT_TYPE_EXTENSION = 'ObjectTypeExtension';
	var INTERFACE_TYPE_EXTENSION = 'InterfaceTypeExtension';
	var UNION_TYPE_EXTENSION = 'UnionTypeExtension';
	var ENUM_TYPE_EXTENSION = 'EnumTypeExtension';
	var INPUT_OBJECT_TYPE_EXTENSION = 'InputObjectTypeExtension';

	// Directive Definitions
	var DIRECTIVE_DEFINITION = 'DirectiveDefinition';
}

class ASTDefs { }

/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @flow strict
 */

// import type { Source } from './source';
// import type { TokenKindEnum } from './lexer';

/**
 * Contains a range of UTF-8 character offsets and token references that
 * identify the region of the source from which the AST derived.
 */
typedef /* export type */ Location = {
	/**
	 * The character offset at which this Node begins.
	 */
	start:Int /* number */,

	/**
	 * The character offset at which this Node ends.
	 */
	end:Int /* number */,

	/**
	 * The Token at which this Node begins.
	 */
	startToken: Token,

	/**
	 * The Token at which this Node ends.
	 */
	endToken: Token,

	/**
	 * The Source document the AST represents.
	 */
	source: Source,
};

/**
 * Represents a range of characters represented by a lexical token
 * within a Source.
 */
typedef /* export type */ Token = {
	/**
	 * The kind of Token.
	 */
	kind: TokenKindEnum,

	/**
	 * The character offset at which this Node begins.
	 */
	start:Int /* number */,

	/**
	 * The character offset at which this Node ends.
	 */
	end:Int /* number */,

	/**
	 * The 1-indexed line number on which this Token appears.
	 */
	line:Int /* number */,

	/**
	 * The 1-indexed column number at which this Token begins.
	 */
	column:Int /* number */,

	/**
	 * For non-punctuation tokens, represents the interpreted value of the token.
	 */
	?value:Null<String>,

	/**
	 * Tokens exist as nodes in a double-linked-list amongst all tokens
	 * including ignored tokens. <SOF> is always the first node and <EOF>
	 * the last.
	 */
	?prev: Null<Token>,
	?next: Null<Token>,
};

/**
 * The list of all possible AST node types.
 */
typedef /* export type */ ASTNode = BaseNode; /*
	| NameNode
	| DocumentNode
	| OperationDefinitionNode
	| VariableDefinitionNode
	| VariableNode
	| SelectionSetNode
	| FieldNode
	| ArgumentNode
	| FragmentSpreadNode
	| InlineFragmentNode
	| FragmentDefinitionNode
	| IntValueNode
	| FloatValueNode
	| StringValueNode
	| BooleanValueNode
	| NullValueNode
	| EnumValueNode
	| ListValueNode
	| ObjectValueNode
	| ObjectFieldNode
	| DirectiveNode
	| NamedTypeNode
	| ListTypeNode
	| NonNullTypeNode
	| SchemaDefinitionNode
	| OperationTypeDefinitionNode
	| ScalarTypeDefinitionNode
	| ObjectTypeDefinitionNode
	| FieldDefinitionNode
	| InputValueDefinitionNode
	| InterfaceTypeDefinitionNode
	| UnionTypeDefinitionNode
	| EnumTypeDefinitionNode
	| EnumValueDefinitionNode
	| InputObjectTypeDefinitionNode
	| ScalarTypeExtensionNode
	| ObjectTypeExtensionNode
	| InterfaceTypeExtensionNode
	| UnionTypeExtensionNode
	| EnumTypeExtensionNode
	| InputObjectTypeExtensionNode
	| DirectiveDefinitionNode; */

/**
 * Utility type listing all nodes indexed by their kind.
 */
typedef /* export type */ ASTKindToNode = {
	Name: NameNode,
	Document: DocumentNode,
	OperationDefinition: OperationDefinitionNode,
	VariableDefinition: VariableDefinitionNode,
	Variable: VariableNode,
	SelectionSet: SelectionSetNode,
	Field: FieldNode,
	Argument: ArgumentNode,
	FragmentSpread: FragmentSpreadNode,
	InlineFragment: InlineFragmentNode,
	FragmentDefinition: FragmentDefinitionNode,
	IntValue: IntValueNode,
	FloatValue: FloatValueNode,
	StringValue: StringValueNode,
	BooleanValue: BooleanValueNode,
	NullValue: NullValueNode,
	EnumValue: EnumValueNode,
	ListValue: ListValueNode,
	ObjectValue: ObjectValueNode,
	ObjectField: ObjectFieldNode,
	Directive: DirectiveNode,
	NamedType: NamedTypeNode,
	ListType: ListTypeNode,
	NonNullType: NonNullTypeNode,
	SchemaDefinition: SchemaDefinitionNode,
	OperationTypeDefinition: OperationTypeDefinitionNode,
	ScalarTypeDefinition: ScalarTypeDefinitionNode,
	ObjectTypeDefinition: ObjectTypeDefinitionNode,
	FieldDefinition: FieldDefinitionNode,
	InputValueDefinition: InputValueDefinitionNode,
	InterfaceTypeDefinition: InterfaceTypeDefinitionNode,
	UnionTypeDefinition: UnionTypeDefinitionNode,
	EnumTypeDefinition: EnumTypeDefinitionNode,
	EnumValueDefinition: EnumValueDefinitionNode,
	InputObjectTypeDefinition: InputObjectTypeDefinitionNode,
	ScalarTypeExtension: ScalarTypeExtensionNode,
	ObjectTypeExtension: ObjectTypeExtensionNode,
	InterfaceTypeExtension: InterfaceTypeExtensionNode,
	UnionTypeExtension: UnionTypeExtensionNode,
	EnumTypeExtension: EnumTypeExtensionNode,
	InputObjectTypeExtension: InputObjectTypeExtensionNode,
	DirectiveDefinition: DirectiveDefinitionNode,
};

// Name

typedef /* export type */ NameNode = {
	kind: String, // 'Name',
	?loc /* opt */ : Location,
	value:String,
};

// Document

typedef /* export type */ DocumentNode = {
	kind: String, // 'Document',
	?loc /* opt */ : Location,
	definitions: /* $ReadOnlyArray */Array<DefinitionNode>,
};

typedef /* export type */ DefinitionNode = BaseNode; /*
	| ExecutableDefinitionNode
	| TypeSystemDefinitionNode; */ // experimental non-spec addition.

typedef /* export type */ ExecutableDefinitionNode = BaseNode; /*
	| OperationDefinitionNode
	| FragmentDefinitionNode; */

typedef /* export type */ OperationDefinitionNode = {
	kind: String, // 'OperationDefinition',
	?loc /* opt */ : Location,
	operation: OperationTypeNode,
	?name /* opt */ : NameNode,
	?variableDefinitions /* opt */ : /* $ReadOnlyArray */Array<VariableDefinitionNode>,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	selectionSet: SelectionSetNode,
};

//	typedef /* export type */ OperationTypeNode = 'query' | 'mutation' | 'subscription';
@:enum abstract OperationTypeNode(String) to String from String {
	var QUERY = 'query';
	var MUTATION = 'mutation';
	var SUBSCRIPTION = 'subscription'; // experimental non-spec
}


typedef /* export type */ VariableDefinitionNode = {
	kind: String, // 'VariableDefinition',
	?loc /* opt */ : Location,
	variable: VariableNode,
	type: TypeNode,
	?defaultValue /* opt */ : ValueNode,
};

typedef /* export type */ VariableNode = {
	kind: String, // 'Variable',
	?loc /* opt */ : Location,
	name: NameNode,
};

typedef /* export type */ SelectionSetNode = {
	kind: String, // 'SelectionSet',
	?loc /* opt */ : Location,
	selections: /* $ReadOnlyArray */Array<SelectionNode>,
};

typedef /* export type */ SelectionNode = BaseNode; /* FieldNode | FragmentSpreadNode | InlineFragmentNode; */

typedef /* export type */ FieldNode = {
	kind: String, // 'Field',
	?loc /* opt */ : Location,
	?alias /* opt */ : NameNode,
	name: NameNode,
	?arguments /* opt */ : /* $ReadOnlyArray */Array<ArgumentNode>,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?selectionSet /* opt */ : SelectionSetNode,
};

typedef /* export type */ ArgumentNode = {
	kind: String, // 'Argument',
	?loc /* opt */ : Location,
	name: NameNode,
	value: ValueNode,
};

// Fragments

typedef /* export type */ FragmentSpreadNode = {
	kind: String, // 'FragmentSpread',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ InlineFragmentNode = {
	kind: String, // 'InlineFragment',
	?loc /* opt */ : Location,
	?typeCondition /* opt */ : NamedTypeNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	selectionSet: SelectionSetNode,
};

typedef /* export type */ FragmentDefinitionNode = {
	kind: String, // 'FragmentDefinition',
	?loc /* opt */ : Location,
	name: NameNode,
	// Note: fragment variable definitions are experimental and may be changed
	// or removed in the future.
	?variableDefinitions /* opt */ : /* $ReadOnlyArray */Array<VariableDefinitionNode>,
	typeCondition: NamedTypeNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	selectionSet: SelectionSetNode,
};

// Values

typedef /* export type */ ValueNode = BaseNode; /*
	| VariableNode
	| IntValueNode
	| FloatValueNode
	| StringValueNode
	| BooleanValueNode
	| NullValueNode
	| EnumValueNode
	| ListValueNode
	| ObjectValueNode; */

typedef /* export type */ IntValueNode = {
	kind: String, // 'IntValue',
	?loc /* opt */ : Location,
	value:String,
};

typedef /* export type */ FloatValueNode = {
	kind: String, // 'FloatValue',
	?loc /* opt */ : Location,
	value:String,
};

typedef /* export type */ StringValueNode = {
	kind: String, // 'StringValue',
	?loc /* opt */ : Location,
	value:String,
	?block /* opt */ :Bool,
};

typedef /* export type */ BooleanValueNode = {
	kind: String, // 'BooleanValue',
	?loc /* opt */ : Location,
	value:Bool,
};

typedef /* export type */ NullValueNode = {
	kind: String, // 'NullValue',
	?loc /* opt */ : Location,
};

typedef /* export type */ EnumValueNode = {
	kind: String, // 'EnumValue',
	?loc /* opt */ : Location,
	value:String,
};

typedef /* export type */ ListValueNode = {
	kind: String, // 'ListValue',
	?loc /* opt */ : Location,
	values: /* $ReadOnlyArray */Array<ValueNode>,
};

typedef /* export type */ ObjectValueNode = {
	kind: String, // 'ObjectValue',
	?loc /* opt */ : Location,
	fields: /* $ReadOnlyArray */Array<ObjectFieldNode>,
};

typedef /* export type */ ObjectFieldNode = {
	kind: String, // 'ObjectField',
	?loc /* opt */ : Location,
	name: NameNode,
	value: ValueNode,
};

// Directives

typedef /* export type */ DirectiveNode = {
	kind: String, // 'Directive',
	?loc /* opt */ : Location,
	name: NameNode,
	?arguments /* opt */ : /* $ReadOnlyArray */Array<ArgumentNode>,
};

// Type Reference

// typedef /* export type */ TypeNode = BaseNode; /* TypeNode /* NamedTypeNode | ListTypeNode */ | NonNullTypeNode; */

typedef /* export type */ NamedTypeNode = {
	kind: String, // 'NamedType',
	?loc /* opt */ : Location,
	name: NameNode,
};

typedef /* export type */ ListTypeNode = {
	kind: String, // 'ListType',
	?loc /* opt */ : Location,
	type: TypeNode,
};

typedef /* export type */ NonNullTypeNode = {
	kind: String, // 'NonNullType',
	?loc /* opt */ : Location,
	type: TypeNode /* NamedTypeNode | ListTypeNode */,
};

// Type System Definition

typedef /* export type */ TypeSystemDefinitionNode = BaseNode; /*
	| SchemaDefinitionNode
	| TypeDefinitionNode
	| TypeExtensionNode
	| DirectiveDefinitionNode; */

typedef /* export type */ SchemaDefinitionNode = {
	kind: String, // 'SchemaDefinition',
	?loc /* opt */ : Location,
	directives: /* $ReadOnlyArray */Array<DirectiveNode>,
	operationTypes: /* $ReadOnlyArray */Array<OperationTypeDefinitionNode>,
};

typedef /* export type */ OperationTypeDefinitionNode = {
	kind: String, // 'OperationTypeDefinition',
	?loc /* opt */ : Location,
	operation: OperationTypeNode,
	type: NamedTypeNode,
};

// Type Definition

typedef /* export type */ TypeDefinitionNode = BaseNode; /*
	| ScalarTypeDefinitionNode
	| ObjectTypeDefinitionNode
	| InterfaceTypeDefinitionNode
	| UnionTypeDefinitionNode
	| EnumTypeDefinitionNode
	| InputObjectTypeDefinitionNode; */

typedef /* export type */ ScalarTypeDefinitionNode = {
	kind: String, // 'ScalarTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ ObjectTypeDefinitionNode = {
	kind: String, // 'ObjectTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?interfaces /* opt */ : /* $ReadOnlyArray */Array<NamedTypeNode>,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<FieldDefinitionNode>,
};

typedef /* export type */ FieldDefinitionNode = {
	kind: String, // 'FieldDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?arguments /* opt */ : /* $ReadOnlyArray */Array<InputValueDefinitionNode>,
	type: TypeNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ InputValueDefinitionNode = {
	kind: String, // 'InputValueDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	type: TypeNode,
	?defaultValue /* opt */ : ValueNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ InterfaceTypeDefinitionNode = {
	kind: String, // 'InterfaceTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<FieldDefinitionNode>,
};

typedef /* export type */ UnionTypeDefinitionNode = {
	kind: String, // 'UnionTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?types /* opt */ : /* $ReadOnlyArray */Array<NamedTypeNode>,
};

typedef /* export type */ EnumTypeDefinitionNode = {
	kind: String, // 'EnumTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?values /* opt */ : /* $ReadOnlyArray */Array<EnumValueDefinitionNode>,
};

typedef /* export type */ EnumValueDefinitionNode = {
	kind: String, // 'EnumValueDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ InputObjectTypeDefinitionNode = {
	kind: String, // 'InputObjectTypeDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<InputValueDefinitionNode>,
};

// Type Extensions

typedef /* export type */ TypeExtensionNode = BaseNode; /*
	| ScalarTypeExtensionNode
	| ObjectTypeExtensionNode
	| InterfaceTypeExtensionNode
	| UnionTypeExtensionNode
	| EnumTypeExtensionNode
	| InputObjectTypeExtensionNode; */

typedef /* export type */ ScalarTypeExtensionNode = {
	kind: String, // 'ScalarTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
};

typedef /* export type */ ObjectTypeExtensionNode = {
	kind: String, // 'ObjectTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?interfaces /* opt */ : /* $ReadOnlyArray */Array<NamedTypeNode>,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<FieldDefinitionNode>,
};

typedef /* export type */ InterfaceTypeExtensionNode = {
	kind: String, // 'InterfaceTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<FieldDefinitionNode>,
};

typedef /* export type */ UnionTypeExtensionNode = {
	kind: String, // 'UnionTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?types /* opt */ : /* $ReadOnlyArray */Array<NamedTypeNode>,
};

typedef /* export type */ EnumTypeExtensionNode = {
	kind: String, // 'EnumTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?values /* opt */ : /* $ReadOnlyArray */Array<EnumValueDefinitionNode>,
};

typedef /* export type */ InputObjectTypeExtensionNode = {
	kind: String, // 'InputObjectTypeExtension',
	?loc /* opt */ : Location,
	name: NameNode,
	?directives /* opt */ : /* $ReadOnlyArray */Array<DirectiveNode>,
	?fields /* opt */ : /* $ReadOnlyArray */Array<InputValueDefinitionNode>,
};

// Directive Definitions

typedef /* export type */ DirectiveDefinitionNode = {
	kind: String, // 'DirectiveDefinition',
	?loc /* opt */ : Location,
	?description /* opt */ : StringValueNode,
	name: NameNode,
	?arguments /* opt */ : /* $ReadOnlyArray */Array<InputValueDefinitionNode>,
	locations: /* $ReadOnlyArray */Array<NameNode>,
};

