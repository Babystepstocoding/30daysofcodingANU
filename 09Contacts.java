import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {

    public static class Trie {
        Trie[] children;
        int count;
        public Trie() {
            count = 0;
            children = new Trie[26];
        }
    }
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        Trie trie = new Trie();
        Trie currTrie;
        for(int a0 = 0; a0 < n; a0++){
            String op = in.next();
            String contact = in.next();
            if (op.equals("add")) {
                currTrie = trie;
                for (Character c: contact.toCharArray()) {
                    currTrie.count++;
                    if (currTrie.children[c-'a'] == null)
                        currTrie.children[c-'a'] = new Trie();
                    currTrie = currTrie.children[c-'a'];
                }
                currTrie.count++;
            } else {
                boolean valid = true;
                currTrie = trie;
                for (Character c: contact.toCharArray()){
                    if (currTrie.children[c-'a'] == null) {
                        System.out.println(0);
                        valid = false;
                        break;
                    } else {
                        currTrie = currTrie.children[c-'a'];
                    }
                }
                if (valid) {
                    System.out.println(currTrie.count);
                }
            }
        }
    }
}

