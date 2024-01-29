Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538C157E87
	for <imx@lists.linux.dev>; Mon, 29 Jan 2024 21:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563149; cv=fail; b=lGryyR/v4tbFeJS88Z8U7Hv/3oLn6IqPj9cktTXZFQ2a7QMqwnUfJB7qb5dOl0qRmMj931UXEGIfyESEacKcbLReg57KZA4PF6Wrt86ZTayKRSMR8GZxL2/Ffr9KdraK7BO96UinFz+E0Zt7f2yModuIEmhJdWyYpqsKWuqw2tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563149; c=relaxed/simple;
	bh=NqNNDWuG+pFEfLOg/1mEXjHExCPcO2pZ9o8GXMoX85o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PT6ALodA6ogIs/cqr94xTtQXFDWJ5S5xjlawMR90qn7dQ12GkeJZTcJ0AixOLDF8T+6T+vp//VCw0KE4lD+AnEMNL2gaG1EuOmw/bsrrwlTVf3/YANg0KzEo1RfELEemjb9asf0ODxDdDnSh/v4WuNL8CIHNcgaZ1f5jVUytJDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mjp34uPN; arc=fail smtp.client-ip=40.107.13.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mjp34uPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2jKMTerjjNnjOOSrOcK5b03lwpFn2c0D72+jliZSrclG3FNCU0I63ok6TgLwItFeaC+u9ix7tHooFxyX6lpCLdDqYUIwyc0n1HN5+usjR9Rqbv3ZhKIrRQr4youiE+Mtjl4zH+Zdx9OIpmMCKwb9rjnzGJEksZ2ertg+3dJn27sGjsX40/6M9h8Cl5PNnS8YahkBJiUnM/UZ7dpjb0ihopR7P4JY+j8zW5O5HT/UKvuII3ocCR8XxNVIrUdmYtOkF1ebmgJsAR3bw1TKjEh+3EJluPwljrEyJP+PVgvEiLip9FN0dBeFKCB3QqngVkm0dGEBAkzQH78RzVi7Xvljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISCta+KoogITseJKXj28i83KYXC4eW04TfQyl8iJD3I=;
 b=i8YPMxoaf7WdCHJK9WrUXmCZq5U9Ijefr8DfnPF92HLcy93tbj8EkI97owPZGUCjyR92I5DbK5VToWnA3U5oOVPZkD14iir+jqTz48WACGv6MR+IdVAOZJmcA5hKlOqlhagVkhLXPa7mNPhXxLU/RNE1F9GdRCbuRPaROdY3YH1jrgj+h91N6NA+6a7FQEhi72uRTFllCTeEjBJmtpM1CJVBwcDdGzSPxkaXIVgY4daLCned6igpm+nkZtVLoa2ijIPxydV/2e1NAsr4jpFaI+irRmC+vPBz7FX7n7HMd7fDbR82/kX7qJQxthNPSCBUfSmEvvuwU5NqwwrhAV3VhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISCta+KoogITseJKXj28i83KYXC4eW04TfQyl8iJD3I=;
 b=Mjp34uPN0f6yA/YHG/+Z0nGp0HfNMRQivLGcDOfhLUV+IVOGYaQ4wHNeuppfF1QGl96sph/inHeV+reqY8MNiarZnuzxi4HtWRQJCr+Ilp74P1gWtc9sU46ClziF4wwdlE5H0MUbGNC/vK1h/TkDor1t3Zkv5nTuqLu/swFy8ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 21:19:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:19:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: ulf.hansson@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev
