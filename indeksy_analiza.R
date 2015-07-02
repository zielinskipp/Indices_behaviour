### Cele skryptu opisne w README.md

library(tuneR)
library(seewave)

source("functions/htrgnt.R")
source("functions/htrgnt_sound.R")

directory <- "~/Dropbox/dane_blota/"
sounds <- dir("~/Dropbox/dane_blota/")

# Wczytanie dźwięku

sound <- readWave(paste0(directory, sounds[1]), 1, 60, "seconds")
sound_af <- afilter(sound, plot = F, output = "Wave")

sound_af10 <- afilter(sound, plot = T, threshold = 10, output = "Wave")
sound_am <-stats::filter(as.matrix(sound),filter = c(1,1,1)/3) 

sound_bp <- ffilter(sound, from = 1000, to = 13000, output = "Wave")
sound_lp <- ffilter(sound, to = 16000, output = "Wave")

sound_bp_af <- afilter(sound_bp, output = "Wave")
sound_lp_af <- afilter(sound_lp, output = "Wave")

# Writing data
writeWave(sound, "output/sound.wav")
writeWave(sound_af, "output/sound_af.wav")
writeWave(sound_af10, "output/sound_af10.wav")
writeWave(sound_bp, "output/sound_bp.wav")
writeWave(sound_lp, "output/sound_lp.wav")
writeWave(sound_lp_af, "output/sound_lp_af.wav")
writeWave(sound_bp_af, "output/sound_bp_af.wav")



spectro(sound)



dane_raw <- htrgnt_sound(sound)
dane_af <- htrgnt_sound(sound_af)
dane_af10 <- htrgnt_sound(sound_af10)
dane_bp <- htrgnt_sound(sound_bp)
dane_lp <- htrgnt_sound(sound_lp)
dane_lp_af <- htrgnt_sound(sound_lp_af)
dane_bp_af <- htrgnt_sound(sound_bp_af)

dane_whole <- rbind(dane_raw, dane_af, dane_af10, dane_bp, dane_lp, dane_lp_af,
                    dane_bp_af)

row.names(dane_whole) <- c("raw", "af", "af10", "bp", "lp", "lp_af", "bp_af")
spectro(sound_af)

