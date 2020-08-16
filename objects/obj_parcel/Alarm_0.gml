switch(parcel_size)
	{
	case 2:
		{
		sprite_index = spr_unsold_parcel_2;
		break;
		}
	case 3:
		{
		sprite_index = spr_unsold_parcel_3;
		break;
		}
	case 4:
		{
		sprite_index = spr_unsold_parcel_4;
		break;
		}
	case 5:
		{
		sprite_index = spr_unsold_parcel_5;
		break;
		}
	}
if instance_exists(obj_generator) then
	{
	mp_grid_add_rectangle(global.workers_map, bbox_left, bbox_top, bbox_right, bbox_bottom);
	}
value = parcel_size * 3;

//add parcel to the parcels_for_sale queue
ds_list_add(global.parcels_for_sale, id);
ds_list_shuffle(global.parcels_for_sale);