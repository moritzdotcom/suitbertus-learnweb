subjectFilter = document.getElementById('examFilterSubject');
yearFilter = document.getElementById('examFilterYear');
teacherFilter = document.getElementById('examFilterTeacher');
gradeFilter = document.getElementById('examFilterGrade');

exams = document.querySelectorAll('.exam-card');
examCount = document.getElementById('examCount');
noResultsMessage = document.getElementById('noResultsMessage');

if(subjectFilter) {
  subjectFilter.addEventListener('input', function(e) {
    exams.forEach((exam) => {
      if(e.target.value != subjectFilter.dataset.defaultValue) {
        if(exam.dataset.subject != e.target.value) {
          exam.classList.add('exam-hide-subject');
        } else {
          exam.classList.remove('exam-hide-subject');
        }
      } else {
        exam.classList.remove('exam-hide-subject');
      }
    });
    updateCount();
  });
}

if(yearFilter) {
  yearFilter.addEventListener('input', function(e) {
    exams.forEach((exam) => {
      if(e.target.value != yearFilter.dataset.defaultValue) {
        if(exam.dataset.year != e.target.value) {
          exam.classList.add('exam-hide-year');
        } else {
          exam.classList.remove('exam-hide-year');
        }
      } else {
        exam.classList.remove('exam-hide-year');
      }
    });
    updateCount();
  });
}

if(teacherFilter) {
  teacherFilter.addEventListener('input', function(e) {
    exams.forEach((exam) => {
      if(e.target.value != teacherFilter.dataset.defaultValue) {
        if(exam.dataset.teacher != e.target.value) {
          exam.classList.add('exam-hide-teacher');
        } else {
          exam.classList.remove('exam-hide-teacher');
        }
      } else {
        exam.classList.remove('exam-hide-teacher');
      }
    });
    updateCount();
  });
}

if(gradeFilter) {
  gradeFilter.addEventListener('input', function(e) {
    exams.forEach((exam) => {
      if(e.target.value != gradeFilter.dataset.defaultValue) {
        if(exam.dataset.grade != e.target.value) {
          exam.classList.add('exam-hide-grade');
        } else {
          exam.classList.remove('exam-hide-grade');
        }
      } else {
        exam.classList.remove('exam-hide-grade');
      }
    });
    updateCount();
  });
}

function updateCount() {
  resultCount = 0;
  for (let i=0; i < exams.length; i++) {
    classList = exams[i].classList;
    if(!classList.value.includes('hide')){
      resultCount += 1;
    }
  }
  examCount.innerText = resultCount;
  if(resultCount == 0) {
    noResultsMessage.classList.remove('hide-message');
  } else {
    noResultsMessage.classList.add('hide-message')
  }
}
