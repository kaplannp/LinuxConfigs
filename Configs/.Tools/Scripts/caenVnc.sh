#ssh -f -L 5951:localhost:5951 kaplannp@login-course.engin.umich.edu "sleep 30"
ssh -f -L 5951:localhost:5951 kaplannp@oncampus-course.engin.umich.edu "sleep 30"

vncviewer localhost:5951
