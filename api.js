<!DOCTYPE html>
<html>
<head>
	<title>API Integration Example</title>
	<script>
		function getData() {
			fetch('http://127.0.0.1:4873/api/all_functions')
				.then(response => response.json())
				.then(data => {
					document.getElementById('output').textContent = JSON.stringify(data);
				})
				.catch(error => {
					console.error('Error:', error);
				});
		}
	</script>
</head>
<body>
	<h1>API Integration Example</h1>
	<button onclick="getData()">Get Data</button>
	<div id="output"></div>
</body>
</html>
