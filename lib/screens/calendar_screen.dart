import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:taskat_apk/widgets/container_content.dart';
import 'package:timelines/timelines.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> valueNotifier = ValueNotifier(10);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xff18DAA3),
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/Calendars.png',
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          SizedBox(
                            height: 56,
                            width: 56,
                            child: SimpleCircularProgressBar(
                              progressStrokeWidth: 6,
                              backStrokeWidth: 8,
                              backColor: Color(0xffE2F6F1),
                              progressColors: [
                                const Color(0xff18DAA3),
                              ],
                              valueNotifier: valueNotifier,
                              mergeMode: false,
                              onGetText: (double value) {
                                return Text(
                                  '%${value.toInt()}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '2 شهریور',
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff1C1F2E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '10 تسک فعال در امروز',
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffBFC3C8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 12,
                        top: 20,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: EasyDateTimeLine(
                          locale: 'fa',
                          initialDate: DateTime.now(),
                          onDateChange: (selectedDate) {},
                          activeColor: const Color(0xff85A389),
                          dayProps: const EasyDayProps(
                            todayHighlightStyle:
                                TodayHighlightStyle.withBackground,
                            todayHighlightColor: Color(0xffE1ECC8),
                          ),
                        ),

                        // SizedBox(
                        //   height: 100,
                        //   child: DatePicker(
                        //     DateTime.now(),
                        //     selectionColor: Colors.black,
                        //     selectedTextColor: Colors.white,
                        //     locale: 'fa',
                        //     onDateChange: (date) {
                        //       // Convert the selected Gregorian date to Shamsi and update state
                        //       setState(() {});
                        //     },
                        //   ),
                        // ),
                        // CalendarTimeline(
                        //   initialDate: DateTime(2020, 4, 20),
                        //   firstDate: DateTime(2019, 1, 15),
                        //   lastDate: DateTime(2020, 11, 20),
                        //   onDateSelected: (date) => print(date),
                        //   leftMargin: 20,
                        //   monthColor: Colors.blueGrey,
                        //   dayColor: Colors.teal[200],
                        //   activeDayColor: Colors.white,
                        //   activeBackgroundDayColor: Colors.redAccent[100],
                        //   dotsColor: Color(0xFF333A47),
                        //   selectableDayPredicate: (date) => date.day != 23,
                        //   locale: 'fa',
                        // )
                      ),
                    ),
                  ),
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
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ContainerContentWidget();
                      },
                      childCount: 2,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              visible
                                  ? Image.asset(
                                      'assets/images/arrow-down.png',
                                      color: Colors.black,
                                    )
                                  : SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                          Image.asset('assets/images/up.png'),
                                    ),
                              Text(
                                'تسک‌های انجام شده',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  visible
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Opacity(
                                opacity: 0.3,
                                child: ContainerContentWidget(),
                              );
                            },
                            childCount: 2,
                          ),
                        )
                      : SliverToBoxAdapter(
                          child: Text(''),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
