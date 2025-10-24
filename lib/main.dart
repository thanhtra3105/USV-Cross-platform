// import 'package:flutter/material.dart';

// void main() {
//   runApp(ButtonStateApp());
// }

// class ButtonStateApp extends StatefulWidget {
//   const ButtonStateApp({super.key});

//   @override
//   State<ButtonStateApp> createState() => _ButtonStateApp();
// }

// class _ButtonStateApp extends State<ButtonStateApp> {
//   void onPress() {
//     print("Da nhan nut");
//   }

//   final TextEditingController _username = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   bool _sw = false;
//   bool _checkbox = false;
//   List<String> groupVal = ["a", "b", "c"];
//   String _choice = "A";
//   double _slider = 0;
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       print("Hợp lệ");
//       print(_username.text);
//       print(_password.text);
//     }
//   }

//   String? error;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Button State App",
//       home: Scaffold(
//         appBar: AppBar(title: Text("fshif")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: onPress,
//                 child: Text("ElevatedButton"),
//                 // style: ElevatedButton.styleFrom(iconColor: Color(Colors.yellow)),
//               ),
//               TextButton(
//                 onPressed: () {
//                   print("Text button");
//                 },
//                 child: Text("Text button"),
//               ),
//               OutlinedButton(
//                 onPressed: () => print("Outline button"),
//                 child: Text("Outline"),
//               ),
//               IconButton(
//                 icon: Icon(Icons.favorite, color: Colors.red),
//                 onPressed: () => print("To iu Thi nhiu lem"),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {},
//                     child: Icon(Icons.skip_previous, color: Colors.green[300]),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       print("pause");
//                     },
//                     child: Icon(Icons.pause, color: Colors.green[300]),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {},
//                     backgroundColor: Colors.amber[100],
//                     child: Icon(Icons.skip_next, color: Colors.green[300]),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextFormField(
//                         controller: _username,
//                         decoration: InputDecoration(
//                           labelText: "Tên người dùng",
//                         ),
//                         textInputAction: TextInputAction.next,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Không được để tên người dùng trống";
//                           }
//                         },
//                       ),
//                       TextFormField(
//                         controller: _password,
//                         decoration: InputDecoration(labelText: "Mật khẩu"),

//                         validator: (value) {
//                           if (value == null || value.length < 8) {
//                             return "Mật khẩu phải có ít nhất 8 kí tự";
//                           }
//                         },
//                         onFieldSubmitted: (_) => _login(),
//                       ),
//                       ElevatedButton(onPressed: _login, child: Text("Sign in")),
//                     ],
//                   ),
//                 ),
//               ),
//               // Switch
//               Switch(
//                 padding: EdgeInsets.all(10),
//                 value: _sw,
//                 onChanged: (v) {
//                   setState(() => _sw = v);
//                   print(_sw);
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Checkbox(
//                     value: _checkbox,
//                     checkColor: Colors.red,
//                     // title: Text("Tôi đồng ý với các điều khoản"),
//                     // controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (v) {
//                       setState(() => _checkbox = v ?? false);
//                       print(_checkbox);
//                     },
//                   ),
//                   Text("Toi dong y voi dieu khoan"),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Radio(
//                     value: "A",
//                     groupValue: _choice,
//                     onChanged: (v) {
//                       setState(() {
//                         _choice = v!;
//                       });
//                       print(_choice);
//                     },
//                   ),
//                   Radio(
//                     value: "B",
//                     groupValue: _choice,
//                     onChanged: (v) {
//                       setState(() {
//                         _choice = v!;
//                       });
//                       print(_choice);
//                     },
//                   ),
//                   Radio(
//                     value: "C",
//                     groupValue: _choice,
//                     onChanged: (v) {
//                       setState(() {
//                         _choice = v!;
//                       });
//                       print(_choice);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//                 width: 500,
//                 child: Slider(
//                   value: _slider,
//                   label: _slider.toString(),
//                   min: 0,
//                   max: 100,
//                   divisions: 10,
//                   onChanged: (v) {
//                     setState(() {
//                       _slider = v;
//                     });
//                     print(_slider);
//                   },
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => print("Tapped"),
//                 onDoubleTap: () => print("Double tapped"),
//                 onTapCancel: () => print("tap cancle"),

//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   padding: EdgeInsets.all(10),
//                   color: Colors.blue,
//                   child: Text("tap"),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => print("InkWell tapped"),
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   child: Text("Inkwell"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.home),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: FutureBuilderApp()));

