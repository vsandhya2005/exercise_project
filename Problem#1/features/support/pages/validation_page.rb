class ValidationPage
  include PageObject
  page_url 'https://www.exercise1.com/values'

  label(:value_1, id: "lbl_val_1")
  label(:value_2, id: "lbl_val_2")
  label(:value_3, id: "lbl_val_3")
  label(:value_4, id: "lbl_val_4")
  label(:value_5, id: "lbl_val_5")

  label(:total, id: "lbl_ttl_val")

  text_field(:text_1, id: "txt_val_1")
  text_field(:text_2, id: "txt_val_2")
  text_field(:text_4, id: "txt_val_4")
  text_field(:text_5, id: "txt_val_5")
  text_field(:text_6, id: "txt_val_6")

  text_field(:total_balance, id: "txt_ttl_val")


  def verify_elements_present(table)
    count = 0
    table.each do |element|
      page_element = element.downcase.sub(" ", "_")
      count = count + 1 if page_element.present?
    end
    count
  end

  def get_total_balance
    value1 = self.text_1.sub("$", "").to_i
    value2 = self.text_2.sub("$", "").to_i
    value3 = self.text_4.sub("$", "").to_i
    value4 = self.text_5.sub("$", "").to_i
    value5 = self.text_6.sub("$", "").to_i
    value1 + value2 + value3 + value4 + value5
  end
end


