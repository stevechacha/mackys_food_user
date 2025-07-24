import 'package:flutter/material.dart';
import 'dart:async';
import 'complete_profile_address_screen.dart';

class CompleteProfileEmailOTPScreen extends StatefulWidget {
  final String email;
  const CompleteProfileEmailOTPScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<CompleteProfileEmailOTPScreen> createState() => _CompleteProfileEmailOTPScreenState();
}

class _CompleteProfileEmailOTPScreenState extends State<CompleteProfileEmailOTPScreen> {
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
        setState(() {});
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
      MaterialPageRoute(builder: (_) => const CompleteProfileAddressScreen()),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Complete profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProgressBar(currentStep: 2),
            const SizedBox(height: 24),
            const Text(
              'Verify your email address',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter the code sent to ${widget.email.substring(0, 3)}****${widget.email.substring(widget.email.length - 10)}',
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
            const SizedBox(height: 40),
            _buildActionButtons(isButtonEnabled),
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
        const Text(
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

  Widget _buildActionButtons(bool isEnabled) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 52,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF386641), width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Save & exit', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SizedBox(
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
                  : const Text('Verify', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int currentStep;
  const _ProgressBar({Key? key, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 4,
            decoration: BoxDecoration(
              color: index < currentStep ? const Color(0xFF386641) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
} 