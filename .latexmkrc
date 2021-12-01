$makeindex = "makeindex -s gind.ist %O -o %D %S";
add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls{
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, 'glo', 'gls';

# @default_files = ("*.tex", "*.dtx");
# xetex %S 用于从 .dtx 生成 .ins 等文件
# $xelatex = 'cmd /c xetex %S & xelatex %O %S';
# $xelatex = 'internal mylatex %O %S';
# sub mylatex{
#     system 'xetex', @_;
#     return system 'xelatex', @_;
# }
