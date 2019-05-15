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

# for mai[17]
sum_xy = 0; sum_xx = 0;
for (j in 1:17) {
  sum_xy = sum_xy + mai0_n[j]*real_n[j]
  sum_xx = sum_xx + mai0_n[j]^2
}
beta = sum_xy/sum_xx
mai0_lm = beta*mai0_n[i]

mai0_n[17]
mai0_lm

# for alle
mai_err = numeric(17)
mailm_err = numeric(17)

beta = numeric(17)
mai0_lm = mai0
for (i in 2:17) {
  sum_xy = 0; sum_xx = 0;
  for (j in 1:(i-1)) {
    sum_xy = sum_xy + mai0_n[j]
    sum_xy
    sum_xx = sum_xx + mai0_n[j]^2
    sum_xx
  }
  beta[i] = sum_xy/sum_xx
  mai0_lm[i] = beta[i]*mai0_n[i]
  
  print(mai0_n[i])
  print(mai0_lm[i])
  real[i]
  
  mai_err[i] = abs(mai0_n[i]-1)
  mailm_err[i] = abs(mai0_lm[i]-1)
  
}
err_list=list()

m=0
for (mnd in list(mai0_n, aug0_n, nov0_n, feb_n, mai_n, aug_n, nov_n)) {
  m=m+1
  beta = numeric(17)
  
  mnd_lin = mnd
  for (i in 2:17) {
    sum_xy = 0; sum_xx = 0;
    # for k lin reg, changing k interactivly and for loop below reads for (j in max((i-k),1):(i-1))
    # for k lin reg, and "for (j in 1:(i-1))" for standard linear reg.
    k = 1
    for (j in max((i-k),1):(i-1)) {
      sum_xy = sum_xy + mnd[j]
      sum_xx = sum_xx + mnd[j]^2
    }
    beta[i] = sum_xy/sum_xx
    
    
    mnd_lin[i] = beta[i]*mnd[i]
  }
  err=0
  err_lin=0
  L1err=0
  L1err_lin=0
  L1err_ref=0
  for (i in 7:17) {
    
    L1err = L1err + abs(mnd[i]-1)
    L1err_lin = L1err_lin + abs(mnd_lin[i]-1)
    
    err = err + abs(mnd[i]-1)^2
    err_lin = err_lin + abs(mnd_lin[i]-1)^2
    
  }
  
  #adjusted for j=5,6,7
  
  if (m==5) {
    L1 = 1.33*L1err/11
    L1_lin = 1.33*L1err_lin/11
    err_list <- c(err_list, L1_lin)
  }
  else if (m==6) {
    L1 = 2*L1err/11
    L1_lin = 2*L1err_lin/11
    err_list <- c(err_list, L1_lin)
  }
  else if (m==7) {
    L1 = 4*L1err/11
    L1_lin = 4*L1err_lin/11
    err_list <- c(err_list, L1_lin)
  }
  else {
    L1 = L1err/11
    L1_lin = L1err_lin/11
    err_list <- c(err_list, L1_lin)
  }
  
  
  #mse = err/11
  #mse_lin = err_lin/11
  
  #L1 = L1err/11
  #L1_lin = L1err_lin/11
  #err_list <- c(err_list, L1_lin)
  
  
  #print(mse)
  #print(mse_lin)
  
  #print(L1)
  print(L1_lin)
  
  
  
  
}

sum=0
for (n in err_list) {
  sum = sum+n
}
avg = sum/length(err_list)
avg

