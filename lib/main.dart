import 'package:flutter/material.dart';
import 'package:hisabi_app/category_widget.dart';

void main() {
  runApp(const HisabiApp());
}

class HisabiApp extends StatelessWidget {
  const HisabiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurpleAccent.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurpleAccent.shade200,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final icomeTEController = TextEditingController();
  final expensesTEController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<IncomeExpensesModel> incomeExprensesList = [
    IncomeExpensesModel(income: "income", expenses: "expenses"),
    IncomeExpensesModel(income: "income", expenses: "expenses"),
    IncomeExpensesModel(income: "income", expenses: "expenses"),
    IncomeExpensesModel(income: "income", expenses: "expenses"),
    IncomeExpensesModel(income: "income", expenses: "expenses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hisabi App'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: icomeTEController,
                        decoration: InputDecoration(
                          labelText: "Income",
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: expensesTEController,
                        decoration: InputDecoration(
                          labelText: "Expenses",
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent.shade200,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text("Add"),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(
                    categoryTitle: "Income",
                    categoryColor: Colors.green.shade500,
                  ),
                  CategoryWidget(
                    categoryTitle: "Date",
                    categoryColor: Colors.blue.shade500,
                  ),
                  CategoryWidget(
                    categoryTitle: "Expenses",
                    categoryColor: Colors.red.shade500,
                  ),
                  CategoryWidget(
                    categoryTitle: "More",
                    categoryColor: Colors.purple.shade500,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.deepPurpleAccent.shade100,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: incomeExprensesList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(incomeExprensesList[index].income),
                          ),
                          Expanded(
                            child: Text(incomeExprensesList[index].expenses),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncomeExpensesModel {
  final String income;
  final String expenses;

  IncomeExpensesModel({required this.income, required this.expenses});
}
