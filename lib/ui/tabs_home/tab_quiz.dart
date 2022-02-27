import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class QuestionTab extends StatefulWidget {
  const QuestionTab({Key? key}) : super(key: key);

  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  int? _questionCategory;
  late TextEditingController _questionController;

  List<String>? _ideas = [];

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _questionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        // Current Balance Widget & Add Money Button
        Container(
          height: kTextTabBarHeight,
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
          ),
          padding: const EdgeInsets.all(10.00),
          child: Row(
            children: [
              const Text(
                "Wallet Balance: ₹0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.00,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 14.00,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              )
            ],
          ),
        ),
        // Ask Question Form
        Expanded(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(15.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ask a Question",
                    style:
                        TextStyle(fontSize: 18.00, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0)
                        .copyWith(bottom: 15.00),
                    child: const Text(
                      "Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
                      style: TextStyle(
                        fontSize: 15.00,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Text(
                    "Choose Category",
                    style:
                        TextStyle(fontSize: 18.00, fontWeight: FontWeight.w700),
                  ),
                  Consumer<HomeProvider>(
                    builder: (context, provider, child) {
                      if (!provider.isCategoriesLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0)
                              .copyWith(bottom: 20.00),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.00),
                            elevation: 4.00,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton(
                                items: List.generate(provider.categories.length,
                                    (index) {
                                  return DropdownMenuItem(
                                    child:
                                        Text(provider.categories[index].name!),
                                    value:index,
                                  );
                                }),
                                value: _questionCategory,
                                onChanged: (value) {
                                  setState(() {
                                    _questionCategory = value as int?;
                                    _ideas = provider
                                        .categories[value as int].suggestions;
                                  });
                                },
                                hint: const Text("Select Category"),
                                borderRadius: BorderRadius.circular(5.00),
                                isDense: false,
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  TextField(
                    controller: _questionController,
                    maxLines: 3,
                    maxLength: 150,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      hintText: "Type a question here",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Ideas what to Ask (Select Any)",
                      style: TextStyle(
                          fontSize: 18.00, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_ideas!.length, (index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: index > 0, child: const Divider()),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: theme.primaryColor,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                _ideas![index],
                                overflow: TextOverflow.clip,
                              ))
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0)
                        .copyWith(bottom: 15.00),
                    child: const Text(
                      "Seek accurate answers to difficult question troubling your mind? Ask credible astrologers to know what future has in store for you.",
                      style: TextStyle(
                        fontSize: 15.00,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.orange.withOpacity(0.1)),
                    padding: const EdgeInsets.all(10.00),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.orange, fontSize: 15.00),
                            children: [
                          TextSpan(
                              text:
                                  "\u2022 Personalized responses provided by our team of Vedic astrologers within 24 hours.\n"),
                          TextSpan(
                              text:
                                  "\u2022 Qualified and experienced astrologers will look into your birth chart and provide the right guidance.\n"),
                          TextSpan(
                              text:
                                  "\u2022 You can seek answers to any part of your life and for most pressing issue.\n"),
                          TextSpan(
                              text:
                                  "\u2022 Our team of Vedic astrologers will not just predict answers but also suggest a remedial solution.\n"),
                        ])),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ),
        // Charges for one question & submit
        Container(
          height: kTextTabBarHeight,
          decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(5.00)),
          padding: const EdgeInsets.all(10.00),
          child: Row(
            children: [
              const Text(
                "₹150 (1 Question on Love)",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.00,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Ask Now",
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 14.00,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _onDropdownChanged(int? value, List<String>? _list) {
    setState(() {
      _questionCategory = value;
      _ideas = _list;
    });
  }
}
