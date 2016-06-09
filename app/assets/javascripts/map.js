$(document).on('page:change',(function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

        markers = handler.addMarkers([
            {
                "lat": 18.567091,
                "lng": 73.769672,
                "picture": {
                    "width":  32,
                    "height": 32
                },
                "infowindow": "Talentica Software!"
            }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
        handler.getMap().setZoom(12);
    })
}));