Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02C2578
	for <imx@lists.linux.dev>; Tue, 25 Oct 2022 18:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4Q/VU+wAIby05c9QOvFvSySinNpPAThDg7dw/vSPQpZ3XPOnhhcVXNvR+itg+kIb3oxDboKnPmO5p7JBXKVPwwBSIKwunklk0WMpQqIFLW9/HXg8uWEvfNEe0mx0ccEDoiiyDWL9tbdSk6QiHaMKDT4eDje4BcZ1y+Q29Y8q8DkP+y+gDVBlagNzzuMF7p1Bep7KczkmI+3DCEYrG9n5xo3o/eBY3dqLRt9Ti1bROO+DNy45hc89a1ya4/1FE4nKuDcfxVrGqtYGuRreFwZITN4l7KJqSOayXbmX1doGIWkbeLJgaRmfe1WFdCPgegH7py+6zqU2RPLi1jQ2gH+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7krlb83JByhf0YBUVH6GcrB6KQV1m4MgHQtHuaVhsk=;
 b=aXXiinnIEABhU6CYDOqgRaVRSAPe3vvdmnCZYBAhMV0T/gsnXEstQmvBJ6TOb3OhVltTjluK+Eq0s2yPrC773LSOLjjoGg12Seac7AzmLTtllu+N01EcYDJsec2FCfsBF4yuIEMcomuR659ETunPa9PPwgNXDXQaMFL57f2qYr4GfTjSM8hN5sHdMZJUWFXWWWl3xWJZzvKLFY0kXsr/t/86NuQm49IgHHrIQ7c4RfTwSFQAe5hJQ6OnuGrWM6t/TghR+brTm41NC8L0Gb4VSJ3fg9Ea2tc73ZgIDPwi/uk9oxRqgzXmIQHo+6mhUNqjnWTQ0bxUwjCePKDPREKWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7krlb83JByhf0YBUVH6GcrB6KQV1m4MgHQtHuaVhsk=;
 b=R7LmsUSVJY+WrzoNE8FjTUmQJm/5ndeP6T+uehvZFy22d/NL/yaTJetTg4jgy41Zqlwmd/pdO/OJmT0dGcm/XEtBKNU647X9WoGRnAwvH3Y2ZyC+nsm1bCDaqFc/EKi9MjNghimahapbQQSmPD+t7NYBdJIyxUmhhBMZuORLkyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 25 Oct
 2022 18:33:09 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c%9]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 18:33:09 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v3 1/5] arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
