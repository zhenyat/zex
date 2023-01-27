begin
  if (Dotcom.present? and not Dotcom.exist?)
    Dotcom.create name: 'binance',  title: 'Binance Holdings Ltd'
    Dotcom.create name: 'cexio',    title: 'CEX.IO'
    Dotcom.create name: 'coinbase', title: 'Coinbase Global, Inc.', status: 1
    Dotcom.create name: 'coinex',   title: 'COINEX TECHNOLOGY LIMITED', status: 1
    Dotcom.create name: 'kraken',   title: 'Payward, Inc.', status: 1

    puts "===== 'Dotcom' #{Dotcom.count} record(s) created"
  else
    puts "===== 'Dotcom' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Attention! Something went wrong..."
  puts "#{e.inspect}"
end