Subject: [PATCH 4/4] arm64: dts: imx8qm: add smmu stream id information
Date: Mon, 29 Jan 2024 16:18:37 -0500
Message-Id: <20240129211837.239683-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129211837.239683-1-Frank.Li@nxp.com>
References: <20240129211837.239683-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:806:125::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cc48ae-e326-406c-f70f-08dc210febff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbbexDHc5uEfiS2eCnrXPm9H18+4P6ZTMFcCvzjqn+TFK+YT07a32neexTKJXeuG7m7tfkI+2Akz8MMrreLF89l2E0URUqlRKVmknAvJu8TclvKGa4BNypzoBK7GsIjG7SHqU7fZDjgt+knP6bYnURXBToy8boGVBe1w52uzncddIH1gwaYfrkgB5tBXa9yBGBLGF4/v310rqYwm+u0fiUGCIx6FmtGzOfwJFtlfBDSidt5T45aLH4iQW4tbNACh68DpO8jbwK//BiRXc3Us+Yo6qGYyxbhTIawGo0tX/cJmV6nR8bqawqYU4DI9D8Ygf//r0M/i325AMWc1lBSuK0DtS8P0g6D1No5EQK8KP66KQIieH6a9/OyEg0mfoEfGod7g0Ezz2jXyXPAGZ1LOJKzPYQQhVwi0FgSjZImHRV9i8d2asIoXYxK1NFgzeYLB578vVb5udmbmogfXnKko88mfSR4wONZS6tcj529o4RbIPfGzj9JPwY80Vn4UCRvS+zFTM5Cd8XABhff9jL52hgA9mn8AxseEnQv7axY5vwskmicgvg0Mq3Tse7RjkxGdcQuWfSHGYL+n+FOMPVHAyYldUGDvU1+th+KJXqvGasWi721MCPAwCErj1y94tNWkQj8EjUwWjgmY44lYPziHsh+9o4uzvgMH6DiVDad5Tpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(1076003)(2616005)(41300700001)(921011)(38350700005)(316002)(36756003)(6512007)(478600001)(52116002)(6506007)(6486002)(6666004)(38100700002)(66556008)(66476007)(7416002)(4744005)(5660300002)(2906002)(86362001)(66946007)(8936002)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oa+daQWnpfQ6aleVWBM1K2G3WfDp9oiEMdYWEPppLdub38BrY3i9OEEXDgeU?=
 =?us-ascii?Q?lTdefpFZd7riszWBQK2/hf+uHRClsi8PElntYinKHwYfcAvHSozsN6hIhOTD?=
 =?us-ascii?Q?x0C1MvPVy5JmKt3zsY4Xev2/cks4cIaWtj+jH5iYpF/hMVRipVOtZvRCLlMS?=
 =?us-ascii?Q?2VtDFOSJUVlpxY5dtaMi+/8Q3R6D3c9SXQA/TK16yWHjBP/qGKLrRofP9UeM?=
 =?us-ascii?Q?iWYDeRSsKh+Y8XINlJwM1ZiocHU1MKCFpP42l7U7N1RClLUGFFEBO4GESQWV?=
 =?us-ascii?Q?eXSItFNSZp2togJSOZvohR9I/5tQsvNmqoGpAD0TtppQYy+xTnfoFYBjVyG4?=
 =?us-ascii?Q?1ypfv07y60afedvnw3jIc1JHrMD5e5i2yRr3JsI5hAALJBSfZnM2NFEORLwH?=
 =?us-ascii?Q?MX+Xy/5v6Aomj4d50/aPF1TCozYTK73uStDXEBxg28Z+QlVsqhA5snCp9cTs?=
 =?us-ascii?Q?3xFFsSp19UutkmdggxMSPSfFwAyztcnp0oOwzeDuHqmj4xXfJjNioZhDm5W6?=
 =?us-ascii?Q?o+4nJxeXXKme7Acx9gwxNOjz5T8USMXhEWBp5DU8fofDZW3QchNKT3UU2brL?=
 =?us-ascii?Q?7slFEtqZZA0vOV+9lFlg7naD62saesX+LoIwLArOqCe4uGw4/cx4QQpBh1BX?=
 =?us-ascii?Q?vofpmos7WvnrPN58FKVMT/l6xyQa3OHBxjUo81x4h31fhS905uHe73qCD42U?=
 =?us-ascii?Q?ukxY+Nrnu1aKKzgHbfR8mTdpKTyR4o1GYBBYNUAnTKf7qXxdYO0QjNEbMDCb?=
 =?us-ascii?Q?Sfjtei3wykGRICyHCw099kKttypYeXdOkDvcotXixEF7zjgIwuIErNtBJbhh?=
 =?us-ascii?Q?BpLIn8him8flhGC4gERpTu/KPTi4CujjHJhNWtRlsCjA2o+JBD1dF9kleOgD?=
 =?us-ascii?Q?cYvf98jmYEIZOc96GGLn3+4+mboQ3tX6d2ouSAEr21hIR1P6dDz5RrqOW1QE?=
 =?us-ascii?Q?soJ3SE1wnsT++pElAN8kNhQQG45pGIKyOhZQ9LVpsRnWOZVDQnJRtMgpsOXq?=
 =?us-ascii?Q?sliF9Sr2n/7JDS4bYQtquV8wtWAi3nk0EwgURlinbw9WZp77h5zXwLXVTpmy?=
 =?us-ascii?Q?Zhwi9UcmIM97uTP0APvQy0Dxw2oIwAVPTZfFUShLMeJZ+QZlBdpRIjhx3Sby?=
 =?us-ascii?Q?u84M0O92y0TXyuOOOugbUKY4YLVYnGc7tgEgmOGJxd9cBK6QlDGgJVB9wx8p?=
 =?us-ascii?Q?vYO2jF0G/uokyfSQkaIXQzxxoKSQADXgqVs9e9vAAqGxgHM9ucyXC0kMeQWV?=
 =?us-ascii?Q?CAyi6tDa8qSUXnoXlofUYxMB8lHoz1ndzsuJSAnO9uT7QVC380ySckVNhzP7?=
 =?us-ascii?Q?MzK2GB2+vgnI1ojttkuZDgXwgkGfxWiCxKWSJbdvncfeQ5fZEaPhkVlGSOuG?=
 =?us-ascii?Q?O5y/CdBX9Fn0Q1W0/nVTUIdFdvUKHrf0MnIuLzzViW3AY2SVT3r4sVZ+ufW7?=
 =?us-ascii?Q?xkwJ8lwQsBZIbeJXev/BEV3UQYCL6XAEdLHcxOUUnnrhg0VjVhmf3mdAXBGY?=
 =?us-ascii?Q?OfmcW04l38SE3L/BTQ9T/bf7pl513FdS4nhUN8YqtoOe8dGuFeSBxCd9ZkSk?=
 =?us-ascii?Q?IxBu5ux5mOUFaBhIyKZ3UtyvnsPjv9V3eYdi2Lxc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cc48ae-e326-406c-f70f-08dc210febff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:19:04.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnbhunlfwpQmxDxlRMvM9+xkELKyPcosHpdu7L3iX+gvb55HMqRqu2QSj0V3RQXXJ7idLFS8BoMbM/HhI7u/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index ec1639174e2e5..3cbc861400b43 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -6,20 +6,26 @@
 
 &fec1 {
 	compatible = "fsl,imx8qm-fec", "fsl,imx6sx-fec";
+	iommus = <&smmu 0x12 0x7f80>;
 };
 
 &fec2 {
 	compatible = "fsl,imx8qm-fec", "fsl,imx6sx-fec";
+	iommus = <&smmu 0x12 0x7f80>;
 };
 
 &usdhc1 {
 	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
+	iommus = <&smmu 0x11 0x7f80>;
 };
 
 &usdhc2 {
 	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
+	iommus = <&smmu 0x11 0x7f80>;
 };
 
 &usdhc3 {
 	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
+	iommus = <&smmu 0x11 0x7f80>;
 };
+
-- 
2.34.1

