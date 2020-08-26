--[[
Copyright (C) 2013-2018 Draios Inc dba Sysdig.

This file is part of sysdig.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

--]]

view_info = 
{
	id = "mesos_tasks",
	name = "Mesos Tasks",
	description = "List all Mesos tasks running on this machine, and the resources that each of them uses.",
	tips = {"Select a task and click enter to drill down into it. At that point, you will be able to access several views that will show you the details of the selected task."},
	view_type = "table",
	applies_to = {"", "evt.res", "mesos.framework.id"},
	filter = "mesos.task.id != ''",
	use_defaults = true,
	drilldown_target = "containers",
	columns = 
	{
		{
			name = "NA",
			field = "thread.tid",
			is_key = true
		},
		{
			name = "CPU",
			field = "thread.cpu",
			description = "Amount of CPU used by the task.",
			colsize = 8,
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			is_sorting = true
		},
		{
			name = "VIRT",
			field = "thread.vmsize.b",
			description = "Total virtual memory for the task.",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "RES",
			field = "thread.vmrss.b",
			description = "Resident non-swapped memory for the task.",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "FILE",
			field = "evt.buflen.file",
			description = "Total (input+output) file I/O bandwidth generated by the task, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NET",
			field = "evt.buflen.net",
			description = "Total (input+output) network bandwidth generated by the task, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NA",
			field = "mesos.task.id",
			is_groupby_key = true
		},
		{
			name = "ID",
			field = "mesos.task.id",
			description = "Task name.",
			colsize = 38
		},
		{
			name = "NAME",
			field = "mesos.task.name",
			description = "Task name.",
			colsize = 25
		},
		{
			name = "LABELS",
			field = "mesos.task.labels",
			description = "Task labels.",
			colsize = 0
		},
	}
}
