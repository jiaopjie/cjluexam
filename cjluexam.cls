%%
%% This is file `cjluexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cjluexam.dtx  (with options: `class')
%% 
%% Copyright (C) 2021-2023 by jiaopjie
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{cjluexam}
  {2023/03/01}{1.2.0}{CJLU Exam Template}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage{expl3,xparse}
\keys_define:nn {cjluexam}
{
  answer       .bool_gset:N = \g__cjluexam_answer_bool,
  answer       .initial:n   = false,
  english      .bool_gset:N = \g__cjluexam_english_bool,
  english      .initial:n   = false,
  graduate     .bool_gset:N = \g__cjluexam_graduate_bool,
  graduate     .initial:n   = false,
  academicyear .tl_gset:N   = \g__cjluexam_academicyear_tl,
  academicyear .initial:n   = {20\underline{\qquad}\~{}20\underline{\qquad}},
  term         .tl_gset:N   = \g__cjluexam_term_tl,
  term         .initial:n   = \underline{\quad},
  course       .tl_gset:N   = \g__cjluexam_course_tl,
  course       .initial:n   = \hspace{6em},
  type         .tl_gset:N   = \g__cjluexam_type_tl,
  type         .initial:n   = \quad,
  openbook     .bool_gset:N = \g__cjluexam_openbook_bool,
  openbook     .initial:n   = false,
  carryon      .tl_gset:N   = \g__cjluexam_carryon_tl,
  seat         .bool_gset:N = \g__cjluexam_seat_bool,
  seat         .initial:n   = false,
  college      .tl_gset:N   = \g__cjluexam_college_tl,
  teacher      .tl_gset:N   = \g__cjluexam_teacher_tl,
  class        .tl_gset:N   = \g__cjluexam_class_tl,
  classroom    .tl_gset:N   = \g__cjluexam_classroom_tl,
  testdate     .tl_gset:N   = \g__cjluexam_testdate_tl,
  testyear     .tl_gset:N   = \g__cjluexam_testyear_tl,
  testmonth    .tl_gset:N   = \g__cjluexam_testmonth_tl,
  testday      .tl_gset:N   = \g__cjluexam_testday_tl,
  testtime     .tl_gset:N   = \g__cjluexam_testtime_tl,
}
\NewDocumentCommand \cjluexamset { m } { \keys_set:nn { cjluexam } { #1 } }
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[heading,zihao=5]{ctex}[2014/03/06]
\RequirePackage[a4paper,margin=30mm,footskip=6mm]{geometry}
\RequirePackage{titleps}
\newpagestyle{main}[\zihao{-5}\fangsong]
{\footrule\setfoot{}{\c__cjluexam_foot_tl}{}}
\pagestyle{main}
\RequirePackage{lastpage}
\tl_const:Nn \c__cjluexam_foot_tl
{
  \bool_if:NTF \g__cjluexam_answer_bool
  {
    \bool_if:NTF \g__cjluexam_english_bool
    {
      《 \g__cjluexam_course_tl 》
      Examination~paper~reference~answers~and~grading~standards \quad
      Page~\thepage/\pageref{LastPage}
    }
    {
      《 \g__cjluexam_course_tl 》课程试卷（ \g__cjluexam_type_tl ）
      参考答案及评分标准 \quad
      第~\thepage~页 \enskip 共~\pageref{LastPage}~页
    }
  }
  {
    \__cjluexam_binding:
    \bool_if:NTF \g__cjluexam_english_bool
    {
      China~Jiliang~University~
      \g__cjluexam_academicyear_tl{}~Term~(\g__cjluexam_term_tl)
      《 \g__cjluexam_course_tl 》Test~Paper~(\g__cjluexam_type_tl) \quad
      Page~\thepage/\pageref{LastPage}
    }
    {
      中国计量大学 \bool_if:NT \g__cjluexam_graduate_bool {研究生}
      \g__cjluexam_academicyear_tl 学年第 \g__cjluexam_term_tl 学期
      《 \g__cjluexam_course_tl 》课程试卷（ \g__cjluexam_type_tl ）
      第~\thepage~页 \enskip 共~\pageref{LastPage}~页
    }
  }
}
\if@twoside
  \cs_new:Npn \__cjluexam_binding:
  {
    \int_case:nn { \int_mod:nn { \value{page} } {4} }
    {
      {0} { \__cjluexam_drawbinding:n{ 1} }
      {1} { \__cjluexam_drawbinding:n{-1} }
    }
  }
\else
  \cs_new:Npn \__cjluexam_binding:
  { \int_if_odd:nT { \value{page} } { \__cjluexam_drawbinding:n{-1} } }
\fi
\RequirePackage{tikz,graphicx}
\cs_new:Npn \__cjluexam_drawbinding:n #1
{
  \begin{tikzpicture}[remember~picture,overlay]
    \zihao{5}\sffamily
    \path (current~page.center)
      node
      [
        text~width=\textheight,
        rotate=-90,
        yshift=.5*#1*\textwidth+#1*.5cm,
      ]
      {
        \dotfill\raisebox{-.45em}{\rotatebox{90}{装}}
        \dotfill\raisebox{-.45em}{\rotatebox{90}{订}}
        \dotfill\raisebox{-.45em}{\rotatebox{90}{线}}\dotfill
      };
  \end{tikzpicture}
}
\RenewDocumentCommand \maketitle {}
{
  \begin{center}
    \c__cjluexam_title_tl
  \end{center}
  \nointerlineskip
  \begin{flushleft}
    \c__cjluexam_info_tl
    \bool_if:NF \g__cjluexam_answer_bool { \__cjluexam_score: }
  \end{flushleft}
}
\tl_const:Nn \c__cjluexam_title_tl
{
  \linespread{1.5}\zihao{4}\bfseries\fangsong
  \bool_if:NTF \g__cjluexam_english_bool
  {
    China~Jiliang~University~
    \g__cjluexam_academicyear_tl{}~Term~(\g__cjluexam_term_tl)\\
    《 \g__cjluexam_course_tl 》
    \bool_if:NTF \g__cjluexam_answer_bool
    {
      Answer~Sheet\\
      \textnormal{Examination~paper~reference~answers~and~grading~standards}
    }
    {
      Test~Paper~(\g__cjluexam_type_tl)
      \bool_if:NT \g__cjluexam_seat_bool { \__cjluexam_seat: }
    }
  }
  {
    中国计量大学 \bool_if:NT \g__cjluexam_graduate_bool {研究生}
    \g__cjluexam_academicyear_tl 学年第 \g__cjluexam_term_tl 学期\\
    《 \g__cjluexam_course_tl 》课程
    \bool_if:NTF \g__cjluexam_answer_bool
    { 试卷（ \g__cjluexam_type_tl ）\\ 参考答案及评分标准 }
    {
      考试试卷（ \g__cjluexam_type_tl ）
      \bool_if:NT \g__cjluexam_seat_bool { \__cjluexam_seat: }
    }
  }
}
\tl_const:Nn \c__cjluexam_info_tl
{
  \linespread{1.5}\zihao{-4}
  \bool_if:NTF \g__cjluexam_answer_bool
  {
    \makebox[\linewidth][l]{
      \bool_if:NTF \g__cjluexam_english_bool
      {
        College:\__cjluexam_fill:nnn{30mm}{}{\g__cjluexam_college_tl}\hfill
        Class:  \__cjluexam_fill:nnn{30mm}{}{\g__cjluexam_class_tl  }\hfill
        Teacher:\__cjluexam_fill:nnn{30mm}{}{\g__cjluexam_teacher_tl}
      }
      {
        开课学院：\__cjluexam_fill:nnn{25mm}{}{\g__cjluexam_college_tl}\hfill
        学生 \bool_if:NF \g__cjluexam_graduate_bool {班级} ：
              \__cjluexam_fill:nnn{25mm}{}{\g__cjluexam_class_tl  }\hfill
        教师：\__cjluexam_fill:nnn{25mm}{}{\g__cjluexam_teacher_tl}
      }
    }
  }
  {
    \setlength{\fboxrule}{ 0.04em}
    \setlength{\fboxsep }{-0.04em}
    \clist_set:Nn \l_tmpa_clist
    { \rule{0.683em}{0.683em} , \fbox{\rule[0.683em]{0.683em}{0em}} }
    \bool_if:NT \g__cjluexam_openbook_bool { \clist_reverse:N \l_tmpa_clist }
    \bool_if:NTF \g__cjluexam_english_bool
    {
      \__cjluexam_fill:nnn{70mm}{College:  }{\g__cjluexam_college_tl } \hfill
      \__cjluexam_fill:nnn{70mm}{Teacher:  }{\g__cjluexam_teacher_tl } \\
      \__cjluexam_fill:nnn{70mm}{Test~Date:}{\g__cjluexam_testdate_tl} \hfill
      \__cjluexam_fill:nnn{70mm}{Test~Classroom:}{\g__cjluexam_classroom_tl}\\
      Examination~Form:~Closed-book~\clist_use:Nn\l_tmpa_clist{、Open-book~}\\
      \clist_set:Nn \l_tmpa_clist {Name, ID, Major, Grade, {}}
      \clist_use:Nn \l_tmpa_clist {:\__cjluexam_fill:nnn{25mm}{}{}\hfill} \\
    }
    {
      \tl_set:Nn \l_tmpa_tl
      {
        考试时间：
        \__cjluexam_fill:nnn{12mm}{}{ \g__cjluexam_testyear_tl  } 年
        \__cjluexam_fill:nnn{ 8mm}{}{ \g__cjluexam_testmonth_tl } 月
        \__cjluexam_fill:nnn{ 8mm}{}{ \g__cjluexam_testday_tl   } 日
        \__cjluexam_fill:nnn{12mm}{}{ \g__cjluexam_testtime_tl  } 时
      }
      \bool_if:NTF \g__cjluexam_graduate_bool
      {
        开课学院：\__cjluexam_fill:nnn{50mm}{}{\g__cjluexam_college_tl}，\hfill
        开课教师：\__cjluexam_fill:nnn{50mm}{}{\g__cjluexam_teacher_tl} \\
        \l_tmpa_tl ， \hfill
        考试地点：\__cjluexam_fill:nnn{40mm}{}{\g__cjluexam_classroom_tl} \\
      }
      {
        开课学院：\__cjluexam_fill:nnn{38mm}{}{ \g__cjluexam_college_tl }
        ， \hfill \l_tmpa_tl \\
      }
      考试形式：闭卷~\clist_use:Nn \l_tmpa_clist { 、开卷~ } ， \hfill
      允许带 \__cjluexam_fill:nnn{70mm}{}{\g__cjluexam_carryon_tl} 入场 \\
      \bool_if:NTF \g__cjluexam_graduate_bool
      { \clist_set:Nn \l_tmpa_clist {考生姓名, 学号, 学科, 年级, {}} }
      { \clist_set:Nn \l_tmpa_clist {考生姓名, 学号, 专业, 班级, {}} }
      \clist_use:Nn \l_tmpa_clist {：\__cjluexam_fill:nnn{20mm}{}{}\hfill} \\
    }
  }
}
\cs_new_protected:Npn \__cjluexam_fill:nnn #1#2#3
{
  \hbox_set:Nn \l_tmpa_box{#2}
  \dim_set:Nn \l_tmpa_dim {#1 - \box_wd:N \l_tmpa_box}
  \mode_leave_vertical:
  \box_use:N \l_tmpa_box
  \hbox_set:Nn \l_tmpa_box{#3}
  \box_set_dp:Nn \l_tmpa_box{0pt}
  \dim_set:Nn \l_tmpa_dim { \dim_max:nn {\l_tmpa_dim} {\box_wd:N\l_tmpa_box} }
  \underline{ \makebox[\l_tmpa_dim]{\box_use:N \l_tmpa_box} }
}
\NewDocumentCommand \Fill { O{4em} m }
{
  \hbox_set:Nn \l_tmpa_box{#2}
  \dim_set:Nn \l_tmpa_dim { \dim_max:nn{#1}{\box_wd:N \l_tmpa_box} }
  \underline{ \makebox[\l_tmpa_dim]{\box_use:N \l_tmpa_box} }
}
\RequirePackage{tabularx,totcount}
\regtotcounter{section}
\cs_new_protected:Npn \__cjluexam_score:
{
  \int_set:Nn \l_tmpa_int {\totvalue{section}}
  \int_compare:nNnT {\l_tmpa_int} < {1} {\int_set:Nn \l_tmpa_int {1}}
  \newcolumntype{A}{@{}>{\centering\arraybackslash}X@{}}
  \int_compare:nNnTF {\l_tmpa_int} < {7}
  { \newcolumntype{B}{|A|*{\l_tmpa_int}{A|}A|} }
  {
    \int_compare:nNnTF {\l_tmpa_int} < {10}
    { \newcolumntype{B}{|c|*{\l_tmpa_int}{A|}A|} }
    { \newcolumntype{B}{|c|*{\l_tmpa_int}{A|}c|} }
  }
  \bool_if:NTF \g__cjluexam_english_bool
  { \clist_set:Nn \l_tmpa_clist {Item,Total,Score,Teacher,\int_to_Roman:n} }
  { \clist_set:Nn \l_tmpa_clist {题序, 总分, 得分, 评卷人,\zhnumber      } }
  \begin{tabularx} {\linewidth} {B}
    \hline \clist_item:Nn\l_tmpa_clist{1}
    \int_step_inline:nn{\l_tmpa_int}{& \clist_item:Nn\l_tmpa_clist{5}{##1}}
                                     & \clist_item:Nn\l_tmpa_clist{2} \\\hline
    \clist_item:Nn\l_tmpa_clist{3}\int_step_inline:nn{\l_tmpa_int}{&}&\\\hline
    \clist_item:Nn\l_tmpa_clist{4}\int_step_inline:nn{\l_tmpa_int}{&}&\\\hline
  \end{tabularx}
}
\cs_new:Npn \__cjluexam_seat:
{
  \begin{tikzpicture}
    [remember~picture,overlay,ampersand~replacement=\&]
    \zihao{-4}\normalfont
    \matrix[nodes={draw,inner~ysep=8pt}]
      at ([shift={(25mm,-25mm)}]current~page.north~west)
      { \node{座位号}; \& \node{\phantom{座位号}}; \\ };
  \end{tikzpicture}
}
\ctexset
{
  section =
  {
    name={,、},
    number=\chinese{section},
    format=\sffamily,
    aftername={},
    aftertitle={},
    beforeskip=.5ex plus .5ex minus .5ex,
    afterskip =.5ex plus .5ex minus .5ex,
  }
}
\RequirePackage[inline]{enumitem}
\setlist{nosep,leftmargin=*}
\setlist[enumerate,2]{label=(\arabic*)}
\RequirePackage{tasks}
\settasks{before-skip=0pt,after-skip=0pt,after-item-skip=0pt}
\AtBeginDocument
{
  \bool_if:NTF \g__cjluexam_answer_bool
  {
    \settasks{label=\arabic*.,label-width=1em,label-offset=.2em,item-indent=1.2em}
  }
  {
    \settasks{label=(\Alph*),label-width=1.6em,label-offset=.2em,item-indent=1.8em}
  }
}
\setlength\lineskiplimit{.3em}
\setlength\lineskip     {.3em}
\AtBeginDocument
{
  \setlength\abovedisplayskip{.2em plus .2em minus .2em}
  \setlength\belowdisplayskip{.2em plus .2em minus .2em}
  \setlength\abovedisplayshortskip{0em plus .1em}
  \setlength\belowdisplayshortskip{0em plus .1em}
}
\setlength\intextsep   {.75em plus .2em minus .2em}
\setlength\floatsep    {.75em plus .2em minus .2em}
\setlength\textfloatsep{.75em plus .2em minus .2em}
\setlength{\abovecaptionskip}{ 0em}
\setlength{\belowcaptionskip}{.3em}
\def\fps@figure{!htb}
\def\fps@table {!htb}
\newcolumntype{C}{>{\(\displaystyle{}}c<{{}\)}}
\newcolumntype{L}{>{\(\displaystyle{}}l<{{}\)}}
\newcolumntype{R}{>{\(\displaystyle{}}r<{{}\)}}
\newcolumntype{Y}{>{\(\displaystyle{}}X<{{}\)}}
\AtBeginDocument
{
  \ProvideDocumentCommand \dif  { } {\mathop{}\!\mathrm{d}}
  \ProvideDocumentCommand \vare { } {\mathrm{e}}
  \ProvideDocumentCommand \vari { } {\mathrm{i}}
  \ProvideDocumentCommand \abs  {m} {\left\vert#1\right\vert}
  \ProvideDocumentCommand \set  {m} {\left\{#1\right\}}
}
\endinput
%%
%% End of file `cjluexam.cls'.
