import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool _editing = false;
  String _firstName = 'Jimoh';
  String _lastName = 'Adesina';
  String? _birthday = 'June 20';
  String _email = 'jimoh@email.com';
  String _phone = '+234 813 *** 7495';
  final _formKey = GlobalKey<FormState>();
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Profile details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.grey.shade400,
                      child: const Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _editing
                      ? Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: _firstName,
                                decoration: const InputDecoration(labelText: 'First name'),
                                onChanged: (v) => _firstName = v,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                initialValue: _lastName,
                                decoration: const InputDecoration(labelText: 'Last name'),
                                onChanged: (v) => _lastName = v,
                              ),
                            ),
                          ],
                        )
                      : _buildProfileRow('Full name', '$_firstName $_lastName', onEdit: () => setState(() => _editing = true)),
                  const SizedBox(height: 16),
                  _editing
                      ? TextFormField(
                          initialValue: _birthday,
                          decoration: const InputDecoration(labelText: 'Birthday'),
                          onChanged: (v) => _birthday = v,
                        )
                      : _buildProfileRow('Birthday', _birthday ?? 'Not provided', onEdit: () => setState(() => _editing = true)),
                  const SizedBox(height: 16),
                  _editing
                      ? TextFormField(
                          initialValue: _email,
                          decoration: const InputDecoration(labelText: 'Email address'),
                          onChanged: (v) => _email = v,
                        )
                      : _buildProfileRow('Email address', _email, onEdit: () => setState(() => _editing = true)),
                  const SizedBox(height: 16),
                  _editing
                      ? TextFormField(
                          initialValue: _phone,
                          decoration: const InputDecoration(labelText: 'Phone number'),
                          onChanged: (v) => _phone = v,
                        )
                      : _buildProfileRow('Phone number', _phone, onEdit: () => setState(() => _editing = true)),
                  if (_editing)
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => setState(() => _editing = false),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _editing = false;
                                  _showSuccess = true;
                                });
                                Future.delayed(const Duration(seconds: 2), () {
                                  if (mounted) setState(() => _showSuccess = false);
                                });
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_showSuccess)
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text('Full name successfully updated', style: TextStyle(color: Color(0xFF386641))),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(String label, String value, {VoidCallback? onEdit}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        if (onEdit != null)
          TextButton(
            onPressed: onEdit,
            child: const Text('Edit'),
          ),
      ],
    );
  }
} 