import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const markerDiv = document.createElement('div');
      markerDiv.innerHTML = `<i class="fas fa-map-marker-alt"></i>`;
      markerDiv.classList.add('marker');
      markerDiv.dataset.locationId = marker.location_id;

      // ajouter un eventListener sur le marker (click)
      markerDiv.addEventListener('click', (event) => {
        const locationId = markerDiv.dataset.locationId;
        const locationDivs = document.querySelectorAll('.location-show');
        const locationDiv = document.getElementById(`location-${locationId}`)
        locationDivs.forEach((locationDiv) => {
          locationDiv.classList.add('location-hide');
        });
        locationDiv.classList.remove('location-hide');
      });
      // dans le call back de l'eventListener :
      // - récupère l'id de la location
      // - récupère la la div avec l'id 'location-...' (... => id de la location)
      // - tu enlèves la classe d-none sur cette div


      new mapboxgl.Marker(markerDiv)
        .setLngLat([ marker.lng, marker.lat ])
        // .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    closeLocationDiv(map);
  }
};


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const closeLocationDiv = () => {
  const map = document.getElementById('map');
  const locationDivs = document.querySelectorAll('.location-show');
  map.addEventListener('click', (event) => {
    if (event.target.closest('.marker')) return;
    if (event.target.closest('.location-show__details')) return;
    locationDivs.forEach((locationDiv) => {
      locationDiv.classList.add('location-hide');
    });
  });
};

export { initMapbox };
