part of '../../animated_login.dart';

<<<<<<< HEAD
class _FormPart extends StatefulWidget {
  /// Form part of the login screen.
  const _FormPart({
    required this.animationController,
    required this.checkError,
    required this.showForgotPassword,
    required this.showPasswordVisibility,
    required this.signUpMode,
    required this.formKey,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    this.validateName = true,
    this.validateEmail = true,
    this.validatePassword = true,
=======
class _WebForm extends StatefulWidget {
  /// Form part of the login screen.
  const _WebForm({
    required this.animationController,
    required this.showForgotPassword,
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
    Key? key,
  }) : super(key: key);

  /// Main animation controller for the transition animation.
  final AnimationController animationController;

<<<<<<< HEAD
  /// Form key in the form widget. It is especially used for input validations.
  final GlobalKey<FormState> formKey;

  /// Indicates whether the text form fields should show error messages.
  final bool checkError;

  /// Indicates whether the forgot password option will be enabled.
  final bool showForgotPassword;

  /// Indicates whether the user can show the password text without obscuring.
  final bool showPasswordVisibility;

  /// Optional TextEditingController for name input field.
  final TextEditingController? nameController;

  /// Optional TextEditingController for email input field.
  final TextEditingController? emailController;

  /// Optional TextEditingController for password input field.
  final TextEditingController? passwordController;

  /// Optional TextEditingController for confirm password input field.
  final TextEditingController? confirmPasswordController;

  /// Enum to determine which text form fields should be displayed in addition
  /// to the email and password fields: Name / Confirm Password / Both
  final SignUpModes signUpMode;

  /// Custom input validator for name field.
  final ValidatorModel? nameValidator;

  /// Custom input validator for email field.
  final ValidatorModel? emailValidator;

  /// Custom input validator for password field.
  final ValidatorModel? passwordValidator;

  /// Indicates whether the name field should be validated.
  final bool validateName;

  /// Indicates whether the email field should be validated.
  final bool validateEmail;

  /// Indicates whether the password fields should be validated.
  final bool validatePassword;

  @override
  __FormPartState createState() => __FormPartState();
}

class __FormPartState extends State<_FormPart> {
=======
  /// Indicates whether the forgot password option will be enabled.
  final bool showForgotPassword;

  @override
  __WebFormState createState() => __WebFormState();
}

class __WebFormState extends State<_WebForm> {
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  /// Custom LoginTheme data, colors and styles on the screen.
  late LoginTheme loginTheme;

  /// Custom LoginTexts data, texts on the screen.
  late LoginTexts loginTexts;

  /// It is for giving responsive size values.
  late DynamicSize dynamicSize;

  /// Its aim is to take, manage, change auth data with the state.
  late Auth auth;

  /// Theme is created as a variable to call it from different code pieces.
  late ThemeData theme;

  /// Transition animation that will change the location of the form part.
  late Animation<double> transitionAnimation;

  /// Animation that will change the location of the components of form.
  late final Animation<double> offsetAnimation;

<<<<<<< HEAD
  /// Text Editing Controllers for the text form fields.
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  /// The form key that will be assigned to the form.
  late final GlobalKey<FormState> _formKey = widget.formKey;

  final FocusNode _confirmPasswordFocus = FocusNode();

=======
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  late bool _isLandscape;
  late bool _isReverse;

  @override
  void initState() {
    super.initState();

    /// Initializes the appearance and disappearance animations
<<<<<<< HEAD
    /// from outside to the screen for the form components.
=======
    /// from outside to the screen for the form LoginComponents.
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
    offsetAnimation = AnimationHelper(
      animationController: widget.animationController,
      animationCurve: context.read<LoginTheme>().animationCurve,
    ).tweenSequenceAnimation(80, 10);
<<<<<<< HEAD

    final Auth readAuth = context.read<Auth>();
    _nameController =
        widget.nameController ?? TextEditingController(text: readAuth.username);
    _emailController =
        widget.emailController ?? TextEditingController(text: readAuth.email);
    _passwordController = widget.passwordController ??
        TextEditingController(text: readAuth.password);
    _confirmPasswordController = widget.confirmPasswordController ??
        TextEditingController(text: readAuth.confirmPassword);
=======
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Auth auth = context.read<Auth>();
<<<<<<< HEAD
    _emailController.value = TextEditingValue(text: auth.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
=======
    auth
      ..setEmailValue(auth.email)
      ..setPasswordValue(auth.password)
      ..setUsernameValue(auth.username)
      ..setConfirmPasswordValue(auth.confirmPassword);
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  }

  @override
  Widget build(BuildContext context) {
    dynamicSize = DynamicSize(context);
    loginTheme = context.watch<LoginTheme>();
    _isLandscape = loginTheme.isLandscape;
    _isReverse = context.select<Auth, bool>((Auth auth) => auth.isReverse);
    loginTexts = context.read<LoginTexts>();
    theme = Theme.of(context);
    auth = context.read<Auth>();
<<<<<<< HEAD
    _fillFields();
    _initializeAnimations();
    return _isLandscape
        ? _webView
        : AnimatedBuilder(
            animation: transitionAnimation,
            child: _formColumn,
            builder: (BuildContext context, Widget? child) =>
                Transform.translate(
              offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
              child: child,
            ),
          );
=======
    _initializeAnimations();
    return _webView;
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
  }

  Widget get _webView => AnimatedBuilder(
        animation: transitionAnimation,
        child: _webViewChild,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: Offset(dynamicSize.width * transitionAnimation.value, 0),
          child: child,
        ),
      );

  Widget get _webViewChild => Container(
        width: dynamicSize.width * context.read<LoginTheme>().formWidthRatio,
        height: dynamicSize.height * 100,
        color: Colors.white,
        child: AnimatedBuilder(
          animation: offsetAnimation,
          child: _formColumn,
          builder: (BuildContext context, Widget? child) => Transform.translate(
            offset: Offset(dynamicSize.width * offsetAnimation.value, 0),
            child: child,
          ),
        ),
      );

<<<<<<< HEAD
  Widget get _formColumn => Padding(
        padding: loginTheme.formPadding ??
            (_isLandscape
                ? dynamicSize.highHorizontalPadding
                : dynamicSize.lowMedHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isLandscape) _formTitle,
            if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty)
              ..._socialLoginPart
            else
              SizedBox(
                height:
                    loginTheme.spacingWithoutSocial ?? dynamicSize.height * 6,
              ),
            _form,
            SizedBox(height: loginTheme.spacingFormAndAction ?? _customSpace),
            _actionButton,
          ],
        ),
      );

