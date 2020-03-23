#include <clang-c/Index.h>
#include <stdio.h>

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