package net.minecraft.world.item.enchantment;

import net.minecraft.world.entity.EnumItemSlot;

public class EnchantmentMultishot extends Enchantment {

    public EnchantmentMultishot(Enchantment.Rarity enchantment_rarity, EnumItemSlot... aenumitemslot) {
        super(enchantment_rarity, EnchantmentSlotType.CROSSBOW, aenumitemslot);
    }

    @Override
    public int getMinCost(int i) {
        return 20;
    }

    @Override
    public int getMaxCost(int i) {
        return 50;
    }

    @Override
    public boolean checkCompatibility(Enchantment enchantment) {
        return super.checkCompatibility(enchantment) && enchantment != Enchantments.PIERCING;
    }
}
