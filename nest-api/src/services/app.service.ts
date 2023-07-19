import { Injectable } from '@nestjs/common';
import { CapitilizeDto } from 'src/dtos/capitilize.dto';

@Injectable()
export class AppService {
  getCapilizedText(createTaskDto: CapitilizeDto): string {
    const { text }: CapitilizeDto = createTaskDto;
    return text.toUpperCase();
  }
}
