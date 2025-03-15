public class Solution {
                   public int RomanToInt(string s)
        {
            Dictionary<char, int> Roman = new Dictionary<char, int>
            {
                { 'I', 1 },
                { 'V', 5 },
                { 'X', 10 },
                { 'L', 50 },
                { 'C', 100 },
                { 'D', 500 },
                { 'M', 1000 }
            };

            int intRoman = 0;
            int i = 0;
            while (i < s.Length) 
            {
                if (i+1 < s.Length && Roman[s[i]] < Roman[s[i+1]])
                {
                    intRoman += Roman[s[i + 1]] - Roman[s[i]];
                    i += 2; 
                }
                else
                {
                    intRoman += Roman[s[i]];
                    i++;
                }
            }
            return intRoman;
        }


}