Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31973BD226
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768767; cv=fail; b=AJxGSToamGOhtNjIIMIAFenOEG5Z0wv0xXzsenJwOjw97ABk/A+snLTUpsky9EMkLpt8MhoU32MpKhawuIODeFsoJLZcY5DM6BcYVejSffoF5uPyfPIMh6GOEygDbDpfic7CSSED7huUOUSJ5V1pWlDmx5EQsLi0WVyv0ZP5FEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768767; c=relaxed/simple;
	bh=hqdgCVS7umHdnyDTzltYsvzAnmu3BnAQBvZX4o1dKSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tCEuvG4rE+8QBN3rjxGrgin8HBLR3gSckXiyCp3VKOtR4sRbXTlt7/ZgzXUUkDsa3ERUJ91ljiSzr7f8s7bOz3xZTExqkz+M8iv2olGHDEVesvsmddNmgmfauKqlU12IAFKN3FmXAd1aY7BiqDhPFC6QBxcNKeuJo1Ldmzy0/Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dKsD9lx3; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dKsD9lx3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeAbShuATs49wH9Lkgx9JQQCVYNCJtx6q3SsynPFXFcCQbtMKcy/UIyXAElzXL1smMflJiB5amc5ik8Ql2+ZMlzZjSxrSaKJ9Mkvzv5k8GPycODk0ih0/u9ZMF029dt30mCd4qOid3CAG+09TK3WJYU68ESKpBKYdj860MMSMpBVKMyplBtnYLicnajqpPbYa5kCeJEs3/OLHxXsjYpGcZGtvDk/+oOrytRY6siTInAhKF52+WhZmtQVdfzZjnwNR9fABqH3Uvh6vi8aA2d+wNMz4XVqV1SzVWBXHfLszxuyX5stDaND/Yl336Cl2l2/HtxGzkr3nRt4QGg6LTQChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrOype+K0QUXhKICTc6Hgc4s/s5wT4ATPvUpq1A5jZs=;
 b=xSkI0PBx/6Gj86h2qMlf07o/QeDXkvo8NS7lo74nogl8FKz5DdRZVc0CyQV+594y+3kaQxfagdCoBHCnkZ+hM/BzN7CmpLquA0zCmOZCOPMsA1+EWsfLo55LsG47VpgsfOgJ/D41bI+pqhsPFiKhWtGhZ5JHlHWLdTPm6XOzfz9iF2TF3BdE9rOf5LPEMi79++GIfNMNTSNo9RIVwFvffGvqdS744NczC5aeovvWZG8h5LMvSMyNL2bx4J4A/x8GHFKv1RV5yB8DVu0brCqxuSif0Da92J95XnvqCRx0Ig23Rs+QJUoRmlPl3z34HbKZzUF/C8e3v6TSBqlK+1Mflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrOype+K0QUXhKICTc6Hgc4s/s5wT4ATPvUpq1A5jZs=;
 b=dKsD9lx3IpgWV9kF4GTWntvphyqeoT0OINgUni3vIjFL3mNTZZE9oyT+uMI1T2fEjeFv8BRDpDoX4KzdMsX5Y3sc2HcqYv2W9BNuLh6JP+lrxEVF4/9Eb2nhqrss7oPhQZCnl+ZeBBsOw+BYQgWtpxzXTnqmuU0btp5qIr7DyQyDtVEQtmfmtLJF3rSayWL2Qch9S3Q+tQmdBmNNchzFvkwsxh0otABNsQAUZ41YY9nf556tFffQPwG5lNLKaP4yanU3cr1CzUMb+S/QIMI+IqrmlPzZqAHyrjZ+HY8IgBz5n/AArOHAt1wDVH+yFDJK4m+jG9IVpF7pnKXGLt0z9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 10:52:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 10:52:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to flattened model
