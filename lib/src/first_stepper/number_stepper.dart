import 'package:flutter/material.dart';

import 'core/base_stepper.dart';

class NumberStepper extends StatelessWidget {
  /// Each number defines a step. Hence, total count of numbers determines the total number of steps.
  final List<int>? numbers;

  /// Subtitle widget to appear under each children. Make sure it's the same size as the children.
  final List<Widget>? subtitles;

  /// Whether to enable or disable the next and previous buttons.
  final bool enableNextPreviousButtons;

  /// Whether to allow tapping a step to move to that step or not.
  final bool enableStepTapping;

  /// Icon to be used for the previous button.
  final Icon? previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon? nextButtonIcon;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached? onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The style applied to numbers except the `fontSize` which is calculated automatically.
  final TextStyle numberStyle;

  /// The color of the step when it is not reached.
  final Color? stepColor;

  /// The amount of padding inside a step.
  final double stepPadding;

  /// Padding for dotted lines
  final Widget? spacing;

  /// The color of a step when it is reached.
  final Color? activeStepColor;

  /// Color of this indicator if it was a previous step.
  final Color? previousActiveColor;

  /// The border color of a step when it is reached.
  final Color? activeStepBorderColor;

  /// The border width of the active step.
  final double activeStepBorderWidth;

  /// Determines how far away the border should be drawn from the step when it is reached.
  final double activeStepBorderPadding;

  /// The color of the line that separates the steps.
  final Color? lineColor;

  /// Color of activated dotted line.
  final Color? activeLineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Whether the scrolling is disabled or not.
  final bool scrollingDisabled;

  /// The currently active step.
  final int activeStep;

  /// Specifies the alignment of the NumberStepper.
  final AlignmentGeometry alignment;

  /// Creates a NumberStepper widget.
  NumberStepper({
    this.subtitles,
    this.numbers,
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.numberStyle = const TextStyle(color: Colors.black),
    this.stepColor,
    this.stepPadding = 0.0,
    this.spacing,
    this.activeStepColor,
    this.previousActiveColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 1.0,
    this.lineColor,
    this.activeLineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return BaseStepper(
      children: _numbersWrappedInText(),
      subtitles: subtitles,
      nextPreviousButtonsDisabled: enableNextPreviousButtons,
      stepTappingDisabled: enableStepTapping,
      previousButtonIcon: previousButtonIcon,
      nextButtonIcon: nextButtonIcon,
      onStepReached: onStepReached,
      direction: direction,
      stepColor: stepColor,
      activeStepColor: activeStepColor,
      previousActiveColor: previousActiveColor,
      activeStepBorderColor: activeStepBorderColor,
      activeStepBorderWidth: activeStepBorderWidth,
      lineColor: lineColor,
      lineLength: lineLength,
      lineDotRadius: lineDotRadius,
      stepRadius: stepRadius,
      stepReachedAnimationEffect: stepReachedAnimationEffect,
      stepReachedAnimationDuration: stepReachedAnimationDuration,
      steppingEnabled: steppingEnabled,
      margin: activeStepBorderPadding,
      padding: stepPadding,
      spacing: spacing,
      scrollingDisabled: scrollingDisabled,
      activeStep: activeStep,
      alignment: alignment,
    );
  }

  /// Wraps the integer numbers in Text widget. User style is also applied except the `fontSize` which is calculated automatically.
  List<Widget> _numbersWrappedInText() {
    return List.generate(numbers!.length, (index) {
      return FittedBox(
        child: Text(
          '${numbers![index]}',
          style: numberStyle.copyWith(fontSize: stepRadius / 1.1),
        ),
      );
    });
  }
}
