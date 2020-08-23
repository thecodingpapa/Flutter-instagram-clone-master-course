import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.amber,
            )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: common_gap),
                    child: TextFormField(
                      controller: _textEditingController,
                      cursorColor: Colors.black54,
                      decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: InputBorder.none),
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Input something';
                        else
                          return null;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //todo: push a comment
                    }
                  },
                  child: Text("Post"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