  double get _customSpace {
    double factor = 3;
    if (_isLandscape) {
      factor = 4;
    } else if (_isReverse) {
      factor = 0.5;
    }
    return dynamicSize.height * factor;
  }

  List<Widget> get _socialLoginPart => <Widget>[
        SizedBox(height: dynamicSize.height * 2.5),
        _socialLoginOptions,
        SizedBox(height: dynamicSize.height * 2),
        _useEmailText,
        SizedBox(height: dynamicSize.height * 1.8),
      ];

  Widget get _formTitle => BaseText(
        _isReverse ? loginTexts.loginFormTitle : loginTexts.signUpFormTitle,
        style: TextStyles(context)
            .titleStyle(color: _isLandscape ? null : Colors.white)
            .merge(loginTheme.formTitleStyle),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: context.read<LoginTheme>().socialLoginsSpacing ??
            dynamicSize.responsiveSize * 10,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        _isReverse ? loginTexts.loginUseEmail : loginTexts.signUpUseEmail,
        style: TextStyles(context)
            .subtitleTextStyle(
                color: _isLandscape ? Colors.black87 : Colors.white)
            .merge(loginTheme.useEmailStyle),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        auth.socialLogins!.length,
        (int index) => CircleWidget(
          onTap: () async => _socialLoginCallback(index),
          color: _isLandscape ? null : Colors.white,
          widthFactor: _isLandscape ? 13 : 16,
          child: Image.asset(auth.socialLogins![index].iconPath),
        ),
      );

