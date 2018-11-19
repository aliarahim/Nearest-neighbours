% load iris.csv
% trainx = iris(1:70,1:4);
% trainy=iris(1:70,5);
% testx=iris(71:100,1:4);
% testy=iris(71:100,5);
load ionosphere.csv
trainx = ionosphere(1:200,1:34);
trainy=ionosphere(1:200,35);
testx=ionosphere(201:351,1:34);
testy=ionosphere(201:351,35);

% class1=iris(:,5)==1
% plot (iris(class1,2), iris(class1,1),'.r','markersize', 15); 
% hold on 
% plot (iris(~class1,2), iris(~class1,1),'.b', 'markersize', 15); 

d=length(trainy);
b=length(testy);
dis=zeros(d,b);
for c=1:d
    for j=1:b
      k=(trainx(c,:)-testx(j,:)).^2;
      dis(c,j)=sqrt(sum(k));
    end
end
r=size(trainx);
s=r(1,2); 
t=r(1,1);
k=input('please input k value');
p=0;
q=0;
 for i=1:b
sort{i}=[trainx,trainy,dis(:,i)];
 end
 for i=1:b
x=sort{1,i};
sorted=zeros(size(x));
 
 for n=1:t
[minval, minidx] = min(x(:,s+2));
sorted(n,:)=x(minidx,:);
 x(minidx,:)=[];
 end
  u{i}=sorted;
 end

 for i=1:b
     kn=u{1,i}(1:k,s+1);
    tbl=tabulate(kn);
    [maxval,maxidx]=max(tbl(:,2))
    knn(i,1)=tbl(maxidx,1);
    if knn(i,1)==testy(i,1);
p=p+1;
else
q=q+1;
    end
 end
 cc=(p/b)*100
 mc=(q/b)*100
 