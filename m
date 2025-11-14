Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06453446C4
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142457; cv=fail; b=oTwYpS4OXkZPxvfruoCHgQKK1tzTFy+jSbbl/l8iNv287jfB6jE4na7vuMvZizX6tUargvppXNpqFvSxwSXAqbXavNGGEuRf0VWmF0CuDHmIxrsJTmXg0HL+w/RN6ta1ZkWoCoGIMdoMqnMpjxV5rynGBqjihsJcpJNlWqtXGSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142457; c=relaxed/simple;
	bh=SU5lAK8ASpvgZ0Sfeu1oVhJB7ZBMPZSfH0AJonE/DEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BbtAnHBnYPd4bYWzeVCc7fGIAeGSAbIKeIvmfX3yPlmstxqMqHPUIBhIB/+mQRWkhhhPeu5DFIfuxOrshYxXbRSIcRHkRStnVKAikRO2mTqSCeTVjqCcCD+RA3xLoj3kh408BoDDXz/Ok7UYEVqr3s7dlj7B+lkAXknNOWD5yk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=itLAmDo0; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="itLAmDo0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx/6IbEkrNzHjDrF+byO9+KKf5oq3X4Fc94mjwQvLrqQRJ3e9RssPU1W8Fhj3rj6thzAlfkJENZZ12vPmZr2OczL8tz9fW4an8KP45dlthnY4Ufap+F6aKx00kpxvpuAKPL97VxIlbJdaZ2LwBlgICKUOA4NmvmSDlONIOK0GGl/mKfrfUH5I3E5+G4lVVeKU4JIqEOKrvESuI5m3E6OJbl1nUIdc90OhKpyWXq5K1+aYN9+jWfd4ENwJkO8LhoK8v8cJpA3KboRgTjcIH+EwaG1EVJvYKrXd0iOov2XO6KvlNRy/CrrbCgqmS78tTxi6n6qQMd+Lomp8IHXjbaHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUgsA9isAdkWSEwwwg4DEuir3ibuchnXtS2rOcV1wSo=;
 b=dgaqPJomxRqDLFWyWQjQ5PrnmAMO6bt1Qlt3yWeoelqPLQhWG/0tCpP2sLf0kpjbp6WTVV0appYhZH3fRfAGKun4WbqOtjHajh0RFbRaTzJyklv7fSBNpPYmJps2d5WTWRxoY5eDsyb2QEN6L82S9TUaqM3GlWw2zU5F+7Ztx39xsFzqB9B+b2/uPQIm6/ASM1PZR4mxQgRFpZFU4vDkqAYUY6McFNaE6JD5GaiVxcwb7uwREMTEweXe2Z0cEe7U6tMV+lhGPwQlh/u2I+UdRbuas4scFlvlCg9V/zINQQ0s9Y93VsAcFvDTUbu5bxpziivdbrbrYbsaueuyWD9SnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUgsA9isAdkWSEwwwg4DEuir3ibuchnXtS2rOcV1wSo=;
 b=itLAmDo0FmIdrlTCP0DU1sgk8dBfdVq7sW/2xxZ2YZSrt05q3IVzPxuU181tH306ydvqUy/PDwfSFGgKnVuGSLMnctzQMnSkJJiB7UsxprHVZ1nn7Mg//m2LYYOFCL8qwYqdJKKIn9hccrg1K8FQIVTAQnCBBmU0uOxrWz/GuNs32SGbNUklvIiWX47LIKff7ttXNslAMNoPp8mlI4gmxZiseVYGNaGdEQf1EZrjoZWdzQmVa+cu4TzJLehgsi2/xPMImR2ACoQaXyyeMaTWzJ93tqrgqUDMpfH9qqLP0BubMibvqo0lUDiDgTuJnmTREVOVxp12+CAEiNV8wwvMeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:47:31 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:47:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 2/5] ARM: dts: lpc3250-ea3250: add key- prefix for gpio-keys
