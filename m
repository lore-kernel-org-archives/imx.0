Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CE029D26B
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288160; cv=fail; b=mMgMrfS3LM9UUtuAKOsMry5yhxs/YvhtESHxAnPW0+6W6i798xhfKkXSjwa01sHCAtOMpS9pYAxwxzGHYTFtRcyDVU5FgMTNKm3QKE6w3FLMNJ/ibTl907kcwZoweuutvWHeyoej1y+GREhN0ZFUvzcdn3MmzdLQQNepNYwpI34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288160; c=relaxed/simple;
	bh=Qkn0FPjX2zRnSuytel7Pa5BMYjyz3BYgU18sJshu6dU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r3xwLe9dHcp8rlTLAYXMCcol5cNYvc244biHTt71hlEeKaFkKyYVzBqJQyiH82aWUOIVvYirwQAuBNU98v9hZDJbcrbPPhRFLvT/PYYk1vwTDnmPyMUNYg5fNDc2cIhNsacElfjmAdZxzc7cTGaWyC3HHEFWbI4pu3SLoUAdAK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RJiqI77Z; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RJiqI77Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhCRZOn9HmTvLrqWumjaiq0yjGBloXzw+gWgzGuNkkHrRm75j+882XvjUMrhaMc9Pv3f4JieafBEHUm4nz8sGIL9h+suSZk0aRguTWZqX06bLFeHs1dWBHMgs3E9s/NTr+Z3Rk8FFv1DGfmg+JYtpzShtmiELkba8AD+UyLfNYEq+QaNjfmTzC8ZQvQ6DwQY34PBUw+G0ungl30bArblZQsMv3JMNhAoyY5TR8eMbKlEcrshU/waTdkp7GZyVvCX0/LMTn42teozNFYhL3CynkYdmPcNlsAP3V9bZb8uAzXh8yXg+r+jQpCTUmf7txVtlJdoT7ZOIzgN5ty6pK3yHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcHQQZdduSPJDOzuC5+ZrtysIeA0TLoHjzlr1E34OvE=;
 b=WwHqY+SBFJ6kI8mkFAcw5i7kwpsVdcxx0fuvduPDYj51I6/3FHK+Z3rFELH1o7WNDeBMIccSrPHI2ZFiD7Kw6Rj8wI71NnIdp5eWPX5NBJTgxrfvAp+Li6nHqLm2dmuk7OONsIuojBNElIcTqWTy5td9YdTzfLsqIjXZfqbrckajTAgOX5ioPzbcZg+yFZ/gGCkaxlOaBeFLOgFez4CUUkVoSdu5YHhP4DyKNpMtUSj/O9dOTHeZk8fTiMz70I6tQ5ftWGTCxwMDFzxra0Phv588DiMGd82AKLIDrdbEptvVlujwEDL4W3h2ShaLFRG76zCXbAX5+863GlyFmLLTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcHQQZdduSPJDOzuC5+ZrtysIeA0TLoHjzlr1E34OvE=;
 b=RJiqI77ZLv17T3LYIt7n/OiGz9kISP+QZtRevurmGRnzxe2EHv6yRqdBIPv3ypwStV5vdxjcZxV+63sQiZ2Rn0jL80r/yIwA3w0MSqhFJJJGqvsRDcDf6888/mTw5FWJs7NzI1zhPafk7iY1k19eOG1xRCZPR5i0uA70mJuWAwIrZPthrT64q7F9yS+ZyYPRM8A3EdwKgOI5y7wXsihLUjttZv3piY/mger3xUOjjHM+4JjavFPG5lJpj+Uhy9XgpMj0dUcLYGHScj3dR8tRgyZE02ceLPEpDGWniS150BGLeUip0eOfNcXqcwXX0mQ7hh0GTwlbVdxsfflDBsxYHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:41 +0800
