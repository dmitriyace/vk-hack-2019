import 'package:flutter/material.dart';
import 'card.dart';
import 'dart:math';

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
  final Widget card;
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
  // for finding out where user slides from the start (see function where this var is used)
  SlideMainAxis slideAxis = SlideMainAxis.x;

  // to get the starting position
  Offset _containerInitialPosition = Offset(0, 0);
  GlobalKey _containerKey = GlobalKey();

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

    WidgetsBinding.instance.addPostFrameCallback(_getInitialPosition);
  }

  void _getInitialPosition(_) {
    final RenderBox containerRenderBox =
    _containerKey.currentContext.findRenderObject();
    final containerPosition = containerRenderBox.localToGlobal(Offset(0.0, 0.0));

    print(containerPosition);
    setState(() {
      _containerInitialPosition = containerPosition;
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

//    print('x ${dragStart.dx}, y ${dragStart.dy}');

    var rofl1 = ((dragStart.dx / context.size.width)).abs();
    var rofl2 = ((dragStart.dy / context.size.height)).abs();
    print('x ${rofl1}');
    print('y ${rofl2}');
    print('x > y : ${rofl1 > rofl2}');

    if(rofl1 > rofl2) {
      slideAxis = SlideMainAxis.x;
    } else {
      slideAxis = SlideMainAxis.y;
    }

    if (slideBackAnimation.isAnimating) {
      slideBackAnimation.stop(canceled: true);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      switch(slideAxis) {
        case SlideMainAxis.x:
          print('x');
          cardOffset = Offset(dragPosition.dx - dragStart.dx, 0.0);
          break;
        case SlideMainAxis.y:
          print('y');
          cardOffset = Offset(0.0, dragPosition.dy - dragStart.dy);
          break;
      }

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

    setState(() {
      if (isInLeftRegion || isInRightRegion) {
        slideOutTween = Tween(
            begin: cardOffset, end: dragVector * (4 * context.size.width));

        slideOutAnimation.forward(from: 0.0);

        slideOutDirection =
        isInLeftRegion ? SlideDirection.left : SlideDirection.right;
      } else if (isInTopRegion || isInBottomRegion) {
        slideOutTween = Tween(
            begin: cardOffset, end: dragVector * (4 * context.size.height));
        slideOutAnimation.forward(from: 0.0);

        slideOutDirection = isInBottomRegion ? SlideDirection.down : SlideDirection.up;
      } else {
        // a nu davai ee obratno
        slideBackStart = cardOffset;
        slideBackAnimation.forward(from: 0.0);
      }
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