Date: Fri, 14 Nov 2025 12:47:09 -0500
Message-Id: <20251114174712.1206027-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114174712.1206027-1-Frank.Li@nxp.com>
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12102:EE_
X-MS-Office365-Filtering-Correlation-Id: fe60b742-d75a-4e41-0f90-08de23a5e284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gwD2YgS9VF0a/G/XK/5GpSFcY6h7yobcipS6lXY2+iVlMG5vp8GdQiTYWyZD?=
 =?us-ascii?Q?t8cM0YpBNj/0Q7OipfOwtRWc6RyUFfLrb5SXYQps9Pjez2DpaWOeZHI2xrxa?=
 =?us-ascii?Q?wclhGR6OinKw7jn2MXRWsVr2nj99uDkjj98lGCiyXZZ1qNQGUnTPMqSdNB9h?=
 =?us-ascii?Q?+DWDmnD6xR+X1S52SaVbmPODBelv5y5BA9Pj72GGlnXCfTDqxBnoiFMfOZHr?=
 =?us-ascii?Q?JOkT4/ZONkeULUoPnuDkdj8UwYtId1/e8ugvHZpUCeTMwyAb5/99tla0s7G/?=
 =?us-ascii?Q?lfsIV4ipsFMZFxDY+j9u7TZZqLP5umtkOkJLBRCUGjYlyKmQY35/FrXXZKre?=
 =?us-ascii?Q?8zHfrLI6B037bLv3PEctGDQfbHKI+oHT0v5O7ZPLaoSNWmXeql0MA7fyd6O4?=
 =?us-ascii?Q?YVnzWG34tXZffwVI8+ylyq7iu9XkhepMh/hrlYKXoWn+j+cDM4iU8/n1WnPQ?=
 =?us-ascii?Q?qtTlpuEc55OCSAvWG7g2aVEqruLTfKPENWUmbFLk0twQGp/OOh+S8/aOKst3?=
 =?us-ascii?Q?ZikVPzVdnS42N41ZuMAsaVom6AZygDtJFES+Nv1QEwVU4bU4N2SxAGkqLnF4?=
 =?us-ascii?Q?zg0/DhYyQ/TJlA7hMhOYjTOoVcVR9GRiXaSTYF04YQvejCAV9ERO5c5FDmEE?=
 =?us-ascii?Q?NuBnlZT7TrOD3Xsgaum3WSp+181n2GDQR/4lLq0mptuRmdq6Stmm8XGJM+FV?=
 =?us-ascii?Q?HuNiH//SyBJdX5bSMh5QR1DRKqyV6VgNDcyUHN/QTPVeFhl5/HD4lvjG7Gdg?=
 =?us-ascii?Q?98avm8urZ5U3dM2ridWsMaAYKT6+HIzY/mkEsE+LSRKKAAdNKMEInX6CF8Nq?=
 =?us-ascii?Q?I9kGBeiDo2xiVRbL3marnwJFvfAZDM/7ehS/L4W4RgAvrzVuImP//rTQ+iTp?=
 =?us-ascii?Q?aaJmDuXfrmUeyVhpUFdSjPVOte7F/ONff2xgP4eDB4sY4ST+gzQZwEDArRMN?=
 =?us-ascii?Q?znjwgZdrjo/WIZ7m3itRcwdOy+ld9IvOLB2r5cjANFO4pTcaPN/5owHF+E8W?=
 =?us-ascii?Q?/Rb8dOrsNMiD4cnFsYKfnu4XJOKwUnB/lrzigunu6fEhSJq6NB+8ECrrN78S?=
 =?us-ascii?Q?abFXiZicYld6gCY+CziVI5SzqGc9wPXZtjzCz1HuvUWvpOhteXHGgHzpAjVb?=
 =?us-ascii?Q?YEhTaJTJpiObWmo7xAc24I7wyRRX4Jr/UTKiPuKMT6mkSmDsAg6Pon+3LxsN?=
 =?us-ascii?Q?l9pZtnXfoH0ksipWG+S2H+RHm+p9qkmSTugxvY6l/4qaj4Sufw28slwIE5RH?=
 =?us-ascii?Q?IbbEfG6QXm1BlVNt6GmfK/qq8/oJAUVde7hkYgEZX9HQ8Z6KCvC1C34ZprIa?=
 =?us-ascii?Q?JMOrlgS82apZ2+2Hmx2WSSqnNhyv33UigJ35VjFKNANwsW0FcG2eiD9wx9zy?=
 =?us-ascii?Q?9hTESzqNgd748zv4RMRB1Jkps5oxh7dEINA5tcLQW0tYcyfyUMpBnz2yYSfg?=
 =?us-ascii?Q?o0CR3iuX20Kxxr9itIMV74kXL0zGVrT6kyXcFEsm6AmNvdKxwIFLSl79fjrm?=
 =?us-ascii?Q?e4geieAfyiYFxM9NFgMtxhIKI6eUcc4mR1le?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8MKG9UJU6+y68+HWS0fHRLGQ9d5Ser5PO9/STltBS9D+KnNv+KMCpZm8Gmg0?=
 =?us-ascii?Q?LNgLG/r3xlvvfsbJ4GJdlMFwI3+H9+Gy2mIXUkBT9ULrysn0TxYmok5LJWYs?=
 =?us-ascii?Q?LQB16jidbVV9xJE70qHpW/qHUeZldkFKtK4nP/yKeThbEXSEW7V94un3FQWS?=
 =?us-ascii?Q?nQyFo/EqlbGESFw3Dm9DNLsdWlBu+FoLoNd2tKa0OU69JsHFkdh7bVZx8WeM?=
 =?us-ascii?Q?r5B9pSB5VPhw8ixhZtOeY3YzLUF9eYlpC8GnOdJ6g7qQr9yE9yY5XT4psq37?=
 =?us-ascii?Q?klUkdSkJyjjsYDNxR+fWoPCgJNcAFpbIs2R3YxqZC00NbSuVQFxjoirHpOKt?=
 =?us-ascii?Q?YKIbWzAaPKEMp2SvhPgwM4Ns8Kk5VdBE4KWYz999CQ3vMiEqXb/n5IvDL3Gl?=
 =?us-ascii?Q?S3+codYiEjBFbCe6JgFQHvpmS14YoOfeK+NAbSWV2ahThBcCuxlJ9DfG2SRt?=
 =?us-ascii?Q?6eNup4l8Ib7DARUphcqhnkhx0LnH3x6+3AihLjzsHSUmVg/KO4JOZjDEyqLT?=
 =?us-ascii?Q?Czb/2LRzF5wyvo4tb450hcVeRcj0EUG4NZQVTs6HXuYWLT6L6KSCe5OCoDVW?=
 =?us-ascii?Q?MnRyQ7XMzUGn/vY1TL60C3//YGc3YQwzUjdztTkeA2Q+z//kc/dCnrB2F4u/?=
 =?us-ascii?Q?k3w4Mhs+5wVyUj/ouYGXEo1zLQgf+ymYLuUMyV4V4zHuNj1FhXr13yqCHnWW?=
 =?us-ascii?Q?v9pOI5V3Mns8GEvm3vizWZ8LNZXrOcp/bHv3W8PdzCwdy37+9TfAU7vzdoTS?=
 =?us-ascii?Q?opULd/Wc137eBstzSaP9bCFhugOx8nO4h1zz4Fmano9Jm4SO1qIHHIp/Dpnp?=
 =?us-ascii?Q?w1bZkJZ67rTyx3GSz6uwUOd19CH/aNafFP0potcY4v1+bTzfCxr6QtTvOo5y?=
 =?us-ascii?Q?63gY1C2vJ4pFmuano8m5utrY35/0JOQHm5a8ssam/rBt+igoacqTVbrm/9uQ?=
 =?us-ascii?Q?JtU7YABP8GYkX5YG7mTH3hwH/BtDF0sbZwKfBmwgruVZAuHzeN2MaNjdIReg?=
 =?us-ascii?Q?UHK/mmZG9IC5NOoSuMdxDlBPDWGFK///eNAQ9hwUioWu7e/1/frXA4Glr8Em?=
 =?us-ascii?Q?dPhWpzja6ROoVzGgHLYbtbtp9omw90+J7p6KFdsh2v6USo1hGYbM/SIwsblr?=
 =?us-ascii?Q?vhm4I8hpkPSGdcF2+S3kayWhj/u43kvBQ3FinqLCWW/Wo+7/KcZPDSBOPKND?=
 =?us-ascii?Q?imzC1L6tCLCggObV3pDcrLJNpFq+otJQ4E3ZJ725z7hVHc3ih5zmyIGZjB/Z?=
 =?us-ascii?Q?Sz6SbxyLgAac1vDQ34tcMnTRs3K4EM5teqqxbsUtk38bEPOtr7kfv3Q7tFgD?=
 =?us-ascii?Q?yptrXOGaHlLUiwUh+xvCj+6J5KeVNwdq9XNbkKqp8+iWpnAlzYtqnIPGtN3O?=
 =?us-ascii?Q?hEY1CCkVcWRaow+sVpkVHVglr1eisIx6gFjjOT8T/WiJsOCnMgFRdMX2YxrB?=
 =?us-ascii?Q?NvXLDLPh0qC/gC+t+l1kx6DPc2NOHJTFA1Wm8Sd89G5Wfm/0jWAMo4b/tpUd?=
 =?us-ascii?Q?szeXOTZwhsly8VFmEtL3YHcgsnpZsoFPXUGZdtqYnu3BDvdi+VTLH/rClYKl?=
 =?us-ascii?Q?8KYc07vAfKS5/ZeRh9vpF4anZpryDj8f0ecCW4Ek?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe60b742-d75a-4e41-0f90-08de23a5e284
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:47:31.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nys8SVVW7JxnC+hMi7pRY7YXuBYJQpx7W4DMz4fZb2CcDr32j4URPauVe9H1oAZcPsZEAr8Op1LlPBzHJr7gfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102