  Future<void> _socialLoginCallback(int index) async {
    if (widget.checkError) {
      await _errorCheck(auth.socialLogins![index].callback);
    } else {
      await auth.socialLogins![index].callback();
    }
  }

  Widget get _actionButton => RoundedButton(
        buttonText: _isReverse ? loginTexts.login : loginTexts.signUp,
        onPressed: _action,
        backgroundColor:
            _isLandscape ? theme.primaryColor.withOpacity(.8) : Colors.white,
        buttonStyle: loginTheme.actionButtonStyle,
      );

  Future<void> _action() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      if (auth.isLogin) {
        await _errorCheck(_loginResult);
      } else if (auth.isSignup) {
        await _errorCheck(_signupResult);
      }
    }
  }

  Future<void> _errorCheck(Future<String?> Function() action) async {
    final String? errorMessage = await action();
    if (errorMessage != null && widget.checkError) {
      // ignore: use_build_context_synchronously
      DialogBuilder(context).showErrorDialog(errorMessage);
    }
  }

  Future<String?> _loginResult() async {
    final LoginData loginData = LoginData(
      email: _emailController.text,
      password: _passwordController.text,
    );
    return auth.onLogin(loginData);
  }

  Future<String?> _signupResult() async {
    final SignUpData signupData = SignUpData(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
    if (signupData.password != signupData.confirmPassword &&
        widget.checkError &&
        widget.signUpMode != SignUpModes.name) {
      return loginTexts.passwordMatchingError;
    } else {
      return auth.onSignup(signupData);
    }
  }

  Form get _form => Form(
        key: _formKey,
=======
  Widget get _formColumn {
    final List<Widget> items = <Widget>[];
    for (final AnimatedComponent component
        in loginTheme.animatedComponentOrder) {
      items.addAll(_orderedComponent(component.component));
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: items);
  }

  List<Widget> _orderedComponent(LoginComponents component) {
    switch (component) {
      case LoginComponents.formTitle:
        return <Widget>[if (_isLandscape) const _FormTitle()];
      case LoginComponents.socialLogins:
        if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty) {
          return <Widget>[const _SocialLoginOptions()];
        }
        return <Widget>[];
      case LoginComponents.useEmail:
        if (auth.socialLogins != null && auth.socialLogins!.isNotEmpty) {
          return <Widget>[const _UseEmailText()];
        }
        return <Widget>[];
      case LoginComponents.form:
        return <Widget>[const _Form()];
      case LoginComponents.forgotPassword:
        return <Widget>[
          if (_isReverse && widget.showForgotPassword) const _ForgotPassword()
        ];
      case LoginComponents.actionButton:
        return <Widget>[const _ActionButton()];
      default:
        return <Widget>[Container()];
    }
  }

  void _initializeAnimations() {
    /// Initializes the transition animation from welcome part's width ratio
    /// to 0 with custom animation curve and animation controller.
    transitionAnimation = _isLandscape
        ? Tween<double>(begin: 100 - loginTheme.formWidthRatio, end: 0).animate(
            CurvedAnimation(
              parent: widget.animationController,
              curve: loginTheme.animationCurve,
            ),
          )
        : AnimationHelper(
            animationController: widget.animationController,
            animationCurve: loginTheme.animationCurve,
          ).tweenSequenceAnimation(120, 20);
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final bool isReverse =
        context.select<Auth, bool>((Auth auth) => auth.isReverse);
    final bool isLandscape = loginTheme.isLandscape;
    return Padding(
      padding: loginTheme.actionButtonPadding ??
          EdgeInsets.symmetric(
              vertical: _customSpace(context, isReverse, isLandscape)),
      child: RoundedButton(
        buttonText: isReverse ? loginTexts.login : loginTexts.signUp,
        onPressed: context.read<Auth>().action,
        backgroundColor: isLandscape
            ? Theme.of(context).primaryColor.withOpacity(.8)
            : Colors.white,
        buttonStyle: loginTheme.actionButtonStyle,
      ),
    );
  }

  double _customSpace(BuildContext context, bool isReverse, bool isLandscape) {
    double factor = 2;
    if (isLandscape) {
      factor = 3;
    }
    return DynamicSize(context).height * factor;
  }
}

