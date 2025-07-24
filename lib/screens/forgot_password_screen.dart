import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forgot_password_otp_screen.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _countryCode = '+234';
  String _countryFlag = '🇳🇬';
  bool _usePhone = true;
  bool _isLoading = false;
  bool _hasError = false;

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

  void _onContinue() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    await Future.delayed(const Duration(seconds: 2));

    bool valid = _usePhone
        ? _phoneController.text.isNotEmpty && _phoneController.text != 'error'
        : _emailController.text.isNotEmpty && _emailController.text != 'error@test.com';

    if (!mounted) return;

    if (!valid) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      return;
    }
    setState(() => _isLoading = false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ForgotPasswordOTPScreen(
          contact: _usePhone ? '$_countryCode${_phoneController.text}' : _emailController.text,
          isPhone: _usePhone,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = _usePhone ? _phoneController.text.isNotEmpty : _emailController.text.isNotEmpty;
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
              'Forget password?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your details account details',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            _buildToggle(),
            const SizedBox(height: 32),
            _usePhone ? _buildPhoneInput() : _buildEmailInput(),
            if (_hasError) ...[
              const SizedBox(height: 16),
              _buildErrorBox(),
            ],
            const SizedBox(height: 32),
            _buildContinueButton(isButtonEnabled),
            const SizedBox(height: 24),
            _buildLoginRedirect(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFf3f7f2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _usePhone = true),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: _usePhone ? const Color(0xFFdbead6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Phone number',
                    style: TextStyle(
                      color: _usePhone ? const Color(0xFF386641) : Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _usePhone = false),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: !_usePhone ? const Color(0xFFdbead6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Email address',
                    style: TextStyle(
                      color: !_usePhone ? const Color(0xFF386641) : Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
                  border: Border.all(color: _hasError ? Colors.red : Colors.grey.shade300),
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
                decoration: _inputDecoration(hint: 'Phone number', error: _hasError),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email address', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: _inputDecoration(hint: 'Email address', error: _hasError),
          onChanged: (_) => setState(() {}),
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
            'No account existing with details provided',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(bool isEnabled) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? const Color(0xFF6B9080) : const Color(0xFFE0E0E0),
          foregroundColor: isEnabled ? Colors.white : Colors.grey.shade500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        onPressed: isEnabled && !_isLoading ? _onContinue : null,
        child: _isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            const TextSpan(text: "Remember your password? "),
            TextSpan(
              text: 'Login',
              style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
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