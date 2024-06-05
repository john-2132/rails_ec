# frozen_string_literal: true

namespace :issue_promotion_code do
  desc 'プロモーションコードを発行する'
  task issue_promotion_code: :environment do
    promotion_codes = 10.times.map do
      code = [*'A'..'Z', *'a'..'z', *'0'..'9'].sample(7).join
      # 100円〜1000円であれば * 100 するのですが、$単位で作ってきてしまったので * 100 は消しています。
      discount_price = rand(1..10) # * 100
      PromotionCode.new(code:, discount_price:)
    end
    promotion_codes.each(&:save)
  end
end
