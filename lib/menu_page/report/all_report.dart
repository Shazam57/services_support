import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:intl/intl.dart';

class AllReport extends StatefulWidget {
  const AllReport({Key? key}) : super(key: key);

  @override
  _AllReportState createState() => _AllReportState();
}

class _AllReportState extends State<AllReport> {
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;
  TextEditingController wortsheetController = TextEditingController();
  String? _reportWork = 'Daily Report ' +
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  final LocalStorage storage = new LocalStorage('mee_report_app');
  String JobId = '';

  final _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // getNameCollection();
    JobId = storage.getItem('JobId');
    getWorkCollection();
  }

  Future<List<dynamic>?> getWorkCollection() async {
    // Get docs from collection reference
    QuerySnapshot queryWorkSnapshot = await _fireStore
        .collection('worksheet')
        .where('updateBy', whereIn: [_currentUserId]).get();

    QuerySnapshot querySnapshot = await _fireStore
        .collection('work')
        .where('updateBy', whereIn: [_currentUserId]).get();

    QuerySnapshot querySnapshot1 = await _fireStore
        .collection('user')
        .where('uid', whereIn: [_currentUserId]).get();
    final Team =
        querySnapshot1.docs[querySnapshot1.docs.length - 1].get('Team');
    setState(() {
      _reportWork = _reportWork.toString() + '\nTeam: ' + Team;
    });

    QuerySnapshot querySnapshot2 = await _fireStore
        .collection('name')
        .where('updateBy', whereIn: [_currentUserId]).get();
    querySnapshot2.docs.map((doc) {
      setState(() {
        _reportWork =
            _reportWork.toString() + '\n' + 'ชื่อ: ' + doc.get('name');
      });
      return doc.data();
    }).toList();

    int indexCM = 0;
    querySnapshot.docs.map((doc) {
      print(doc.data());
      if (doc.get('Type') == 'CM') {
        setState(() {
          indexCM += 1;
        });
      }
      return doc.data();
    }).toList();

    setState(() {
      _reportWork = _reportWork.toString() + '\nจำนวนงานรวม $indexCM งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== CM ===';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Indoor: $indexCM งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Outdoor: 0 งาน';
    });

    int index = 0;
    querySnapshot.docs.map((doc) {
      print(doc.data());
      if (doc.get('Type') == 'CM') {
        index += 1;
        setState(() {
          _reportWork = _reportWork.toString() +
              '\n$index.Sub type: \n' +
              doc.get('ProblemCase') +
              '\n'
                  'Detail: ' +
              doc.get('JobDetail');
        });
      }
      return doc.data();
    }).toList();

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== PM ===';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Indoor: 0 งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Outdoor: 0 งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== Activity ===';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Indoor: 0 งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Outdoor: 0 งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== Material ===';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'เทปมัน 0 เทปละลาย 0';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== Work At Height ===';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + '0 งาน';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n=== งานค้าง ===';
    });

    final TextEndJob = queryWorkSnapshot
        .docs[queryWorkSnapshot.docs.length - 1]
        .get('TextEndJob');
    setState(() {
      _reportWork =
          _reportWork.toString() + '\n' + '$TextEndJob';
    });


    final CriticalEndJob = queryWorkSnapshot
        .docs[queryWorkSnapshot.docs.length - 1]
        .get('CriticalEndJob');
    setState(() {
      _reportWork =
          _reportWork.toString() + '\n' + 'Critical = $CriticalEndJob';
    });

    final MajorEndJob = queryWorkSnapshot
        .docs[queryWorkSnapshot.docs.length - 1]
        .get('MajorEndJob');
    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Mojor = $MajorEndJob';
    });

    final MinorEndJob = queryWorkSnapshot
        .docs[queryWorkSnapshot.docs.length - 1]
        .get('MinorEndJob');
    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'Minor = $MinorEndJob';
    });

    final NoneEndJob = queryWorkSnapshot.docs[queryWorkSnapshot.docs.length - 1]
        .get('NoneEndJob');
    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'None = $NoneEndJob';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'อุปกร์ที่ใช้';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n' + 'AP Ru';
    });

    wortsheetController.text = _reportWork.toString();
    // print(querySnapshot.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                controller: wortsheetController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: 20,
                // controller: Data2,
              ),
            ),
            RaisedButton(
              child: Text("Copy Report"),
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: wortsheetController.text));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarFb5(
        i: 5,
      ),
    );
  }
}