Add key- prefix to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: gpio-keys (gpio-keys): 'joy0', ... do not match any of the regexes: '^(button|...)$', 'pinctrl-[0-9]+

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2
- add Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
index 63c6f17bb7c9f..837a3cfa8e7c8 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts
@@ -27,55 +27,55 @@ button {
 			gpios = <&gpio 4 1 0>; /* GPI_P3 1 */
 		};
 
-		key1 {
+		key-1 {
 			label = "KEY1";
 			linux,code = <1>;
 			gpios = <&pca9532 0 0>;
 		};
 
-		key2 {
+		key-2 {
 			label = "KEY2";
 			linux,code = <2>;
 			gpios = <&pca9532 1 0>;
 		};
 
-		key3 {
+		key-3 {
 			label = "KEY3";
 			linux,code = <3>;
 			gpios = <&pca9532 2 0>;
 		};
 
-		key4 {
+		key-4 {
 			label = "KEY4";
 			linux,code = <4>;
 			gpios = <&pca9532 3 0>;
 		};
 
-		joy0 {
+		key-joy0 {
 			label = "Joystick Key 0";
 			linux,code = <10>;
 			gpios = <&gpio 2 0 0>; /* P2.0 */
 		};
 
-		joy1 {
+		key-joy1 {
 			label = "Joystick Key 1";
 			linux,code = <11>;
 			gpios = <&gpio 2 1 0>; /* P2.1 */
 		};
 
-		joy2 {
+		key-joy2 {
 			label = "Joystick Key 2";
 			linux,code = <12>;
 			gpios = <&gpio 2 2 0>; /* P2.2 */
 		};
 
-		joy3 {
+		key-joy3 {
 			label = "Joystick Key 3";
 			linux,code = <13>;
 			gpios = <&gpio 2 3 0>; /* P2.3 */
 		};
 
-		joy4 {
+		key-joy4 {
 			label = "Joystick Key 4";
 			linux,code = <14>;
 			gpios = <&gpio 2 4 0>; /* P2.4 */
-- 
2.34.1

