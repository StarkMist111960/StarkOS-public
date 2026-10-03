#ifndef FS_H
#define FS_H

#define MAX_FILES 64
#define MAX_FILENAME 32
#define MAX_FILE_SIZE 1024

typedef struct {
	char name[MAX_FILENAME];
	char data[MAX_FILE_SIZE];
	int size;
	int used;
} File;

void fs_init(void);
int fs_create(const char *name);
int fs_delete(const char *name);
int fs_write(const char *name, const char *data);
int fs_read(const char *name, char *buffer);

#endif
