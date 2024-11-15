	package com.jobConnect.entity;
	
	import jakarta.persistence.Column;
	import jakarta.persistence.Entity;
	import jakarta.persistence.GeneratedValue;
	import jakarta.persistence.GenerationType;
	import jakarta.persistence.Id;
	import jakarta.persistence.Table;
	
	@Entity
	@Table(name = "jobroles")
	public class JobRole {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private long id;
		
		@Column(name = "job_role_name", nullable = false)
		private String jobrole;
		
		@Column(name = "job_role_description", nullable = false)
		private String description;
	
		public long getId() {
			return id;
		}
		
		public void setId(long id) {
			this.id = id;
		}
		
		public String getJobrole() {
			return jobrole;
		}
		
		public void setJobrole(String jobrole) {
			this.jobrole = jobrole;
		}
		
		public String getDescription() {
			return description;
		}
		
		public void setDescription(String description) {
			this.description = description;
		}
		
		public JobRole() {
			super();
			// TODO Auto-generated constructor stub
		}
	
		public JobRole(long id, String jobrole, String description) {
			super();
			this.id = id;
			this.jobrole = jobrole;
			this.description = description;
		}
		

		public JobRole(String jobrole, String description) {
			super();
			this.jobrole = jobrole;
			this.description = description;
		}
	
		@Override
		public String toString() {
			return "JobRole [id=" + id + ", jobrole=" + jobrole + ", description=" + description + "]";
		}
	
	}
