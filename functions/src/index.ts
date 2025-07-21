import {onUserCreated} from "firebase-functions/v2/auth";
import {initializeApp} from "firebase-admin/app";
import {getFirestore, FieldValue} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";

initializeApp();

export const createFirestoreUser = onUserCreated(async (event) => {
  const user = event.data;
  const uid = user.uid;
  const email = user.email;

  logger.info(`New user registered: UID=${uid}, Email=${email}`);

  const db = getFirestore();
  const batch = db.batch();

  const userRef = db.collection("USER").doc(uid);
  batch.set(userRef, {
    email: email || "",
    role: "Student",
    isActive: true,
    dateCreated: FieldValue.serverTimestamp(),
    // Add other default fields here if needed
  });

  const studentProfileRef = db.collection("STUDENT_PROFILES").doc(uid);
  batch.set(studentProfileRef, {
    currentGradeLevel: 4,
    inGameCurrency: 0,
    avatarCustomization: {},
  });

  try {
    await batch.commit();
    logger.info(`Firestore documents created for UID: ${uid}`);
  } catch (error) {
    logger.error(`Error creating documents for UID: ${uid}`, error);
  }
});