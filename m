Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF732D0E3
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117668; cv=fail; b=VV3MP4U9YbTO6wZx84X5wBcxkW/CNqclHUtQPt4HypmeERZnFlVjPi6JtH8920o33wTZYF4oaFkTjNuDe8qwnxrnES49bj6f5FK3m1iI6/tJXOZO35epArXypnPK+NtepUsHyOjM8oZt8jRSn5booOzDe6zKsWpHyiQhv32erWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117668; c=relaxed/simple;
	bh=bGTyi8pDLuL2Oylplt0cO7TJc2mbtk8SoF8rqgDx9N4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KK3MHcm5X+NWweLJqWahqawYzIdJ3X6ftJCtDVUgQVYswZWoZs4U4MncGIQMJW7eWDXFTJUtkTwNXIOr66VbkkXE5NsHoWpd8guyHcSq/UYYr7e3PKjb8rqnY++d6zLSJEC607iGguwY/fg2xjVBVhgByjuZBo3gYTCmVGkeulA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZmI9WvRz; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZmI9WvRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ibq4bjNOGn/oqmuywlbA3D+ATAiURZD7mMV7ie6Hea5ghPNwiSj23DdrxgsOKe3mo4NKw/M2YHh7FQzCrNjYv2PMqhAJ3SQU2857UfTYcuQJbv6XtD/PJpiOcAll9Px9+oa7w8xtBlFMVaGWPMvQEPi61b2rU4rAlL5B+1IHD99ZotVOnU+/Xnpab151X6QHJxePmVzbWIGow/hqRfgX8doiowASJ+NSc/ivozg5tghzTkD2sIM+TfYbSkn32dEDCpGAmmjXaIIHC2i6LoLjDOBksC+hRazYANrmiyjAZ1UDBq5bH9PmRUIK07zx78X3xWxr1I7/f3u5rORIHBqgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvOo6OJNMSDwl2QZm1rHNpTCVd+89xm5u8AwLe/59M8=;
 b=rwRLoE28JvT0h75o4+cndmEhhACR6b9Zj5un3y6GZEh4xXg+BMfmF+EAhWBe6bXE14HLVjWYfKDk9FNtwOk42Qon1JNiDX652iJ404hl6+Ug61buV+xRV8yAHtTCfAETuPqdUFPuMPRT+R+1FCPUOaTJ1nHwaLkGjiY9mm6dybmnqLeU9IXYipLAA1vUQpCLjTNjZKrSWDHEy5ZZQ3z2DqsHkpDPueXJhoTj58TuWy0iZAS7HbQimgssM9BXACwj5EBNtv4Rxq4J6AjlhsYg6iBHfHiKTNJ9Zg7+dMSK1fZqjupKT3Ug+rf/tcNWWHr2kAGAcR9vdwG8Brzh9K5N6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvOo6OJNMSDwl2QZm1rHNpTCVd+89xm5u8AwLe/59M8=;
 b=ZmI9WvRzMh8K0UccEqGU9TS8bUlOEMLe6DReOKkQNg8H9gazQIi1d3R16RKY+VzFUzHEiP4CzFqQTBSLvsjEVgs4zbwhNEK+I5a9nOv5tkdnIk+CW7zFmQkCGdasNY0Y8KWwNBTtimaEgub+WW+DEHjs+npRW7N/5ZvCkHob20SjitKVSOboM2zyStAxaiYFebYbyYB7Ao3yCku8kPm7cIIvAvEKHusQ6QglMXJA90E9A8k35/j6ttDyMzeVC95eZV9MN4XLgx8QytaadNJiyWjL9LyDHrQWoTsP/hUuBkU0ze838wyq5U3/Fcm+WbOJ6fb9vbiwFA1jop5pWRr+Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:21:03 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Tue, 3 Feb 2026
 11:21:03 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for  eMMC and SD
