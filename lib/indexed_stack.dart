import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MaterialIndexedStack extends IndexedStack {
  MaterialIndexedStack({
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit sizing = StackFit.loose,
    int? index = 0,
    List<Widget> children = const <Widget>[],
    Key? key,
  }) : super(
          alignment: alignment,
          textDirection: textDirection,
          sizing: sizing,
          index: index,
          children: children,
          key: key,
        );

  bool _debugCheckHasDirectionality(BuildContext context) {
    if (alignment is AlignmentDirectional && textDirection == null) {
      assert(debugCheckHasDirectionality(
        context,
        why: "to resolve the 'alignment' argument",
        hint: alignment == AlignmentDirectional.topStart
            ? "The default value for 'alignment' is AlignmentDirectional.topStart, which requires a text direction."
            : null,
        alternative:
            "Instead of providing a Directionality widget, another solution would be passing a non-directional 'alignment', or an explicit 'textDirection', to the $runtimeType.",
      ));
    }
    return true;
  }

  @override
  RenderIndexedStack createRenderObject(BuildContext context) {
    assert(_debugCheckHasDirectionality(context));
    return RenderIndexedStack(
      index: index,
      alignment: alignment,
      textDirection: textDirection ?? Directionality.maybeOf(context),
    );
  }
}
