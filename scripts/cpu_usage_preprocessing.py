 
i=1
j=2
maxi=0
maxj=0
x=[]
y=[]

y.append(0.0)

x.append(0)


a=[]

a.append(0.0)

b=[]

b.append(0.0)

c=[]

c.append(0.0)


d=[]

d.append(0.0)

client=[]
client.append(0.0)
client.append(1)


sum1=[]
sum2=[]
sum3=[]
sum4=[]
sum5=[]
sorted_array=[0,0,0,0,0]
tput_median=[]
for x in range(0,1000):
    sum1.append(0.0)
    sum2.append(0.0)
    sum3.append(0.0)
    sum4.append(0.0)
    sum5.append(0.0)

#path="E:\\effects of conflict\\hconflict"
path="E:\\effect of different consistency\\weak consistency"
nclient=100
filename="cpu_usage_median_wconsistency.txt"
client_cpu_usage_limit=5000


j=0

for i in range(1,6):
    myfile = open(path+"\\run"+str(i)+"\cpuUsage.txt")
    j=0
    for line in myfile:
        line.strip()
        #print(line)
        latency=line.split(":")


        #latency[2].lstrip(" ")
        #print(latency[0])
        
        if latency[0]=="client1":
            client = latency[1].split("%")
        
        #print(client[0])
        
        
        try: 
            if float(client[0])<client_cpu_usage_limit:
                #print(client[0])
                continue

            if latency[0]!="master5" and latency[0]!="client1":
               
                l=latency[1].split("%")
               # print(client)
                if i==1:
                    #print(l[0])
                    sum1[j]=sum1[j]+float(l[0])
                if i==2:
                    sum2[j]=sum2[j]+float(l[0])
                if i==3:
                    sum3[j]=sum3[j]+float(l[0])
                if i==4:
                    sum4[j]=sum4[j]+float(l[0])
                if i==5:
                    sum5[j]=sum5[j]+float(l[0])
            else:
                #print(client[0])
                #print(latency[0])
                if latency[0]=="master5":
                    j=j+1

        except Exception as e:
            print("Oops!", e.__class__, "occurred.")
            print("Next entry.")
            print()
        if j==700:
            break
    # plotting the points 
    myfile.close()
  
#print(sum1)
myfile = open(filename,"w")

for x in range(0,700):
    sorted_array[0]=sum1[x]
    sorted_array[1]=sum2[x]
    sorted_array[2]=sum3[x]
    sorted_array[3]=sum4[x]
    sorted_array[4]=sum5[x]
    
    sorted_array.sort()
    
   # print(sorted_array)
    myfile.write(str((sum1[x]+sum2[x]+sum3[x]+sum4[x]+sum5[x])/5)+"\n")
    
    #myfile.write(str(sorted_array[3])+"\n")
                     
myfile.close()