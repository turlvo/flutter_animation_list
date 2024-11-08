library animation_list;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AnimationDirection { vertical, horizontal, both }

class AnimationList extends StatefulWidget {
  // Native List only parameters
  final Key? key;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget>? children;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final Tween<double>? opacityRange;
  final AnimationDirection animationDirection;

  // Animation List only parameters
  final int duration;
  final double reBounceDepth;

  AnimationList({
    this.key,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.children,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.duration = 1300,
    this.reBounceDepth = 10,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.opacityRange,
    this.animationDirection = AnimationDirection.vertical,
  });

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bounceReturnAnimation,
      bounceForwardAnimation,
      opacityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);

    bounceForwardAnimation =
        Tween<double>(begin: 0.0, end: widget.reBounceDepth).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.7, curve: Curves.easeInOut),
      ),
    );
    bounceReturnAnimation =
        Tween<double>(begin: 0.0, end: widget.reBounceDepth).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1, curve: Curves.easeInOut),
      ),
    );
    opacityAnimation =
        (widget.opacityRange ?? Tween<double>(begin: 0.3, end: 1)).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1, curve: Curves.easeInOut),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ListView.builder(
          key: widget.key,
          controller: widget.controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          semanticChildCount: widget.semanticChildCount,
          dragStartBehavior: widget.dragStartBehavior,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          restorationId: widget.restorationId,
          clipBehavior: widget.clipBehavior,
          itemCount: widget.children!.length,
          itemBuilder: (BuildContext context, int index) {
            final Animation<double> animation = Tween<double>(
              begin: widget.animationDirection == AnimationDirection.vertical
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.width,
              end: 0,
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                    0.0 + (index * 0.1) >= 0.5 ? 0.5 : index * 0.1, 0.5,
                    curve: Curves.easeInOut),
              ),
            );

            return Opacity(
              opacity: opacityAnimation.value,
              child: Container(
                margin: EdgeInsets.only(
                  top: widget.animationDirection ==
                              AnimationDirection.vertical ||
                          widget.animationDirection == AnimationDirection.both
                      ? animation.value +
                          bounceForwardAnimation.value -
                          bounceReturnAnimation.value
                      : 0,
                  left: widget.animationDirection ==
                              AnimationDirection.horizontal ||
                          widget.animationDirection == AnimationDirection.both
                      ? animation.value +
                          bounceForwardAnimation.value -
                          bounceReturnAnimation.value
                      : 0,
                ),
                child: widget.children![index],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
