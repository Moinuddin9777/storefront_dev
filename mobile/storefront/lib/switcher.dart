//   void simulateSwitches(int switchCount, List<bool> initialStates) {
//   List<bool> switches = initialStates;
//   bool masterSwitch = initialStates.every((switchState) => switchState);

//   void updateMasterSwitch() {
//     masterSwitch = switches.every((switchState) => switchState);
//   }

//   void toggleSwitch(int index) {
//     switches[index] = !switches[index];
//     updateMasterSwitch();
//   }

//   void toggleMasterSwitch() {
//     masterSwitch = !masterSwitch;
//     for (int i = 0; i < switches.length; i++) {
//       switches[i] = masterSwitch;
//     }
//   }

//   // Example usage:
//   toggleSwitch(2);
// //   toggleSwitch(4);
// //   toggleMasterSwitch();

//   print(switches); // Output: [true, false, true, false, true]
//   print(masterSwitch); // Output: false
// }

//   void main() {
//     List<bool> switches = [false, false, true];
//     simulateSwitches(switches.length, switches );
// }

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> mySwitches = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biz Logic"),
      ),
      body: Center(
        child: SwitchSimulator(
            switchCount: mySwitches.length, initialStates: mySwitches),
      ),
    );
  }
}

class SwitchSimulator extends StatefulWidget {
  final int switchCount;
  final List<bool> initialStates;

  const SwitchSimulator({
    Key? key,
    required this.switchCount,
    required this.initialStates,
  }) : super(key: key);

  @override
  _SwitchSimulatorState createState() => _SwitchSimulatorState();
}

class _SwitchSimulatorState extends State<SwitchSimulator> {
  List<bool> switches = [];
  bool masterSwitch = false;

  @override
  void initState() {
    super.initState();
    switches = List.from(widget.initialStates);
    masterSwitch = switches.every((switchState) => switchState);
  }

  void toggleSwitch(int index) {
    setState(() {
      switches[index] = !switches[index];
      updateMasterSwitch();
    });
  }

  void toggleMasterSwitch() {
    setState(() {
      masterSwitch = !masterSwitch;
      for (int i = 0; i < switches.length; i++) {
        switches[i] = masterSwitch;
      }
    });
  }

  void updateMasterSwitch() {
    setState(() {
      masterSwitch = switches.every((switchState) => switchState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
//         Row(
//           children: switches.mapIndexed((index, switchState) {
//             return Switch(
//               key: Key('switch_$index'),
//               value: switchState,
//               onChanged: (value) => toggleSwitch(index),
//             );
//           }).toList(),
//         ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            itemBuilder: (context, index) => Switch(
              key: Key('switch_$index'),
              value: switches[index],
              onChanged: (value) => toggleSwitch(index),
            ),
            itemCount: switches.length,
          ),
        ),
        Switch(
          value: masterSwitch,
          onChanged: (value) => toggleMasterSwitch(),
        ),
      ],
    );
  }
}

// class SwitchSimulator extends StatefulWidget {
//   final int switchCount;
//   final List<bool> initialStates;

//   const SwitchSimulator({
//     Key? key,
//     required this.switchCount,
//     required this.initialStates,
//   }) : super(key: key);

//   @override
//   _SwitchSimulatorState createState() => _SwitchSimulatorState();
// }

// class _SwitchSimulatorState extends State<SwitchSimulator> {
//   List<bool> switches = [];
//   bool masterSwitch = false;

//   @override
//   void initState() {
//     super.initState();
//     switches = List.from(widget.initialStates);
//     masterSwitch = switches.every((switchState) => switchState);
//   }

//   void toggleSwitch(int index) {
//     setState(() {
//       switches[index] = !switches[index];
//       updateMasterSwitch();
//     });
//   }

//   void toggleMasterSwitch() {
//     setState(() {
//       masterSwitch = !masterSwitch;
//       for (int i = 0; i < switches.length; i++) {
//         switches[i] = masterSwitch;
//       }
//     });
//   }

//   void updateMasterSwitch() {
//     setState(() {
//       masterSwitch = switches.every((switchState) => switchState);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: switches.map((switchState) {
//             return Switch(
//               value: switchState,
//               onChanged: (value) => toggleSwitch(switches.indexOf(switchState)),
//             );
//           }).toList(),
//         ),
//         Switch(
//           value: masterSwitch,
//           onChanged: (value) => toggleMasterSwitch(),
//         ),
//       ],
//     );
//   }
// }
