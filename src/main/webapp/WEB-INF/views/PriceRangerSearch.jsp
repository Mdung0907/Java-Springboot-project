<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Price Range Slider</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap')
	;

.wrapper {
	width: 23%;
	border-radius: 10px;
	margin-left: 50%;
	margin-bottom: 10px;
}

.price-input {
	display: flex;
	margin: 5px 0 20px 35px;
}

.price-input .field {
	display: flex;
	width: 20%;
	height: 10px;
	align-items: center;
}

.field input {
	width: 300%;
	height: 100%;
	outline: none;
	font-size: 10px;
	margin-left: 12px;
	border-radius: 5px;
	text-align: center;
	border: 1px solid #999;
	/*For Mozilla Firefox*/
	-moz-appearance: textfield;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
}

.price-input .separator {
	width: 130px;
	display: flex;
	font-size: 7px;
	align-items: center;
	justify-content: center;
}

.slider {
	height: 5px;
	position: relative;
	background: #ddd;
	border-radius: 5px;
}

.slider .progress {
	height: 100%;
	left: 25%;
	right: 25%;
	background: #17a2b8;
	position: absolute;
	border-radius: 5px;
	margin: 0;
}

.range-input {
	position: relative;
}

.range-input input {
	position: absolute;
	width: 100%;
	height: 5px;
	top: -5px;
	background: none;
	pointer-events: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

input[type="range"]::-webkit-slider-thumb {
	height: 17px;
	width: 17px;
	border-radius: 50%;
	background: #17a2b8;
	pointer-events: auto;
	-webkit-appearance: none;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
}

input[type="range"]::-moz-range-thumb {
	height: 17px;
	width: 17px;
	border: none;
	border-radius: 50%;
	background: #17a2b8;
	pointer-events: auto;
	-moz-appearance: none;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
}
</style>
</head>
<body>

	<div class="wrapper">
		<form action="/" method=get>
			<div class="price-input">
				<div class="field">
					<input  class="input-min" value="2500"
						style="margin: auto" name="min">
				</div>

				<div class="field" style="margin-left: 50%">
					<input  class="input-max"value="7500"
						style="margin: auto" name="max">
				</div>
			</div>
			<div class="slider">
				<div class="progress"></div>
			</div>
			<div class="range-input">

				<input type="range" class="range-min" min="0" max="10000"
					value="2500" step="100" value="2500"> <input type="range"
					class="range-max" min="0" max="10000" value="7500" step="100"
					> <input type="submit" style="display: none" id="pw">
			</div>
		</form>
	</div>



	<script>
	document.getElementById("pw")
    .addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode === 13) {
        document.getElementById("pw").click();
    }
});

	const rangeInput = document.querySelectorAll('.range-input input'),
	priceInput = document.querySelectorAll('.price-input input'),
	range = document.querySelector('.slider .progress');
	let priceGap = 1000;

	priceInput.forEach(input => {
	    input.addEventListener('input', e => {
	        let minPrice = parseInt(priceInput[0].value),
	        maxPrice = parseInt(priceInput[1].value);

	        if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max) {
	            if (e.target.className === 'input-min') {
	                rangeInput[0].value = minPrice;
	                range.style.left = ((minPrice / rangeInput[0].max) * 100) + '%';
	            } else {
	                rangeInput[1].value = maxPrice;
	                range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + '%';
	            }
	        }
	    })
	})

	rangeInput.forEach(input => {
	    input.addEventListener('input', e => {
	        let minVal = parseInt(rangeInput[0].value),
	        maxVal = parseInt(rangeInput[1].value);

	        if ((maxVal - minVal) < priceGap) {
	            if (e.target.className === 'range-min') {
	                rangeInput[0].value = maxVal - priceGap;
	            } else {
	                rangeInput[1].value = minVal + priceGap;
	            }
	        } else {
	            priceInput[0].value = minVal;
	            priceInput[1].value = maxVal;
	            range.style.left = ((minVal / rangeInput[0].max) * 100) + '%';
	            range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + '%';
	        }
	    })
	})</script>
</body>
</html>
