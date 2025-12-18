import Image from 'next/image';
import { promises as fs } from 'fs';
import path from 'path';

// Define the type for a student object (optional, for TypeScript users)
interface Student {
  id: number;
  name: string;
  grade: string;
  imageUrl: string;
}

// This is a Server Component, allowing direct file system access
export default async function StudentsPage() {
  
  // 1. Fetch data from the local JSON file
  // Get the absolute path to the JSON file
  const filePath = path.join(process.cwd(), 'lib/students.json');
  // Read the file content
  const jsonData = await fs.readFile(filePath, 'utf8');
  // Parse the JSON string into a JavaScript array of objects
  const students: Student[] = JSON.parse(jsonData);

  // 2. Render the data using the next/image component
  return (
    <div className="container">
      <h1>Student Profiles</h1>
      <div className="profile-grid">
        {students.map((student) => (
          <div key={student.id} className="profile-card">
            <Image
              src={student.imageUrl}
              alt={`Profile picture of ${student.name}`}
              width={200} // Required for local images
              height={200} // Required for local images
              className="student-image"
              priority // Optional: ensures images load immediately
            />
            <div className="student-details">
              <h2>{student.name}</h2>
              <p>Grade: {student.grade}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
