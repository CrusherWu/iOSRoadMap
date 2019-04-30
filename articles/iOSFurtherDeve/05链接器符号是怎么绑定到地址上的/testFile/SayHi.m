
#import "Boy.h"
int main(int argc, char *argv[])
{
    @autoreleasepool {
        Boy *boy = [[Boy alloc] init];
        [boy say];
        return 0;
    }
}
