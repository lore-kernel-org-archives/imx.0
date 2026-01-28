Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC603265298
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585616; cv=fail; b=GRsgY59xlNGi+Xh4Qgbqq/vHZh+eU8WvwiPVzjmPvrbOnXgwP2KScAs5YaAtkQ+2/DNELZtrO7Qxb1d8/9nvEc60z0+1pOGbs9fK6KpVhUjv9d6to2HO0YazZcNI07J3fjkbVC2V9TfEo5iawBBCYaTh9X5ONxnDDIB7CB2JavQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585616; c=relaxed/simple;
	bh=XZ6sOgzyJyTBSwrVBsQOhzPwZiHrhurQk9GuJt5KVP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qN0JBplxskoPEoKBhZ69vJoRrlZH53EpsWlkgJTfsYydhNm+6D2rKPDbeKc//eaGKSpNcTfUYAgjmSn+Q1d/EPxdyx/lZwBydUBr82rdP7SAqjBobcY5aE8sHkgydW2Dq/clwDsGPJi8BZw0okYlKlI8lsVRwEG0hn5WZY8NKJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bztljc01; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bztljc01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkYa0u+xORNGn49kwhOjZuOSmTUkMilGACXFVU7MQYKt42pP4tGWuWiK365H3qerbNlIvX4z8ynEO1ro9BIqxYTU8OC8mZR1gFJuowWpZV6OB46qwDKmlPuM7H8H9kBJzPwr06q0TWk71rQ/mbAen3i2juXQox6qUnAJ1XyKhL9d9gUmusvzdW+cxXN/jMrjw3J2vhOhTsQlJ+5jUxtLHJqe0P7mglR3dukEL7NtB4o8AptZzkQjr2GryxuAp4e9+kLebdLiH3sYrDyH1NGStDAyA76BVZiBee7HNWyKVvky0ejMkW3BQDOFVj9IKLp6qTRqTakTRBeklB/zpbRWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i/OpQXCKfyoyOgGq39V9i2G5spWh0+VJ4/AjglYOBM=;
 b=INq0+LH4Y50Eqe54ZqGQfEUsUGBsNwS66EjzU5a+S+K43qqyyLQl8/2hFy/WW+qCw6Th4QEaDa9GB7FdoAKFDE0aeWMAD/c6tjeeVMraUXOvYbsg3oNNBKJMHySn/KSvDOyb9bZt+31/tviERuon/2aRkmuubOaMvVJOdliTBDcuL+lM4sT90eYW/V9ae40Jt20/fI7uvtOZzwvXMUstpsPxCOSbFRWEyZptBcfJKE9dq7CaVUc8WJVKN6l8Y2hiwLNedhSJZGRinK/ulEswAJLlRMa0GIIHd5/MJcysZ0cBRUcsU+j2pTWmCuXYNSmYYNCsvHmRa/72luXpSzCZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i/OpQXCKfyoyOgGq39V9i2G5spWh0+VJ4/AjglYOBM=;
 b=bztljc01mc/59lgK5NjYImgVuDk9ssyD1iS47Z0dUaBP/PvI0bVE6PF8VmceQKljbkPBKE7hhiN06bA/0JbtyWCVw206/i+ppfHiySs44zWUFdgjc8sp4m/SLoeig3FkkqojMiuzFqvFOxtilA/Leyt5h4547ViikEU0TOBu58fcKOYx8KyWCXepDUxW8YW+zLbBMeNp7OTsONgRLSrDcQ2SlnR7vuSXmqVfOdcGV3JFOPZBqyitnqZnK2Z4PytqtCrVo6LtfQu8OWROMNBS1we4c87CCRtb2l6WNwl8lStkl/zTniGwMYlwKJdqXaAhm+0XDZQT9kKUibt+V6oX3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DU7PR04MB11234.eurprd04.prod.outlook.com (2603:10a6:10:5b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 07:33:29 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Wed, 28 Jan 2026
 07:33:29 +0000
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
Subject: [PATCH 2/3] arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Wed, 28 Jan 2026 15:35:31 +0800
Message-Id: <20260128073532.2904161-2-ziniu.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 623d177f-1ea3-435c-b80b-08de5e3f87f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YpToi4C9+jB1sAUpbY8YJxL2AmF8X+WCBhXG5n2vsXrn6aEin9DCByEqJQU3?=
 =?us-ascii?Q?kvcpCrlaIxwZXj11qgLbYEfxp340lI7jo9iA/p05CsxTgohzBxwGgKC1OCFw?=
 =?us-ascii?Q?9X6jtZxh61nwEldoANwAaVH9JQCR58H9NyFOIedHx2mMsFkwJoUvAmg8B+IN?=
 =?us-ascii?Q?w2RbY/hutnjyh8P4OLn/aYdZIcUyO07K6FBl6O7Eco+Idg9+c0nzMpq1z29P?=
 =?us-ascii?Q?sq+uLmsHfDNoYKBUjJP6CExJY1cdbLJhpq4KQCGO9FMWAEcjE9OzCLL3dFoB?=
 =?us-ascii?Q?gn7rT/1NqH+O61g6EN8LZ+OFm/Vt1UvoQFLRr7THm13YSkQfIXTpItpv9pxv?=
 =?us-ascii?Q?z+hIbVGo2HmW/ZoGAB/+nI5UAWCB9DgJA/nM5UpSqORrQdVUBIOWC6sB6Z09?=
 =?us-ascii?Q?hg28uuQxCG2hE66MSflUNcFeEdewczE3Gb6yo5swVCAgO2eAvuAqhIq0mo0k?=
 =?us-ascii?Q?JVsUPfarFJ7ZGrq+Kk8yxXsylLRqheG9rRk7Lu3OW9nG9r67kKFyLfEufyjv?=
 =?us-ascii?Q?kWANo66BEtV0DX414UHPIOHILLup/VYcZrm39F2GRGDtGuLReYjVqeKwO/lP?=
 =?us-ascii?Q?VL0qKHYlr2GVvu0qZTi9oXaCTz/T5iZfIv0RpUZlixVoaY9fzSfTIwtD06bX?=
 =?us-ascii?Q?CQSk0jPkwp5Li0QqnK31lgc+byMDaZENKt/TqUe0w+M154ydd6lIYK4VWKO4?=
 =?us-ascii?Q?1DhtgwXkB1tYNrS2G9N7Ai5XMFL8LAScNx4/++J0wUDo2VVCExjqUHUKEPcj?=
 =?us-ascii?Q?ULyHD5uC0thfVDdqxXjZrWlvuU2JH6e3dUHXaJy9KKfLG9VXjfddtqSNmHjV?=
 =?us-ascii?Q?yfEppw2ic48ueYEHE71ieWNG1DsugZE0/pzxv3zpDzFwcpr9qpjsHcf7Jfv2?=
 =?us-ascii?Q?8BLd9QaBkdCUMFePT72s9l0lTQhH4vL6Dc3YGv2UotPWpaohRozC8POJBbGg?=
 =?us-ascii?Q?7oFJtRp9riG0pFcVipzCHwutox99C7HD+mEok8jADLk2gI7r+W9d2ovAUhHR?=
 =?us-ascii?Q?N5Cma9+vtkV25ZnahDSS8nqjACQswhG2tt+mKrzfBY/1O7PhdVVaoVJwNJ8w?=
 =?us-ascii?Q?sF49ObuFgEKTcebgqZl6PnScfV9ZteBJafb/OANMJV4kKht35SP3SpZGyFpq?=
 =?us-ascii?Q?4Q7ZXVXVvHXMJST8D1InyUeQUtnJY4WRrkNF78yEF2SvfuseGJFpo+J6cbtt?=
 =?us-ascii?Q?E5bEOSZ8dBjRWmtdqwYRCvw/MRgE5U/TAas7KMNkYOgjQR7ZgL4adWWBQulM?=
 =?us-ascii?Q?e8KlgMYNp6uAaokdA3CHK/cg/rDCX9T2j1COUqROCLugoshb8ZDhGshGZEvP?=
 =?us-ascii?Q?2CxF/P+DEUGMffemwgnjn7iNSkT0gz6u6AtVf54KZxb9uz+V7KUUeWujCgHV?=
 =?us-ascii?Q?CmLTKMVsbi1+SL9sCUr/xdTbCg1B/0IVcizx/NSQP4IsJipHrFhcdAhVmGPT?=
 =?us-ascii?Q?+YVSjT3cLVgKoS6V07bVbdT6EZtVpiSnMVfa9K0SfLrnzvgDx9r35SuGYFo7?=
 =?us-ascii?Q?Ts2tO7dz+INEdmzRu2lrbys+BlgseZ1034j/t7Znl6RnEIlfm6dbcw2buxzk?=
 =?us-ascii?Q?agoNsLAyq9aPo67QRjCCM7KyVZ8k/EaZLWI2B9BsBdAA4iIABoINoTDpFd7o?=
 =?us-ascii?Q?7cBlM3WIJ1PBwNkAlObol5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TQ/0bhOzbVzUFJ0jaSkHZFlBMhTz4kBJZkN3LXB+lyPYRyAdMwSpz5ALatJG?=
 =?us-ascii?Q?CxFH1M9Q/DWs/mj4Fgs7cX2PYW1dz4fFZvpEvR9ug0Dgr92cDFCrQpAHMbbR?=
 =?us-ascii?Q?/xV9NqpYr691+U7p7jKhq2y6en96BG7I2p27B1R98avyVFRiWBBkyNvEED2B?=
 =?us-ascii?Q?yzLR4PeFJbToRQze7U5YaTGd5rea+Ilg9zTGWzlHQ0JLCeryoEZww/FJ0rVr?=
 =?us-ascii?Q?Gb+Fxg7yx0Sxy6XJZPaYGsQ+to13/jO3EK3BGvz9CFOyUIt9lmsujLaKFHBh?=
 =?us-ascii?Q?FLbscP046UaN9UpiNEfILJNFL4JShwXudlCGHH14JJnNvXMCGYuop50aZdH+?=
 =?us-ascii?Q?pPx1JbDf+FG3TY4/mazPqRBzM0SWGUPgBEljAjE5YVEAD2dybiDWO1R/ldhG?=
 =?us-ascii?Q?qtIUELa2PkSd4qZR1FoKiaRme+y12FV0ADzSbUfjESLv4lrJhwowGu4nh9U5?=
 =?us-ascii?Q?tUZN2qPLuaRzdYxG/I6R6dZvL5+RHV4Pb3XypjxleL3t+ffvTuR/eYBnB16q?=
 =?us-ascii?Q?ePPQx7v0uNa0JCq8zXm/lbxXruB5xD833AmrHGaQm8HHFntV1qln5Z/zz9nr?=
 =?us-ascii?Q?/Ys3KASe47+bqXmBzRhgKLsPnMFKRU8c/E6dRg5S6r1rfKs+IRr3ASO25OJy?=
 =?us-ascii?Q?601KkUSUXCfsuQcEjUDvrT54AKW5z38ZYL1w1phlAxqOR84Xpf+fMysd4NyU?=
 =?us-ascii?Q?9zAbzofqBmgQkapZKE52yX0C7hu70UtgKMod4jEbGtOY6/GXFByKO0kGYlOc?=
 =?us-ascii?Q?t88nS+pO2tOFyjgLL54lJU9QFORZhTr5swFdzNU7nIO8OxE/PhY72v6lwr3G?=
 =?us-ascii?Q?TNMHU66SXk6S/uHLU0RxO3WuW/czsvHHM5t7ZQNJ5IdOcvXxVkV8nZjc4Kj2?=
 =?us-ascii?Q?x0KloKwGyXlA2CzulFMzfMzesWE/LKsOxQtTAeIBsQfEe/f53Z8dvlHqoe2c?=
 =?us-ascii?Q?C6mS1mGFlj1N/MXtpNPYFu8dohOwEY6DnyYy5MUmb/XjdhqzPZPbkn30v1HN?=
 =?us-ascii?Q?XbdiU6vGVE0klp1i71t8SDHzoO9R2WeXMwe1BvcUFua8vZ3qRwMCDhbEMZuB?=
 =?us-ascii?Q?VrKsz7Krd8hSR5HqV6M66XBhefRAj1jtOmNPyKW1peDBTsNLdpiaRxgkjlfN?=
 =?us-ascii?Q?Nb1kp1cIBZgomS1zWdwQqKZ2gj/dZlw1Jl8PoKtwqxUqZkyWQGxCvIlbvS3v?=
 =?us-ascii?Q?Cfik8uOV/o4hIZjTkGryvAwPCKmu6tf74AHpeN1A3RGY0cdqFOD9V9SjOzpr?=
 =?us-ascii?Q?BAWLxTVB7wU9Gc7h4cxy1FV6+xcQxQ009m9TWNter+gh6j0552k7DqMXHA3V?=
 =?us-ascii?Q?ZXAAj+j3MSQR7l+pBLxXmiNAc/QsDb2alkypKdyCQh4itf0j/rRjUHWMZrRo?=
 =?us-ascii?Q?nauT2myChI3rRJ7UBHLkt6HeFAItLXgSyQt0Y9rXy8EX3ptyGiY8YTQqkhQm?=
 =?us-ascii?Q?NE1s/LuoC1l7t5pht+WS58kFiA5+LZa18DRMMxYW6QkJgFYp7XU2Tr6ezGw4?=
 =?us-ascii?Q?GBYZ4zMijwlKSqPM95bYG0ZxAuQ+qK9+TtdOBRh9Ur91dHsQ71PXC3QBxg/m?=
 =?us-ascii?Q?zeCVKtn740kJBLl5CN9v4gePXILc/JLCRXA1knHJjXboX1tjbREVGC3MsB89?=
 =?us-ascii?Q?YQTwEromelWjICpRXL0yKfCT3YGZJR6LIAWgLgVFeD8jnqjkJZeB6l5H90RC?=
 =?us-ascii?Q?8uNFUKVEysYX0YuNRQEWfMA2e8W58PhJkpt4rG6zUHmNH2TxF3QkwKYq/v6u?=
 =?us-ascii?Q?58iBfX83Yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623d177f-1ea3-435c-b80b-08de5e3f87f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:33:29.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFZFJTYreLLxwNX0UhRGZJqtyj9pSihAxs4y8zbqtNZcAInprX17hH9w8TZ1tS5a3F2zqTUNtuUD/OH4QNgmkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11234

From: Luke Wang <ziniu.wang_1@nxp.com>

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a bad delay cell near the gap to be selected.

For SDIO, the gap is big enough, default tuning step is fine.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index b94a24193e19..6da2d25acbd0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -632,6 +632,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -644,6 +645,7 @@ &usdhc2 {
 	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 	no-mmc;
 };
-- 
2.34.1

