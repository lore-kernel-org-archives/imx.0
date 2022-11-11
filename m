Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2053.outbound.protection.outlook.com [40.107.103.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF78124F2E
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 15:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmMq+lWhquVQtI1/CAF2lBLsinh4TDveoHPiOXeVEDZ9r+F2KTklJG+fh2YdIQCe0Q4i6Fbw5JFquC9/4AnwcTKTgAgMJX7YgR8WtELgC81ZA6xJIPqG2yn/D2nl3vcN2HUfx9N/bMIqZ1x0OO6qIxuG7zni5IO11oykBtkHYQFanKfUtu2gzp+QUjrpes6ykP3KTnvhrQ/H+bbfSyaMdSRQeoAmEmS9hHcTr0tdrQi8z2pcP6llrdH7l+6k125MFUe+0DG9Epwf0cjGh4s08a6z9ggmcgbAGhsbRREAIXnorJYYjux2Y6kgHhkC0CJZKPpX2u/qTPuVjGV1VflDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qDDbfJ1kpiVV1JtFpBx44j/WAocFwMV7LHVzKKppZs=;
 b=J3sO+ojmcl8Cc9LO2cIeSgzNr3roB1dsldQ/E1HKWtnqaZ/z1S/rK5SzJum8rNjUx8InsvI3VgbyaZCJLWjmfxI0JEMkhCOUqLyYnA4UGYeV72fo/i73oLk+p0nLkDuvaL4vvXdMeE5nkFdvPq/UNXDBS3eMxsXSCXzRomSzsHuY/6WZ9OSWDz3NHIG/LkXSTpSVF4QFWU0C5HROqno0UPAK2qtVTnsObiH8ulR6RpGNsmERZX/Mv302Yct3+6TNB2rPOiiazCXXd6NZeUgrWki9F/L97MVCLOkhg4z36EFZrdNY29fgb87Y5At5RDHAJ0XKlpMR38uMlTucrEzXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qDDbfJ1kpiVV1JtFpBx44j/WAocFwMV7LHVzKKppZs=;
 b=dRRQUt+zgilCb2GGJ1R3OpqrXx09fqhMvVZZAMKk3wBo2NeKGeEEYXGpnDq/5+E1/3FoHlIjR7qFwLWT9nzc+13c1hu6aDQLeal2meJ2mv7As+xH+8V8TOpQ9WVsrKTW2CTW/xXg1Jex4+fAFDkZcleJPWU8DmkLLbARc3CSV6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:50:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 15:50:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v5 2/3] arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