Subject: [PATCH 6/7] arm64: dts: imx93-14x14-evk: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-6-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0142.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4186eb-4246-4c02-ef5d-08deed0fde95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZSB42/WtpIZtbJZTtK1hDym4c1jd+uT7p9w87M7y0yAk0wcl3rGKohpZOABMAO/t+kLTaIe/ONdQSPZ5NSLd27pBxjqRXoB5DwSBnfNGmp6tJWmdmdwPDHHnxXzUvO3lVJzaGmPpNq+b9knquxQPxTX9kQF1rwk2ujC9NiLprqRAbNhouVkay2M7/rqCMexmjqS50yz+a+aObz4PEW0FJFPlIX29lXrHFZa/V9qw26r+mDswsvhIWymQbLWQ9hU6InVnbnG0yoqS7TmeuNguM8QhSXyPMSI3zi1FiUpmnhUrGaiIA+XPLPWVAwTnn39gSWj9kQlzll9kiu/lxnenDwHRgPGAefuyceNDMVT6SY7FGm2rbMXytgsZNzHrUILnbiPf5ZuHnpxxrdnM34dwYTte55ryTPpG7TNT/pddZKJPk+yuJwWI2OPRqss/OIyPtHw4Uzw8FGXvB6m0NHVBZUAKp2nTGN3sZU9wV6dqBboRxgzQ7fTO4njmDkG3Rfca/eC1LrulIQS18nGtfIoWSmHSnPAWI+EuAGj7ywu+xdjecs9vjgqO+BXLObDxM84FLrkkUsvPIYrMCSNg3gpXy0UH3EzA/DvDcmzV/M+lTZueEpHTyV7BKCsOIik2qBZ+TbTwKoMWAoGYWAcKLxU9OLBpBawn4DnRDiXUukwjz+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlQrY09wS1NQYnhOdEJ6UGZaY1QrcThldHkxbDhxR3RPL2I4TEkyWlcwT3Bj?=
 =?utf-8?B?NHR5T1dtMG16ZVlCQjZWNFR3MUNJR05JYzg4WE1MTlJGbEpwUzB4a1JabGZF?=
 =?utf-8?B?N09EdGxPUXRxSUVMM0Q0N045NE9lS3N6aVpnWTRGZkRjSGN4WnhNZ1NheUZH?=
 =?utf-8?B?eDVtTEg3ZFNVWTI5a3Nycmt4Z1VxbFV3UmVoWVBvTk40S2x2aDlEQ2xPUG5a?=
 =?utf-8?B?YkpQSkM1Y0t4NjZLa3p0VGh4NnRUd0Y1U296TUthNEsxSW5tWDMyWlRlRWMw?=
 =?utf-8?B?dVoweVV5T052bmtubjdDbEVBRWhBclFjUHptQU5la0VrVDZTQlFyT1BuMHBn?=
 =?utf-8?B?M1AzWFRCd1Z5ZWZUMXRMM3lOZVBhNEJwbDN2bUhoMzJZejJwK08xcVl3UlpS?=
 =?utf-8?B?QzVtTGgxdjhUV0VZMWRZOElKSVUzMk9MaVdYU1NWRi9kcGF0S3pYZVVOdFl5?=
 =?utf-8?B?bmExMGVpNXprV25XTytiek1VY2xEOEJ1bzZIaWFkano4Si9lOG5ZcjlrczZK?=
 =?utf-8?B?czdySEdXQTFpK0YxeXVtbWhGRTJKdGVpMUF2RnlQcjhaVFRPclFvS0V2Qk9Z?=
 =?utf-8?B?TXpMY3ZlQ0tGY2J6clFteEFibkJhUUdHTml4M2NVanhHN1VreGVhdmtxNWFK?=
 =?utf-8?B?bmtkRG83OUVnT29BU1VMd0cxcTEvUXZHN0k3WlVNVHhZVm5VQlZVV2xaSkdq?=
 =?utf-8?B?RkliQXZkQmpLNlZySmdDV0xiTHZjZkhpU0ltV3Q5Mmt3dzR5ZDBSQ01LclFx?=
 =?utf-8?B?ckJWMVZpRjBNSWFQRmF0L3JCc1lobU1XUUFuZTViaWRlcmNSWWZHUitHSGEw?=
 =?utf-8?B?b2syQUszN3VXeHhXeTNiWFhxRlZmcnY5UHdZeFp3Wno5V01DNGt4UkE5cHR1?=
 =?utf-8?B?Z1g1M09Jc2tyKzlMNDN0VnRrREFIUk1OMjhWVHdldzFpQVkyR1R0Rm9vcUhS?=
 =?utf-8?B?cHFDbm8valJPWW8weVhLS09mRlZXODRJSGR5bnJmVnQxdE5qdU9jclkxdFpQ?=
 =?utf-8?B?VDJEVW1ZT1hsN0gwTW50cFRUaGx6TjhBWmxkcWt1aElwMGg4VjZBUHRVdWpX?=
 =?utf-8?B?L0JCZ01xQllNdDhsVE9XSVpQSS9icW15U2lKYW1lcGJrSTJpVnh3WDE3TEdq?=
 =?utf-8?B?eTRLUDdiWGovL0ExeHVwdDBZU3F5ek4wS0xWVUdScVhsN1RwcDl3SlljK0cz?=
 =?utf-8?B?SlRieVNUMDFJMWtJN0dGSXRwd0FKK3h1MFo1M0k2YjRQd0RYOS9ycnk5YllH?=
 =?utf-8?B?R29UbngrQklTdExaV1dMcFlydDBwLzJJc1lyd1dCNXA1aHYvVGY1dzhhNFdL?=
 =?utf-8?B?aUVIOUZkMkJZakE2NmhKTDhabUZmS0k5VVBuLzliNWo3Yjg4UlloV1J3b2Js?=
 =?utf-8?B?UUswM2w5eGJEdEtSbWZXV0JMV3pnTk9MVVNxcUFiLzNsc0gwcS9oVndzZXRK?=
 =?utf-8?B?UHpYMXNtM2t6Y1ZOZHVycjNia0xWakVZRTJZV0hEenlKdGlEZGVQM3ppekRI?=
 =?utf-8?B?L3pUNVFBb0xaVDlrOVZLU1VzeXJqQzhCczBNY2I0S1lTQkc1UGdycks3MzhS?=
 =?utf-8?B?TE4zNEdDY1ZuQXlkL09scGY5ZVZIU2JSTFdyTmVENzIyWDJwdTdHZklveFNT?=
 =?utf-8?B?UUNOK0p1SUMxZ04rTWJPMk1EUHMvV21vck9USGVMcTFGcmYzc0hLSkRKYkdu?=
 =?utf-8?B?MW9SMjF2U0x1ZWlWVGpoVkZqdk1VeDByeGZydFU4RXkrakhacm9Tc2l3QVJT?=
 =?utf-8?B?SERGeWZBaFJHL0hCVzVTMUM4NE05SEREYzNqTFdrdEhGejE4cHJRemhabnZX?=
 =?utf-8?B?TE5XMm5CSzNGNjNOLzc5UVNqVE96eVgyd0hOOGtramIzNFR5aENIVVFwbTlH?=
 =?utf-8?B?UjJ2UHdjSVBXcW5sVWJMemtlS0t6eUc5MjQ4RFlabFVvTk5PTmN2WHp2ZE5m?=
 =?utf-8?B?MGJyM21aY0EyOFU0Z3NuQ1hCajNMZGR0MncyVjA5dVNaWmZpZnI3dVBza01w?=
 =?utf-8?B?Wkg3bFpuK2dkOUhzdHVVMDdjRHJHenBMN2htMnBSM0dLTUJiS3cycDdJMDBj?=
 =?utf-8?B?WVYyV0t6K1hlbXNsMmxpTzdsNFBrUGVSZlBHWXdmWStwaXptVnJ6amtZVEVV?=
 =?utf-8?B?L1JJYnRBb1hyUkNTTzR1Mmh3djQwTU01WmU0WHo3L2dvZDlMR3dDbmNtaFR4?=
 =?utf-8?B?b2VNNGtmNCtkdGxORDBQVzljbHBlaWd3YkxGYlQ4dTFIRjRCLy84U1gxVk1u?=
 =?utf-8?B?Um1QQnphckZLU3grOFFROTJzSGh1Q2xTM051K0NZWjQyNFpuT1VLQnpHbGVz?=
 =?utf-8?B?Rk1YM1Q3cnJFaWV0eWxJMDhKcUNuVzVMdmtkVjU5NmFIODZmb01BQ3dlNGxZ?=
 =?utf-8?Q?gERGpv6IS80Y1tQDOLf7kdSY/0g3xRZCvxlNT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4186eb-4246-4c02-ef5d-08deed0fde95
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:35.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q+nCmjwntnFdS9ECvQs6jRoU9ZJdez9ftQgLfhACR1zzLJNPXRWZUNEUvBuNe1ll27nYJuD74NY32DnltaxaOwvpbX+tXxbUsvUrYsXMxoISkfJvDcv2Xev43fzImsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 0481dadbc5e5 ("arm64: dts: imx93: support i.MX93-14x14-EVK board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index ec78c03f4788b..3ea50d8080344 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -75,7 +75,7 @@ rsc_table: rsc-table@2021e000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -222,7 +222,7 @@ &cm33 {
 	mboxes = <&mu1 0 1>,
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