class _FormTitle extends StatelessWidget {
  const _FormTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    return Padding(
      padding: loginTheme.formTitlePadding ?? EdgeInsets.zero,
      child: BaseText(
        context.select<Auth, bool>((Auth auth) => auth.isReverse)
            ? loginTexts.loginFormTitle
            : loginTexts.signUpFormTitle,
        style: TextStyles(context)
            .titleStyle(color: loginTheme.isLandscape ? null : Colors.white)
            .merge(loginTheme.formTitleStyle),
      ),
    );
  }
}

class _SocialLoginOptions extends StatelessWidget {
  const _SocialLoginOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    final DynamicSize dynamicSize = DynamicSize(context);
    return Padding(
      padding: loginTheme.socialLoginPadding ??
          EdgeInsets.symmetric(vertical: dynamicSize.height * 1.4),
      child: Wrap(
        spacing: context.read<LoginTheme>().socialLoginsSpacing ??
            dynamicSize.responsiveSize * 10,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons(context, loginTheme.isLandscape),
      ),
    );
  }

  List<Widget> _socialLoginButtons(BuildContext context, bool isLandscape) {
    final Auth auth = context.read<Auth>();
    return List<Widget>.generate(
      auth.socialLogins!.length,
      (int index) => CircleWidget(
        onTap: () async => auth.socialLoginCallback(index),
        color: isLandscape ? null : Colors.white,
        widthFactor: isLandscape ? 13 : 16,
        child: Image.asset(auth.socialLogins![index].iconPath),
      ),
    );
  }
}

