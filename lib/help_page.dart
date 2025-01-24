import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Help',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/rv_cabs.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Content
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildHelpItem(
                  context,
                  'About Us',
                  Icons.info_outline,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
                _buildHelpItem(
                  context,
                  'How it Works',
                  Icons.help_outline,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
                _buildHelpItem(
                  context,
                  'FAQ',
                  Icons.question_answer_outlined,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
                _buildHelpItem(
                  context,
                  'Privacy',
                  Icons.shield_outlined,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
                _buildHelpItem(
                  context,
                  'Terms and Conditions',
                  Icons.gavel_outlined,
                  isDarkMode,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isDarkMode,
  ) {
    return InkWell(
      onTap: () {
        // Handle tap event here if needed
        debugPrint('Tapped on $title');
      },
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
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isDarkMode ? Colors.white70 : Colors.black54,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