Date: Tue,  3 Feb 2026 19:23:08 +0800
Message-Id: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::29) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ba1cdb-1daa-40a2-b88e-08de631650c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XNQ7LU2eeI+z3aR3GR//BtMN75KmEqOyx0UTNEHSiWFTVmfUH5z1hFRbPsw9?=
 =?us-ascii?Q?UpzgPr13OTGKz14tn6BLLt6CqXxcjnBWL9xrQtKNe0tWn48RbCyFvJTYngI8?=
 =?us-ascii?Q?ZbQNkBTpQ2x7g4g1W/DpbWtylr3D2GcD0xuKr9g0MkJ7R5qrJ6NUxrUMci84?=
 =?us-ascii?Q?uQp1lYHk2ql5qGqATTRqwn84bVkjzh3OYxnhOJ4WHLjm2Kf9zrsQkfRV96xO?=
 =?us-ascii?Q?U1I54xxbMRDG6zoubreg/dqzPX8Sopnt2qSLnMSsqJ9xlZ/KoqE1uAEhU60m?=
 =?us-ascii?Q?VOitxaaV8OiNtJZYX7v1MwSSE4puyXP2j+/kSl0dev3o+YUwAIS+AF+0cmbf?=
 =?us-ascii?Q?464x7fnfE0horDMqSGVmvQwR2wkv7jWxYYIpASCnYe/mNHvf1uSGnsIvYsu1?=
 =?us-ascii?Q?FFzGQGVl05VzL0wK+6fKYmpZE0TV/bQlZVhE6nisZq6kz8Nj0iDcZas4K11y?=
 =?us-ascii?Q?CftvT6nuMYMTw3DTt6Yl/PaJ9GHrrgK979Mk3a9C3atyxpjpQrhmz/7xdpII?=
 =?us-ascii?Q?AdjxOktz2GTV5keY8+5+U3DJuOVbFrwlt9viZbaLkXar549X9mrIif53chf9?=
 =?us-ascii?Q?VW0P3GcsCNmAwIY8qnn3CtIR2ictzG2fGYEMUBqzVXbRpxG8rT6n0QCeptZK?=
 =?us-ascii?Q?MaERVcpIk1oxE8KzT6aspyLauEucSuZny4eukxsuvplYTQ7WBMh6BePIpHw0?=
 =?us-ascii?Q?GzMCxuBKFjnkzqChOp5+8VsM05yNFZf4ZrlJzeQlPu2kbsKi/4vL93/JNFrd?=
 =?us-ascii?Q?AJ5Wt7NDn1EvG0DxfXAvCkh0SSL5hdybs5lscUVKZy3btJCgUZJ6hkfeYnil?=
 =?us-ascii?Q?jGh6PKiAQmZjmz8esQAvvbJd1UDIhuA2qfpm513w+6AsH20MFiahk5iuI8OL?=
 =?us-ascii?Q?A7vvXAyAdKdpmSCfYfL1OAxdUdVGR4mA6QpvM0QhamYfTGQSv/CN9oLCskvV?=
 =?us-ascii?Q?VM7T0LpGJGkRxGWOFxbG8eSOYYbZm6qyT2umjv3aQ+aOoPui/HkBsvu9L37u?=
 =?us-ascii?Q?rV3yFtQXAMNw3JHt/imC7Sh6sFctxZiXEnmpB0Lj1UmSNJ16091ij0ZJ9lTZ?=
 =?us-ascii?Q?hRNh36NCLZBLJad1F2z6PPfzAf5lYCcWQLULYj6rkP/wBTx8gb6K6OH4ZPK8?=
 =?us-ascii?Q?tu83gi+gmLnUcJqbiUO7aQ9jj/ihVQJDyGGN4VNbaJipFxWgKANnc7M1KYfR?=
 =?us-ascii?Q?wRNeVOB8HmOHiRY4eg0avwOmLfWpBvx4EUL1OAYIrd9u8LntnY+V1LpjRFS9?=
 =?us-ascii?Q?RlXn1SYIrFSUwauhG1Em65ycvigBVSKprZSVYlOJGiY/FbQaB8Ae8c2n85Eo?=
 =?us-ascii?Q?q/21Bmt/PFzB0r5YEKPduxUiRKdaI/8h0WzPD37e3L3MoTpYGB7VSM59uZVG?=
 =?us-ascii?Q?SwskZpu+q0UdZi5hNBd6gXqGhduUMjkidCOIMc8IQpC0HVEfoWttLMg66c7j?=
 =?us-ascii?Q?Fc4ClVtoaoQWWg9DIjpDTqxWUtiIYe6OOIG76eby7OYctPwehnlAi4Ij2iBd?=
 =?us-ascii?Q?JRqQwO8o1m2HfL3ddFjmQboZwy91TGRSzKDUMGJz5WV0LuywOZCeq6hPMFJ3?=
 =?us-ascii?Q?2D7bX7veEw9gJsA8laUXr3jwKtJV73qOtc+SaZUVocWxqxT3U9+mgil10jgp?=
 =?us-ascii?Q?vWRDMf5Ybr95nLP7TUqowp8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lzeJnXkcRWAq3n/Mf9gl/FTnCzyboyvWMGyB/xi/nwhcgyUzX3SLZQ5sxoB8?=
 =?us-ascii?Q?nVICJO8PznGZtiF9I5i2GZMfgzWYv8qX4KROqek4zey3kwgVr/Pm+iNH/tTo?=
 =?us-ascii?Q?w+hdH9AJY0QHZwOqQMyp2Yd+HaBH2hWPHM1nhiyJrfiyiB+c5haWVYB0fey0?=
 =?us-ascii?Q?a/M4lUg0xfEGMji+I4JBu2lOp8MKXHyFmbhYlFdOqBmcyjud5hSr0jdgYL2Q?=
 =?us-ascii?Q?C62pzigzTxr9YKw6dCU9yCbV+7fbt4EsBfTEpbU3AeWJazAlpXtfGOAVtnzW?=
 =?us-ascii?Q?bPk+uEGXY8wtMQRDfJE++PoAJqPc6ZHQaX1cKxtTW0ublOqjoHeg5p0Vj5U4?=
 =?us-ascii?Q?2A4wwMd6Itii5EBpBkXb85J1U0/57MklV32hdx4j9Rj/8Ekh6HDH44LO7Wey?=
 =?us-ascii?Q?CSFT9j4RwZ2hjXag6NaBPtewJzXEG8IvOwt4SiPTH4QEZMZb2yx+tkC+mqI5?=
 =?us-ascii?Q?baVQuO/Of3X8zymFt3BJptd53OSGjmsqvDcrgfyZuzJP5dU2KP7Wvi1iYgJQ?=
 =?us-ascii?Q?eMBsb2JydSx0awHsqXqDV64Mi/ZSq2wUZ4jBDUhVHLSpoMvs5BoWHVD/ittC?=
 =?us-ascii?Q?CXD+QsWZfGoAaqIhXLW4AP1KJ6mjAU+TtTmgKBd8ax8VcgZL5tue7Pq9NQWU?=
 =?us-ascii?Q?J8al44i8u3D5C4RjezP/WqDJ5vbW/Jn6QMg1+Y1v/Io0QTqwVA3WqaG1LlMR?=
 =?us-ascii?Q?q2hhfhCVHSh2kgD39Ekzm3kAX6VGHIpi5Dfck7uJ99FedL6t2D+ZXAQIIv+h?=
 =?us-ascii?Q?fNgN0rxvDZMTrY8s/QI7rTt64Uv+oxdEoLF5RLzoCq2ggHStch2oiZByQ7hz?=
 =?us-ascii?Q?zlxLS5lATqIejtEd9wVuhuc+O1veANos+IpP681mD215WZgddyUaHqTzwUbC?=
 =?us-ascii?Q?VIsGwrmCvNcNvn2tmc+G6/+9zg6sHJHccyWcQBp8iD2p3UhRHPN0jm+Ge41X?=
 =?us-ascii?Q?BQZTqaBCCPF5B7mw44ZLioG6VE0q0z5zPFCr+hQgiv6R7Ua7fWLBxUU4NOL7?=
 =?us-ascii?Q?VSxn35a5b5nUOIuTqvVHdGbALfZjjNtTMgxKncKkZL3WPAOuj3yRu3EGNl4R?=
 =?us-ascii?Q?01BFhTvZENcRF1q3766Kdmdz3MNoA/0d5o7p0/5FO0VguRfCCRzP9Fc151O1?=
 =?us-ascii?Q?ehb2FRzMJ6fvgoq2uhO8UUNVjkx3I83CyDE2w5ADqtgkXKiaaQzDoPeeSG8A?=
 =?us-ascii?Q?QgDyL87ZZwyWG9Lz2c/bb9dz/3FiSRR+p/6JzECsWqz79ePOwG+b1Z0jbtFw?=
 =?us-ascii?Q?MEWYwkQ1wxTVcmuh2Qb65tSWqI975Q/CO9f2/Yr+eGNlAOeiCf97vYJvhwu7?=
 =?us-ascii?Q?2H7OyKNFblLBvvSohAPQhrJjj6AfxB/MBUPaOKGoQOlSHXEXxqZAz5MtW4bd?=
 =?us-ascii?Q?EYnX4BttZ74iIntuUmNuJ//7ELzq4qLLG4MHId6qZDC0x6mg8/NF7gDjVy79?=
 =?us-ascii?Q?/G7PNIQ7zjgPm+rgrDrwV3HIwDnT+MMRbx9eZZQfYQsfr6bpFfxGDxJMOFRF?=
 =?us-ascii?Q?UeRo6WzVQN0MTuGz5kxrTjsoHtkjJUgJPxTLRZisKdeLrFH0++nRf0RXasNs?=
 =?us-ascii?Q?AxiRu83B6GQWypVjjRvVtcPNbl1cL68vtgVLnLieCmVZcr6BM/n4mkoLPuAE?=
 =?us-ascii?Q?ToHzBsu4vK0Jy2JC2hXV/06/BWuubkZ4tEfu+1IA7+FqlasCjSSC5hj0OvG6?=
 =?us-ascii?Q?zJGrBIiSx/5cvba8nU+oUdxWSdKAQSq8Ax2cNIQN0I2l1JS7aofuVU6S/ce/?=
 =?us-ascii?Q?g3bltxq6iQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ba1cdb-1daa-40a2-b88e-08de631650c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:21:03.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzBwagO5+BncZb8rhEdj+LNMK2J5bTI/b9PcFc01EVBobYKCqYpv+wNwayKwu5O1TpKI1MSyEAYdoH4VgEMPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

From: Luke Wang <ziniu.wang_1@nxp.com>

During system resume, the following errors occurred:

  [  430.638625] mmc1: error -84 writing Cache Enable bit
  [  430.643618] mmc1: error -84 doing runtime resume

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a wrong delay cell near the gap to be selected.

Set the tuning step to 1 to avoid selecting the wrong delay cell.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

Fixes: 0565d20cd8c2 ("arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board")
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..197c8f8b7f66 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -507,6 +507,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -519,6 +520,7 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	no-mmc;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1

