Patterns
========

Patterns is just a collection (or will be) of procedural pattern generators
that share a common abstract base class. The base class GPattern allows extending
classes to hide most of their non-generic content internally, and share a common 
constructor signature.

Unique parameters are initialized and set after pattern classes are constructed.

Patterns was written in Processing v2.0b8

GPattern Overview
-----------------

### Initialization ###
Extending classes put any initialization code within an overridden `config`
method. `config` is called by the GPattern constructor.

### Config. Options ###
Aside from initialization code, `config` is where auto-wrap and per-point should be set.

If per-point rendering is enabled, then each time `render()` is called `update()` is called with 
the current and previously generated values from the `nextPos()` method.

If auto-wrap is enabled and per-point rendering is enabled, then the value returnd by `nextPos()` is
automatically wrapped to fall within the bounds of the application window. If auto-wrap isn't used,
or per-point rendering isn't used, then the same functionality can be accessed by calling `wrapPoint(point)` on some PVector.

If per-point rendering is disabled, then the 'update(null,null)' is called within each `render()` call.

Per-point and auto-wrap are set by calling 'setMode(boolean perPoint, boolean autoWrap)'.

###Generalization###

GPattern has two overridable methods that can allow for some messy yet functional generic parameter passing.
Using these methods, you can avoid the errors that would result from calling methods defined in extending classes
on generic GPattern objects.

/*Standard Parameter Methods:*/
* 'setParam(String name, Object value)'
* 'Object getParam(String name)'

#### setParam ####

As the name implies, `setParam` is used to set the value of a parameter. For example, the following 
code would allow a local float `scale` to be passed:

	public void setParam(String name, Object value){
		if(name=="scale"){
			this.scale=(Float)value;
		}
	}

If not overridden, the setParam method will do nothing. Since it isn't defined in GPattern as abstract, 
you are not required to implement it.

#### getParam ####

Similarly, `getParam` allows a parameter to be retrieved from a class. The counter-part to the
setParam example would be:

	public Object getParam(String name){
		if(name=="scale"){
			return (Object)this.scale;
		}
		return null;
	}

`getParam` is abstract, so like `setParam`, it is not required to be overridden, and will return null by default.
