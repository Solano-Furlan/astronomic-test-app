import { Body, Controller, Post } from '@nestjs/common';
import { CapitilizeDto } from 'src/dtos/capitilize.dto';
import { AppService } from '../services/app.service';

@Controller('capilize-text')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post()
  getCapilizedText(@Body() createTaskDto: CapitilizeDto): string {
    return this.appService.getCapilizedText(createTaskDto);
  }
}
