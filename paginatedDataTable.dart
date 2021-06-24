// Sample Taken From One Of My Code//
import 'package:dash_admin_dashboard/Dashboard/MenuItems/addFeature.dart';
import 'package:dash_admin_dashboard/Dashboard/MenuItems/components/headingTextWidget.dart';
import 'package:dash_admin_dashboard/Dashboard/MenuItems/components/tableHeader.dart';
import 'package:dash_admin_dashboard/Dashboard/MenuItems/drawer.dart';
import 'package:dash_admin_dashboard/SignUp/Components/appbar.dart';
import 'package:dash_admin_dashboard/models/AdminModel/adminResponseModel.dart';
import 'package:dash_admin_dashboard/models/featureModel.dart';
import 'package:dash_admin_dashboard/service/networkHandler2.dart';
import 'package:flutter/material.dart';

class FeaturesTable extends StatefulWidget {
  const FeaturesTable({Key key}) : super(key: key);

  @override
  _FeaturesTableState createState() => _FeaturesTableState();
}

class _FeaturesTableState extends State<FeaturesTable> {
  Map<String, dynamic> resp;
  bool circular = true;
  NetworkHandler networkHandler = NetworkHandler();
  FeatureModel featuremodel = FeatureModel();
  AdminResponseModel adminResponse = AdminResponseModel();
  String text;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get('feature?limit=100&page=1');
    setState(() {
      featuremodel = FeatureModel.fromJson(response);
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(
        isloggedIn: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height ,
                  child: BuildDrawer()),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: circular
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        PaginatedDataTable(
                          header: TableHeader(
                              headerText: 'Features Details',
                              page: AddFeature(),
                              header: 'Feature'),
                          rowsPerPage: 10,
                          columns: [
                            DataColumn(label: HeadingTextWidget(text: 'Name')),
                            DataColumn(label: HeadingTextWidget(text: 'Active')),
                            DataColumn(label: HeadingTextWidget(text: 'Key')),
                            DataColumn(label: HeadingTextWidget(text: 'Actions')),
                          ],
                          source: _DataSource(context, featuremodel),
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


class _DataSource extends DataTableSource {
  _DataSource(this.context, this.featuremodel);
  final BuildContext context;
  FeatureModel featuremodel;
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(featuremodel.results[index].name.toString(),)),
        DataCell(Text(featuremodel.results[index].active.toString(),)),
        DataCell(Text(featuremodel.results[index].key.toString(),)),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            SizedBox(width: 8,),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => featuremodel.totalResults;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
