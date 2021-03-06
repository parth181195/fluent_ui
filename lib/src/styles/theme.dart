import 'package:fluent_ui/fluent_ui.dart';

class Theme extends InheritedWidget {
  const Theme({Key key, @required this.data, @required this.child})
      : super(key: key, child: child);

  final Style data;
  final Widget child;

  static Style of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Theme>()
        ?.data
        ?.build(context);
  }

  @override
  bool updateShouldNotify(covariant Theme oldWidget) => oldWidget.data != data;
}

extension themeContext on BuildContext {
  Style get theme => Theme.of(this);
}

class Style {
  final Color accentColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color disabledColor;

  final Duration animationDuration;
  final Curve animationCurve;

  final Brightness brightness;

  final Color scaffoldBackgroundColor;
  final Color bottomNavigationBackgroundColor;

  final NavigationPanelStyle bottomNavigationStyle;
  final CardStyle cardStyle;
  final CheckboxStyle checkboxStyle;
  final DialogStyle dialogStyle;
  final DividerStyle dividerStyle;
  final IconStyle iconStyle;
  final ListCellStyle listCellStyle;
  final PivotItemStyle pivotItemStyle;
  final RadioButtonStyle radioButtonStyle;
  final SliderStyle sliderStyle;
  final SnackbarStyle snackbarStyle;
  final SplitButtonStyle splitButtonStyle;
  final ToggleButtonStyle toggleButtonStyle;
  final ToggleSwitchStyle toggleSwitchStyle;
  final TooltipStyle tooltipStyle;

  final ButtonStyle buttonStyle;
  final IconButtonStyle iconButtonStyle;

  const Style({
    this.accentColor,
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
    this.animationDuration,
    this.animationCurve,
    this.brightness,
    this.scaffoldBackgroundColor,
    this.bottomNavigationBackgroundColor,
    this.buttonStyle,
    this.cardStyle,
    this.iconButtonStyle,
    this.checkboxStyle,
    this.toggleSwitchStyle,
    this.pivotItemStyle,
    this.iconStyle,
    this.splitButtonStyle,
    this.listCellStyle,
    this.dialogStyle,
    this.tooltipStyle,
    this.dividerStyle,
    this.snackbarStyle,
    this.bottomNavigationStyle,
    this.radioButtonStyle,
    this.toggleButtonStyle,
    this.sliderStyle,
  });

  Style build(BuildContext context) {
    final defaultStyle = Style(
      animationDuration: Duration(milliseconds: 200),
      animationCurve: Curves.linear,
      brightness: brightness ?? Brightness.light,
      accentColor: accentColor ?? Colors.blue,
      activeColor: activeColor ?? Colors.white,
      inactiveColor: inactiveColor ?? Colors.black,
      disabledColor: Colors.grey[100].withOpacity(0.6),
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? Colors.grey[160],
    );
    return defaultStyle.copyWith(Style(
      cardStyle: CardStyle.defaultTheme(brightness).copyWith(cardStyle),
      buttonStyle: ButtonStyle.defaultTheme(defaultStyle).copyWith(buttonStyle),
      iconButtonStyle:
          IconButtonStyle.defaultTheme(defaultStyle).copyWith(iconButtonStyle),
      checkboxStyle:
          CheckboxStyle.defaultTheme(defaultStyle).copyWith(checkboxStyle),
      toggleButtonStyle: ToggleButtonStyle.defaultTheme(defaultStyle)
          .copyWith(toggleButtonStyle),
      toggleSwitchStyle: ToggleSwitchStyle.defaultTheme(defaultStyle)
          .copyWith(toggleSwitchStyle),
      pivotItemStyle:
          PivotItemStyle.defaultTheme(brightness).copyWith(pivotItemStyle),
      iconStyle: IconStyle.defaultTheme(brightness).copyWith(iconStyle),
      splitButtonStyle: SplitButtonStyle.defaultTheme(defaultStyle)
          .copyWith(splitButtonStyle),
      listCellStyle:
          ListCellStyle.defaultTheme(brightness).copyWith(listCellStyle),
      dialogStyle: DialogStyle.defaultTheme(brightness).copyWith(dialogStyle),
      tooltipStyle:
          TooltipStyle.defaultTheme(brightness).copyWith(tooltipStyle),
      dividerStyle:
          DividerStyle.defaultTheme(brightness).copyWith(dividerStyle),
      snackbarStyle:
          SnackbarStyle.defaultTheme(brightness).copyWith(snackbarStyle),
      bottomNavigationStyle: NavigationPanelStyle.defaultTheme(brightness)
          .copyWith(bottomNavigationStyle),
      radioButtonStyle: RadioButtonStyle.defaultTheme(defaultStyle)
          .copyWith(radioButtonStyle),
      sliderStyle: SliderStyle.defaultTheme(defaultStyle).copyWith(sliderStyle),
    ));
  }

  static Style fallback(BuildContext context, [Brightness brightness]) {
    return Style(brightness: brightness).build(context);
  }

  Style copyWith(Style other) {
    if (other == null) return this;
    return Style(
      accentColor: other?.accentColor ?? accentColor,
      activeColor: other?.activeColor ?? activeColor,
      bottomNavigationBackgroundColor: other?.bottomNavigationBackgroundColor ??
          bottomNavigationBackgroundColor,
      bottomNavigationStyle:
          other?.bottomNavigationStyle ?? bottomNavigationStyle,
      brightness: other?.brightness ?? brightness,
      buttonStyle: other?.buttonStyle ?? buttonStyle,
      cardStyle: other?.cardStyle ?? cardStyle,
      checkboxStyle: other?.checkboxStyle ?? checkboxStyle,
      dialogStyle: other?.dialogStyle ?? dialogStyle,
      dividerStyle: other?.dividerStyle ?? dividerStyle,
      iconButtonStyle: other?.iconButtonStyle ?? iconButtonStyle,
      iconStyle: other?.iconStyle ?? iconStyle,
      inactiveColor: other?.inactiveColor ?? inactiveColor,
      listCellStyle: other?.listCellStyle ?? listCellStyle,
      pivotItemStyle: other?.pivotItemStyle ?? pivotItemStyle,
      radioButtonStyle: other?.radioButtonStyle ?? radioButtonStyle,
      scaffoldBackgroundColor:
          other?.scaffoldBackgroundColor ?? scaffoldBackgroundColor,
      snackbarStyle: other?.snackbarStyle ?? snackbarStyle,
      splitButtonStyle: other?.splitButtonStyle ?? splitButtonStyle,
      toggleButtonStyle: other?.toggleButtonStyle ?? toggleButtonStyle,
      toggleSwitchStyle: other?.toggleSwitchStyle ?? toggleSwitchStyle,
      tooltipStyle: other?.tooltipStyle ?? tooltipStyle,
      sliderStyle: other?.sliderStyle ?? sliderStyle,
      animationCurve: other?.animationCurve ?? animationCurve,
      animationDuration: other?.animationDuration ?? animationDuration,
      disabledColor: other?.disabledColor ?? disabledColor,
    );
  }
}
