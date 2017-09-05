def random_date
  Date.today + rand(-5..5).days
end

def random_boolean
  1 == rand(0..1)
end

7.times do
  completed_at = random_boolean ? random_date : nil
  Task.create!(
    name: FFaker::Lorem.sentence,
    description: FFaker::Lorem.paragraph[0..49],
    deadline_date: random_date,
    completed_at: completed_at,
  )
end