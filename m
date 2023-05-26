Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167EA27208
	for <imx@lists.linux.dev>; Fri, 26 May 2023 15:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nId35eNU7FLv8U5w5n8Qna+DFU9ldSCjPIRR6DaAmcJ01ITQV/Ey/Pj4BOpCrqkKemfZXZA+WcFLlxiMOUB49qcWlCAYzmTSL2OyZ8xAvQF9Q8uRX+NU3JYw8qtcoXriqhOknu/ayzeYRz49FWfPoGnjgjgW1elKr+th+/zu/U6ObYeSo9leOUQ25/M3ve36PwCeKaKhI65/ds0UR1/KK6eu1xqnVULVSTeIEfwcWtMBtxDblk0RnEJCkT7cN1hevfnKrSTeG6ze1N3/gAhFFTySqM2q1X5j3Gx2Fl8gp4AXhEd9PIh5N+nuXBp9Tr4uOuQcdCIjKraW4mzR/etHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfGmzVEEWDsTh24d441Z+l+CzpEdXosjCXdUngRgfYs=;
 b=e/45NKM3F32diAe8fpQL+/Fc5/nkMPQG/JJLnQb92TInCDQD7ao9GGtaKjc9RKVpn1NFW15YoVLwQGfl5m4Np3j9VoKReJmUnRStGwrIETk3uU//OO29TVpv/rMgIWgexRvDey4YrqE/uSJ/6Gnnqu5zKWRwSGElHZuzH9lUzN+N2SAfx0e67UtO9zZQVYFKQOo4t538WQOXGcGjD1ziWCS5etHrhn7H4mvOiQazZaf9qRg6eERgcDzPAu7JfU7LSiEfsOwehK/FETu7T76U/0DWh9Cem3U6T5ZB3q6g+ggBVs2hDhyz0eEYmdPZqbar6QbqADfWzuSgfsJI3jqErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfGmzVEEWDsTh24d441Z+l+CzpEdXosjCXdUngRgfYs=;
 b=L3E8PmzfJodJu6FypZ1cweacB1Rp4fRCb63FgcM1m3r7QOxL3kkzG+OiOZ8v0thRCIXsIhS2YGZhqKcuxh0NrjwdOkf4aHU+VLq3r4uAVl5ge5uPCMbI35WDd9aL91T1WxXlub5GOVLV7IjuKMVxA91Yvh7yNwjW/vD2tmxpojw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 15:39:13 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 15:39:13 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
