# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tyler = User.find_or_create_by(
  name: 'Tyler'
)

novel = Course.find_or_create_by(
  name: 'American Short Novel',
  user: tyler
)

leadership = Course.find_or_create_by(
  name: 'Fostering Leadership in Teenage Boys',
  user: tyler
)

lit = Course.find_or_create_by(
  name: 'History of Literatures in English I',
  user: tyler
)

leadership_assignments = [
  {
    description: 'Real Boys pp. 3-77',
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: 'HYM Chapter 1',
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: 'Primal Teen pp. 3-74',
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: 'HYM Ch 7',
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: 'HYM Ch 8',
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: 'Primal Teen pp. 75-144',
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: 'HYM Ch 10',
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: 'HYM Ch 11',
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: 'Real Boys pp 81-180',
    og_date: '2018-10-01',
    adj_date: '2018-10-01'
  },
  {
    description: 'Primal Teen pp 145-220',
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: 'Masculine Self pp 79-97',
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: 'HYM Ch 2',
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: 'HYM Ch 3',
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: 'Masculinity 1 - page summary',
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: 'HYM Ch 4',
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: 'HYM Ch 5',
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: 'HYM Ch 6',
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: 'Real Boys pp 181-229',
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: 'HYM Ch 15',
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: 'HYM Ch 30',
    og_date: '2018-11-05',
    adj_date: '2018-11-05'
  },
  {
    description: 'HYM Ch 31',
    og_date: '2018-11-05',
    adj_date: '2018-11-05'
  },
  {
    description: 'Outside book presentation/discussion',
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: 'Real Boys pp 230-288',
    og_date: '2018-11-19',
    adj_date: '2018-11-19'
  },
  {
    description: 'HYM Ch TBA',
    og_date: '2018-11-19',
    adj_date: '2018-11-19'
  },
  {
    description: 'Real Boys pp 301-391',
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: 'HYM Ch TBA',
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-09-09',
    adj_date: '2018-09-09'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-09-16',
    adj_date: '2018-09-16'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-09-23',
    adj_date: '2018-09-23'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-10-07',
    adj_date: '2018-10-07'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-10-14',
    adj_date: '2018-10-14'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-11-04',
    adj_date: '2018-11-04'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-11-11',
    adj_date: '2018-11-11'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-11-18',
    adj_date: '2018-11-18'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-11-25',
    adj_date: '2018-11-25'
  },
  {
    description: 'Journal entry/contact log',
    og_date: '2018-12-02',
    adj_date: '2018-12-02'
  }
]

