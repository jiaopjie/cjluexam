%%
%% This is file `cjluexam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cjluexam.dtx  (with options: `class')
%% 
%% Copyright (C) 2021-2021 by jiaopjie
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
\ProvidesClass{cjluexam}
  [2021/12/01 v1.0.2 CJLU Exam Template]
\newif\ifanswer
\DeclareOption{answer}{\answertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[heading,zihao=5]{ctex}[2014/03/06]
\RequirePackage[a4paper,margin=30mm,footskip=6mm]{geometry}
\RequirePackage{lastpage}
\ifanswer
  \def\cjluexam@foot
  {《\Course》课程试卷（\Type）参考答案及评分标准\quad
  第 \thepage 页~共 \pageref{LastPage} 页}
\else
  \def\cjluexam@foot
  {\cjluexam@binding 中国计量大学 \AcademicYear 学年第 \Term 学期%
  《\Course》课程考试试卷（\Type）第 \thepage 页~共 \pageref{LastPage} 页}
\fi
\RequirePackage{titleps}
\newpagestyle{main}[\zihao{-5}]
  {\footrule\setfoot{}{\fangsong\cjluexam@foot}{}}
\pagestyle{main}
\if@twoside
  \newcommand\cjluexam@binding{%
    \ifcase\numexpr\value{page}-((\value{page}-2)/4)*4\relax
      \cjluexam@drawbinding[1]\or\cjluexam@drawbinding\relax
    \fi
  }
\else
  \newcommand\cjluexam@binding
  {\ifodd\value{page}\relax\cjluexam@drawbinding\fi}
\fi
\RequirePackage{graphicx,tikz}
\newcommand\cjluexam@drawbinding[1][-1]{%
  \begin{tikzpicture}[remember picture,overlay]
    \zihao{5}\sffamily
    \path (current page.center)
      node
      [
        text width=\textheight,
        rotate=-90,
        yshift=.5*#1*\textwidth+#1*.5cm,
      ]
      {%
        \dotfill\raisebox{-.45em}{\rotatebox{90}{装}}%
        \dotfill\raisebox{-.45em}{\rotatebox{90}{订}}%
        \dotfill\raisebox{-.45em}{\rotatebox{90}{线}}\dotfill
      };
  \end{tikzpicture}%
}
\def\AcademicYear{} % 学年
\def\Term{}         % 学期
\def\Course{}       % 科目
\def\Type{}         % 试卷类型
\def\College{}      % 开课学院
\newif\ifopen       % 是否开卷
\newif\ifseat       % 是否打印座位号
\def\Thing{}        % 可带入场的物品
\def\TestYear{}     % 考试时间-年
\def\TestMonth{}    % 考试时间-月
\def\TestDay{}      % 考试时间-日
\def\TestTime{}     % 考试时间-时
\def\Class{}        % 学生班级
\def\Teacher{}      % 教师
\RequirePackage{totcount}
\regtotcounter{section}
\ifanswer
  \renewcommand{\maketitle}{%
    \begingroup
    \parindent0pt\linespread{1.5}\zihao{-4}%
    \begin{center}
      \zihao{4}\bfseries\fangsong
      中国计量大学 \AcademicYear 学年第 \Term 学期\\
      《\Course》课程试卷（\Type）\\
      参考答案及评分标准
    \end{center}%
    开课二级学院：\Fill{9em}{\College}，
    学生班级：\Fill{5em}{\Class}，
    教师：\Fill{6em}{\Teacher}
    \endgroup
  }
\else
  \renewcommand{\maketitle}{%
    \begingroup
    \parindent0pt\linespread{1.5}\zihao{-4}%
    \begin{center}
      \ifseat\cjluexam@seat\fi
      \zihao{4}\bfseries\fangsong
      中国计量大学 \AcademicYear 学年第 \Term 学期\\
      《\Course》课程考试试卷（\Type）
    \end{center}%
    开课二级学院：\Fill{9em}{\College}，%
    考试时间：\mbox{%
      \Fill{3em}{\TestYear}年\Fill{2em}{\TestMonth}月%
      \Fill{2em}{\TestDay }日\Fill{2em}{\TestTime }时}\\
    考试形式：%
    \setlength{\fboxsep}{-0.4pt}%
    \ifopen
      闭卷 \fbox{\rule[0.683em]{0.683em}{0em}}、%
      开卷 \rule{0.683em}{0.683em}，%
    \else
      闭卷 \rule{0.683em}{0.683em}、%
      开卷 \fbox{\rule[0.683em]{0.683em}{0em}}，%
    \fi
    \mbox{允许带\Fill{17em}{\Thing}入场}\\
    考生姓名：\Fill{5.2em}{}
    学号：\Fill{5.2em}{}
    专业：\Fill{5.2em}{}
    班级：\Fill{5.2em}{}
    \cjluexam@score{\totvalue{section}}%
    \endgroup
  }
\fi
\newlength\cjluexam@length
\newcommand\Fill[2]{%
  \settowidth{\cjluexam@length}{#2}%
  \ifdim\cjluexam@length>#1\relax
    \underline{\mbox{#2}}%
  \else
    \underline{\makebox[#1]{#2}}%
  \fi
}
\RequirePackage{tabularx}
\newcommand\cjluexam@score[1]{%
  \begin{flushleft}
    \edef\cjluexam@num{#1}%
    \ifnum\cjluexam@num<1\relax\def\cjluexam@num{1}\fi
    \ifnum\cjluexam@num<7\relax
      \newcolumntype{M}{|*{\numexpr\cjluexam@num+2}
      {>{\centering\arraybackslash}X|}}%
    \else
      \ifnum\cjluexam@num<11\relax
        \newcolumntype{M}{|c|*{\numexpr\cjluexam@num+1}
        {@{}>{\centering\arraybackslash}X@{}|}}%
      \else
        \newcolumntype{M}{|c|*{\cjluexam@num}
        {@{}>{\centering\arraybackslash}X@{}|}c|}%
      \fi
    \fi
    \begin{tabularx}{\textwidth}{M}
      \hline
      题序   & \cjluexam@Ncell{1}{\cjluexam@num}{2} & 总分 \\\hline
      得分   & \cjluexam@Ncell{1}{\cjluexam@num}{0} &      \\\hline
      评卷人 & \cjluexam@Ncell{1}{\cjluexam@num}{0} &      \\\hline
    \end{tabularx}%
  \end{flushleft}%
}
\newcommand\cjluexam@gobble[1]{}
\newcommand\cjluexam@Ncell[3]{%
  \ifnum  #1<2 \expandafter\cjluexam@gobble\fi &
  \ifcase #3 \or #1\else\zhnumber{#1}\fi
  \ifnum  #1<#2
    \expandafter\cjluexam@Ncell
    \expandafter{\the\numexpr1+#1\expandafter}%
    \expandafter{\the\numexpr  #2\expandafter}%
    \expandafter{\the\numexpr  #3\expandafter}%
  \fi
}
\RequirePackage{tikz}
\newcommand\cjluexam@seat{%
  \begin{tikzpicture}
    [remember picture,overlay,ampersand replacement=\&]
    \zihao{-4}
    \matrix[nodes={draw,inner ysep=8pt}]
      at ([shift={(25mm,-25mm)}]current page.north west)
      {\node{\phantom{座位号}}; \& \node{座位号};\\};
  \end{tikzpicture}%
}
\ctexset{section={
  name={,、},
  number=\chinese{section},
  format=\sffamily,
  aftername={},
  aftertitle={},
  beforeskip=1ex plus .5ex minus .5ex,
  afterskip =1ex plus .5ex minus .5ex,
  runin=true,
}}
\setlength\lineskiplimit{.25em}
\setlength\lineskip     {.25em}
\endinput
%%
%% End of file `cjluexam.cls'.
