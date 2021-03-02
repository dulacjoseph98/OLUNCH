import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const navbar = document.querySelector(".navbar-collapse");


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/glebrun/cklqr8koc2nyb17lk7p0l8a0h'
    });

    mapElement.addEventListener("click", (event) => {
      if (navbar.classList.contains("show")) {
        navbar.classList.remove("show");
      }
    })

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const markerDiv = document.createElement('div');

      markerDiv.style.backgroundImage = `url('${marker.image_url}')`;
      markerDiv.style.backgroundSize = 'contain';
      markerDiv.style.backgroundPosition = 'center';
      markerDiv.style.backgroundRepeat = 'no-repeat';
      markerDiv.style.width = '25px';
      markerDiv.style.height = '40px';
      markerDiv.classList.add('marker');

      if (marker.has_event) {
        markerDiv.classList.add('has-event');
      };
      markerDiv.dataset.locationId = marker.location_id;

      // ajouter un eventListener sur le marker (click)
      markerDiv.addEventListener('click', (event) => {

        if (navbar.classList.contains("show")) {
          navbar.classList.remove("show");
        }
        const locationId = markerDiv.dataset.locationId;
        const locationDivs = document.querySelectorAll('.location-show');
        const locationDiv = document.getElementById(`location-${locationId}`)
        locationDivs.forEach((locationDiv) => {
          locationDiv.classList.add('location-hide');
        });
        locationDiv.classList.remove('location-hide');
      });

      new mapboxgl.Marker(markerDiv)
        .setLngLat([ marker.lng, marker.lat ])
        // .setPopup(popup)
        .addTo(map);
    });
    map.addControl(new mapboxgl.NavigationControl());

    const entityMarker = JSON.parse(mapElement.dataset.entityMarker);
    const entityMarkerDiv = document.createElement('div');

    entityMarkerDiv.innerHTML = `<i class="fas fa-home"></i>`;
    entityMarkerDiv.classList.add('marker');
    entityMarkerDiv.classList.add('entity-marker');
    new mapboxgl.Marker(entityMarkerDiv)
        .setLngLat([ entityMarker.lng, entityMarker.lat ])
        // .setPopup(popup)
        .addTo(map);

    const allMarkers = markers;
    allMarkers.push(entityMarker);
    fitMapToMarkers(map, allMarkers);
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
