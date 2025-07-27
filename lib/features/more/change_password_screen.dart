import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isLoading = false;
  bool _showSuccess = false;
  String? _errorText;

  bool get _hasLowercase => _passwordController.text.contains(RegExp(r'[a-z]'));
  bool get _hasUppercase => _passwordController.text.contains(RegExp(r'[A-Z]'));
  bool get _hasNumber => _passwordController.text.contains(RegExp(r'[0-9]'));
  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _passwordsMatch => _passwordController.text == _confirmController.text;

  void _validateAndSubmit() async {
    setState(() {
      _isLoading = true;
      _errorText = null;
      _showSuccess = false;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (!_hasLowercase || !_hasUppercase || !_hasNumber || !_hasMinLength || !_passwordsMatch) {
      setState(() {
        _isLoading = false;
        _errorText = 'Incorrect password combination';
      });
      return;
    }
    setState(() {
      _isLoading = false;
      _showSuccess = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _showSuccess = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Change password', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            _buildValidationChecklist(),
            if (_errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_errorText!, style: const TextStyle(color: Colors.red)),
              ),
            if (_showSuccess)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Password successfully changed', style: TextStyle(color: Color(0xFF386641))),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _validateAndSubmit,
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                child: _isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text('Change password'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidationChecklist() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheck('At least one lowercase letter', _hasLowercase),
        _buildCheck('Minimum 8 characters', _hasMinLength),
        _buildCheck('At least one uppercase letter', _hasUppercase),
        _buildCheck('At least one number', _hasNumber),
        _buildCheck('Passwords match', _passwordsMatch),
      ],
    );
  }

  Widget _buildCheck(String text, bool valid) {
    return Row(
      children: [
        Icon(valid ? Icons.check_circle : Icons.cancel, color: valid ? Colors.green : Colors.red, size: 16),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(fontSize: 13, color: valid ? Colors.green : Colors.red)),
      ],
    );
  }
} 