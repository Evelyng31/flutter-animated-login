part of '../../animated_login.dart';

<<<<<<< HEAD
class _LogoAndTexts extends StatelessWidget {
  /// Column of logo and welcome texts.
  const _LogoAndTexts({required this.logo, Key? key}) : super(key: key);

  /// Logo widget.
  final Widget? logo;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          if (logo != null) _logo(context),
          _title(context),
          SizedBox(
              height: context.read<LoginTheme>().titleDescriptionSpace ??
                  DynamicSize(context).height *
                      (context.read<LoginTheme>().isLandscape ? 6 : 1.8)),
          _description(context),
        ],
      );

  Widget _title(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return BaseText(
      context.select<Auth, bool>((Auth auth) => auth.isReverse)
          ? loginTexts.welcomeBack
          : loginTexts.welcome,
      style: TextStyles(context)
          .titleStyle(color: Colors.white)
          .merge(context.read<LoginTheme>().welcomeTitleStyle),
    );
  }

  Widget _description(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return NotFittedText(
      context.select<Auth, bool>((Auth auth) => auth.isReverse)
          ? loginTexts.welcomeBackDescription
          : loginTexts.welcomeDescription,
      style: TextStyles(context)
          .bodyStyle()
          .merge(context.read<LoginTheme>().welcomeDescriptionStyle),
    );
  }

  Widget _logo(BuildContext context) {
=======
class _Title extends StatelessWidget {
  /// Column of logo and welcome texts.
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    return Padding(
      padding: loginTheme.titlePadding ??
          EdgeInsets.symmetric(vertical: DynamicSize(context).height * .8),
      child: BaseText(
        context.select<Auth, bool>((Auth auth) => auth.isReverse)
            ? loginTexts.welcomeBack
            : loginTexts.welcome,
        style: TextStyles(context)
            .titleStyle(color: Colors.white)
            .merge(context.read<LoginTheme>().welcomeTitleStyle),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    return Padding(
      padding: loginTheme.descriptionPadding ??
          EdgeInsets.symmetric(
              vertical: DynamicSize(context).height *
                  (loginTheme.isLandscape ? 3 : 2)),
      child: NotFittedText(
        context.select<Auth, bool>((Auth auth) => auth.isReverse)
            ? loginTexts.welcomeBackDescription
            : loginTexts.welcomeDescription,
        style: TextStyles(context)
            .bodyStyle()
            .merge(context.read<LoginTheme>().welcomeDescriptionStyle),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.logo, Key? key}) : super(key: key);
  final Widget? logo;

  @override
  Widget build(BuildContext context) {
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
    final DynamicSize dynamicSize = DynamicSize(context);
    final LoginTheme loginTheme = context.read<LoginTheme>();
    return Container(
      constraints: BoxConstraints.tight(loginTheme.logoSize ??
          Size.fromHeight(
<<<<<<< HEAD
              dynamicSize.responsiveSize * (loginTheme.isLandscape ? 26 : 30))),
      padding: loginTheme.logoPadding ??
          EdgeInsets.only(
              bottom: dynamicSize.height * (loginTheme.isLandscape ? 4 : 2)),
=======
              dynamicSize.responsiveSize * (loginTheme.isLandscape ? 30 : 25))),
      padding: loginTheme.logoPadding ??
          EdgeInsets.symmetric(
              vertical:
                  dynamicSize.height * (loginTheme.isLandscape ? 2.8 : .8)),
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
      child: logo,
    );
  }
}

class _ChangeActionButton extends StatelessWidget {
  /// Change action button in the welcome part.
  /// * Switches between the auth modes (login/signup).
  const _ChangeActionButton({required this.animate, Key? key})
      : super(key: key);

  /// Animate callback
  final AsyncCallback animate;

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final LoginTheme loginTheme = context.read<LoginTheme>();
    return RoundedButton(
      buttonText: context.select<Auth, bool>((Auth auth) => auth.isReverse)
          ? loginTexts.signUp
          : loginTexts.login,
      onPressed: animate,
      borderColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(.8),
      buttonStyle: loginTheme.changeActionButtonStyle,
    );
  }
}

class _ChangeActionTitle extends StatelessWidget {
  /// Change action title in the welcome part.
  // ignore: prefer_const_constructors_in_immutables
  _ChangeActionTitle({this.showButtonText = false, this.animate, Key? key})
      : super(key: key);

  /// Determines whether to show button text or not
  final bool showButtonText;

  /// Animate callback
  final VoidCallback? animate;

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
<<<<<<< HEAD
    return showButtonText
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _changeActionTitle(context, loginTexts),
              _changeActionGesture(context, animate)
            ],
          )
        : _changeActionTitle(context, loginTexts);
