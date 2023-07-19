import { IsNotEmpty, IsString } from 'class-validator';

export class CapitilizeDto {
  @IsNotEmpty()
  @IsString()
  readonly text: string;
}
