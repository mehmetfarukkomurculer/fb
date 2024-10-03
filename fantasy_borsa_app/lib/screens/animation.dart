import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaterGlassAnimation extends StatefulWidget {
  @override
  _WaterGlassAnimationState createState() => _WaterGlassAnimationState();
}

class _WaterGlassAnimationState extends State<WaterGlassAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late PictureInfo _pictureInfo;
  bool _isSvgLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _loadSvg();

    _controller.forward();
  }

  Future<void> _loadSvg() async {
    final String rawSvg = '''
   <?xml version="1.0" encoding="iso-8859-1"?>
<!-- Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
<svg height="800px" width="800px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
	 viewBox="0 0 501.551 501.551" xml:space="preserve">
<path style="fill:#CDD6E0;" d="M321.829,477.518L321.829,477.518c-20.898,0-39.706-14.629-44.931-34.482
	c-16.718-63.739-11.494-143.151-11.494-143.151h-14.629h-14.629c0,0,5.225,79.412-11.494,143.151
	c-5.224,20.898-24.033,34.482-44.931,34.482l0,0c-13.584,0-24.033,10.449-24.033,24.033h190.171
	C345.861,487.967,335.412,477.518,321.829,477.518z"/>
<path style="fill:#F2F2F2;" d="M120.163,0C96.131,49.11,82.547,107.624,82.547,160.914c0,124.343,75.233,176.588,168.229,176.588
	s168.229-53.29,168.229-176.588c0-54.335-14.629-111.804-37.616-160.914H120.163z"/>
<path style="fill:#84DBFF;" d="M103.445,107.624c-3.135,17.763-4.18,35.527-4.18,53.29c0,102.4,55.38,160.914,152.555,160.914
	s152.555-58.514,152.555-160.914c0-16.718-2.09-35.527-4.18-53.29C400.196,107.624,103.445,107.624,103.445,107.624z"/>
<path style="fill:#54C0EB;" d="M250.776,290.482c0,0-3.135,0-8.359,1.045c-3.135,0-52.245,4.18-86.727-32.392
	c0,0-13.584-15.673-18.808-33.437c-9.404-28.212-6.269-64.784-6.269-64.784s4.18,32.392,14.629,61.649
	c7.314,18.808,18.808,30.302,18.808,30.302C202.71,292.571,250.776,290.482,250.776,290.482z"/>
</svg>
    ''';
    _pictureInfo = await vg.loadPicture(SvgStringLoader(rawSvg), null);
    setState(() {
      _isSvgLoaded = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isSvgLoaded
        ? SizedBox(
          width: 50,
                height: 100,
          child: CustomPaint(
              painter: WaterGlassPainter(_animation.value, _pictureInfo),
            ),
        )
        : Center(child: CircularProgressIndicator());
  }
}

class WaterGlassPainter extends CustomPainter {
  final double fillLevel;
  final PictureInfo pictureInfo;

  WaterGlassPainter(this.fillLevel, this.pictureInfo);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawPicture(pictureInfo.picture);
    canvas.restore();

    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * (1 - fillLevel))
      ..lineTo(size.width, size.height * (1 - fillLevel))
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

