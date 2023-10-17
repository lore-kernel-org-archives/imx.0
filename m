Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2084.outbound.protection.outlook.com [40.107.13.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E002DF6E
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="k7lApn3p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi7eBeBPspQZ6LxDoNcAKzrxvmZAbs5NGTqkxE6dRYDbIrjz1h5AGY0/kWhHtx5FmDE/Ugfgb+CUsQaAx/j0IFLS/gL0qNiqRIn85SQhdIgRuFEzL+TZQVYK/f4/KOSUyXEmfeGpzOt50X0Vgq+qdunzevFdIm7j0moAESCg8391Q3Ltwj44+r34n2z/fc3j0bmjDihWiyVw+lH+9h7AOFBnlddeeaTe8OJo2mrccAF76AiBF2A9S43gzCrwxv/7n7NVPIzqcAAFDzwlVEb7g54BtDU4cBmiApDJ+4QYq8gb8CzwklNooESZggsjITuDdZotxJwIi5gkFxIb8/9kGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT2FyQUBJ6OhpSxS66qmuflNQqwFAw6K6Y87bbBNksM=;
 b=MQkTro3N1CZCjAcSv5B/SNhBUJevarcG9HO8xIJYWz2HjR3Q4oSvSsF8bRMI1Bd8HPKu4qibR+9/5B5zGOXIGHQh2UsfGtVWZ5ygNK3CCd7Sh1459gx0RVG963RQU1RHwIQuuQqz8B/99hhcpzodTPHCR8r75FW8Hl5kS11Mv7csTwH8bqeyZqAn7hr+6EzFFcRBU4nr5fq9nmN4VoefV0HrMHD4mz4RTy/i65JwnSU5tsIXaHKeRXVCdXd/ompIFYv761xLYd/JYjBV6FzFI57V9so8USTCgI4WVoKqqCdk9TqGwYOYgFLgSZ5As1M+RWJx3an4u8ZJqv0jOgPMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT2FyQUBJ6OhpSxS66qmuflNQqwFAw6K6Y87bbBNksM=;
 b=k7lApn3pObxOf5Iic5VnULzA/dJGvB1O9GAPTZTd1GwM/AnSOu6VNnsSwrAEpHDr1m5KPb3HepIc67IagcpzXIUq7IH2APlnrzTtryTPSIJM7d7m0NrphlEQr9nIfd3Sz0dq9uzEnBmWgTQDYxxL9qr3/znQWRIysHEmqt1gsuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 19:47:23 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:47:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexander.stein@ew.tq-group.com,
	alexandre.belloni@bootlin.com,
	conor+dt@kernel.org,
	conor.culhane@silvaco.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	haibo.chen@nxp.com,
	imx@lists.linux.dev,
	joe@perches.com,
	kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i3c@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	peng.fan@nxp.com,
	ping.bai@nxp.com,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	sherry.sun@nxp.com,
	xiaoning.wang@nxp.com
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Date: Tue, 17 Oct 2023 15:46:57 -0400
Message-Id: <20231017194657.3199749-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017194657.3199749-1-Frank.Li@nxp.com>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f1360b-0fce-4beb-8218-08dbcf49e20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HPPkEebFQPUFQFKWI2y2RhvZYWtQOrW7dZW34UZMMNcw6q39owi+1Y+iQCA/1p4+hQWgwZCTGNpITxa02Q/lZEEXwPVj72SMhQF3+LmpN/Ulzc4AzlFvz+frc2Pxsr/eIYZTSAsvAdovZrPCjNm6Oc7DcZ3EhLkqvVq5UCOem2AZMW3dhefkpVcg1OzMlT0oMYudTFMCrRC5Zk7YJ5kic8q+nO3NlWylfRXjErPhehn4DE4edpDEMcuNekeTOfssvu/CI+8Ywry8R9ktEhE3wSNz7P9k3bgQgtJYyN1gI0FC+5Vkixpr1Ik8vV8ofK4sCqZ55qpg6i+KZwYCsv8Pqq1kUSHlrSw04RUTjg7b6KHHlbKcQeDliXZN9UYr/OSS3BK6GOVNTSlpKLW6IsW58XHuNo54iydinTT0iG6W5c5XkTni6jaq6VYXpgLKib6fwRjdPbXq/FkibOFOEUAI8eIn73vc+leYUyv8YrrEvGWGNzz2YVRMciNUGZob18ImoVlrEd2/C7b2Jm5fNcfMq5A86GwXECQwMzrdH1KvIQopkFY//T4SytNN0HiRwmfqZfVC1H8PZfVJsvHoPk+sISMkiIFcis1hRUw/iRxN9QLWCvsjjOUKp6FRbX9vdRLQLVs0hWDwCgitcCKV4MMJlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(316002)(66946007)(66476007)(6916009)(7416002)(86362001)(66556008)(2906002)(5660300002)(41300700001)(8676002)(8936002)(4326008)(36756003)(2616005)(38100700002)(1076003)(478600001)(6506007)(52116002)(6512007)(6666004)(38350700005)(6486002)(26005)(83380400001)(138113003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sB++Rf2q4eM557kJZcnTGXM1+5oLod2BBlfg+1wdlC269fyBlnt1xCL75ojJ?=
 =?us-ascii?Q?2nA+vIzpdc/+b43xWfbhc8ZwAgv40JAH4MH+b30QWkOQP1OQdERfvctg7H9u?=
 =?us-ascii?Q?StZd+aVHGCas1hEME7pKAyvNIYoVE0Moe/tRifmDtiyqDyUYCWRRwq1OCZpU?=
 =?us-ascii?Q?VcwD673HT80QFAdqc4BNSEB2Hf3I9nk61W5dihPUHCvIHKWh2kdbLK0ZeGZg?=
 =?us-ascii?Q?eKpsiZibaYcBnthfKePMwUtsen3/UyAorSV/mWhW/HGVuY9KAigmt3qZpFM/?=
 =?us-ascii?Q?FZfbAM8Qenjiuea3oXHMHlZgSc9ImZbFgPrhglBkKdvwy33LJk4uVmSE2Xct?=
 =?us-ascii?Q?4K2JwEwB1Date5hbL5vimav4kQ+AjJpOq7GsWPuosVRrTXKj8wX75iB5KNyZ?=
 =?us-ascii?Q?iNMHBwQgDCD/LSC0NG0mZoM1fLp+2SEFc5BQzkfLfqRBkEypBg9oDctuvaqy?=
 =?us-ascii?Q?XlpfiLFkMZwOfbFnQI2HhBItvNDoerYNACCg/w5e0g6rcDTAOgiOVBcb4doK?=
 =?us-ascii?Q?i45sbRl2pedy77yJpYw61X0MPq2Dg8u0cwrPlzE3JBZq5c6yuXJFW8a8zIHU?=
 =?us-ascii?Q?5rKVVO56meul622yovWuI+/AHMepd+nYi6i/zfiWaiWPAcXnHr+wZylxAsJo?=
 =?us-ascii?Q?KvGrGqI3qNoiLUYgwkWvbEwKeZLFlzgA+UlTsuc2RinsuJIilEqVihROat/C?=
 =?us-ascii?Q?e/eOuCoLaUPmzSgvZi5NT96tDxv13wQMCevVvKQekt5+o/NbU6EBwlYavuJK?=
 =?us-ascii?Q?IKoQYunJhQKlEPaabxsKQnkN9zsA7C26V17GnVkha9G1tNrWZFmhNRMC9ESZ?=
 =?us-ascii?Q?vvO/Qk0KQneqV+CaOBMXFfkuyP/8WpfGw/m71KQy/GwhnahJizCJAGBkC013?=
 =?us-ascii?Q?3nxlrhSl+CPITLw+zWmlrq0x14WjfP9nzHtLEx56kcPbs8gI017Nh9uVGkMn?=
 =?us-ascii?Q?KG8lHRSCDwHIenx164gbM9xUuqSwb4bL2KFmQt1MRqjbStCLBvxrnnj7H8Mr?=
 =?us-ascii?Q?XWSC7LU7l86U4ZKxAcx8ohNSR6q3CPUu2/wqxwfU8TGfRSuDKR8gJhhgplsy?=
 =?us-ascii?Q?+6saZWS0yGnx1yOTtP/BhRaKu3b/nXnvmf/HkXlbCoGf2a9ugXNQR+MwvEvS?=
 =?us-ascii?Q?gcbtj4ThO7k4wVD39/Pf+ZxY8LyNVVHvK1zKUz3AbLGlKzjgOSqnj7Bo4BOf?=
 =?us-ascii?Q?WzuXrynhOWvSxpq1nhRtQSKt6tmxQtFGpxRgLbGGBayKo93x7UBPMVwgpujU?=
 =?us-ascii?Q?6pD01Xb0ai5Edo4ZyjzoBJZ8M7Mv2F35l2MD5NzDnZeTkgV3Mh3Aq24LACGT?=
 =?us-ascii?Q?1NQ1KP03Z9i5Zxe/LhiCmfYVN/krXGI3GTQ+dXIOCCgV/J0A1UOuPEBm1etn?=
 =?us-ascii?Q?4SQpHpbLtD7RXyVVG3f9d7VALjvqLBaRq9o2T9n76nNwUoBJ27ZOVj2fS959?=
 =?us-ascii?Q?wGSWKqzG67WMniKYtNFBcuofk03yqZASiQL8O2yfmQdgBy2QJ22rYTNcnvTu?=
 =?us-ascii?Q?8X0gBxLW+pVoT1IEBcfuYeN2R3HEWjRzpj8WH7Qwrr9sx119VXkSuE8O4eGk?=
 =?us-ascii?Q?p6VRtqoHIOkm1jCJKTRvagjFx3VxB0ghVgSCyKMr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f1360b-0fce-4beb-8218-08dbcf49e20e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:47:23.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4DN4hYVlLscCBkPXpVJ/bm/lA1OKoXQQxD/xNUOYHixs6eqZ8D0DusdLwEmAef80jR8hQw53FixsyYQbfMohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

Add I3C1 and I3C2.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - using compatible string silvaco,i3c-master-v1

 arch/arm64/boot/dts/freescale/imx93.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 6f85a05ee7e1a..c6ad9ba9eb9af 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -242,6 +242,19 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
+			i3c1: i3c-master@44330000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x44330000 0x10000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&clk IMX93_CLK_BUS_AON>,
+					 <&clk IMX93_CLK_I3C1_GATE>,
+					 <&clk IMX93_CLK_I3C1_SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c1: i2c@44340000 {
 				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x44340000 0x10000>;
@@ -496,6 +509,19 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c-master@42520000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x42520000 0x10000>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
+					 <&clk IMX93_CLK_I3C2_GATE>,
+					 <&clk IMX93_CLK_I3C2_SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c3: i2c@42530000 {
 				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x42530000 0x10000>;
-- 
2.34.1

