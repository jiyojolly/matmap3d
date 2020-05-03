function gst = greenwichsrt(Jdate)
%  compute greenwich sidereal time
%  Jdate: Julian days from 4713 bc  as output by juliantime(datetime)
%    gst: greenwich sidereal time    [0, 2pi)
%    vallado 4th Edition
validateattributes(Jdate, {'numeric'}, {'positive'})
%% Vallado Eq. 3-42 p. 184, Seidelmann 3.311-1
tUT1 = (Jdate - 2451545) / 36525;
%% Eqn. 3-47 p. 188
gmst_sec = 67310.54841 + (876600 * 3600 + 8640184.812866) * tUT1 + 0.093104 * tUT1 .^ 2 - 6.2e-6 * tUT1 .^ 3;
%% 1/86400 and %(2*pi) implied by units of radians
gst = mod(gmst_sec * (2 * pi) / 86400.0, 2 * pi);
end