Date: Tue, 25 Oct 2022 13:32:40 -0500
Message-Id: <20221025183244.615318-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025183244.615318-1-shenwei.wang@nxp.com>
References: <20221025183244.615318-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f07244-16f8-44a3-88fe-08dab6b75d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLXhiIx8SzFVK+Ag6YqxCT9ExecEocSKH3C0ay83MLpdINGRZ5RuhcZ1hWNn/FBUDeAOVTgQ73+tcJBbm5KXAT8O0mK8Q9/dBTPcLFpHLOqcvoI7nj7Gow22bVo3XUSEmP/b+BeBilivx4EWuLwjU+Q9umjC7FPMowtBuhJ82moY7smC1im952hgDsQ5h177QlwfkpAy9hd0B0+4/+ZjCxaI24azgvqYDB/4RvV/rfmbq53t7aUKgN4bY/y8Q1Z6Qzvkw9E+skAvvl7ZqMj9aRQhgexHNNjgIcB9cRMaJQukPZaGYLvQDq+0XRc5lcSJPFtGnH44/5Rrm7ai9TTZMBt9F7AFsXKzhLyRNhHpSu2yjp+tO6b/LfZ5JuTOk3/gga7Z0JEd6ez2BWqcnLyZYflfqlpogRni99C/Skuc7wZ29l21uujtcGE3KFNzDR7jOTjl8Rvpfj9KGU4RViTc9nsfzPglxlKys5zlv1koIebJMabFPJHDWcPR1DWqa8whYmV4eXbwPxjEgChXCGUezxUBYEhy5bAu238gggYAt3v8i13OUK7iTAw1rtMcXs0CKsWTFjz8UFD9KXiVEepkE5lqqNpM9KoQY7PQgWtPMf6Md3luQIEswGflgMXxxWMVEF0tzDBiNVDmi2OhivPiGAXkjvT94o1tXKKmaAeycnOORZLOwb7vNazZhZlc9LkonQbcHe3oqoMlGba98ghUccE171wTcGn1tsQHavzAQGixO0Q6pFvdO17LjNEOxLnqCxie5+LKIPdCwaitsgXiW6aZJ3md6a6r4ery23tQGAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(478600001)(38350700002)(38100700002)(7416002)(55236004)(6486002)(8676002)(86362001)(2906002)(52116002)(36756003)(44832011)(6636002)(66946007)(66476007)(110136005)(6506007)(8936002)(66556008)(4326008)(54906003)(26005)(41300700001)(5660300002)(6512007)(316002)(1076003)(186003)(2616005)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qV5iq5WvQjo2ZYWq4vXfir1FsxGBw94Oifysmq7+uE763bOe9MemIucfT+7/?=
 =?us-ascii?Q?6zwleQf2ah6byLkLc83SCWQHBVJdEhSTZDop+pj+90HuSp0UKN0n0oolwjI0?=
 =?us-ascii?Q?1vN4cSkdxekORuPJObbwlRDcW5d8O1g9U3UAJa3b92Il1jCWfn/PwmovFREh?=
 =?us-ascii?Q?rgEw61tGcUXDYkCQ1ZfLIV6XFDURjjPQhdR92WaiM27fr41lONw7tMUFWauI?=
 =?us-ascii?Q?15dyGeeYXuZujorgjRqsMZlegRIhtNDAmj0oLPs/zzBBJQuz1nEOFGcrn41F?=
 =?us-ascii?Q?XvaABAM/8qGHSxBshsGcNdmHZJ672cEl+vyX7OZYu3s5XUxLSLjKe6YWR7fb?=
 =?us-ascii?Q?F8TH9ljmikqm5tLBfbm0Pbfnr5rUal96WlcDe97UuCdcnPk5VhkvwJ3n/9a8?=
 =?us-ascii?Q?f48XT9Lq8IssRjyFv9ZOLAWIjBOfF1hPoNH/qyHdGaIImjyt0h3/gzbtC7+u?=
 =?us-ascii?Q?Hw0qvLY/jVSaJgP7CXOH6HGw86ih3DEMJ6SMESrfjXwM52ISUlixHmoA01jT?=
 =?us-ascii?Q?WgWMqzHEDhDMXAbIX1qIspkMN+tcg2tD8QqP1jovfzee5yy4+4dqy0RVWfdK?=
 =?us-ascii?Q?ukdOLE245EidxbTRcrwYEosbYPbbIwRwcjjR2K87opht6iw6Yp0SvoY/IqUw?=
 =?us-ascii?Q?37fzR/XMAO1V7/bYpF1LEom06kfZ8eMoApZSpSLYGEaQ4wjo2ncTRm98gp/9?=
 =?us-ascii?Q?cG1ZO9RvsngwDl+PRazEV1Z9ORxFADmGhTSFq4Evu7LMGuH/8DjsGHyxCHCq?=
 =?us-ascii?Q?Whdiq35txioqFs3bN5Mu5Oh7sjyeYIotsHP/LFrTOjCnArBbvP0g2JBBAK1L?=
 =?us-ascii?Q?MBuFpYCdytVpw4BKv02Ql4JP5lzZkU4DpSr5t2cEM34rLK+fzTCDSZBz4kaM?=
 =?us-ascii?Q?eFjkg3z7eu75vjuX3rWH4BmrPSQDE9cM/qpb8pe+Vr3oPPlQsMVnn+J2ylfZ?=
 =?us-ascii?Q?ZXZFCSwN8qHQZpjx0RiUURyDdPaRnmh10MCpKz5DCYPjC0D81pDaVMVhfC+u?=
 =?us-ascii?Q?k3ceXGN18xme6pJtD2A4P/rh4txA/cPs2bsh5eHKYd55hubWU7kz/WI7pXnx?=
 =?us-ascii?Q?z0MVjmT+bUKv/moKV5Gqkd9DYlBeHuJz197MNet7aKZQYHFaoY45fF2Spvwe?=
 =?us-ascii?Q?/e5n3Vn/6gzph6Le7mdgIbHkcTOrtZJnZF/xkaXyTZddxjHkS2o/Ffo6e9Vl?=
 =?us-ascii?Q?acODVwfbSDvjrTbbc0eBw8En3mTulGegccoydTPqLeKl7fZJdpzHYuZnoeGA?=
 =?us-ascii?Q?KGUUq5aAdIdN6mZXyQ1oCrk/ghAqWt6lYeMlkYOG6zLgr3B4FXSunLvYK4Zm?=
 =?us-ascii?Q?6QJb+RCn4cl7dECd3HMnJXwef7hFCrkiCUBApG6WpyeJw0KmuB+yR+vGRJ1L?=
 =?us-ascii?Q?ZoDz7mZlwQsjtBH6XYdpY/huLgUwYFUjLYNukDpsomJXW2aq4Euql9CzX/Sw?=
 =?us-ascii?Q?JWpb5qW70kuwnIjsadN0dd7kq4KiBBDGrE8DOIo0u9CEeEpDIJhnZS7+1Umd?=
 =?us-ascii?Q?ss+yHjsrN7+X3ZS9xHxNJi8wLa/sBfXgw+hJ+luaI6u6UCfECjiGPm25FelO?=
 =?us-ascii?Q?0wax/T1HLcgYVs9oj311WOunZApd9UmDI66XdCeRydcflpnqiJZy/J4LQ40W?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f07244-16f8-44a3-88fe-08dab6b75d29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:33:09.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okvei8WhyF3zxAFQhzaEdUlmOmVk5Yod7ofsAMFFzjYkqme2Awnl/2yEhOstUUubn5b4KhgJl6w/W5DbkQsS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581

