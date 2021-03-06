USE [master]
GO
/****** Object:  Database [dbEduGuide]    Script Date: 7/8/2015 1:47:25 AM ******/
CREATE DATABASE [dbEduGuide]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbEduGuide', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbEduGuide.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbEduGuide_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbEduGuide_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbEduGuide] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbEduGuide].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbEduGuide] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbEduGuide] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbEduGuide] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbEduGuide] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbEduGuide] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbEduGuide] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbEduGuide] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbEduGuide] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbEduGuide] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbEduGuide] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbEduGuide] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbEduGuide] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbEduGuide] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbEduGuide] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbEduGuide] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbEduGuide] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbEduGuide] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbEduGuide] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbEduGuide] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbEduGuide] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbEduGuide] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbEduGuide] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbEduGuide] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbEduGuide] SET RECOVERY FULL 
GO
ALTER DATABASE [dbEduGuide] SET  MULTI_USER 
GO
ALTER DATABASE [dbEduGuide] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbEduGuide] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbEduGuide] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbEduGuide] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbEduGuide', N'ON'
GO
USE [dbEduGuide]
GO
/****** Object:  Table [dbo].[tblAgent]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAgent](
	[AgentId] [bigint] IDENTITY(1,1) NOT NULL,
	[AgentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblAgent] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAgentInstitute]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentInstitute](
	[AgInId] [bigint] IDENTITY(1,1) NOT NULL,
	[AgentId] [bigint] NOT NULL,
	[InstituteId] [bigint] NOT NULL,
	[DateRegistered] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAgentInstitute] PRIMARY KEY CLUSTERED 
(
	[AgInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCourse](
	[CourseId] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[UniversityId] [bigint] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[InstituteId] [bigint] NOT NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCourseRequirement]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseRequirement](
	[CRId] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseId] [bigint] NOT NULL,
	[RequirementId] [bigint] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCourseRequirement] PRIMARY KEY CLUSTERED 
(
	[CRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblInstitute]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInstitute](
	[InstituteId] [bigint] IDENTITY(1,1) NOT NULL,
	[InstituteName] [varchar](50) NOT NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK_tblInstitute] PRIMARY KEY CLUSTERED 
(
	[InstituteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRequirement]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRequirement](
	[RequirementId] [bigint] IDENTITY(1,1) NOT NULL,
	[Requirement] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblRequirement] PRIMARY KEY CLUSTERED 
(
	[RequirementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUniversity]    Script Date: 7/8/2015 1:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUniversity](
	[UniversityId] [bigint] NOT NULL,
	[UniversityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUniversity] PRIMARY KEY CLUSTERED 
(
	[UniversityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblAgentInstitute]  WITH CHECK ADD  CONSTRAINT [FK_tblAgentInstitute_tblAgent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[tblAgent] ([AgentId])
GO
ALTER TABLE [dbo].[tblAgentInstitute] CHECK CONSTRAINT [FK_tblAgentInstitute_tblAgent]
GO
ALTER TABLE [dbo].[tblAgentInstitute]  WITH CHECK ADD  CONSTRAINT [FK_tblAgentInstitute_tblInstitute] FOREIGN KEY([InstituteId])
REFERENCES [dbo].[tblInstitute] ([InstituteId])
GO
ALTER TABLE [dbo].[tblAgentInstitute] CHECK CONSTRAINT [FK_tblAgentInstitute_tblInstitute]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblCategory]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblInstitute] FOREIGN KEY([InstituteId])
REFERENCES [dbo].[tblInstitute] ([InstituteId])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblInstitute]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblUniversity] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[tblUniversity] ([UniversityId])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblUniversity]
GO
ALTER TABLE [dbo].[tblCourseRequirement]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseRequirement_tblCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([CourseId])
GO
ALTER TABLE [dbo].[tblCourseRequirement] CHECK CONSTRAINT [FK_tblCourseRequirement_tblCourse]
GO
ALTER TABLE [dbo].[tblCourseRequirement]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseRequirement_tblRequirement] FOREIGN KEY([RequirementId])
REFERENCES [dbo].[tblRequirement] ([RequirementId])
GO
ALTER TABLE [dbo].[tblCourseRequirement] CHECK CONSTRAINT [FK_tblCourseRequirement_tblRequirement]
GO
USE [master]
GO
ALTER DATABASE [dbEduGuide] SET  READ_WRITE 
GO
