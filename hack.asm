ZONE_UNDER_GROUND  = 0
ZONE_SKY_HIGH      = 1
ZONE_AQUA_LAKE     = 2
ZONE_GREEN_HILLS   = 3
ZONE_GIMMICK_MT    = 4
ZONE_SCRAMBLED_EGG = 5
ZONE_CRYSTAL_EGG   = 6

ADDR_CURRENT_ZONE  = $d295

.computesmschecksum

.memorymap
slotsize $4000
slot 0 $0000
slot 1 $4000
slot 2 $8000
defaultslot 0
.endme

.rombankmap
bankstotal 32
banksize $4000
banks 32
.endro

.background "sonic2.gg"

.bank 0 slot 0
.orga $08c2
        call    go_to_next_zone

.orga $22e6
        call    make_green_hills_first_zone

.bank 1 slot 1
.orga $7f00
go_to_next_zone:
.check_if_we_come_from_green_hills
        cp      ZONE_GREEN_HILLS+1
        jr      z, .come_from_green_hills
.check_if_we_come_from_under_ground
        cp      ZONE_UNDER_GROUND+1
        jr      z, .come_from_under_ground
.check_if_we_come_from_aqua_lake
        cp      ZONE_AQUA_LAKE+1
        jr      z, .come_from_aqua_lake
        jr      .the_end
.come_from_green_hills
        ld      a, ZONE_SKY_HIGH
        jr      .the_end
.come_from_under_ground
        ld      a, ZONE_GIMMICK_MT
        jr      .the_end
.come_from_aqua_lake
        ld      a, ZONE_UNDER_GROUND
.the_end
        ld      [ADDR_CURRENT_ZONE], a
        ret

make_green_hills_first_zone:
        ld      a, ZONE_GREEN_HILLS
        ld      [ADDR_CURRENT_ZONE], a
        xor     a
        ret
