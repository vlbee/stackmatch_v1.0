BEGIN; 

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  handle VARCHAR(26) NOT NULL UNIQUE,
  first_name VARCHAR(100),
  surname VARCHAR(100),
  email citext UNIQUE,
  cohort VARCHAR(26),
  location VARCHAR(64),
  work_looking_status VARCHAR(1),
  about_me VARCHAR(3000),
);

INSERT INTO users (
  handle,
  first_name,
  surname,
  email,
  cohort,
  location,
  work_looking_status,
  about_me,
) 
VALUES
  ('@coder1', 'John', 'Tester', 'john@test.com', 'L13', 'London', 'y', null ),
  ('@coder2', 'Jane', 'Testing', 'jane@test.com', 'N02', 'Tel Aviv', 'y', null ),
  ('@coder3', 'Jim', 'Dummy', 'jim@test.com', 'L11', 'Berlin', 'n', null ),
  ('@coder4', 'Joan', 'Dummie', 'joan@test.com', 'L08', 'London', 'n', null ),
  ('@coder5', 'Janine', 'Dummoire', 'janine@test.com', 'L08', 'Paris', 'y', 'Full-Stack developer @ TechieFrenchCompanoire. Looking to help out on any FAC freelance opportunities involving Vue.js or MEAN stack. Also love helping with CSS :)' ),
;

 

DROP TABLE IF EXISTS skills CASCADE;
CREATE TABLE skills (
  id SERIAL PRIMARY KEY NOT NULL,
  skill VARCHAR(64),
);

