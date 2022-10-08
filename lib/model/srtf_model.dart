/*
The below model class contains all the variables present in the 
!SRTF(First Come First Serve) class.
*/

class SRTFModel {
  int id = 0; //Process ID
  int cpu = 0; //CPU Burst Time after I/O
  int ioTime = 0; //I/O Time
  int atValue = 0; //Arrival Time
  int oldAtValue = 0;
  int cpuBurstValue = 0; //CPU Burst Time
  int oldcpuBurstValue = 0;
  /*
  ?There are two variables specifically for processes with I/O time.
	isFinish denotes whether a process has run and went to I/O time and ioSwitch 
  denotes whether the I/O switch is turned ON or OFF.
  */
  bool isFinish = false;
  static bool ioSwitch = false;

  //List of SRTF Model Class
  static List<SRTFModel> tableListValue = [SRTFModel(0, 0, 0, 0, 0, 0, 0, false)];

  //Constructor for SRTF Model Class
  SRTFModel(this.id, this.atValue, this.oldAtValue, this.cpuBurstValue,
      this.oldcpuBurstValue, this.ioTime, this.cpu, this.isFinish);
}
