const paths = [
  ["A", "B"],
  ["A", "D"],
  ["A", "H"],
  ["B", "C"],
  ["B", "D"],
  ["C", "F"],
  ["C", "D"],
  ["D", "E"],
  ["E", "F"],
  ["E", "H"],
  ["F", "G"],
  ["G", "H"],
];
const node = ["A", "B", "C", "D", "E", "F", "G", "H"];
const start = "A";
const end = "H";
const route = [];

function findNext(visited) {
  const last = visited[visited.length - 1];
  if (last == end) {
    route.push(visited);
  } else {
    const available = paths.filter(
      (e) => e.includes(last) && !visited.includes(getNext(e, last))
    );
    if (available.length > 0) {
      available.forEach((e) => findNext([...visited, getNext(e, last)]));
    }
  }
}

function getNext(path, start) {
  return path.filter((e) => e != start)[0];
}

findNext([start]);

console.log(`From ${start} to ${end}`);
console.log(`All path:\n${route.map((e) => e.join(" - ")).join("\n")}`);
route.sort((a, b) => a.length - b.length);
console.log(`Shortest path:\n${route[0].join(" - ")}`);