novel_assignments = [
  {
    description: 'Benito Cereno p 35-71',
    og_date: '2018-08-31',
    adj_date: '2018-08-31'
  },
  {
    description: 'Benito Cereno p 72-107',
    og_date: '2018-09-03',
    adj_date: '2018-09-03'
  },
  {
    description: 'Aspern Papers p 45-78',
    og_date: '2018-09-07',
    adj_date: '2018-09-07'
  },
  {
    description: 'Aspern Papers p 79-125',
    og_date: '2018-09-07',
    adj_date: '2018-09-07'
  },
  {
    description: 'Aspern Papers p 126-142',
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: 'Turn of the Screw p 145-174',
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: 'Turn of the Screw p 175-224',
    og_date: '2018-09-12',
    adj_date: '2018-09-12'
  },
  {
    description: 'Turn of the Screw finish',
    og_date: '2018-09-14',
    adj_date: '2018-09-14'
  },
  {
    description: 'One page body paragraph',
    og_date: '2018-09-14',
    adj_date: '2018-09-14'
  },
  {
    description: 'Maggie, A Girl of the Streets',
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: 'The Awakening, first half',
    og_date: '2018-09-19',
    adj_date: '2018-09-19'
  },
  {
    description: 'The Awakening, second half',
    og_date: '2018-09-21',
    adj_date: '2018-09-21'
  },
  {
    description: 'Quicksand first third',
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: 'Quicksand middle third',
    og_date: '2018-09-26',
    adj_date: '2018-09-26'
  },
  {
    description: 'Quicksand last third',
    og_date: '2018-09-28',
    adj_date: '2018-09-28'
  },
  {
    description: 'Noon Wine',
    og_date: '2018-10-01',
    adj_date: '2018-10-01'
  },
  {
    description: 'Pale Horse, Pale Rider first half',
    og_date: '2018-10-03',
    adj_date: '2018-10-03'
  },
  {
    description: 'Pale Horse, Pale Rider second half',
    og_date: '2018-10-05',
    adj_date: '2018-10-05'
  },
  {
    description: 'Paper 1 (3 pages)',
    og_date: '2018-10-12',
    adj_date: '2018-10-12'
  },
  {
    description: 'The Bear p 191-224',
    og_date: '2018-10-12',
    adj_date: '2018-10-12'
  },
  {
    description: 'The Bear p 225-310',
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: 'The (finish)',
    og_date: '2018-10-17',
    adj_date: '2018-10-17'
  },
  {
    description: 'Fahrenheit 451 p 1-65',
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: 'Fahrenheit 451 p 66-106',
    og_date: '2018-10-24',
    adj_date: '2018-10-24'
  },
  {
    description: 'Fahrenheit 451 to finish',
    og_date: '2018-10-26',
    adj_date: '2018-10-26'
  },
  {
    description: 'Goodbye Columbus p 1-47',
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: 'Goodbye Columbus p 48-98',
    og_date: '2018-10-31',
    adj_date: '2018-10-31'
  },
  {
    description: 'Goodbye Columbus to finish',
    og_date: '2018-11-02',
    adj_date: '2018-11-02'
  },
  {
    description: 'Second paper (4 pages)',
    og_date: '2018-11-05',
    adj_date: '2018-11-05'
  },
  {
    description: 'Yellow Back Radio Broke Down p 1-68',
    og_date: '2018-11-05',
    adj_date: '2018-11-05'
  },
  {
    description: 'Yellow Back Radio Broke Down p 69-104',
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: 'Yellow Back Radio Broke Down to finish',
    og_date: '2018-11-09',
    adj_date: '2018-11-09'
  },
  {
    description: 'A River Runs Through It p 1-35',
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: 'A River Runs Through It p 36-69',
    og_date: '2018-11-14',
    adj_date: '2018-11-14'
  },
  {
    description: 'A River Runs Through It to finish',
    og_date: '2018-11-16',
    adj_date: '2018-11-16'
  },
  {
    description: 'Watch A River Runs Through It movie',
    og_date: '2018-11-19',
    adj_date: '2018-11-19'
  },
  {
    description: 'Age Of Grief p 121-151',
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: 'Age Of Grief p 152-182',
    og_date: '2018-11-28',
    adj_date: '2018-11-28'
  },
  {
    description: 'Age Of Grief to finish',
    og_date: '2018-11-30',
    adj_date: '2018-11-30'
  },
  {
    description: 'Buddha In The Attic p 1-42',
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: 'Third paper (4 pages)',
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: 'Buddha In The Attic p 43-79',
    og_date: '2018-12-05',
    adj_date: '2018-12-05'
  },
  {
    description: 'Buddha In The Attic to finish',
    og_date: '2018-12-07',
    adj_date: '2018-12-07'
  },
]

