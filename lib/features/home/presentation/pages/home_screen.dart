import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practo/common/sized_box/sized_box.dart';
import 'package:practo/common/widgets/common_button.dart';

List<Map<String, dynamic>> docList = [
  {
    'image': 'asset/doctor1.jpg',
    'title': 'Book In-Clinic\nAppointment',
    'subtitle': 'Confirmed appointments',
  },
  {
    'image': 'asset/doctor1.jpg',
    'title': 'Instant Video\nConsultation',
    'subtitle': 'Connect within 60 seconds',
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'asset/dental.jpg',
    'asset/dental.jpg',
    'asset/dental.jpg',
  ];
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xffF0F6F6),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            SizedBoxes.rowSizedBox,
                            const Icon(
                              Icons.location_on,
                              size: 15,
                              color: Color(0xff253292),
                            ),
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintText: 'Location',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  isDense: true,
                                ),
                                value: selectedLocation,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedLocation = value;
                                  });
                                },
                                items: [
                                  'Bangalore',
                                  'Chennai',
                                  'Hyderabad',
                                  'Andra'
                                ].map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenWidth * 0.19,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0XFF98E2FE),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image(image: AssetImage("asset/doc.png")),
                                  Text("ABHA"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBoxes.normalSizedBox,
                    SizedBox(
                        width: screenWidth * 1,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffF0F6F6),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)),
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search for clinics and hospitals'),
                        )),
                    SizedBoxes.normalSizedBox,
                    const Divider(),
                    SizedBoxes.largeSizedBox,
                    SizedBox(
                      height: screenHeight * 0.25,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffEFEFEF), width: 4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.39,
                            height: screenHeight * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(image: AssetImage(docList[index]['image'])),
                                SizedBoxes.smallSizedBox,
                                Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.02),
                                    Expanded(
                                      child: Text(
                                        docList[index]['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.02),
                                    Expanded(
                                      child: Text(
                                        docList[index]['subtitle'],
                                        style: const TextStyle(
                                            fontSize: 7, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: docList.length,
                      ),
                    ),
                    SizedBoxes.normalSizedBox,
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffF0F6F6),
                          child: Icon(
                            Icons.star_border,
                            color: Color(0xff253292),
                          ),
                        ),
                        Text(
                          "Featured services",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBoxes.normalSizedBox,
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height *
                          (240 / MediaQuery.of(context).size.height),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff253292)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBoxes.normalSizedBox,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Affordable Procedures by",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  " Expert Doctors",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBoxes.normalSizedBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(
                                              image:
                                                  AssetImage("asset/piles.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBoxes.smallSizedBox,
                                    const Text(
                                      "Piles",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBoxes.rowNormalSizedBox,
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "asset/pregnent.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBoxes.smallSizedBox,
                                    const Text(
                                      "Pregnancy",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBoxes.rowNormalSizedBox,
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(
                                              image: AssetImage("asset/knee.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBoxes.smallSizedBox,
                                    const Text(
                                      "Knee",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBoxes.rowNormalSizedBox,
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xff00DEFF),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "50+",
                                        style: TextStyle(fontSize: 15),
                                      )),
                                    ),
                                    SizedBoxes.smallSizedBox,
                                    const Text(
                                      "More",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBoxes.smallSizedBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "All insurance accepted\n& No Cost EMI available",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  width: screenWidth * 0.39,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF98E2FE),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(child: Text("Get Cost Estimate")),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBoxes.smallSizedBox,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("asset/dental.jpg"),
                              fit: BoxFit.cover)),
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '•',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff00B8FE)),
                                      ),
                                      TextSpan(
                                        text: 'Practo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff253292)),
                                      ),
                                      TextSpan(
                                        text: '•',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff00B8FE)),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  iconSize: 10.0,
                                  padding: EdgeInsets.all(4.0),
                                  style: ButtonStyle(
                                    elevation: WidgetStatePropertyAll(3),
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                    minimumSize:
                                        WidgetStateProperty.all(Size(5.0, 5.0)),
                                    padding: WidgetStateProperty.all(
                                        EdgeInsets.all(4.0)),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios_rounded),
                                )
                              ],
                            ),
                            Text(
                              "D E N T A L",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff00B8FE)),
                            ),
                            Text(
                              "C L I N I C S",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "Best - quality treatments\nusing advanced techniques",
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxes.largeSizedBox,
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                      ),
                      items: imgList
                          .map(
                            (item) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage("asset/dental.jpg"),
                                      fit: BoxFit.cover)),
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '•',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff00B8FE)),
                                              ),
                                              TextSpan(
                                                text: 'Practo',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff253292)),
                                              ),
                                              TextSpan(
                                                text: '•',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff00B8FE)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 10.0,
                                          padding: EdgeInsets.all(4.0),
                                          style: ButtonStyle(
                                            elevation: WidgetStatePropertyAll(3),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.white),
                                            minimumSize: WidgetStateProperty.all(
                                                Size(5.0, 5.0)),
                                            padding: WidgetStateProperty.all(
                                                EdgeInsets.all(4.0)),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.arrow_forward_ios_rounded),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "D E N T A L",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff00B8FE)),
                                    ),
                                    Text(
                                      "C L I N I C S",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      "Best - quality treatments\nusing advanced techniques",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    SizedBoxes.normalSizedBox,
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffF0F6F6),
                          child: Icon(
                            Icons.videocam_outlined,
                            color: Color(0xff253292),
                          ),
                        ),
                        SizedBoxes.rowSizedBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Not feeling too well?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Treat common symptoms with top specialists?",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBoxes.normalSizedBox,
                    Container(
                      height: 300.0,
                      child: GridView.builder(
                        itemCount: 8,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 60.0,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage("asset/pregnancy.jpg"),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBoxes.normalSizedBox,
                              Text(
                                "Pregnancy\nIssues",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    CommonButton(
                      buttonText: "View All Symptoms",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xff253292),
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Image(image: AssetImage("asset/Vector.png")),
                        SizedBoxes.rowSizedBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Best offers",style: TextStyle(color: Colors.white),),
                            Text("Explore deals, offers, health updates and more",style: TextStyle(color: Colors.white,fontSize: 10),),
                          ],
                        )
                      ],)
                  ],),
                ),
              ),
              SizedBoxes.normalSizedBox,
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffF0F6F6),
                    child: Icon(
                      Icons.local_hospital_rounded,
                      color: Color(0xff253292),
                    ),
                  ),
                  SizedBoxes.rowSizedBox,
                  Text(
                    "Conditions that can be treated\nthrough surgeries ", style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
