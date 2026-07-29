Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB248A2C3
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330274; cv=fail; b=uSYJQIZriP6l1N+4IZI0b9P6qv78NRZujU5OKeoUSg01PRTCOoRIwrg8EoPAB2wZXrVOOZJCi9OdeKRISxtbKAKnSFQfTevWKGskaYGz8lF1/QDpGPjoXglA3GwvFFmQoYXmftMEZf/yM+wZnP/IavloLleVFzQvafItdy9wVkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330274; c=relaxed/simple;
	bh=OckB3UpjyclWpEIbhSJFOQp0ZfGIaZhwbPJ5drqQcGQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nj3sBW+4nKJXWbzzCdNNO/WsbtGnzofkIBM5PGi70kvzVJ8csHW3MkQckr3ZOxVnxp0UAs5xr9FnQ4twlf/od074t6pTH7TK+LFxMMMepOy0L9ZhtYyBcTX3GilQgVRa9SXsLWe6vXUryQkhZmRvh12g6fmvuSdpARecFCGeBwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RWwo11E/; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RWwo11E/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2vRmpD4oTbjWBAEeMTb8jTRBUVv8GrbltEutcjefxVGS6jsm+++GTMLQApeDa3w0wnnmV1skgF2octvClr+JUaAcfRtaz96qvem4xX4oG/USMk3jyElBHnfw58SewHlSgtuYSmIE/XHy3wKvmZr4HnTqF1wjkzYmPpfEakRtGALm+EQsGPllvRm31qlQbaPT7NixzXAxszX0HP0nnBB6fApH8Q/DJS0eF/QSA47fTk6BGF8Xw1sRyCFQrhBRFLLYVNgB30Jycubz5+9oVodmLaiJSMEy48gcjZuicMB0yL9+7ocZ+ba8hXT1+GDXS3oj6DYBQ6vLwfsLQgT/MLh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66MFHIBvXEMP7hEx3oTBcVEhar7wmCBQ6zkHirh3JP4=;
 b=ZtR4b9d1iFA0YVBkNRqpqxGyUNyxur3i0VxIDGfGS3+TsGJdyXOWIbH/WoKGubCBmNvMQkWrudqmo1CK5rJeS38fbyKiY7lYWEX0sfhT3mWFYkxtAaAYQJF1iHLQTImuPGT+mN9EfzfaDF6HOOuuM5eDgp/LZESwKCI/BUsBGNBRh6Gb/xF3PynUYc5lS5Qxhto8R/eXiifik4su/f67CV9nXyMziceYxFQgOXQJ3xR65FDHrGru/KVveSEgK4bH7ollbUzcWiaKTSyGTpkdv9r2CRdsTfpFkbvG79JLtjKG/tNC8PcD85NdsWAMHCElf31It2JX9HTICsn4kTEfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66MFHIBvXEMP7hEx3oTBcVEhar7wmCBQ6zkHirh3JP4=;
 b=RWwo11E/rF5gMP+PolaPSZOi1/I3EyKzX0bePS4TYrepw9dd9D8YMiDv2bDSr/Leb0P2oHCPs9eoHaI+OR7pMUd8R7UPoLPewOfK/GB74gaYJwmLb+TUOW5YOZc8+9QrzN0iDCOWVPXXJEUm4kE0zqEeFSV/XspVogA73XYEyuJ+pIlCneEf7b8lI6rXX0tOzb0i0098kCfpvf9HexIY62FSQ0CGWYbMitYPNDSZF6PFPFphHsO0Wbf9/P9BRAUS2UJ4EqmbenCxePrY8Bf/ovQlYYg/U1TthKzyKA8tHOXUcspk7ld6zl/2e3dPrum7njvOkSlWNXHsfV3VH2VTrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:04:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:07:58 +0800
