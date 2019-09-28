import 'package:client/pages/sering/question_widgets/quest_widget.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'dart:math';
import 'package:client/pages/sering/question_widgets/one_of_two_question.dart';

Size bigCardSize;
final Alignment initialCardAlignment = Alignment(0.0, 0.0);

enum SlideMainAxis {
  x, y
}

enum SlideDirection {
  left,
  right,
  up,
  down
}

class DragHandler extends StatefulWidget {
  final QuestWidget card;
  final bool isDraggable;
  final SlideDirection slideTo;
  final Function(double distance) onSlideUpdate;
  final Function(SlideDirection direction) onSlideComplete;
  final double screenWidth;
  final double screenHeight;

  DragHandler({
    Key key,
    this.card,
    this.isDraggable = true,
    this.slideTo,
    this.onSlideUpdate,
    this.onSlideComplete,
    this.screenWidth,
    this.screenHeight,
    BuildContext context
  }) {
    bigCardSize = new Size(MediaQuery
        .of(context)
        .size
        .width * 0.9, MediaQuery
        .of(context)
        .size
        .height * 0.5);
  }

  @override
  _DragHandlerState createState() => new _DragHandlerState();
}

class _DragHandlerState extends State<DragHandler>
    with TickerProviderStateMixin {
  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideBackStart;
  // what way we chosen
  SlideDirection slideOutDirection;

  AnimationController slideBackAnimation;
  Tween<Offset> slideOutTween;
  AnimationController slideOutAnimation;

  AnimationController _animationController;
  Alignment cardAlignment = new Alignment(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    slideBackAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )
      ..addListener(() =>
          setState(() {
            cardOffset = Offset.lerp(slideBackStart, const Offset(0.0, 0.0),
                Curves.elasticOut.transform(slideBackAnimation.value));

            if (null != widget.onSlideUpdate) {
              widget.onSlideUpdate(cardOffset.distance);
            }
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideBackStart = null;
            dragPosition = null;
          });
        }
      });

    slideOutAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..addListener(() =>
          setState(() {
            cardOffset = slideOutTween.evaluate(slideOutAnimation);

            if (null != widget.onSlideUpdate) {
              widget.onSlideUpdate(cardOffset.distance);
            }
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            dragPosition = null;
            slideOutTween = null;

            if (widget.onSlideComplete != null) {
              widget.onSlideComplete(slideOutDirection);
            }
          });
        }
      });
  }

  @override
  void didUpdateWidget(DragHandler oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.card.key != oldWidget.card.key) {
      cardOffset = const Offset(0.0, 0.0);
    }

    if (oldWidget.slideTo == null && widget.slideTo != null) {
      switch (widget.slideTo) {
        case SlideDirection.left:
          _slideLeft();
          break;
        case SlideDirection.right:
          _slideRight();
          break;
        case SlideDirection.up:
          _slideUp();
          break;
        case SlideDirection.down:
          _slideDown();
          break;
      }
    }
  }

  @override
  void dispose() {
    slideBackAnimation.dispose();
    slideOutAnimation.dispose();
    super.dispose();
  }

  Offset _chooseRandomDragStart() {
    final cardContex = context;
    final cardTopLeft = (cardContex.findRenderObject() as RenderBox)
        .localToGlobal(const Offset(0.0, 0.0));
    final dragStartY =
        widget.screenHeight * (new Random().nextDouble() < 0.5 ? 0.25 : 0.75) +
            cardTopLeft.dy;

    return Offset(widget.screenWidth / 2 + cardTopLeft.dx, dragStartY);
  }

  void _slideLeft() {
    // final screenWidth = context.size.width;
    dragStart = _chooseRandomDragStart();
    slideOutTween = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(-2 * widget.screenWidth, 0.0),
    );

    slideOutAnimation.forward(from: 0.0);
  }

  void _slideRight() {
    dragStart = _chooseRandomDragStart();
    slideOutTween = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(2 * widget.screenWidth, 0.0),
    );

    slideOutAnimation.forward(from: 0.0);
  }

  void _slideUp() {
    // final screenHeight = context.size.height;
    dragStart = _chooseRandomDragStart();
    slideOutTween = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(0.0, -2 * widget.screenHeight),
    );

    slideOutAnimation.forward(from: 0.0);
  }


  void _slideDown() {
    // final screenHeight = context.size.height;
    dragStart = _chooseRandomDragStart();
    slideOutTween = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(0.0, 2 * widget.screenHeight),
    );

    slideOutAnimation.forward(from: 0.0);
  }

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    if (slideBackAnimation.isAnimating) {
      slideBackAnimation.stop(canceled: true);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = Offset(dragPosition.dx - dragStart.dx, dragPosition.dy - dragStart.dy);

      if (null != widget.onSlideUpdate) {
        widget.onSlideUpdate(cardOffset.distance);
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final dragVector = cardOffset / cardOffset.distance;
    final isInLeftRegion = (cardOffset.dx / context.size.width) < -0.45;
    final isInRightRegion = (cardOffset.dx / context.size.width) > 0.45;
    final isInTopRegion = (cardOffset.dy / context.size.height) < -0.40;
    final isInBottomRegion = (cardOffset.dy / context.size.height) > 0.40;

    // todo add delay for card method call
    setState(() {
      if (isInLeftRegion || isInRightRegion) {
        slideOutTween = Tween(
            begin: cardOffset, end: dragVector * (4 * context.size.width));

        slideOutAnimation.forward(from: 0.0);

        if(isInLeftRegion) {
          setState(() {
            slideOutDirection = SlideDirection.left;
            print('left');
            new Future.delayed(const Duration(milliseconds: 150), () {
              widget.card.forward();
            });
        });
        } else setState(() {
          slideOutDirection =  SlideDirection.right;
          print('right');
          new Future.delayed(const Duration(milliseconds: 150), () {
            widget.card.back();
          });
        });{
        }
      } else if (isInTopRegion || isInBottomRegion) {
        slideOutTween = Tween(
            begin: cardOffset, end: dragVector * (4 * context.size.height));
        slideOutAnimation.forward(from: 0.0);

        if(isInBottomRegion) {
          setState(() {
            slideOutDirection = SlideDirection.down;
            print('down');
            new Future.delayed(const Duration(milliseconds: 150), () {
              widget.card.skip();
            });
          });

        } else setState(() {
          slideOutDirection = SlideDirection.up;
          print('up');
          widget.card.done();
        });
      } else {
        // a nu davai ee obratno
        slideBackStart = cardOffset;
        slideBackAnimation.forward(from: 0.0);
      }

      new Future.delayed(const Duration(milliseconds: 150), () {
        slideBackStart = cardOffset;
        slideBackAnimation.forward(from: 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(child: Transform(
      transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
      child: new Container(
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: widget.card,
        ),
      ),
    ),
    );
  }
}