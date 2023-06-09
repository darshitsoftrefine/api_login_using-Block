import 'package:cart_using_block/adress_bloc/address_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../adress_bloc/address_bloc.dart';
import '../adress_bloc/address_state.dart';
import '../data/model.dart';

class AddressPage extends StatefulWidget {

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  late AddressBloc addressBloc;


  @override
  void initState() {
    addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.add(FetchAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupinos Address..'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
            if (state is AddressInitialState) {
              return _buildLoading();
            } else if (state is AddressLoadingState) {
              return _buildLoading();
            } else if (state is AddressLoadedState) {
              return _contactList(state.adrDetails as Address);
            } else if (state is AddressErrorState) {
              return _buildError();
            } else {
              throw Exception();
            }
          }),
        ),
      ),
    );
  }
}
Widget _buildLoading() {
  return Center(
    child: Column(
      children: [
        CircularProgressIndicator(),
        Text('Please Wait for a Minute', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
      ],
    ),
  );
}

Widget _contactList(Address adrDetails) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text("Residential Details", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5.0,
                    child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 9),
                                        child: Text("Country:- "+
                                            adrDetails.country,
                                          style: TextStyle(
                                              fontSize: 25, fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text("City- "+
                                          adrDetails.city,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text("Street:- "+
                                          adrDetails.street,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Text("Date of Birth:- "+
                                         adrDetails.postalCode,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        )),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("Click Here to see Tariff Details"))
                ],
              );
            }),
      ),
    ),
  );
}

Widget _buildError() {
  return Center(child: Text('No Data Available'));
}
