import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  Future<void> _showUploadOptions(BuildContext context) async {
    final isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Upload Document',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  // TODO: Implement camera functionality
                  // final ImagePicker picker = ImagePicker();
                  // await picker.pickImage(source: ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder),
                title: Text(
                  'Browse Files',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  // TODO: Implement file picking functionality
                  // await FilePicker.platform.pickFiles();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    final documents = [
      'Aadhar',
      'Driving License',
      'RC Book',
      'PUC',
      'Insurance',
    ];

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
          'Documents',
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
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: isDarkMode 
                      ? Colors.grey[800]?.withOpacity(0.9) 
                      : Colors.grey[200]?.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    documents[index],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),  // Changed from Icons.download to Icons.edit
                        onPressed: () {
                          // Handle edit
                        },
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                      IconButton(
                        icon: const Icon(Icons.upload),
                        onPressed: () => _showUploadOptions(context),
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                      IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          // Handle view
                        },
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

