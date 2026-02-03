Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B833438F
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117673; cv=fail; b=j0l/etqyluOm6N3Xy6q8OJZ4aaEJBIGbR6dgvvgeH2irMeV7TxijGU/iE+mV/0LlN3HhgIoC/rMut0tJiMZb9xFXkD8dBpwsrUaLzPky18zXy4pQGJiFCW52DWQESshmBL6b57qYcY3EeAr2uNyndUwNSLTU1Xabnmc+HKXbRlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117673; c=relaxed/simple;
	bh=qckAKAo6BlTPJ5ZCWrjE+Ah4i8GIfb8XITrUtxmgpWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEQm2hZbrF6Mil/tQezvj1L9usbt7t20m0oGYK5vTYIhS/gyvTyjceX4kKQJwxgKdBIKP66DKw2Fil3JO7nNueJW6qLl3dOmXPqD8WweJlBcRhaTSbKrHX6WamzEUYjoQoPl3GQjMIcfeEYPcd2wYg0H4KHTsRVp049hzT0Tub4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jp5GcXkX; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jp5GcXkX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnCNy1PTOkNRxBAQG63G/L+/VwDjrsMEOLyIpxWLV77vdZhYa9izYCNjAbZaWCf3o1Wbr5jlQ/QwIw3Dyq2aY+MV5JE18A5MaLGhVafySayc1zOHCQ/QfBMNaK1w4PrZorJoDJUpi8Gz1PGAJkdhDeaxVcCLNKKT/pAGJ7sbGAJT3sp6y8PE2JAcW5tXS0oNWFhYstEk8FvgnFKGXPFDSRUPPAnpIXyriAWiKrPnpr8DSoZJo+FoNmCleaebuKYs9h9nyZp0WNsG3e5550XgD6LSlPygkYq0rk/XebqvDAu0n0qRBdeyw0Lg0Hk8eSTuXRwjDVyESVbY8hf9n+GW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhrr8OYSMjzHmG6Mlt5jfn/n/KCFHRyqYYQrwu3wYRQ=;
 b=j2Rc7NbIQBZwV4ndPvkIaOTd5RkBTWkOjix58Vj7m0h2v9ATl3kzlZzfQ4xprG+aU9MmULz+/sFjSJY8rL3mP5ZJNTlgrHultxKB/tTfH+O1+2Fdppa0T7eJ0N9ma+6JTdeEDR12moHnZQF12guQde3mNHnnpulS6NzM+vPwqh5Sd4wrDjMthlEkSPwNKm7KNlXeF8zpHLYgHZBxzk3HZhAP4fGoBrvpWKmqQW5QHCamAmtuqyc36PbyIHhCD710PpiqoKzki1HpWfaLE0TWJl2oBhcPONGn6sqGqiVjYRSlrXgKEjCcgidiuLzOZECKYywEZ+X7FAO4DW426vCPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhrr8OYSMjzHmG6Mlt5jfn/n/KCFHRyqYYQrwu3wYRQ=;
 b=jp5GcXkXY1b5SxVmielAZuARESgfLRGiyQR0JgsiQlx2/4/zmZ03sXttyjelEPrpkdCdDLeWu7353tb6B64MV38voHQZqkoKkJ4kuOxwCdxl45yztkazy4pGTy1NNTqex5BqiFYDU+Psls+svH954WhIG+RX22uI5MG6zWDbDQ1q70tzlry2atpENqq1gCyfN1tPfDo9GExay5OKfF+D7R/VOy6gY6Lol2X78OaYUyZYBqEvMCGu54d27/UCUdpBuRj5lSdL9ZCjo2FBmJTl1a0kXo7MldjLga0GGlv1VjBPm7J+Aq3JRjsfFx1CuWACnuxQIwEyeGNJyfbgnQofmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:21:08 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Tue, 3 Feb 2026
 11:21:08 +0000
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
Subject: [PATCH v3 2/3] arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Tue,  3 Feb 2026 19:23:09 +0800
Message-Id: <20260203112310.2956389-2-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
References: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b40bbc0-d93d-4428-2b47-08de631653b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EE5HhGYxiJhXnMea+6WXB1lOWQo0zE8wJC+FeQgXMIj77U4MX6oU5yw4yRw9?=
 =?us-ascii?Q?iwE2m8gYlGHcLYpFYKFGEY7bzqQpTQN+4NqymYxpD1ln0iRoyDC1fRH/YxZq?=
 =?us-ascii?Q?H5+HI2molV48NbkY711f8F3m3LFPhKacilC96QD5pGCb/+uoensjKAy7wLIM?=
 =?us-ascii?Q?Tdq9R72aw3xvLBs+l/nDnWCoir2z+zO0KQ6Ztd3LLKSRLKaYGWZ0uoMDH0qQ?=
 =?us-ascii?Q?hj2POR6HY3XTXclvVwbZ9Fe3x2BuLb5+nXY8TFytShvccp5/qA810cPulX4g?=
 =?us-ascii?Q?RQKalOCaSM69J5AJhg2RIH2GS/b3K6+VwW7GkCeKrrQ5EF1ylEvAMMQbuPXE?=
 =?us-ascii?Q?v1ARwr2JcoXb0EPnGFpiilfUlTBNAtDrbGFS9IFEvAwyK+SzJi/sXOzHGfZM?=
 =?us-ascii?Q?9o+B6NPGbklFFlN3TkSTR19x5C6fAZ8z3Tb2yf2O+ItrO4BnS8SGZkeHTVDp?=
 =?us-ascii?Q?mbYssC8H521qbpp4UdOE3oReLVYwSbuwjvg0QSfxfBdbmWmicAaK1Ehjhpfq?=
 =?us-ascii?Q?9Aojz1gfZuEbqp81Dh2xYObx71pzYNeTMyRBv77cLqXFBF0GXWA9KX/DSJZU?=
 =?us-ascii?Q?hF7VJfw0osgOu+67ssgooPS5DXpDzhAqqswpYP061aNaVSGzzs5izyqlwglY?=
 =?us-ascii?Q?cFV2jiTwCryJZMuVz8FETzptPE27JPIzol0M3I/s9Kl//4IAP+mYECM3G4Fe?=
 =?us-ascii?Q?sSyL3Yg+YyBahC5C4mDEqs2c3XlN7dK7JYh7rvGXH92TO+f7HOlYTJbrvnCn?=
 =?us-ascii?Q?FVIPE2+ZfHlQlKGOwIloHPZyip0uEP7dcZMeuROK9o1cUMOGcrfVQ/sc0rtl?=
 =?us-ascii?Q?4B3xjZgmVT6kgxnx6bE+vP3X/QuRUcR6DI8jtxHXmrADnulvLsttRiDBneeo?=
 =?us-ascii?Q?e4RfMWkZLEDl697KKQ1wq8iTmtrEUolOpsHyo3elPfQQEjE0JzFyUxz2FgSl?=
 =?us-ascii?Q?l8CRcOKc0L6b71Ka8FDlhwg+LK3g3WyCTljGuhR0ZrNwf2QhWSoalFpWrAdi?=
 =?us-ascii?Q?jm0nBX0rcRQfJgdjhQxS+xUX5Ij/M1IT4cdZkJosGfZmJw+NJvl6Vis5TVVy?=
 =?us-ascii?Q?mNrVAUK9nwmZVM28ip0TEWSCP1/B7j4uL9E/OTl0ouqBQAX+MQj2tdEV42vp?=
 =?us-ascii?Q?azesX71m16TLDGWqokN43hwHwyVmWQ2xXTrJRcB0Iy/cHCEvg842NKwcSEFu?=
 =?us-ascii?Q?/nXEtX7kHf076zlkWqL3pjtSajj9dKk0rg0j+Je8Xqz20lgvifJE0CZwxSBo?=
 =?us-ascii?Q?qzG0en5A1NIun0u8hCB5A/JUR88UTTumOWdgFZi6yGcjVPMVl1DFvj25lcTs?=
 =?us-ascii?Q?N0CoO6enn+/+ewhm/gF9PXwFR3CAQbD43KxDbgWOB3HLlrjbChZltT4ph5Xr?=
 =?us-ascii?Q?DscVecQqDpwqMosWWpZQc6tPLa8emnX7yHklp0EhfuqZRhAz5Mzq1hMOcB5i?=
 =?us-ascii?Q?41CovBiibZ0kB5WNMR0tGzadWZb41RNAnL8EGCcsOsMRFvVB7FfQkiHImKrQ?=
 =?us-ascii?Q?9CBpOPCEd5+601rdc/GPE8RFphw2LIv4bkiSPzcCo3EC/oU7jC7Anh4ZGxRm?=
 =?us-ascii?Q?MPSxqXagWuZGJXaPB2huYzumOzLVnxmsxFunm4yr07TiwdPOsKV0Aa/eAxVT?=
 =?us-ascii?Q?0MEa/89lnauibcFpIgbDaIk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VyOWyqdh6Qg0O3fQwGFuv9EUPYeA3bznrZaHa3C2h6Zpu1xnQyDgF8PJLML1?=
 =?us-ascii?Q?60MCRXUz7z89BgAqXqqR5TeuQVEc1gRETgv4+jzl68SRjJKsQLwnqVpdj/PH?=
 =?us-ascii?Q?46VpCrxiFs2QZ6t6hKmigxUGDj2P1HDn/mk0SpQVRFuId5FdTIqSm3PtiBaR?=
 =?us-ascii?Q?rLQc+C8lApkCDCDKSILWeuOMw4e/KtLEbPfLS6jyFS5H81XzHEiHTHBoYUfr?=
 =?us-ascii?Q?Kv/Sml0qVHGyXleCx21ppjKRid9ah9VmPbc5abvmVe2BpZZAL8qhSztHhtvR?=
 =?us-ascii?Q?2D9c5SqL2d210vfBDwttmXMDgJX0WiZ7Oyi4AyliVnoE04g8nb5HXDTdKZWK?=
 =?us-ascii?Q?w2+dIsM6UbOe+HjO3QgT8ABzvsieogPql4ATbRZCLJjZX2JckAcQ6ntIeFTk?=
 =?us-ascii?Q?ZMsajX+heQjsHeMQzVAS/f/1Cx1QOI62kJImIzKXLvCSLN1q6ia+Ybys1vs3?=
 =?us-ascii?Q?19dPlvggxYzu5eoH47YlxW9/wWBdQKxsQcgsQf4RQYv2B0PO+vz2sy0vSa0m?=
 =?us-ascii?Q?r64augkvsCmxKFet0FAvnb0XcB3gr9LY00ZlqWLMO5HvHMjteGwGcHgGqIe9?=
 =?us-ascii?Q?t5WvHf2c5USwrZEt7OPRy8vDGhNxMnM3tFGh5CPUDQLXz8kK0jI0vvSdxYce?=
 =?us-ascii?Q?7UmhOWj/DOau8yEB6yC5lU0SQ++7mxk0SZTCKduQUY1b28CPLIfpDBYx3pKK?=
 =?us-ascii?Q?jqI4K79o+qQxEfcUUsb0oyWbLulJgtCcAUPk8w1EnokhiagKe2ng3K5kWYds?=
 =?us-ascii?Q?IdF+92jUh9bt1dnUWQDPjzQLbNKdnfoHFvufkminjeqb05bKLBYrxAHi0cWM?=
 =?us-ascii?Q?i+/8kPcWTmWghvX8RX5p/rqkQEO+A/jpsqGu6OXxKaTSWfHEAE4S1S7d5mz4?=
 =?us-ascii?Q?tsQOEkA2BO23uiUdPjRZ0dEjHQzgQO85QJYsgPFvbJTbQ/S9yHmcpzmtFAFe?=
 =?us-ascii?Q?ll1KMr4Q+jIo6sGTFpcHvKTeSvMfsbKNbq/9TAhqy5fBuIOE9vfCgzhIxbD1?=
 =?us-ascii?Q?AtgK13LO6Z2obMv1PwhrchZ3DBvobwJ7hinr+oGERBDke35N23ckH8TVg+jh?=
 =?us-ascii?Q?ynTbBi/oDYuGzttcunhv4pE0x4Web8FH82qaOvzIZot5qCOKhXbqfg8DjESN?=
 =?us-ascii?Q?2UHRsRfsI26qUdxeJnqliY6QD0Nr/xm9HC8falyHoJQ5x7LVU0L+3phe4UxZ?=
 =?us-ascii?Q?s5r1ijd8n8G62l77AVQmcUBFAm7qKqoZjWv12rMgZ3jH8v3qh26VvS+jGYJD?=
 =?us-ascii?Q?aWlDnje6w7HplZpZhT0q7wk3Z2bIxOfNbpcyqyo9YqrEAkozTKvpUk5XiQOm?=
 =?us-ascii?Q?A59kN7eH7MjGxRzKNcEJKyMsC6piXjo/jHdkZDkA4UE9M8MoTNNjvHvZ9mxC?=
 =?us-ascii?Q?gYr4/aC5hHl/XxQhchrrkhxm8Q/6y5lLveZEgPdDPHDbLsVlC6/mL4XWMb3E?=
 =?us-ascii?Q?LghupEhF9ouK8B+iYEu7W31QDZR0nbBYyQMmbKwVKUKzVPcP7Gfn+PwphjwM?=
 =?us-ascii?Q?cWEkZI78X+xbGAu29eUJDeJHohqeZB2ISxyuMbDRhL+IYI5essAmqZzKekL3?=
 =?us-ascii?Q?xAYSp4ZQboa/peibg0F3GVXQ4vyTdj0m1MW2TjHo39Oz6QEuYuWjaXoB6enR?=
 =?us-ascii?Q?ji2zHd3dypcbtS6HahHsLqX+7DPI0ecL/Hi/ie5N+XOEDY6T2Yw3L1urMo6O?=
 =?us-ascii?Q?YHRnsjHzj1Kn74K5ngWEXwS4J+JbJfn5U6qkJtBtoiBPk/vS4UeyebUcPtoc?=
 =?us-ascii?Q?Nf+mq82dcg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b40bbc0-d93d-4428-2b47-08de631653b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:21:08.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwLSi30jCeBxjgou9FtoXKnVgTIAK3zWDlKn9iW0kgTZCk4JopGLS1MfGh/Qq63PcQnAYHCcZ2WxS5i/LYggBQ==
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

Fixes: e37907bd8294 ("arm64: dts: freescale: add i.MX93 11x11 EVK basic support")
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8dd5340e8141..5138bdec2402 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -631,6 +631,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -643,6 +644,7 @@ &usdhc2 {
 	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 	no-mmc;
 };
-- 
2.34.1

