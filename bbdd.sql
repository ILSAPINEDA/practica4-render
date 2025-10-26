CREATE DATABASE dwes DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

USE dwes;

-- Creamos las tablas
CREATE TABLE tienda (
 cod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 tlf VARCHAR(13) NULL
) ENGINE = INNODB;

CREATE TABLE producto (
 cod VARCHAR(12) NOT NULL,
 nombre VARCHAR(200) NULL,
 nombre_corto VARCHAR(50) NOT NULL,
 descripcion TEXT NULL,
 PVP DECIMAL(10, 2) NOT NULL,
 familia VARCHAR(6) NOT NULL,
 PRIMARY KEY (cod),
 INDEX (familia),
 UNIQUE (nombre_corto)
) ENGINE = INNODB;

CREATE TABLE familia (
 cod VARCHAR(6) NOT NULL,
 nombre VARCHAR(200) NOT NULL,
 PRIMARY KEY (cod)
) ENGINE = INNODB;

CREATE TABLE stock (
 producto VARCHAR(12) NOT NULL,
 tienda INT NOT NULL,
 unidades INT NOT NULL,
 PRIMARY KEY (producto, tienda)
) ENGINE = INNODB;

-- Creamos las claves foráneas
ALTER TABLE producto
 ADD CONSTRAINT producto_ibfk_1
 FOREIGN KEY (familia) REFERENCES familia(cod)
 ON UPDATE CASCADE;

ALTER TABLE stock
 ADD CONSTRAINT stock_ibfk_2
 FOREIGN KEY (tienda) REFERENCES tienda(cod)
 ON UPDATE CASCADE,
 ADD CONSTRAINT stock_ibfk_1
 FOREIGN KEY (producto) REFERENCES producto(cod)
 ON UPDATE CASCADE
 ON DELETE CASCADE; --Para poder borrar los productos




INSERT INTO tienda (cod, nombre, tlf) VALUES
(1, 'CENTRAL', '600100100'),
(2, 'SUCURSAL1', '600100200'),
(3, 'SUCURSAL2', NULL);


INSERT INTO familia (cod, nombre) VALUES
('CAMARA', 'Camaras digitales'),
('CONSOL', 'Consolas'),
('EBOOK', 'Libros electronicos'),
('IMPRES', 'Impresoras'),
('MEMFLA', 'Memorias flash'),
('MP3', 'Reproductores MP3'),
('MULTIF', 'Equipos multifuncion'),
('NETBOK', 'Netbooks'),
('ORDENA', 'Ordenadores'),
('PORTAT', 'Ordenadores portatiles'),
('ROUTER', 'Routers'),
('SAI', 'Sistemas de alimentacion ininterrumpida'),
('SOFTWA', 'Software'),
('TV', 'Televisores'),
('VIDEOC', 'Videocamaras');

