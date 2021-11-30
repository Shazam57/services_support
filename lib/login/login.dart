import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1111.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Body(),
      ),
      appBar: AppBar(),
      
     // body: Body(),
    );
  }
}

///////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: <Widget>[
              Text(
                "Services Support",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "บริการทุกระดับ ประทับใจ...🖤",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SignForm() //
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 10),
          Image.asset("assets/images/MEE POONG GROUP-03 (1).png",
            height: 200,
            width: 200,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Username",
                // hintText: "Enter your ID",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Password",
                // hintText: "****",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              Text("จดจำรหัสผ่าน"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              width: 150,
              // ignore: deprecated_member_use
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Text(""),
        ],
      ),
    );
  }
}
