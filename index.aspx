﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SAFRA</title>
    <link href="css/terceros.css" rel="stylesheet" />
    <style>
        html,body{margin:0px;font-family:Verdana;background-color:#808080;padding:0px;height:100%;overflow:hidden;}
        button{cursor:pointer;}
        .login{height:100% !important;position:absolute;background-color:#808080;overflow:hidden;width:100%;}
        .pantalla{border-bottom:1px solid #b6ff00;background-color:#eee;position:absolute;left:0px;top:34px;width:100%;}        
        .login fieldset{width:80%;border-radius:4px;margin:auto;border:2px solid #0094ff;margin-top:20%;background-color:#eee;}
        .login fieldset legend{width:40%;margin:auto;border:2px solid #0094ff;padding:5px;border-radius:4px;background-color:#fff;}
        .login fieldset img{width:100%;}
        .login fieldset input{width:60%;margin:auto;display:block;padding:10px;padding-left:50px;margin-bottom:25px;margin-top:25px;background-size:30px;background-image:url(img/Titan_Company_Logo.png);background-repeat:no-repeat;background-position-x:5px;background-position-y:center;border:1px solid #0094ff;border-radius:4px;}
        .login fieldset button{width:80%;margin:auto;display:block;padding:10px;margin-bottom:25px;margin-top:25px;}
        .login fieldset .olvido{float:right;margin:20px;font-size:10px;}
        .login .copyright{display:block;width:80%;text-align:center;;margin:auto;font-size:10px;color:#333;margin-top:20px;font-weight:bold;}
        .datos-usuario{padding:10px;font-size:12px;background-color:#000;color:#ddd;}
        .datos-usuario span{text-align:right;display:block;margin-right:40px;}
        .datos-usuario img{cursor:pointer;float:right;width:30px;border-radius:30px;margin-top:-22px;}        
        .datos-usuario img.home{float:left;margin-right:10px;margin-top:-5px;}
        .datos-usuario .home:active{background-color:#fff;}

        .opciones-usuario ul{border:1px solid #0094ff;border-left:0px;border-right:0px;border-bottom:5px solid #0094ff;background-color:#eee;margin:0px;padding:20px;padding-left:40px;font-size:12px;list-style:none;}
        .opciones-usuario ul li{margin-bottom:15px;}
        .busqueda{margin:auto;display:block;padding:5px;background-color:#0094ff;}
        .busqueda input{width:80%;margin:auto;display:block;padding:10px;padding-left:50px;margin-bottom:5px;margin-top:5px;background-size:30px;background-image:url(img/Titan_Company_Logo.png);background-repeat:no-repeat;background-position-x:5px;background-position-y:center;border:1px solid #0094ff;border-radius:4px;}
        .titulo{display:block;padding:5px;background-color:#eee;color:#333;text-align:center;font-weight:bold;font-size:14px;font-family:arial;}
        ul.lista{padding:0px;}
        ul.lista .item{width:100%;float:left;border-bottom:1px solid #808080;padding-bottom:5px;margin:0px;}
        ul.lista .item > span{font-size:13px;font-weight:bold;padding-left:2%;}
        ul.lista .item ol{list-style:none;padding:0px;margin:0px;}
        ul.lista .item ol li{margin:0px;}
        ul.lista .item ol li > span{display:block;width:70%;font-size:12px;padding:3px;float:left;margin-top:15px;padding-left:3%;}
        ul.lista .item ol li > a{display:block;width:30px;float:right;margin-right:10px;}
        ul.lista .item ol li > button.edit-btn{display:block;width:30px;float:left;margin-left:10px;margin-top:10px;border:0px;background-color:transparent;padding:0px;cursor:pointer;}
        ul.lista .item ol li > a img,.lista .item ol li > button img{width:100%;}
        ul.lista .item .clear{border:0px;clear:both;width:100%;}
        div.agregar{border-bottom:1px solid #0094ff;padding:10px;}
        div.agregar button{width:80%;color:#fff;background-color:#0094ff;border-radius:4px;padding:10px;margin:auto;display:block;border:0px;cursor:pointer;background-size:30px;background-image:url(img/Titan_Company_Logo.png);background-repeat:no-repeat;background-position-x:5px;background-position-y:center;}
        div.agregar button:active{color:#0094ff;background-color:#fff;}

        .titulo .cancelar{float:right;color:#4800ff;border:0px;background-color:transparent;}
        .titulo .regresar{float:left;color:#4800ff;border:0px;background-color:transparent;}

        .edicion label{display:block;padding:5px;font-size:11px;font-weight:bold;background-color:#ddd;text-align:center;clear:both;margin-top:10px;}
        .edicion input{border:0px;display:block;width:100%;margin:0px;padding:0px;margin-bottom:12px;text-align:center;padding-top:10px;padding-bottom:10px;}
        .edicion textarea{width:100%;padding:0px;margin:0px;font-size:14px;color:#333;font-family:arial;overflow:auto;border:0px;}
        .edicion table{width:100%;}
        .edicion table tr td span{font-size:11px;}
        .edicion table tr td{}
        .edicion table tr td input{width:100%;margin-bottom:0px;text-align:right;}
        .edicion .adjuntar-btn{width:20px;border:0px;background-color:transparent;float:right;margin-right:10px;}
        .edicion .adjuntar-btn img{width:20px;}
        .edicion table td.del{background-color:#333;border-bottom:1px solid #0094ff;}
        .edicion table textarea{margin-bottom:20px;}

        button.aceptar{width:80%;color:#fff;background-color:#0094ff;border-radius:4px;padding:10px;margin:auto;display:block;border:0px;cursor:pointer;}
        button.aceptar:active{color:#0094ff;background-color:#fff;}

        ul.lista .item span.t-1{display:block;padding-top:5px;}
        ul.lista .item span.t-2{display:block;width:65%;float:left;font-size:11px;font-weight:normal;color:#333;margin-top:5px;}
        ul.lista .item span.t-3{display:block;width:30%;float:left;font-size:11px;color:#0094ff;font-weight:normal;}
        ul.lista .item span.t-4{display:block;width:30%;float:left;font-size:11px;color:#0094ff;font-weight:normal;}
                
        span.t-1{display:block;padding-top:5px;}
        span.t-2{display:block;width:65%;float:left;font-size:11px;font-weight:normal;color:#333;margin-top:5px;}
        span.t-3{display:block;width:30%;float:left;font-size:11px;color:#0094ff;font-weight:normal;}
        span.t-4{display:block;float:left;font-size:13px;color:#060a0d;font-weight:normal;padding:20px;text-align:justify;}
        span.t-41{display:block;float:none;font-size:13px;color:#060a0d;font-weight:normal;padding:5px;text-align:justify;}
        span.t-5{display:block;font-size:13px;color:#ff006e;font-weight:bold;clear:left;}
        .detalle img{display:block;max-width:95%;}
        
        .detalle button.file{border:0px;width:80%;color:#fff;background-color:#0094ff;border-radius:4px;padding:10px;margin:auto;display:block;cursor:pointer;background-size:30px;background-image:url(img/Titan_Company_Logo.png);background-repeat:no-repeat;background-position-x:5px;background-position-y:center;}
        .detalle button.file:active{color:#0094ff;background-color:#fff;}
        .detalle hr{border:0px;border-bottom:1px solid #0094ff;margin-top:20px;margin-bottom:20px;}

        .scrollable{overflow:auto;padding-bottom:30px;}

        .btns-up{}
        .btns-up button{border:0px;background:transparent;width:30px;padding:0px;float:right;margin-right:30px;}
        .btns-up button img{width:30px;}      
        
        html body hr.clearn{clear:both;border:0px;margin:0px;}

        ul.seleccionable li{cursor:pointer;}
        ul.lista-files{list-style:none;margin-top:0px;}
        ul.lista-files li{padding:5px;font-size:12px;height:30px;}

        button.del-btn{padding:0px;float:left;border:0px;background:transparent;width:30px;}        
        button.del-btn img{width:30px;}
        .lista-files span{display:inline-block;margin-top:10px;}

        .texto-discreto{color:#888;}

        .check-activacion{border-top:1px solid #0094ff;border-bottom:10px solid #dadada;font-size:13px;padding:5px;}
        .check-activacion .etiqueta{width:75%;float:left;display:block;margin-top:4px;}
        .check-activacion .switch{float:left;margin-top:7px;}

        .buscador{}
        .buscador .busqueda{background-color:#eee;}
        .buscador .busqueda input{border:1px solid #0094ff !important;width:70% !important;}
        .buscador .logo-frac{width:30%;display:block;margin:auto;margin-top:40px;margin-bottom:30px;}
        .buscador p{width:60%;display:block;margin:auto;margin-top:30px;font-size:12px;background-color:#dadada;border-radius:8px;padding:20px;text-align:center;color:#0e507a;}

        .agregar .opcion-1{background-color:#dadada;color:#0094ff;padding-left:40px;background-image:url(img/date.png)}
        .seleccionado{background-color:#0094ff;display:block;padding:10px;}


        div.home{background-color:#fff;}
        .menu{padding:0px;list-style:none;width:80%;padding-top:30px;margin-top:0px;margin-bottom:0px;margin-left:auto;margin-right:auto;}
        .menu li{margin:0px;padding:0px;float:left;width:50%;height:75px;margin:0px;}
        .menu li button{background-color:transparent;color:#333;width:100%;height:100%;border:0px;}
        .menu li button:active{border:1px solid #979797;}

        .menu .ok{color:#333}

        .edicion select{width:80%;display:block;border:0px;padding:10px;font-family:Verdana;color:#333;float:left;}
        button.sel-btn{float:right;border:0px;background-color:transparent;width:30px;margin-right:20px;margin-top:5px;}
        button.sel-btn img{width:30px;}

        tr.resultado{font-size:11px;text-align:right;}

        .menu button img{width:40px;display:block;margin:auto;}

        .proyectos{}
        .tab{width:30%;margin-left:1%;text-align:center;padding-top:5px;padding-bottom:5px;float:left;cursor:pointer;}

        .tabs-down{background-color:#0094ff;color:#fff;padding-top:3px;border:1px solid #116f8f;position:absolute;bottom:0px;width:100%;}
        .tab{font-size:12px;border-radius:4px;margin-top:2px;}
        .tab-sel{background-color:#fff;color:#2c5878;}

        .graficas li.item{padding-bottom:15px;}
        .graficas li.item span.t-1{float:none;padding:10px;width:unset;font-weight:normal;}
        .g-1{display:block;background-color:#ddd;padding:3px;position:relative;height:14px;}
        .g-1:active{background-color:#fff;}
        .g-1 span{display:block;background-color:#0094ff;position:absolute;height:14px;}
        .g-1 b{display:block;width:100%;position:absolute;text-align:center;font-size:11px;font-weight:normal;color:#002b4a}

        table{width:100%;}
        table td{border:0px solid #0094ff;}
        table th{font-size:13px;color:#002b4a;background-color:#eee;font-weight:normal;text-align:center;padding:5px;}

        #detalle-proyectos-avance label,#detalle-proyectos-pagos label{display:block;padding:5px;font-size:11px;font-weight:bold;background-color:#ddd;text-align:center;}
        table.graficas td{border:0px;background-color:#eee;}
        .graf-pie{text-align:center;}
        .graf-pie img{width:70%;}

        table.desglose{margin-top:20px;}
        table.desglose img{width:40px;}
        i.subtotal{float:right;}
        table.desglose th{background-color:#e9e3e3;}

        .graf-barra{position:relative;height:20px;}
        .graf-barra .progreso{background-color:#6da2f2;display:block;height:18px;position:absolute;}
        .graf-barra b{display:block;height:20px;position:absolute;text-align:center;font-size:11px;width:100%;margin-top:1px;}
        table.transparente tr{background-color:transparent;}
        #pro-licitacion .agregar{border:0px;}
        .p12{font-size:12px;}

        .btns-texto{text-align:center;}
        .btns-texto label{padding:15px;}
        .btns-texto table tr td{border:0px;}
        .btns-texto button{width:80%; font-size:20px;color:#fff;margin-top:20px;margin-bottom:12px;border:1px solid #0e507a;background-color:#0094ff;padding:10px;}
        .btns-texto button:active{color:#0e507a;background-color:#fff;}

        .edicion table.lista-files{text-align:center;}
        .edicion table.lista-files img{max-height:100px;max-width:100%;}
        .edicion table.lista-files textarea{height:50px;}
        .si{color:#00ce0a !important;}
        .no{color:#ff0027 !important;}
        .pantalla-2,.pantalla-3,pantalla-4{overflow:auto;}
    </style>

    <style id="css-sizes">

    </style>

    <script src="jquery-1.11.3.min.js"></script>
    <script>

        function MostrarOpcionesHabilitadas() {
            var funcionesEnPantalla = { btns: [], claves: [] };
            var botones = document.getElementsByTagName("button");
            var j = 0;
            for (var i = 0; i < botones.length;i++){
                if (botones[i].getAttribute("clave_funcion")){
                    funcionesEnPantalla.claves[j] = botones[i].getAttribute("clave_funcion");
                    funcionesEnPantalla.btns[j++] = botones[i];
                }
            }
            $.post('controlador.aspx?op=ObtenerFuncionesHabilitadas&seccion=seguridad&funciones=' + funcionesEnPantalla.claves.join(","), function (xmlDoc) {
                var funcionesRecibidas = xmlDoc.getElementsByTagName("Table");
                for (var n = 0; n<funcionesRecibidas.length;n++){
                    for (var k = 0; k < funcionesEnPantalla.btns.length; k++){
                        if (funcionesEnPantalla.btns[k].getAttribute("clave_funcion") == GetValor(funcionesRecibidas[n], "clave_funcion")) {
                            document.getElementById(funcionesEnPantalla.btns[k].getAttribute("control")).style.display = "block";
                        }
                    }
                }
                document.getElementById("mostrar-opciones").style.display = "none";
                document.getElementById("ocultar-opciones").style.display = "block";
            });
        }

        function OcultarOpciones() {
            var funcionesEnPantalla = { btns: [], claves: [] };
            var botones = document.getElementsByTagName("button");
            var j = 0;
            for (var i = 0; i < botones.length; i++) {
                if (botones[i].getAttribute("clave_funcion")) {
                    funcionesEnPantalla.claves[j] = botones[i].getAttribute("clave_funcion");
                    funcionesEnPantalla.btns[j++] = botones[i];
                }
            }
            for (var k = 0; k < funcionesEnPantalla.btns.length; k++) {
                document.getElementById(funcionesEnPantalla.btns[k].getAttribute("control")).style.display = "none"; 
            }
            document.getElementById("mostrar-opciones").style.display = "block";
            document.getElementById("ocultar-opciones").style.display = "none";
        }

        function ToogleOpcionesUsuario(obj) {
            obj = document.getElementById(obj);
            if (obj.style.display == "none") {
                obj.style.display = "block";
            } else {
                obj.style.display = "none";
            }
        }


        function GetValor(domXML, tag) {
            var valor = "";
            try { valor = domXML.getElementsByTagName(tag)[0].childNodes[0].nodeValue; } catch (e) { }    
            return valor;
        }

        function Mostrar(p1,p2) {
            document.getElementById(p1).style.display = "none";
            document.getElementById(p2).style.display = "block";
        }

        function IniciarEditarDirectorio(esNuevo) {
            Mostrar('lista-directorio', 'p-edicion-directorio');
        }

        function IniciarEditarComunicados(esNuevo) {
            if (esNuevo) {
                Mostrar('lista-comunicados', 'p-edicion-comunicados');
                document.getElementById("cancelar-edit-comunicados").onclick = function () { Mostrar('p-edicion-comunicados', 'lista-comunicados');}
            } else {
                Mostrar('detalle-comunicados', 'p-edicion-comunicados');
                document.getElementById("cancelar-edit-comunicados").onclick = function () { Mostrar('p-edicion-comunicados', 'detalle-comunicados'); }
            }
        }

        function IniciarConfigurarNotificaciones() {
            Mostrar('detalle-notificaciones', 'p-edicion-notificaciones');
        }

        function IniciarEditarSolmtto() {
            Mostrar('detalle-solmtto', 'p-edicion-solmtto');
        }

        function IniciarEditarProdserv() {
            if (esNuevo) {
                Mostrar('lista-prodserv', 'p-edicion-prodserv');
                document.getElementById("cancelar-edit-prodserv").onclick = function () { Mostrar('p-edicion-prodserv', 'lista-prodserv'); }
            } else {
                Mostrar('detalle-prodserv', 'p-edicion-prodserv');
                document.getElementById("cancelar-edit-prodserv").onclick = function () { Mostrar('p-edicion-prodserv', 'detalle-prodserv'); }
            }
        }

        function BuscarProdServ() {
            Mostrar('buscador-prodserv', 'lista-prodserv');
        }

        window.onresize = function () {
            EstablecerDimensiones();
        }

        function IniciarApp() {
            EstablecerDimensiones();
            PantallaMostrar("pp-home", "section");
            var tabInicioPro = document.getElementById("tab-inicio-pro");
            TabMostrar(tabInicioPro, tabInicioPro.parentNode, 'pro-ejecucion');
        }

        function EstablecerDimensiones() {
            var heightApp = parseInt(window.innerHeight - 40, 10) + 5;
            var style = document.getElementById("css-sizes");
            style.innerHTML = ".pantalla {height:" + heightApp + "px !important;}";
            style.innerHTML += ".pantalla-2 {height:" + (heightApp - 64) + "px !important;}";
            style.innerHTML += ".pantalla-3 {height:" + (heightApp - 27) + "px !important;}";
            style.innerHTML += ".pantalla-4 {height:" + (heightApp - 27) + "px !important;}";
            style.innerHTML += ".scrollable {height:" + (heightApp - 142) + "px !important;}";
        }

        function SeleccionarConceptoPagar(objeto){
            if (objeto.className=="seleccionado") {
                objeto.removeAttribute("class");
            } else {
                objeto.setAttribute("class","seleccionado");
            }
            CalcularAportacion();
        }

        function CalcularAportacion() {
            var items = document.getElementById("lista-conceptos").getElementsByTagName("li");
            var cuenta = 0;
            for (var i = 0; i < items.length; i++) {
                if (items[i].getElementsByTagName("span").length > 0 && items[i].getElementsByTagName("span")[0].className == "seleccionado") {
                    cuenta += parseFloat(items[i].getElementsByTagName("span")[0].getAttribute("precio"));
                }
            }
            document.getElementById("aportacion").innerHTML = "$ " + cuenta;
        }

        function IniciarRegistrarErogacion() {
            Mostrar('lista-erogacion', 'p-edicion-erogacion');
        }

        function TabMostrar(tab, raiz, id) {
            try { raiz.seleccionado.className="tab"; } catch (e) { }
            raiz.seleccionado = tab;
            raiz.seleccionado.className = "tab tab-sel";
            var tabs = raiz.getAttribute("tabs").split(',');
            for (var i = 0; i < tabs.length; i++) {
                document.getElementById(tabs[i]).style.display = "none";
            }
            document.getElementById(id).style.display = "block";
        }

        function PantallaMostrar(id,tagName){           
            var pants = document.getElementsByTagName(tagName);
            for (var i = 0; i < pants.length; i++){
                pants[i].style.display = "none";
            }
            document.getElementById(id).style.display = "block";
        }

        function IniciarEditarPlanPro(id) {
            document.getElementById('p-edicion-proyecto').idanterior = id;
            Mostrar(id, 'p-edicion-proyecto');
        }

        function IniciarEditarPagosPro(id) {
            document.getElementById('p-edicion-proyecto-pagos').idanterior = id;
            Mostrar(id, 'p-edicion-proyecto-pagos');
        }

        function IniciarEditarAvancesPro(id) {
            document.getElementById('p-edicion-proyecto-avance').idanterior = id;
            Mostrar(id, 'p-edicion-proyecto-avance');
        }

        function IniciarRegistrarPro() {
            Mostrar('lista-pro','p-edicion-pro');
        }

        function IniciarSesion() {
            IntercambioVisual('main','login');
        }

        function IntercambioVisual(id1,id2){
            document.getElementById(id1).style.display = "block";
            document.getElementById(id2).style.display = "none";
        }

    </script>

</head>
<body unselectable="on" onselectstart="return false;" onload="IniciarApp();">
    <div class="login" style="z-index:1000;" id="login">
        <fieldset>
            <legend><img src="img/Titan_Company_Logo.png" /></legend>
            <input placeholder="Usuario" />
            <input placeholder="Contraseña" />
            <button onclick="IniciarSesion();">Iniciar</button>
            <span class="olvido">¿Olvidó su contraseña?</span>
        </fieldset>
        <span class="copyright">Copyright &#x24B8; 2018 Softronel,Inc.</span>
    </div>

    <div style="position:relative;" id="main">

        <div class="opciones-usuario">
            <div class="datos-usuario"><img class="home" style="margin-top:-8px;" src="img/home.png"  onclick="PantallaMostrar('pp-home','section');" /><span>Lucely Janeth Rodriguez Almaguer</span><img src="img/user.png" onclick="ToogleOpcionesUsuario('opciones-usuario');" /></div>
            <ul id="opciones-usuario" style="display:none;">
                <li>Usuario Residente</li>
                <li><i>Calle Sofía No. 106, Mz-3, Lt-24, IB</i></li>
                <li><b>Fraccionamiento Los Amores de Don Juan</b></li>
                <li><button onclick="MostrarOpcionesHabilitadas();" id="mostrar-opciones">Mostrar opciones de edición</button></li>
                <li><button onclick="OcultarOpciones();" id="ocultar-opciones" style="display:none;">Ocultar opciones de edición</button></li>
                <li><button onclick="CerrarSesion">Cerrar sesión</button></li>
            </ul>
        </div>
        
        <section class="pantalla home" id="pp-home">
            <ul class="menu">
                <li><button onclick="PantallaMostrar('pp-projectos','section');" class="no"><img src="img/proyectos.png"/>Projectos</button></li>
                <li><button onclick="PantallaMostrar('pp-aportaciones','section');" class="ok"><img src="img/aportaciones.png"/>Aportaciones</button></li>
                <li><button onclick="PantallaMostrar('pp-solmtto','section');" class="ok"><img src="img/solmtto.png"/>Solicitudes Mtto.</button></li>
                <li><button onclick="PantallaMostrar('pp-erogaciones','section');" class="ok"><img src="img/erogaciones.png"/>Erogaciones</button></li>
                <li><button onclick="PantallaMostrar('pp-reportes','section');" class="no"><img src="img/reportes.png"/>Reportes</button></li>
                <li><button onclick="PantallaMostrar('pp-encuestas','section');" class="no"><img src="img/encuestas.png"/>Encuestas</button></li>
                <li><button onclick="PantallaMostrar('pp-serviciosproductos','section');" class="ok"><img src="img/serviciosproductos.png"/>Productos y Servicios</button></li>
                <li><button onclick="PantallaMostrar('pp-directorio','section');" class="ok"><img src="img/directorio.png"/>Directorio</button></li>
                <li><button onclick="PantallaMostrar('pp-comunicados','section');" class="ok"><img src="img/comunicados.png"/>Comunicados</button></li>
                <li><button onclick="PantallaMostrar('pp-notificaciones','section');" class="ok"><img src="img/notificaciones.png"/>Notificaciones</button></li>
            </ul>
        </section>

        <section class="pantalla directorio" id="pp-directorio">
            <div class="lista" id="lista-directorio">
                <div class="titulo">Directorio</div>
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-directorio" style="display:none;"><button clave_funcion="1" control="edicion-directorio" onclick="IniciarEditarDirectorio(true);">Aregar contácto</button></div>
                <ul class="lista">
                    <li class="item">
                        <span>Juan Rodolfo Jimenez Gomez</span>
                        <ol>
                            <li>    
                                <button class="edit-btn" clave_funcion="2" control="ed-2-1"  id="ed-2-1"  style="display:none;"  onclick="IniciarEditarDirectorio();" ><img src="img/edit.png"/></button>
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                                        
                                <hr class="clear" />
                            </li>
                        </ol>
                    </li>

                    <li class="item">
                        <span>Juan Rodolfo Jimenez Gomez</span>
                        <ol>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-2" id="ed-2-2"  style="display:none;"  ><img src="img/edit.png"/></button>
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                        
                                <hr class="clear" />
                            </li>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-3"  id="ed-2-3" style="display:none;" ><img src="img/edit.png" /></button> 
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                         
                                <hr class="clear" />
                            </li>
                        </ol>
                    </li>

                    <li class="item">
                        <span>Juan Rodolfo Jimenez Gomez</span>
                        <ol>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-3"  id="ed-2-3"  style="display:none;"  ><img src="img/edit.png"/></button> 
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                       
                                <hr class="clear" />
                            </li>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-4"  id="ed-2-4"  style="display:none;"  ><img src="img/edit.png"/></button> 
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                         
                                <hr class="clear" />
                            </li>
                        </ol>
                    </li>

                    <li class="item">
                        <span>Juan Rodolfo Jimenez Gomez</span>
                        <ol>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-5"  id="ed-2-5"  style="display:none;"  ><img src="img/edit.png"/></button>
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                        
                                <hr class="clear" />
                            </li>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-6"  id="ed-2-6"  style="display:none;"  ><img src="img/edit.png"/></button> 
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                         
                                <hr class="clear" />
                            </li>
                        </ol>
                    </li>

                    <li class="item">
                        <span>Juan Rodolfo Jimenez Gomez</span>
                        <ol>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-7"  id="ed-2-7"  style="display:none;"  ><img src="img/edit.png"/></button>   
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                     
                                <hr class="clear" />
                            </li>
                            <li>
                                <button class="edit-btn" clave_funcion="2" control="ed-2-8"  id="ed-2-8"   style="display:none;"  ><img src="img/edit.png"/></button>
                                <span>55 85 68 13 29</span>
                                <a class="call-btn" href="tel://55 85 68 13 29"><img src="img/call.png" /></a>                          
                                <hr class="clear" />
                            </li>
                        </ol>
                    </li>

                </ul>
            </div>
            <div class="edicion pantalla-3" style="display:none;" id="p-edicion-directorio">
                <div class="titulo">Edición de contácto <button class="cancelar" onclick="Mostrar('p-edicion-directorio','lista-directorio');">Cancelar</button></div>
                <label>Nombre</label><input />
                <label>Teléfono</label><input />
                <label>Teléfono 2</label><input />
                <label>Teléfono 3</label><input />
                <button class="aceptar">Aceptar</button>
            </div>
        </section>

        <section class="pantalla comunicados" id="pp-comunicados">
            <div class="lista" id="lista-comunicados">
                <div class="titulo">Comunicados</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-comunicados" style="display:none;"><button clave_funcion="5" control="edicion-comunicados" onclick="IniciarEditarComunicados(true);">Aregar comunicado</button></div>
                <ul class="lista seleccionable pantalla-3">
                    <li class="item" onclick="Mostrar('lista-comunicados','detalle-comunicados');">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez Lara Vazquez(Administración)</span>                    
                        <span class="t-3">publicado:<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-comunicados" style="display:none;">
                <div class="titulo">Comunicado <button class="regresar" onclick="Mostrar('detalle-comunicados','lista-comunicados');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-com-3" id="edit-com-3" onclick="IniciarEditarComunicados();"><img src="img/edit.png" /></button><button style="display:none;" onclick="IniciarEliminarComunicado();" clave_funcion="4" control="del-com-4" id="del-com-4" class="delete-btn"><img src="img/del.png" /></button><hr class="clearn" /></div>
                    <span class="t-1">Junta general</span>                    
                    <span class="t-2">Juan Rodolfo Jimenez Gomez(Administracion-Presidente)</span>                    
                    <span class="t-3">11-ene-2018</span>                    
                    <span class="t-4">Se le informa a los vecinos, que la próxima reunión general se llevara a cabo el 28 de febrero del 2019, en el salon de usos múltiples, a la 9 pm. Se les recuerda que deberan llegar 10 min. antes para el pase de lista.</span>                    
                    <img class="file" src="img/Titan_Company_Logo.png" />                    
                    <img class="file" src="img/call.png"/>   
                    <hr />
                    <button class="file">Minuta_12-ene-2018.pdf</button> 
                </div>
             </div>
            <div class="edicion pantalla-3" style="display:none;" id="p-edicion-comunicados">
                <div class="titulo">Edición de comunicados <button class="cancelar" id="cancelar-edit-comunicados">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Título</label><input />
                    <label>Descripción</label><textarea style="height:180px;"></textarea>                                
                    <div class="btns-up" style="margin-top:15px;"><button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarComunicado();"><img src="img/attach.png" /><span class="texto-discreto">Adjuntar</span></button><hr class="clearn" /></div>
                    <ul class="lista-files">
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>100_800.img</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                    </ul>                 
                    <button class="aceptar" >Aceptar</button>
                </div>
            </div>
        </section>

        <section class="pantalla notificaciones" id="pp-notificaciones">
            
            <div class="lista" id="lista-notificaciones">
                <div class="titulo">Notificaciones</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-notificaciones" style="display:none;"><button clave_funcion="6" control="edicion-notificaciones" onclick="IniciarEditarNotificaciones();">Configurar notificaciones</button></div>
                <ul class="lista seleccionable pantalla-3">
                    <li class="item" onclick="Mostrar('lista-notificaciones','detalle-notificaciones');">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez Lara Vazquez(Administración)</span>                    
                        <span class="t-3">publicado:<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                    <li class="item">
                        <span class="t-1">Junta general</span>                    
                        <span class="t-2">Juan Rodolfo Jimenez Gomez</span>                    
                        <span class="t-3">11-ene-2018</span>                    
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-notificaciones" style="display:none;">
                <div class="titulo">Notificación <button class="regresar" onclick="Mostrar('detalle-notificaciones','lista-notificaciones');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="6" style="display:none;" control="edit-not-6" id="edit-not-6" onclick="IniciarConfigurarNotificaciones();"><img src="img/edit.png" /></button><button style="display:none;" onclick="IniciarEliminarNotificacion();" clave_funcion="7" control="del-notif-7" id="del-notif-7" class="delete-btn"><img src="img/del.png" /></button><hr class="clearn" /></div>
                    <span class="t-1">Nuevo cumunicado</span>                    
                    <span class="t-2">Administracion-Presidente</span>                    
                    <span class="t-3">11-ene-2018</span>                    
                    <span class="t-4">Administración envió un comunicado.</span>                                        
                </div>
             </div>
            <div class="configuracion" style="display:none;" id="p-edicion-notificaciones">
                <div class="titulo">Edición de comunicados <button class="cancelar" id="cancelar-edit-notificaciones">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <div class="check-activacion"><label class="etiqueta">Hay una diferencia mayor que $ 2000.00, entre saldo físico y saldo real.</label><label class="switch"><input type="checkbox"/><span class="slider round"></span></label><hr class="clearn" /></div>
                    <div class="check-activacion"><label class="etiqueta">Hay una diferencia mayor que $ 2000.00, entre saldo físico y saldo real.</label><label class="switch"><input type="checkbox"/><span class="slider round"></span></label><hr class="clearn" /></div>
                    <div class="check-activacion"><label class="etiqueta">Hay una diferencia mayor que $ 2000.00, entre saldo físico y saldo real.</label><label class="switch"><input type="checkbox"/><span class="slider round"></span></label><hr class="clearn" /></div>
                    <div class="check-activacion"><label class="etiqueta">Hay una diferencia mayor que $ 2000.00, entre saldo físico y saldo real.</label><label class="switch"><input type="checkbox"/><span class="slider round"></span></label><hr class="clearn" /></div>
                </div>
            </div>           
        </section>

        <section class="pantalla productosservicios" id="pp-serviciosproductos">
            <div class="buscador" id="buscador-prodserv">
                <div class="titulo">Productos y Servicios</div>      
                <img class="logo-frac" src="img/Titan_Company_Logo.png" />      
                <div class="busqueda"><input placeholder="Buscar" onclick="BuscarProdServ();" /></div> 
                <p>Encuentra servicios y productos que ofrecen dentro del fracciomaniento</p>
            </div>
            <div class="lista" id="lista-prodserv" style="display:none;">
                <div class="titulo"><button class="regresar" onclick="Mostrar('lista-prodserv','buscador-prodserv');">Regresar</button>Productos y Servicios</div>            
                <div class="agregar" id="edicion-prodserv" style="display:none;"><button clave_funcion="10" control="edicion-prodserv" onclick="IniciarEditarProdserv(true);">Aregar comunicado</button></div>
                <ul class="lista seleccionable pantalla-3">
                    <li class="item" onclick="Mostrar('lista-prodserv','detalle-prodserv');">
                        <span class="t-1">Psicologo Familiar, especialista en aprendizaje en niños.</span>                       
                        <span class="t-2">Teléfono(s) 5585681329, 55123698, 58986312</span>                    
                        <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>              
                    </li>
                    <li class="item" onclick="Mostrar('lista-prodserv','detalle-prodserv');">
                        <span class="t-1">Tacos y Burritos "El Oaxaqueño"</span>                       
                        <span class="t-2">Teléfono(s) 5585681329,55123698,58986312</span>                    
                        <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>              
                    </li>
                    <li class="item" onclick="Mostrar('lista-prodserv','detalle-prodserv');">
                        <span class="t-1">Tacos y Burritos "El Oaxaqueño"</span>                       
                        <span class="t-2">Teléfono(s) 5585681329,55123698,58986312</span>                    
                        <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>              
                    </li>
                   <li class="item" onclick="Mostrar('lista-prodserv','detalle-prodserv');">
                        <span class="t-1">Tacos y Burritos "El Oaxaqueño"</span>                       
                        <span class="t-2">Teléfono(s) 5585681329,55123698,58986312</span>                    
                        <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>              
                    </li>
                    <li class="item" onclick="Mostrar('lista-prodserv','detalle-prodserv');">
                        <span class="t-1">Tacos y Burritos "El Oaxaqueño"</span>                       
                        <span class="t-2">Teléfono(s) 5585681329,55123698,58986312</span>                    
                        <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>              
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-prodserv" style="display:none;">
                <div class="titulo">Productos y Servicios <button class="regresar" onclick="Mostrar('detalle-prodserv','lista-prodserv');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="10" style="display:none;" control="edit-prodserv-3" id="edit-prodserv-3" onclick="IniciarEditarProdserv();"><img src="img/edit.png" /></button><button style="display:none;" onclick="IniciarEliminarProdserv();" clave_funcion="11" control="del-prodserv-11" id="del-prodserv-11" class="delete-btn"><img src="img/del.png" /></button><hr class="clearn" /></div>
                    <div class="check-activacion"><label class="etiqueta">Publicar</label><label class="switch"><input type="checkbox"/><span class="slider round"></span></label><hr class="clearn" /></div>
                    <span class="t-1">Tacos y Burritos "El Oaxaqueño"</span>                       
                    <span class="t-2">Teléfono(s) 5585681329,55123698,58986312</span>                    
                    <span class="t-3">Horario: Todos los días de 8pm a 10pm</span>                    
                    <span class="t-4">Con gusto les ofrecemos tacos y burritos. <br />
                        Burritos:2 * $50.00 <br />
                        Tacos:  3 * $25.00 <br />
                        Tacos de Birria:2 * $50.00 <br />
                    </span>                    
                    <img class="file" src="img/Tacos-al-Pastor-Jalisco.jpg" />
                    <img class="file" src="img/1490969045_123184_1490969549_noticia_normal.jpg" />
                    <hr />
                </div>
             </div>
            <div class="edicion" style="display:none;" id="p-edicion-prodserv">
                <div class="titulo">Edición de comunicados <button class="cancelar" id="cancelar-edit-prodserv">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Título</label><input />
                    <label>Palabras clave</label><input />
                    <label>Teléfono </label><input />
                    <label>Teléfono 2</label><input />
                    <label>Teléfono 3</label><input />
                    <label>Horario</label><input />                    
                    <label>Descripción</label><textarea style="height:180px;"></textarea>                                
                    <div class="btns-up" style="margin-top:15px;"><button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarPublicidad();"><img src="img/attach.png" /><span class="texto-discreto">Adjuntar</span></button><hr class="clearn" /></div>
                    <ul class="lista-files">
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>100_800.img</span></li>
                    </ul>                 
                    <button class="aceptar" >Aceptar</button>
                </div>
            </div>
        </section>

        <section class="pantalla solmtto" id="pp-solmtto">  
            <div class="lista" id="lista-solmtto">
                <div class="titulo">Solicitudes de Mantenimiento</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-solmtto" style="display:none;"><button clave_funcion="8" control="edicion-solmtto" onclick="IniciarEditarComunicados(true);">Aregar comunicado</button></div>
                <ul class="lista seleccionable pantalla-3">
                    <li class="item" onclick="Mostrar('lista-solmtto','detalle-solmtto');">       
                        <span class="t-1">Lamparas descompuestas</span>                    
                        <span class="t-1"><span style="color:#ff006e;">Enviado/Visto/Atendido</span></span>                    
                        <span class="t-2">Lucely Yanet Rodriguez Almaguer</span>                    
                        <span class="t-3">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-solmtto','detalle-solmtto');">       
                        <span class="t-1">Lamparas descompuestas</span>                    
                        <span class="t-1"><span style="color:#ff006e;">Enviado/Visto/Atendido</span></span>                    
                        <span class="t-2">Lucely Yanet Rodriguez Almaguer</span>                    
                        <span class="t-3">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-solmtto','detalle-solmtto');">       
                        <span class="t-1">Lamparas descompuestas</span>                    
                        <span class="t-1"><span style="color:#ff006e;">Enviado/Visto/Atendido</span></span>                    
                        <span class="t-2">Lucely Yanet Rodriguez Almaguer</span>                    
                        <span class="t-3">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-solmtto','detalle-solmtto');">       
                        <span class="t-1">Lamparas descompuestas</span>                    
                        <span class="t-1"><span style="color:#ff006e;">Enviado/Visto/Atendido</span></span>                    
                        <span class="t-2">Lucely Yanet Rodriguez Almaguer</span>                    
                        <span class="t-3">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-solmtto','detalle-solmtto');">       
                        <span class="t-1">Lamparas descompuestas</span>                    
                        <span class="t-1"><span style="color:#ff006e;">Enviado/Visto/Atendido</span></span>                    
                        <span class="t-2">Lucely Yanet Rodriguez Almaguer</span>                    
                        <span class="t-3">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-solmtto" style="display:none;">
                <div class="titulo">Solicitud de Mantenimiento<button class="regresar" onclick="Mostrar('detalle-solmtto','lista-solmtto');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-solmtto-8" id="edit-solmtto-8" onclick="IniciarEditarSolmtto();"><img src="img/edit.png" /></button><hr class="clearn" /></div>
                    <span class="t-1">Lamparas descompuestas</span>                    
                    <span class="t-2">Lucely Janet Rodriguez Almaguer</span>                    
                    <span class="t-3">11-ene-2018</span>                    
                    <span class="t-4">Buenas tardes, diculpen, solo para avisarles que dos lamparas de la calle sofia no prenden. vean: </span>                    
                    <img class="file" src="img/Titan_Company_Logo.png" />                    
                    <img class="file" src="img/call.png"/>   
                    <hr />
                </div>
             </div>
            <div class="edicion" style="display:none;" id="p-edicion-solmtto">
                <div class="titulo">Edición de Solcitud de Mtto. <button class="cancelar" id="cancelar-edit-solmtto">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Título</label><input />
                    <label>Descripción</label><textarea style="height:180px;"></textarea>                                
                    <div class="btns-up" style="margin-top:15px;"><button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Adjuntar</span></button><hr class="clearn" /></div>
                    <ul class="lista-files">
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>100_800.img</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                    </ul>                 
                    <button class="aceptar" >Aceptar</button>
                </div>
            </div>
        </section>

        <section class="pantalla aportaciones" id="pp-aportaciones">            
            <div class="lista" id="lista-aportaciones">
                <div class="titulo">Aportaciones</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-aportaciones" ><button class="opcion-1" style="float:left;width:30%;">Actual</button><button clave_funcion="8" control="pagar-concepto" onclick="IniciarPagarAportaciones(true);" style="width:60%;float:right;">Aportar <span id="aportacion">$0.00</span></button><hr class="clearn" /></div>
                <ul class="lista seleccionable pantalla-3" style="width:100%;" id="lista-conceptos">
                    <div style="display:none;">
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">DICIEMBRE-2019</span>                                            
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">NOVIEMBRE-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">OCTUBRE-2019</span>                                                 
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">SEPTIEMBRE-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">AGOSTO-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">JULIO-2019</span>                                               
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">JUNIO-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">MAYO-2019</span>                                                 
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">ABRIL-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">MARZO-2019</span>                                                
                        </li>
                        <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                            <span class="t-1">FEBRERO-2019</span>                                               
                        </li>
                    </div>
                    <li class="item" onclick="" id="actual-concepto">       
                        <span class="t-1" onclick="SeleccionarConceptoPagar(this);" precio="170.00">ENERO-2019</span>                                                
                    </li>
                    <li class="item" onclick="">       
                        <span class="t-1" onclick="SeleccionarConceptoPagar(this);" precio="170.00">Biblioteca-2019</span>                                           
                    </li>
                    <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                        <span class="t-1">DICIEMBRE-2018 - <b>Pagado</b></span>                                       
                        <span class="t-2">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                        <span class="t-1">NOVIEMBRE-2018 - <b>Pagado</b></span>                                       
                        <span class="t-2">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>                    
                    </li>
                    <li class="item" onclick="Mostrar('lista-aportaciones','detalle-aportaciones');">       
                        <span class="t-1">OCTUBRE-2018 - <b>Pagado</b></span>                                       
                        <span class="t-2">Folio: 00254<br /> 11-ene-2018 9:25 pm</span>
                        <hr style="min-height:500px;border:0px;clear:both;"/>                    
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-solmtto" style="display:none;">
                <div class="titulo">Solicitud de Mantenimiento<button class="regresar" onclick="Mostrar('detalle-solmtto','lista-solmtto');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-solmtto-8" id="edit-solmtto-8" onclick="IniciarEditarSolmtto();"><img src="img/edit.png" /></button><hr class="clearn" /></div>
                    <span class="t-1">Lamparas descompuestas</span>                    
                    <span class="t-2">Lucely Janet Rodriguez Almaguer</span>                    
                    <span class="t-3">11-ene-2018</span>                    
                    <span class="t-4">Buenas tardes, diculpen, solo para avisarles que dos lamparas de la calle sofia no prenden. vean: </span>                    
                    <img class="file" src="img/Titan_Company_Logo.png" />                    
                    <img class="file" src="img/call.png"/>   
                    <hr />
                </div>
             </div>
            <div class="edicion" style="display:none;" id="p-edicion-solmtto">
                <div class="titulo">Edición de Solcitud de Mtto. <button class="cancelar" id="cancelar-edit-solmtto">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Título</label><input />
                    <label>Descripción</label><textarea style="height:180px;"></textarea>                                
                    <div class="btns-up" style="margin-top:15px;"><button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Adjuntar</span></button><hr class="clearn" /></div>
                    <ul class="lista-files">
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>100_800.img</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                        <li><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></li>
                    </ul>                 
                    <button class="aceptar" >Aceptar</button>
                </div>
            </div>
        </section>
                
        <section class="pantalla erogaciones" id="pp-erogaciones">            
            <div class="lista" id="lista-erogacion">
                <div class="titulo">Erogaciones</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="IniciarRegistrarErogacion(true);" >Registrar pago</button></div>
                <ul class="lista seleccionable pantalla-3" style="width:100%;">
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                        <span class="t-1">Jardinería>>Sueldos</span>                                            
                        <span class="t-2">$ 4,200.00</span>                                            
                        <span class="t-3">18-Enero-2019 <br /> 7:00 pm</span>                                            
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                        <span class="t-1">Jardinería>>Sueldos</span>                                            
                        <span class="t-2">$ 4,200.00</span>                                            
                        <span class="t-3">18-Enero-2019 <br />7:00 pm</span>                                            
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                        <span class="t-1">Jardinería>>Sueldos</span>                                            
                        <span class="t-2">$ 4,200.00</span>                                            
                        <span class="t-3">18-Enero-2019<br /> 7:30 pm</span>                                            
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                        <span class="t-1">Jardinería>>Sueldos</span>                                            
                        <span class="t-2">$ 4,200.00</span>                                            
                        <span class="t-3">18-Enero-2019<br />7:50 pm</span>                                            
                    </li>
                </ul>
            </div>
            <div class="detalle" id="detalle-erogacion" style="display:none;">
                <div class="titulo">Detalle de pago<button class="regresar" onclick="Mostrar('detalle-erogacion','lista-erogacion');">Regresar</button></div>  
                <div class="pantalla-3">
                    <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-solmtto-8" id="edit-solmtto-8" onclick="IniciarEditarSolmtto();"><img src="img/edit.png" /></button><hr class="clearn" /></div>
                    <span class="t-1">Jardinería >> Sueldos</span>                              
                    <span class="t-2">Total <b>$ 4,200.00</b></span>                              
                    <span class="t-3">11-ene-2018</span>                    
                    <span class="t-4">Pago de sueldos correspondiente a la 1er quincena de enero del 2019, se realizan al sr. Juan Suarez y Fernando José Ramirez </span>                    
                    <span class="t-5">$ 2,200.00</span>
                    <img class="file" src="img/Titan_Company_Logo.png" />                    
                    <span class="t-5">$ 2,000.00</span>
                    <img class="file" src="img/call.png"/>   
                    <hr />
                </div>
             </div>
            <div class="edicion" style="display:none;" id="p-edicion-erogacion">
                <div class="titulo">Edición de Solcitud de Mtto. <button class="cancelar" id="cancelar-edit-erogacion"  onclick="Mostrar('p-edicion-erogacion','lista-erogacion');">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Rubro</label><select><option>Jardinería</option></select><button class="sel-btn"><img src="img/add.png"/></button>
                    <label>Concepto</label><select><option>Sueldos</option></select><button class="sel-btn"><img src="img/add.png"/></button>
                    <label>Descripción</label><textarea style="height:100px;"></textarea>                                                    
                    <label>Comprobantes<button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Agregar</span></button><hr class="clearn" /></label>
                    <table class="lista-files">
                        <tr><td style="width:70%"><button class="del-btn" ><img src="img/del.png" /></button><span>100_800.img</span></td><td  style="width:30%"><input /></td></tr>
                        <tr><td><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></td><td><input /></td></tr>
                        <tr><td><button class="del-btn" ><img src="img/del.png" /></button><span>Minuta_12-ene-2018.pdf</span></td><td><input /></td></tr>
                        <tr class="resultado"><td><b>Total</b></td><td><b>$ 4,200.00</b></td></tr>
                    </table>                 
                    <button class="aceptar" style="margin-top:10px;" >Estoy de acuerdo</button>
                </div>
            </div>
        </section>

        <section class="pantalla encuestas" id="pp-encuestas">
            <div class="lista" id="lista-encuesta">
                <div class="titulo">Encuestas</div>            
                <div class="busqueda"><input placeholder="Buscar" /></div>
                <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="Mostrar('lista-encuesta','p-edicion-encuesta');;" >Agregar encuesta</button></div>      
                <ul class="lista seleccionable pantalla-3" style="width:100%;">
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                        <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                        <span class="t-2">18-Enero-2019 7:00 pm</span>
                        <table class="transparente">
                            <tr><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                        </table>
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                        <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                        <span class="t-2">18-Enero-2019 7:00 pm</span>
                        <table class="transparente">
                            <tr><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                        </table>
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                        <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                        <span class="t-2">18-Enero-2019 7:00 pm</span>
                        <table class="transparente">
                            <tr><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                        </table>
                    </li>
                    <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                        <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                        <span class="t-2">18-Enero-2019 7:00 pm</span>
                        <table class="transparente">
                            <tr><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                            <tr><td><div class="graf-barra" onclick="Mostrar('lista-encuesta','encuesta-votantes');"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                        </table>
                    </li>
                        
                </ul>
            </div>
            <div class="detalle" id="encuesta-votantes" style="display:none;">
                <div class="titulo">Votantes de propuesta<button class="regresar" onclick="Mostrar('detalle-licitacion','lista-licitacion');">Regresar</button></div>  
                <div class="pantalla-3">
                    <ul class="lista seleccionable pantalla-3">
                        <li class="item">
                            <span class="t-2">Sofía 106-B</span>              
                        </li>
                        <li class="item">                 
                            <span class="t-2">Sofía 106-B</span>
                        </li>
                        <li class="item">             
                            <span class="t-2">Sofía 106-B</span>
                        </li>
                        <li class="item">                  
                            <span class="t-2">Sofía 106-B</span>
                        </li>
                        <li class="item">                 
                            <span class="t-2">Sofía 106-B</span>
                        </li>
                    </ul>
                </div>
                </div>                
            <div class="edicion" style="display:none;" id="p-edicion-encuesta">
                <div class="titulo">Editar encuesta <button class="cancelar" id="cancelar-edit-erogacion"  onclick="Mostrar('p-edicion-erogacion','lista-erogacion');">Cancelar</button></div>    
                <div class="pantalla-3" >
                    <label>Descripción</label><textarea style="height:100px;"></textarea>       
                    <label>Opciones de encuesta<button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/add.png" /><span class="texto-discreto">Agregar</span></button><hr class="clearn" /></label>
                    <table class="lista-files">
                        <tr><td style="width:10%"><button class="del-btn" ><img src="img/del.png" /></button></td><td><input /></td></tr>                            
                        <tr><td ><button class="del-btn" ><img src="img/del.png" /></button></td><td><input /></td></tr>                            
                        <tr><td ><button class="del-btn" ><img src="img/del.png" /></button></td><td><input /></td></tr>                            
                    </table>                     
                    <button class="aceptar" style="margin-top:10px;" >Aceptar</button>
                </div>
            </div>
        </section>
                
        <section class="pantalla proyectos" id="pp-projectos"> 
            <div id="pro-ejecucion">
                <div class="lista graficas" id="lista-proyectos">
                    <div class="titulo">Proyectos en Ejecución</div>            
                    <div class="busqueda"><input placeholder="Buscar" /></div>                    
                    <ul class="lista seleccionable scrollable" style="width:100%;">
                        <li class="item">
                            <span class="t-1">Compra e instalación de jegos toboganes para niños de hasta 12 años</span>   
                            <table class="graficas">
                                <tr><th>Pagado</th><th>Realizado</th></tr>
                                <tr><td style="width:50%;"><div class="graf-pie"onclick="Mostrar('lista-proyectos','detalle-proyectos-pagos');"><img src="img/pie2.png" /></div></td><td style="width:50%;"><div class="graf-pie"onclick="Mostrar('lista-proyectos','detalle-proyectos-avance');"><img src="img/pie.png" /></div></td></tr>
                            </table>                                           
                        </li>
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">      
                            <span class="t-1">Compra e instalación de jegos toboganes para niños de hasta 12 años</span>
                            <table class="graficas">
                                <tr><th>Pagado</th><th>Realizado</th></tr>
                                <tr><td style="width:50%;"><div class="graf-pie"><img src="img/pie2.png" /></div></td><td style="width:50%;"><div class="graf-pie"><img src="img/pie.png" /></div></td></tr>
                            </table>
                        </li>
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                            <span class="t-1">Compra e instalación de jegos toboganes para niños de hasta 12 años</span> 
                            <table class="graficas">
                                <tr><th>Pagado</th><th>Realizado</th></tr>
                                <tr><td style="width:50%;"><div class="graf-pie"><img src="img/pie2.png" /></div></td><td style="width:50%;"><div class="graf-pie"><img src="img/pie.png" /></div></td></tr>
                            </table>
                        </li>
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">       
                            <span class="t-1">Compra e instalación de jegos toboganes para niños de hasta 12 años</span>
                            <table class="graficas">
                                <tr><th>Pagado</th><th>Realizado</th></tr>
                                <tr><td style="width:50%;"><div class="graf-pie"><img src="img/pie2.png" /></div></td><td style="width:50%;"><div class="graf-pie"><img src="img/pie.png" /></div></td></tr>
                            </table>
                        </li>
                    </ul>
                </div>
                <div class="detalle" id="detalle-proyectos-pagos" style="display:none;">
                    <div class="titulo">Detalle de proyecto<button class="regresar" onclick="Mostrar('detalle-erogacion','lista-erogacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <div class="btns-up">
                            <button class="edit-btn" clave_funcion="12" control="edit-pro" id="edit-pro" onclick="IniciarEditarPlanPro('detalle-proyectos-pagos');"><img src="img/edit.png" /></button>                            
                            <button onclick="IniciarEditarPagosPro('detalle-proyectos-pagos');" clave_funcion="4" control="del-com-4" id="del-com-4" class="delete-btn"><img src="img/payok.png" /></button>
                            <hr class="clearn" />
                        </div>                        
                        <label>Plan de Trabajo <i class="subtotal">$ 3,600.00</i></label>
                        <table class="desglose">
                            <tr><th colspan="3">Obras y servicios <i class="subtotal">$ 2,200.00</i></th></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/pendiente.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/pendiente.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table> 
                        <table class="desglose" style="margin-top:20px;border-top:1px solid #ddd;">
                            <tr><th colspan="3">Material<i class="subtotal">$ 1,400.00</i></th></tr>
                            <tr><td><span class="t-41">Equipo y accesorios</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/pendiente.png"/></td></tr>                        
                            <tr><td><span class="t-41">Cemento,grava y arena  </span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table> 
                        <hr />
                    </div>
                 </div>
                <div class="detalle" id="detalle-proyectos-avance" style="display:none;">
                    <div class="titulo">Detalle de proyecto<button class="regresar" onclick="Mostrar('detalle-erogacion','lista-erogacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <div class="btns-up">
                            <button class="edit-btn" clave_funcion="12" control="edit-pro" id="edit-pro" onclick="IniciarEditarPlanPro();"><img src="img/edit.png" /></button>
                            <button onclick="IniciarEditarAvancesPro('detalle-proyectos-avance');" clave_funcion="4" control="del-com-4" id="del-com-4" class="delete-btn"><img src="img/vobo.png" /></button>
                        </div>                        
                        <label>Plan de Trabajo</label>
                        <table class="desglose">
                            <tr><th colspan="3">Obras y servicios </th></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><img src="img/pendiente.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><img src="img/pendiente.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><img src="img/ok.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table>                          
                        <hr />
                    </div>
                 </div>
                <div class="edicion" style="display:none;" id="p-edicion-proyecto">
                    <div class="titulo">Edición de Solcitud de Mtto. <button class="cancelar" id="cancelar-edit-proyecto"  onclick="Mostrar('p-edicion-proyecto','lista-proyecto');">Cancelar</button></div>    
                    <div class="scrollable desglose" >
                        <label>Descripción</label><textarea style="height:100px;"></textarea>                                                    
                        <label class="btns-up">Material<button  style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/add.png" /></button><hr class="clearn" /></label>
                        <table class="lista-files">
                            <tr><td style="width:70%"><input /></td><td  style="width:30%"><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr><td><input /></td><td><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr><td><input /></td><td><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr class="resultado"><td><b>Total</b></td><td><b>$ 4,200.00</b></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                        </table>  
                        <label class="btns-up">Obras y servicios<button  style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/add.png" /></button><hr class="clearn" /></label>
                        <table class="lista-files">
                            <tr><td style="width:70%"><input /></td><td  style="width:30%"><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr><td><input /></td><td><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr><td><input /></td><td><input /></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                            <tr class="resultado"><td><b>Total</b></td><td><b>$ 4,200.00</b></td><td><button class="del-btn" ><img src="img/del.png" /></button></td></tr>
                        </table>  
                        <button class="aceptar" style="margin-top:10px;" >Estoy de acuerdo</button>
                    </div>
                </div>
                <div class="edicion" style="display:none;" id="p-edicion-proyecto-avance">
                    <div class="titulo">Registro de Avances<button class="cancelar" id="cancelar-edit-proyecto"  onclick="Mostrar('p-edicion-proyecto','lista-proyecto');">Cancelar</button></div>    
                    <div class="scrollable" >
                        <label>Plan de Trabajo </label>
                        <table class="desglose">
                            <tr><th colspan="3">Obras y servicios </th></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><button><img src="img/ok.png"/></button></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span></td><td><button><img src="img/ok.png"/></button></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><img src="img/ok.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table>                         
                        <button class="aceptar" style="margin-top:10px;" >Estoy de acuerdo</button>
                    </div>
                </div>
                <div class="edicion" style="display:none;" id="p-edicion-proyecto-pagos">
                    <div class="titulo">Registro de pagos <button class="cancelar" id="cancelar-edit-proyecto"  onclick="Mostrar('p-edicion-proyecto','lista-proyecto');">Cancelar</button></div>    
                    <div class="scrollable" >                                              
                        <label>Plan de Trabajo <i class="subtotal">$ 3,600.00</i></label>
                        <table class="desglose">
                            <tr><th colspan="3">Obras y servicios <i class="subtotal">$ 2,200.00</i></th></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><input /></td><td><button><img src="img/ok.png"/></button></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><input /></td><td><button><img src="img/ok.png"/></button></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>
                            <tr><td><span class="t-41">Flete de Material</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table> 
                        <table class="desglose" style="margin-top:20px;border-top:1px solid #ddd;">
                            <tr><th colspan="3">Material<i class="subtotal">$ 1,400.00</i></th></tr>
                            <tr><td><span class="t-41">Equipo y accesorios</span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><input /></td><td><button><img src="img/ok.png"/></button></td></tr>                        
                            <tr><td><span class="t-41">Cemento,grava y arena  </span><span class="t-2">Precio original: $ 157.00</span><span class="t-2">21-enero 2019 11:20 am</span></td><td><span class="t-5">$200.00</span></td><td><img src="img/ok.png"/></td></tr>                        
                        </table> 
                        <hr />
                        <button class="aceptar" style="margin-top:10px;" >Estoy de acuerdo</button>
                    </div>
                    </div>
                </div>
            <div id="pro-licitacion" style="display:none;">
                <div class="lista" id="lista-licitacion">
                    <div class="titulo">Licitaciones</div>            
                    <div class="busqueda"><input placeholder="Buscar" /></div>
                    <ul class="lista seleccionable scrollable" style="width:100%;">
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                            <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="Mostrar('lista-licitacion','p-edicion-licitacion');;" >Agregar participante</button></div>      
                            <div class="edicion"><label>Propuestas</label></div>
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><button class="cancelar" onclick="Mostrar('lista-licitacion','detalle-licitacion');">Ver</button></td><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-licitacion','licitacion-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">Ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                            </table>
                        </li> 
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                            <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="IniciarRegistrarErogacion(true);" >Agregar participante</button></div>      
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><button class="cancelar">Ver</button></td><td style="width:70%;"><div class="graf-barra"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">Ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                            </table>
                        </li> 
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                            <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="IniciarRegistrarErogacion(true);" >Agregar participante</button></div>      
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><button class="cancelar">Ver</button></td><td style="width:70%;"><div class="graf-barra"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">Ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                            </table>
                        </li> 
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');"> 
                            <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="IniciarRegistrarErogacion(true);" >Agregar participante</button></div>      
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><button class="cancelar">Ver</button></td><td style="width:70%;"><div class="graf-barra"><span class="progreso" style="width:25%"></span><b>25%</b></div></td><td style="width:15%;"><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">Ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td><td><input type="radio" /></td></tr>
                                <tr><td><button class="cancelar">ver</button></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td><td><input type="radio" /></td></tr>
                            </table>
                        </li> 
                    </ul>
                </div>
                <div class="detalle" id="licitacion-votantes" style="display:none;">
                    <div class="titulo">Votantes de propuesta<button class="regresar" onclick="Mostrar('detalle-licitacion','lista-licitacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <ul class="lista seleccionable scrollable">
                            <li class="item">
                                <span class="t-2">Sofía 106-B</span>              
                            </li>
                            <li class="item">                 
                                <span class="t-2">Sofía 106-B</span>
                            </li>
                            <li class="item">             
                                <span class="t-2">Sofía 106-B</span>
                            </li>
                            <li class="item">                  
                                <span class="t-2">Sofía 106-B</span>
                            </li>
                            <li class="item">                 
                                <span class="t-2">Sofía 106-B</span>
                            </li>
                        </ul>
                    </div>
                 </div>
                <div class="detalle" id="detalle-licitacion" style="display:none;">
                    <div class="titulo">Detalle de licitante<button class="regresar" onclick="Mostrar('detalle-licitacion','lista-licitacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-solmtto-8" id="edit-solmtto-8" onclick="Mostrar('detalle-licitacion','p-edicion-licitacion');"><img src="img/edit.png" /></button><hr class="clearn" /></div>
                        <span class="t-1">Proveedor >> Ferretería y asociados</span>                              
                        <span class="t-2">Total <b>$ 4,200.00</b></span>                              
                        <span class="t-3">11-ene-2018</span>                    
                        <span class="t-4">Se propone un juego tipo Gardeen 70-B, se describe a continuación:</span>  
                        <img class="file" src="img/Titan_Company_Logo.png" />  
                        <img class="file" src="img/call.png"/>   
                        <div class="edicion">
                            <label>Cotización</label>
                            <table class="lista-files">
                                <tr><td style="width:70%"><button class="del-btn" ><img src="img/verf.png" /><span>servicios.pdf</span></button></td><td  style="width:30%"><span class="t-5">$200.00</span></td></tr>
                                <tr><td><button class="del-btn" ><img src="img/verf.png" /><span>Material.pdf</span></button></td><td><span class="t-5">$200.00</span></td></tr>                                                
                                <tr class="resultado"><td><b>Total</b></td><td><b>$ 4,200.00</b></td></tr>
                            </table>
                        </div>
                        <hr />
                    </div>
                 </div>
                <div class="edicion" style="display:none;" id="p-edicion-licitacion">
                <div class="titulo">Editar participante <button class="cancelar" id="cancelar-edit-erogacion"  onclick="Mostrar('p-edicion-erogacion','lista-erogacion');">Cancelar</button></div>    
                <div class="scrollable" >
                    <label>Proveedor</label><select><option>Proveedor</option></select><button class="sel-btn"><img src="img/add.png"/></button>
                    <label>Descripción</label><textarea style="height:100px;"></textarea>                                                    
                    <label>Imagenes<button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Agregar</span></button><hr class="clearn" /></label>
                    <table class="lista-files">
                        <tr><td style="width:70%"><button class="del-btn" ><img src="img/del.png" /></button><span>vista1.jpg</span></td></tr>
                        <tr><td><button class="del-btn" ><img src="img/del.png" /></button><span>vista2.png</span></td></tr> 
                    </table> 
                    <label>Cotización<button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Agregar</span></button><hr class="clearn" /></label>
                    <table class="lista-files">
                        <tr><td style="width:70%"><button class="del-btn" ><img src="img/del.png" /></button><span>servicios.pdf</span></td><td  style="width:30%"><input /></td></tr>
                        <tr><td><button class="del-btn" ><img src="img/del.png" /></button><span>Material.pdf</span></td><td><input /></td></tr>                                                
                        <tr class="resultado"><td><b>Total</b></td><td><b>$ 4,200.00</b></td></tr>
                    </table> 
                    <button class="aceptar" style="margin-top:10px;" >Aceptar</button>
                </div>
            </div>
            </div>
            <div id="pro-propuestas" style="display:none;">
                <div class="lista" id="lista-pro">
                    <div class="titulo">Propuestas de proyectos</div>            
                    <div class="busqueda"><input placeholder="Buscar" /></div>
                    <div class="agregar" id="edicion-erogacion" ><button clave_funcion="8" control="pagar-erogacion" onclick="IniciarRegistrarPro(true);" >Registrar nueva propuesta</button></div>                    
                    <ul class="lista seleccionable" style="width:100%;">
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">                             
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente" onclick="Mostrar('lista-pro','lista-pro-domicilios');">
                                <tr><td style="width:15%;"><span class="p12">Si</span></td><td style="width:70%;"><div class="graf-barra"><span class="progreso" style="width:25%"></span><b>25%</b></div></td></tr>
                                <tr><td><span class="p12">No</span></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td></tr>
                                <tr><td><span class="p12">Abst.</span></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td></tr>
                                <tr><td colspan="2"><div class="agregar" ><button onclick="Mostrar('lista-pro','detalle-pro');">Votar</button></div></td></tr>
                            </table>
                        </li> 
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">                             
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><span class="p12">Si</span></td><td style="width:70%;"><div class="graf-barra"><span class="progreso" style="width:25%"></span><b>25%</b></div></td></tr>
                                <tr><td><span class="p12">No</span></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td></tr>
                                <tr><td><span class="p12">Abst.</span></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td></tr>
                                <tr><td colspan="2"><div class="agregar" ><button onclick="Mostrar('lista-pro','detalle-pro');">Votar</button></div></td></tr>
                            </table>
                        </li> 
                        <li class="item" onclick="Mostrar('lista-erogacion','detalle-erogacion');">                             
                            <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span> 
                            <span class="t-2">18-Enero-2019 7:00 pm</span>
                            <table class="transparente">
                                <tr><td style="width:15%;"><span class="p12">Si</span></td><td style="width:70%;"><div class="graf-barra" onclick="Mostrar('lista-licitacion','licitacion-votantes');"><span class="progreso" style="width:25%"></span><b>25%</b></div></td></tr>
                                <tr><td><span class="p12">No</span></td><td><div class="graf-barra"><span class="progreso" style="width:30%"></span><b>30%</b></div></td></tr>
                                <tr><td><span class="p12">Abst.</span></td><td><div class="graf-barra"><span class="progreso" style="width:65%"></span><b>65%</b></div></td></tr>
                                <tr><td colspan="2"><div class="agregar" ><button onclick="Mostrar('lista-pro','detalle-pro');">Votar</button></div></td></tr>
                            </table>
                        </li>                         
                    </ul>
                </div>
                <div class="detalle" id="detalle-pro" style="display:none;">
                    <div class="titulo">Detalle de pago<button class="regresar" onclick="Mostrar('detalle-erogacion','lista-erogacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <div class="btns-up"><button class="edit-btn" clave_funcion="3" style="display:none;" control="edit-solmtto-8" id="edit-solmtto-8" onclick="IniciarEditarSolmtto();"><img src="img/edit.png" /></button><hr class="clearn" /></div>
                        <span class="t-1">Compra e instalación de juegos toboganes, para niños de hasta 12 años.</span>  
                        <span class="t-3">11-ene-2018</span>                    
                        <span class="t-4">Propongo que se compren juegos de toboganes del tipo que se muestran en las imagenes. Ya que los que existen acualmente representan un peligro para los niños. También les muestro unas fotos donde identifico los riesgos en cada uno de estas.</span>                    
                        <span class="t-41">Aquí Observamos el tipo de juego que les propongo, lo vi en internet y cuesta alrdededor de 125000.000</span>
                        <img class="file" src="img/Titan_Company_Logo.png" />                    
                        <span class="t-41">Esta es una imagen donde se ve la parte inferior de los subeybaja, estos tienen una lamina vertical que pudiera caer encima de un niño y lastimarlo severamente.</span>
                        <img class="file" src="img/call.png"/>  
                        <div class="edicion btns-texto" style="margin-bottom:200px;margin-top:30px;">
                            <label>¿Esta de acuerdo en apoyar esta propuesta?</label>
                            <table><tr><td style="width:50%;"><button>No</button></td><td style="width:50%;"><button>Si</button></td></tr></table>
                        </div>
                        <hr />
                    </div>
                 </div>
                <div class="edicion" style="display:none;" id="p-edicion-pro">
                    <div class="titulo">Edición de Propuesta <button class="cancelar" id="cancelar-edit-erogacion"  onclick="Mostrar('p-edicion-erogacion','lista-erogacion');">Cancelar</button></div>    
                    <div class="pantalla-2" >
                        <label>Título</label><textarea style="height:40px;" maxlength="150"></textarea>                        
                        <label>Descripción y/o Necesidad</label><textarea style="height:100px;"></textarea>      
                        
                        <label>Imagenes y descripción<button class="adjuntar-btn" style="width:100px;" onclick="IniciarAdjuntarEvidenciaSolmtto();"><img src="img/attach.png" /><span class="texto-discreto">Agregar</span></button><hr class="clearn" /></label>
                        <table class="lista-files">
                            
                            <tr><td style="width:90%"><img src="img/tobog.jpg" /></td><td style="width:10%" rowspan="2" class="del" ><button class="del-btn"><img src="img/del.png" /></button></td></tr>
                            <tr><td ><textarea maxlength="200"></textarea></td></tr>
                            
                            <tr><td style="width:90%"><img src="img/tobog.jpg" /></td><td style="width:10%" rowspan="2" class="del"><button class="del-btn"><img src="img/del.png" /></button></td></tr>
                            <tr><td ><textarea maxlength="200"></textarea></td></tr>

                        </table>                 
                        <button class="aceptar" style="margin-top:10px;margin-bottom:150px;" >Aceptar</button>
                    </div>                
                </div>

                <div class="detalle" id="lista-pro-domicilios" style="display:none;">
                    <div class="titulo">Votantes de propuesta<button class="regresar" onclick="Mostrar('detalle-licitacion','lista-licitacion');">Regresar</button></div>  
                    <div class="scrollable">
                        <ul class="lista seleccionable scrollable">
                            <li class="item">
                                <span class="t-2 si">Sofía 106-B</span>              
                            </li>
                            <li class="item">                 
                                <span class="t-2 si">Sofía 106-B</span>
                            </li>
                            <li class="item">             
                                <span class="t-2 no">Sofía 106-B</span>
                            </li>
                            <li class="item">                  
                                <span class="t-2 si">Sofía 106-B</span>
                            </li>
                            <li class="item">                 
                                <span class="t-2 no">Sofía 106-B</span>
                            </li>
                        </ul>
                    </div>
                 </div>

            </div>
            <div style="height:32px;" tabs="pro-ejecucion,pro-licitacion,pro-propuestas" class="tabs-down">
                <div class="tab" id="tab-inicio-pro" onclick="TabMostrar(this,this.parentNode,'pro-ejecucion');">Ejecución</div>
                <div class="tab" onclick="TabMostrar(this,this.parentNode,'pro-licitacion');">Licitación</div>
                <div class="tab" onclick="TabMostrar(this,this.parentNode,'pro-propuestas');">Propuestas</div>
            </div>
        </section>

    </div>
</body>
</html>
