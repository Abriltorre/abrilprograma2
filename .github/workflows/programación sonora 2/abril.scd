// Secuencias

// Para cambiar el tempo
TempoClock.tempo=125/70

(// puede comentar esta línea depués de declarar las secuencias para declarar individualmente
(
~sec1 = Pdef(\sec, Pbind(\instrument, \saw,
	\dur, Pseq([0.5, 0.25, 0.25, Pn(0.125, 4), 1], inf),
	\amp,0.92,
	\freq, Pseq([400, 200, 300, 290, Pn(350, 4), Pseq([200, 400, 500, 850], 3)], inf),
	\rel, 0.09,
	\out, 11
))
);

(
~sec2 = Pdef(\sec2, Pbind(\instrument, \tri,
	\dur, Pseq([0.5, 0.15, 0.12, 0.5, Pn(0.25, 2)], inf),
	\amp, 0.54,
	\freq, Pseq([230, 300, 400, 400, 350, 230, 300, 200], inf),
	\rel, 0.5,
	\out, 0
))
);

(
~sec3 = Pdef(\sec3, Pbind(\instrument, \pulse,
	\dur, 0.25,
	\amp, Pseq([0.01, 0.02, 1.15, 0.01, 0.03, 0.02, 0.15, 0.01, Pseq([0.1, 0.12, 0.01, 0.15], 2)], inf),
	\at, 0.01, \rel, 0.1,
	\out, 17
))
);

(
~son1 = Pdef(\son1, Pbind(\instrument, \audio,
	\dur, Pseq([0.25, 0.175, 0.125], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.1, 0.01, 0.04], inf),
	\rate, Pseq([1, 1.1, 1, 1, 1.2], inf),
	\sp, Pseq([0.1, 0.5, 0.75, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.6,
	\out, 0
))
);
);

~sec1.play.quant(4);
~sec2.play.quant(4);
~sec3.play.quant(4);
~son1.play.quant(4);

Pbindef(\sec, \freq, Pseq([300, 800, 300, 6000, Pn(350, 4), Pseq([400, 500, 470, 750], 3)].pyramid, inf));
Pbindef(\sec4, \dur, Pseq([0.375, 0.125, 0.5, 0.5, 0.5], inf), \freq, Pseq([300, 375, Pn(300, 3)], inf));

// modificación de efectos
~rev.set(\mix, 0.5, \room, 0.5, \damp, 0.5);
~dly.set(\dt, 0.25, \dct, 2.1, \out, 0);
~lpf.set(\cfl, 100);
~hpf.set(\cfh, 1000);
~bpf.set(\cfb, 1000);

~sec1.stop;
~sec2.stop;
~sec3.stop;
~son1.stop;

s.quit;