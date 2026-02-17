Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD66A36D4F8
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336538; cv=fail; b=nnQaRKrkZVX62SgBwW0pF2pBXnQfjQoLaLuKnH/wTCAEDeNig83OJxy2K4ig11E2aHVFx0LNI3FCN99hAiHJ9fr+6Mh9BB6w4ye4fenQGrtFI8/bQY1Sr9zvk3eTa+EHQ5RCy0HiRERX4aur6OmXMSkRUWjpxjhW81Pjmob8ESw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336538; c=relaxed/simple;
	bh=FS5r32Xs1mRefmYHptSAfyo1QfpH0Nt7payH8IulkOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nR7ShY4WVVvjjGp+MANtuwnIlZ/sDfEKgOvv+9h4RTWE4x3WR7bGhDo9Ysc7sjx6aSoJhC32nikVu5w5YKIejj3kpneypqo7mcgm1yY+srnyP2v+iU1pnJ6CdufudfPGekBJwcui0IBUT4GPmv4sHjhJlKQJGFG89EFVjAdpLJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=MNQs+M7F; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="MNQs+M7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWBzPUdVVUlzvkj8+8e0TOFcZYisgDwEN/A1wdrcdytV5Gg2K3Tca6Ybql3ZI/V3W3J261iFWyICcYzgQjfpd6oDjanmzw4Q1Sp8JdCgdWtJ1DinQqZpW+Bo92L0hg1AH+HXaPddsNQPWbVre57Tg6xGxih7ZC5I74wntTROOkAEZknq01bqj8Eunm2PKkclS0/yLnoWXoE1V13gIPEHa2p9SAV/XTASowZNz7HtK6lIGpqZOscpByG5qVQuNYDXMyTBXKbBw1VBr0teCdM+A0F5KNrWmIg2CyL+UAKtoUUUR2J2CE39m8QrtEBlQ3IxKUFV78uQH4NyrT8nhLWfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lESINpYOthaX/U+Uxdy2J/xlXhHTTcmtf1Y8H54nCpw=;
 b=g2us8qO1vqRUth5YHh8O01HX8oxt35rvGQv5h7lcca2lP7Wg3jXrcnjd3tS7UdG0DpdIK0fapJMMmMnFfObbgxjugoVJ2V7ati2iPdDV8u5KdunmhZDMtntbJCVuSsHklb+kGoY2ISuJ7b5q85HN7XG45OARpPZeZyDnDFIoQgT6zvpBELTfN6r2MqWT8D0JdMOs8xyqjnQl6TBQkw0SqQ0VQZgVAC6BHdN/KZVaYX9tMYFN6lD+CW5ZMDqeaeM32Ravhj8/lGXrEvg+pJYvJqynE3qjyLMG/w7awN8X+WnI/VHltpU4u8OJurHvOrO1L16FZ+gdQGtSZPdTM0ixYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lESINpYOthaX/U+Uxdy2J/xlXhHTTcmtf1Y8H54nCpw=;
 b=MNQs+M7FDbxPSLjd6+sTzU4RRocTb32i1/avrqkSwI6ssyl/RD1K4MVXByDoBI6Zow99GyZkxei78NAUYWOE5Ewy9ehQXwsB7m2kkNfVMkfp7tdG8ERgSHRvuHiMnd6+tSFBkJv2LiLuQAmz84mHdz/t2AIlfAjDoXMcFNAsDVO6Jj19MRwAmUDaLIZFRstqLsPRYCtn92e8BsFe8T8bz/TersgM+QcW7qG2Xur/dJkeyqVvc4eFt5kl5fMcL91EbxqKG0m+knyhWkbPwV7JO1qc2Ui6O73UCM13R1Q7mTBUfcEmUi61NiUUU5FoLU+q60zL45JxORWLCT1NXXzWjA==
Received: from SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33)
 by SA1PR22MB6047.namprd22.prod.outlook.com (2603:10b6:806:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:30 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c0) by SJ0PR13CA0088.outlook.office365.com
 (2603:10b6:a03:2c4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:29 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A35CCFD318;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/5] ARM: dts: imx: b850v3: Use alphabetical sorting
