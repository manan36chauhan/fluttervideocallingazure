import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.untitled1');
  static const String staticToken = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjYwNUVCMzFEMzBBMjBEQkRBNTMxODU2MkM4QTM2RDFCMzIyMkE2MTkiLCJ4NXQiOiJZRjZ6SFRDaURiMmxNWVZpeUtOdEd6SWlwaGsiLCJ0eXAiOiJKV1QifQ.eyJza3lwZWlkIjoiYWNzOjFjYjkyOTYwLTVmYjAtNGJmYS1hNTMxLWU1OTY5YzMwZWM2OV8wMDAwMDAyMC1kZTdlLTU2MmEtODVmNC0zNDNhMGQwMDE4YjgiLCJzY3AiOjE3OTIsImNzaSI6IjE3MTkwMzczNzUiLCJleHAiOjE3MTkxMjM3NzUsInJnbiI6ImFtZXIiLCJhY3NTY29wZSI6ImNoYXQsdm9pcCIsInJlc291cmNlSWQiOiIxY2I5Mjk2MC01ZmIwLTRiZmEtYTUzMS1lNTk2OWMzMGVjNjkiLCJyZXNvdXJjZUxvY2F0aW9uIjoidW5pdGVkc3RhdGVzIiwiaWF0IjoxNzE5MDM3Mzc1fQ.PIWcMhoLAslJhYNPokNbRxgLZLzKJ9Voix2DvRmiYrXe9yeyP73z7LysNxcgzZ6zeJfqyxXDnHvMWVvHCWoBhUqENdINQwUnKUuq9rWfmM-o_H8fqD3QbUle_oW89GX1YInNkkLJm27mT_Ks4wrq2sgSWHIM1f5BAaz_WXfnsbSYU3wO10YeULk7wtRVzDuYbffNLPDcoNqWLCQFpDgUenKIvWB53rq_nsg1CKCtDVFwgPuAYpMK82c3WWuauKxO_sMyk5QBxvydVgI_5i9rnpiEFt7d9ajg64-y-y63VPW6sFAKsRq__4sgDqVnnSRuSfMwPGL1Fxci3_Vxh-2ZIg';
 // static const String groupId = 'YOUR_GROUP_ID'; // Use a valid group ID

  Future<void> startCall() async {
    try {
      final String result = await platform.invokeMethod('startCall', {
        'token': staticToken,
       // 'groupId': groupId,
      });
      print(result);
    } on PlatformException catch (e) {
      print("Failed to start call: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azure Communication Services'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: startCall,
          child: Text('Start Call'),
        ),
      ),
    );
  }
}
