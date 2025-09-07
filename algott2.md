```
#include <bits/stdc++.h>
using namespace std;

bool isSafe(int v, vector<vector<int>> &g, vector<int> &col, int c) {
    for (int i = 0; i < g.size(); i++) {
        if (g[v][i] && col[i] == c) {
            return false;
        }
    }
    return true;
}

int solve(int v, int m, vector<vector<int>> &g, vector<int> &col) {
    if (v == g.size()) {
        return 1;
    }

    int ways = 0;
    for (int c = 1; c <= m; c++) {
        if (isSafe(v, g, col, c)) {
            col[v] = c;
            ways += solve(v + 1, m, g, col);
            col[v] = 0;
        }
    }
    return ways;
}

int main() {
    int n = 4;
    int m = 3;

    vector<vector<int>> g = {
        {0, 1, 1, 1},
        {1, 0, 1, 0},
        {1, 1, 0, 1},
        {1, 0, 1, 0}
    };

    vector<int> col(n, 0);

    int ways = solve(0, m, g, col);

    cout << ways << endl;

    return 0;
}

```



```
#include <bits/stdc++.h>
using namespace std;

bool isSafe(int v, vector<vector<int>> &g, vector<int> &col, int c) {
    for (int i = 0; i < g.size(); i++) {
        if (g[v][i] && col[i] == c) return false;
    }
    return true;
}

int solve(int v, int m, vector<vector<int>> &g, vector<int> &col) {
    if (v == g.size()) {
        for (int c : col) cout << c << " ";
        cout << "\n";
        return 1;
    }

    int ways = 0;
    for (int c = 1; c <= m; c++) {
        if (isSafe(v, g, col, c)) {
            col[v] = c;
            ways += solve(v + 1, m, g, col);
            col[v] = 0;
        }
    }
    return ways;
}

int main() {
    int n = 4;
    int m = 3;

    vector<vector<int>> g = {
        {0, 1, 1, 1},
        {1, 0, 1, 0},
        {1, 1, 0, 1},
        {1, 0, 1, 0}
    };

    vector<int> col(n, 0);

    int ways = solve(0, m, g, col);

    cout << "Total valid colorings: " << ways << endl;

  
```



```
#include <bits/stdc++.h>
using namespace std;

bool safe(vector<string> &board, int row, int col, int n) {
    for (int i = 0; i < row; i++) {
        if (board[i][col] == 'Q') return false;
    }
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
        if (board[i][j] == 'Q') return false;
    }
    for (int i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
        if (board[i][j] == 'Q') return false;
    }
    return true;
}

void solve(int  row, int n, vector<string> &board, vector<vector<string>> &ans) {
    if (row == n) {
        ans.push_back(board);
        return;
    }
    for (int col = 0; col < n; col++) {
        if (safe(board, row, col, n)) {
            board[row][col] = 'Q';
            solve(row + 1, n, board, ans);
            board[row][col] = '.';
        }
    }
}

int main() {
    int n = 4; 
    vector<string> board(n, string(n, '.'));
    vector<vector<string>> ans;

    solve(0, n, board, ans);

    cout << "Total solutions: " << ans.size() << "\n";
    for (auto &sol : ans) {
        for (auto &row : sol) cout << row << "\n";
        cout << "\n";
    }

    return 0;
}

```
