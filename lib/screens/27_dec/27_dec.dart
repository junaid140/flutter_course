//horizontal_data_table

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
class HorizanalPackage extends StatefulWidget {
  const HorizanalPackage({Key? key}) : super(key: key);

  @override
  State<HorizanalPackage> createState() => _HorizanalPackageState();
}

class _HorizanalPackageState extends State<HorizanalPackage> {

  int rowsPerPage = 10;

  final source = ExampleSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello Flutter"),),
      // body: HorizontalDataTable(
      //     leftHandSideColumnWidth: 100,
      //     rightHandSideColumnWidth: 100,
      //   headerWidgets: [
      //     Text("sjhvbjhsj"),
      //   ],
      //   leftSideItemBuilder: (context,index){
      //       return Container(child: Text("jsdfbvhjdbsj"),) ;
      //   },
      //   rightSideItemBuilder: (context,index){
      //       return Container(child: Text("shvbjsh"),);
      //   },
      //   itemCount: 10,
      // ),
      body: AdvancedPaginatedDataTable(
        addEmptyRows: false,
        source: source,
        showFirstLastButtons: true,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: [1, 5, 10, 50],
        onRowsPerPageChanged: (newRowsPerPage) {
          if (newRowsPerPage != null) {
            setState(() {
              rowsPerPage = newRowsPerPage;
            });
          }
        },
        columns: [
          DataColumn(label: Text('Row no')),
          DataColumn(label: Text('Value')),
          DataColumn(label: Text('Row no')),
          DataColumn(label: Text('Value')),
        ],
      ),
    );
  }
}

class RowData {
  final int index;
  final String value;

  RowData(this.index, this.value);
}

class ExampleSource extends AdvancedDataTableSource<RowData> {
  final data = List<RowData>.generate(
      13, (index) => RowData(index, 'Value for no. $index'));

  @override
  DataRow? getRow(int index) {
    final currentRowData = lastDetails!.rows[index];
    return DataRow(cells: [
      DataCell(
        Text(currentRowData.index.toString()),
      ),
      DataCell(
        Text(currentRowData.value),
      ), DataCell(
        Text(currentRowData.index.toString()),
      ),
      DataCell(
        Text(currentRowData.value),
      ),
    ]);
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<RowData>> getNextPage(
      NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      data.length,
      data
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(), //again in a real world example you would only get the right amount of rows
    );
  }
}