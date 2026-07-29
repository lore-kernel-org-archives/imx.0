Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587BA48CD43
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330307; cv=fail; b=T9JTkQV6XhFrAgiQWNfxSsbVibOBNHMi1gfVIw6jZuhUaT+r12S0PotJ8pdgkB9mWpTA55l73uwNNaxM3tGDQP2YSKR901+oyZmNXgX4SmBHO+PdVyKt/k2iMANbDiGU7DeSUSQnArNKThCQpzbtY+zKZMRQcaVwJo557ZvfCM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330307; c=relaxed/simple;
	bh=Qkn0FPjX2zRnSuytel7Pa5BMYjyz3BYgU18sJshu6dU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HaDDS2jUZm7D8GtMx7LVc7qOevAdj7RSd4QcyIbQB2FLsAP/8qxTrywgbHdtTUXKk0Wd05miNy20fb7eW2eg4aUouszbYdXycpAeso/CLrzZnlyI5H5rMeFfaMsTwnuu5dOtNEPIijjx+owgoQnbzwQB6lDUQaPpi/mR4scusMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PvL2m3iI; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PvL2m3iI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EguRSqJwstlJKEb43BxO3g/wZvEFP1zJedczG9aflt3qiJoUdSJIZO78nT7HPQusgZcBObK1yGkweKbqgYS3ZbqJQmGuuayAmCHHKJnaHzL8g+A+9Rg4e/lqT6ahc2DHx/hJeNX7tjo5wN2aqO7Oe64vl0PAINhTNqDHIj+H5YWWZefP1HW39FA+2XWqXuwqddJUANfSrruVPr43BRhoGJJX0WeAIdVt1bi8K3y6U8v9vABw1DQB65u1HOiA6WjfRGs8OYejyq+UNjdl/rkG2Jnxex4faHZkJK+iXEOA6QW2jtclDddJEwlMkEUfqq/jc7KB3GWFD05TfuCQu3ZlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcHQQZdduSPJDOzuC5+ZrtysIeA0TLoHjzlr1E34OvE=;
 b=bL9pdsXCZuOsBrj1HJtwx95OlXxSs9QfLIDUlXA62c2MFlwg4OVZZ7o98k82vWIv5ubPxbnImt9oRnVp0L1UBuf9RMFlmAxGwMscEWRjkUQqwgAucP2k9iyNP3kt9dTV3Pox/S3H9VFxmWcupV5it6UooOlz4kwrTHZEBlgqMKup7/LBgpNwuSuHgl/92NJVWKK7FqQh53LZfOlHHtNRKp6AOAIKg5+kuTNDCRGYbswdSMMbCQmA/ZsSlqwvRbAy5eA7dkZXeTeE5zAQdxy61Wz7KUvH5Tru8v/Px6fYl1X1YLQoeSNNfTG0yWMqWXvRufek/lhnbJkTHILYB/q8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcHQQZdduSPJDOzuC5+ZrtysIeA0TLoHjzlr1E34OvE=;
 b=PvL2m3iIWToIMsIcP+QYV1IKnchg9DIT4P1p7B3A0WdRSdoLSNsu93WlH/KvzUffq8dlYDWS6IbqJqRzlz9iihJ/xYatoKS4ICD4GQhtWBPgBSP+gOHFkP3fu4z4GQ8Bri8VuqezdTOatNu+EwgU7O8vc907qFu1sDuxOtlPVeZ43AO5XYkb4A+kKlVR3bKNXIk2nbuIXlzLC1Ep4xz8Swkms7HAvZ/7uvD2nrUM5a/ZDNVuB+U2qZ0eHMksttcE+y3qJT+51qDCIRpsya2ECaw9ippUZPonsxoYiPZ0QQ88WdoD6+9ZwuWc+0ryK/duznjU6y6Xo1OaSIqIis+NBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:05:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:05:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:04 +0800
