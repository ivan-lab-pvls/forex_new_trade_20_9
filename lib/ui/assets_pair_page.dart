import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/utils/enums/pair_enum.dart';

class AnalysisStatTradingPage extends StatelessWidget {
  final Pars pairForView;
  const AnalysisStatTradingPage({
    Key? key,
    required this.pairForView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 72, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 72, 18),
        elevation: 0,
        centerTitle: true,
        title: Text(
          pairForView.name,
          style: GoogleFonts.dmSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFFFFF).withOpacity(1),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).width,
            width: MediaQuery.sizeOf(context).width,
            child: InAppWebView(
              initialData: InAppWebViewInitialData(
                  data: """<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_e8211"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "FX:${pairForView.name}",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_e8211"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->"""),
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              List<Pars> forexPairs = Pars.values
                  .where((element) => element != pairForView)
                  .take(4)
                  .toList();
              forexPairs.shuffle();
              return CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AnalysisStatTradingPage(
                        pairForView: forexPairs[index],
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
                                  "https://s3-symbol-logo.tradingview.com/country/${forexPairs[index].name[3]}${forexPairs[index].name[4]}.svg",
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
                                "https://s3-symbol-logo.tradingview.com/country/${forexPairs[index].name[0]}${forexPairs[index].name[1]}.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        forexPairs[index].name,
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
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
          ),
        ],
      ),
    );
  }
}
