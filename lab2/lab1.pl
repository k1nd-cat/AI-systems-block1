% ����� -- �������� ��������
game(star_wars_battlefront_2).
game(need_for_speed_unbond).
game(subway_surf).
game(grid_2).

% ����� -- ��������� � �����
character(jake).
character(tricky).
character(lucy).
character(prince_k).
character(speedy).
character(yaz).
character(stormtrooper).
character(darth_vader).
character(clone).
character(droid).

% ����� -- ���������
transport(train).
transport(porsche).
transport(bmw).
transport(nissan).
transport(speeder).
transport(x_wing).
transport(tie_fighter).

% ����� -- ��������� � �����
character_in_game(jake, subway_surf).
character_in_game(tricky, subway_surf).
character_in_game(lucy, subway_surf).
character_in_game(prince_k, subway_surf).
character_in_game(speedy, need_for_speed_unbond).
character_in_game(yaz, need_for_speed_unbond).
character_in_game(stormtrooper, star_wars_battlefront_2).
character_in_game(darth_vader, star_wars_battlefront_2).
character_in_game(clone, star_wars_battlefront_2).
character_in_game(droid, star_wars_battlefront_2).

% ����� -- ��������� � �����
transport_in_game(train, subway_surf).
transport_in_game(porsche, need_for_speed_unbond).
transport_in_game(porsche, grid_2).
transport_in_game(bmw, need_for_speed_unbond).
transport_in_game(bmw, grid_2).
transport_in_game(nissan, need_for_speed_unbond).
transport_in_game(nissan, grid_2).
transport_in_game(speeder, star_wars_battlefront_2).
transport_in_game(x_wing, star_wars_battlefront_2).
transport_in_game(tie_fighter, star_wars_battlefront_2).

% ������� -- ������� ���� ��������� � ����
transports_in_game(Game, Transports) :- setof(Transport, transport_in_game(Transport, Game), Transports).

% ������� -- ������� ���� ���������� � ����
characters_in_game(Game, Characters) :- setof(Character, character_in_game(Character, Game), Characters).

% ������� -- ������� ����, � ������� ���� ����������� ��������
games_with_character(Character, Games) :- setof(Game, character_in_game(Character, Game), Games).

% ������� -- ������� ����, � ������� ���� ����������� ���������
games_with_transport(Transport, Games) :- setof(Game, transport_in_game(Transport, Game), Games).

% ������� -- ������� ������ ����������, ������� ��������� � ����� ���� �
% ����������
transports_for_character(Character, Transports) :- character_in_game(Character, Game), setof(Transport, transport_in_game(Transport, Game), Transports).

% ������� -- ������� ������ ���, � ������� ��� ����������
game_without_transport(Game) :- game(Game), \+ transport_in_game(_, Game).
