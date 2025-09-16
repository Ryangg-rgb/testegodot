# Protótipo Godot 4.4.1 (Stardew-like simples)

Este projeto contém:
- Plataforma inicial (chão com colisão)
- Player 2D com movimento (A/D ou setas), pulo (Espaço/W/Seta ↑)
- Interação (E)
- Árvore derrubável que dá `wood` no inventário
- Inventário básico (HUD com 5 slots; 1º mostra `wood`)

## Como rodar
1. Abra no Godot 4.4.1
2. Dê Play na cena principal `scenes/Main.tscn` (ou F5)

## Controles
- Mover: A/D ou ←/→
- Pular: Espaço / W / ↑
- Interagir (cortar árvore): E

## Estrutura
- `project.godot`: configuração do projeto
- `scenes/Main.tscn`: cena principal (chão, player, árvore, HUD)
- `scenes/Player.tscn`: player (CharacterBody2D) + área de interação
- `scenes/Tree.tscn`: árvore com HP e drop de madeira
- `scripts/player.gd`: movimentação e interação
- `scripts/tree.gd`: lógica de HP/queda/drop
- `scripts/inventory.gd`: inventário global (autoload)
- `scripts/globals.gd`: cria mapeamentos de input (A/D/Space/E) se faltarem
- `scripts/inventory_ui.gd`: atualiza HUD

## Próximos passos (opcionais)
- Sprites/tiles próprios (atual agora é só placeholder)
- Ferramenta de machado e animações
- Múltiplas árvores e respawn
- Salvar/Carregar inventário
- Export para Web e GitHub Pages
