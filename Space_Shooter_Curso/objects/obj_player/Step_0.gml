/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Detectar entradas por meio das setas do teclado
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

#region movimentação da nave
//Movimentação horizontal
if (left)
{
	hspeed = -mov_speed;
	image_index = 0;
}else if(right)
{
	hspeed = mov_speed;
	image_index = 0;
}else
{
	hspeed = 0;
	image_index = 0;
}

//Movimentação vertical
if(up)
{
	vspeed = -mov_speed;
	image_index = 2;
}else if(down)
{
	vspeed = mov_speed;
	image_index = 1;
}else
{
	vspeed = 0;
	image_index = 0;
}

#endregion

#region Tiros

//Tiro Comum
if (keyboard_check_pressed(ord("Z")))
{
	//Criando o efeito ao disparar o tiro
	instance_create_layer(x+sprite_width/2,y,"instances", obj_flash);
	//Criando o tiro
	instance_create_layer(x+sprite_width/2,y,"instances", obj_shoot);
}

//Tiro Explosivo
if (keyboard_check(ord("Z")))
{
	shoot_explosive_timer++;
	
	if (shoot_explosive_timer >= shoot_explosive_duration)
	{
		//tiro pronto para ser disparado
		shoot_explosive_ready = true;
	}
}else
{
	//Se tecla não pressionada então crie o tiro explosivo e/ou reinicie o contador
	if (shoot_explosive_ready)
	{
		//Criando o efeito ao disparar o tiro
		instance_create_layer(x+sprite_width/2,y,"instances", obj_flash2);
		//Criando o tiro
		instance_create_layer(x+sprite_width/2,y,"instances", obj_shoot2);
		
		shoot_explosive_ready = false;
		shoot_explosive_timer = 0;
	}else
	{
		shoot_explosive_timer = 0;
	}
}


#endregion