 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'signup_success_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  String _countryCode = '+234';
  String _countryFlag = '🇳🇬';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _passwordFocused = false;
  bool _confirmPasswordFocused = false;

  // Password validation
  bool get _hasLowercase => _passwordController.text.contains(RegExp(r'[a-z]'));
  bool get _hasUppercase => _passwordController.text.contains(RegExp(r'[A-Z]'));
  bool get _hasNumber => _passwordController.text.contains(RegExp(r'[0-9]'));
  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _passwordsMatch => _passwordController.text == _confirmPasswordController.text;

  bool get _isFormValid => _hasLowercase && _hasUppercase && _hasNumber && _hasMinLength && _passwordsMatch && _phoneController.text.isNotEmpty;

  void _showCountryPicker() async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CountryPickerModal(selectedCode: _countryCode),
    );
    if (result != null) {
      setState(() {
        _countryCode = result['code']!;
        _countryFlag = result['flag']!;
      });
    }
  }

  void _onSignup() async {
    if (!_isFormValid) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OTPScreen(
          phoneNumber: '$_countryCode${_phoneController.text}',
          onVerified: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SignupSuccessScreen()),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Welcome to Macky's food, let get you started in few minute",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              _buildPhoneInput(),
              const SizedBox(height: 24),
              _buildPasswordInput(),
              if (_passwordFocused) ...[
                const SizedBox(height: 12),
                _PasswordValidation(
                  hasLowercase: _hasLowercase,
                  hasUppercase: _hasUppercase,
                  hasNumber: _hasNumber,
                  hasMinLength: _hasMinLength,
                ),
              ],
              const SizedBox(height: 24),
              _buildConfirmPasswordInput(),
              if (_confirmPasswordFocused && _confirmPasswordController.text.isNotEmpty && !_passwordsMatch)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('Incorrect password combination', style: TextStyle(color: Colors.red, fontSize: 12)),
                ),
              const SizedBox(height: 24),
              _buildReferralInput(),
              const SizedBox(height: 24),
              _buildTermsAndPolicy(),
              const SizedBox(height: 24),
              _buildSignupButton(),
              const SizedBox(height: 24),
              _buildLoginRedirect(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone number', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: _showCountryPicker,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(_countryFlag, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    Text(_countryCode, style: const TextStyle(fontSize: 16)),
                    const Icon(Icons.arrow_drop_down, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration(hint: 'Phone number'),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (hasFocus) => setState(() => _passwordFocused = hasFocus),
          child: TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            onChanged: (_) => setState(() {}),
            decoration: _inputDecoration(hint: 'Password').copyWith(
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Confirm Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (hasFocus) => setState(() => _confirmPasswordFocused = hasFocus),
          child: TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_isConfirmPasswordVisible,
            onChanged: (_) => setState(() {}),
            decoration: _inputDecoration(hint: 'Confirm Password').copyWith(
              suffixIcon: IconButton(
                icon: Icon(_isConfirmPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey),
                onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReferralInput() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: const Text('Referral code (Optional)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        children: [
          TextFormField(
            controller: _referralController,
            decoration: _inputDecoration(hint: 'Enter referral code'),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndPolicy() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(fontSize: 12, color: Colors.black54, height: 1.5),
        children: [
          const TextSpan(text: "By clicking 'Sign up' you agree to Macky's Food "),
          TextSpan(
            text: 'Terms of use',
            style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = () {/* Handle tap */},
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy policy',
            style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = () {/* Handle tap */},
          ),
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _isFormValid ? const Color(0xFF6B9080) : const Color(0xFFE0E0E0),
          foregroundColor: _isFormValid ? Colors.white : Colors.grey.shade500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        onPressed: _onSignup,
        child: _isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : const Text('Sign up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            const TextSpan(text: 'Have an account? '),
            TextSpan(
              text: 'Login',
              style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF386641), width: 1.5),
      ),
    );
  }
}

class _PasswordValidation extends StatelessWidget {
  final bool hasLowercase, hasUppercase, hasNumber, hasMinLength;
  const _PasswordValidation({required this.hasLowercase, required this.hasUppercase, required this.hasNumber, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow('At least one lowercase letter', hasLowercase),
        const SizedBox(height: 4),
        _buildRow('Minimum 8 characters', hasMinLength),
        const SizedBox(height: 4),
        _buildRow('At least one uppercase letter', hasUppercase),
        const SizedBox(height: 4),
        _buildRow('At least one number', hasNumber),
      ],
    );
  }

  Widget _buildRow(String text, bool valid) {
    final color = valid ? Colors.green.shade700 : Colors.red.shade700;
    return Row(
      children: [
        Icon(valid ? Icons.check_circle_outline : Icons.highlight_off, color: color, size: 18),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _CountryPickerModal extends StatelessWidget {
  final String selectedCode;
  const _CountryPickerModal({required this.selectedCode});

  @override
  Widget build(BuildContext context) {
    final countries = [
      {'code': '+234', 'name': 'Nigeria', 'flag': '🇳🇬'},
      {'code': '+1', 'name': 'USA', 'flag': '🇺🇸'},
      {'code': '+237', 'name': 'Cameroon', 'flag': '🇨🇲'},
      {'code': '+27', 'name': 'South Africa', 'flag': '🇿🇦'},
      {'code': '+90', 'name': 'Turkey', 'flag': '🇹🇷'},
    ];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...countries.map((c) => ListTile(
                    leading: Text(c['flag']!, style: const TextStyle(fontSize: 24)),
                    title: Text('${c['name']} (${c['code']})'),
                    onTap: () => Navigator.of(context).pop(c),
                  )),
            ],
          ),
        ),
      ),
    );
  }
} 