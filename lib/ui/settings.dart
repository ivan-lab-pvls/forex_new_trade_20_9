import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final InAppReview inAppReview = InAppReview.instance;

class SettingsListPage extends StatelessWidget {
  const SettingsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            inAppReview.openStoreListing(appStoreId: '6467123708');
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * .9,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 160, 136),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Rate app",
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF).withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UiViewSettings(
                          url:
                              'https://docs.google.com/document/d/1ECkr13MXcSZRzh5HLCodJXK4IQ77yfGR8xcjXKNlfaw/edit?usp=sharing',
                          name: 'Privacy Policy',
                        )));
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * .9,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 160, 136),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Privacy Policy",
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF).withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UiViewSettings(
                          url:
                              'https://docs.google.com/document/d/143pSUGfaUc7lWb11FBrb3yP5r7_iViTsP7KsKHgJodU/edit?usp=sharing',
                          name: 'Terms & Conditions',
                        )));
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * .9,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 160, 136),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Terms & Conditions",
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF).withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UiViewSettings(
                          url: 'https://forms.gle/iq7Ng8WN33DpiMyU8',
                          name: 'Support',
                        )));
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * .9,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 160, 136),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Need Help?",
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF).withOpacity(1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: MediaQuery.sizeOf(context).width * .9,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 29, 160, 136),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Turn off notifications",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFFFFF).withOpacity(1),
                ),
              ),
              StreamBuilder(
                  stream: RxSharedPreferences.getInstance()
                      .getBoolStream("turnOfNotifications"),
                  builder: (context, snapshot) {
                    return CupertinoSwitch(
                      onChanged: (value) async {
                        await RxSharedPreferences.getInstance()
                            .setBool("turnOfNotifications", value);
                      },
                      value: snapshot.data ?? false,
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class UiViewSettings extends StatelessWidget {
  late String url;
  late String name;
  // ignore: use_key_in_widget_constructors
  UiViewSettings({required this.url, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 227, 217),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(url),
        ),
      ),
    );
  }
}