class _UseEmailText extends StatelessWidget {
  const _UseEmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    final DynamicSize dynamicSize = DynamicSize(context);
    return Padding(
      padding: loginTheme.useEmailPadding ??
          EdgeInsets.only(top: dynamicSize.height),
      child: _useEmailText(context, loginTheme),
    );
  }

  Widget _useEmailText(BuildContext context, LoginTheme loginTheme) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    return BaseText(
      context.select<Auth, bool>((Auth auth) => auth.isReverse)
          ? loginTexts.loginUseEmail
          : loginTexts.signUpUseEmail,
      style: TextStyles(context)
          .subtitleTextStyle(
              color: loginTheme.isLandscape ? Colors.black87 : Colors.white)
          .merge(loginTheme.useEmailStyle),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final FocusNode _confirmPasswordFocus = FocusNode();

  late Auth auth;

  @override
  void dispose() {
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    auth = context.read<Auth>();
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    final DynamicSize dynamicSize = DynamicSize(context);
    return Padding(
      padding: loginTheme.formPadding ??
          EdgeInsets.symmetric(vertical: dynamicSize.height * 2),
      child: Form(
        key: auth.formKey,
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: context.read<LoginTheme>().formElementsSpacing ??
<<<<<<< HEAD
              dynamicSize.height * (_isLandscape ? 2.2 : 1.5),
          children: _formElements,
        ),
      );

  List<Widget> get _formElements => <Widget>[
        if (!_isReverse && widget.signUpMode != SignUpModes.confirmPassword)
          CustomTextFormField(
            controller: _nameController,
            hintText: loginTexts.nameHint,
            prefixIcon: Icons.person_outline,
            prefixWidget: loginTheme.nameIcon,
            validator: _nameValidator,
            textInputAction: TextInputAction.next,
            onChanged: auth.setUsername,
            autofillHints: const <String>[
              AutofillHints.username,
              AutofillHints.newUsername,
              AutofillHints.name,
            ],
            textInputType: TextInputType.name,
          ),
        CustomTextFormField(
          controller: _emailController,
          hintText: loginTexts.emailHint,
          prefixIcon: Icons.email_outlined,
          prefixWidget: loginTheme.emailIcon,
          validator: _emailValidator,
          textInputAction: TextInputAction.next,
          onChanged: auth.setEmail,
          autofillHints: const <String>[AutofillHints.email],
          textInputType: TextInputType.emailAddress,
        ),
        ObscuredTextFormField(
          controller: _passwordController,
          hintText: loginTexts.passwordHint,
          prefixIcon: Icons.password_outlined,
          showPasswordVisibility: widget.showPasswordVisibility,
          textInputAction:
              auth.isSignup ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: (_) =>
              auth.isSignup ? _confirmPasswordFocus.requestFocus() : _action(),
          onChanged: auth.setPassword,
          validator: _passwordValidator,
        ),
        if (!_isReverse && widget.signUpMode != SignUpModes.name)
          ObscuredTextFormField(
            controller: _confirmPasswordController,
            hintText: loginTexts.confirmPasswordHint,
            prefixIcon: Icons.password_outlined,
            showPasswordVisibility: widget.showPasswordVisibility,
            onFieldSubmitted: (_) => _action(),
            focusNode: _confirmPasswordFocus,
            onChanged: auth.setConfirmPassword,
            validator: _passwordValidator,
          ),
        if (_isReverse && widget.showForgotPassword) _forgotPassword,
      ];

  FormFieldValidator<String?>? get _nameValidator => widget.validateName
      ? (widget.nameValidator?.customValidator ??
          Validators(validator: widget.nameValidator).name)
      : null;

  FormFieldValidator<String?>? get _emailValidator => widget.validateEmail
      ? (widget.emailValidator?.customValidator ??
          Validators(validator: widget.emailValidator).email)
      : null;

  FormFieldValidator<String?>? get _passwordValidator => widget.validatePassword
      ? (widget.passwordValidator?.customValidator ??
          Validators(
            validator: widget.passwordValidator ??
                const ValidatorModel(
                  checkLowerCase: true,
                  checkUpperCase: true,
                  checkNumber: true,
                  checkSpace: true,
                ),
          ).password)
      : null;

  Widget get _forgotPassword => Container(
        alignment: _isLandscape ? Alignment.center : Alignment.topCenter,
        padding: loginTheme.forgotPasswordPadding ??
            (_isLandscape
                ? dynamicSize.lowTopPadding
                : dynamicSize.lowMedBottomPadding),
        child: BaseTextButton(
          text: loginTexts.forgotPassword,
          style: _defaultStyle
              .copyWith(decoration: TextDecoration.underline)
              .merge(loginTheme.forgotPasswordStyle),
          onPressed: () async {
            await _errorCheck(_forgotPasswordResult);
          },
        ),
      );

  TextStyle get _defaultStyle => TextStyles(context)
      .subBodyStyle(color: _isLandscape ? theme.primaryColor : Colors.white);

  Future<String?> _forgotPasswordResult() async =>
      auth.onForgotPassword(_emailController.text);

  void _initializeAnimations() {
    /// Initializes the transition animation from welcome part's width ratio
    /// to 0 with custom animation curve and animation controller.
    transitionAnimation = _isLandscape
        ? Tween<double>(begin: 100 - loginTheme.formWidthRatio, end: 0).animate(
            CurvedAnimation(
              parent: widget.animationController,
              curve: loginTheme.animationCurve,
            ),
          )
        : AnimationHelper(
            animationController: widget.animationController,
            animationCurve: loginTheme.animationCurve,
          ).tweenSequenceAnimation(120, 20);
  }

  void _fillFields() {
    _emailController.value = TextEditingValue(text: auth.email ?? '');
    _nameController.value = TextEditingValue(text: auth.username ?? '');
    _passwordController.value = TextEditingValue(text: auth.password ?? '');
    _confirmPasswordController.value =
        TextEditingValue(text: auth.confirmPassword ?? '');
  }
=======
              dynamicSize.height * (loginTheme.isLandscape ? 2.2 : 1.2),
          children: _formElements(auth, loginTheme),
        ),
      ),
    );
  }

  List<Widget> _formElements(Auth auth, LoginTheme loginTheme) {
    final LoginTexts loginTexts = context.read<LoginTexts>();
    final bool isReverse =
        context.select<Auth, bool>((Auth auth) => auth.isReverse);
    return <Widget>[
      if (!isReverse && auth.signUpMode != SignUpModes.confirmPassword)
        CustomTextFormField(
          controller: auth.nameController,
          hintText: loginTexts.nameHint,
          prefixIcon: Icons.person_outline,
          prefixWidget: loginTheme.nameIcon,
          validator: auth.nameValidator,
          textInputAction: TextInputAction.next,
          onChanged: auth.setUsername,
          autofillHints: const <String>[
            AutofillHints.username,
            AutofillHints.newUsername,
            AutofillHints.name,
          ],
          textInputType: TextInputType.name,
        ),
      CustomTextFormField(
        controller: auth.emailController,
        hintText: loginTexts.emailHint,
        prefixIcon: Icons.email_outlined,
        prefixWidget: loginTheme.emailIcon,
        validator: auth.emailValidator,
        textInputAction: TextInputAction.next,
        onChanged: auth.setEmail,
        autofillHints: const <String>[AutofillHints.email],
        textInputType: TextInputType.emailAddress,
      ),
      ObscuredTextFormField(
        controller: auth.passwordController,
        hintText: loginTexts.passwordHint,
        prefixIcon: Icons.password_outlined,
        showPasswordVisibility: auth.showPasswordVisibility,
        textInputAction:
            auth.isSignup ? TextInputAction.next : TextInputAction.done,
        onFieldSubmitted: (_) => auth.isSignup
            ? _confirmPasswordFocus.requestFocus()
            : auth.action(),
        onChanged: auth.setPassword,
        validator: auth.passwordValidator,
      ),
      if (!isReverse && auth.signUpMode != SignUpModes.name)
        ObscuredTextFormField(
          controller: auth.confirmPasswordController,
          hintText: loginTexts.confirmPasswordHint,
          prefixIcon: Icons.password_outlined,
          showPasswordVisibility: auth.showPasswordVisibility,
          onFieldSubmitted: (_) => auth.action(),
          focusNode: _confirmPasswordFocus,
          onChanged: auth.setConfirmPassword,
          validator: auth.passwordValidator,
        ),
    ];
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginTheme loginTheme = context.watch<LoginTheme>();
    final Auth auth = context.read<Auth>();
    final DynamicSize dynamicSize = DynamicSize(context);
    final bool isLandscape = loginTheme.isLandscape;
    return Container(
      alignment: isLandscape ? Alignment.center : Alignment.topCenter,
      padding: loginTheme.forgotPasswordPadding ??
          (isLandscape
              ? dynamicSize.lowTopPadding
              : dynamicSize.lowBottomPadding),
      child: BaseTextButton(
        text: context.read<LoginTexts>().forgotPassword,
        style: _defaultStyle(context, isLandscape)
            .copyWith(decoration: TextDecoration.underline)
            .merge(loginTheme.forgotPasswordStyle),
        onPressed: () async => auth.onForgotPassword(auth.emailController.text),
      ),
    );
  }

  TextStyle _defaultStyle(BuildContext context, bool isLandscape) =>
      TextStyles(context).subBodyStyle(
          color: isLandscape ? Theme.of(context).primaryColor : Colors.white);
>>>>>>> 15afffa4778b068a51a25368018e9755cabf80f5
}
