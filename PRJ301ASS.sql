USE [UserManagement]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/8/2023 10:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NULL,
	[productID] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/8/2023 10:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
	[adress] [nvarchar](255) NULL,
	[phone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/8/2023 10:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/8/2023 10:13:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'032aa190-8c08-4230-b2f5-98bee7adaeef', N'c58e2e38-4128-4aff-83e2-96baf6388240', N'T03', 25, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'03ebc374-d83b-4c66-a559-0eb2cf5ce9db', N'2aa72a06-1829-47bc-a364-707f280d93c1', N'T03', 25, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'072407b3-066d-4904-8b57-c42f1acc06fc', N'55f8a4dd-9290-4cd2-92da-4a9bf9dc93a3', N'T08', 25, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'17dfe8e3-86bb-402e-ae5c-8018c45ce833', N'119fa459-500b-45f1-b7c7-7d6614a3fde8', N'T02', 5, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'281b01c2-481e-4039-bd79-5bbccc4bdbf9', N'2e2fd1a3-e502-43a9-a8de-9d8f3223f878', N'T02', 5, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'479412a3-3ae7-4796-93ec-0bd1aa96685a', N'2aa72a06-1829-47bc-a364-707f280d93c1', N'T04', 25, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'4fd772a4-96bb-4a3f-a1a6-9242d30ddf30', N'c8fd46d3-c22e-45dd-bb91-a93ed49f3776', N'T02', 5, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'5b73bee6-56d8-49aa-a48d-119068accb33', N'97d6a2b4-eed2-49dc-a6e4-fdc2894efdf1', N'T02', 5, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'77cba863-b504-4dd3-97dd-d1bc07ee8595', N'55f8a4dd-9290-4cd2-92da-4a9bf9dc93a3', N'T03', 25, 10)
GO
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'119fa459-500b-45f1-b7c7-7d6614a3fde8', N'hoadnt', CAST(N'2023-07-08' AS Date), 5, N'nonnooo', N'1231231231')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'2aa72a06-1829-47bc-a364-707f280d93c1', N'hoadnt', CAST(N'2023-07-08' AS Date), 125, N'12312', N'1321312312')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'2e2fd1a3-e502-43a9-a8de-9d8f3223f878', N'hoadnt', CAST(N'2023-07-08' AS Date), 15, N'nhhhh', N'1231231231')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'55f8a4dd-9290-4cd2-92da-4a9bf9dc93a3', N'hoadnt', CAST(N'2023-07-08' AS Date), 275, N'no no no', N'1231231231')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'97d6a2b4-eed2-49dc-a6e4-fdc2894efdf1', N'hoadnt', CAST(N'2023-07-08' AS Date), 5, N'1231231', N'1231231231')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'c58e2e38-4128-4aff-83e2-96baf6388240', N'hoadnt', CAST(N'2023-07-08' AS Date), 25, N'12312', N'1231231231')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [adress], [phone]) VALUES (N'c8fd46d3-c22e-45dd-bb91-a93ed49f3776', N'hoadnt', CAST(N'2023-07-08' AS Date), 20, N'Quan 9', N'0909123112')
GO
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T01', N'Ice Cream', 5, 20, N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg/1200px-Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T02', N'Hot Tea', 5, 6, N'https://cdn-prod.medicalnewstoday.com/content/images/articles/324/324771/close-up-of-a-cup-of-tea.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T03', N'Peach Tea', 25, 0, N'https://www.southernliving.com/thmb/-i_6eYBKR2F8nMtHPyLNtMjNA8w=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4x3_2-2000-b4f45201af6a4988ba7c58e00eaf3059.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T04', N'Lychee Tea', 25, 19, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStLPBd5QoMpjO-ek2Rsvmq18fy2kSg2vpCgQ&usqp=CAU')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T05', N'Mangosteen Tea', 30, 18, N'https://img-global.cpcdn.com/recipes/cebf6d8222c86549/680x482cq70/tra-mang-c%E1%BB%A5t-recipe-main-photo.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T06', N'Milk Tea', 20, 15, N'https://www.clubhouse.ca/-/media/project/oneweb/mccormick-us/thai-kitchen/recipes/vanilla_black_bubble_tea_with_coconut_milk_800x800.jpg?rev=-1&vd=00010101T000000Z&hash=0D1D3D25AB7FEE846F9F42FA41E7E3F5')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T07', N'Green Milk Tea', 22, 27, N'https://img.freepik.com/premium-photo/green-tea-latte-with-bubble_1339-109337.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T08', N'Chocolate Milk Tea', 25, 22, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9-BJ5GKRrJiweB94mi3nhKZZMbuK8tsVe2w&usqp=CAU')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T09', N'Thai Green Tea Milk Tea', 25, 30, N'https://www.tastythais.com/wp-content/uploads/2019/10/thai-matcha-green-tea-latte-with-brown-sugar-boba-500x423.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T10', N'White Coffee', 15, 30, N'https://cdn.tgdd.vn/2021/03/content/13-800x549.jpg')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [image]) VALUES (N'T11', N'Coffe', 15, 17, N'https://www.verywellhealth.com/thmb/enqdlurt-cfzp1sidBVkJDnfOLQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Coffee-OleksiyMaksymenko-58c5600c5f9b58af5cc7c009.jpg')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'thinhnt', N'Truong Thinh', N'123', N'US', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'thinhse', N'Truong Thinh', N'123', N'US', NULL)
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
