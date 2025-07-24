import 'package:flutter/material.dart';
import 'profile_details_screen.dart';
import 'location_screen.dart';
import 'favorite_screen.dart';
import 'wallet_screen.dart';
import 'referral_screen.dart';
import 'change_password_screen.dart';
import 'faq_screen.dart';
import 'report_screen.dart';
import 'legals_screen.dart';
import 'rate_us_screen.dart';
import 'logout_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('More', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User info
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Jimoh Adesina', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 4),
                      Text('1 year with Macky\'s Food', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildListTile(context, Icons.person_outline, 'Profile details', 'ProfileDetails'),
          _buildListTile(context, Icons.location_on_outlined, 'Location', 'Location'),
          _buildListTile(context, Icons.favorite_border, 'Favorite', 'Favorite'),
          _buildListTile(context, Icons.account_balance_wallet_outlined, 'Wallet', 'Wallet'),
          _buildListTile(context, Icons.lock_outline, 'Change password', 'ChangePassword'),
          _buildListTile(context, Icons.card_giftcard, 'Referral', 'Referral'),
          const SizedBox(height: 24),
          const Text('Others', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildListTile(context, Icons.help_outline, 'Frequently asked question', 'FAQ'),
          _buildListTile(context, Icons.star_border, 'Rate us', 'RateUs'),
          _buildListTile(context, Icons.report_gmailerrorred_outlined, 'Report', 'Report'),
          _buildListTile(context, Icons.description_outlined, 'Legals', 'Legals'),
          _buildListTile(context, Icons.logout, 'Logout', 'Logout'),
          const SizedBox(height: 24),
          const Center(child: Text('Version 1.00', style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF386641)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (route == 'ProfileDetails') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ProfileDetailsScreen()),
          );
        } else if (route == 'Location') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const LocationScreen()),
          );
        } else if (route == 'Favorite') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const FavoriteScreen()),
          );
        } else if (route == 'Wallet') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WalletScreen()),
          );
        } else if (route == 'Referral') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ReferralScreen()),
          );
        } else if (route == 'ChangePassword') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
          );
        } else if (route == 'FAQ') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const FAQScreen()),
          );
        } else if (route == 'Report') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ReportScreen()),
          );
        } else if (route == 'Legals') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const LegalsScreen()),
          );
        } else if (route == 'RateUs') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const RateUsScreen()),
          );
        } else if (route == 'Logout') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const LogoutScreen()),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(
                  title: Text(title),
                  backgroundColor: const Color(0xFF386641),
                ),
                body: Center(child: Text('$title screen (placeholder)')),
              ),
            ),
          );
        }
      },
    );
  }
} 