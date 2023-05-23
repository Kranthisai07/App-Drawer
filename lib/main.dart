import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyber Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Cyber Services'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DrawerHeader(),
                const SizedBox(
                  height: 16.0,
                ),
                DrawerNavigationItem(
                  iconData: Icons.woman_2_outlined,
                  title: "Report Women/Children Related Crime",
                  onTap: () {},
                  selected: true,
                ),
                DrawerNavigationItem(
                  iconData: Icons.report_rounded,
                  title: "Report Cyber Crime",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Report Cyber Crime");
                    }));
                  },
                  selected: false,
                ),
                DrawerNavigationItem(
                  iconData: Icons.track_changes_outlined,
                  title: "Track your Complaint",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Track your Complaint");
                    }));
                  },
                  selected: false,
                ),
                DrawerNavigationItem(
                  iconData: Icons.volunteer_activism,
                  title: "Cyber Volunteers",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Cyber Volunteers");
                    }));
                  },
                  selected: false,
                ),
                const Divider(
                  thickness: 1.0,
                ),
                DrawerNavigationItem(
                  iconData: Icons.book_outlined,
                  title: "Resources",
                  selected: false,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Resources");
                    }));
                  },
                ),
                DrawerNavigationItem(
                  iconData: Icons.call,
                  title: "Contact Us",
                  selected: false,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Screens(title: "Contact Us");
                    }));
                  },
                ),
                DrawerNavigationItem(
                  iconData: Icons.support_agent_outlined,
                  title: "Helpline",
                  selected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Cyber Security Services"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filing a Complaint on National Cyber Crime Reporting Portal",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                child: Text("File a Complaint"),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerNavigationItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool selected;
  final Function() onTap;
  const DrawerNavigationItem({
    Key? key,
    required this.iconData,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      leading: Icon(iconData),
      onTap: onTap,
      title: Text(title),
      selectedTileColor: Colors.blueAccent.shade100,
      selected: selected,
      selectedColor: Colors.black87,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35,
          backgroundImage: NetworkImage(
            "https://www.mha.gov.in/sites/default/files/WSDiv_MHAlogo_08112019.jpg",
          ),
        ),
        Text(
          "Cyber Security Services",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
class Screens extends StatelessWidget {
  final String title;

  const Screens({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
