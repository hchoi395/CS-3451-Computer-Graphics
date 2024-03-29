// Matrix Stack Library

// You should modify the routines below to complete the assignment.
// Feel free to define any classes, global variables, and helper routines that you need.

ArrayList<Matrix> mat_stack; // https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html

class Matrix {
  float[][] values;  // first subscript is row, second subscript is column
  
  // initialize the matrix as the identity
  Matrix() {
    values = new float[4][4];
    for (int i = 0; i < 4; i++)
      for (int j = 0; j < 4; j++)
        if (i == j)
          values[i][j] = 1.0;
        else
          values[i][j] = 0.0;
  }
}

Matrix mat_copy(Matrix m) {
  Matrix mat_new = new Matrix();
  
  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++)
      mat_new.values[i][j] = m.values[i][j];

  return mat_new;
}

Matrix mat_multiply(Matrix a, Matrix b) {
  Matrix mat_new = new Matrix();
  
  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++) {
      mat_new.values[i][j] = a.values[i][0] * b.values[0][j] + a.values[i][1] * b.values[1][j] +
                             a.values[i][2] * b.values[2][j] + a.values[i][3] * b.values[3][j];
    }

  return mat_new;
}

void print_ctm() {
  Matrix m = mat_stack.get(mat_stack.size() - 1);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      print(m.values[i][j] + " ");
    }
    println();
  }
  println();
}

void print_stack() {
  println("==== Top of Stack ====");
  for (int k = mat_stack.size() - 1; k >= 0; k--) {
    Matrix m = mat_stack.get(k);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        print(m.values[i][j] + " ");
      }
      println();
    }
    if (k > 0) {
      println();    
    }
  }
  println("======================");
  println();
  
}

void gtInitialize() {
  // Initialize mat_stack and add one matrix After this command is called, the only matrix on the stack should be the 4x4 identity matrix.
  // We will treat the last (= at size() - 1) matrix at the current transformation matrix. 
  // (TODO)
  mat_stack = new ArrayList();
  Matrix matrix = new Matrix();
  mat_stack.add(matrix);
}

void gtPushMatrix() {
  // Get the last element from the matrix stack, clone it, and add it to the last position of the stack.
  // (TODO)
  Matrix copy = mat_copy(mat_stack.get(mat_stack.size() - 1));
  mat_stack.add(copy);
}

void gtPopMatrix() {
  // Remove the last element from the matrix stack. Generate the error message "cannot pop the matrix stack" if there is only one matrix in the stack.
  // (TODO)
  try {
    if (mat_stack.size() == 1) {
        throw new Exception("cannot pop the matrix stack");
    } else {
        mat_stack.remove(mat_stack.get(mat_stack.size() - 1));
    }
  } catch (Exception e) {
      System.out.println(e.getMessage());
  }
}

void updateTopMatrix(Matrix m) {
  // Update the top matrix in the stack.
  // Let ctm = the last element in the matrix stack. Then this function should do: new_ctm = old_ctm * matrix_m
  // Hint: useful functions: mat_stack.get, mat_stack.set, mat_multiply
  // (TODO)
  Matrix ctm = mat_stack.get(mat_stack.size() - 1);
  mat_stack.set(mat_stack.size() - 1, mat_multiply(ctm, m));
}

void gtTranslate(float x, float y, float z) {
  // Create a translate matrix and update the ctm.
  // (TODO)
  Matrix ctm = new Matrix();
  ctm.values[0][3] += x;
  ctm.values[1][3] += y;
  ctm.values[2][3] += z;
  updateTopMatrix(ctm);
}

void gtScale(float x, float y, float z) {
  // Create a scale matrix and update the ctm.
  // (TODO)
  Matrix ctm = new Matrix();
  ctm.values[0][0] *= x;
  ctm.values[1][1] *= y;
  ctm.values[2][2] *= z;
  updateTopMatrix(ctm);
}

void gtRotateX(float theta) {
  // Create a rotateX matrix and update the ctm. Note that theta is given in degree.
  // (TODO)
  float toRadian = theta * (float)(Math.PI / 180);
  Matrix ctm = new Matrix();
  ctm.values[1][1] = (float)Math.cos(toRadian);
  ctm.values[1][2] = (float)-Math.sin(toRadian);
  ctm.values[2][1] = (float)Math.sin(toRadian);
  ctm.values[2][2] = (float)Math.cos(toRadian);
  updateTopMatrix(ctm);
}

void gtRotateY(float theta) {
  // Create a rotateY matrix and update the ctm. Note that theta is given in degree.
  // (TODO)
  float toRadian = theta * (float)(Math.PI / 180); 
  Matrix ctm = new Matrix();
  ctm.values[0][0] = (float)Math.cos(toRadian);
  ctm.values[0][2] = (float)Math.sin(toRadian);
  ctm.values[2][0] = (float)-Math.sin(toRadian);
  ctm.values[2][2] = (float)Math.cos(toRadian);
  updateTopMatrix(ctm);
}

void gtRotateZ(float theta) {
  // Create a rotateZ matrix and update the ctm. Note that theta is given in degree.
  // (TODO)
  float toRadian = theta * (float)(Math.PI / 180);
  Matrix ctm = new Matrix();
  ctm.values[0][0] = (float)Math.cos(toRadian);
  ctm.values[0][1] = (float)-Math.sin(toRadian);
  ctm.values[1][0] = (float)Math.sin(toRadian);
  ctm.values[1][1] = (float)Math.cos(toRadian);  
  updateTopMatrix(ctm);
}