Date: Fri, 11 Nov 2022 09:50:15 -0600
Message-Id: <20221111155016.434591-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111155016.434591-1-shenwei.wang@nxp.com>
References: <20221111155016.434591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fe82b3-db28-461b-886c-08dac3fc81f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1FYRRcIzCER6xIzzec1fzigr28Bsdw7rf7IXopkLg/stzx5JQa6AR+PbRCtFcioMc89YEcpDnii7uzloNng07lwN3luEFBNMV3Nyhc7sk48w3kxTP32QnXwRVTSbihzkrm1AyIZuCTSy5GztUeuIiEVMQV+KEvKMHX8YqB9Jc9PYietwUoRhPgvzj0uDw1JFaNfUEd/WfonxXLiLkh7HZcl+RRB6scwWMjmoJ8+bMaoO4oXPKBxuENQCozuBcOlwY4hlOl5Kp1C6jIsRBbWg4bCdWNtaWSo15UKnJiiEn2BMUMqis+nYbeyVm0PSEGzp0rpdnGeMM5QSg+q6rL1kOoIa0tZJWqwiHlFr/UYCFt/JFdtrC6Xzf9P3XZ6ytOjQf6imAu6lRNZm6LsBFYL6+jbRR2su6H65bkMXtcnG1jEbegHyzo8xeMMV4C3uWCfFHnUo+QnEo/4cbDXblcE+705NALtduJFmrHhwYWZ5Qf7HIYCaRz+kWZCu3oPPdv4Fn67qhq1zEhXvVJVJTD/D0+sQ+Ujm26dYAJDvce4nU+kYd1qAe6tnjejTjmsjujbCHrykmQiDylsTud/bGDRxaqw8oefLR4vNU3u0ZsgJPeBbj+q9rmDSmvmFQF7YKgaQDst8Zzuyh2D1PUuJwoIpfW9AuL0xEFmVkVJmNvOpOGIs3aDa8NZEmShZSRVCXX03w8JUgRQi0r9L75eKg58Z5d3UWLtaEJcyrPBreJ0gLIH9uwUoZmbBtyXQ1kyNZd6j3WA5MPssPBVryZ4dg/82V0DIoj6hlOXSFnxnyvgBvJ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(38350700002)(38100700002)(66556008)(66476007)(4326008)(478600001)(6486002)(66946007)(5660300002)(41300700001)(7416002)(86362001)(8676002)(6666004)(54906003)(8936002)(316002)(186003)(1076003)(110136005)(2906002)(44832011)(2616005)(6506007)(6512007)(26005)(36756003)(55236004)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DP7zOCJHZ16CMlKQd2N8xkfCu3NLr69ZUU38OmNAoIUywm30kEASLyt+pCsk?=
 =?us-ascii?Q?WbZo1/iwPPu5g5rIxDr48d71zEoeS4HPMvKTfJvWTkGyRtiWlV7zBuWGFYyD?=
 =?us-ascii?Q?roCW+gg2WlN33AfXmxpRtggQxXB5rA3Xj86aLcNuPoESfoJhH0vpV0GwNJkb?=
 =?us-ascii?Q?YcEyRr19NT/+udanDBJs2iUTwuxUzvdKMlMMbaHR7RUitCWZcDySiNJPgO5X?=
 =?us-ascii?Q?giOc5iFQQxBniu1tNavIqOqWnNFSfoKlPmUsDwNIsu1redU8fr6qa006k+Ar?=
 =?us-ascii?Q?9PWx3jljk9Zya8FJZ0v/8owm8s3Cl77Rb4GYbhrDUDYZ/LFhEA9xYJYL1NCo?=
 =?us-ascii?Q?AvKK7BcpVPozw+h2Vcz9A47xmwhAg8GCVNy6dRvBDg+sZjmu/l2kCTjomv5t?=
 =?us-ascii?Q?DR3aAQkwiBWm9yCNXgCVyiLkSeEvvaCDZV1GXF9F5p9jrqEkRrSnn+bpO3wa?=
 =?us-ascii?Q?LthZ5hqC7uFwVSZtAvM3Fh2mA9wJF0ZldyqcIuJpTv5V2/dv8GiyQxGKjGxT?=
 =?us-ascii?Q?ndmmdgdmHRrQoOA2Ov7F5vMkbqHgdCx0+VeAPB2A7pVg9kBdcWYB+Klq0k/x?=
 =?us-ascii?Q?J/E4PxTgS/YzG0eObRqopu7JjbKcdvZvBQMwhccOT0hmsGSmpG/hP9Fgf401?=
 =?us-ascii?Q?gpDAlu54AbwdNrunZ1glQKLYqCX/9TZo1AL5HImy3BOQ3wPevktPEITqOoX+?=
 =?us-ascii?Q?qJhYITgWg2yy3UJSMOp3rlyIR+Gnbq9ToJMCD0GPrXRXGfuhpfQWNxFUGWlt?=
 =?us-ascii?Q?3bL78J8105scQxDJrgy0HfCFLf+tqcVT9ELpK7IR2d5exyKXnCkdidb8Kp0I?=
 =?us-ascii?Q?qevNRgN8iaAgqODtfw2uvfVE9rj6SQ6f4m6Gj8PSh6WmP2ICEvdyCW8aayzt?=
 =?us-ascii?Q?fXhoOaDUvrBRhReFLRcNq0YWO+okT3qB9Y+K0Uc1P5lAWswBnEDwm/u3vgBI?=
 =?us-ascii?Q?gVpYPJuIMh0vdqVIY2wysRkpSO9fa+Ag+OavVKeFGQw5TZB2mAZmUG1J31mw?=
 =?us-ascii?Q?bLi7zr1BHiuKpBRoLwudXTnTcYuXo7aFr2Zc2QrPJmGlDmoisCa/okMRVXtP?=
 =?us-ascii?Q?SYR6hQXIxJlkwMZDKw9KlKgsYaHdv3xBgtGiqDKrZ2VZWEY++CVM1CAZCPlQ?=
 =?us-ascii?Q?S2Qq3Z4LdtQ8+b0rZRmjsdOR8rBjK118+wwrV77433EK4fsIB9ER1U7Cp8hZ?=
 =?us-ascii?Q?jZmSkfF4y99MxN+cDDIUIYP1WBZC/x3kU75HlD/EPSbGI7rMnJEr0ZYS/95l?=
 =?us-ascii?Q?8ak0Brwd00EjBpvWy2kFlnn4KKCxKSEpy1V+v60gDDx15dyrfUpz+U5xYmTz?=
 =?us-ascii?Q?ZaV9BbbgoCXDYS3eZAoGK5eAZjjoW3AfolTjH0xJr3eVmQC8f0u9shKKu7k/?=
 =?us-ascii?Q?cdAYtKUfIcFDtxZ+UKGDOZeQFKr9ipB/Y+mQ0LB54n0e5t5nelS6p2av4Qod?=
 =?us-ascii?Q?fz8NlFFxfKIAHUbegnn9bAGoC9WcuTXOCecNeQiO0rsRsKqhE+IcrKwdnZix?=
 =?us-ascii?Q?i99TZdYdxD6w+TD9hOLjqP+/HTWbyhMVURgaTz6dWqkvtCs2mDquqwBoMvji?=
 =?us-ascii?Q?NIm7NRMl56/e3nFt0wSA1hwTWlTq+rCaPjE5uU61?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fe82b3-db28-461b-886c-08dac3fc81f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:50:50.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFJA+8Q8WLqfCunT2PTQsMsSAnnBhuSrZ1R3h7pPEBcpeCefZAOtO2UdYyy0iiL63AjuFDMIgD31cqqf1Uqjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