add gpio-ranges property for imx8dxl soc.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
index 815bd987b09b..5306d2b3fc3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
@@ -6,41 +6,82 @@
 &lsio_gpio0 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 47 13>,
+		      <&iomuxc 13 61 4>,
+		      <&iomuxc 19 67 4>,
+		      <&iomuxc 24 72 1>;
 };
 
 &lsio_gpio1 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 4 74 5>,
+		      <&iomuxc 9 80 16>;
 };
 
 &lsio_gpio2 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 1 98 2>,
+		      <&iomuxc 3 101 1>,
+		      <&iomuxc 5 107 8>;
 };
 
 &lsio_gpio3 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 115 4>,
+		      <&iomuxc 9 121 1>,
+		      <&iomuxc 10 120 1>,
+		      <&iomuxc 11 123 1>,
+		      <&iomuxc 12 122 1>,
+		      <&iomuxc 13 125 1>,
+		      <&iomuxc 14 124 1>,
+		      <&iomuxc 16 126 1>,
+		      <&iomuxc 17 128 1>,
+		      <&iomuxc 18 131 1>,
+		      <&iomuxc 19 130 1>,
+		      <&iomuxc 20 133 1>,
+		      <&iomuxc 21 132 1>,
+		      <&iomuxc 22 129 1>,
+		      <&iomuxc 23 134 1>;
 };
 
 &lsio_gpio4 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 0 3>,
+		      <&iomuxc 3 4 4>,
+		      <&iomuxc 7 9 12>,
+		      <&iomuxc 19 22 2>,
+		      <&iomuxc 21 25 2>,
+		      <&iomuxc 29 29 3>;
 };
 
 &lsio_gpio5 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 32 3>,
+		      <&iomuxc 3 36 6>,
+		      <&iomuxc 9 43 3>;
 };
 
 &lsio_gpio6 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 53 7>,
+		      <&iomuxc 8 86 10>,
+		      <&iomuxc 19 107 8>;
 };
 
 &lsio_gpio7 {
 	compatible = "fsl,imx8dxl-gpio", "fsl,imx35-gpio";
 	interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+	gpio-ranges = <&iomuxc 0 0 3>,
+		      <&iomuxc 3 4 4>,
+		      <&iomuxc 8 22 2>,
+		      <&iomuxc 10 25 2>,
+		      <&iomuxc 16 44 2>;
 };
 
 &lsio_mu0 {
-- 
2.34.1

