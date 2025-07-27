import 'package:flutter/material.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, String>> _referrals = [
    {'name': 'Wade Warren', 'date': '6:00 am 12 Mar 2025'},
    {'name': 'Cameron Williamson', 'date': '6:00 am 12 Mar 2025'},
  ];
  double _mealCredit = 4000;

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
        title: const Text('Referral', style: TextStyle(color: Colors.black)),
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
            Tab(text: 'Referral'),
            Tab(text: 'Earnings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReferralTab(),
          _buildEarningsTab(),
        ],
      ),
    );
  }

  Widget _buildReferralTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Spread the joy of fresh meals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  const Text('There\'s nothing more heartwarming than surprising someone with their favorite meal'),
                  const SizedBox(height: 16),
                  const Text('How it works?', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('1. Share your referral code\n2. Sign up & order\n3. You get rewarded'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Referral code',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                        child: const Text('Share'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Referrals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _referrals.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Icon(Icons.group_outlined, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      const Text('No referrals', style: TextStyle(fontSize: 16, color: Colors.black54)),
                      const Text('You currently have no referrals', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _referrals.length,
                    itemBuilder: (context, index) {
                      final referral = _referrals[index];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(referral['name']!),
                        subtitle: Text(referral['date']!),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildEarningsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Meal credit', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text('₦${_mealCredit.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Total referrals', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text('${_referrals.length}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Referrals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _referrals.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Icon(Icons.group_outlined, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      const Text('No referrals', style: TextStyle(fontSize: 16, color: Colors.black54)),
                      const Text('You currently have no referrals', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _referrals.length,
                    itemBuilder: (context, index) {
                      final referral = _referrals[index];
                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(referral['name']!),
                        subtitle: Text(referral['date']!),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
} 