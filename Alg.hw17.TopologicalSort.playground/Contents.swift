var graph = [Int: [Int]]()

graph[1] = [13, 3]
graph[2] = [13]
graph[3] = []
graph[4] = [3]
graph[5] = [3, 9, 10]
graph[6] = [4, 11, 12, 13]
graph[7] = [6]
graph[8] = [2, 4, 6, 14]
graph[9] = [1, 7]
graph[10] = [1, 12, 14]
graph[11] = [3]
graph[12] = []
graph[13] = [3]
graph[14] = [11]

printMatrix(demukronTopologicalSort(graph: graph))

func demukronTopologicalSort(graph: [Int: [Int]]) -> [[Int]] {
    let graphCount = graph.count

    var result = [[Int]](), used = Set<Int>()
    
    var matrix = Array(repeating: Array(repeating: 0, count: graphCount), count: graphCount)

    for (k, xx) in graph {
        for x in xx {
            matrix[k - 1][x - 1] = 1
        }
    }

    printMatrix(matrix)

    var xx = figureOut0DegreeVertexes(matrix)
    while xx.count < graphCount {
        var r = [Int]()
        for y in xx {
            guard !used.contains(y) else { continue }
            r.append(y)
            used.insert(y)
            
            for x in 0..<graphCount {
                matrix[y - 1][x] = 0
            }
        }
        result.append(r)
        
//        printMatrix(matrix)
        
        xx = figureOut0DegreeVertexes(matrix)
    }
    
    return result
}

func figureOut0DegreeVertexes(_ matrix: [[Int]]) -> [Int] {
    let matrixCount = matrix.count
    var result = [Int]()
    for x in  0..<matrixCount {
        var levelCount = 0
        for y in 0..<matrixCount {
            levelCount += matrix[y][x]
        }
        if levelCount == 0 {
            result.append(x + 1)
        }
    }
    return result
}

func printMatrix(_ matrix: [[Int]]) {
    for y in 0..<matrix.count {
        print(matrix[y])
    }
    print("\n")
}
