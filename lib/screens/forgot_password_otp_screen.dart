import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'reset_password_screen.dart';
import 'login_screen.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  final String contact;
  final bool isPhone;
  const ForgotPasswordOTPScreen({Key? key, required this.contact, required this.isPhone}) : super(key: key);

  @override
  State<ForgotPasswordOTPScreen> createState() => _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  int _timer = 60;
  Timer? _countdown;
  bool _isLoading = false;
  bool _hasError = false;
  String get _otpCode => _controllers.map((c) => c.text).join();

  @override
  void initState() {
    super.initState();
    _startTimer();
    for (int i = 0; i < 4; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < 3) {
          _focusNodes[i + 1].requestFocus();
        }
        if (_controllers[i].text.isEmpty && i > 0) {
          _focusNodes[i - 1].requestFocus();
        }
        setState(() {}); // Re-build to update button state
      });
    }
  }

  void _startTimer() {
    _timer = 60;
    _countdown?.cancel();
    _countdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_timer > 0) {
          _timer--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _onResend() {
    setState(() => _hasError = false);
    _startTimer();
  }

  void _onVerify() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    if (_otpCode != '1234') {
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
        builder: (_) => ResetPasswordScreen(contact: widget.contact, isPhone: widget.isPhone),
      ),
    );
  }

  @override
  void dispose() {
    _countdown?.cancel();
    for (var c in _controllers) c.dispose();
    for (var n in _focusNodes) n.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = _otpCode.length == 4 && !_isLoading;
    final String title = widget.isPhone ? 'Verify your number' : 'Verify your email address';
    final String subtitle = widget.isPhone
        ? 'Enter the code sent to ${widget.contact.substring(0, 4)}****${widget.contact.substring(widget.contact.length - 3)} via WhatsApp'
        : 'Enter the code sent to ${widget.contact.substring(0, 3)}****${widget.contact.substring(widget.contact.length - 10)}';

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
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (i) => _buildCodeBox(i)),
            ),
            const SizedBox(height: 24),
            _buildResendSection(),
            if (_hasError) ...[
              const SizedBox(height: 24),
              _buildErrorBox(),
            ],
            const SizedBox(height: 24),
            _buildVerifyButton(isButtonEnabled),
            const SizedBox(height: 24),
            _buildLoginRedirect(),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBox(int i) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        controller: _controllers[i],
        focusNode: _focusNodes[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _hasError ? Colors.red : Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _hasError ? Colors.red : Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _hasError ? Colors.red : const Color(0xFF386641), width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildResendSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          _timer > 0 ? Icons.error_outline : Icons.check_circle_outline,
          color: _timer > 0 ? Colors.red : Colors.green,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          "Didn't get the code?",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(width: 4),
        if (_timer > 0)
          Text(
            '00:${_timer.toString().padLeft(2, '0')}',
            style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
          )
        else
          GestureDetector(
            onTap: _onResend,
            child: const Text(
              'Resend',
              style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
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
            'Incorrect code combination',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton(bool isEnabled) {
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
        onPressed: isEnabled ? _onVerify : null,
        child: _isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : const Text('Verify', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
} 