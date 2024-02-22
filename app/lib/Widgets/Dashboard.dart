import 'package:flutter/material.dart';
import 'package:medicia/Widgets/uploadReport.dart';
import 'package:medicia/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CallDoctor.dart';
class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({super.key});

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs =  [
    Tab(text: 'Articles'),
    Tab(text: 'Services'),
    Tab(text: 'Videos'),
  ];


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DashBoard',
        ),
      ),
      body: Container(
        height: MobileHeight,
        width: MobileWidth,
        color: Colors.white,
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color:_selectedColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Services',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Articles',
                  ),
                  Tab(
                    text: 'Videos',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Column(
                      children: [
                        GFCard(
                          color: Color(0xFF223F93),
                          boxFit: BoxFit.cover,
                          title: GFListTile(
                            title: Text(
                              'Get treatment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),)
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: MobileWidth*0.53,),
                                  Image.asset('assets/images/patient 1.png',width: MobileWidth*0.2,),
                                ],
                              ),
                            ],
                          ),
                          buttonBar: GFButtonBar(
                            children: <Widget>[

                            ],
                          ),
                        ),
                        GFCard(
                          color: Color(0xFF223F93),
                          boxFit: BoxFit.cover,
                          title: GFListTile(
                              title: Text(
                                'Call With A Doctor',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),)
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: MobileWidth*0.3,),
                                  TextButton(onPressed:  (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CallDoctor()),
                                    );
                                  }, child: Text("Go")),
                                  SizedBox(width: MobileWidth*0.1,),
                                  Image.asset('assets/images/image 3.png',width: MobileWidth*0.2,),
                                ],
                              ),
                            ],
                          ),
                          buttonBar: GFButtonBar(
                            children: <Widget>[

                            ],
                          ),
                        ),
                        GFCard(
                          color: Color(0xFF223F93),
                          boxFit: BoxFit.cover,
                          title: GFListTile(
                              title: Text(
                                'Upload Report',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),)
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: MobileWidth*0.3,),
                                  TextButton(onPressed:  (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => uploadreport()),
                                    );
                                  }, child: Text("Go")),
                                  SizedBox(width: MobileWidth*0.1,),
                                  Image.asset('assets/images/schizophrenia 1.png',width: MobileWidth*0.2,),
                                ],
                              ),
                            ],
                          ),
                          buttonBar: GFButtonBar(
                            children: <Widget>[

                            ],
                          ),
                        ),
                      ],
                    )
                  ),

                  // second tab bar view widget
                  Center(
                      child:Container(

                        child: ListView(
                          children: [
                            GFCard(
                              color: Color(0xFF223F93),
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                          title: GFListTile(
                              title: Text('Smoking’s effects on the immune system can last years, study finds',style:TextStyle(
                                fontSize: 22,
                                  fontWeight: FontWeight.bold

                              ),),
                              subTitle: Text('CNN HEALTH'),
                            ),
                              showImage: true,
                              buttonBar: GFButtonBar(
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {    _launchURL('https://edition.cnn.com/2024/02/14/health/smoking-immune-system/index.html'); },
                                    child: Text('Learn More'),
                                    color: Color(0xFF223F93),

                                  )
                                ],
                              ),
                            ),
                            GFCard(
                              color: Color(0xFF223F93),
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              title: GFListTile(
                                title: Text('The doctor behind the next big thing in cancer treatment',style:TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                                subTitle: Text('CNN HEALTH'),
                              ),
                              showImage: true,
                              buttonBar: GFButtonBar(
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {    _launchURL('https://edition.cnn.com/2024/02/20/health/cancer-vaccines-catherine-wu-scn/index.html?iid=cnn_buildContentRecirc_end_recirc'); },
                                    child: Text('Learn More'),
                                    color: Color(0xFF223F93),

                                  )
                                ],
                              ),
                            ),
                            GFCard(
                              color: Color(0xFF223F93),
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              title: GFListTile(
                                title: Text('What happens to cancer cells after they are killed by treatments?',style:TextStyle(
                                    fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),),
                                subTitle: Text('LIVE SCIENCE'),
                              ),
                              showImage: true,
                              buttonBar: GFButtonBar(
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {    _launchURL('https://www.livescience.com/health/cancer/what-happens-to-cancer-cells-after-theyre-killed-by-treatments'); },
                                    child: Text('Learn More'),
                                    color: Color(0xFF223F93),

                                  )
                                ],
                              ),
                            ),
                            GFCard(
                              color: Color(0xFF223F93),
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              title: GFListTile(
                                title: Text('2023 in medicine: Artificial sweeteners, colon cancer, and male birth control',style:TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),),
                                subTitle: Text('MEDICAL NEWS TODAY'),
                              ),
                              showImage: true,
                              buttonBar: GFButtonBar(
                                children: <Widget>[
                                  GFButton(
                                    onPressed: () {    _launchURL('https://www.medicalnewstoday.com/articles/2023-in-medicine-artificial-sweeteners-colon-cancer-male-birth-control'); },
                                    child: Text('Learn More'),
                                    color: Color(0xFF223F93),

                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                        ,
                      )
                  ),
                  Center(
                    child:Container(

                      child: ListView(
                        children: [
                          GFCard(
                            color: Color(0xFF223F93),
                            boxFit: BoxFit.cover,
                            titlePosition: GFPosition.start,
                            image: Image.asset(
                              'assets/images/Video1.png',
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            showImage: true,
                            buttonBar: GFButtonBar(
                              children: <Widget>[
                               GFButton(
                                 onPressed: () {    _launchURL('https://www.youtube.com/watch?v=LzP0IjR-9wI'); },
                                 child:  GFAvatar(
                                   backgroundColor: GFColors.DARK,
                                   child: Icon(
                                     Icons.home,
                                     color: Colors.white,

                                   ),
                                 ),
                                 color: Color(0xFF223F93),

                               )
                              ],
                            ),
                          ),
                          GFCard(
                            boxFit: BoxFit.cover,
                            titlePosition: GFPosition.start,
                            image: Image.asset(
                              'assets/images/video3.png',
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MobileWidth*0.9,
                              fit: BoxFit.cover,
                            ),
                            showImage: true,
                            buttonBar: GFButtonBar(
                              children: <Widget>[
                                GFButton(
                                  onPressed: () {    _launchURL('https://youtube.com/@muscleclinicpt?si=JFjHeoa2rixTB0zy'); },
                                  child:  GFAvatar(
                                    backgroundColor: GFColors.DARK,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,

                                    ),
                                  ),
                                  color: Color(0xFF223F93),

                                )
                              ],
                            ),
                            color: Color(0xFF223F93),
                          ),
                          GFCard(
                            boxFit: BoxFit.cover,
                            titlePosition: GFPosition.start,
                            image: Image.asset(
                              'assets/images/video2.png',
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MobileWidth*0.9,
                              fit: BoxFit.cover,
                            ),
                            showImage: true,
                            buttonBar: GFButtonBar(
                              children: <Widget>[
                                GFButton(
                                  onPressed: () {    _launchURL('https://www.youtube.com/@4betterhealth'); },
                                  child:  GFAvatar(
                                    backgroundColor: GFColors.DARK,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,

                                    ),
                                  ),
                                  color: Color(0xFF223F93),

                                )
                              ],
                            ),
                            color: Color(0xFF223F93),
                          ),
                          GFCard(
                            boxFit: BoxFit.cover,
                            titlePosition: GFPosition.start,
                            image: Image.asset(
                              'assets/images/video4.png',
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MobileWidth*0.9,
                              fit: BoxFit.cover,
                            ),
                            showImage: true,
                            buttonBar: GFButtonBar(
                              children: <Widget>[
                                GFButton(
                                  onPressed: () {    _launchURL('https://youtube.com/@DrYasserSadek?si=mcjqvlo21bP3g6bo'); },
                                  child:  GFAvatar(
                                    backgroundColor: GFColors.DARK,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,

                                    ),
                                  ),
                                  color: Color(0xFF223F93),

                                )
                              ],
                            ),
                            color: Color(0xFF223F93),
                          ),
                        ],
                      )
                      ,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.youtube.com/watch?v=LzP0IjR-9wI'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  createBoxPainter([VoidCallback? onChanged]) {
    return _MaterialDesignPainter(this, onChanged);
  }
}

class _MaterialDesignPainter extends BoxPainter {
  final MaterialDesignIndicator decoration;

  _MaterialDesignPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
      offset.dx,
      configuration.size!.height - decoration.indicatorHeight,
    ) &
    Size(configuration.size!.width, decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
