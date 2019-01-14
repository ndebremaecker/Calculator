using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Calculator.Model
{
    public class Approval
    {
        public bool _delegate { get; set; }
        public bool approve { get; set; }
        public bool reject { get; set; }
        public bool resubmit { get; set; }
    }
}