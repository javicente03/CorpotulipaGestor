<?php
if(!isset($router))
    header("Location: ../../404");
while($factura = $query->fetch_assoc()){
?>
<img src="<?php echo $factura['factura'] ?>" alt="">
<?php
}
?>