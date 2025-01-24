import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'drawer_menu.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/rv_cabs.png',
                fit: BoxFit.contain,  // Changed from BoxFit.cover to BoxFit.contain
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Support',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // For balance
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildContactItem(
                          context,
                          'Call Us',
                          '1234567890',
                          Icons.phone,
                          isDarkMode,
                          onTap: () {}, // Empty onTap
                        ),
                        const SizedBox(height: 16),
                        _buildContactItem(
                          context,
                          'WhatsApp',
                          '1234567890',
                          Icons.chat_bubble_outline,
                          isDarkMode,
                          onTap: () {}, // Empty onTap
                        ),
                        const SizedBox(height: 16),
                        _buildContactItem(
                          context,
                          'Grievance Ticket',
                          'Grievance Ticket',
                          Icons.confirmation_number_outlined,
                          isDarkMode,
                          onTap: () {
                            // Handle grievance ticket
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildContactItem(
                          context,
                          'Email Us',
                          'rv@cabs.com',
                          Icons.email_outlined,
                          isDarkMode,
                          onTap: () {}, // Empty onTap
                        ),
                        const Spacer(flex: 2), // Increased flex for more space
                        GestureDetector(
                          onTap: () {}, // Empty onTap for SOS
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'SOS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 1), // Added bottom spacing
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    bool isDarkMode, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode 
              ? Colors.grey[800]?.withOpacity(0.9) 
              : Colors.grey[200]?.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 16),
            Expanded(  // Added Expanded
              child: Text(
                value,
                textAlign: TextAlign.center,  // Center-aligned text
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 40),  // Added to balance the icon space
          ],
        ),
      ),
    );
  }
}