Subject: [PATCH v2 02/12] arm64: dts: imx8qm-mek: fix reserved memory node
 names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-2-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 46adc999-16d3-4a90-25a3-08deed71ec61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S7RQGDaC2zckssLD4QcIUJwIDxVyhNCG6+81lvk9LI/93OBE22XMCdUgY8mojWjPz/W8F0fr5gFqW3b4R23CuNW0h8MyPaRkOGugfjiIJnuWS7pKD/M3/gCw6QEc76mk7zLoRTunLvR1spnffXHmR5vuseeDLYeLDQMVcaCjsnUoQBJEJV58XS/eNI0X1ftBAH0eMrFLdz076mDOUK964K9YsgtddG4PRXRyLx7SCTGhmmaFzsAeoZD1EYRVbN1TTa78QH6k7CsEjSdMP4k2P0+6en0n3Yp2j2H9zOtpyeK2BlESyrjsadAc5qacOV5cjuMofwmG3QVVcE2NM9gBwiGrkj32Y8BzkZmfFwGnu0SdbL9+DnkKkARgT9VCmbKbq92yS1ZIUg9LV/BsUbXiOquOf4/tHJv/ZxIWc/j5VSu9BqZWHfqpT27/mIROz73C46ptnpOC2+t4QPJ4SL8ZqWW7xVGHzIJGzn9Qa9Kb2P08WQfy2E18/yY22pk70eg+7MVYNHcApbyeYFTZ52LpcnDt8WdNIoJkH0+yWcLz/41CpXzN9DMQqywOPr9h+2XXJn6IWUzhPmFwwH3ELuejcqSADPJQbVu+yml5SeGFIJp0wEUCXvsf9llRgetzl889+XiVOCzaPLuhTV2utoz1HbL5fwFevpv8uGPDNH6nRVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDdLSHFDWnJLT0FucTd5ekdranFxM1JHUDFUOEdieGM4Nlk1cnlJU3VudVRF?=
 =?utf-8?B?OTAzQ1VLdUNGcHcyV2xmbmxDMVhFeXpxU3pHQlQ3ZjRRT1gxQzhvaEpXQlNK?=
 =?utf-8?B?aXp0OGVtMDFTWktVTWIyVnMrVWdUeWRrdXAxNjNYTWhic1F5NWM3VU9wT3lo?=
 =?utf-8?B?clFGRDVLU0tzVTJ0dEtHRE9idHk4YVFhRFpnZVZodW9BWlI5dWEyMmU5NStp?=
 =?utf-8?B?ZjhLaGVMRlhiZnpyTjIrbVBjTGU3TW1PVlRSUlphNUJkd1N0RC9PczBnNlNh?=
 =?utf-8?B?Vy9waDZCd09vQ05WMU9qc3RLWHZqKzIvMFpLN21zdlBrdVR3WlZXUmwreWN5?=
 =?utf-8?B?b3R0UmozT0ZycjlzVXJVOHNiSXFDbktiZkFWZXd6NDdUcVpMcmlvVmZ2Nkxk?=
 =?utf-8?B?UU5HQ1ZGMkJBcU1WTzBOSFRNM0tPZW1rdW5FaElVdEtkTEhmUHNoOTJRR2xs?=
 =?utf-8?B?NXh3c3VDS3BRSEJvM0t0aHdoc1dUeGxqN0VpSklWT005QnRrWk1YV2tnWVcz?=
 =?utf-8?B?Y3VxVzkwaU8wUENyZElsQjhVYlhMSzJVYTg0QzAybE9ZakpMaFNuT29IREtm?=
 =?utf-8?B?YjQyMEVPcGxkMG1rT3hDVlZQT0FnUjFHYlgvWCtpbWp0MWRsSEpwWlZpcG1G?=
 =?utf-8?B?eFdtSDREWUdqMURaaUEzdE4rM2ZBQ3VkS1BpRjNVaEY4YXZicmUzK0IvVG9V?=
 =?utf-8?B?U01aZVJFcW0veHNkNWtQRDYxYlljeU80eEY2MU9sNzh2am1DV0xrK2lWdW9o?=
 =?utf-8?B?bHUzQVdLdHBKTE1WR21SMjFZWXhrVTdMRVdxSW1PdGpVZ2ljZndFQUd3bzhZ?=
 =?utf-8?B?OEhpeXFwTmVUSUN1MmlzRWdGUmphQXU2SHJiUnpnWSs0RW5oQ0xVU09aTy80?=
 =?utf-8?B?REd3cnVoSE9iZ0xveG1TQ2ZvYTYrRFB3cXVUZlg4czl5aEE3M0YzRW4wTUQy?=
 =?utf-8?B?ZjJMamwxWFh6MENZaGtJdDNrL0lLWjA0NUhhN0JleVV5MWJHY1k1S0hWKzVj?=
 =?utf-8?B?Y2R4YjJQZlhjRytYbWtnWGZUYkpOSkJrNG96TWUzbGUxbk5sU2xEM0tRTncz?=
 =?utf-8?B?aHNxcVY3cEVmak50ZTQvTGRoYktJdFFlNlo1dXo5NmVQUlFCTDhlNXYycUxB?=
 =?utf-8?B?akJjZVAwSE1DV0hublJsUEhkb3cyNnl6OVAzbG9BcGE2SVRBdW9lMHRlSW1P?=
 =?utf-8?B?eEhCald6UzZQU0luTGh3VzVYeGlHVTZDRzJqTE9rR3pnMHM1c2FpMzZLRnpU?=
 =?utf-8?B?VDNTM1l4aTJxZjFlNGVxNFNxWDN2bGFsTkh5Z3o0dVdrZjR0ZTNoc1EzYmti?=
 =?utf-8?B?blFwdFBpV241eUU3TEdpekpUR0xTM09aQ0VZSk9qZnovOE14Z3dob1NFVkx2?=
 =?utf-8?B?cURKZ0paOEJwQXBJck9CMHdWSUJHY2tySE52YmVVNjROUlF4RnY5TFBBL0Nr?=
 =?utf-8?B?R2pKYVdhcVdmU05UVU1zOVpHNnEyR0l0cGlWUUhaZ1NpVG5LQmdGbUdGSUZw?=
 =?utf-8?B?MVhxOC9sTmJqSURWL2tuckVSUk1LbmVNNUlDZlVTTUUzTHUvZHloRlRJVEQx?=
 =?utf-8?B?emh4aHh1ZG1VNmlWR2hTQzgvYTBhbktKTG1uTVlBNlEwK204a0ZyR1psRm11?=
 =?utf-8?B?QzhOWS9EZGF1RStFY1RSTjV1Zk9aUUhGZlh5S2xITGJSU2crUTY1UlE2dTUr?=
 =?utf-8?B?SnFXaVljSVBmNzN5VjhXaCtuOVZVeDNQY3dvWVZKUHFidnoyOUMxM3NBRmhw?=
 =?utf-8?B?MEFIN3ByZmFDOFliTnNPTjVkTDBka0x0VVpMMFNpRUErRnE4YWRscXprRkY5?=
 =?utf-8?B?NjNTN0N2Nk53YkJWV2lrZ01DRCtNOEphdlo3d1Y1Rk5tMk9ZaENhSHh5cmpX?=
 =?utf-8?B?YWhkOHNTejJBMW5aaGl5SmE1QjFqVlJscFdYaCt0N1hFaXV3VS9tQWVzRGpV?=
 =?utf-8?B?QjJycVVycE5WbG9pa2hsYmRSSXp2dFp6MFBXcEp1UCtHeDhGV0xES24zYmor?=
 =?utf-8?B?VmUrVVBuUHBoSHZSS2ttZ1hac2ZYdytiMnhqaU11bktSekFpQ1NyQnEreXJT?=
 =?utf-8?B?NjV0alpBd3dRc2dCVjhMRWtSZDh1T1pET09vbTA5VWJFSks0QVZEK0syVlFo?=
 =?utf-8?B?K1Z4T2VTQWw5ZFVaVVcyQ1N5ejNodGpqMUZkOVhXd000NCt6dW40UldPSjBD?=
 =?utf-8?B?ZWR0eWVMWTVZWlZtWDJjUzJmb0Q0NGg1bk1wOHQ3d25OdHlqVG1QMHBRMEVF?=
 =?utf-8?B?cnZtYXozVTFUdmtqbWtiZXVHTnMyM25IM0QrekJqK2dHd2x4TFM0Z09BZ1JT?=
 =?utf-8?B?MU8wMDRLS1hxVzdTekU1V2p6SUNvK1FqQ01oSERKeEZPSnU4WmtLekxrajZN?=
 =?utf-8?Q?6ptbyU+Nh+IizLDISXeo1rOyLx8c6mF34Ojg6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46adc999-16d3-4a90-25a3-08deed71ec61
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:28.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1N6sbDVP3zraayL9k1LXq1AZ6p3nrEW6Ow1uZ845o+qtoo/K40omLf2sDqHWM58cG/QePsI68EAP8ZFIjETilrWmvRpx+gW7bB9CouvrEZ8c7yQkmHIIQrxadJZeTSI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: 52c9971edd4f ("arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 9e49ac377162b..8b67fb5d670da 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -44,57 +44,57 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		vdev0vring0: memory@90000000 {
+		vdev0vring0: vdev0vring0@90000000 {
 			reg = <0 0x90000000 0 0x8000>;
 			no-map;
 		};
 
-		vdev0vring1: memory@90008000 {
+		vdev0vring1: vdev0vring1@90008000 {
 			reg = <0 0x90008000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring0: memory@90010000 {
+		vdev1vring0: vdev1vring0@90010000 {
 			reg = <0 0x90010000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring1: memory@90018000 {
+		vdev1vring1: vdev1vring1@90018000 {
 			reg = <0 0x90018000 0 0x8000>;
 			no-map;
 		};
 
-		rsc_table0: memory@900ff000 {
+		rsc_table0: rsc-table@900ff000 {
 			reg = <0 0x900ff000 0 0x1000>;
 			no-map;
 		};
 
-		vdev2vring0: memory@90100000 {
+		vdev2vring0: vdev2vring0@90100000 {
 			reg = <0 0x90100000 0 0x8000>;
 			no-map;
 		};
 
-		vdev2vring1: memory@90108000 {
+		vdev2vring1: vdev2vring1@90108000 {
 			reg = <0 0x90108000 0 0x8000>;
 			no-map;
 		};
 
-		vdev3vring0: memory@90110000 {
+		vdev3vring0: vdev3vring0@90110000 {
 			reg = <0 0x90110000 0 0x8000>;
 			no-map;
 		};
 
-		vdev3vring1: memory@90118000 {
+		vdev3vring1: vdev3vring1@90118000 {
 			reg = <0 0x90118000 0 0x8000>;
 			no-map;
 		};
 
-		rsc_table1: memory@901ff000 {
+		rsc_table1: rsc-table@901ff000 {
 			reg = <0 0x901ff000 0 0x1000>;
 			no-map;
 		};
 
-		vdevbuffer: memory@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
@@ -456,7 +456,7 @@ imx8qm-cm4-0 {
 		mboxes = <&lsio_mu5 0 1
 			  &lsio_mu5 1 1
 			  &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table0>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
 
@@ -471,7 +471,7 @@ imx8qm-cm4-1 {
 		mboxes = <&lsio_mu6 0 1
 			  &lsio_mu6 1 1
 			  &lsio_mu6 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev2vring0>, <&vdev2vring1>,
+		memory-region = <&vdev0buffer>, <&vdev2vring0>, <&vdev2vring1>,
 				<&vdev3vring0>, <&vdev3vring1>, <&rsc_table1>;
 		power-domains = <&pd IMX_SC_R_M4_1_PID0>, <&pd IMX_SC_R_M4_1_MU_1A>;
 

-- 
2.34.1