// class FutureBuilderDemo extends StatelessWidget {
//   const FutureBuilderDemo({super.key});

//   // Mô phỏng 1 hàm async (như request mạng, load dữ liệu...)
//   Future<String> _loadData() async {
//     await Future.delayed(const Duration(seconds: 3)); // delay 3s
//     // return "Dữ liệu đã tải xong ✅";
//     throw Exception("Không tải được dữ liệu ❌"); // thử bật lỗi
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("FutureBuilder Demo Cơ bản")),
//       body: Center(
//         child: FutureBuilder<String>(
//           future: _loadData(), // Future
//           builder: (context, snapshot) {
//             // 1️⃣ Đang chờ dữ liệu
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 10),
//                   Text("Đang tải dữ liệu..."),
//                 ],
//               );
//             }
//             // 2️⃣ Nếu có lỗi
//             else if (snapshot.hasError) {
//               return Text(
//                 "Lỗi: ${snapshot.error}",
//                 style: const TextStyle(color: Colors.red),
//               );
//             }
//             // 3️⃣ Nếu có dữ liệu
//             else if (snapshot.hasData) {
//               return Text(
//                 "Kết quả: ${snapshot.data}",
//                 style: const TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                 ),
//               );
//             }
//             // 4️⃣ Nếu không có dữ liệu
//             else {
//               return const Text("Không có dữ liệu để hiển thị.");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: FutureBuilderApp()));

// class FutureBuilderApp extends StatefulWidget {
//   const FutureBuilderApp({super.key});
//   @override
//   State<FutureBuilderApp> createState() => _FutureBuilderApp();
// }

// class _FutureBuilderApp extends State<FutureBuilderApp> {
//   Future<String> _loadData() async {
//     await Future.delayed(Duration(seconds: 2));
//     return "Thanh tra";
//     // throw Exception("Khong tai duoc data");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Future Builder Demo")),
//       body: Center(
//         child: FutureBuilder(
//           future: _loadData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     child: Text("Loading..."),
//                   ),
//                 ],
//               );
//             } else if (snapshot.hasError) {
//               return Text(
//                 "Loi: ${snapshot.error}",
//                 style: TextStyle(color: Colors.red),
//               );
//             } else if (snapshot.hasData) {
//               return Text("Ket qua: ${snapshot.data}");
//             } else {
//               return Text("Khong co data");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'pages/dashboardPage.dart';
import 'pages/missionPage.dart';
import 'pages/overviewPage.dart';
import 'pages/streamPage.dart';

void main() {
  runApp(USVApp());
}

class USVApp extends StatefulWidget {
  const USVApp({super.key});

  @override
  State<USVApp> createState() => _USVApp();
}

class _USVApp extends State<USVApp> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USV App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: MainHome(
        isDark: _isDark,
        onThemeToggle: () {
          setState(() {
            _isDark = !_isDark;
          });
        },
      ),
    );
  }
}

class MainHome extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  const MainHome({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });
  @override
  State<MainHome> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  String selectedPage = "Dashboard";
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (selectedPage) {
      case "Mission":
        body = const MissionPage();
        break;
      case "Dashboard":
        body = const DashboardPage();
        break;
      case "Stream":
        body = const StreamPage();
        break;
      default:
        body = const OverviewPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("USV - $selectedPage"),
        actions: [
          IconButton(
            onPressed: widget.onThemeToggle,
            icon: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "USV Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text("Overview"),
              onTap: () {
                setState(() {
                  selectedPage = "Overview";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("Mission"),
              onTap: () {
                setState(() {
                  selectedPage = "Mission";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("Dashboard"),
              onTap: () {
                setState(() {
                  selectedPage = "Dashboard";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: const Text("Stream"),
              onTap: () {
                setState(() {
                  selectedPage = "Stream";
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          print(_currentIndex);
          selectedPage = (_currentIndex == 0) ? "Home" : "Setting";
          print(selectedPage);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
