every 1.minute do
  runner "Advertisement.where(status: :approved).update(status: :published)"
end