INSERT INTO skills (skill) 
VALUES (
  '.NET',
  '(Visual) Basic',
  '(Visual) FoxPro',
  '4th Dimension/4D',
  'ABAP,',
  'ABC,',
  'ActionScript,',
  'Ada,',
  'Agilent VEE,',
  'Algol,',
  'Alice,',
  'Android,',
  'Angelscript',
  'Angular',
  'AngularJS',
  'Apex',
  'APL',
  'AppleScript',
  'Arc',
  'Arduino',
  'ASP',
  'AspectJ',
  'Assembly',
  'ATLAS',
  'Augeas',
  'AutoHotkey',
  'AutoIt',
  'AutoLISP',
  'Automator',
  'Avenue',
  'Awk',
  'Bash',
  'bc',
  'BCPL',
  'BETA',
  'BlitzMax',
  'Boo',
  'Bourne Shell',
  'Bro',
  'C',
  'C Shell',
  'C-Omega',
  'C#',
  'C++',
  'C++/CLI',
  'Caml',
  'Ceylon',
  'CFML',
  'cg',
  'Ch',
  'CHILL',
  'CIL',
  'CL (OS/400)',
  'Clarion',
  'Clean',
  'Clipper',
  'Clojure',
  'CLU',
  'COBOL',
  'Cobra',
  'CoffeeScript',
  'ColdFusion',
  'COMAL',
  'Common Lisp',
  'Coq',
  'CSS',
  'cT',
  'Curl',
  'D',
  'Dart',
  'DCL',
  'DCPU-16 ASM',
  'Delphi/Object Pascal',
  'DiBOL',
  'Dylan',
  'E',
  'eC',
  'Ecl',
  'ECMAScript',
  'EGL',
  'Eiffel',
  'Elixir',
  'Emacs Lisp',
  'Erlang',
  'Etoys',
  'Euphoria',
  'EXEC',
  'Express',
  'F#',
  'Factor',
  'Falcon',
  'Fancy',
  'Fantom',
  'Felix',
  'Forth',
  'Fortran',
  'Fortress',
  'Gambas',
  'Git',
  'GNU Octave',
  'Go',
  'Google AppsScript',
  'Gosu',
  'Groovy',
  'Handlebars',
  'Haskell',
  'haXe',
  'Heron',
  'HPL',
  'HTML',
  'HyperTalk',
  'Icon',
  'IDL',
  'Inform',
  'Informix-4GL',
  'INTERCAL',
  'Io',
  'Ioke',
  'iOS',
  'J',
  'J#',
  'JADE',
  'Java',
  'Java',
  'Java FX Script',
  'JavaScript',
  'JavaScript',
  'JQuery',
  'JScript',
  'JScript.NET',
  'JSON',
  'Julia',
  'Kotlin',
  'LabVIEW',
  'Ladder Logic',
  'Lasso',
  'Limbo',
  'Lingo',
  'Linux',
  'Lisp',
  'Logo',
  'Logtalk',
  'LotusScript',
  'LPC',
  'Lua',
  'Lustre',
  'M4',
  'MAD',
  'Magic',
  'Magik',
  'Malbolge',
  'MANTIS',
  'Maple',
  'Mathematica',
  'MATLAB',
  'Max/MSP',
  'MAXScript',
  'MEL',
  'Mercury',
  'Mirah',
  'Miva',
  'ML',
  'Modula-2',
  'Modula-3',
  'MongoDB',
  'Monkey',
  'MOO',
  'Moto',
  'MS-DOS Batch',
  'MUMPS',
  'MySQL',
  'NATURAL',
  'Nemerle',
  'Nimrod',
  'Node.js',
  'NQC',
  'NSIS',
  'Nu',
  'NXT-G',
  'Oberon',
  'Object Rexx',
  'Objective-C',
  'Objective-C',
  'Objective-J',
  'OCaml',
  'Occam',
  'ooc',
  'Opa',
  'OpenCL',
  'OpenEdge ABL',
  'OPL',
  'Oz',
  'Paradox',
  'Parrot',
  'Pascal',
  'Perl',
  'PHP',
  'Pike',
  'PILOT',
  'PL/I',
  'PL/SQL',
  'Pliant',
  'PostgreSQL',
  'PostScript',
  'POV-Ray',
  'PowerBasic',
  'PowerScript',
  'PowerShell',
  'Processing',
  'Prolog',
  'Puppet',
  'Pure Data',
  'Python',
  'NoSQL',
  'Q',
  'R',
  'R',
  'Racket',
  'React',
  'REALBasic',
  'REBOL',
  'Regex',
  'Revolution',
  'REXX',
  'RPG (OS/400)',
  'Ruby',
  'Ruby on Rails',
  'Rust',
  'S',
  'S-PLUS',
  'SAS',
  'Sather',
  'Scala',
  'Scheme',
  'Scilab',
  'Scratch',
  'sed',
  'Seed7',
  'Self',
  'Shell',
  'SIGNAL',
  'Simula',
  'Simulink',
  'Slate',
  'Smalltalk',
  'Smarty',
  'SPARK',
  'SPSS',
  'SQL',
  'SQR',
  'Squeak',
  'Squirrel',
  'Standard ML',
  'Suneido',
  'SuperCollider',
  'Swift',
  'TACL',
  'Tcl',
  'Tex',
  'thinBasic',
  'TOM',
  'Transact-SQL',
  'Turing',
  'TypeScript',
  'Vala/Genie',
  'VBScript',
  'Verilog',
  'VHDL',
  'VimL',
  'Visual Basic .NET',
  'Vue',
  'WebDNA',
  'Webpack',
  'Whitespace',
  'X10',
  'xBase',
  'XBase++',
  'Xen',
  'XPL',
  'XQuery',
  'XSLT',
  'yacc',
  'Yorick',
  'Z shell'
);

DROP TABLE IF EXISTS user_skills CASCADE;
CREATE TABLE user_skills (
  user_id INT REFERENCES users(id) ON UPDATE CASCADE,
  skill_id INT REFERENCES skills(id) ON UPDATE CASCADE,
  start_date DATE()
);

INSERT INTO user_skills (user_id, skill_id, start_date) 
VALUES 
(1, 5, 2018-10-01),
(1, 8, 2015-11-01),
(1, 127, 2012-12-01),
(2, 127, 2016-08-01),
(2, 140, 2017-06-01),
(2, 200, 2016-05-01),
(3, 127, 2016-07-01),
(3, 210, 2014-05-01),
(3, 230, 2014-06-01);

COMMIT;

