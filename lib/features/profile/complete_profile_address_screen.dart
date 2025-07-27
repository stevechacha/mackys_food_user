import 'package:flutter/material.dart';
import '../dashboard/dashboard_screen.dart';

class CompleteProfileAddressScreen extends StatefulWidget {
  const CompleteProfileAddressScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileAddressScreen> createState() => _CompleteProfileAddressScreenState();
}

class _CompleteProfileAddressScreenState extends State<CompleteProfileAddressScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedAddress;
  bool _isLoading = false;
  bool _showNotFound = false;

  final List<String> _allAddresses = [
    'Sutaka, P.O.W Mafemi Crescent, Abuja, Nigeria',
    'Suruka 21, 212 P.O.W Mafemi along Crescent, Alade, Nigeria',
  ];
  List<String> _filteredAddresses = [];

  @override
  void initState() {
    super.initState();
    _filteredAddresses = _allAddresses;
    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        _filteredAddresses = _allAddresses.where((addr) => addr.toLowerCase().contains(query)).toList();
        _showNotFound = query.isNotEmpty && _filteredAddresses.isEmpty;
      });
    });
  }

  void _onContinue() async {
    if (_selectedAddress == null) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
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
        title: const Text('Complete profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProgressBar(currentStep: 3),
            const SizedBox(height: 24),
            const Text(
              'Delivery address',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your delivery address below',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            _buildSearchField(),
            const SizedBox(height: 24),
            Expanded(
              child: _showNotFound ? _buildNotFound() : _buildAddressList(),
            ),
            _buildActionButtons(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Enter address',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildAddressList() {
    return ListView.separated(
      itemCount: _filteredAddresses.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final address = _filteredAddresses[index];
        final isSelected = _selectedAddress == address;
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.location_on,
            color: isSelected ? const Color(0xFF386641) : Colors.grey,
          ),
          title: Text(
            address.split(',').first,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            address.split(',').sublist(1).join(',').trim(),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          trailing: Radio<String>(
            value: address,
            groupValue: _selectedAddress,
            onChanged: (val) => setState(() => _selectedAddress = val),
            activeColor: const Color(0xFF386641),
          ),
          onTap: () => setState(() => _selectedAddress = address),
        );
      },
    );
  }

  Widget _buildNotFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_off_outlined, size: 64, color: Colors.grey),
        const SizedBox(height: 16),
        const Text(
          'Your location not found',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Your location couldn’t be found',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
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
                backgroundColor: _selectedAddress != null ? const Color(0xFF6B9080) : const Color(0xFFE0E0E0),
                foregroundColor: _selectedAddress != null ? Colors.white : Colors.grey.shade500,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              onPressed: _isLoading || _selectedAddress == null ? null : _onContinue,
              child: _isLoading
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
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