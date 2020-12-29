%Probabilistic Sum: product Conorm applied to a vector.
function TL=prodCoNorm(V)
   l=length(V);
   TL=V(1);
   for i=2:l
       TL=TL+V(i) - TL * V(i);
   end
end