Subject: [PATCH v2 08/12] arm64: dts: imx93-14x14-evk: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-8-debbe0816202@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaf8794-9468-4098-5b13-08deed720119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v4ND+KZb3nUEUfds3Yd/iK7KBKSxceo2kVFqoX1CdEgWB9ls4aeRvVSe4X7u1uLHsVi8A2keLrhGwd2yddoQRHmlvQNvjGRmKMy7wjgSam8FvEXkpb54pu/zwf4AQdeidH1cg/M40F+JEBrj3QrJ8TTwl1Ls97g4wXlevnKHslnEakjf9gFxchJRULC/YWjMj7VFOcUynLuor2Bl0KoR0AL+SkJ2ARAq0dIesq1qLCjEDFKusAf0KCzvHgTPOcpIldG4QcQJ36gPdAd3nHHHzOrrA4gLCzEkez/VqHpDv2HnZqurzwkQUfMxHvCDptTV0u/jkgJukDQVsVLasDE8eq0l+y2vuVEKTr/xtT7gAIhmG3wtgXygoaqeSDBES0PNbYS3zU/YPw80yKa77sUwsIXEfjzkCf5zka8zxCNElx9Q+t8odTIqyZ7WrXlQSkECWxKJxnpbAAIy3K2/NzMTVv1ZIdPgdu1j79TwMaTJQCckypTwYdDrnErx0cfaqq8y6vSGWTl86JH+mte8E7ZEXVYIrRf6P5hPb5tKJMWga4kT3ScjyNn7OvxUug4fCRDb7sKZyTJxhcKG/T0nkyKWCvwWff9+ipIu0R+G3qCvfS1ntfifqyIehTQuWyGnlNmGIkeyavsRi2xzf9GBZeKqItKooINeaAtM1tdPyclRALk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRxb3VER2JHVXJhbklMWkYrR2thZ2R6WkNDUzZOK09ZUTNXeU9WZlNOb2h4?=
 =?utf-8?B?WGcxT2lMd3phcU1ocUx1Nm1DOUVYVGJCK2JUSU8wQUJZaitWNlJiazJSMy9T?=
 =?utf-8?B?SFE3VFhubkFtSkZkUmVlWldmZnlzNnFlRG1zZmx4MGhFOWdGS1piaFZBWFJD?=
 =?utf-8?B?U1Ird3EyYS93QUZOb2NobDN4UG5zMDFpZGpjYlVDVGY0TldoSVppLzlDNlRE?=
 =?utf-8?B?RUpPZmJzdWZvdENYY0FwVHh3SU9OMC9jaWtCbE5ScnJjQ3Z5NTBnRHNMaS9F?=
 =?utf-8?B?RVcyNmZlckhnZkdBT29YWnQrcnAwSGdXY1h5U2lpM1lYKzJmQjBxcWordWR3?=
 =?utf-8?B?d2xqSi9XbVN1Qjd5aERWYVdmWnFoRnoyQ0FlOUREa0Y0RkQreGlKNDc2NFdG?=
 =?utf-8?B?eDNseGEwWnkxSE15QlVoYUh2MEQzYW1XMVRNTDNFbGl2UGs4U2FEYU9nV1pD?=
 =?utf-8?B?dlhBblJHRCtQd3hmV1hRalN3NXZoM1FQWEg2bXM3UVRJVE1ndHg5S1FnbVcr?=
 =?utf-8?B?TGx6Q3ExZGxUWGpDZzRCaVlrYUdObTYrVU5zUnpZNjN2S1EwTmxaeDhzdU43?=
 =?utf-8?B?Q1c2WmUrdUxYekdBSHVwSmFqamthMVZXNEpDY2ZsbTRZQ21CNWRWMFlTOThk?=
 =?utf-8?B?YTVqQlU0L0ZTdXBYem1KSXh1cHQraXUvcTZLNjhtdElHTElvVGJhampyQWtv?=
 =?utf-8?B?cytlZWgwZmdwTFF5b2I5SVBaNlhKbzFjNHU5S0dvbjY1bkZKZ1FxZE0zcGhh?=
 =?utf-8?B?TTYwVXhQZTYvYVZ4MmdVYlkwZHNSVDZQK2NsWktzelY0b3BicEVGMXF6YW85?=
 =?utf-8?B?V0hXUzc1SDExeFVXZnJ6bXlVcWc3NTNHcUVOdWc3SzlOdDhMb3R3WDJqZWN2?=
 =?utf-8?B?ZnFzcC8zUy96T1Q2aG1SbUljZVVGZG8rMWlXdnNVRElHQkE3VFRkUWxuRFJx?=
 =?utf-8?B?S2poVkhOcDR2RjZScFUwS3BOYllYTVRMTWV3TWtvaG1aV3gzQnZZV2J4dDRx?=
 =?utf-8?B?VjFuL0hhd013Zk1Samk4dmkrOGkrWDlWay9FTzg1ekpJT04wRkRuQzJJSmYy?=
 =?utf-8?B?azFLbDdiUXBCYm1qbVo4RW9WeFFnOThVRitWL0FwYncxa0oxWUtVVkJSOHhE?=
 =?utf-8?B?OFM1dllTSk1XMXBXZndsQ2E1UE1lNld6c0RaajRSQzk3YkNqTkgrVEJJY00x?=
 =?utf-8?B?M0daa291Qmk3YzJhREpDZ1pCYWxrR05BR2JUdmtYeDVYSWYxc0Z4OGFsM2hj?=
 =?utf-8?B?Ynlla0ZFK2JlUEtIQi9La0RhYTgwY2tnbnZONldwTlpocm9RczNjV2JZWENJ?=
 =?utf-8?B?SHkxcHZkNzJnazVPNEN4eG9xRDJZVDROd05mOXUyRTltVzE2b0N2cWRiNlRm?=
 =?utf-8?B?ZE9CVWk1ODIvWTE2SjNBMkpxeHMxTis0WGtOTXNhZVpJWjBhdjlJVHQrNTV6?=
 =?utf-8?B?Ni9OYTNraDlSNHZZWGdPQXVHMlRubHhoK0FGZ1M3QzNveUdSOGFlWTgvajYv?=
 =?utf-8?B?aVh4UTBLNXhoV1ZuVEMrekQwZlNqM3BjdEZEWk8xMzJYRlhrdTBZMmUwNDBS?=
 =?utf-8?B?cVB1bW1LY2xpdFh5TjRKVVdPd29CQUUyVzV3Y1dtVFpUTUZFbmVJcm40bWlv?=
 =?utf-8?B?UkVHS2k0NTJPMHUvSThGbjQvZmhzQkpZLzhicDBNN0VNVjEvY1hxWTZibDhi?=
 =?utf-8?B?ZEZpMCtibnhTbGlnbUY4NVIzdU5yMmRuaXEvOEM0VE9NRXJVRm9nWW5QYW5L?=
 =?utf-8?B?S01RWnVtZFhkbTI3cGxHNFBZOHBQTkNRb3dmbGt6UURwQjdHaUZaZFJIWUsx?=
 =?utf-8?B?UFF3cW45azh5VDFVYW5NZld4eDNIOWRxcHViOFpuRmJxMEI0Ymt4ZkFReTFa?=
 =?utf-8?B?anNqdS84YlNWZzdObnpXQzdBVlZqMERyR3NDU3ZZY05zWG5CT1hON0RLL3B1?=
 =?utf-8?B?VmJWNjVnbFV3dGhCOXBtb3FPeDZtbzI0emg5NEhTTVo3RGVkWnpueUs5QVlF?=
 =?utf-8?B?emVSZzl2M0FWLzJWWlkwbVB5SmltWWZrTVJQRXVMMzllUEpFVFdjWEtnd3Vp?=
 =?utf-8?B?L1ppTWdTVTJ2S0NPQmkxc0VETTBKcE5IUnJ0ZGlId0RSZ0ptTnFXMnlERzBv?=
 =?utf-8?B?aWNQSGovVld6ejBhd01zNU1KcHhUWTJBZ09WNUlVTjYybkQwTml4eFU4ZXpS?=
 =?utf-8?B?Nk12dzEzM055V3FSZW9OZWYvdzR0UTlPNEZzRmFhTHpmQjdNL0tnZDBpOVBt?=
 =?utf-8?B?VklMMEd3R0xGcEZZTGVSd3Y3NGJqRWFGaWgzTFgzb0lNZTRXbGF2eU50VDVj?=
 =?utf-8?B?MGFGUEFRZG1wb0hYNGxwNFJtdGVqbURHSlNsVEJCcXZJZHV2bmFTM0tnUHVI?=
 =?utf-8?Q?gTnMGHbsFXnOFihkn/ZHcH76nJ9RNG/FzN8N8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf8794-9468-4098-5b13-08deed720119
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:05:03.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bamuqVeW7Jg2Ls/WhyBDh8mu8k1vQf4aWKWJv32GpLdfdlAyJSKLVd2cJfyocpgJ6dlL67Cp8c1hBrsidquvJVDs6vA6DPKTiqCopB8q+hiYLocuJu10SNfR89DdQqn1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

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

