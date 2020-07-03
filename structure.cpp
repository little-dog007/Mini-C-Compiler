#include <stdlib.h>
#include "global.h"
#include"structure.h"

DynString::DynString() {
	dynstring_init(8);
}
DynString::~DynString() {
	dynstring_free();
}
void DynString::dynstring_init(int initSize) {
	data = (char*)malloc(sizeof(char) * initSize);
	count = 0;
	capacity = initSize;
}

void DynString::dynstring_free() {
	if (data)
		free(data);
	count = 0;
	capacity = 0;

}

void DynString::dynstring_reset() {
	//dynstring_free();
	dynstring_init(8);
}

void DynString::dynstring_realloc(int new_size) {
	int new_capacity;
	char* new_data;
	new_capacity = capacity;
	while (new_capacity < new_size) {
		new_capacity = new_capacity * 2;
	}
	new_data = (char*)realloc(data, sizeof(char) * new_capacity);
	if (!new_data) {
        cout("sorry","realloc err!");
        return;

	}
	capacity = new_capacity;
	data = new_data;
}

void DynString::dynstring_chcat(int ch) {
	int new_count;
	new_count = count + 1;
	if (new_count > capacity)
		dynstring_realloc(new_count);
	((char*)data)[new_count - 1] = ch;
	count = new_count;
}

DynArray::DynArray() {
	dynarray_init(4);
}
DynArray::~DynArray() {
	dynarray_free();
}

void DynArray::dynarray_init(int initsize) {
	data = (void**)malloc(sizeof(char) * initsize);
	count = 0;
	capacity = initsize;
}

void DynArray::dynarray_add(void* new_data) {
	int new_count;
	new_count = count + 1;
	if (new_count * sizeof(void*) > capacity)
		dynarray_realloc(new_count * sizeof(void*));
	data[new_count - 1] = new_data;
	count = new_count;

}

void DynArray::dynarray_realloc(int new_size) {
	int new_capacity;
	void** new_data;

	new_capacity = capacity;
	while (new_capacity < new_size) {
		new_capacity = new_capacity * 2;
	}
	new_data = (void**)realloc(data, new_capacity);
    if (!new_data){
        cout("sorry","realloc err");
        return;
    }

	capacity = new_capacity;
	data = new_data;
}

void DynArray::dynarray_free() {
	void** p;
	for (p = data; count; ++p, --count) {
		if (*p) {
			free(p);
		}
	}
	free(data);
	data = NULL;
}


int DynArray::dynarray_search(int key) {
	int i;
	int** p;
	p = (int**)data;
	for (i = 0; i < count; ++i, p++) {
		if (key == **p)
			return i;
		return -1;
	}
}



