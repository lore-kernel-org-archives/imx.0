Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17C3D75
	for <imx@lists.linux.dev>; Tue, 11 Oct 2022 19:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsAfgB/s9aOpsOFBOPllrCIIFQ1p6JA9xyMfpD7ovJv55U8ePjwYOIL/1VflDXltkZPEukIk6f37pnzt8L175Bt+6piBwQhedmSvF8yCpb/53Mw3laaJF09MRDlXh+I94ZJBG/GGK5gW14T15fvdOEsfrr1rpfFiv9UNHrjK66PFJpbgDT4988aDeVKTF8LK2d3bpUpj5z2y1kn327gCNqMnuzB4yE9XrlBnTcj8kIibsM8X2w4+4FJjvmlHqr1BdbN3fDTQdOncwIp2VOllVrZV9TcglRU5Dj6x70i1iONZKAraWogDFpuCtTrrwG/HIL2NTrbLaiznYQX/JpiRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuYCGMgS5OviZHivmYIAqMjivkuF0VX8RwUmKNxwQ/E=;
 b=dkorn3k4Gu9HSq+nPyBxOQhif6ZgKAs9zeeYnPPtfWaP9ZZ/2sCN/dunXFIInTF/A2+CJ2ZyighkHCy3Ua5ElvsZ4tSa/nZcVjx5djq04bfvohzwjtnNjCCUBCDBMbKk4nC67phOizAym6ddCHMw8YW1g4vMRSmo20uFDR7ZdVn58ix9JVBlWsCTj8ltMnM3my5pkMf7v22RIQ8v+rjlsObQvVdxjMCycZ902ECqqHaknCWFBrC7LQ4i/GaBhosivp5UlhJfAyX3Iq4sejhqIWIGii2w+VgnIxmqDxlwOI9eFOYQcFhYZWcFhoA0G7qdawt/i9NkfpmxCzCfvOLd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuYCGMgS5OviZHivmYIAqMjivkuF0VX8RwUmKNxwQ/E=;
 b=Lv0svPKtdPy4Lodv+IDovpIJbJoeV4MBH7SFoRcPC/YGxQzYBiayOE41tKs6eJlHm9TQgJ8UgxTdi1tP75E0IkfcA96MsiICcrm2Sesju4r42zqMVCz1ykZnzkW/PJQtUPGlPHG3YVVrT5Y1aBy16qM1KPDJDUHZ1xK05Uf4B6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8597.eurprd04.prod.outlook.com (2603:10a6:10:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 19:47:58 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 19:47:58 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Ming Qian <ming.qian@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: freescale: imx8dxl-evk: enable mii_select node
Date: Tue, 11 Oct 2022 14:47:15 -0500
Message-Id: <20221011194715.647439-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011194715.647439-1-shenwei.wang@nxp.com>
References: <20221011194715.647439-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU2PR04MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c92dd2-42cf-4bea-1f16-08daabc17f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nrAInJX56bw76X23/0bkqHzWmDJUx/SI089tbizLLv3zlcgqjIM17zc+RQICZLPmGKlloN/ZZVrH75VjX+97bmuqO3++TqPeL28xe5Pz/6orDQhrP3vZa4Ug0BPI7u+Uwf0At2wxaUluq1OyUlSVRL45IDhDMcySBe8Q3c/zmELD4gMYMMX0Qv4fKCo2CbfE91WKNDANbYE+sMNQ1DvZqwEOVoIsnV8s1r2r9gNjIWQmcRg7YPPoNA5T9WQOmQySYGtj2Uf5vAK8XZnJXleN2fd23/7UA9AH2m5BvX99ao8QSDSNeemB58xMGVGCA99M9dtHbsskerzcwRLHSXzVsXslaR42/0nHpywmBweI50l20EFKp3O4Sv7nZkIK7PKsnhdQP3NSVNs+2S5gesyG3/dplqQaQ0YbD2/wJaXDcj6cfgXRqGhtnfsLqNNBop8ZtpJFygB6/XoK8vaqKfvtqy+bNj8wGVxWjojn5VzXGKNbmecdPLsbMso7yQ96J+3f0Hi/7j0QAGvwrym+MGhV+O/YwnHvRCSZfYRC6Us5JZF/n/2gEsM/r+m3fbPvfx0Zl5mnbXC+6jn31KNVolwGSk4Ho1kxSFLMvz+nUpQlWY64Uh+mKWEyMvi4qSOMrLhAVEgmQ2XjtOVQ5lT4jPTshPWNMZOa1rgAPxzYN9K2/7AWk9hiOpII3MgdMTvk1X4Ua7MdugUxGE1Aa7mzahvy5b8EafO8YDEOA9jodPK2cxK57gtWog5TcdSnP1+pwQGjPPSL/XVrWlSwygSOZXVq7uXcTN1PgxjxlM8N2zZMdd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(2906002)(4326008)(4744005)(44832011)(316002)(5660300002)(66946007)(8676002)(66556008)(86362001)(66476007)(54906003)(36756003)(6666004)(41300700001)(8936002)(478600001)(55236004)(52116002)(6512007)(2616005)(6506007)(110136005)(6486002)(38100700002)(26005)(186003)(38350700002)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xaJnbrJFJ4J6i7eql84J8uZmYDMo0JWNcmFDzRJ4ub08OAhk7+LRaluNv2sq?=
 =?us-ascii?Q?GqpvWfmc5IrJWnpA7wVGtTrhvZIJhhT0Ngo6qpX+dpM8UWHsclFOqMWFI3Vy?=
 =?us-ascii?Q?tJh4cpdH93jQheobz5vmuxXxaVuO0niJ5e6AY3XySjR1Jm0xEXBMs+uXCi/U?=
 =?us-ascii?Q?CGiPDKPYqaRJmY198HJyA+cicebGoOWiEndPr5cmxetSaeU8hPY/64looq4x?=
 =?us-ascii?Q?o4XWp+k9y+UB0/3jO+op9ivXyZcGUG37tjpcT+zDwtsNi4lqDM659iFSROix?=
 =?us-ascii?Q?8ZELC2wk+bVlHuJgsE8bB7jjlYvAJtSuAHQev9axJdZDjJu8e5zFdraFtsO0?=
 =?us-ascii?Q?G1EZKDdScway8QgM4/o1hcEcT6UTGBB4TtYZNw8PgQltH9Bk4aSOkzGgTsza?=
 =?us-ascii?Q?MJdUmZdCLk2kueeWXuUZhZWH1lqJ5q7iOUGmCeplT62o4aBoZIc2cBMbWo23?=
 =?us-ascii?Q?3nS45STkBwFz95J8F8jo/fPKczwO+VPKvHWX8+Ai0G5gxoaQpWKYTQykjkAw?=
 =?us-ascii?Q?j1IS6orSFSUTtcI7CUlI2/sHYuB1/ioRToxAc3vuU3J3F8iomYghLglrG+cD?=
 =?us-ascii?Q?XhadLUf7kaQMKVNl7sqLVnmlFoYhhRZ/11aNlEeLOuUxpRPwzLH1AD9OgMX1?=
 =?us-ascii?Q?7MuVRsESaCCMaOmptQ6Wxi5andOa96Usq+8gQZxX42nu3u7BjcxtJH3aPz0/?=
 =?us-ascii?Q?XoGl+Qu6Xxsl8I8f/cmBW4EEWvOjM+ThW+rrqPT3qRHMhPehNGcJPPzbZ3Qz?=
 =?us-ascii?Q?xR9FkF1kMCBR+eMX+9QuEVuOiaJsk+LDnAQ8SuXR8LoO5xjF0Z7KhWSJAbKz?=
 =?us-ascii?Q?gjnEg5YGDUleRs855MiwHR9ztbqeHsChO2t1g472EQKGw0vtocE/08TQ3rwz?=
 =?us-ascii?Q?Scpf1c+KqA9ZMVOGJ61pJdH/1tRF7sMa4tXAy0OIr9fmBlJtNgxNAYnl/z0T?=
 =?us-ascii?Q?HPF2ck4BezWaDLTYFsJqIV3CEwmD7g8q9sFuEnG1ISCJTNRjafMvV/au+gmT?=
 =?us-ascii?Q?Xy1PwpMRBz5b5Iu6MGh4jkogIzyefo/YWs3DWZn5aM+HjkrwUzdX+mRAFxva?=
 =?us-ascii?Q?70EgGjaTQH46SUkhp3A6kUFM5Fld4C8bvemH/5PWTrAd13kLuOxPx6BIgokh?=
 =?us-ascii?Q?9X5QYlx+EhsqVq52rXJh9W0AXw9MW0TSCOUdS/RBIXEGbdAYLEcbM5puoQhx?=
 =?us-ascii?Q?ulAsTCUVs0qt6CpU8M2Y/5Ohm5fBZUSm/IWcDh5WWpMUUGL6jilAWlouZoq2?=
 =?us-ascii?Q?qi5U/dBpeYTqhouZ2Lqh+NY7R1KrpN0iprS1v3pmuOg4uaxpp+L5r9531zfF?=
 =?us-ascii?Q?Yeh7DW8Zuxv9ip/7Ojb1ll/Pn18gqoF6GHQkbp4+Wd3sBrdphi57DNb/XWe+?=
 =?us-ascii?Q?EX09wPoPlffEYRiVQph2NbxgO6ogQOIrEI2sJeyC+5oy8u5S4EK83X80Oz1a?=
 =?us-ascii?Q?6Hb2KxnCWEKZqGFKaWALO0UFBrDu1DKcf4NrEtAPLY6n3aSWSPs6IlFxFEu4?=
 =?us-ascii?Q?KZyTugDvRdkREIxszCKWwtBbyd3NRIhpzl1shkIrFxJX/20LN5fBpo57Nowl?=
 =?us-ascii?Q?EbdR4STLWL420fV1m5fJVZsT2FpXyxkFhv7G83RcCwAZnInBFe2uJTYlsusU?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c92dd2-42cf-4bea-1f16-08daabc17f38
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 19:47:58.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIrMlP+q44SEBd3Lg/Mn/WG+yfUrSg2ohrR0Ayr6u+mr3mbqReXNAb4L5lMXol2jeeKsQZdmXacrKaO281OIEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8597

The mii_select node is used to determine the fec1's interface
type. Using "enable-active-high" property to configure the
interface type as "RMII". Deleting the property as "RGMII".

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index ca2a43e0cbf6..35a8af2927ef 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -90,6 +90,16 @@ reg_usdhc2_vmmc: regulator-3 {
 		enable-active-high;
 		off-on-delay-us = <3480>;
 	};
+
+	mii_select: regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "mii-select";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&scu_gpio 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &eqos {
-- 
2.34.1

