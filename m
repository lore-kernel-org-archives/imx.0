Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24811A680C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288146; cv=fail; b=p2JgMLOirGbNeQo7Ntnk8YBfyxMRADMGatuTreYsQrOy7/QBrhuSFzQqvSzuXQY2SA3GdIVUS7f4ADsoXRpPTikwIdB0WCKMjLFtTiZrcK0z8uq3Nk6iIfu4diA6RkTlcZ7tVphFrYw1O2usQpKpb44vq0wMbwHXQI5UoorJMhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288146; c=relaxed/simple;
	bh=fsr5+PHTupADxywgrAIXjP0q0z3qFPhZorKq4xpWRJk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UJAn4WehpIoKZwada0M4PemSscynq2NN2QHiojiNDmany0cl26RKPHEnn1Kq+Hvv/gONX9joFxnHlDwybbZlZs18cI11A7L07InBNm/3ggn+pyew2Cgal64mW3mFGmy7B4sN/I5ZrIKjrj0kEABQsxkqkCeCOYmjoMVuoadio9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Mqeco61L; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Mqeco61L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah60047vME3nK1vW9+ZAZEsTbetxO992OIVFPIEacLe5+8Ihf8xwnbmLPSwajdBLLja6ECdi8/Z8MtID9ebLzxcxI9Fy9IqOgJtfS5C5rC+kSOjrYOWE5fTjs1kjX7z5Yzsp++41cKrCDRx4+SXEjsIyNTlC3sP5d3EIWN8+vqH1L5+xZAUlbY79+WLWwOCF3Zw6S3pH4S61BbBJsHJFhtkk0GEcHYwQF8Ha45srtqO+xsTK3Vj/kuKIWLNGS3c8VIh6jbsrXsCR4RXbXdWjDlvOQLenEfrTyuPKINxR9DcCuvkYWV1w8N3vMGSFSBH8/Cr+jAKrnhbKIMifcPZ4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO7REz8raRejHS95CrU6EPY4SlZM3726AR1t0/7A4Go=;
 b=RU82cMn7kPkj5OybGX5wrLKxnA8Vw3MOL3OSaUlKP9qaxeK1cN0O/VADgEoYD0X5s85uZawrZA4KZjC3qUB0YfYVDZo93Bd5DIGOmp4zlj9TzHVlwPcL5iSeZAZJZCC7RjMxTHVd4iBd+Mzp59bJ+fxnb13G4YTNwmwicayCWa1q/NwxlvsDIv1qbuhgPu4KbEcebPGfodlPl5zt9vRVtc7MD9fWEe+n4Z3w00hPc+ToCMI0QLG8V+GLyEvUDpS7PO4hAQAyHH27+GwbfzXzRmH4CwyOsExRauaVjsWxF9ZgD02dsgZWALwxWVLSrkkByCGvcKsh5zQEFjKkWlvZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO7REz8raRejHS95CrU6EPY4SlZM3726AR1t0/7A4Go=;
 b=Mqeco61L92M/qFA08BxcCBJxWfdNsPwaOMti5GFTHD6P+0T+RRRtXx4WllP4lN0hPrVmw7hylJGrXhlZuwtJCAuX9OTEXsPt5OLFHm+A+x9+uY0M3UvLdWXFmIlujifoFomhBUEH3AgbPgCQGX2hb76sux0pkk2L2X8tvI+9GerJZhlhm5SlAUXNuAzArBZmjlg1GQZm/AQv0pio72Kpi+U2250Sqe3C+4cZrlhqBLb699tk0htcgvj4eC0bdoTvkXw+rwEDTafbS/a1cqew3vPIc6hkp4O6p7hY2iak6hAku438ent6H5lD/o5wvWvnkhp8YlBl0VjD3dxFXMDR+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:39 +0800
