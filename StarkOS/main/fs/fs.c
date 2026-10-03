#include fs.h

static File files[MAX_FILES];

void fs_init(void)
{

	for (int i = 0; i < MAX_FILES; i++) {
		files[i].used = 0;
		files[i].size = 0;
	}
}
