package apollo.util;

#if macro
import haxe.macro.ComplexTypeTools;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;
import haxe.macro.Type;

class MacroUtils {
	public static function exprToString(expr:Expr):String {
		return switch (expr.expr) {
			case EConst(CString(str)): str;
			default: ExprTools.toString(expr);
		};
	}

	public static function hasField(fields:Array<Field>, name:String):Bool {
		for (f in fields) if (f.name == name) return true;
		return false;
	}

	public static function registerClassTypeDependency(
		inClass:ClassType,
		dependency:String
	):Void {
		var module = extractClassPath(extractTypeFromClassType(inClass));
		Context.registerModuleDependency(module, dependency);
	}

	public static function extractClassPath(
		?t:Type,
		?ct:ComplexType
	):Null<String> {
		if (t == null && ct == null) return null;
		if (t == null) t = ComplexTypeTools.toType(ct);

		return switch(t) {
			case TType(_.get() => def, []): def.name.substring(6, def.name.length - 1);
			case TInst(_ => ref, []): ref.toString();
			default: null;
		};
	}

	public static function extractTypeFromClassType(cls:ClassType):Null<Type> {
		return tryGetType({pack: cls.pack, name: cls.name});
	}

	public static function tryGetType(path:TypePath):Null<Type> {
		return try {
			Context.resolveType(TPath(path), Context.currentPos());
		} catch (e:Dynamic) {
			var e = Std.string(e);

			if (
				!StringTools.startsWith(e, 'Type not found')
				&& !StringTools.startsWith(e, 'Invalid package')
				&& !StringTools.endsWith(e, ' does not define type ${path.name}')
			) throw e;

			null;
		};
	}
}
#end
