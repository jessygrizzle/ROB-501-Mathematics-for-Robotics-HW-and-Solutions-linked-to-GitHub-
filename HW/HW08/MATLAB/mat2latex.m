function latexstr = mat2latex(matsymobj,hashlist,filelabel,arg)

%Eric Westervelt
%April 21, 2003

[n,m]=size(matsymobj);

fid = fopen([filelabel,'_',inputname(1),'.tex'],'w');

for i=1:n,
  for j=1:m,
    tmp_in = char(matsymobj(i,j));
    tmp_out = replace_var(tmp_in,hashlist);
    tmp_out = strrep(tmp_out,'\','\\');
    
    fprintf(fid,'\\noindent\n');
%    fprintf(fid,'\\begin{equation}\n');
    fprintf(fid,'\\begin{tabular}{p{\\lefteqncolwidth}cp{\\righteqncolwidth}}\n');
    fprintf(fid,['\\hfill $(',inputname(1),arg,')_{',num2str(i),',',num2str(j),'}', ...
		 '$ & $=$ & \n']);
    fprintf(fid,['\\begin{minipage}[t]{\\righteqncolminipagewidth}', ...
		 '\\raggedright\n']);
    fprintf(fid,['$',tmp_out,'$\\end{minipage}']);
    fprintf(fid,'\n\\end{tabular}');
    fprintf(fid,'\n\n');
%    fprintf(fid,'\\end{equation}\n\n');
  end
end

fclose(fid);

% --------------------------------------------------

function out = replace_var(in,hashlist)

fcnhashlist = {{'sin(','\sin({'},...
	       {'cos(','\cos({'},...
	       {'tan(','\tan({'}};

out = in;
for i=1:length(hashlist)
  out = strrep(out,hashlist{i}{1},hashlist{i}{2});
end

for i=1:length(fcnhashlist)
  out = strrep(out,fcnhashlist{i}{1},fcnhashlist{i}{2});

  fcn_str = findstr(out,fcnhashlist{i}{1});
  I_right_parens=findstr(out,')');
  for j=length(fcn_str):-1:1
    I_I_right_paren = find(I_right_parens > fcn_str(j));
    out = [out(1:I_right_parens(I_I_right_paren)-1),'}', ...
	   out(I_right_parens(I_I_right_paren):end)];
  end
end

