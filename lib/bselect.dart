//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SamcoBusinessSelector extends StatefulWidget {
  final Function(String) onCategorySelected;

  const SamcoBusinessSelector({
    Key key,
    this.onCategorySelected,
  }) : super(key: key);

  _SamcoBusinessSelectorState createState() => _SamcoBusinessSelectorState();
}

class _SamcoBusinessSelectorState extends State<SamcoBusinessSelector> {
  List<String> businessCategories;

  String selecetdBCategory;

  @override
  Widget build(BuildContext context) {
    return 
    //StreamBuilder(
      // stream: Firestore.instance.collection("business_types").snapshots(),
      // builder: (BuildContext c, AsyncSnapshot<QuerySnapshot> snapshot) {
      //   if (!snapshot.hasData) {
      //     debugPrint("business_selector build Error:No Data\n");
      //     return Container();
      //   }

      //   if (snapshot.hasError) {
      //     debugPrint(
      //         "business_selector build Error:${snapshot.error.toString()}\n");
      //     return Container();
      //   }

      //   if (snapshot.hasData) {
      //     businessCategories =
      //         snapshot.data.documents.map((f) => f.documentID).toList();
      //   }

      //   // return Text("DrpDown to Come Here");

      //   if (businessCategories.isEmpty) {
      //     return Container();
      //   } else {
      //     if (selecetdBCategory == null) {
      //       selecetdBCategory = businessCategories[0];
      //       Future.delayed(Duration(milliseconds: 200), () {
      //         widget.onCategorySelected(selecetdBCategory);
      //       });
      //     }
      //   }

         DropdownButton<String>(
          //isDense: true,
          isExpanded: true,
          elevation: 8,

          hint: new Text('Business category'),
          value: selecetdBCategory ?? businessCategories[0],
          items: businessCategories.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selecetdBCategory = value;
            });
            widget.onCategorySelected(value);
          },
        );
      //},
    //);
  }
}

class BusinessSubtypeDropDown extends StatefulWidget {
  final String businessType;
  final Function(String) onSubtypeSelected;

  const BusinessSubtypeDropDown(
      {Key key, @required this.businessType, @required this.onSubtypeSelected})
      : super(key: key);

  _BusinessSubtypeDropDownState createState() =>
      _BusinessSubtypeDropDownState();
}

class _BusinessSubtypeDropDownState extends State<BusinessSubtypeDropDown> {
  List<String> subTypes = [];
  String selectedSubTypes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(BusinessSubtypeDropDown oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.businessType != widget.businessType) {
      // initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.businessType == null || widget.businessType.isEmpty) {
      return Container();
    }

    return 
    // StreamBuilder(
    //   stream: Firestore.instance
    //       .collection("business_types")
    //       .document(widget.businessType)
    //       .collection("sub_types")
    //       .snapshots(),
    //   builder: (BuildContext c, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (!snapshot.hasData) {
    //       debugPrint("BusinessSubtypeDropDown build Error:No Data\n");
    //       return Container();
    //     }

    //     if (snapshot.hasError) {
    //       debugPrint(
    //           "BusinessSubtypeDropDown build Error:${snapshot.error.toString()}\n");
    //       return Container();
    //     }

    //     if (snapshot.hasData) {
    //       subTypes = [];
    //       subTypes = snapshot.data.documents.map((f) => f.documentID).toList();
    //     }

    //     // return Text("DrpDown to Come Here");

    //     if (subTypes.isNotEmpty) {
    //       if (!subTypes.contains(selectedSubTypes)) {
    //         selectedSubTypes = subTypes[0];
    //       }

          //return 
          DropdownButton<String>(
            //isDense: true,
            isExpanded: true,
            elevation: 8,

            hint: new Text('Business category'),
            value: selectedSubTypes ?? subTypes[0],
            items: subTypes.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSubTypes = value;
              });
              widget.onSubtypeSelected(value);
            },
          );
      //   } else {
      //     return Container();
      //   }
      // },
    //);
  }
}
