import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';
import '../bloc/contact_state.dart';
import '../data/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ContactBloc contactBloc;

  @override
  void initState() {
    contactBloc = BlocProvider.of<ContactBloc>(context);
    contactBloc.add(FetchContactEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupinos Contact..'),
      ),
      body: Container(
        child: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
          if (state is ContactInitialState) {
            return _buildLoading();
          } else if (state is ContactLoadingState) {
            return _buildLoading();
          } else if (state is ContactLoadedState) {
            return _foodList(state.contDetails as ContactPerson);
          } else if (state is ContactErrorState) {
            return _buildError();
          } else {
            throw Exception();
          }
        }),
      ),
    );
  }
}

//Widgets...
Widget _buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _foodList(ContactPerson contDetails) {
  return Container(
    child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 90,
                      width: 100,
                      child: Image.network(
                        contDetails.profilePic,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 9),
                                child: Text(
                                  contDetails.title,
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                contDetails.email,
                                style: TextStyle(color: Colors.brown, fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                contDetails.dob.year as String,
                                style: TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            )
                          ],
                        ))
                  ],
                )),
          );
        }),
  );
}

Widget _buildError() {
  return Center(child: Text('No Data Available'));
}