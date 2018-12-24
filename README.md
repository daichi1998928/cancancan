# README

I show how to use rails's gem 「cancancan」.

first step install gem 

```
#in gemfile 
gem 'devise'
gem 'cancancan'
gem 'rails_admin'
```

次にablityモデルを作成しましょう
* boolean 型の
次にablityモデルを作成しましょうadmin_flgカラムを追加しました
デフォルトで　default: false, null: falseを書くことに注意

```
 $ rails g cancan:ability
```
ablity のモデルの中に
主にablity model のなかに権限設定をしていきます。
```
#model/ablity.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.admin_flg? 
      can :access, :rails_admin
      can :manage, :all
    else
        can [:read],Post
        can :test, Post
    end

    
  end
end
```
注意が必要なのは
read ... 参照 「index,show action」 
create ... 登録　「create action」
update ... 更新 「edit update action」
destroy ... 削除 「 destroy action]
manage ... すべて
ということ

viewで顕現指定
```
<% if can? :create, Post %>
    <%= link_to "new post", new_post_path %>
  <% end %>
```

