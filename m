Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2058.outbound.protection.outlook.com [40.107.103.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D224F2E
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 15:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRIRNk7tynQb2V75Fh+VP1jyyZaP1fq1dI1JMiM25ZfGz+wkRn3yUNLM7Z8i06POsn5mZVV1RbyFYSx1/O4bbavgrORNVbL8zbEemuzj6/On6qISYyg4KE4OuDMsFS8TE0aCN3LHvcJA5zaFVku76QCbE+mEf5BpqkH+44ajesc8LQAwjkJs/iheoH5fwNjD0fpoW9i55o5zgdQRw83jf9nhMelWXT7ZQtjlj3PSrnUBXN2pgQ8j+gc42X5VlYjDyO4f5L4zaBZFP+xKAmlRa7E0ktHEhbE16rTtv35kQLKqBBg48dIa+vMpcpJX5aiBr1Ng7DPMeiVYxXDgq5SGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9tbLJ09QYeGU25u4uHN7twnPVqob2xwFLaiOPPaB8Q=;
 b=hx8PMWbBK0dQgRRoKMtIjGad8PM2mvLV97Ho+PZF3+41AdcgIGCow6aGj1qobV8xSOd2dWAuTU7RlejFwRSSZzis3tctJGCW8wLrnXoxzpmiNs63jbMR897Mq/jgCTfLUmpr+dIUbw08hjdihMO4chh7Bkfiqtc95tEbqMWCpoHDAuvvtURd+MPEz7vBFeQOHNuK3ossrQqeltztIQE+xNaCejM0S+3mSe33u6mwS3d6KIL0QMHLKKCrAaOsIl7ZueQRy/1654IqvlzmzxCY7OyJSJd5WAOvXI6HHzZUDFaxrAW09NU7Q+u/6k7KMLtoUaMKMPyC1Dsop0wRXYoDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9tbLJ09QYeGU25u4uHN7twnPVqob2xwFLaiOPPaB8Q=;
 b=aM1639nPqDlm9IMqwVrd0X6iweCcxQgfbeCm3gS6Ix2eBQkKQjtehfwDa7XDLULg+bL0EF6FGi4t4HhK04qaPpVFWZM9HsI93GXLvp+CKzZVgKR3JbnD/Ob+18RwWYQ6SQtODP2gjcRy4+k3h7Szh997hhIleOh12LmEWufSXjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:50:44 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 15:50:44 +0000
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
Subject: [PATCH v5 1/3] arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
Date: Fri, 11 Nov 2022 09:50:14 -0600
Message-Id: <20221111155016.434591-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111155016.434591-1-shenwei.wang@nxp.com>
References: <20221111155016.434591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: c98d0ffc-246c-4e92-1a7e-08dac3fc7de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aBZ/BV0ln5uZTey0C4fxHRCt64kfxtjHWkvdlUuo5kymC22HYJlsUeobvjO8yTNZ4aTaODGGB3rrrazbElS/kiwghFsODmaIXQLqTb4sQxTUUJyafeG0rIGubBN1YgzGo1yVbKaA3AwWKxtfDLcSpPTqPO1csNUeW/tA6yZ3Fmy1HC4AC3M1EJ/sxwjj31uYhmbzSPKoEGUcVvrDg55q9Z5JNIpjDvuU+LyzNWvoNSos+GFv5VPE6uB7ceTAlVeFLfpBpgu/R3Z+ugRkU6yM4JZCed/4fAbrpj3dpg1zEVGoqQZYyMdhm2wRchlw0GOUiE2H8BC+Egn70Phk2THKV0FNXdy/cC/wKgzolGE6MSVVkqkECg6/1tnVDWt+r4WNxutO1jTfXpSBPBd3tK/Ws4KjE3YzlSSJt91yW5ZgEFHRMLfxoMdmcV7m7Wo3a+kzBeBFRPwMtBm7moEBxG4QSbiw/hOKURqZXKgfZMRwkGTYx9ZjK1WKlkatNoaVwTFJPfV9fjGwtdQsoXZ+HcVEcxQZU3Ax+ZN3T02bAV9HG7DWVrWyLO6E6keU5vuFdqMJZJ4YWl/lCGUh8a5quGgyxUnmWubzRfenoNM/JfxIL7NFbhQPi6rmjsU6wiJItK38KyJg5i9XsPcmSj9uaGnVvyDqCeJ3UImtzWlGIBiHfrb9bVyeErNLUsTs7iztqQFFDal7XIDUi0Y+YDfeTbcXknKcqrxxgR0OOX5yqX0uvTsKXnL8tbJimgivuFO1+4Dv664QHN4D8xxGbL0H9GC7SHUAZ7TrOImWwvNgLtnsbNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(38350700002)(38100700002)(66556008)(66476007)(4326008)(478600001)(6486002)(66946007)(5660300002)(41300700001)(7416002)(86362001)(8676002)(6666004)(54906003)(8936002)(316002)(186003)(1076003)(110136005)(2906002)(44832011)(2616005)(6506007)(6512007)(26005)(36756003)(55236004)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/rssal6NtfqdgJR0UKhA04Y+ZWcQ0mAtg02K8oK5YFtPTe/uiRC88dVMJFOn?=
 =?us-ascii?Q?xXwRcBSwwxgOmykxP5mlNXwfsUr3QWphiTYvHzc8+Bj7nL7fo7EmNIFfgMCG?=
 =?us-ascii?Q?p7nCYbOvFyUa2iSQjgRxKEioCi3VWFGBOERFKO4Rm4vuI63WoThFrMuIim+a?=
 =?us-ascii?Q?v5XKLKOtwhD+27lNcw7edet8hpMGhmozn7d/un6+z/gPbmmvqc4HXt+3y0CG?=
 =?us-ascii?Q?hWe6yeztLb5GqsNR6XUO9YGluzetXjRgeMhOu5eb0fS0bS/NZHXuyrRmxdQJ?=
 =?us-ascii?Q?IlMjlKM91wxn4byDrcrEDaKwGKw1qUYBahosq0tJA2VBFbqBOnwGRq+uz5rx?=
 =?us-ascii?Q?YkmPdnhio37QLoSKnHgSmT1cDNQumzCAeI8+8h5DS8ImemzadMp8XTVYmmIp?=
 =?us-ascii?Q?3nKdNGoUBZnw2TkRjBWnh6YDcGZhWzWpc9Djz5aUkNH5wG1LIR/Z4SFAjRue?=
 =?us-ascii?Q?txsSffT3bBIBClGqTfibscsEaaedZI0sJ38//6a9eXtRdVOAa7fQdsQc3nt1?=
 =?us-ascii?Q?qyoDVk+bhEDz/SwlHZstaQ+X3z5k4skmQtZ9GYV8SNwZkEebP9YaSk1Rpa+E?=
 =?us-ascii?Q?dK4EtEpvB627DiXvwo9G9aS9k7xAoGMa1ksvC20WOGb6hpfJs8N8wN6QX/a5?=
 =?us-ascii?Q?HNqkIaJOfN95wWI+pA0esOcxA/F8TOzLCa6oubsg5sJlYjGJ9yg81X9uBfv8?=
 =?us-ascii?Q?hsdXQnqA/Vwx3Kmlxj12XSUQQbAMR/6zPJZa4OxDljmU0bO7WlCn+zGDi2tI?=
 =?us-ascii?Q?znGRaPae7y5LM5p9Uu8xF9LNhQsOnKfbByrrxrPwfoH5rKeWonLqwrAreoLh?=
 =?us-ascii?Q?ZL/8wv5O1Z2MvtzRgzenceCZbbN02DiBokMQfBDdeGktNjAni7kg8XsEWeGA?=
 =?us-ascii?Q?iVdWBGvMcNsxxnS2RvMQnu/dsQPpMRNdPK1OA4Hs06Cr+nB97eQJznU+cGzq?=
 =?us-ascii?Q?QTcZvLlSBdmsDApuqKcav/cz9W2tKL2ZVnovqU0wmEKFfw4Tsh355PrAugoa?=
 =?us-ascii?Q?farC3KL5U8FmSzzNidZOwLT8UaBrTSA5YXvRPO8Yt9bttM179uS0npSC+MHo?=
 =?us-ascii?Q?S6FJi/qe4ZW5sOcZR9ki9Al0a891Uq0IQXyKvMfzgHRCgSATuKj3/txLEea9?=
 =?us-ascii?Q?ppNCNf5q3asWVa+TpezQER3DeJZbHaZ2SDN9nsxt/Kxa7XMOSc0jTGIjabEu?=
 =?us-ascii?Q?KQ5Fe0g7pr/WenU+wPDVJJYytOGq0+8DfWPX8O5kz3cVcI/9AqToPSn/vmmp?=
 =?us-ascii?Q?4WuRVrjqV9357X9auOhbzG3kHaDbWGz491TZoqQwc4Ur4+cnER/JHcKpVjsg?=
 =?us-ascii?Q?aaviLJ89uiWrdYVBFXqu8A2z8mo5EyxQUwQLpUccpv6UTeLFi/0CeBYPPBFF?=
 =?us-ascii?Q?ZrPZmVbl1fA3QNQywONKwDFLhcihWVe6BS95pvSjBDUdwm3qf7c7iwtvmpSL?=
 =?us-ascii?Q?94EuM1OPslhAHC1jz0nKJdeMXQagMf++OWg/wI+9nzFujEgj1InYdFkMITsH?=
 =?us-ascii?Q?+hJIo4NQJqqYrWrXtcDwFeV1Y4ltGSkuQYo3cMciDP7/2hteCtXYtfhm1iJh?=
 =?us-ascii?Q?+7RLG55Umi06OgeG+z+HNdofFbosDhkYGqxv2o05?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98d0ffc-246c-4e92-1a7e-08dac3fc7de7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:50:44.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF3CnVsDPV4MsSQGhyaaawBnSzY8PCMWspMIDCZB+n1zvkCHPN/Q0kmAlh6K/OMFcV5ZVf4SL5ObfI4LkSUFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

add gpio-ranges property for imx8dxl soc.

This gpio-range is used to record which GPIOs correspond to which pins on
which pin controllers. The GPIO to PIN mapping will be referenced by the
pad wakeup function in GPIO-MXC driver.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
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

