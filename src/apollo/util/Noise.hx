package apollo.util;

#if tink_core
typedef Noise = tink.core.Noise;
#else
enum Noise { Noise; }
#end

