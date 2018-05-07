using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;


namespace WindowsService.Batura
{
    public partial class BaturaDoStuffService : ServiceBase

    { 
        System.Timers.Timer timeDelay;
        int count;


 
        public BaturaDoStuffService()
        {
            InitializeComponent();
            timeDelay = new System.Timers.Timer();
            timeDelay.Interval = 600000;
            timeDelay.Elapsed += new System.Timers.ElapsedEventHandler(WorkProcess);

        }

        public void WorkProcess( object sender, System.Timers.ElapsedEventArgs e)
        {

            string process = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss") + " Number " + count;
            LogService(process);
            count++;
        }


        protected override void OnStart(string[] args)
        {
            LogService("Service has started");
            timeDelay.Enabled = true;
        }

        protected override void OnStop()
        {
            LogService("Service has stopped");
            timeDelay.Enabled = false;
        }
        private void LogService(string content)
        {
            FileStream fs = new FileStream ("c:\\Log\\BaturaDoStuff\\Log.txt", FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.BaseStream.Seek(0, SeekOrigin.End);
            sw.WriteLine(content);
            sw.Flush();
            sw.Close();


        }
    }
}