Date: Tue, 21 Apr 2026 18:55:01 +0800
Message-Id: <20260421105503.1416566-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421105503.1416566-1-xu.yang_2@nxp.com>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ba2171-b4d2-4291-3ebd-08de9f941dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/RJFJPF62ckO/QSbWkyOre2PoLEdfM2zjtPqIhIug5e8DODTGN+DYEDw1tMFwuDugBSCGzGK3mmKAZ14DKG6s2TToQvYq9uX3+Gf/v0byroe4K0xutCMEXgUe6Xfx3MAb1W3m1RDCFySsquqN1fodL4b3aqf0FQdwJI7b2/5vxnhBYtvr2vDgCvExIUwYPJwnIZ2yjmr7wjeSaRX87WopTTDfqzGi2Hue1Kk/puvpYdsQFT4u57MmvtynMAyQ4w3asCvaQ/ugPQ5F03KwWHMQbezKOAcvYLt+gCQTyLC8DEMyu5HU8p89j/URudpr9nvMHVqrEGFHVKV+xrFGIwwClPkOJ1OsDIK8NlxVVbDwpmtGS9dEpkVV6f2xYBsoYSSFwzxjr5Z7bdx+XfS7Xoqs65pG1V1/DQEi4+FF/rhhCH0w6a/8bkU7mC2cOZvmxqSHiM0kl4mfxz9TIi3Yfq62LPi8QJ1q0Z4H1ed6z2f1SAIoEqszmd11k2lNpO0IrynXVF9YFwoGVx2Py6gpoybUdhcoNrFOo0mh4D6NodhqIx5Q/iC0ydUNl979HJLUrb3B6ozfUBa2wybJhMcTPiV0iNohX2bNvSI+dHfTLLuPBqQkCpxMdAyQA1BybXQkWG5kRlGw8r6Y10jdr/tJvAP8J9IifgTFOCiujdpn7gwKjo/Niadux4MKDxsfJs1I+zjIqvsAouka1vinbqL6MrdReD+jNkRla3bnCxpRIrVINMc494ksaWS2A4pdhxBhhd32SfTCUzIBAg4zPaOeGusf/sh5xoIyFN5UTvKYQRYZ5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gcInqQ96METfhr/11NtFXOb/47yaud/ILr4E70ClFYyf370tXjeMGShlzsH?=
 =?us-ascii?Q?S+MFkOxbXV8E3SGNF++7+FOZPy7AYVpWj4V19dhz/O4u81S5hZAQA0Eu8ElQ?=
 =?us-ascii?Q?df0e/A3OBZs98eocC9x75rBKD4wJO0jD/UYki7sGZxHyHYtsWi/wKNYSFE9e?=
 =?us-ascii?Q?8R2l2/31MSFXh+SJ/weJOieZc0o93/v5xbdeukH20QxKns1YvsEFUCBMROwS?=
 =?us-ascii?Q?2FnDOKBRXDx/mMnGPu+mlsXd9gu7zT4EUffGHuMsz8llIdbWLamAQU1J5vQK?=
 =?us-ascii?Q?dkGSfscJMLoP46fr12q7qOu4cXTmSNX///UiWmeQshRNqHCszXtdvAQZCrRb?=
 =?us-ascii?Q?ovtq26PLVS5I/k3SpsjfUVFwnTE39IJBV7rdiVM+tzkShP1GtSzGHKRQkFpd?=
 =?us-ascii?Q?UFFBGmYgoO2aeBGqx5enfreHZrSAEkP1netUhGJwQeWwBdAoVn1sEbl9ZX+l?=
 =?us-ascii?Q?qgdQJwgXiXVusvd2U3Dh1zhAb6v3PGU7KXSf0QviYVVTdlnk5311dZY0ATUb?=
 =?us-ascii?Q?q1CyU5N4pG9XTPIsRSwf39yfFLP3VXrT0v12apYsUVusHeHQN1mBztuki6VF?=
 =?us-ascii?Q?BY9AYETTL8Ny/2Xo86mak5X60IFfNTRBM5Ck9j1vbJC19aLotUu5zmYbvzSf?=
 =?us-ascii?Q?vmfpT+kQ63CB9S+nbHrdAoKg7yp0dTo+VaWJ9/sLaYEzaKOJJBeOGbEExSZY?=
 =?us-ascii?Q?CxtpQoBEpGGVNuj8wSQtx/T22lhNt0aoeBTQmgoCXouUxJpZ4PC3Vy1RRnnT?=
 =?us-ascii?Q?OjQKMEZlTSHqmD7CRYJ6rd/nJ707/F8EQSsNWgbF17/jHVcfX0n8SGr1d/dB?=
 =?us-ascii?Q?/wsgSC6FnKMGwTNv5fjzdQQAwRj9oeDCP/unZHNt9SRmW2Ns1xMsfebs8XZC?=
 =?us-ascii?Q?I49dOdh/PTIq9PtLjZbR7L3hw880MCErWtPHnzAMqosJiNUmaliVB281fPpR?=
 =?us-ascii?Q?w71lTcj2S9pdbZ7/XhK/+acDdYjMyWZsr8I+BsvezAC7pdYhW4VF36ouyfeG?=
 =?us-ascii?Q?JmFql9pqrCNrAam8L5prgCwAqcqeGCDN28qK5XiSCzhlAun4iMBUt4X9tr/w?=
 =?us-ascii?Q?qBPAHXxnoVL4ZXeysTxYqPOLNRZ3iKZ9hNpvxAIpTdt34shKHDpFXb13WyYI?=
 =?us-ascii?Q?0PSfBajpu5bnEvWjZ8giTpF1xfd/ohtklfM5nIdYJrh7Bf2kiplRYXRyBKeT?=
 =?us-ascii?Q?yUbnc3LEQRnbmGTF4yblsocKPsYCuW+/vg0exA5am2nKUU5bFOLEQ7ai/OKI?=
 =?us-ascii?Q?ACcejkLcyAAluvE0tZae4fObcYi5d2vClhTIJo04IXHKw5fzYG+hCxV5o5FX?=
 =?us-ascii?Q?POA4cRt5WBy9GOggthNg/9pxUdhH6XmEvYEoRWQVwxJXaJ5peHRpneC7CQ8y?=
 =?us-ascii?Q?vLqcvQHaRFMLymIcgCPZr/Tw47IDBwIGh49d5YBNSAruhHk6yGWlyhGCWRdQ?=
 =?us-ascii?Q?2HKNC3ivyNU0W51vMbrvifCeAOXFgAATAFr3PTuCdJ6xd3PX9oBFK5RocLVz?=
 =?us-ascii?Q?C6zODORtPXrG2fcu7gezKmKLev7gJa9SJeCjJ2JuwLMFkcnE63n9NRmSxatP?=
 =?us-ascii?Q?efkomVOOxTnwpNlxga+UdqlIHxSffQ4R12zfLE7krsZqD7vApWbLiW5hFh0M?=
 =?us-ascii?Q?UrgRSs4q4NqyhicVR3Qf3qEqjJzW+1qk0sGYm5imYjw3WiFqYpjJCl3aXN3W?=
 =?us-ascii?Q?eHEiHe8zO9TCXys6KdbpoFVmCMGAK5XJ+67NUhpJRSe5DOAK1h81gStfua+H?=
 =?us-ascii?Q?J7MXaNvHYQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ba2171-b4d2-4291-3ebd-08de9f941dcc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:52:43.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57wnj/jy82tVsE+hyw5KhqqokIeqtztz08vB6VLP8fCqKNXARqcZMD4lPwmGdWg0vL76hBluX1anKW2GorYSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270