add gpio-ranges property for imx8qm soc.

This gpio-range is used to record which GPIOs correspond to which pins on
which pin controllers. The GPIO to PIN mapping will be referenced by the
pad wakeup function in GPIO-MXC driver.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 .../boot/dts/freescale/imx8qm-ss-lsio.dtsi    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
index 669aa14ce9f7..b483134f84d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
@@ -6,30 +6,68 @@
 
 &lsio_gpio0 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 0 6>,
+		      <&iomuxc 6 7 22>,
+		      <&iomuxc 28 36 4>;
 };
 
 &lsio_gpio1 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 40 4>,
+		      <&iomuxc 4 50 12>,
+		      <&iomuxc 16 63 8>,
+		      <&iomuxc 24 72 8>;
 };
 
 &lsio_gpio2 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 80 4>,
+		      <&iomuxc 4 85 18>,
+		      <&iomuxc 22 104 10>;
 };
 
 &lsio_gpio3 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 114 2>,
+		      <&iomuxc 2 117 16>,
+		      <&iomuxc 18 141 1>,
+		      <&iomuxc 19 140 1>,
+		      <&iomuxc 20 139 1>,
+		      <&iomuxc 21 138 1>,
+		      <&iomuxc 22 137 1>,
+		      <&iomuxc 23 136 1>,
+		      <&iomuxc 24 135 1>,
+		      <&iomuxc 25 134 1>,
+		      <&iomuxc 26 142 3>,
+		      <&iomuxc 29 146 3>;
 };
 
 &lsio_gpio4 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 149 3>,
+		      <&iomuxc 3 153 4>,
+		      <&iomuxc 7 158 6>,
+		      <&iomuxc 13 165 6>,
+		      <&iomuxc 19 172 8>,
+		      <&iomuxc 27 198 5>;
 };
 
 &lsio_gpio5 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 203 1>,
+		      <&iomuxc 1 205 2>,
+		      <&iomuxc 3 210 11>,
+		      <&iomuxc 14 223 3>,
+		      <&iomuxc 17 227 2>,
+		      <&iomuxc 19 230 5>,
+		      <&iomuxc 24 236 6>,
+		      <&iomuxc 30 243 2>;
 };
 
 &lsio_gpio6 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 245 10>,
+		      <&iomuxc 10 256 12>;
 };
 
 &lsio_gpio7 {
-- 
2.34.1

