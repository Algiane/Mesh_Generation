Function NacaGeom

// https://fr.wikipedia.org/wiki/Profil_NACA

For i In {0:npts-1}

    // t =  parametre
    t = i/npts*i/npts;

    t_on_chord = t/chord;

    yt = width/0.2*chord*
      ( 0.2969*Sqrt(t_on_chord) -0.1260 *(t_on_chord) - 0.3516*t_on_chord*t_on_chord
       + 0.2843*t_on_chord*t_on_chord*t_on_chord
       - 0.1036*t_on_chord*t_on_chord*t_on_chord*t_on_chord);

    // Coordonnees de l'extrados
    xE = t;
    yE = yt;

    // Coordonnees de l'intrados
    xI = t;
    yI = -yt;

    newPoint = firstPtOnNaca + i ;
    Point(newPoint) = {xE,yE,0};
    newPoint = firstPtOnNaca+ npts +i ;
    Point(newPoint) = {xI,yI,0};

EndFor

// Fermetrue du bord de fuite
newPoint = firstPtOnNaca+ 2*npts;
Point(newPoint) = {1,0,0};

For i In {0:npts-2}

   //extrados
   Line(firstSegOnNaca+i)={firstPtOnNaca+i,firstPtOnNaca+i+1};

   //intrados
   Line(firstSegOnNaca+npts-1+i)={firstPtOnNaca+npts+1+i,firstPtOnNaca+npts+i+2};

EndFor

// Last segments
Line(firstSegOnNaca+2*npts-1) = {firstPtOnNaca+npts-1,newPoint};
Line(firstSegOnNaca+2*npts) = {firstPtOnNaca+npts+1,firstPtOnNaca};

//extrados + point du bord de fuite + intrados
Physical Line(firstSegOnNaca) = {firstSegOnNaca:firstSegOnNaca+2*npts};

Return

// Programme principal

npts = 50;

// pour pouvoir ajouter une boite englobante
firstPtOnNaca  = 1; // indice du premier point sur le naca
firstSegOnNaca = 1; // indice du premier segment sur le naca

/* Naca0012 */
// longueur de la corde
chord = 1;
// epaisseur de la corde
width = 0.12;

Call NacaGeom;
//+
Line Loop(1) = {23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 100, -98, -97, -96, -95, -94, -93, -92, -91, -90, -89, -88, -87, -86, -85, -84, -83, -82, -81, -80, -79, -78, -77, -76, -75, -74, -73, -72, -71, -70, -69, -68, -67, -66, -65, -64, -63, -62, -61, -60, -59, -58, -57, -56, -55, -54, -53, -52, -51, -50, 101, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22};
//+
Plane Surface(1) = {1};
//+
Physical Surface(2) = {1};
