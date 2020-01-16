<?php
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname="empleadosnn";
$db = new mysqli($servername, $username, $password,$dbname);
if (!isset($_POST) || empty($_POST)) { 
$departamentos = obtenerDepartamentos($db);
    /* Se inicializa la lista valores*/
	echo '<form action="" method="post">';
?>
dni <input type="text" name="dni" >	<br>
Nombre  <input type="text" name="nombre" >	<br>	
Apellidos  <input type="text" name="apellidos" >	<br>	
Salario  <input type="text" name="salario" >	<br>	
Fecha nacimiento  <input type="date" name="fechanac" >	<br>		
        
	<label for="departamento">Departamentos:</label>
	<select name="departamento">
		<?php foreach($departamentos as $departamento) : ?>
			<option> <?php echo $departamento ?> </option>
		<?php endforeach; ?>
	</select>
	        <input type="submit" name="submit">	<br>
                    </form>
<?php

} else {
$dni=$_POST['dni'];
$nombre=$_POST['nombre'];
$apellidos = $_POST['apellidos'];
$salario= $_POST['salario'];
$fecha= $_POST['fechanac'];
	$departamento = $_POST['departamento'];
	$sql1 = "SELECT dni from empleado where dni='$dni'";
	$result = $db->query($sql1);
	if ($result->num_rows == 0){
	$fecha1=gmdate('Y-m-d');
		$insert = "INSERT INTO empleado VALUES ('$dni','$nombre','$apellidos','$fecha','$salario')";
		$db->query($insert);
		$sql2 = "SELECT cod_dpto FROM departamento WHERE nombre_dpto = '$departamento'";
	$depar = $db->query($sql2);
	if ( $depar ) {
	while ($row = mysqli_fetch_assoc($depar)) {
			$departa = $row['cod_dpto'];
		}
		}
			$inserttabla= "INSERT INTO emple_Departam VALUES ('$fecha1','$departa','$dni',null)";
		$db->query($inserttabla);
}	else {
	echo "El dni esta repetido";
	}
	}



function obtenerDepartamentos($db) {
	$departamentos = array();
	
	$sql = "SELECT cod_dpto,nombre_dpto FROM departamento";
	
	$resultado = mysqli_query($db, $sql);
	if ($resultado) {
		while ($row = mysqli_fetch_assoc($resultado)) {
			$departamentos[] = $row['nombre_dpto'];
		}
	}
	return $departamentos;
}
?>