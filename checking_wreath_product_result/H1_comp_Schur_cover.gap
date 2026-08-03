H1FViaUnramPart:= function(arg)
    local G,H,epi,tG,tH,HGrep,dengen,tGtHrep,kergen,x,h,i,imh,den,num;
    G:=arg[1];
    if Length(arg)=1 then
        H:=Stabilizer(G,1);
    else
        H:=arg[2];
    fi;
    epi:=EpimorphismSchurCover(G);
    tG:=Source(epi);
    tH:=PreImage(epi,H);
    if GeneratorsOfGroup(tH)=[] then
        return [];
    fi;
    HGrep:=List(RightCosets(G,H),Representative);
    dengen:=ShallowCopy(GeneratorsOfGroup(DerivedSubgroup(tH)));
    tGtHrep:=List(HGrep,x->PreImagesRepresentative(epi,x)^-1);
    kergen:=GeneratorsOfGroup(Kernel(epi));
    for x in tGtHrep do
        for h in kergen do
            Add(dengen,Comm(h,x));
        od;
    od;
    for i in [1..Length(HGrep)] do
        for imh in GeneratorsOfGroup(Intersection(H,H^HGrep[i])) do
            Add(dengen,Comm(PreImagesRepresentative(epi,imh),tGtHrep[i]));
        od;
    od;
    den:=Group(dengen);
    num:=PreImage(epi,Intersection(H,DerivedSubgroup(G)));
    return AbelianInvariants(num/den);
end;

ConjCheck := function(d)
	local output, m, i, j, T, B, G;
    output := Concatenation("conjcheck_output_", String(d), ".csv");
    PrintTo(output, "i, j, True_or_false\n");
    
    for m in Filtered(DivisorsInt(d), x-> 1 < x and x < d) do
        for i in [1.. NrTransitiveGroups(m)] do
            for j in [1.. NrTransitiveGroups(d/m)] do
	    	    T:=TransitiveGroup(m,i);
                B:=TransitiveGroup(d/m,j);
                G:=WreathProductImprimitiveAction(T,B);	
                AppendTo(output,
                    Concatenation(
                    String([m,i]), ", ",
                    String([d/m,j]), ", ",
                    String(H1FViaUnramPart(G) = H1FViaUnramPart(B)), "\n"
                    )
                );
            od;
	    od;
    od; 
end;