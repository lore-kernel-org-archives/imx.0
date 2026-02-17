Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A8932548C
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333202; cv=fail; b=EJ8bik/vy5PjVi9D45zdU0i0erEa17BdlJ3mnHUa7hfG275v0AegHsqIsf62eWOoQCvkfYZ/AZR/pytKwMXgdvr1645Lpdt4nlx46YAy3Z2BeCYDBXgWZBOqkmhBwSMcmbC9fmMAe6B6YaH+eQi3Kf2aPhbQ5v1RAP2sX26f9TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333202; c=relaxed/simple;
	bh=TYxgVWzQ+g8z3rypB2ZVaRH0iB4w3QLBdH0DxDOqoj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkKG8xMvEFikjX+xLIidkpDzWacwJHQuE+yMc2+YM37qRI9Mxye9dFg2vJbA0y6mewYKakSI0lYJYLkzo44cbPfCTHFUpmzJWlwxid5Iki6rYk2hWA08G1WTDRr7EKlTVDXs4ZHovmmqODZIghM1gi7BKN9Nz6VYNgJio5NFZZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=DYdD37Gj; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="DYdD37Gj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjoRXqmeLukqPfsj1xYhEdGrH7QPsVe+qOeNMsI136LT5j9EOrSZWCV7/Q7PelO7frs5CNAjRj4LirNcihVBcpRZd1K55waTXysnFQhJoesa9u93uJeaCH0U0ObUMQC3bQIcCGc0g+RdyHORiXHaq66FIm2tW/dvaZxh/AGShR73H3Yrh5bhNVpWMcZ22GwajkvzkfBT5mH1EWEd+T+wPo5ETFxXldhDWbJeRsC45BnDsZbZamYx0nMkHlqbc+G8Vj3d1x5WFtS6IV7p7VzhRclBuWneK3idjhvguKx+fvNbYbvfk6WrCDL6p3WAAr9Tf4FfQVDleASYDt4cZ9Xtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZfTg+u0jIsnu+nrWJsyKGu7RanIgdyXfQ4lA/pnEw0=;
 b=yEa7zHZE1XOOZv8o2eJZZWg2YVH+QKMXZeFoHWSxoeaas9cbArjw+Ul9+YCPNg48YXlDVZgArZumigUZEKb4rlkFevfChUcnzelf/DfZ30n7Q2Yv+EU0kzEwuqj8pS+fYojbYyRPTRTYL+m7IOMZGtNOG4y5Pu0nS9+Wj+IBDOtER967sbJJCZQ7KFxgPV/dmGAs7RFbCuXXS7KWUpLIzYK2mLdWJ0J4LIaW2KCyD1AKIdBdwqdWRemjKNhjMFYdrpO+7mczAi38e9dvmtQTXjnGrm/s+gyveQc979eNaEI24nAz5zUHW1WLmTq2Xm4YkXlNCkBEH0Ak8f7tVzKhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZfTg+u0jIsnu+nrWJsyKGu7RanIgdyXfQ4lA/pnEw0=;
 b=DYdD37Gjly2dXkMZ2AkAJsNO4grUUTKd5GTZR/Q7EALUBccM2j88waer33SM6DkY19SBvLxIA8x9ZOzg3W2lPmiSz7F/bVr6E8n6n3GYG+RMdlA80uzhClmrm+Yxw26KTGyIWsogpf3MT0Scl6S2zdf5JFBjYSrVP9mrAIJ5Kmy5s1ZDk8G49VJLqRpEB/9TelTw4+HwmXrx+D1+DsleHHUIQEcdUpO5AZl++CqdpajbCmi+ENY/2iUeirZUGtir7Q9/jRpHH+KmgHZXzGHPE7F1DvEkbrnhKgwWYLl1uZEwIhfICFm9eC7nlKoFixvdGaBPjsFPbE3F3bBb/9NVcA==
