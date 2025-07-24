import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'complete_profile_email_otp_screen.dart';

class CompleteProfilePersonalInfoScreen extends StatefulWidget {
  const CompleteProfilePersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePersonalInfoScreen> createState() => _CompleteProfilePersonalInfoScreenState();
}

class _CompleteProfilePersonalInfoScreenState extends State<CompleteProfilePersonalInfoScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _birthday;
  File? _image;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  void _onContinue() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CompleteProfileEmailOTPScreen(email: _emailController.text)),
    );
  }

  void _selectBirthday() async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        return _BirthdayPicker(initialDate: _birthday ?? DateTime.now());
      },
    );
    if (picked != null && picked != _birthday) {
      setState(() => _birthday = picked);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _birthday != null;

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
            const _ProgressBar(currentStep: 1),
            const SizedBox(height: 24),
            const Text(
              'Personal information',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your personal information below',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            _buildAvatar(),
            const SizedBox(height: 32),
            _buildNameInputs(),
            const SizedBox(height: 24),
            _buildBirthdayInput(),
            const SizedBox(height: 24),
            _buildEmailInput(),
            const SizedBox(height: 24),
            _buildPhoneInput(),
            const SizedBox(height: 40),
            _buildActionButtons(isFormValid),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Text(
                  '${_firstNameController.text.isNotEmpty ? _firstNameController.text[0] : ''}${_lastNameController.text.isNotEmpty ? _lastNameController.text[0] : ''}',
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF386641)),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildNameInputs() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('First name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstNameController,
                decoration: _inputDecoration(hint: 'First name'),
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Last name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lastNameController,
                decoration: _inputDecoration(hint: 'Last name'),
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBirthdayInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Birthday', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        const Text('Free delivery and discount on your birthday', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _selectBirthday,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _birthday == null ? 'Select birthday' : '${_birthday!.day} ${_getMonth(_birthday!.month)} ${_birthday!.year}',
                  style: TextStyle(fontSize: 16, color: _birthday == null ? Colors.grey : Colors.black),
                ),
                const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 20),
              ],
            ),
          ),
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
          decoration: _inputDecoration(hint: 'Email address'),
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone number', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: true,
          decoration: _inputDecoration(hint: '+234 8133887495').copyWith(
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isFormValid) {
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
                backgroundColor: isFormValid ? const Color(0xFF6B9080) : const Color(0xFFE0E0E0),
                foregroundColor: isFormValid ? Colors.white : Colors.grey.shade500,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              onPressed: isFormValid && !_isLoading ? _onContinue : null,
              child: _isLoading
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
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

  String _getMonth(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
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

class _BirthdayPicker extends StatefulWidget {
  final DateTime initialDate;
  const _BirthdayPicker({required this.initialDate});

  @override
  State<_BirthdayPicker> createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<_BirthdayPicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
              const Text('Birthday', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              TextButton(
                onPressed: () => Navigator.of(context).pop(_selectedDate),
                child: const Text('Apply', style: TextStyle(color: Color(0xFF386641))),
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            height: 200,
            child: DatePicker(
              initialDate: _selectedDate,
              onDateChanged: (date) => setState(() => _selectedDate = date),
            ),
          ),
        ],
      ),
    );
  }
}

// A simplified custom DatePicker. A real implementation would use a package.
class DatePicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateChanged;
  const DatePicker({Key? key, required this.initialDate, required this.onDateChanged}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _yearController;
  late int _selectedMonth;
  late int _selectedDay;
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedMonth = widget.initialDate.month;
    _selectedDay = widget.initialDate.day;
    _selectedYear = widget.initialDate.year;
    _monthController = FixedExtentScrollController(initialItem: _selectedMonth - 1);
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);
    _yearController = FixedExtentScrollController(initialItem: DateTime.now().year - _selectedYear);
  }

  void _updateDate() {
    final newDate = DateTime(_selectedYear, _selectedMonth, _selectedDay);
    widget.onDateChanged(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: _monthController,
            itemExtent: 40,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() => _selectedMonth = index + 1);
              _updateDate();
            },
            childDelegate: ListWheelChildLoopingListDelegate(
              children: List.generate(12, (index) => Center(child: Text(_getMonth(index + 1)))),
            ),
          ),
        ),
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: _dayController,
            itemExtent: 40,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() => _selectedDay = index + 1);
              _updateDate();
            },
            childDelegate: ListWheelChildLoopingListDelegate(
              children: List.generate(31, (index) => Center(child: Text('${index + 1}'))),
            ),
          ),
        ),
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: _yearController,
            itemExtent: 40,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              setState(() => _selectedYear = DateTime.now().year - index);
              _updateDate();
            },
            childDelegate: ListWheelChildListDelegate(
              children: List.generate(100, (index) => Center(child: Text('${DateTime.now().year - index}'))),
            ),
          ),
        ),
      ],
    );
  }

  String _getMonth(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }
} 