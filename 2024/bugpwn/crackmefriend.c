#include <stdio.h>
#include <string.h>

void reverseString(char str[])
{
    int length = strlen(str);
    int start = 0;
    int end = length - 1;

    while (start < end)
    {
        // swap characters at start and end
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;

        // move towards the center
        start++;
        end--;
    }
}

int main()
{
    char input[100];

    // take input from user
    printf("enter passcode, friend: ");
    scanf("%[^\n]s", input);

    // reverse the string
    reverseString(input);

    // check if reversed string equals to 'i am root'
    if (strcmp(input, "i am root") == 0)
    {
        printf("shucks, no more rm -rf :sadPepe:\n");
    }
    else
    {
        printf("pfft, time to rm -rf the world\n");
    }

    return 0;
}