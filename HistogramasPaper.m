clear,clc,close all
t_pla_1=[5.233 ; 5.417 ; 5.700 ; 5.900 ; 6.050 ; 6.250 ; 6.633 ; 6.883 ; 7.133 ; 7.350 ; 7.500 ; 7.850 ; 7.967 ; 8.350 ; 8.617 ; 8.850 ; 9.117 ; 9.350 ; 9.617 ; 9.850 ; 10.367 ; 10.850 ; 11.367 ; 11.850 ; 12.367 ; 12.817 ; 13.367 ; 13.850 ; 14.100 ; 14.367 ; 14.600 ; 14.850 ; 15.133 ; 15.350 ; 15.600 ; 15.850 ; 16.100 ; 16.350 ; 16.600 ; 16.850 ; 17.100 ; 17.350 ; 17.617 ; 17.850 ; 18.100 ; 18.350 ; 18.600 ; 18.850 ; 19.100 ; 19.350 ; 19.633 ; 19.850 ; 20.100 ; 20.350 ; 20.867 ; 21.367 ; 21.850 ; 22.367 ; 22.850 ; 23.350 ; 23.850 ; 5.217 ; 6.500 ; 6.717 ; 7.000 ; 7.700 ; 8.017 ; 8.233 ; 8.467 ; 8.733 ; 8.967 ; 9.200 ; 9.467 ; 9.700 ; 9.983 ; 10.200 ; 10.667 ; 11.183 ; 11.683 ; 12.183 ; 12.683 ; 13.183 ; 13.683 ; 13.967 ; 14.183 ; 14.483 ; 14.700 ; 14.967 ; 15.200 ; 15.483 ; 15.650 ; 16.217 ; 16.700 ; 17.200 ; 17.700 ; 18.200 ; 18.483 ; 18.700 ; 18.983 ; 19.200 ; 19.467 ; 19.683 ; 19.967 ; 20.200 ; 20.700 ; 21.200 ; 21.700 ; 22.200 ; 22.700 ; 23.200 ; 23.700 ; 5.983 ; 6.267 ; 6.517 ; 6.750 ; 6.983 ; 7.167 ; 7.367 ; 7.567 ; 7.750 ; 7.967 ; 8.117 ; 8.367 ; 8.533 ; 8.700 ; 8.967 ; 9.167 ; 9.367 ; 9.550 ; 9.750 ; 10.000 ; 10.267 ; 10.517 ; 10.983 ; 11.500 ; 11.983 ; 12.517 ; 12.983 ; 13.517 ; 13.983 ; 14.267 ; 14.500 ; 14.767 ; 14.983 ; 15.267 ; 15.500 ; 15.767 ; 15.983 ; 16.250 ; 16.517 ; 16.750 ; 16.983 ; 17.517 ; 17.750 ; 17.983 ; 18.267 ; 18.483 ; 18.750 ; 19.000 ; 19.250 ; 19.483 ; 19.750 ; 19.983 ; 20.250 ; 20.517 ; 20.750 ; 20.983 ; 21.267 ; 21.533 ; 22.017 ; 22.517 ; 22.983 ; 23.517 ; 0.050 ; 6.433 ; 6.650 ; 6.933 ; 7.633 ; 7.950 ; 8.167 ; 8.400 ; 8.667 ; 8.900 ; 9.133 ; 9.400 ; 9.633 ; 9.917 ; 10.133 ; 10.600 ; 11.117 ; 11.617 ; 12.117 ; 12.617 ; 13.117 ; 13.617 ; 13.900 ; 14.117 ; 14.417 ; 14.633 ; 14.900 ; 15.133 ; 15.417 ; 15.583 ; 16.150 ; 16.633 ; 17.133 ; 17.633 ; 18.133 ; 18.417 ; 18.633 ; 18.917 ; 19.133 ; 19.400 ; 19.617 ; 19.900 ; 20.133 ; 20.633 ; 21.133 ; 21.633 ; 22.133 ; 22.633 ; 23.133 ; 23.633 ; ]; 
t_pla_2=[5.233 ; 5.417 ; 5.700 ; 5.900 ; 6.050 ; 6.250 ; 6.633 ; 6.883 ; 7.133 ; 7.350 ; 7.500 ; 7.850 ; 7.967 ; 8.350 ; 8.617 ; 8.850 ; 9.117 ; 9.350 ; 9.617 ; 9.850 ; 10.367 ; 10.850 ; 11.367 ; 11.850 ; 12.367 ; 12.817 ; 13.367 ; 13.850 ; 14.100 ; 14.367 ; 14.600 ; 14.850 ; 15.133 ; 15.350 ; 15.600 ; 15.850 ; 16.100 ; 16.350 ; 16.600 ; 16.850 ; 17.100 ; 17.350 ; 17.617 ; 17.850 ; 18.100 ; 18.350 ; 18.600 ; 18.850 ; 19.100 ; 19.350 ; 19.633 ; 19.850 ; 20.100 ; 20.350 ; 20.867 ; 21.367 ; 21.850 ; 22.367 ; 22.850 ; 23.350 ; 23.850 ; 5.217 ; 6.500 ; 6.717 ; 7.000 ; 7.700 ; 8.017 ; 8.233 ; 8.467 ; 8.733 ; 8.967 ; 9.200 ; 9.467 ; 9.700 ; 9.983 ; 10.200 ; 10.667 ; 11.183 ; 11.683 ; 12.183 ; 12.683 ; 13.183 ; 13.683 ; 13.967 ; 14.183 ; 14.483 ; 14.700 ; 14.967 ; 15.200 ; 15.483 ; 15.650 ; 16.217 ; 16.700 ; 17.200 ; 17.700 ; 18.200 ; 18.483 ; 18.700 ; 18.983 ; 19.200 ; 19.467 ; 19.683 ; 19.967 ; 20.200 ; 20.700 ; 21.200 ; 21.700 ; 22.200 ; 22.700 ; 23.200 ; 23.700 ; 4.950 ; 5.400 ; 5.600 ; 5.750 ; 5.800 ; 5.950 ; 6.000 ; 6.200 ; 6.300 ; 6.400 ; 6.517 ; 6.633 ; 6.750 ; 6.800 ; 6.900 ; 7.000 ; 7.100 ; 7.200 ; 7.333 ; 7.450 ; 7.550 ; 7.600 ; 7.700 ; 7.783 ; 7.900 ; 8.000 ; 8.100 ; 8.200 ; 8.283 ; 8.400 ; 8.500 ; 8.583 ; 8.700 ; 8.800 ; 8.917 ; 9.000 ; 9.100 ; 9.200 ; 9.300 ; 9.400 ; 9.500 ; 9.617 ; 9.733 ; 9.833 ; 9.950 ; 10.050 ; 10.200 ; 10.300 ; 10.533 ; 10.683 ; 10.833 ; 11.017 ; 11.183 ; 11.350 ; 11.517 ; 11.683 ; 11.850 ; 12.017 ; 12.183 ; 12.350 ; 12.517 ; 12.650 ; 12.850 ; 13.017 ; 13.183 ; 13.333 ; 13.517 ; 13.683 ; 13.850 ; 14.000 ; 14.183 ; 14.400 ; 14.533 ; 14.683 ; 14.783 ; 14.933 ; 15.050 ; 15.183 ; 15.283 ; 15.400 ; 15.533 ; 15.683 ; 15.833 ; 16.017 ; 16.183 ; 16.367 ; 16.517 ; 16.683 ; 16.850 ; 17.017 ; 17.183 ; 17.350 ; 17.517 ; 17.667 ; 17.800 ; 17.933 ; 18.050 ; 18.183 ; 18.300 ; 18.400 ; 18.533 ; 18.683 ; 18.833 ; 18.933 ; 19.050 ; 19.183 ; 19.267 ; 19.400 ; 19.533 ; 19.683 ; 19.800 ; 19.900 ; 20.050 ; 20.200 ; 20.333 ; 20.433 ; 20.533 ; 20.650 ; 20.817 ; 20.933 ; 21.050 ; 21.200 ; 21.283 ; 21.417 ; 21.550 ; 21.700 ; 21.833 ; 22.033 ; 22.183 ; 22.383 ; 22.517 ; 22.683 ; 22.833 ; 22.933 ; 23.167 ; 23.383 ; 5.983 ; 6.267 ; 6.517 ; 6.750 ; 6.983 ; 7.167 ; 7.367 ; 7.567 ; 7.750 ; 7.967 ; 8.117 ; 8.367 ; 8.533 ; 8.700 ; 8.967 ; 9.167 ; 9.367 ; 9.550 ; 9.750 ; 10.000 ; 10.267 ; 10.517 ; 10.983 ; 11.500 ; 11.983 ; 12.517 ; 12.983 ; 13.517 ; 13.983 ; 14.267 ; 14.500 ; 14.767 ; 14.983 ; 15.267 ; 15.500 ; 15.767 ; 15.983 ; 16.250 ; 16.517 ; 16.750 ; 16.983 ; 17.517 ; 17.750 ; 17.983 ; 18.267 ; 18.483 ; 18.750 ; 19.000 ; 19.250 ; 19.483 ; 19.750 ; 19.983 ; 20.250 ; 20.517 ; 20.750 ; 20.983 ; 21.267 ; 21.533 ; 22.017 ; 22.517 ; 22.983 ; 23.517 ; 0.050 ; 6.433 ; 6.650 ; 6.933 ; 7.633 ; 7.950 ; 8.167 ; 8.400 ; 8.667 ; 8.900 ; 9.133 ; 9.400 ; 9.633 ; 9.917 ; 10.133 ; 10.600 ; 11.117 ; 11.617 ; 12.117 ; 12.617 ; 13.117 ; 13.617 ; 13.900 ; 14.117 ; 14.417 ; 14.633 ; 14.900 ; 15.133 ; 15.417 ; 15.583 ; 16.150 ; 16.633 ; 17.133 ; 17.633 ; 18.133 ; 18.417 ; 18.633 ; 18.917 ; 19.133 ; 19.400 ; 19.617 ; 19.900 ; 20.133 ; 20.633 ; 21.133 ; 21.633 ; 22.133 ; 22.633 ; 23.133 ; 23.633 ; 6.033 ; 6.333 ; 6.567 ; 6.833 ; 7.133 ; 7.367 ; 7.533 ; 7.633 ; 7.817 ; 8.133 ; 8.333 ; 8.433 ; 8.617 ; 8.833 ; 9.033 ; 9.333 ; 9.667 ; 10.083 ; 10.583 ; 11.050 ; 11.567 ; 12.083 ; 12.567 ; 13.067 ; 13.550 ; 13.933 ; 14.267 ; 14.567 ; 14.817 ; 15.083 ; 15.333 ; 15.583 ; 15.917 ; 16.250 ; 16.567 ; 16.900 ; 17.233 ; 17.733 ; 18.100 ; 18.433 ; 18.767 ; 18.983 ; 19.300 ; 19.717 ; 19.983 ; 20.233 ; 20.583 ; 20.967 ; 21.317 ; 21.633 ; 21.900 ; 22.267 ; 22.583 ; 22.867 ; 23.233 ; 23.550 ; 23.867 ; 5.583 ; 5.783 ; 5.983 ; 6.183 ; 6.283 ; 6.383 ; 6.483 ; 6.617 ; 6.733 ; 6.783 ; 6.883 ; 6.983 ; 7.083 ; 7.183 ; 7.317 ; 7.433 ; 7.583 ; 7.683 ; 7.767 ; 7.883 ; 7.983 ; 8.083 ; 8.183 ; 8.267 ; 8.383 ; 8.483 ; 8.567 ; 8.683 ; 8.783 ; 8.900 ; 8.983 ; 9.083 ; 9.183 ; 9.283 ; 9.383 ; 9.483 ; 9.600 ; 9.717 ; 9.817 ; 9.933 ; 10.033 ; 10.183 ; 10.283 ; 10.417 ; 10.517 ; 10.667 ; 10.817 ; 11.000 ; 11.167 ; 11.333 ; 11.500 ; 11.667 ; 11.833 ; 12.000 ; 12.167 ; 12.333 ; 12.500 ; 12.633 ; 12.833 ; 13.000 ; 13.167 ; 13.317 ; 13.500 ; 13.667 ; 13.833 ; 13.983 ; 14.167 ; 14.383 ; 14.517 ; 14.667 ; 14.767 ; 14.917 ; 15.033 ; 15.167 ; 15.267 ; 15.383 ; 15.517 ; 15.667 ; 15.817 ; 16.000 ; 16.167 ; 16.350 ; 16.500 ; 16.667 ; 16.833 ; 17.000 ; 17.167 ; 17.333 ; 17.500 ; 17.650 ; 17.783 ; 17.917 ; 18.033 ; 18.167 ; 18.283 ; 18.383 ; 18.517 ; 18.667 ; 18.817 ; 18.917 ; 19.033 ; 19.167 ; 19.250 ; 19.383 ; 19.517 ; 19.667 ; 19.783 ; 19.883 ; 20.033 ; 20.183 ; 20.317 ; 20.417 ; 20.517 ; 20.633 ; 20.800 ; 20.917 ; 21.033 ; 21.183 ; 21.267 ; 21.400 ; 21.533 ; 21.683 ; 21.817 ; 22.017 ; 22.167 ; 22.367 ; 22.500 ; 22.667 ; 22.817 ; 22.917 ; 23.150 ; 23.367 ; 23.650 ; 23.917 ; ]; 
t_pla_3=[5.233 ; 5.417 ; 5.700 ; 5.900 ; 6.050 ; 6.250 ; 6.633 ; 6.883 ; 7.133 ; 7.350 ; 7.500 ; 7.850 ; 7.967 ; 8.350 ; 8.617 ; 8.850 ; 9.117 ; 9.350 ; 9.617 ; 9.850 ; 10.367 ; 10.850 ; 11.367 ; 11.850 ; 12.367 ; 12.817 ; 13.367 ; 13.850 ; 14.100 ; 14.367 ; 14.600 ; 14.850 ; 15.133 ; 15.350 ; 15.600 ; 15.850 ; 16.100 ; 16.350 ; 16.600 ; 16.850 ; 17.100 ; 17.350 ; 17.617 ; 17.850 ; 18.100 ; 18.350 ; 18.600 ; 18.850 ; 19.100 ; 19.350 ; 19.633 ; 19.850 ; 20.100 ; 20.350 ; 20.867 ; 21.367 ; 21.850 ; 22.367 ; 22.850 ; 23.350 ; 23.850 ; 5.217 ; 6.500 ; 6.717 ; 7.000 ; 7.700 ; 8.017 ; 8.233 ; 8.467 ; 8.733 ; 8.967 ; 9.200 ; 9.467 ; 9.700 ; 9.983 ; 10.200 ; 10.667 ; 11.183 ; 11.683 ; 12.183 ; 12.683 ; 13.183 ; 13.683 ; 13.967 ; 14.183 ; 14.483 ; 14.700 ; 14.967 ; 15.200 ; 15.483 ; 15.650 ; 16.217 ; 16.700 ; 17.200 ; 17.700 ; 18.200 ; 18.483 ; 18.700 ; 18.983 ; 19.200 ; 19.467 ; 19.683 ; 19.967 ; 20.200 ; 20.700 ; 21.200 ; 21.700 ; 22.200 ; 22.700 ; 23.200 ; 23.700 ; 4.950 ; 5.400 ; 5.600 ; 5.750 ; 5.800 ; 5.950 ; 6.000 ; 6.200 ; 6.300 ; 6.400 ; 6.517 ; 6.633 ; 6.750 ; 6.800 ; 6.900 ; 7.000 ; 7.100 ; 7.200 ; 7.333 ; 7.450 ; 7.550 ; 7.600 ; 7.700 ; 7.783 ; 7.900 ; 8.000 ; 8.100 ; 8.200 ; 8.283 ; 8.400 ; 8.500 ; 8.583 ; 8.700 ; 8.800 ; 8.917 ; 9.000 ; 9.100 ; 9.200 ; 9.300 ; 9.400 ; 9.500 ; 9.617 ; 9.733 ; 9.833 ; 9.950 ; 10.050 ; 10.200 ; 10.300 ; 10.533 ; 10.683 ; 10.833 ; 11.017 ; 11.183 ; 11.350 ; 11.517 ; 11.683 ; 11.850 ; 12.017 ; 12.183 ; 12.350 ; 12.517 ; 12.650 ; 12.850 ; 13.017 ; 13.183 ; 13.333 ; 13.517 ; 13.683 ; 13.850 ; 14.000 ; 14.183 ; 14.400 ; 14.533 ; 14.683 ; 14.783 ; 14.933 ; 15.050 ; 15.183 ; 15.283 ; 15.400 ; 15.533 ; 15.683 ; 15.833 ; 16.017 ; 16.183 ; 16.367 ; 16.517 ; 16.683 ; 16.850 ; 17.017 ; 17.183 ; 17.350 ; 17.517 ; 17.667 ; 17.800 ; 17.933 ; 18.050 ; 18.183 ; 18.300 ; 18.400 ; 18.533 ; 18.683 ; 18.833 ; 18.933 ; 19.050 ; 19.183 ; 19.267 ; 19.400 ; 19.533 ; 19.683 ; 19.800 ; 19.900 ; 20.050 ; 20.200 ; 20.333 ; 20.433 ; 20.533 ; 20.650 ; 20.817 ; 20.933 ; 21.050 ; 21.200 ; 21.283 ; 21.417 ; 21.550 ; 21.700 ; 21.833 ; 22.033 ; 22.183 ; 22.383 ; 22.517 ; 22.683 ; 22.833 ; 22.933 ; 23.167 ; 23.383 ; 5.417 ; 5.733 ; 6.017 ; 6.183 ; 6.350 ; 6.517 ; 6.683 ; 6.850 ; 6.983 ; 7.100 ; 7.183 ; 7.267 ; 7.350 ; 7.433 ; 7.517 ; 7.600 ; 7.667 ; 7.733 ; 7.800 ; 7.867 ; 7.933 ; 8.000 ; 8.067 ; 8.133 ; 8.200 ; 8.283 ; 8.350 ; 8.417 ; 8.483 ; 8.550 ; 8.617 ; 8.700 ; 8.783 ; 8.867 ; 8.950 ; 9.033 ; 9.117 ; 9.200 ; 9.283 ; 9.367 ; 9.450 ; 9.550 ; 9.650 ; 9.750 ; 9.850 ; 9.983 ; 10.133 ; 10.300 ; 10.467 ; 10.633 ; 10.800 ; 10.967 ; 11.133 ; 11.300 ; 11.467 ; 11.633 ; 11.800 ; 11.967 ; 12.133 ; 12.300 ; 12.483 ; 12.633 ; 12.800 ; 12.967 ; 13.133 ; 13.300 ; 13.433 ; 13.567 ; 13.700 ; 13.833 ; 13.933 ; 14.033 ; 14.133 ; 14.233 ; 14.333 ; 14.433 ; 14.533 ; 14.633 ; 14.733 ; 14.833 ; 14.933 ; 15.033 ; 15.133 ; 15.233 ; 15.333 ; 15.433 ; 15.533 ; 15.633 ; 15.733 ; 15.833 ; 15.933 ; 16.067 ; 16.200 ; 16.333 ; 16.467 ; 16.600 ; 16.733 ; 16.867 ; 17.000 ; 17.133 ; 17.267 ; 17.400 ; 17.533 ; 17.667 ; 17.800 ; 17.933 ; 18.033 ; 18.133 ; 18.233 ; 18.333 ; 18.433 ; 18.533 ; 18.633 ; 18.733 ; 18.833 ; 18.933 ; 19.033 ; 19.133 ; 19.233 ; 19.333 ; 19.433 ; 19.533 ; 19.633 ; 19.733 ; 19.833 ; 19.933 ; 20.033 ; 20.133 ; 20.233 ; 20.367 ; 20.500 ; 20.633 ; 20.767 ; 20.900 ; 21.033 ; 21.167 ; 21.317 ; 21.483 ; 21.650 ; 21.817 ; 21.983 ; 22.150 ; 22.317 ; 22.483 ; 22.733 ; 22.983 ; 23.233 ; 23.483 ; 23.733 ; 5.983 ; 6.267 ; 6.517 ; 6.750 ; 6.983 ; 7.167 ; 7.367 ; 7.567 ; 7.750 ; 7.967 ; 8.117 ; 8.367 ; 8.533 ; 8.700 ; 8.967 ; 9.167 ; 9.367 ; 9.550 ; 9.750 ; 10.000 ; 10.267 ; 10.517 ; 10.983 ; 11.500 ; 11.983 ; 12.517 ; 12.983 ; 13.517 ; 13.983 ; 14.267 ; 14.500 ; 14.767 ; 14.983 ; 15.267 ; 15.500 ; 15.767 ; 15.983 ; 16.250 ; 16.517 ; 16.750 ; 16.983 ; 17.517 ; 17.750 ; 17.983 ; 18.267 ; 18.483 ; 18.750 ; 19.000 ; 19.250 ; 19.483 ; 19.750 ; 19.983 ; 20.250 ; 20.517 ; 20.750 ; 20.983 ; 21.267 ; 21.533 ; 22.017 ; 22.517 ; 22.983 ; 23.517 ; 0.050 ; 6.433 ; 6.650 ; 6.933 ; 7.633 ; 7.950 ; 8.167 ; 8.400 ; 8.667 ; 8.900 ; 9.133 ; 9.400 ; 9.633 ; 9.917 ; 10.133 ; 10.600 ; 11.117 ; 11.617 ; 12.117 ; 12.617 ; 13.117 ; 13.617 ; 13.900 ; 14.117 ; 14.417 ; 14.633 ; 14.900 ; 15.133 ; 15.417 ; 15.583 ; 16.150 ; 16.633 ; 17.133 ; 17.633 ; 18.133 ; 18.417 ; 18.633 ; 18.917 ; 19.133 ; 19.400 ; 19.617 ; 19.900 ; 20.133 ; 20.633 ; 21.133 ; 21.633 ; 22.133 ; 22.633 ; 23.133 ; 23.633 ; 6.033 ; 6.333 ; 6.567 ; 6.833 ; 7.133 ; 7.367 ; 7.533 ; 7.633 ; 7.817 ; 8.133 ; 8.333 ; 8.433 ; 8.617 ; 8.833 ; 9.033 ; 9.333 ; 9.667 ; 10.083 ; 10.583 ; 11.050 ; 11.567 ; 12.083 ; 12.567 ; 13.067 ; 13.550 ; 13.933 ; 14.267 ; 14.567 ; 14.817 ; 15.083 ; 15.333 ; 15.583 ; 15.917 ; 16.250 ; 16.567 ; 16.900 ; 17.233 ; 17.733 ; 18.100 ; 18.433 ; 18.767 ; 18.983 ; 19.300 ; 19.717 ; 19.983 ; 20.233 ; 20.583 ; 20.967 ; 21.317 ; 21.633 ; 21.900 ; 22.267 ; 22.583 ; 22.867 ; 23.233 ; 23.550 ; 23.867 ; 5.583 ; 5.783 ; 5.983 ; 6.183 ; 6.283 ; 6.383 ; 6.483 ; 6.617 ; 6.733 ; 6.783 ; 6.883 ; 6.983 ; 7.083 ; 7.183 ; 7.317 ; 7.433 ; 7.583 ; 7.683 ; 7.767 ; 7.883 ; 7.983 ; 8.083 ; 8.183 ; 8.267 ; 8.383 ; 8.483 ; 8.567 ; 8.683 ; 8.783 ; 8.900 ; 8.983 ; 9.083 ; 9.183 ; 9.283 ; 9.383 ; 9.483 ; 9.600 ; 9.717 ; 9.817 ; 9.933 ; 10.033 ; 10.183 ; 10.283 ; 10.417 ; 10.517 ; 10.667 ; 10.817 ; 11.000 ; 11.167 ; 11.333 ; 11.500 ; 11.667 ; 11.833 ; 12.000 ; 12.167 ; 12.333 ; 12.500 ; 12.633 ; 12.833 ; 13.000 ; 13.167 ; 13.317 ; 13.500 ; 13.667 ; 13.833 ; 13.983 ; 14.167 ; 14.383 ; 14.517 ; 14.667 ; 14.767 ; 14.917 ; 15.033 ; 15.167 ; 15.267 ; 15.383 ; 15.517 ; 15.667 ; 15.817 ; 16.000 ; 16.167 ; 16.350 ; 16.500 ; 16.667 ; 16.833 ; 17.000 ; 17.167 ; 17.333 ; 17.500 ; 17.650 ; 17.783 ; 17.917 ; 18.033 ; 18.167 ; 18.283 ; 18.383 ; 18.517 ; 18.667 ; 18.817 ; 18.917 ; 19.033 ; 19.167 ; 19.250 ; 19.383 ; 19.517 ; 19.667 ; 19.783 ; 19.883 ; 20.033 ; 20.183 ; 20.317 ; 20.417 ; 20.517 ; 20.633 ; 20.800 ; 20.917 ; 21.033 ; 21.183 ; 21.267 ; 21.400 ; 21.533 ; 21.683 ; 21.817 ; 22.017 ; 22.167 ; 22.367 ; 22.500 ; 22.667 ; 22.817 ; 22.917 ; 23.150 ; 23.367 ; 23.650 ; 23.917 ; 5.617 ; 5.933 ; 6.100 ; 6.267 ; 6.433 ; 6.600 ; 6.767 ; 6.867 ; 6.950 ; 7.033 ; 7.117 ; 7.200 ; 7.283 ; 7.367 ; 7.450 ; 7.533 ; 7.617 ; 7.700 ; 7.783 ; 7.867 ; 7.950 ; 8.033 ; 8.117 ; 8.200 ; 8.267 ; 8.333 ; 8.400 ; 8.467 ; 8.533 ; 8.600 ; 8.667 ; 8.733 ; 8.800 ; 8.867 ; 8.933 ; 9.000 ; 9.067 ; 9.133 ; 9.200 ; 9.267 ; 9.350 ; 9.433 ; 9.517 ; 9.600 ; 9.683 ; 9.767 ; 9.933 ; 10.100 ; 10.250 ; 10.433 ; 10.600 ; 10.767 ; 10.933 ; 11.100 ; 11.267 ; 11.433 ; 11.600 ; 11.767 ; 11.933 ; 12.100 ; 12.267 ; 12.433 ; 12.600 ; 12.767 ; 12.933 ; 13.100 ; 13.267 ; 13.433 ; 13.567 ; 13.700 ; 13.833 ; 13.950 ; 14.050 ; 14.150 ; 14.250 ; 14.350 ; 14.450 ; 14.550 ; 14.650 ; 14.750 ; 14.850 ; 14.950 ; 15.050 ; 15.150 ; 15.250 ; 15.350 ; 15.450 ; 15.550 ; 15.650 ; 15.750 ; 15.850 ; 15.950 ; 16.067 ; 16.200 ; 16.333 ; 16.467 ; 16.600 ; 16.733 ; 16.867 ; 17.000 ; 17.133 ; 17.267 ; 17.400 ; 17.533 ; 17.667 ; 17.800 ; 17.917 ; 18.017 ; 18.117 ; 18.217 ; 18.317 ; 18.417 ; 18.517 ; 18.617 ; 18.717 ; 18.817 ; 18.917 ; 19.017 ; 19.117 ; 19.217 ; 19.317 ; 19.417 ; 19.517 ; 19.617 ; 19.717 ; 19.817 ; 19.917 ; 20.017 ; 20.117 ; 20.217 ; 20.367 ; 20.500 ; 20.617 ; 20.767 ; 20.900 ; 21.033 ; 21.167 ; 21.300 ; 21.433 ; 21.600 ; 21.767 ; 21.933 ; 22.100 ; 22.267 ; 22.433 ; 22.600 ; 22.933 ; 23.183 ; 23.500 ; 23.900 ; ]; 
%subplot(1,3,1), hist(t_pla_1,40)
%subplot(1,3,2), hist(t_pla_2,40)
%subplot(1,3,3), hist(t_pla_3,40)
%h = findobj(gca,'Type','patch');
%h.FaceColor = [0 0.5 0.5];
%h.EdgeColor = 'w';
figure(2)
rectangle('Position',[5 0 3 50],'FaceColor',[0.9 0.9 .9],'EdgeColor','b',...
    'LineWidth',1)
hold on
h3=histogram(t_pla_3,38)
% h = findobj(gca,'Type','histogram');
% h.FaceColor = [0.45 0.5 0.5];
% h.EdgeColor = 'w';
hold on
h2=histogram(t_pla_2,38)

hold on
h1=histogram(t_pla_1,38)
h = findobj(gca,'Type','histogram');
set(gca,'xtick',[5,8,12,16,20,24],'ytick',[10 20 30 40 50],'FontSize',20)
axis([4.5 24.01 0 55])
%ylabel(' Number of trains ','interpreter','latex','FontSize',20)
ylabel(' Number of trains ','FontSize',25)
xlabel(' Time of Day ','FontSize',25)
grid on
hold on
plot([8 8],[0 50],'-b','LineWidth',1)
text(15,3.5,'AtochaA','FontSize',20,'Color',[1 1 1])
text(18,12.9,'AtochaB','FontSize',20,'Color',[1 1 1])
text(10.71,19,'AtochaC','FontSize',20,'Color',[1 1 1])
text(5,52,'AtochaS','FontSize',20,'Color',[0.5 0.5 0.5])


print('-depsc2','-tiff','histograma_trenes')