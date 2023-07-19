import { CapitilizeDto } from 'src/dtos/capitilize.dto';
import { AppService } from '../services/app.service';
export declare class AppController {
    private readonly appService;
    constructor(appService: AppService);
    getCapilizedText(createTaskDto: CapitilizeDto): string;
}