=======
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    return Padding(
      padding: loginTheme.changeActionPadding ??
          (loginTheme.isLandscape
              ? EdgeInsets.symmetric(vertical: DynamicSize(context).height * 2)
              : EdgeInsets.only(top: DynamicSize(context).height * 2)),
      child: showButtonText
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _changeActionTitle(context, loginTexts),
                _changeActionGesture(context, animate)
              ],
            )
          : _changeActionTitle(context, loginTexts),
    );
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  }

  Widget _changeActionTitle(BuildContext context, LoginTexts loginTexts) =>
      BaseText(
        context.select<Auth, bool>((Auth auth) => auth.isReverse)
            ? loginTexts.notHaveAnAccount
            : loginTexts.alreadyHaveAnAccount,
        style: TextStyles(context)
            .subtitleTextStyle()
            .merge(context.read<LoginTheme>().changeActionTextStyle),
      );

  Widget _changeActionGesture(BuildContext context, VoidCallback? animate) =>
      Padding(
        padding: DynamicSize(context).lowLeftPadding,
        child: InkWell(
          onTap: animate,
          child: _changeActionText(context),
        ),
      );

  Widget _changeActionText(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return BaseText(
      context.select<Auth, bool>((Auth auth) => auth.isReverse)
          ? loginTexts.signUp
          : loginTexts.login,
      style: TextStyles(context)
          .subtitleTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          )
          .merge(context.read<LoginTheme>().changeActionTextStyle),
    );
  }
}

class _ChangeLanguage extends StatefulWidget {
  /// Change language widget on top of the welcome part.
  const _ChangeLanguage({
    required this.chooseLanguageCallback,
    required this.colorTween,
    this.languageOptions = const <LanguageOption>[],
    this.onPressed,
    this.defaultOnPressed,
    Key? key,
  }) : super(key: key);

  /// List of language options consisting of [LanguageOption].
  final List<LanguageOption> languageOptions;

  /// Callback will be called after a language is chosen.
  final Function(LanguageOption? language) chooseLanguageCallback;

  /// Animation for color change.
  final Animation<double> colorTween;

  /// Callback to call on change language button press.
  final ChangeLangOnPressedCallback? onPressed;

  /// Callback to call on change language button press when it is default.
  final VoidCallback? defaultOnPressed;

  @override
  State<_ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<_ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle? buttonStyle =
        context.read<LoginTheme>().changeLangButtonStyle;
    final LanguageOption selectedLanguage =
        context.watch<LoginTexts>().language!;
    return AnimatedBuilder(
      animation: widget.colorTween,
      builder: (BuildContext context, _) => ElevatedButton(
        style: buttonStyle != null
            ? buttonStyle.merge(_defaultButtonStyle(context))
            : _defaultButtonStyle(context),
        onPressed: () async => _onPressed(context, selectedLanguage),
        child: _buttonChild(context, selectedLanguage),
      ),
    );
  }

  Future<void> _onPressed(
      BuildContext context, LanguageOption selectedLanguage) async {
    if (widget.defaultOnPressed != null) widget.defaultOnPressed!();
    await context.read<Auth>().cancelableOperation?.cancel();
    if (widget.onPressed != null) {
      final LanguageOption? newLanguage = await widget.onPressed!();
      if (newLanguage != null) {
        if (!mounted) return;
        context.read<LoginTexts>().setLanguage(newLanguage);
      }
    } else {
      if (!mounted) return;
      await _openChooseDialog(context, selectedLanguage);
    }
  }

  Widget _buttonChild(BuildContext context, LanguageOption selectedLanguage) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    final LoginTheme loginTheme = context.read<LoginTheme>();
    return Row(
      children: <Widget>[
        SizedBox(width: responsiveSize * 1),
        Expanded(
          flex: 2,
          child: selectedLanguage.iconPath == null
              ? _defaultIcon(context)
              : Image.asset(selectedLanguage.iconPath!),
        ),
        SizedBox(width: responsiveSize * 1.3),
        Expanded(
          flex: 3,
          child: BaseText(
            selectedLanguage.code,
            style: TextStyle(
              fontSize: responsiveSize * 4.4,
              color: _contentColor(context),
            ).merge(loginTheme.changeLangButtonTextStyle),
          ),
        ),
        SizedBox(width: responsiveSize * 1),
      ],
    );
  }

  Widget _defaultIcon(BuildContext context) => BaseIcon(
        Icons.language_outlined,
        color: _contentColor(context),
        padding: EdgeInsets.zero,
      );

  Future<void> _openChooseDialog(
          BuildContext context, LanguageOption selectedLanguage) async =>
      DialogBuilder(context)
          .showSelectDialog(context.read<LoginTexts>().chooseLanguageTitle,
              widget.languageOptions, selectedLanguage)
          .then((int? index) {
        LanguageOption? selectedLang;
        if (index != null) selectedLang = widget.languageOptions[index];
        if (selectedLang != null) {
          context.read<LoginTexts>().setLanguage(selectedLang);
        }
        widget.chooseLanguageCallback(selectedLang);
      });

  ButtonStyle _defaultButtonStyle(BuildContext context) {
    final double responsiveSize = DynamicSize(context).responsiveSize;
    return ButtonStyles(context).roundedStyle(
      borderWidth: 1.4,
      backgroundColor: _buttonBgColor(context),
      borderRadius: BorderRadius.circular(8),
      padding: EdgeInsets.symmetric(horizontal: responsiveSize * 2),
      size: Size(responsiveSize * 20, responsiveSize * 12),
      elevation: 16,
    );
  }

  Color? _contentColor(BuildContext context) =>
      context.read<LoginTheme>().changeLangContentColor ??
      Color.lerp(Colors.white, Theme.of(context).primaryColor,
          widget.colorTween.value);

  Color? _buttonBgColor(BuildContext context) => Color.lerp(
      Theme.of(context).primaryColor, Colors.white, widget.colorTween.value);
}
