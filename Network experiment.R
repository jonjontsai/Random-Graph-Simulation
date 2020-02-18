#This is a simulation of Graph theory

#---------------------------------------------------------------------
count_max = function(n,bondnum){ #�^�ǳ̤j��]�t�h�֭�nodes
  #n=10
  #bondnum = 20
  connect = matrix(0,nrow = n,ncol = n) #create a bonding matrix of 0s
  totalbdnum = n*(n-1)/2
  bond = sample(totalbdnum,bondnum) #�H�����Xbondnum��bond,������
  
  bondcount = 1
  chains = list()
  #�ھڶüƲ��Xbond,���K��P�@�諸�[���@�@called chains
  for (i in c(2:n)){
    for (j in c(1:(i-1))){ #i,j�O�w��bond matrix,�@Cn��2��
      if(bondcount %in% bond){
        connect[i,j] = 1
        if(length(chains) == 0) chains = list(c(i,j))
        find = 0
        for (k in c(1:length(chains))){ #�ˬdi,j�b����list
          if(i %in% chains[[k]]){
            if(!(j %in% chains[[k]])) chains[[k]] = append(chains[[k]],j) #i�bj���b
            find = 1
            break
          }
          else if(j %in% chains[[k]]){
            if(!(i %in% chains[[k]])) chains[[k]] = append(chains[[k]],i) #j�bi���b
            find = 1
            break
          }
        }
        if(find == 0){ #j,j���S���b������l�]�N�O�s���F��
          chains = c(chains,list(c(i,j)))
        }
      }
      bondcount = bondcount + 1
      #print(bondcount)
    }
  }
  #return(chains)
  return(max(lengths(chains))) #�H���A�̤j��
}

#newy = count_max(30,20)
#newy
#newy[[1]][1]

#Main-----------------------------------------------------------------
par(mfrow = c(3,2))
nums = c(10,30,60,90,120,150)
for(n in nums){
  bdnum = 4*n
  x = numeric(bdnum)
  y = numeric(bdnum)
  for (i in c(1:bdnum)){ #�{�b�@�������٨S�����ܦh��(��var)
    x[i] = i/n
    y[i] = count_max(n,i)/n
  }
  plot(x,y,
       xlab = "# of total bonds / # of nodes",ylab = "% of nodes in largest chain",
       main = paste0("n = ",n),
       col = 1)
}