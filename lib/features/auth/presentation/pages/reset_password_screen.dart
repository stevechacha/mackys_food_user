 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_success_screen.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String contact;
  final bool isPhone;
  const ResetPasswordScreen({Key? key, required this.contact, required this.isPhone}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _passwordFocused = false;
  bool _confirmPasswordFocused = false;

  bool get _hasLowercase => _passwordController.text.contains(RegExp(r'[a-z]'));
  bool get _hasUppercase => _passwordController.text.contains(RegExp(r'[A-Z]'));
  bool get _hasNumber => _passwordController.text.contains(RegExp(r'[0-9]'));
  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _passwordsMatch => _passwordController.text == _confirmPasswordController.text;

  bool get _isFormValid => _hasLowercase && _hasUppercase && _hasNumber && _hasMinLength && _passwordsMatch;

  void _onReset() async {
    if (!_isFormValid) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const ForgotPasswordSuccessScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset password',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your new password and confirm password below',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
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
            if (_confirmPasswordFocused && _confirmPasswordController.text.isNotEmpty && !_passwordsMatch) ...[
              const SizedBox(height: 16),
              _buildErrorBox(),
            ],
            const SizedBox(height: 32),
            _buildResetButton(),
            const SizedBox(height: 24),
            _buildLoginRedirect(),
            const SizedBox(height: 24),
          ],
        ),
      ),
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
            decoration: _inputDecoration(
              hint: 'Confirm Password',
              error: _confirmPasswordController.text.isNotEmpty && !_passwordsMatch,
            ).copyWith(
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

  Widget _buildErrorBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 20),
          SizedBox(width: 8),
          Text(
            'Incorrect password combination',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
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
        onPressed: _isFormValid && !_isLoading ? _onReset : null,
        child: _isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : const Text('Reset password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            const TextSpan(text: 'Remember your password? '),
            TextSpan(
              text: 'Login',
              style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, bool error = false}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: error ? Colors.red : Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: error ? Colors.red : Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: error ? Colors.red : const Color(0xFF386641), width: 1.5),
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