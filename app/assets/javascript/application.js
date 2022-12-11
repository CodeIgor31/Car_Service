import "@hotwired/turbo-rails"
import "controllers"
let center = [55.81863845116168,37.87356624320199];
function init() {
	let map = new ymaps.Map('yandex_map', {
		center: center,
		zoom: 17
	});

    let placemark = new ymaps.Placemark(center, {
        		balloonContent: `
			<div class="balloon">
				<div><h3>Автосервис Cars feeling</h3></div>
				<div class="balloon__contacts">
					<h5><a href="tel:+79163849119">+79163849119</a></h5>
				</div>
			</div>
            `
    }, {
		iconLayout: 'default#image',
		iconImageHref: 'https://cdn-icons-png.flaticon.com/512/3177/3177361.png',
		iconImageSize: [40, 40],
		iconImageOffset: [-19, -44]
	});

    map.controls.remove('geolocationControl'); 
    map.controls.remove('searchControl'); 
    map.controls.remove('trafficControl'); 
    map.controls.remove('typeSelector'); 
    map.controls.remove('fullscreenControl'); 
    map.controls.remove('rulerControl');

    map.geoObjects.add(placemark);
    }
ymaps.ready(init);
