import 'dart:ui';

import 'package:bonfire/util/objects/animated_object.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class AnimatedObjectOnce extends AnimatedObject {
  Rect position;
  final VoidCallback onFinish;
  final VoidCallback onStartAnimation;
  final bool onlyUpdate;
  bool _notifyStart = false;

  AnimatedObjectOnce({
    this.position,
    FlameAnimation.Animation animation,
    this.onFinish,
    this.onStartAnimation,
    this.onlyUpdate = false,
  }) {
    this.animation = animation;
    positionInWorld = position;
  }

  @override
  void render(Canvas canvas) {
    if (onlyUpdate) return;
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (animation != null && !destroy()) {
      if (animation.currentIndex == 1 && !_notifyStart) {
        _notifyStart = true;
        if (onStartAnimation != null) onStartAnimation();
      }
      if (animation.isLastFrame) {
        if (onFinish != null) onFinish();
        remove();
      }
    }
  }
}
