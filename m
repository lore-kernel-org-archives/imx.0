Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3925228D
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585620; cv=fail; b=meYJHzeX5wt7xwvPAuGuumFAheF19Mhd7NUNDWUuUk9LJPOLuEpWkQD8sWdPHPPE3eCGbYicFTm3Lnn8NmtbNCtZUTowLkHojOujfbXWYU5xHaQpPK7D3hwM42ZF8mMEnPKjaZekFQp2R/+KTLd9Qu22qqO1PGNg0xQprTsjbXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585620; c=relaxed/simple;
	bh=NyC9VLsI/Id8VfmlNwvSbs+0HyEFM609jw9Sv4eHZ+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kRMZxL6TVKb2vp2l3urYn7xvAskxHx0jLzwIL9zG4hvdajqe9/5WZjYSJ55MvXKMzRq/KMgeVte3c2CxyiNG2/B6/Mhkv679sMRqIVrAhxCaLKVxO8cqyIBtZsNPjjTggsBMPnv2Djiiopf6n8JCv95MXuEn/hqtlQovbmcESWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g9uqZPdr; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g9uqZPdr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+PaPlF5xozFk0GaL129X/KEi4T2anb+BZUTBdPbDwNZ7zc97j9v+VK1e/IVy08gG50rka/Ntdrn1soVWIThPyUVDDk8txM2Q1fe+pYfUZk0ROAMzthC32qJ1DDs2t55LEITxqIU2EEHIL9uRdm9ZIquEzDIAggxZhGWGc4VffF0rbpEASKQ0ZqFPC437RvMiutxEJ0lfG5mzGU/ssI2BT9RtScVM7L62tNeRp3G9f4Li16Mvh6+mMLAknGvhlklWRhG4fUIPszryDtnnYoIHkzWEnBbJghr101Pid8pY80IUucpsBdB4FBF2+Ahh6dAwjlNIuUxwErpd3x+V3ncSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgbNFddfpIUq94NI3YsMlUT/Yiw5DzKKw56YMRRc/To=;
 b=Z3bCnNAUSlxzOT0wXU4W7toV4xXE5BzBmH6MpDr9ssMmBwA9ikc10hUZ5SSm15b8TtFkQ5ivPFndpWJQSE33zM7IwyqZ0AZUJRoT+oNhhNQ1FksfL7FdYH0mOrCDjkLpY/ExvXD/dGJjnJyMq4SZqFShUiZ9LhhO2GFe6Y7qNbcFp+pUkU+UmvF7wwfszSlFgaW8bgZ8ADX2wAU202XZBD19/SBEew3WWDzahHe76BxkGCBCaXFhLe1WbCHMWXER6HtaxeNoXMq3NqAhVvdqgLfrNnhOuspc7tQOtNbwBW+uNceQPl84l2olMeGBXW+Xvx3h/KLgF+zohUr3CHw9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgbNFddfpIUq94NI3YsMlUT/Yiw5DzKKw56YMRRc/To=;
 b=g9uqZPdruoWD7KsKh1YPz22RR+P9LFs8x8+7fYGP9Z6yUprUnADRsDtUHURgydtshFVsilVxeeNss6mPkma3obLb+O9jSKMP/4KWtmOM6WLwnNuMtwxMW4TPfoHh+K2pxfYSj+2XwBheOm5UTGB/zB7H9YWNR9+KEpyY2E4XHF8/+nhtYyDTO5JXXopFqLptyWX2xe5VJnQ0H08pN3yyaQz8Q+T87wt1DcpiL2XRYZPUeS0A3liFzgLpEFwflylI5A9pEHE70Kd78VXh9KsaVdgG4nkOTfBkpk2NXXWTye9F3So5X7p1gvDUQsEUNU/opCnf3C09RHZPbBfIj+rv9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DU7PR04MB11234.eurprd04.prod.outlook.com (2603:10a6:10:5b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 07:33:35 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Wed, 28 Jan 2026
 07:33:33 +0000
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
Subject: [PATCH 3/3] arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Wed, 28 Jan 2026 15:35:32 +0800
Message-Id: <20260128073532.2904161-3-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128073532.2904161-1-ziniu.wang_1@nxp.com>
References: <20260128073532.2904161-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::20) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DU7PR04MB11234:EE_
X-MS-Office365-Filtering-Correlation-Id: 282c8fa8-7fc5-47ed-60c7-08de5e3f8a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IkPJ57R1xw04/6BTWBNzQvyth6lH7yYLvwWpegSwRgfAAa62Uw5RVY1V+ZAY?=
 =?us-ascii?Q?TYBm7O3s/Lm5JT870EHw1FoVHaDr1mfoyJ4w9HUr/Kzh4idGUtSrmNhQ0p5h?=
 =?us-ascii?Q?tMrS4HOf1xRzOtMNzDe0srDO/mxQQ2b9mZ4BqFy5A/dzpQKeJVjVbKWBhDXz?=
 =?us-ascii?Q?K2HJo2zGcLsEndiEjU610QRsYdZ5RkXNE/Lq5p7FzUPGL7RCdBYC78d6VBZ7?=
 =?us-ascii?Q?bOwvI0VfG3y+7EVinyOeq3lIDADctqygffkXjp1Wcf3dB8blF79PvEKgoDlE?=
 =?us-ascii?Q?S80bXb9MLRNX3VMhJfvViKqU6clDX7D8/q/GfzrV8Nsi64E8NaIXNJJ+lIGZ?=
 =?us-ascii?Q?99eJ0qeQhpy6olHiPfIAlaKJT3QMEl/nWYfjKoMvJb4smBT3UMFC4uXqHtGF?=
 =?us-ascii?Q?oFp4la64TZJAxbVfBgFYWffSDg9ouuel/3hLQalKM8b1uDL1XYN4GO3IZPXK?=
 =?us-ascii?Q?vgY8/L3DKj3ZOVqiQXNvxjGoxXtTndcPD1vobOLqGt3uD7cD89ejhS83HGKb?=
 =?us-ascii?Q?jaAPxmkdfD8lDdgCjmJgaO23mU1C92fje1VMUDL2quLknRzgnbMwakbheK+z?=
 =?us-ascii?Q?xmFwZeMl4hkQx6KsUKbt1/oESDITLT8Xz2mVFsxBXxxK4ceQ6ma4IOXnRIeF?=
 =?us-ascii?Q?Bc+4Mzz16BHblCgFDhYZ5ZAwOSBclVKso/k7UcOSDDazpTJtGFlzXCGIaFKz?=
 =?us-ascii?Q?RwtgWQXwG9bhge5zWtg1WlqTwWac8g2M2y7TBlD8lN16yKy3HwseNFovhZzo?=
 =?us-ascii?Q?0qDdQiIJwG3L8Jfhg4wq1S9pnb+K+zSK8Y6xzYP39MO7Fhr9FvsQ+NDdip2v?=
 =?us-ascii?Q?3qqwBAXosoN3SnXB46Jqgg8jOZpjbGzICcrIOHr7ORSWjzeUApWvWw8yEXTL?=
 =?us-ascii?Q?UxILBb5wLnqFWuY5w/AAXl4HGLMIagcpyviusjy43htte/UzRXz8Aox1TNzp?=
 =?us-ascii?Q?N3FEn3gdfMqLJyOMTtXdjYOtjyBf2XS0BEj1YZCx8E6QCaK4LcJeQc7PoE9i?=
 =?us-ascii?Q?T6Z16rdlCdG/8cC9jtMSWijXCSzMbFvRo6++ISJM7a58uXL/y+CoAmGN8WBs?=
 =?us-ascii?Q?5DiZAd9q1IyXW5TBePEc6aXZAD+U2sjkwwYJIt34JYURYOOgYVuOuYngCZUF?=
 =?us-ascii?Q?uZhain00PrVwjqrCFgkP1O+94qHcDOFDSRm1fya4agKxHVp/TKU17vYex9Z2?=
 =?us-ascii?Q?8lgNAvKfvuqXW1/7Xmsi1slEwWOMHPMGTTnYJe0v30Xtvm0WXr+E+CvQ90nT?=
 =?us-ascii?Q?/6klbUMAvdlKuIiBDRfTfxmtrCHYWP7eGVfQMavHL2rTT2uqQPIbWBvc1e3d?=
 =?us-ascii?Q?I0JRbS6JrNGeeIkHz2+t0EOT4wITk8comChEvD8Fj4nL/7N+aZMbYiRatx2/?=
 =?us-ascii?Q?Ujr3lhK8QjsAKDWhma+PWoAio/SXTDdkiGucZlN+PCZU1GxVmGC+8kyJXaOH?=
 =?us-ascii?Q?LDLrePrbYiRTs+72nZmW6bryssHc0C+dN1LPLTqimDTj1rDl+12oazxZs3oH?=
 =?us-ascii?Q?QMJquujAlQhmeFx25Nw/aXNJMO1IGFRMaISFDSe0a7VSmVl8bfn9DJLClMsC?=
 =?us-ascii?Q?ULhSD4sF1/02UW/Q29JQxNG6M3LSVUP3ZJQwHQlPnJtM6pCPW5vwtHqgmdng?=
 =?us-ascii?Q?I+StusSOUOUIdzJHTLUkDnE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QiP8qiLv/FhFVAeTJa3ITceliImX97fPrkZlmuNUS87rBqmAqboFMnTSec68?=
 =?us-ascii?Q?RCznkqiiXaOfuQVcaNOSGL1TWgBuXPr1/a8VdOk3Ob2SoJTtmfoxqPNH3wNX?=
 =?us-ascii?Q?bCZV3oqCMQ1FVBiCNcZgKf0j0jIf9oB4KHNfPHNOWmT+vnkaHv5M0jczAMMR?=
 =?us-ascii?Q?O3y3L4kLXEQ0hX83l1FSZwIrIZU8dAIu4hfaWr6KiI3P9Qu457BKwGNZwINx?=
 =?us-ascii?Q?8xUf75qfxI3ClbCeR67fs+fZI/gYeud95hEOpW0T85gGFdhcbIoGX9FHlaoe?=
 =?us-ascii?Q?wWqbgPfJtQQgwDSK+0B1YctWaBjnXiy91qmqOrcVCQHoNecBtVCEr//r1Ray?=
 =?us-ascii?Q?w8Ft6aSRv2uXKPLHv/kI5igMg/8X3VoDFcQMo3OhIqWqxfkORHYdmiD+nNOE?=
 =?us-ascii?Q?DKT7uWYOZLZGg9Y/B30xTBBYRd5WWVdpSD8jeEUtWgma8KuRFEKxi1cMWt7R?=
 =?us-ascii?Q?LfoDs3fT2TMl9Gm4AHIC/esHRw0qbj7IhyeswNDGdzAzo0mSXoILPMCy28FP?=
 =?us-ascii?Q?+tDsqpg3DeNueV4a+6SD+iDn47RjcdAXOuzf4qdOlrwR2ZjVtqfQZuL7OJEa?=
 =?us-ascii?Q?lPs1sQtHZ0GxjZJfHbud6RhRFskGSWxlGpXuoHUf1jdjbi6PTzXWp4Kp3mwX?=
 =?us-ascii?Q?Kiu3VhaGYcV4IK/zuJj1pgvwEDuRwZp6SJ9OxTwO1XzbeKoWO3K88dc88APh?=
 =?us-ascii?Q?0NAeJoY7S2zdyEziWPxnt6b5Cdsv+9en5zXlHTQvk8MsWqk4FjJ3W2xKpgbw?=
 =?us-ascii?Q?86kUWkobi7Kko8tdhBAODH8DYKE0Av5lGiSqw0JkQu5ffADjlXzjPbtd46/0?=
 =?us-ascii?Q?vlCO9XVfTzAPLPfv87WaNW6ZX/8aG8HJPX/gohNG6nV7yKwBiQ5dzBzXXg/j?=
 =?us-ascii?Q?XpOioAM20SAcmb+0gGfHno2rJ2YmrQqvtjSTmVxGH64LtQ8qsn7bhjNrM9Jg?=
 =?us-ascii?Q?ZuYnn2+kGHoh3Vaq7uaIDsjyVnY0HAUad8L61Nai19PMkSfLgTla8iY+kxg1?=
 =?us-ascii?Q?u8PVL0WrHLdRfKpW2pBD6vg0GVdAlHJrnVldld8jAXVPjcA4/Vz3QNJOiKI1?=
 =?us-ascii?Q?KFoly1TofzkiNcgr+20RyDnRgVxnd+duM9KA4LL72b3Eo9X0Ko4lQdkArCi6?=
 =?us-ascii?Q?fyX2XrMstX/Bt7gALWh8xcTLIUV9rzDoCSZeI2dZ8eZdst17fSqeq8KCFSGB?=
 =?us-ascii?Q?1lXIPKCerqyoMmC1oRLNunHRZFSJ4Q/QqC8sC9D5nZtM3QT/iRVhVhFChcpe?=
 =?us-ascii?Q?9F8b+obgdO9FigxGe1AtzbRJ7pjPOgfv14CSN2fu+PcAcktd07tGETTy08d3?=
 =?us-ascii?Q?Li+knoeD99c9aiV0wcJ5qBIBkELhC7kOBmI4JRigCN3UX0/6KotpMKYOVB2G?=
 =?us-ascii?Q?f09sAa50MGPaXJeBlugNU+Fpb9MDzBp9LJ2BPcUQaT8ndx4FdMENnTev1t8p?=
 =?us-ascii?Q?mKb+UQKYLzyRT9soCWI+GoBYubbQ1BW2lQdGF2AUAS1b7C53nHu9OB3gjv30?=
 =?us-ascii?Q?Bmw8FAzH6MOdV7IVn7cDRfuenWWXG2i8o8FCEvl3I/UM4iNGvrYmoW67dIaV?=
 =?us-ascii?Q?qF1lRbunq8lZ5N4sDOY3tpCL/XxJkSC/nvcPQOZHGGgIdNjIFcMzqYprDkGW?=
 =?us-ascii?Q?qv7Xk4EbOSkV7LSReX9auw5Ci0SWFRkAVeokXbic5SziPh3QQpb8l07B09g+?=
 =?us-ascii?Q?g9wtIwu9Jpj45/8flSBws4NvMr5UuqavlH74jAp4vfbi1cWAKduY16ewIECe?=
 =?us-ascii?Q?9PwfwiwgJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282c8fa8-7fc5-47ed-60c7-08de5e3f8a6d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:33:33.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ0YSHQwE3wjlKFgxuB6OENvhrx05ucyZcDnlW0OrTG9gBkE8o1EcyRHbnP6I6oO76giQkUCOGihlF/B79RE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11234

From: Luke Wang <ziniu.wang_1@nxp.com>

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a bad delay cell near the gap to be selected.

For SDIO, the gap is big enough, default tuning step is fine.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index aca78768dbd4..4164d9e4e0fd 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -415,6 +415,7 @@ &usdhc1 {
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -429,6 +430,7 @@ &usdhc2 {
 	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1

