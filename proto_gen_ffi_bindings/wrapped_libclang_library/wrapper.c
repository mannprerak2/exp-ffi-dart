#include <clang-c/Index.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define aloc(T) ((T *)malloc(sizeof(T)))

char *stringcpy(const char *original)
{

    int size = strlen(original);
    char *copy = (char *)malloc((size + 1) * sizeof(char));

    int i;
    for (i = 0; original[i] != '\0'; i++)
    {
        copy[i] = original[i];
    }
    copy[i] = 0;
    return copy;
}

int main(int argc, char *argv[])
{
    printf("==========================run==========================\n");
    CXIndex Index = clang_createIndex(0, 0);
    CXTranslationUnit TU = clang_parseTranslationUnit(Index,
                                                      NULL, argv, argc, NULL, 0, CXTranslationUnit_None);

    if (TU == NULL)
    {
        printf("Error creating TU\n");
        return 0;
    }

    CXCursor root = clang_getTranslationUnitCursor(TU);

    int a = clang_getCursorKind(root);
    printf("%d\n", a);

    clang_disposeTranslationUnit(TU);
    clang_disposeIndex(Index);
    printf("\n==========================end==========================\n");
    return 0;
}

const char *clang_getCString_wrap(CXString *string)
{
    const char *a = clang_getCString(*string);

    return a;
}

void clang_disposeString_wrap(CXString *string)
{
    return clang_disposeString(*string);
}

enum CXCursorKind clang_getCursorKind_wrap(CXCursor *cursor)
{
    return clang_getCursorKind(*cursor);
}

CXString *clang_getCursorSpelling_wrap(CXCursor *cursor)
{
    CXString *s = aloc(CXString);
    *s = clang_getCursorSpelling(*cursor);
    return s;
}

CXCursor *clang_getTranslationUnitCursor_wrap(CXTranslationUnit tu)
{
    CXCursor *c = aloc(CXCursor);
    *c = clang_getTranslationUnitCursor(tu);
    return c;
}

CXString *clang_formatDiagnostic_wrap(CXDiagnostic diag, int opts)
{
    CXString *s = aloc(CXString);
    *s = clang_formatDiagnostic(diag, opts);
    return s;
}