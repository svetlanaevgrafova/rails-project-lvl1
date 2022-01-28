### Hexlet tests and linter status:
[![Actions Status](https://github.com/svetlanaevgrafova/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/svetlanaevgrafova/rails-project-lvl1/actions)
[![Makefile linter CI](https://github.com/svetlanaevgrafova/rails-project-lvl1/actions/workflows/linter.yml/badge.svg?branch=main)](https://github.com/svetlanaevgrafova/rails-project-lvl1/actions/workflows/linter.yml)
[![Makefile test CI](https://github.com/svetlanaevgrafova/rails-project-lvl1/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/svetlanaevgrafova/rails-project-lvl1/actions/workflows/test.yml)

### Usage example

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  # Проверяет есть ли значение внутри name
  f.input :name
  # Проверяет есть ли значение внутри job
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```
