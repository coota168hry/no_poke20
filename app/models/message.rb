class Message < ApplicationRecord
  # 02:ヘルプメッセージを取得
  def self.help()
    results = Message.where("class_code =  '02'") 
    return results
  end
end
