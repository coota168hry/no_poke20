class PokeIndex < ApplicationRecord
  belongs_to :pokemon
  belongs_to :soft

  def self.search(search)
    #検索
    #↓姿違いを一度に検索できるが、サンド・サンドパンを一度に出してしまうため仕様変更
    #query = "select * from poke_indices where poke_name like '#{search[:keyword]}%' and soft_name = '#{search[:selected_soft_name]}'"
    #↓完全一致のため、↓poke_nameに（⚫︎⚫︎の姿）を含めて登録すると当たらない。注意書きが必要。
    #もしくは、ポケモン/バージョンのキーを守って、（通常）〜〜（⚫︎⚫︎の姿）〜〜のように図鑑説明に二つ記載するルールにする（現状これを採用）
    query = "
    SELECT 
    softs.soft_name as soft_name,
    pokemons.poke_name as poke_name,
    poke_indices.index_text as index_text
    FROM poke_indices
    INNER JOIN pokemons
    ON poke_indices.pokemon_id = pokemons.id
    INNER JOIN softs
    ON poke_indices.soft_id = softs.id
    WHERE pokemons.poke_name = '#{search[:keyword]}'
    and   softs.soft_name = '#{search[:selected_soft_name]}'
    ;"
    
    results = PokeIndex.find_by_sql(query)
    #results = PokeIndex.includes(:pokemon,:soft).where(pokemons: {poke_name: "#{search[:keyword]}"}).where(softs: {soft_name: "#{search[:selected_soft_name]}"})
  end

  def self.random(generation_names)
    #配列のサイズが１以上であれば

    #l = generation_names.length
    if generation_names
      #配列の中身から一つランダムで取得
      l = generation_names.length
      generation_name = generation_names[rand(0..(l - 1))]
      #クエリ呼び出し(バージョン指定)
      results = selected_random(generation_name)
    #その他（配列のサイズが０）であれば
    else
      #クエリ呼び出し（完全ランダム）
      results = random_()
    end
    return results
  end

end

  private
  #クエリ呼び出し(バージョン指定ランダム)
  def selected_random(search_key)
    query = "
    SELECT 
    softs.soft_name as soft_name,
    pokemons.poke_name as poke_name,
    poke_indices.index_text as index_text
    FROM poke_indices
    INNER JOIN (
      SELECT  
      pokemons.id as id,
      pokemons.poke_name as poke_name,
      generations.generation_name as generation_name
      FROM pokemons
      INNER JOIN generations
      ON pokemons.generation_id = generations.id
      ) as pokemons
    ON poke_indices.pokemon_id = pokemons.id
    INNER JOIN softs
    ON poke_indices.soft_id = softs.id
    WHERE pokemons.generation_name = '#{search_key}'
    ORDER BY RAND()
    LIMIT 1
    ;"
    return PokeIndex.find_by_sql(query)
  end

  #クエリ呼び出し(完全ランダム)
  def random_
    query = "
    SELECT 
    softs.soft_name as soft_name,
    pokemons.poke_name as poke_name,
    poke_indices.index_text as index_text
    FROM poke_indices
    INNER JOIN (
      SELECT  
      pokemons.id as id,
      pokemons.poke_name as poke_name,
      generations.generation_name as generation_name
      FROM pokemons
      INNER JOIN generations
      ON pokemons.generation_id = generations.id
      ) as pokemons
    ON poke_indices.pokemon_id = pokemons.id
    INNER JOIN softs
    ON poke_indices.soft_id = softs.id
    ORDER BY RAND()
    LIMIT 1
    ;"
    return PokeIndex.find_by_sql(query)
  end