Date: Tue, 17 Feb 2026 15:55:18 +0200
Message-ID: <20260217135521.65742-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SA1PR22MB6047:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8badbcc-d577-4de0-71c4-08de6e2c3641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AsKsUlsPHTJn3GsKULjLqB5I/0bqUAm9pHee21hPQ3tC/mp7b1LaNGhltYii?=
 =?us-ascii?Q?LRJd+RjRT5m59UqWSe5TDSCXYlLuNZJPOlGqPFGsyuTBSIleBi9I1DpgnWlT?=
 =?us-ascii?Q?pj430HvSZMS0N1s6AFv6TT2YpWf/SzpVCYEfFxXIYrOZ2cLdFlA+ihM3VRFJ?=
 =?us-ascii?Q?xIeskpghJ1S/h000Rw1q334a9EyV8lAE/smCt3qMq4TrgQPHBJFRciIfg6De?=
 =?us-ascii?Q?Cib01jod/g+PKdDP50+rgGdRfbr9CuDWNJhomXhiPKrd8u2G/OO00Zy+TaWM?=
 =?us-ascii?Q?N8nXNZpzfayDVF0KYF6JUHrj7jB7cpkVPtCwhwaeh5saW66Kp1ix45y2PDKt?=
 =?us-ascii?Q?gQFMwb8+huINS5Lk5fK3zXr28LLlxnkb3VPVSegQ6ADkwzdlotS9xq0paHsq?=
 =?us-ascii?Q?Q5mOQOxLeHaGaDJtQe6l/IB27AKOCnI77hWnqGTjpwtCpfbYttp3Jjb0R+8P?=
 =?us-ascii?Q?6PqmaXNSaPLH4bNgsD3fe0t3ULy0JJF8i41q+T3DyHujmRDw6kgT3EzQDJy/?=
 =?us-ascii?Q?hCvfSuGj9DHA0y4dG5Fle28fL15xmIGyJVOs6kfSjuBVGNIbJw6Eu6AHWIZk?=
 =?us-ascii?Q?AUz8CwhspU1MfTcgU+3ucBlMwYUtOvzJ7dI+JdsUtiKpvAcvxDL8JRrZuVQa?=
 =?us-ascii?Q?j787lgz9I+29nXqWXkf5i5amdExa/csHpFLIKbHY5C0mOotjL6T1JUcKNe+g?=
 =?us-ascii?Q?icExxh8MJ7uGVqlte1adIO34l2sQ4RJkLxZWaepw0ISvNrVc2tkOjbc5jdvy?=
 =?us-ascii?Q?aS6fI69g+YJHQszPLdL7q2UIjIuuiLLzUZw8pA+2JizITnZEIALNUOjTxjOm?=
 =?us-ascii?Q?6j0Gaab21diQYGtk4Y1MyCwxcHDO8bwrCruqeOvWjI3X4RC1UydxyJ8s7d0N?=
 =?us-ascii?Q?CsZ21+wcID8+mdKXZ95RWGup3vckQKigg/PnRINQggyfIZNaiEswZuz2oYNu?=
 =?us-ascii?Q?518MSC1KCePh5KkYUywusSvriMWS0hSN9wZAoqv7yFZIRjTFIXu68Vg/mZdw?=
 =?us-ascii?Q?UVsbFBeXzzE06yEO2EB7teMIzEjWFCOdtmB2XTfTsiLzFosiAtIdK005adtk?=
 =?us-ascii?Q?HJbVK238StQPlOG+cyx24Ki4rieamMKJwwSzPWJB13p2ZJXrGV7qd2YrKFDO?=
 =?us-ascii?Q?eGKVJ9Kmmz1WfJWEzM2V3QYtdsvP8iRbo6QePEYdVM+jHfbQCxq68t680cU0?=
 =?us-ascii?Q?MenaPRZgZiptQad0xP8QTUEIP2TanwInKbPY7ooVZh9EzWSd6ZO17LWi5mD2?=
 =?us-ascii?Q?JHDWzoWqQU8VlKWmVGrMr/6AzMTQYT5EhqiVKSgh8GANgHwR20nWYVKELPpF?=
 =?us-ascii?Q?bujo2/R3WbiQKHAMB29Qa9dF0LHHZi9jxW7M0fRS3ZUG2ElPKiDMn8poltZ8?=
 =?us-ascii?Q?ZXBH6WiGKcK0QV4jJFUCgruV359DKVV9YWCxllVPeB8NfK7kT6Y5fZhLk1vk?=
 =?us-ascii?Q?AFkro+vw9VAfzdjc7o+VKvorIWZZ1qo+Jd+uHBn+rwRuAVYphqDEDV7Y5r0Q?=
 =?us-ascii?Q?LZQTRHdtK8gJGGCns2pmTHGV0E395lsH5JdVLmOWf6FQ5sD+QzIUFWPeel0R?=
 =?us-ascii?Q?XITWL7HO/4PEMu5WOmpb68Lk26Wmtrdytoj3C6LdbBvm2tvJjskwM/1hmJ7r?=
 =?us-ascii?Q?+EwO6bBvTJXxsjzR/pDX61EiasqTtVHigArOGv4Do6wG0q1v2mVQKIVgvxCw?=
 =?us-ascii?Q?0OL94w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OKAunnzvfUywT0KAjiU3WMIvvjXA5n/To8eJSWP1UTHHr/F6FpZtqQrRfRfmZNtTs25iLSIhQHeJxjHjD9U0L+540Xd8O37OFcsxmwOWshTfd+8w9nXARdC/+aQUrQsVlL+yaKxSccO5KfURWjXppvytblH8ljTLNRJ7xoYn7d5w/EylBzIG9utI1BcIgav4vjWLRUwmI/ZOg8aXC1UEuExZ9kmDurB1gp/B2hVWy0+R66WDK+b7iSQLfwVGumuf+PRU2ysueen91Svwugl65n2+WfrNn7T9lg8zTCjN2UW1NRbsdsAAgH2pReckHP924F6h9/vGEpEBeh6rAG7pfbACrwiDwFhL93KIKnTjUbm9x+3E5QCHBO2bf7cDVi453QszLlKa+2gP81HKqsqAdAaiTLG1mjRfJhRB7C6RTcHob9l1KwDKl6w5kH0LCY8V
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:29.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8badbcc-d577-4de0-71c4-08de6e2c3641
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB6047

Use alphabetical sorting of references modification.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e7ccdcba2d5c..fa5814287f71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -53,23 +53,8 @@ chosen {
 	};
 };
 
-&ldb {
-	fsl,dual-channel;
-	status = "okay";
-
-	lvds0: lvds-channel@0 {
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
-		status = "okay";
-
-		port@4 {
-			reg = <4>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&stdp4028_in>;
-			};
-		};
-	};
+&hdmi {
+	ddc-i2c-bus = <&mux2_i2c1>;
 };
 
 &i2c2 {
@@ -129,8 +114,23 @@ mux2_i2c8: i2c@7 {
 	};
 };
 
-&hdmi {
-	ddc-i2c-bus = <&mux2_i2c1>;
+&ldb {
+	fsl,dual-channel;
+	status = "okay";
+
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&stdp4028_in>;
+			};
+		};
+	};
 };
 
 &mux1_i2c1 {
-- 
2.49.0

