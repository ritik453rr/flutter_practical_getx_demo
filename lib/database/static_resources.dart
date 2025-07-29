import 'package:getx_demo/database/app_database.dart';

class StaticResources {
  static var onboardQues = <String>[
    "Do you have any known allergies or intolerances?",
    "Do you have any known allergies or intolerances?",
    "Do you have any known allergies or intolerances?",
    // "Which of these ingredients would you like to avoid?",
    // "What are your current health goals?",
    // "Who are you shopping or scanning for?",
  ];

  static var onboardOptions = <PrefEntityData>[
    /// Page 0
    PrefEntityData(
      pageNo: 0,
      optId: '0',
      title: "Vegan",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 0,
      optId: "1",
      title: "Vegetarian",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 0,
      optId: "2",
      title: "Keto",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 0,
      optId: '3',
      title: "Paleo",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 0,
      optId: "4",
      title: "Gluten-Free",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 0,
      optId: "5",
      title: "Low FODMAP",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    /// Page 1
    PrefEntityData(
      pageNo: 1,
      optId: "6",
      title: "Vegetarian",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 1,
      optId: "7",
      title: "Keto",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 1,
      optId: "8",
      title: "Paleo",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
    PrefEntityData(
      pageNo: 1,
      optId: "9",
      title: "Gluten-Free",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 1,
      optId: "10",
      title: "Low FODMAP",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    /// Page 2
    PrefEntityData(
      pageNo: 2,
      optId: "11",
      title: "Dairy",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "12",
      title: "Eggs",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "13",
      title: "Glutan",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "14",
      title: "Nuts",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "15",
      title: "ShellFish",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "16",
      title: "Soy",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),

    PrefEntityData(
      pageNo: 2,
      optId: "17",
      title: "Corn",
      subtitle: "",
      isSelected: false,
      isOwnProduct: false,
    ),
  ];
}
