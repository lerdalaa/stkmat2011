mai0 = c(28568, 50680, 57555, 49667, 61921, 70440, 85057, 121699, 139073, 150054, 146697, 201016, 218587, 188062, 189597, 152366, 141824)
aug0 = c(38095, 54374, 65055, 70604, 74487, 90175, 121931, 136327, 148883, 153025, 175431, 211108, 224659, 190580, 185997, 149628, 139626)
nov0 = c(49486, 59917, 61356, 81055, 88333, 100665, 128988, 148043, 142810, 155188, 189819, 214201, 234731, 194202, 177364, 144195, 142363)
feb = c(55090, 70581, 61297, 79962, 89471, 105450, 132625, 141044, 139078, 145990, 190904, 204709, 235257, 193734, 169967, 146939, 158036)
mai = c(56650, 67589, 65307, 83331, 97166, 112463, 134625, 148545, 144180, 149363, 191182, 217545, 234800, 195540, 168519, 151979, 154509)
aug = c(58318, 64763, 68110, 80664, 95227, 118168, 131354, 147082, 144476, 157021, 190301, 218541, 232144, 199439, 167348, 153289, 154537)
nov = c(57265, 63806, 66406, 78750, 94322, 112887, 130120, 145041, 138560, 158959, 186501, 217736, 223566, 199808, 168949, 148586, 153452)
real = c(53864, 62322, 66519, 80527, 91716, 110228, 127591, 139991, 131287, 152772, 178984, 215414, 219864, 196810, 163275, 146645, 149643)

mai0_n = mai0/real
aug0_n = aug0/real
nov0_n = nov0/real
feb_n = feb/real
mai_n = mai/real
aug_n = aug/real
nov_n = nov/real
real_n = real/real

# Give the chart file a name.
png(file = "earlier_year.jpg",width=600,height=350)

# Plot the bar chart.
plot((real/1000),type = "l", col = "black", xlab = "År", ylab = "Investeringer i milliarder",
     main = "investeringsanslag året før", ylim=c(0,250))
lines((mai0/1000),type = "l", col = "red")
lines((aug0/1000),type = "l", col = "green")
lines((nov0/1000),type = "l", col = "blue")
axis(1, at=1:17, labels=02:18)
legend(10, 95, legend=c("faktiske investeringer", "mai", "aug", "nov"),
       col=c("black", "red", "green", "blue"), lty=1:2, cex=0.8)

# Save the file.
dev.off()

png(file = "same_year.jpg",width=600,height=350)

plot((real/1000),type = "l", col = "black", xlab = "År", ylab = "Investeringer i milliarder",
     main = "investeringsanslag samme år", ylim=c(0,250))
lines((mai/1000),type = "l", col = "red")
lines((aug/1000),type = "l", col = "green")
lines((nov/1000),type = "l", col = "blue")
lines((feb/1000),type = "l", col = "yellow")

axis(1, at=1:17, labels=02:18)
legend(10, 95, legend=c("faktiske investeringer", "mai", "aug", "nov", "feb"),
       col=c("black", "red", "green", "blue", "yellow"), lty=1:2, cex=0.8)
dev.off()



# NORMERTE TALL

png(file = "earlier_year_norm.jpg",width=600,height=350)

# Plot the bar chart.
plot((real_n),type = "l", col = "black", xlab = "År", ylab = "relative ant / faktiske invest",
     main = "investeringsanslag året før", ylim=c(0.50,1.50))
lines((mai0_n),type = "l", col = "red")
lines((aug0_n),type = "l", col = "green")
lines((nov0_n),type = "l", col = "blue")
axis(1, at=1:17, labels=02:18)
legend("topright", legend=c("faktiske investeringer", "mai", "aug", "nov"),
       col=c("black", "red", "green", "blue"), lty=1:2, cex=0.8)

# Save the file.
dev.off()

png(file = "same_year_norm.jpg",width=600,height=350)

plot((real_n),type = "l", col = "black", xlab = "År", ylab = "relative ant / faktiske invest",
     main = "investeringsanslag samme år", ylim=c(0.50,1.50))
lines((mai_n),type = "l", col = "red")
lines((aug_n),type = "l", col = "green")
lines((nov_n),type = "l", col = "blue")
lines((feb_n),type = "l", col = "yellow")

axis(1, at=1:17, labels=02:18)
legend("topright", legend=c("faktiske investeringer", "mai", "aug", "nov", "feb"),
       col=c("black", "red", "green", "blue", "yellow"), lty=1:2, cex=0.8)
dev.off()