lit_assignments = [
  {
    description: 'Venerable Bede A30-33',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Dream of the Rood A33-37',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Scholar and His Cat A134',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Charlottesville: Why Jefferson Matters (Collab)',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'SPLC Guide for Students',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Illusion of Progress Ch 1 (Collab)',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Illusion of Progress Ch 2 (Collab)',
    og_date: '2018-08-29',
    adj_date: '2018-08-29'
  },
  {
    description: 'Beowulf A37-109',
    og_date: '2018-09-03',
    adj_date: '2018-09-03'
  },
  {
    description: 'Section Prep 1',
    og_date: '2018-09-05',
    adj_date: '2018-09-05'
  },
  {
    description: "Memorize Chaucer's General Prologue lines 1-18",
    og_date: '2018-09-03',
    adj_date: '2018-09-03'
  },
  {
    description: "Second Nun's Tale",
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: "Piers Plowman A388-408",
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: "Incarnation and Crucifixion A426-9",
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: "A Book of Showings A430-43",
    og_date: '2018-09-10',
    adj_date: '2018-09-10'
  },
  {
    description: "Section Prep 2",
    og_date: '2018-09-12',
    adj_date: '2018-09-12'
  },
  {
    description: "Canterbury Tales A256-62 to line 18",
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: "Miller's Tale A282-98",
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: "Wife of Bath's Tale A300, 319-28",
    og_date: '2018-09-17',
    adj_date: '2018-09-17'
  },
  {
    description: "Section Prep 3",
    og_date: '2018-09-19',
    adj_date: '2018-09-19'
  },
  {
    description: "Chevrefoil A185-87",
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: "Gawain and the Green Knight A201-56",
    og_date: '2018-09-24',
    adj_date: '2018-09-24'
  },
  {
    description: "Section Prep 4",
    og_date: '2018-09-26',
    adj_date: '2018-09-26'
  },
  {
    description: "Second Shepherd's Play A465-94",
    og_date: '2018-10-01',
    adj_date: '2018-10-01'
  },
  {
    description: "Shakespeare B718-21",
    og_date: '2018-10-10',
    adj_date: '2018-10-10'
  },
  {
    description: "Othello B803-89",
    og_date: '2018-10-10',
    adj_date: '2018-10-10'
  },
  {
    description: "Section Prep 5",
    og_date: '2018-10-10',
    adj_date: '2018-10-10'
  },
  {
    description: "Morte D'Arthur A534-54",
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: "Obedience B149-50",
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: "Francis Bacon, Of Masques B1212-13, B1222-23",
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: "Faerie Queen B247-49",
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: "Book III, Title/Summary, Cantos 11-12 B418, B432-56",
    og_date: '2018-10-15',
    adj_date: '2018-10-15'
  },
  {
    description: "Section Prep 6",
    og_date: '2018-10-17',
    adj_date: '2018-10-17'
  },
  {
    description: "English Bible B145-8",
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: "Read Section Preps 7 & 8, choose lyric poem",
    og_date: '2018-10-22',
    adj_date: '2018-10-22'
  },
  {
    description: "Section Prep 7",
    og_date: '2018-10-24',
    adj_date: '2018-10-24'
  },
  {
    description: "Section Prep 8",
    og_date: '2018-10-24',
    adj_date: '2018-10-24'
  },
  {
    description: "John Milton B1447-51",
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: "Paradise Lost Book 1 B1493-1514",
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: "Paradise Lost Book 4 B1553-75",
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: "Paradise Lost Book 9 B1643-68",
    og_date: '2018-10-29',
    adj_date: '2018-10-29'
  },
  {
    description: "Section Prep 9",
    og_date: '2018-10-31',
    adj_date: '2018-10-31'
  },
  {
    description: "\"Aristotle Comes Through\" Buzzfeed article",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Anatomical Exercises B1236-8",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Anatomy of Melancholy B1239 (only 1st page req'd)",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Blazing World B1434-5, B1441-7",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Pilgrim's Progress C95-99",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Alexander Pope C486-90, C554-60",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Jonathan Swift & A Modest Proposal C454-60",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Section Prep 10",
    og_date: '2018-11-07',
    adj_date: '2018-11-07'
  },
  {
    description: "Book of Common Prayer B161-64",
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: "Dryden: Marriage a la Mode C34-35, C38",
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: "Behn: Oronooko C133-35, C139-86",
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: "Fantomina C608-28",
    og_date: '2018-11-12',
    adj_date: '2018-11-12'
  },
  {
    description: "Section Prep 11",
    og_date: '2018-11-14',
    adj_date: '2018-11-14'
  },
  {
    description: "Of Slavery C961-5",
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: "Astell, A Preface C965-9",
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: "The Interesting Narrative C980-90",
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: "Occam Personal Narrative (Collab)",
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: "Marrant Narrative (Collab, 48-59 68-70)",
    og_date: '2018-11-26',
    adj_date: '2018-11-26'
  },
  {
    description: "Section Prep 11",
    og_date: '2018-11-28',
    adj_date: '2018-11-28'
  },
  {
    description: "Notes on the State of Virginia (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Wheatley to Occam & to Dartmouth (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Sancho, Selected Letters (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Rough vs. Final Draft, Declaration of Independence (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Virginia Statute for Religious Freedom (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Jefferson's gravestone materials (Collab)",
    og_date: '2018-12-03',
    adj_date: '2018-12-03'
  },
  {
    description: "Section Prep 12",
    og_date: '2018-12-05',
    adj_date: '2018-12-05'
  },
]

Assignment.create(leadership_assignments) do |asg|
  asg.course = leadership
end

Assignment.create(novel_assignments) do |asg|
  asg.course = novel
end

Assignment.create(lit_assignments) do |asg|
  asg.course = lit
end
