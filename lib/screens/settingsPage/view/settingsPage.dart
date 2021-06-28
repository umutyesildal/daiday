import 'package:flutter/material.dart';
import 'view.dart';

class SettingsPage extends StatelessWidget {
  static String routeName = 'Settings Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              UsernameText(),
              SizedBox(
                height: 100,
              ),
              SpaceBetweenWidgets(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    leading: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageMoodsPage()));
                        },
                        child: ExpansionTileItem(
                          givenText: 'Moods',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ManageActivitiesPage()));
                        },
                        child: ExpansionTileItem(
                          givenText: 'Activities',
                        ),
                      ),
                      ExpansionTileItem(
                        givenText: 'Change Name',
                      ),
                      ExpansionTileItem(
                        givenText: 'Log Out',
                      ),
                      ExpansionTileItem(
                        givenText: 'Delete Account',
                      ),
                    ],
                  ),
                ),
              ),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    leading: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ExpansionTileItem(
                        givenText: 'Help & FAQ',
                      ),
                      ExpansionTileItem(
                        givenText: 'Contact Support',
                      ),
                      ExpansionTileItem(
                        givenText: 'Feedback',
                      ),
                    ],
                  ),
                ),
              ),
              DividerWithPadding(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    leading: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Legal",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ExpansionTileItem(
                        givenText: 'Privacy Policy',
                      ),
                      ExpansionTileItem(
                        givenText: 'Terms & Conditions',
                      ),
                      ExpansionTileItem(
                        givenText: 'Legal Notice',
                      ),
                      ExpansionTileItem(
                        givenText: 'Guidelines',
                      ),
                      ExpansionTileItem(
                        givenText: 'Licenses',
                      ),
                    ],
                  ),
                ),
              ),
              DividerWithPadding()
            ],
          ),
        ),
      ),
    );
  }
}

/// For now its only for Notifications.
class SettingsTextRow extends StatelessWidget {
  const SettingsTextRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 12, bottom: 12),
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DividerWithPadding extends StatelessWidget {
  const DividerWithPadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
}

class UsernameText extends StatelessWidget {
  const UsernameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Username',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SpaceBetweenWidgets extends StatelessWidget {
  const SpaceBetweenWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
