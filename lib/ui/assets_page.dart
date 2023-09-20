import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/ui/assets_pair_page.dart';
import 'package:trading_app/utils/enums/pair_enum.dart';

class AnalysisListPage extends StatelessWidget {
  const AnalysisListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Pars.values.length,
          itemBuilder: (BuildContext context, int index) {
            List<Pars> pars = List.from(Pars.values);
            pars.shuffle();
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnalysisStatTradingPage(
                      pairForView: pars[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 29, 160, 136),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                "https://s3-symbol-logo.tradingview.com/country/${pars[index].name[3]}${pars[index].name[4]}.svg",
                              ),
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.network(
                              "https://s3-symbol-logo.tradingview.com/country/${pars[index].name[0]}${pars[index].name[1]}.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      pars[index].name,
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF).withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16);
          },
        ),
      ],
    );
  }
}
