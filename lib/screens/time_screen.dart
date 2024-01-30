import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

enum TappedItem {
  add,
  setting,
  timer,
  countdown,
}

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TappedItem tappedItem = TappedItem.countdown;
  final int _duration = 10;
  final CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add GestureDetector
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedItem = TappedItem.add;
                              });
                            },
                            child: _buildIconColumn("assets/images/Add.png",
                                tappedItem == TappedItem.add),
                          ),
                          SizedBox(width: 20),
                          // Setting GestureDetector
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedItem = TappedItem.setting;
                              });
                            },
                            child: _buildIconColumn("assets/images/Setting.png",
                                tappedItem == TappedItem.setting),
                          ),
                          Spacer(),
                          // Timer Text GestureDetector
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedItem = TappedItem.timer;
                              });
                            },
                            child: _buildTextColumn(
                                "زمان شمار", tappedItem == TappedItem.timer),
                          ),
                          SizedBox(width: 20),
                          // Countdown Text GestureDetector
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tappedItem = TappedItem.countdown;
                              });
                            },
                            child: _buildTextColumn("شمارنده معکوس",
                                tappedItem == TappedItem.countdown),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child: SizedBox(
                        height: 224,
                        width: 224,
                        child: CircularCountDownTimer(
                          // Countdown duration in Seconds.
                          duration: 20,

                          // Countdown initial elapsed Duration in Seconds.
                          initialDuration: 0,

                          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                          controller: _controller,

                          // Width of the Countdown Widget.
                          width: MediaQuery.of(context).size.width / 2,

                          // Height of the Countdown Widget.
                          height: MediaQuery.of(context).size.height / 2,

                          // Ring Color for Countdown Widget.
                          ringColor: Colors.grey[300]!,

                          // Ring Gradient for Countdown Widget.
                          ringGradient: null,

                          // Filling Color for Countdown Widget.
                          fillColor: Colors.purpleAccent[100]!,

                          // Filling Gradient for Countdown Widget.
                          fillGradient: null,

                          // Background Color for Countdown Widget.
                          backgroundColor: Colors.purple[500],

                          // Background Gradient for Countdown Widget.
                          backgroundGradient: null,

                          // Border Thickness of the Countdown Ring.
                          strokeWidth: 20.0,

                          // Begin and end contours with a flat edge and no extension.
                          strokeCap: StrokeCap.round,

                          // Text Style for Countdown Text.
                          textStyle: const TextStyle(
                            fontSize: 33.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                          // Format for the Countdown Text.
                          textFormat: CountdownTextFormat.S,

                          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                          isReverse: true,

                          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                          isReverseAnimation: false,

                          // Handles visibility of the Countdown Text.
                          isTimerTextShown: true,

                          // Handles the timer start.
                          autoStart: false,

                          // This Callback will execute when the Countdown Starts.
                          onStart: () {
                            // Here, do whatever you want
                            debugPrint('Countdown Started');
                          },

                          // This Callback will execute when the Countdown Ends.
                          onComplete: () {},

                          // This Callback will execute when the Countdown Changes.
                          onChange: (String timeStamp) {
                            // Here, do whatever you want
                            debugPrint('Countdown Changed $timeStamp');
                          },

                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              // only format for '0'
                              return "Start";
                            } else {
                              // other durations by it's default format
                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _button(
                            title: "Start",
                            onPressed: () => _controller.start(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          _button(
                            title: "Pause",
                            onPressed: () => _controller.pause(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          _button(
                            title: "Resume",
                            onPressed: () => _controller.resume(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          _button(
                            title: "Restart",
                            onPressed: () =>
                                _controller.restart(duration: _duration),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildIconColumn(String assetPath, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(assetPath),
        ),
        if (isSelected)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 25,
              height: 2,
              decoration: BoxDecoration(
                color: Color(0xff18DAA3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Column _buildTextColumn(String text, bool isSelected) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(text),
      if (isSelected)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 50, // Adjust the width as needed
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xff18DAA3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
    ],
  );
}
