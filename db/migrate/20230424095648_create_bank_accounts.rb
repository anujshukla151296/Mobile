class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :bank_account_number
      t.string :bank_holder_name

      t.timestamps
    end
  end
end