Subject: [PATCH 4/7] arm64: dts: imx8ulp-evk: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-4-368bca0b309f@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd82c1b-9844-426f-a948-08deed0fd636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yCK+Zr8qH9Bl2H8d9M1pEDHlZnyhIFUNa5yWxd4fqV8PnyXhTAJycss9sIpId6Jw5b1k+KDIggmouaI6WZAcjQDFb+Z3GNp7ZXa3HhUSgYTk1EW9h4JDnCN8PCO4MUdOSymNjjXFtFY0xhkw1aOaVxXsZlKVzMSOqtbGnguzAGr8Sa8m8cRS/MY/EPEr8YeFTiiHgwYHSAFKnnpbr5rMR3ifHKpepSHRQ61RRRQ1/y4yOniHBwbXx7H27ce5Rk/qhPu+2QdNV2r7Dl4VwVXSYxUC4XJFiV1bmN76S4BDbzETo8fQem1r6eDyxa0YEvWgGRdAP9yM0wuQf2CgLXOuwzvlqOLFcz9vqibX3M1HmEi5/T0DPEMnlBaTLLsVcEwhLpkWTjm617HZbrZnM2BBZ5h9fxvQh/IAeOdMHrRQuDvXaK6RlbSC+RK4DrmwX8PRNVSKXkiy8IsAQJErowg5nXpsBeNG+YkWv07mmanZj8Vqz2iPPRTtOyGD6l2nc16CEfIpXYGMc4TRL56bMa2XHs9xL8eIK97spyJ4AEd5YgeBXHY7Jt6nsJ/GFB19xYVVIRN3D1xjn2eiznvwREJrVer08gpvu+0pxmn2SU6scNVNjYWDQntcf3F4AuMDGmlhLhxc/wlYryes6OiwP7Oxc/IOtTj/tw1ZwEKNLhOitd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlBWMEJxTnpvNHdTVDc1VWs1MmlnVGxWUDhLQ3AwMzF2bVdvVm1rUm1ickNk?=
 =?utf-8?B?VWR3dVU0VG5QWDFhWno5d1k0ckxWcWVCc3NiL1UvQ2Fnck5wZHFIMUFpRzJY?=
 =?utf-8?B?RG55d1lZQkxaWjI5RVVBQmdTL3ppbjd0dTFXc2lBcFFvb3U1b2ZpRUNYanho?=
 =?utf-8?B?bStjSkJKcWJrT1dYRm5NcDFoNU5BNFBOWVNEZkJyOFpSSDhidC9GYzRFcldv?=
 =?utf-8?B?VVdldGlxS0dBem4vWmhnckFOWDdoM29LekwvU054cXo0WnFXZ09JeDRUQkNk?=
 =?utf-8?B?QitXcHloQUdpbDA4MWdBalR2NGgyRER4R1lwTVRueTYyVndteUI2a3ZoNEtR?=
 =?utf-8?B?VkptMWRoMWxWZ2Q1NFROZ2V5TmFtT1VZNnNtNzdTbXFuSjFCdS9NN2ZEeVJX?=
 =?utf-8?B?MHl3Y0t4c29PTi9MdmF3eXFGUk00d0NTZzlQYmdydHVKZmVPZmU2NVEydi8x?=
 =?utf-8?B?Yk1UMDBjd005S2tScndWQUZKcDdQSkF3cHFGb1MxNUxWN21sYmdZaUd5c2p0?=
 =?utf-8?B?V0NsVTUrYkgrTWtPU0xvTmdwQ2R4M1lyMkxhSXpWWWd5cUdpa251cG9mamhq?=
 =?utf-8?B?d1htYi9jVDJXZXE5Qyt3V2Z6Mm1iaVBpYS9iNnpBeG54K1doeXJjYjZHMEV6?=
 =?utf-8?B?WWp4Q3I0Q3FBc1drK2cxUjNMUS9RNVB0WDM0a2k0eDJvTGlQRGcyeGFJRmdr?=
 =?utf-8?B?Nmp3TVErbUx1M1cxYnhNQjVjd0Q2ODFZSE5EdE1YMlVJTHRoa3FYMlRTWGQw?=
 =?utf-8?B?dmw5Rmw5NHZNa0F3Q3psQnBrL2Ztb0xSa0ZyVXdxazRCRkNpeEJwcXowU3k5?=
 =?utf-8?B?WGJnSWtTZC9SU2VuZ0RGOUltdVVlUitKQzZHZk03K2hvZHY4Tzk0VzRuV3BR?=
 =?utf-8?B?MEdjK21ZRmdiQm9WWkJlMC9neEJjYktWNTVuUGQwMWdnZTVacitLT0dSeEEv?=
 =?utf-8?B?a1JoQmROd050blRUbFFGR2ZGeHQyK2dZbGhRMWNHcFEyTU0vUDVpOVpoS01X?=
 =?utf-8?B?VlZDK25PWE00dno3ckt2QjlHWGFIWmI3SzJuSy84TTdTTHdmeG5wNFg1cjNr?=
 =?utf-8?B?K2ZtaldNWDFhQmd1Q3J3OFl4eG5nc3lsNENxd2tWSEtJU09jQ1A4SWx6MCts?=
 =?utf-8?B?Vmh5T3FzRFJ5WFJ0U1lsejlSY1UvUVVIdTV3bU42aStZeXFFaVJQLzhzL2ZZ?=
 =?utf-8?B?TmVHaDFHU0RIZ0ZNQk5FeXBjaitWa2ZXMTJpLzJPbTMrNzRVVHNXdjh1YmN4?=
 =?utf-8?B?aWExYmh3NGt2R2ZMK2I2aisyNWNJUEJLMmZkZmJRY0phalM4RUJaMHRFeWNp?=
 =?utf-8?B?M1NFSXcrRFUydnc0TUowR0VRc1g0K1hKNzRteThCMzBveHJOTFF3RDdvUUc1?=
 =?utf-8?B?dGpRLzlUWE1VRFNYRXVzajU1VEFrNkJtWUJZSGFkZzFhdDNjYUhSa0hBUkhs?=
 =?utf-8?B?ZlBLYXV1aENKcHBrdEVLb3lTTlBSVm85b0NMdUlBeFB2c3JBbVpTWjlWNGVw?=
 =?utf-8?B?Rlc0dnZ6Q3MwVE1XOFFRZWJEbG1RVTFpZlVzb24yS0p2THRTbVBXbFRYM2Vx?=
 =?utf-8?B?cGY1S1FmcFVWWE1yWlM1ZUxham93K2FnRk5sbjFjS0tnVmpSZjlxM3JMK0Nh?=
 =?utf-8?B?ZHFWVklhT3M2eU5BekttM0hNRThPTFF4bXFQTVdLeEVXWFRONUNXUThiMEla?=
 =?utf-8?B?U0dzK0JKRnFkRm5WMkRWdUxqdGxWWksyTmNGMjJsWHJiU3BzcStkVEVzZjFn?=
 =?utf-8?B?V0xybFVDcHRFL1NKUWJiSWQ1cCs3a1kveFF1WEx4SWNQS2RCTml0amhZVURI?=
 =?utf-8?B?cW1SVEZQTm56OU9QQjY2RmdSZHk1YnlxOFc3TGxDZWkrU0JROUE1WUZpUVhG?=
 =?utf-8?B?cTZQTmVNbEszaVRCU0Z5SUk4MWNmOTI0R1lBQ3RYell2MVdmcW1mcGZuUkNI?=
 =?utf-8?B?SEU3WGpReXZPYVlJS1BmWjdlWTRmSW5Gb3FoR1hNTHJSNHdzZ3ArcXRtTWdD?=
 =?utf-8?B?bFNBZDRRcFdCS3FjMTlnc0VBQkI1ZFdZYnRsbzFiL0VUaHZ5eDJwVEZWMENl?=
 =?utf-8?B?WnNMNFhXekh4MjN3MnE0aTNpbEFTYzg3bmhBZWVoNVAyTVpvMTBGUmRWaThq?=
 =?utf-8?B?NjJrZEpENXEvM0U0NEZDZldvekdLaDA2ZEFKOVpRM0FoV0E3bWpmUWMraWZ5?=
 =?utf-8?B?akdnK04zNjNiQ243bTlvNE01bXBMRndiRS9ObFNnYXUzQ1RKbzhaNm10L29y?=
 =?utf-8?B?M1BrcmtWVmtTZC80eVdzWUY2ME9NcUhBZ2pZV1B0cmc1K1l0RXhZSktPV24x?=
 =?utf-8?B?VGxQR1NPTnBkNUppeUNMbDE5eENRUXByY0IzUWtiamo1a01ueUdkRUlsZVh1?=
 =?utf-8?Q?0yP/2KdpUOZg78fgAtTB+6qk7HyGyJD1aFnQq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd82c1b-9844-426f-a948-08deed0fd636
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:20.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V0tzZxzx+HJ5e6n1lmSui1q5UG3MYIC8AULGQWsFoMhGw9Y0F+7N/Vl2bhNv0VdHW8mash6RF1xh2YFnjMUnBtDCO56Y09mZOPNMNa5DGbINO2hy0CGiQei+JbKCtpL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 014fbffa25a7 ("arm64: dts: imx8ulp-evk: enable CM33 node")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..48a3e40053299 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -67,7 +67,7 @@ vdev1vring1: vdev1vring1@aff18000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a8400000 {
+		vdev0buffer: vdev0buffer@a8400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa8400000 0 0x100000>;
 			no-map;
@@ -126,7 +126,7 @@ &cm33 {
 	mboxes = <&mu 0 1>,
 		 <&mu 1 1>,
 		 <&mu 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

