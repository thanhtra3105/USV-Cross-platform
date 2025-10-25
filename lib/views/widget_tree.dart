import 'package:cross_platform_project/data/constants.dart';
import 'package:cross_platform_project/data/notifiers.dart';
import 'package:cross_platform_project/views/pages/home_page.dart';
import 'package:cross_platform_project/views/pages/profile_page.dart';
import 'package:cross_platform_project/views/pages/settings_page.dart';
import 'package:cross_platform_project/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USV Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstant.themeModeKey,
                isDarkModeNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                if (isDarkMode) {
                  return Icon(Icons.light_mode);
                } else {
                  return Icon(Icons.dark_mode);
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              title: Text('USV Dashboard'),
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            ListTile(title: Text('Overview')),
            ListTile(title: Text('Set Mission')),
            ListTile(title: Text('Dashboard')),
            ListTile(title: Text('Stream')),
          ],
        ),
      ),

      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
