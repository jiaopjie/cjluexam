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
  [2021/06/11 v1.0.0 CJLU Exam Template]
\newif\ifanswer
\DeclareOption{answer}{\answertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[heading,zihao=5]{ctex}[2014/03/06]
\RequirePackage[a4paper,margin=30mm,footskip=6mm]{geometry}
\RequirePackage{titleps,lastpage}
\ifanswer
  \newpagestyle{main}[\zihao{-5}]{%
    \footrule
    \setfoot{}{\fangsong
      《\Course》课程试卷（\Type）参考答案及评分标准\quad
      第 \thepage 页~共 \pageref{LastPage} 页}{}}
\else
  \newpagestyle{main}[\zihao{-5}]{%
    \footrule
    \setfoot{}{\cjluexam@setbinding\fangsong
      中国计量大学 \AcademicYear 学年 \Semester 学期
      《\Course》课程考试试卷（\Type）
      第 \thepage 页~共 \pageref{LastPage} 页}{}}
\fi
\pagestyle{main}
\if@twoside
  \newcommand\cjluexam@setbinding{%
    \ifcase\numexpr\value{page}-((\value{page}-2)/4)*4\relax
      \cjluexam@binding[1]\or\cjluexam@binding\relax
    \fi
  }
\else
  \newcommand\cjluexam@setbinding
  {\ifodd\value{page}\relax\cjluexam@binding\fi}
\fi
\RequirePackage{graphicx,tikz}
\newcommand\cjluexam@binding[1][-1]{%
  \begin{tikzpicture}[remember picture,overlay]
    \zihao{5}
    \node
      [
        text width=\textheight,
        rotate=-90,
        yshift=.5*#1*\textwidth+#1*.5cm
      ]
      at (current page.center)
      {
        \sffamily\dotfill
        \raisebox{-.45em}{ \rotatebox{90}{装} }\dotfill
        \raisebox{-.45em}{ \rotatebox{90}{订} }\dotfill
        \raisebox{-.45em}{ \rotatebox{90}{线} }\dotfill
      };
  \end{tikzpicture}%
}
\def\AcademicYear{} % 学年
\def\Semester{}     % 学期
\def\Course{}       % 科目
\def\Type{}         % 试卷类型
\def\School{}       % 开课学院
\newif\ifopen       % 是否开卷
\newif\ifseat       % 是否打印座位号
\def\Thing{}        % 可带入场的物品
\def\ExamYear{}     % 考试时间-年
\def\ExamMonth{}    % 考试时间-月
\def\ExamDay{}      % 考试时间-日
\def\ExamTime{}     % 考试时间-时
\def\Class{}        % 学生班级
\def\Teacher{}      % 教师
\RequirePackage{totcount}
\regtotcounter{section}
\ifanswer
  \renewcommand{\maketitle}{
    \bgroup
    \parindent0pt\linespread{1.5}\zihao{-4}%
    \begin{center}
      \zihao{4}\bfseries\fangsong
      中国计量大学 \AcademicYear 学年第 \Semester 学期\\
      《\Course》课程试卷（\Type）\\
      参考答案及评分标准
    \end{center}%
    开课二级学院：\Fill{9em}{\School}，
    学生班级：\Fill{5em}{\Class}，
    教师：\Fill{6em}{\Teacher}
    \egroup
  }
\else
  \renewcommand{\maketitle}{%
    \bgroup
    \parindent0pt\linespread{1.5}\zihao{-4}\setlength{\fboxsep}{-0.4pt}%
    \begin{center}
      \ifseat\cjluexam@seat\fi
      \zihao{4}\bfseries\fangsong
      中国计量大学 \AcademicYear 学年第 \Semester 学期\\
      《\Course》课程考试试卷（\Type）
    \end{center}%
    开课二级学院：\Fill{9em}{\School}，%
    考试时间：\mbox{%
      \Fill{3em}{\ExamYear}年\Fill{2em}{\ExamMonth}月%
      \Fill{2em}{\ExamDay }日\Fill{2em}{\ExamTime }时}\\
    考试形式：%
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
    \par\smallskip
    \edef\cjluexam@num{\totvalue{section}}%
    \ifnum\cjluexam@num<1\def\cjluexam@num{1}\fi
    \cjluexam@score{\cjluexam@num}%
    \egroup
  }
\fi
\newlength\cjluexam@length
\newcommand\Fill[2]{%
  \settowidth{\cjluexam@length}{#2}%
  \ifdim\cjluexam@length>#1
    \underline{\mbox{#2}}%
  \else
    \underline{\makebox[#1]{#2}}%
  \fi
}
\RequirePackage{tabularx}
\newcommand\cjluexam@score[1]{%
  \ifnum #1<7
    \begin{tabularx}{\textwidth}{|*{\numexpr#1+2}{>{\hfil}X|}}
      \hline
      题序   & \ccjluexam@Ncell{1}{#1}{2} & 总分 \\\hline
      得分   & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
      评卷人 & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
    \end{tabularx}%
  \else
    \ifnum #1<11
      \begin{tabularx}{\textwidth}{|c|*{\numexpr#1+1}{@{}>{\hfil}X@{}|}}
        \hline
        题序   & \ccjluexam@Ncell{1}{#1}{2} & 总分 \\\hline
        得分   & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
        评卷人 & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
      \end{tabularx}%
    \else
      \begin{tabular}{|c|*{#1}{@{}>{\hfil}p{2.55em}@{}|}c|}
        \hline
        题序   & \ccjluexam@Ncell{1}{#1}{2} & 总分 \\\hline
        得分   & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
        评卷人 & \ccjluexam@Ncell{1}{#1}{0} &      \\\hline
      \end{tabular}%
    \fi
  \fi
}
\def\cjluexam@gobble#1{}
\newcommand\ccjluexam@Ncell[3]{%
  \ifnum  #1<2 \expandafter\cjluexam@gobble\fi &
  \ifcase #3 \or #1\else\zhnumber{#1}\fi
  \ifnum  #1<#2
    \expandafter\ccjluexam@Ncell
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
  beforeskip=2ex plus .5ex minus .5ex,
  afterskip=1ex plus .5ex minus .5ex,
  runin=true,
}}
\setlength\lineskiplimit{.333em}
\setlength\lineskip{.333em}
\endinput
%%
%% End of file `cjluexam.cls'.