Received: from CH0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:610:119::10)
 by SA1PR22MB5293.namprd22.prod.outlook.com (2603:10b6:806:3cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 12:59:58 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::27) by CH0PR03CA0372.outlook.office365.com
 (2603:10b6:610:119::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 35285FD318;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
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
Subject: [PATCH 3/4] ARM: dts: imx: b850v3: Define GPIO line names
Date: Tue, 17 Feb 2026 14:59:50 +0200
Message-ID: <20260217125952.53997-4-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA1PR22MB5293:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 31d26d7c-9467-4030-e08c-08de6e247445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J8gXYIVunKHNWTSN/C+2A0K+dTWY6GFFtgOfeUdjffkVpXcss6nxIyUt3KXh?=
 =?us-ascii?Q?YgNXXlAbP8URQ14KpnO2egqhbF0H0GK7Odc4ogqp42lK+Qcfd82Z7kMJXjM3?=
 =?us-ascii?Q?I78nDNwA/xJpG12DlisAS6uaFoH6olQ0aeY+9ji1Z2AKRqvvxnm2MLnbStaU?=
 =?us-ascii?Q?ORnlldsdamwKSTqRol02sn94V3OIe0yaNZMVmA9wzrGX5NWNViU08jd239Ns?=
 =?us-ascii?Q?NC6xMAKfIw2vdqJ8B6G6W5q3icEv+/N8FPEYK9qnKqD9pubsgE3qu6BRUgjn?=
 =?us-ascii?Q?F7DdqcJamYwHhfS7w1jELziB1Tu6LHm7XFtjOC8OcdvT2mkFbwzL4TQj2a7i?=
 =?us-ascii?Q?QVxNnOtS2eUx2jQr2iVNJe4YUU2egpJIz4msdF8Lan27FJacDkXmfT9W5/wj?=
 =?us-ascii?Q?7ZiKTxjWggbEzm4RQusffrqunKG3oyd+jMV6f5qnCXQwCozHcnzqEQyVd2Ah?=
 =?us-ascii?Q?5Y7jXinZmj34usoa7FSZYNqFMN6U5RChJ7vbqGwN62WHWG+FBnEt8A6dEGg8?=
 =?us-ascii?Q?ZWqqsbTpZxqujEpq7lqw7S2NLSE6tsLxSf4RXFPUGFiKbbzxSI+GQWM1kpiM?=
 =?us-ascii?Q?INLcjtIG1ESyyD1rWR+EpsgnjiTWZKkrWFankdSwNLbG+YILzsMxKWJJgPWU?=
 =?us-ascii?Q?Jxjiamafpwt628C5wRadi5HJ3brFxk3oxP1geE4dPStuhk3cuocpzRcbVn/w?=
 =?us-ascii?Q?LLfw3bATUyNNo5+Mf0qHWIBvXtG61AKAFUJt3Sa+XslptEy8zNNLlNxgJIFb?=
 =?us-ascii?Q?pR//rfXaV4OiG/w/CRMfpfab9M3TUWlJFnFDOhAON83Owc+lpsADL97MyOJN?=
 =?us-ascii?Q?E4Nz0ZwLg6nczWzSD4aL0zZYroM3deBmlHqBu7V6xXJTpyTpWpGmfaKFjQSM?=
 =?us-ascii?Q?Pi3vDGNWpAOEJJC//X9wa0xNcJ5VfuczGZgzzmzj7daVvhFO/mkPkGvLiOnP?=
 =?us-ascii?Q?uffpQimbtJkxQ/ToPSs6t+Fj3T10giG/N/4V6dJJQaeQatZGeorrX/9ksArf?=
 =?us-ascii?Q?r9A92wJOeYenpVLUBRskKSuZLp8IxwuT4cgmKsShAY6K739lrB6rPOQQnMyd?=
 =?us-ascii?Q?MayM/BjCzO32NEx/9wDzYiSnAVyTwujOrxWf6Sdmenoy4nisB5+TDAs0dvQU?=
 =?us-ascii?Q?tj8XNKMhgzgKt3t3lSPjOU47rZQQIWXAF8R60LB4GLVq0J80W6QLVWmyLP69?=
 =?us-ascii?Q?M/qn7mW2shjH1jRe8JtlHC7+zX7KnB8z9yTkgxjeV68HpBUcqPG8AIcOa/sy?=
 =?us-ascii?Q?20o9QhPMTyA9zvj0ebYsJj9bs7AcaVdtufrSMWpBMJTtlaaClpFD1BevaD/h?=
 =?us-ascii?Q?y9q6hYBChrhgmWIeFft2jG5YQyu2XNsWP1Eg4D7pYAFEXYNo7cHAC+Y1T4lo?=
 =?us-ascii?Q?hPylE4Iy9c7snz1w0vcP3OpGVAgpuGGqZFbaDZiynY214WqQtQqTZRsNADq6?=
 =?us-ascii?Q?G69J3a95GMEWYatV3zb8fVls4wFviiiQjPmDNF4rBmXbe3wtgqC7D2iAXS+y?=
 =?us-ascii?Q?Y+J6wcJWbOHG5nSPDHXnoqzeTv1BwSFyzahq2hdlMBttbEgOUXP5dtPiM+XM?=
 =?us-ascii?Q?3EQfZ6CaZ30nqDX5uwsjcO2D3jcjwGUXNnrIfAOdETGEG2RGvMT4GKJgAoTi?=
 =?us-ascii?Q?oaIP3h2Kq2HsrZ5eXZlbtMgzHoU1hkT+5u4t+NT90cNTOkeacRKgFCJWKTYy?=
 =?us-ascii?Q?kP/6OA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1m/ZacFUABxQq6fALS+x+2MULhfGwh7EFD7eIJdfBmni1mb73eGNxsr2TWEEtGN61plWUIKR6onZwE+/vuRmxkNuBePT+gQIG2akSbvvckXu0wMBrp3MFCGN7XUOk/QQ0CUAko0GbVJYF1GP36oQRXloFdHuiTFMCVbufflFDdDzvcqfJNrP3TmUCzSH2hRhAtstCD47DLWGLAecqeCE1/KOhYEOOjgtMx0NB7O/VHjZhGEhHzdgje41JcjfGB7MxfVk+dXpu10AEeQu2+hm8YFrcaCrZ5EuHKqrTQaHHPhwaLduzfld2KFnEt08KUqMZSwjaymdZN7UhZMZYWiL23P4N+yujln7wlqekHxFWYjlaeiDlpDzUu2hFfhNqpsCr5Kmc1iUXHhMszO+u48y8gEdVRpnIPYLXoxGJtEhzk8oDsg30W29UKd9fjVuViwB
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.0634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d26d7c-9467-4030-e08c-08de6e247445
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5293

Define GPIO line names for gpio4.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e7ccdcba2d5c..30181b5132a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -72,6 +72,18 @@ lvds0_out: endpoint {
 	};
 };
 
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "PWGIN", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "",
+		"", "", "", "";
+};
+
 &i2c2 {
 	pca9547_ddc: mux@70 {
 		compatible = "nxp,pca9547";
-- 
2.49.0