Switch to use flattened model for USB3 controller. To enable USB
controller with restricted DMA access range to work correctly, add a
pseudo simple-bus to constrain the dma address.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 48 ++++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..91048501a692 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1772,45 +1772,45 @@ smmu: iommu@490d0000 {
 			};
 		};
 
-		usb3: usb@4c010010 {
-			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
-			reg = <0x0 0x4c010010 0x0 0x04>,
-			      <0x0 0x4c1f0000 0x0 0x20>;
-			clocks = <&scmi_clk IMX95_CLK_HSIO>,
-				 <&scmi_clk IMX95_CLK_32K>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			clocks = <&clk_sys100m>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+		};
+
+		bus@4c100000 {
+			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
-			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
-			status = "disabled";
+			ranges;
 
-			usb3_dwc3: usb@4c100000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x4c100000 0x0 0x10000>;
+			usb3: usb3_dwc3: usb@4c100000 {
+				compatible = "nxp,imx8mp-dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>,
+				      <0x0 0x4c010010 0x0 0x04>,
+				      <0x0 0x4c1f0000 0x0 0x20>;
+				reg-names = "core", "blkctl", "glue";
 				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_HSIO>,
 					 <&scmi_clk IMX95_CLK_24M>,
 					 <&scmi_clk IMX95_CLK_32K>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 				phys = <&usb3_phy>, <&usb3_phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,gfladj-refclk-lpm-sel-quirk;
 				snps,parkmode-disable-ss-quirk;
 				iommus = <&smmu 0xe>;
+				status = "disabled";
 			};
 		};
 
-		hsio_blk_ctl: syscon@4c0100c0 {
-			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
-			reg = <0x0 0x4c0100c0 0x0 0x1>;
-			#clock-cells = <1>;
-			clocks = <&clk_sys100m>;
-			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
-		};
-
 		usb3_phy: phy@4c1f0040 {
 			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
 			reg = <0x0 0x4c1f0040 0x0 0x40>,
-- 
2.34.1