INSERT INTO producto (cod, nombre, nombre_corto, descripcion, PVP, familia) VALUES
('3DSNG', NULL, 'Nintendo 3DS negro', 'Consola portatil de Nintendo que permitira disfrutar de efectos 3D sin necesidad de gafas especiales, e includira retrocompatibilidad con el software de DS y de DSi.', '270.00', 'CONSOL'),
('ACERAX3950', NULL, 'Acer AX3950 I5-650 4GB 1TB W7HP', 'Caracteristicas:\r\n\r\nSistema Operativo: Windows 7 Home Premium Original\r\n\r\nProcesador / Chipset\r\nNumero de Ranuras PCI: 1\r\nFabricante de Procesador: Intel\r\nTipo de Procesador: Core i5\r\nModelo de Procesador: i5-650\r\nNucleo de Procesador: Dual-core\r\nVelocidad de Procesador: 3,20 GHz\r\nCache: 4 MB\r\nVelocidad de Bus: No aplicable\r\nVelocidad HyperTransport: No aplicable\r\nInterconexion QuickPath: No aplicable\r\nProcesamiento de 64 bits: Si\r\nHyper-Threading: Si\r\nFabricante de Chipset: Intel\r\nModelo de Chipset: H57 Express\r\n\r\nMemoria\r\nMemoria Estandar: 4 GB\r\nMemoria Maxima: 8 GB\r\nTecnologia de la Memoria: DDR3 SDRAM\r\nEstandar de Memoria: DDR3-1333/PC3-10600\r\nNumero de Ranuras de Memoria (Total): 4\r\nLector de tarjeta memoria: Si\r\nSoporte de Tarjeta de Memoria: Tarjeta CompactFlash (CF)\r\nSoporte de Tarjeta de Memoria: MultiMediaCard (MMC)\r\nSoporte de Tarjeta de Memoria: Micro Drive\r\nSoporte de Tarjeta de Memoria: Memory Stick PRO\r\nSoporte de Tarjeta de Memoria: Memory Stick\r\nSoporte de Tarjeta de Memoria: CF+\r\nSoporte de Tarjeta de Memoria: Tarjeta Secure Digital (SD)\r\n\r\nStorage\r\nCapacidad Total del Disco Duro: 1 TB\r\nRPM de Disco Duro: 5400\r\nTipo de Unidad optica: Grabadora DVD\r\nCompatibilidad de Dispositivo optico: DVD-RAM/DVD±R/DVD±RW\r\nCompatibilidad de Medios de Doble Capa: Si', '410.00', 'ORDENA'),
('ARCLPMP32GBN', NULL, 'Archos Clipper MP3 2GB negro', 'Caracteristicas:\r\n\r\nAlmacenamiento Interno Disponible en 2 GB*\r\nCompatibilidad Windows o Mac y Linux (con soporte para almacenamiento masivo)\r\nInterfaz para ordenador USB 2.0 de alta velocidad\r\nBateria: 11 horas musica\r\nReproduccion Musica: MP3\r\nMedidas Dimensiones: 52mm x 27mm x 12mm, Peso: 14 Gr', '26.70', 'MP3'),
('BRAVIA2BX400', NULL, 'Sony Bravia 32IN FULLHD KDL-32BX400', 'Caracteristicas:\r\n\r\nFull HD: Vea deportes, peliculas y juegos con magnificos detalles en alta resolucion gracias a la resolucion 1920x1080.\r\n\r\nHDMI: 4 entradas (3 en la parte posterior, 1 en el lateral)\r\n\r\nUSB Media Player: Disfrute de peliculas, fotos y musica en el televisor.\r\n\r\nSintonizador de TV HD MPEG-4 AVC integrado: olvidese del codificador y acceda a servicios de TV que incluyen canales HD con el sintonizador DVB-T y DVB-C integrado con decodificador MPEG4 AVC (dependiendo del pais y solo con operadores compatibles)\r\n\r\nSensor de luz: ajusta automaticamente el brillo segun el nivel de la iluminacion ambiental para que pueda disfrutar de una calidad de imagen optima sin consumo innecesario de energia.\r\n\r\nBRAVIA Sync: controle su sistema de ocio domestico entero con un mismo mando a distancia universal que le permite reproducir contenidos o ajustar la configuracion de los dispositivos compatibles con un solo boton.\r\n\r\nBRAVIA ENGINE 2: experimente colores y detalles de imagen increiblemente nitidos y definidos.\r\n\r\nLive Colour: seleccione entre cuatro modos: desactivado, bajo, medio y alto, para ajustar el color y obtener imagenes vivas y una calidad optima.\r\n\r\n24p True Cinema: reproduzca una autentica experiencia cinematografica y disfrute de peliculas exactamente como el director las concibio a 24 fotogramas por segundo.', '356.90', 'TV'),
('EEEPC1005PXD', NULL, 'Asus EEEPC 1005PXD N455 1 250 BL', 'Caracteristicas:\r\nProcesador: 1660 MHz, N455, Intel Atom, 0.5 MB.\r\nMemoria: 1024 MB, 2 GB, DDR3, SO-DIMM, 1 x 1024 MB.\r\nAccionamiento de disco: 2.5", 250 GB, 5400 RPM,\r\nSerial ATA, Serial ATA II, 250 GB.\r\nMedios de almacenaje: MMC, SD, SDHC.\r\nExhibicion: 10.1", 1024 x 600 Pixeles, LCD TFT.\r\nCamara fotografica: 0.3 MP.\r\nRed: 802.11 b/g/n, 10, 100 Mbit/s,\r\nFast Ethernet.\r\nAudio: HD.\r\nSistema operativo/software: Windows 7 Starter.\r\nColor: Blanco.\r\nControl de energia: 8 MB/s, Litio-Ion, 6 piezas, 2200 mAh, 48 W.\r\nPeso y dimensiones: 1270 g, 178 mm, 262 mm, 25.9 mm, 36.5 mm', '245.40', 'NETBOK'),
('HPMIN1103120', NULL, 'HP Mini 110-3120 10.1LED N455 1GB 250GB W7S negro', 'Caracteristicas:\r\nSistema operativo instalado\r\nWindows 7 Starter original 32 bits\r\n\r\nProcesador\r\nProcesador Intel Atom N455 1,66 GHz, Cache de nivel 2, 512 KB\r\n\r\nChipset NM10 Intel + ICH8m\r\n\r\nMemoria\r\nDDR2 de 1 GB (1 x 1024 MB)\r\nMemoria maxima\r\nAdmite un maximo de 2 GB de memoria DDR2\r\n\r\nRanuras de memoria\r\n1 ranura de memoria accesible de usuario\r\n\r\nUnidades internas\r\nDisco duro SATA de 250 GB (5400 rpm)\r\n\r\nGraficos\r\nTamano de pantalla (diagonal)\r\nPantalla WSVGA LED HP Antirreflejos de 25,6 cm (10,1") en diagonal\r\n\r\nResolucion de la pantalla\r\n1024 x 600', '270.00', 'NETBOK'),
('IXUS115HSAZ', NULL, 'Canon Ixus 115HS azul', 'Caracteristicas:\r\nHS System (12,1 MP)\r\nZoom 4x, 28 mm. IS optico\r\nCuerpo metalico estilizado\r\nPantalla LCD PureColor II G de 7,6 cm (3,0")\r\nFull HD. IS Dinamico. HDMI\r\nModo Smart Auto (32 escenas)', '196.70', 'CAMARA'),
('KSTDT101G2', NULL, 'Kingston DataTraveler 16GB DT101G2 USB2.0 negro', 'Caracteristicas:\r\nCapacidades: 16GB\r\nDimensiones: 2.19" x 0.68" x 0.36" (55.65mm x 17.3mm x 9.05mm)\r\nTemperatura de Operacion: 0° hasta 60° C / 32° hasta 140° F\r\nTemperatura de Almacenamiento: -20° hasta 85° C / -4° hasta 185° F\r\nSimple: Solo debe conectarlo a un puerto USB y esta listo para ser utilizado\r\nPractico: Su diseno sin tapa giratorio, protege el conector USB; sin tapa que perder\r\nGarantizado: Cinco anos de garantia', '19.20', 'MEMFLA'),
('KSTDTG332GBR', NULL, 'Kingston DataTraveler G3 32GB rojo', 'Caracteristicas:\r\n\r\nTipo de producto: Unidad flash USB\r\nCapacidad almacenamiento: 32GB\r\nAnchura: 58.3 mm\r\nProfundidad: 23.6 mm\r\nAltura: 9.0 mm\r\nPeso: 12 g\r\nColor incluido: RED\r\nTipo de interfaz: USB', '40.00', 'MEMFLA'),
('KSTMSDHC8GB', NULL, 'Kingston MicroSDHC 8GB', 'Kingston tarjeta de memoria flash 8 GB microSDHC\r\nIndice de velocidad Class 4\r\nCapacidad almacenamiento 8 GB\r\nFactor de forma MicroSDHC\r\nAdaptador de memoria incluido Adaptador microSDHC a SD\r\nGarantia del fabricante Garantia limitada de por vida', '10.20', 'MEMFLA'),
('LEGRIAFS306', NULL, 'Canon Legria FS306 plata', 'Caracteristicas:\r\n\r\nGrabacion en tarjeta de memoria SD/SDHC \r\nLa camara de video digital de Canon mas pequena nunca vista \r\nInstantanea de Video (Video Snapshot) \r\nZoom Avanzado de 41x \r\nGrabacion Dual (Dual Shot) \r\nEstabilizador de la Imagen con Modo Dinamico \r\nPre grabacion (Pre REC) \r\nSistema 16:9 de alta resolucion realmente panoramico \r\nBateria inteligente y Carga Rapida \r\nCompatible con grabador de DVD DW-100 \r\nSISTEMA DE VIDEO\r\nSoporte de grabacion: Tarjeta de memoria extraible (SD/SDHC)\r\nTiempo maximo de grabacion: Variable, dependiendo del tamano de la tarjeta de memoria.\r\nTarjeta SDHC de 32 GB: 20 horas 50 minutos', '175.00', 'VIDEOC'),
('LGM237WDP', NULL, 'LG TDT HD 23 M237WDP-PC FULL HD', 'Caracteristicas:\r\n\r\nGeneral\r\nTamano (pulgadas): 23\r\nPantalla LCD: Si\r\nFormato: 16:9\r\nResolucion: 1920 x 1080\r\nFull HD: Si\r\nBrillo (cd/m2): 300\r\nRatio Contraste: 50.000:1\r\nTiempo Respuesta (ms): 5\r\nAngulo Vision (°): 170\r\nNumero Colores (Millones): 16.7\r\n\r\nTV\r\nTDT: TDT HD\r\nConexiones\r\nD-Sub: Si\r\nDVI-D: Si\r\nHDMI: Si\r\nEuroconector: Si\r\nSalida auriculares: Si\r\nEntrada audio: Si\r\nUSB Servicio: Si\r\nRS-232C Servicio: Si\r\nPCMCIA: Si\r\nSalida optico: Si', '186.00', 'TV'),
('LJPROP1102W', NULL, 'HP Laserjet Pro Wifi P1102W', 'Impresora laserjet P1102W es facil de instalar y usar, ademas de que te ayudara a ahorrar energia y recursos. \r\nOlvidate de los cables y disfruta de la libertad que te proporciona su tecnologia WIFI, imprime facilmente desde cualquier lugar de tu oficina. \r\n\r\nFormato maximo aceptado A4 A2 No\r\nA3 No A4 Si\r\nA5 Si A6 Si\r\nB5 Si B6 Si\r\nSobres C5 (162 x 229 mm) Si Sobres C6 (114 x 162 mm) Si', '99.90', 'IMPRES'),
('OPTIOLS1100', NULL, 'Pentax Optio LS1100', 'La LS1100 con funda de transporte y tarjeta de memoria de 2GB incluidas \r\nes la compacta digital que te llevaras a todas partes. \r\nEsta camara disenada por Pentax incorpora un sensor CCD de 14,1 megapixeles y un objetivo gran angular de 28 mm.\r\n', '104.80', 'CAMARA'),
('PAPYRE62GB', NULL, 'Lector ebooks Papyre6 con SD2GB + 500 ebooks', 'Marca Papyre \r\nModelo Papyre 6.1 \r\nUso Lector de libros electronicos \r\nTecnologia e-ink (tinta electronica, Vizplex) \r\nCPU Samsung Am9 200MHz \r\nMemoria - Interna: 512MB \r\n- Externa: SD/SDHC (hasta 32GB) \r\nFormatos PDF, RTF, TXT, DOC, HTML, MP3, CHM, ZIP, FB2, Formatos de imagen \r\nPantalla 6" (600x800px), blanco y negro, 4 niveles de grises ', '205.50', 'EBOOK'),
('PBELLI810323', NULL, 'Packard Bell I8103 23 I3-550 4G 640GB NVIDIAG210', 'Caracteristicas:\r\n\r\nCPU CHIPSET\r\n\r\nProcesador : Ci3-550\r\nNorthBridge : Intel H57\r\n\r\nMEMORIA\r\nMemoria RAM : Ddr3 4096 MB\r\n\r\nDISPOSITIVOS DE ALMACENAMIENTO\r\nDisco Duro: 640Gb 7200 rpm\r\nOptico : Slot Load super multi Dvdrw\r\nLector de Tarjetas: 4 in 1 (XD, SD, HC, MS, MS PRO, MMC)\r\n\r\ndispositivos graficos\r\nMonitor: 23 fHD\r\nTarjeta Grafica: Nvidia G210M D3 512Mb\r\nMemoria Maxima: Hasta 1918Mb\r\n\r\nAUDIO\r\nAudio Out: 5.1 Audio Out\r\nAudio In: 1 jack\r\nHeadphone in: 1x jack\r\nAltavoces: Stereo\r\n\r\nACCESORIOS\r\nTeclado: Teclado y raton inalambrico\r\nMando a distancia: EMEA Win7 WMC\r\n\r\n\r\nCOMUNICACIONES\r\nWireless: 802.11 b/g/n mini card \r\nTarjeta de Red: 10/100/1000 Mbps\r\nBluetooth: Bluetooth\r\nWebcam: 1Mpixel Hd (1280x720)\r\nTv tuner: mCARD/SW/ DVB-T\r\n\r\nMONITOR\r\nTamano: 23"\r\ncontraste: 1000:1\r\nTiempo de respuesta: 5MS\r\nResolucion: 1920 X 1080\r\n\r\nPUERTOS E/S\r\nUsb 2.0 : 6\r\nMini Pci-e : 2\r\nEsata: 1\r\n\r\nSISTEMA OPERATIVO\r\nO.S: Microsoft Windows 7 Premium', '761.80', 'ORDENA'),
('PIXMAIP4850', NULL, 'Canon Pixma IP4850', 'Caracteristicas:\r\n\r\nTipo: chorro de tinta cartuchos independientes\r\nConexion: Hi-Speed USB\r\nPuerto de impresion directa desde camaras\r\nResolucion maxima: 9600x2400 ppp\r\nVelocidad impresion: 11 ipm (negro) / 9.3 ipm (color)\r\nTamano maximo papel: A4\r\nBandeja entrada: 150 hojas\r\nDimensiones: 43.1 cm x 29.7 cm x 15.3 cm', '97.30', 'IMPRES'),
('PIXMAMP252', NULL, 'Canon Pixma MP252', 'Caracteristicas:\r\n\r\nFunciones: Impresora, Escaner, Copiadora\r\nConexion: USB 2.0\r\nDimensiones: 444 x 331 x 155 mm\r\nPeso: 5,8 Kg\r\n\r\nIMPRESORA\r\nResolucion maxima: 4800 x 1200 ppp\r\nVelocidad de impresion:\r\nNegro/color: 7,0 ipm / 4,8 ipm\r\nTamano maximo papel: A4\r\nCARTUCHOS\r\nNegro: PG-510 / PG-512\r\nColor: CL-511 / CL-513\r\n\r\nESCANER\r\nResolucion maxima: 600 x 1200 ppp (digital: 19200 x 19200)\r\nProfundidad de color: 48/24 bits\r\nArea maxima de escaneado: A4\r\n\r\nCOPIA\r\nTiempo salida 1ª copia: aprox 39 seg.', '41.60', 'MULTIF'),
('PS3320GB', NULL, 'PS3 con disco duro de 320GB', 'Este Pack Incluye:\r\n- La consola Playstation 3 Slim Negra 320GB\r\n- El juego Killzone 3\r\n', '380.00', 'CONSOL'),
('PWSHTA3100PT', NULL, 'Canon Powershot A3100 plata', 'La camara PowerShot A3100 IS, inteligente y compacta, presenta la calidad de imagen de Canon en un cuerpo\r\ncompacto y ligero para capturar fotografias sin esfuerzo; es tan facil como apuntar y disparar.\r\nCaracteristicas:\r\n12,1 MP \r\nZoom optico 4x con IS \r\nPantalla LCD de 6,7 cm (2,7") ', '101.40', 'CAMARA'),
('SMSGCLX3175', NULL, 'Samsung CLX3175', 'Caracteristicas:\r\n\r\nFuncion: Impresion color, copiadora, escaner\r\nImpresion \r\nVelocidad (Mono) Hasta 16 ppm en A4 (17 ppm en Carta)\r\nVelocidad (Color) Hasta 4 ppm en A4 (4 ppm en Carta)\r\nSalida de la Primera Pagina (Mono) Menos de 14 segundos (Desde el Modo Listo)\r\nResolucion Hasta 2400 x 600 dpi de salida efectiva\r\nSalida de la Primera Pagina (Color) Menos de 26 segundos (Desde el Modo Listo)\r\nDuplex Manual\r\nEmulacion SPL-C (Lenguaje de color de impresion SAMSUNG)\r\n\r\nCopiado \r\nSalida de la Primera Pagina (Mono) 18 segundos\r\nMulticopiado 1 ~ 99\r\nZoom 25 ~ 400 %\r\nFunciones de Copiado Copia ID, Clonar Copia, Copia N-UP, Copiar Poster\r\nResolucion Texto, Texto / Foto, Modo Revista: hasta 600 x 600 ppp, Modo Foto: Hasta 1200 x 1200 ppp\r\nVelocidad (Mono) Hasta 17 ppm en Carta (16 ppm en A4)\r\nVelocidad (Color) Hasta 4 ppm en Carta (4 ppm en A4 )\r\nSalida de la Primera Pagina (Color) 45 segundos\r\n\r\nEscaneado \r\n\r\nCompatibilidad Norma TWAIN, Norma WIA (Windows2003 / XP / Vista)\r\nMetodo Escaner plano color\r\nResolucion (optica) 1200 x 1200 dpi\r\nResolucion (Mejorada) 4800 x 4800 dpi\r\nEscaneado a USB / Carpeta', '190.00', 'MULTIF'),
('SMSN150101LD', NULL, 'Samsung N150 10.1LED N450 1GB 250GB BAT6 BT W7 R', 'Caracteristicas:\r\n\r\nSistema Operativo Genuine Windows® 7 Starter \r\n\r\nProcesador Intel® ATOM Processor N450 (1.66GHz, 667MHz, 512KB) \r\n\r\nChipset Intel® NM10\r\n\r\nMemoria del Sistema 1GB (DDR2 / 1GB x 1) Ranura de Memoria 1 x SODIMM \r\n\r\nPantalla LCD 10.1" WSVGA (1024 x 600), Non-Gloss, LED Back Light Grafico \r\n\r\nProcesador Grafico Intel® GMA 3150 DVMT \r\nMemoria Grafica Shared Memory (Int. Graphic) \r\n\r\nMultimedia \r\nSonido HD (High Definition) Audio \r\nCaracteristicas de Sonido SRS 3D Sound Effect \r\nAltavoces 3W Stereo Speakers (1.5W x 2) \r\nCamara Integrada Web Camera \r\n\r\nAlmacenamiento \r\nDisco duro 250GB SATA (5400 rpm S-ATA) \r\n\r\nConectividad\r\nWired Ethernet LAN (RJ45) 10/100 LAN \r\nWireless LAN 802.11 b/g/N\r\n\r\nBluetooth Bluetooth 3.0 High Speed \r\n\r\nI/O Port \r\nVGA \r\nHeadphone-out\r\nMic-in\r\nInternal Mic\r\nUSB (Chargable USB included) 3 x USB 2.0 \r\nMulti Card Slot 4-in-1 (SD, SDHC, SDXC, MMC)\r\nDC-in (Power Port)\r\n\r\nTipo de Teclado 84 keys \r\nTouch Pad, Touch Screen Touch Pad (Scroll Scope, Flat Type) \r\n\r\nSeguridad\r\nRecovery Samsung Recovery Solution \r\nVirus McAfee Virus Scan (trial version) \r\nSeguridad BIOS Boot Up Password / HDD Password \r\nBloqueo Kensington Lock Port \r\n\r\nBateria \r\nAdaptador 40 Watt Bateria \r\n6 Cell Dimensiones ', '260.60', 'NETBOK'),
('SMSSMXC200PB', NULL, 'Samsung SMX-C200PB EDC ZOOM 10X', 'Caracteristicas:\r\n\r\nSensor de Imagen Tipo 1 / 6” 800K pixel CCD\r\n\r\nLente Zoom optico 10x optico\r\n\r\nCaracteristicas Grabacion Video Estabilizador de Imagen Hiper estabilizador de imagen digital\r\n\r\nInterfaz Tarjeta de Memoria Ranura de Tarjeta SDHC / SD', '127.20', 'VIDEOC'),
('STYLUSSX515W', NULL, 'Epson Stylus SX515W', 'Caracteristicas:\r\n\r\nResolucion maxima 5760 x 1440 DPI\r\nVelocidad de la impresion\r\nVelocidad de impresion (negro, calidad normal, A4) 36 ppm\r\nVelocidad de impresion (color, calidad normal, A4) 36 ppm\r\n\r\nTecnologia de la impresion\r\nTecnologia de impresion inyeccion de tinta\r\nNumero de cartuchos de impresion 4 piezas\r\nCabeza de impresora Micro Piezo\r\n\r\nExploracion\r\nResolucion maxima de escaneado 2400 x 2400 DPI\r\nEscaner color: si\r\nTipo de digitalizacion Escaner plano\r\nEscaner integrado: si\r\nTecnologia de exploracion CIS\r\nWLAN, conexion: si', '77.50', 'MULTIF'),
('TSSD16GBC10J', NULL, 'Toshiba SD16GB Class10 Jewel Case', 'Caracteristicas:\r\n\r\nDensidad: 16 GB\r\nPINs de conexion: 9 pins\r\nInterfaz: Tarjeta de memoria SD estandar compatible\r\nVelocidad de Escritura: 20 MBytes/s* \r\nVelocidad de Lectura: 20 MBytes/s*\r\nDimensiones: 32.0 mm (L) × 24.0 mm (W) × 2.1 mm (H)\r\nPeso: 2g\r\nTemperatura: -25°C a +85°C (Recomendada)\r\nHumedad: 30% to 80% RH (sin condensacion)', '32.60', 'MEMFLA'),
('ZENMP48GB300', NULL, 'Creative Zen MP4 8GB Style 300', 'Caracteristicas:\r\n\r\n8 GB de capacidad\r\nAutonomia: 32 horas con archivos MP3 a 128 kbps\r\nPantalla TFT de 1,8 pulgadas y 64.000 colores\r\nFormatos de audio compatibles: MP3, WMA (DRM9), formato Audible 4\r\nFormatos de foto compatibles: JPEG (BMP, TIFF, GIF y PNG)\r\nFormatos de video compatibles: AVI transcodificado (Motion JPEG)\r\nEcualizador de 5 bandas con 8 preajustes\r\nMicrofono integrado para grabar voz\r\nAltavoz y radio FM incorporada', '58.90', 'MP3');

