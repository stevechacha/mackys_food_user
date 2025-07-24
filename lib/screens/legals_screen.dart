import 'package:flutter/material.dart';

class LegalsScreen extends StatefulWidget {
  const LegalsScreen({Key? key}) : super(key: key);

  @override
  State<LegalsScreen> createState() => _LegalsScreenState();
}

class _LegalsScreenState extends State<LegalsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Legals', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF386641),
          unselectedLabelColor: Colors.black54,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(color: Color(0xFF386641), width: 2),
            insets: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: const [
            Tab(text: 'Terms of service'),
            Tab(text: 'Payment policy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLegalsText('Terms of Service', _termsText),
          _buildLegalsText('Payment Policy', _policyText),
        ],
      ),
    );
  }

  Widget _buildLegalsText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(content, style: const TextStyle(fontSize: 15, height: 1.6)),
      ),
    );
  }

  static const String _termsText = '''Welcome to Macky’s Food! These Terms of Service (“Terms”) govern your use of our mobile app, website, and any related services collectively. The Service provided by Macky’s Food is subject to the following terms and conditions...''';

  static const String _policyText = '''Welcome to Macky’s Food! These Terms of Service (“Terms”) govern your use of our mobile app, website, and any related services collectively. The Service provided by Macky’s Food is subject to the following payment policy...''';
} 