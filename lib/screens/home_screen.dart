import 'package:family_care_app/components/bottom_button.dart';
import 'package:family_care_app/components/default_button.dart';
import 'package:family_care_app/components/icon_content.dart';
import 'package:family_care_app/components/instant_message.dart';
import 'package:family_care_app/components/reusable_card.dart';
import 'package:family_care_app/components/round_icon_button.dart';
import 'package:family_care_app/screens/login_screen.dart';
import 'package:family_care_app/screens/new_user_screen.dart';
import 'package:family_care_app/services/storage/storage_auth_out_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isUserLogged = false;

  @override
  void initState() {
    super.initState();

    StorageAuthOutputData()
        .isUserLogged()
        .then((value) => _isUserLogged = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Family Care',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(
            visible: !_isUserLogged,
            child: Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: DefaultButton(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewUserScreen())),
                  iconData: FontAwesomeIcons.userPlus,
                  label: 'NEW USER',
                )),
                Expanded(
                    child: DefaultButton(
                  onTap: () {
                    var future = Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    future.then((value) {
                      setState(() {
                        _isUserLogged = value;
                      });
                    });
                  },
                  iconData: FontAwesomeIcons.signInAlt,
                  label: 'LOGIN',
                )),
              ],
            )),
          ),
          Visibility(
            visible: _isUserLogged,
            child: Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: DefaultButton(
                  onTap: () => {},
                  iconData: FontAwesomeIcons.pills,
                  label: 'MY MEDICINES',
                )),
                Expanded(
                    child: DefaultButton(
                  onTap: () => setState(() {
                    StorageAuthOutputData().reset();
                    setState(() {
                      _isUserLogged = false;
                    });
                    InstantMessage.infoIcon(context, 'We already miss you!',
                        Icon(FontAwesomeIcons.sadCry, color: Colors.yellowAccent,));
                  }),
                  iconData: FontAwesomeIcons.signOutAlt,
                  label: 'LOGOUT',
                )),
              ],
            )),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: DefaultButton(
                onTap: () {},
                iconData: FontAwesomeIcons.heart,
                label: 'ABOUT',
              )),
              Expanded(
                  child: DefaultButton(
                onTap: () {},
                iconData: FontAwesomeIcons.headset,
                label: 'CONTACT',
              )),
            ],
          )),
          // Expanded(
          //     child: Row(
          //       children: <Widget>[
          //         Expanded(
          //             child: ReusableCard(
          //               color: kActiveCardColor,
          //               cardChild: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: <Widget>[
          //                   Text(
          //                     'WEIGHT',
          //                     style: kLabelTextStyle,
          //                   ),
          //                   Text(
          //                     _weight.toString(),
          //                     style: kNumberTextStyle,
          //                   ),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       RoundIconButton(
          //                         iconData: FontAwesomeIcons.minus,
          //                         onPressed: () {
          //                           setState(() {
          //                             _weight--;
          //                           });
          //                         },
          //                       ),
          //                       SizedBox(
          //                         width: 10.0,
          //                       ),
          //                       RoundIconButton(
          //                         iconData: FontAwesomeIcons.plus,
          //                         onPressed: () {
          //                           setState(() {
          //                             _weight++;
          //                           });
          //                         },
          //                       )
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             )),
          //         Expanded(
          //             child: ReusableCard(
          //               color: kActiveCardColor,
          //               cardChild: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: <Widget>[
          //                   Text(
          //                     'AGE',
          //                     style: kLabelTextStyle,
          //                   ),
          //                   Text(
          //                     _age.toString(),
          //                     style: kNumberTextStyle,
          //                   ),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: <Widget>[
          //                       RoundIconButton(
          //                         iconData: FontAwesomeIcons.minus,
          //                         onPressed: () {
          //                           setState(() {
          //                             _age--;
          //                           });
          //                         },
          //                       ),
          //                       SizedBox(
          //                         width: 10.0,
          //                       ),
          //                       RoundIconButton(
          //                         iconData: FontAwesomeIcons.plus,
          //                         onPressed: () {
          //                           setState(() {
          //                             _age++;
          //                           });
          //                         },
          //                       )
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ))
          //       ],
          //     )),
        ],
      ),
    );
  }
}