Date: Fri, 26 May 2023 10:38:54 -0500
Message-Id: <20230526153854.469239-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e4234a-174d-49c1-745b-08db5dff5b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T2gs5+Yu5GaA26d2xcevv0Y5uI7TwB7m4hhv/cAZ6s7UwSP+h65CdAqtkc9LVhPK9joiP6bohuwhusYT1CZ92OaUSJN2/nC2AzAVil8wRlf657aAwqZyJ7S9CFga5/SVgfL9MFX5vV376waL/J8HOvmdDc7QpBlKGUTW2nUBhpz7Wi2IgxHTdHIVbI+b/OYSkfTGrEd0jptfdFeWjab1Zr58Y32z8bGBgoOwQAKZhEz4P1wCEAKKskuqG9LI7XjFwn1IUi+xJKZ5pOOQaw62wxh6QiLuQrZZ1ne12sxgU45vK+ODQr7YKQ1sTu3DqC5Yghn+DW6fKiImJa4bnLWh6Nc/6KbVlkhKFdB4651HgdUkhiElMMn075t38Jn98f8f6dTew2wQHSRkthtxurpTDsl53xCnYWPIPKtHT/F+AniHkwiXAlmqqrlEtBr1a+c44II/ln5kLh6XQI96jCeq1LMSdI76IXJ20xERSCEinqkr5K9VcptRWQzOYwpTmFcOTR/4jW4PcHwcG/bZceuEHsXRqWXqG8645bZprLw7kvVNeqTROi93Mr/0IueCsUEpQQA2oC91aR9Qa3t7mh2RwkAOrsUdCGdejwqNxBqjxgQXCbxg46KWq9vqPU9lKxFN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(44832011)(66556008)(66476007)(66946007)(4326008)(5660300002)(8676002)(8936002)(7416002)(2906002)(316002)(41300700001)(110136005)(54906003)(6486002)(52116002)(478600001)(6666004)(6512007)(186003)(55236004)(83380400001)(2616005)(36756003)(6506007)(1076003)(26005)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?57x0L8cK0a8AR7Bf+xM2EFuqp0UzG6OhRsfJlTA0M8BK8vHqkKzPkXBAqFtp?=
 =?us-ascii?Q?7/4f4Lrn1YWLM7T77mnN3XE+I6goaW/KaLPx9IOLosznEL2WV3t4I78/t+AF?=
 =?us-ascii?Q?89xv7DWpfehyFkQM3opBJ1oM0zMap3ZFdSXjAQ4h/m9UUubByr1anboq721C?=
 =?us-ascii?Q?BnMyQW5Ha+m3YvUphttn3fNQNTnUcJYkRlBJmpWZOASGDwcBFfn3ZJmn++u8?=
 =?us-ascii?Q?CKMo/IseYwgOi7zMRK+V+Tt0Q91qAydnYKmw5m5x8iaRqSeOp4N8/0sLoRJf?=
 =?us-ascii?Q?VBfwx97Yf491DQmXFes3i/TGll1fb2dOmzQwOrvP713oqI/oLIaJnGTwLR2c?=
 =?us-ascii?Q?GK2zMNACGHbo/asNs10Ba/fb4l0JsEGIN5e+CXkVpf6sz60M3aBMhvaBVH9F?=
 =?us-ascii?Q?dD+qRkVLPYMhB6XqduIBLa/5Sw0dXpIUqoemDMsssPSACfgpSvGsuFQGiqUj?=
 =?us-ascii?Q?riAHX3SKHEUXgulM66g1+LOrvZRdH2MJyYXwarXS5kJwOzDM6H6t/t3FE958?=
 =?us-ascii?Q?XFcKq+ShUv5G0WIUIfySGy82AsWKLgXGiFQuoMofEOEME4AD9qJ9aoO+Sc6y?=
 =?us-ascii?Q?ph2GFh6jxMqjuwjgcsmafXXRNeBnTBv8CUxVNy/aOfvQuOqmjD3XsS9cS1/D?=
 =?us-ascii?Q?0gpU1T1ueK3hAyoVVo325L30V1asyx7OrkTPsnFfY7M4tsRSLPLpzqQwSJf/?=
 =?us-ascii?Q?kE3RBywEWPEHyt7mFTr4ElViaqisxHqDV7ltBeG2Q6EQR0I42TQeimuWtFPH?=
 =?us-ascii?Q?u8lmWjOxHvH18Qe6TJk/NH1dCbyi/+sKuSN5w2rXFwM/mN2EDpp0mSN6sHQ5?=
 =?us-ascii?Q?ocup3+O0A9uBCd2c7xgC607TWaKJfGQ47AnMFXDNCseKhvVAPjcwnq79+cek?=
 =?us-ascii?Q?xUuLb8ObtZXVoN9exxlsvtBV8x7eRZuMGAWPFGlAnWLk5SptPo8DmI8piSWS?=
 =?us-ascii?Q?GbRIcKFcx+bN9hX5HirdnDvHhoApIhFqP6/Kqy7D/od8ycmaQQxIulUkGI8M?=
 =?us-ascii?Q?gYhksZ6+vRN2IWpPMdbO96xV+Sa8MrELqKQ8/PGqgE7jZvvqew+ZmEz0nzBD?=
 =?us-ascii?Q?t2GOjEN+5PvWQVHWSKO4O2k9poT6+QFa0OJK8+W4yGxOILpIiCGDRFygmHMX?=
 =?us-ascii?Q?hW1RAy3CsMK1mY0N/4vdTB0BccHGN4qaTverqlCTwz0p1gjBpAVbtBsWtQYn?=
 =?us-ascii?Q?m2vL3UuhZkyXOjXfBPeQvfJFXVY3pTry/bm0MDy98fvtEySeLGSX1iovEt5X?=
 =?us-ascii?Q?K0RYKH51CxvS8FlIdQtCkUTfJQwhUhiqJBAdPJjkdc3KaT0VMBQzun8MoPs2?=
 =?us-ascii?Q?2q8N+0PUq8cK7hI85i4/wPOg2TpaFLacxxlrFAVocqvPDw54AmEf/TPhz6wx?=
 =?us-ascii?Q?CfDeKSlUvSDquf76+5Y7lYXg2t1McLn9/4Mg7ia3kJmqG0uH2bS56n9CGA49?=
 =?us-ascii?Q?Ad17xaWC6tkItucZXgx37UuQV31QsbN0rQtOpSCT0NcszWvlX6tDrqc6YJPF?=
 =?us-ascii?Q?twKftvVGm8OaNVmt0F6Y8YlT/y0sO1X4lcBFrreZpD6xURSDigHUp3Oi+qdv?=
 =?us-ascii?Q?uool7nOPeGDInG+NvUvmA5vms9939SEs+o2of787?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e4234a-174d-49c1-745b-08db5dff5b11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 15:39:13.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5dxSf6XGeeiwyoQXEcKIiKVt6n5HsGHn0xbuMagPeeKpgnq+qxf/X6wPj6whLkEJrl/VIUmrRcn6UJVQarApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

Add the assigned-clocks and assigned-clock-rates properties for the
LPUARTx nodes. Without these properties, the default clock rate
used would be 0, which can cause the UART ports to fail when open.

Fixes: 35f4e9d7530f ("arm64: dts: imx8: split adma ss into dma and audio ss")
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 V2:
  - refactor the comments and add the fix tag per Fabio's feedback

 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 2dce8f2ee3ea..adb98a72bdfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -90,6 +90,8 @@ lpuart0: serial@5a060000 {
 		clocks = <&uart0_lpcg IMX_LPCG_CLK_4>,
 			 <&uart0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_0>;
 		status = "disabled";
 	};
@@ -100,6 +102,8 @@ lpuart1: serial@5a070000 {
 		clocks = <&uart1_lpcg IMX_LPCG_CLK_4>,
 			 <&uart1_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_1>;
 		status = "disabled";
 	};
@@ -110,6 +114,8 @@ lpuart2: serial@5a080000 {
 		clocks = <&uart2_lpcg IMX_LPCG_CLK_4>,
 			 <&uart2_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_2>;
 		status = "disabled";
 	};
@@ -120,6 +126,8 @@ lpuart3: serial@5a090000 {
 		clocks = <&uart3_lpcg IMX_LPCG_CLK_4>,
 			 <&uart3_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_3>;
 		status = "disabled";
 	};
--
2.34.1

