# summary provider for class NSNotification
import objc_runtime
import metrics
import CFString
import lldb

statistics = metrics.Metrics()
statistics.add_metric('invalid_isa')
statistics.add_metric('invalid_pointer')
statistics.add_metric('unknown_class')
statistics.add_metric('code_notrun')

class NSConcreteNotification_SummaryProvider:
	def adjust_for_architecture(self):
		pass

	def __init__(self, valobj, params):
		self.valobj = valobj;
		if not (self.sys_params.types_cache.id):
			self.sys_params.types_cache.id = self.valobj.GetType().GetBasicType(lldb.eBasicTypeObjCID)
		self.update();

	def update(self):
		self.adjust_for_architecture();

	# skip the ISA and go to the name pointer
	def offset(self):
		return self.sys_params.pointer_size
\
	def name(self):
		string_ptr = self.valobj.CreateChildAtOffset("name",
							self.offset(),
							self.sys_params.types_cache.id)
		return CFString.CFString_SummaryProvider(string_ptr,None)


class NSNotificationUnknown_SummaryProvider:
	def adjust_for_architecture(self):
		pass

	def __init__(self, valobj, params):
		self.valobj = valobj;
		self.sys_params = params
		self.update()

	def update(self):
		self.adjust_for_architecture();

	def name(self):
		stream = lldb.SBStream()
		self.valobj.GetExpressionPath(stream)
		name_vo = self.valobj.CreateValueFromExpression("name","(NSString*)[" + stream.GetData() + " name]");
		return CFString.CFString_SummaryProvider(name_vo,None)


def GetSummary_Impl(valobj):
	global statistics
	class_data = objc_runtime.ObjCRuntime(valobj)
	if class_data.is_valid() == False:
		statistics.metric_hit('invalid_pointer',valobj)
		wrapper = None
		return
	class_data = class_data.read_class_data()
	if class_data.is_valid() == False:
		statistics.metric_hit('invalid_isa',valobj)
		wrapper = None
		return
	if class_data.is_kvo():
		class_data = class_data.get_superclass()
	if class_data.is_valid() == False:
		statistics.metric_hit('invalid_isa',valobj)
		wrapper = None
		return
	
	name_string = class_data.class_name()
	if name_string == 'NSConcreteNotification':
		wrapper = NSConcreteNotification_SummaryProvider(valobj)
		statistics.metric_hit('code_notrun',valobj)
	else:
		wrapper = NSNotificationUnknown_SummaryProvider(valobj)
		statistics.metric_hit('unknown_class',str(valobj) + " seen as " + name_string)
	return wrapper;

def NSNotification_SummaryProvider (valobj,dict):
	provider = GetSummary_Impl(valobj);
	if provider != None:
	    try:
	        summary = provider.name();
	    except:
	        summary = None
	    if summary == None:
	        summary = 'no valid notification here'
	    return str(summary)
	return ''

def __lldb_init_module(debugger,dict):
	debugger.HandleCommand("type summary add -F NSNotification.NSNotification_SummaryProvider NSNotification")
