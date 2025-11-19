import 'package:flutter/material.dart';
import 'constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          // FIX: Replaced DrawerHeader with a flexible Container to fix "Bottom Overflowed by 55 pixels"
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                // Logo placeholder
                Icon(Icons.cloud_circle, size: 50, color: Colors.redAccent),
                SizedBox(height: 10),
                Text("Adstacks Media",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=5"), // Mock image
                ),
                SizedBox(height: 10),
                Text("Pooja Mishra",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Admin",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          // Added a divider to keep the visual separation
          Divider(color: Colors.grey.shade200),

          _buildMenuItem(Icons.home, "Home", true),
          _buildMenuItem(Icons.people, "Employees", false),
          _buildMenuItem(Icons.access_time, "Attendance", false),
          _buildMenuItem(Icons.calendar_today, "Summary", false),
          _buildMenuItem(Icons.info_outline, "Information", false),
          ExpansionTile(
            leading: Icon(Icons.workspaces_outline),
            title: Text("WORKSPACES"),
            children: [
              ListTile(
                  title: Text("Adstacks"),
                  contentPadding: EdgeInsets.only(left: 60)),
              ListTile(
                  title: Text("Finance"),
                  contentPadding: EdgeInsets.only(left: 60)),
            ],
          ),
          _buildMenuItem(Icons.settings, "Setting", false),
          _buildMenuItem(Icons.logout, "Logout", false),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, bool isActive) {
    return ListTile(
      selected: isActive,
      selectedTileColor: kLightColor,
      leading: Icon(icon, color: isActive ? Colors.black : Colors.grey),
      title: Text(
        title,
        style: TextStyle(color: isActive ? Colors.black : Colors.grey),
      ),
      onTap: () {},
    );
  }
}
