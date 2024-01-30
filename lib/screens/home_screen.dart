import 'dart:ffi';
import 'package:dynamic_timeline/dynamic_timeline.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:taskat_apk/widgets/container_content.dart';
import 'package:taskat_apk/widgets/time_line.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> timeLabels = [
    'همه',
    '00:00 AM',
    '01:00 AM',
    '02:00 AM',
    '03:00 AM',
    '04:00 AM',
    '05:00 AM',
    '06:00 AM',
    '07:00 AM',
    '08:00 AM',
  ];
  int selectedEventIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 26,
                      width: 85,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2F6F1),
                        borderRadius: BorderRadius.circular(
                          14,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          '20 تسک فعال',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff18DAA3),
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/hand.png',
                              fit: BoxFit.fill,
                            ),
                            const Text(
                              ' محمد جواد',
                              style: TextStyle(
                                color: Color(0xff18DAA3),
                              ),
                            ),
                            const Text(
                              'سلام ، ',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          '2 شهریور',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xffBFC3C8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Image.asset(
                        'assets/images/Intersect.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 24,
                ),
                child: SizedBox(
                  height: 46,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/Shape.png'),
                          const Spacer(),
                          const Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                hintText: '... جستحوی تسکات',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('assets/images/Search.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: [
                    Text(
                      'مشاهده بیشتر',
                      style: TextStyle(
                        color: Color(0xff18DAA3),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'دسته بندی',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SizedBox(
                  height: 164,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Image.asset('assets/images/train.png');
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: [
                    Text(
                      'مشاهده بیشتر',
                      style: TextStyle(
                        color: Color(0xff18DAA3),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'تسک های امروز',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // SimpleTimeline widget
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: SizedBox(
                  height: 70,
                  child: Timeline.tileBuilder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    builder: TimelineTileBuilder.fromStyle(
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          timeLabels[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              //   child: SimpleTimeline(
              //     selectedEventIndex: selectedEventIndex,
              //     onEventTap: (index) {
              //       setState(() {
              //         selectedEventIndex = index;
              //       });
              //     },
              //   ),
              // ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ContainerContentWidget();
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
