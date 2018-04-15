package test;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class JobDetailBean  extends QuartzJobBean {

	private DummyTask dummyTask;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		
		dummyTask.print();
		
		
	}

	public void setDummyTask(DummyTask dummyTask) {
		this.dummyTask = dummyTask;
	}
	
	
	
	
	

}
