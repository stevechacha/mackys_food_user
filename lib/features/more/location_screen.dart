import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> _addresses = [
    'Sutaka, P.O.W Mafemi Crescent, Abuja, Nigeria',
    'Sutaka 21, 212 P.O.W Mafemi along Crescent, Alade, Nigeria',
  ];
  int? _selectedIndex = 0;
  bool _locationNotFound = false;
  final TextEditingController _addressController = TextEditingController();

  void _addAddress() {
    if (_addressController.text.isNotEmpty) {
      setState(() {
        _addresses.add(_addressController.text);
        _addressController.clear();
        _selectedIndex = _addresses.length - 1;
      });
      Navigator.of(context).pop();
    }
  }

  void _showAddAddressDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add address'),
        content: TextField(
          controller: _addressController,
          decoration: const InputDecoration(hintText: 'Enter address'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ElevatedButton(onPressed: _addAddress, child: const Text('Add address')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Delivery address', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _locationNotFound
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_off, size: 60, color: Colors.grey.shade400),
                    const SizedBox(height: 8),
                    const Text('Location not found', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    const Text('Your location couldn\'t be found', style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _showAddAddressDialog,
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF386641)),
                      child: const Text('Add address'),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(hintText: 'Enter address'),
                          onTap: _showAddAddressDialog,
                          readOnly: true,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_location_alt_outlined, color: Color(0xFF386641)),
                        onPressed: _showAddAddressDialog,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_addresses.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.location_off, size: 60, color: Colors.grey.shade400),
                          const SizedBox(height: 8),
                          const Text('Location not found', style: TextStyle(color: Colors.black54, fontSize: 16)),
                          const Text('Your location couldn\'t be found', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: _addresses.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: _selectedIndex == index ? const Color(0xFF386641) : Colors.grey,
                            ),
                            title: Text(_addresses[index]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_selectedIndex == index)
                                  const Icon(Icons.check_circle, color: Color(0xFF386641)),
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.grey),
                                  onPressed: () {
                                    _addressController.text = _addresses[index];
                                    _showAddAddressDialog();
                                  },
                                ),
                              ],
                            ),
                            selected: _selectedIndex == index,
                            onTap: () => setState(() => _selectedIndex = index),
                          );
                        },
                      ),
                    ),
                ],
              ),
      ),
    );
  }
} 