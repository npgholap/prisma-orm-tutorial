import express, { Request, Response, NextFunction } from 'express';
import { json } from 'body-parser';  //extract data json data from body part of any request
import { PrismaClient } from '@prisma/client';


//import routes
//import todoRoutes from "./routes/todos";

const app = express();
app.use(json());  //register it as middleware in running server
app.listen(3000, () => {
  console.log("http:localhost:3000/")
});

//Connect to running express app
//all incomming request to /todos will redirect to todoRoutes
//app.use("/todos", todoRoutes);
const prisma = new PrismaClient();
// app.get('/', async (_req: Request, res: Response) => {

//   console.log("get request called...")
//   try {
//     const users = await prisma.user.findMany({});
//     //res.send("Hi All");
//     res.json({ users })
//   } catch (error) {
//     res.json({"Error":"Error occure during retrieving users"})
//   }

// })

// app.post('/', async (req, res) => {
//   console.log("create request called...")
//   const { email, name } = req.body;
//   //console.log(email+ " "+ name);
//   try {
//     const user = await prisma.user.create({
//       data: {
//         email,
//         name
//       }
//     });
//     res.json({ user })
  
//   } catch (error) {
//     res.json({"Error":"Error occure during creating user"})
//   }
  
// })

// app.put('/:id', async (req, res) => {
//   console.log("Update request called...")
//   const userId = req.params;
//   console.log(userId);
//   const { email, name } = req.body;
//   console.log(email + " " + name);
//   try {
//     const user = await prisma.user.update({
//       where: { id: +userId.id },
//       data:
//       {
//         email,
//         name
//       }
//     })
//     console.log({ user });
//     res.json({ user })
//   }
//   catch (error) {
//     res.json({ "Error": "User Not Found" });
//   }
// })


// app.delete('/:id', async (req, res) => {
//   console.log("Delete request called...")
//   const userId = req.params; // Get param in the form of json

//   try {
//     const deleteUser = await prisma.user.delete({
//       where: { id: +userId.id },
//     })
//     res.json({ deleteUser })
//   }
//   catch (error) {
//     res.json({ "Error": "User Not Found" });
//   }
// })
// app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
//   res.status(500).json({ message: err.message });
// });


app.post('/', async (req:Request, res:Response) => {
  console.log("create request called...")
  const { firstName,lastName,branchName } = req.body;
  //console.log(email+ " "+ name);
  try {
    const student = await prisma.studentInfo.create({
      data: {
        firstName: firstName,
        lastName: lastName,
        branchName: branchName
      }
    });
    res.json({ student })
  
  } catch (error) {
    res.json({"Error":"Error occure during creating user"})
  }
  
})


app.get('/', async (_req: Request, res: Response) => {

  console.log("get request called...")
  try {
    const students = await prisma.studentInfo.findMany({});
    //res.send("Hi All");
    res.json({ students })
  } catch (error) {
    res.json({"Error":"Error occure during retrieving users"})
  }
})

app.put('/:id', async (req, res) => {
  console.log("Update request called...")
  const userId = req.params;
  console.log(userId);
  const { firstName,lastName,branchName } = req.body;
  try {
    const student = await prisma.studentInfo.update({
      where: { id: parseInt(userId.id)},
      data:
      {
        firstName,
        lastName,
        branchName
      }
    })
    console.log({ student });
    res.json({ student })
  }
  catch (error) {
    res.json({ "Error": "User Not Found" });
  }
})

app.delete('/:id', async (req, res) => {
  console.log("Delete request called...")
  const userId = req.params; // Get param in the form of json

  try {
    const deleteUser = await prisma.studentInfo.delete({
      where: { id: +userId.id },
    })
    res.json({ deleteUser })
  }
  catch (error) {
    res.json({ "Error": "User Not Found" });
  }
})
app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  res.status(500).json({ message: err.message });
});