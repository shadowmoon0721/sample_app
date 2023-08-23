class AddRememberDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_digest, :string
  end
end

# 記憶ダイジェストを指定して、ユーザーを取得することはないので、remember_digestカラムにindexを追加する必要はない。