INSERT INTO stock (producto, tienda, unidades) VALUES
('3DSNG', 1, 2),
('3DSNG', 2, 1),
('ACERAX3950', 1, 1),
('ARCLPMP32GBN', 2, 1),
('ARCLPMP32GBN', 3, 2),
('BRAVIA2BX400', 3, 1),
('EEEPC1005PXD', 1, 2),
('EEEPC1005PXD', 2, 1),
('HPMIN1103120', 2, 1),
('HPMIN1103120', 3, 2),
('IXUS115HSAZ', 2, 2),
('KSTDT101G2', 3, 1),
('KSTDTG332GBR', 2, 2),
('KSTMSDHC8GB', 1, 1),
('KSTMSDHC8GB', 2, 2),
('KSTMSDHC8GB', 3, 2),
('LEGRIAFS306', 2, 1),
('LGM237WDP', 1, 1),
('LJPROP1102W', 2, 2),
('OPTIOLS1100', 1, 3),
('OPTIOLS1100', 2, 1),
('PAPYRE62GB', 1, 2),
('PAPYRE62GB', 3, 1),
('PBELLI810323', 2, 1),
('PIXMAIP4850', 2, 1),
('PIXMAIP4850', 3, 2),
('PIXMAMP252', 2, 1),
('PS3320GB', 1, 1),
('PWSHTA3100PT', 2, 2),
('PWSHTA3100PT', 3, 2),
('SMSGCLX3175', 2, 1),
('SMSN150101LD', 3, 1),
('SMSSMXC200PB', 2, 1),
('STYLUSSX515W', 1, 1),
('TSSD16GBC10J', 3, 2),
('ZENMP48GB300', 1, 3),
('ZENMP48GB300', 2, 2),
('ZENMP48GB300', 3, 2);


CREATE user 'dwes' IDENTIFIED BY 'dwes';
GRANT ALL ON dwes.* to dwes;
