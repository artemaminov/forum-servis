//$(window).load(resizeShapes);
//window.addEventListener('resize', resizeShapes);
//
//function resizeShapes() {
//    var shapes = document.getElementsByTagName('object');
//    for (var foo = 0; foo < shapes.length; ++foo) {
//        var shape = shapes[foo];
//        var svgDoc = shape.contentDocument;
//        svgDoc.setAttribute('viewBox', '0 0 '+$(window).width()+' '+'80');
//        var polygons = svgDoc.getElementsByTagName('polygon');
//        for (var bar = 0; bar < polygons.length; ++bar) {
//            var polygon = polygons[bar];
//            var points = polygon.points;
//            for (var i = 0; i < points.numberOfItems; ++i) {
//                var point = points.getItem(i);
//                point.x = point.x + ($(window).width() - 1280)/2;
//            }
//        }
//    }
//}