Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEBA446831
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317741; cv=fail; b=uXb0+BAVTTmB5PMU6JMpbccqu4Hk7kcpzzaOv5A8lfwC8V0gLQzCLxa9vE0EsKlY+vdFt9x7d7TN+78bEgXDSLOP1zpZbfySJF+6RdZvjH1xtZkYhHsuA3ptiVVYVSm/zS4hbUwVLzGDGF9Xl4hPSabwIh+LcV9gQnff3zprk3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317741; c=relaxed/simple;
	bh=aTmLDq70g01Fb5u7xXcEe6iAYStxiOLnR19OwX+IQQ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J2cYJ7MOLYvePAEBQCtWArzr0CtZoGRmJ/LoA68BWhgYHcV4NqJwEpnC/YyWRkbrwGZk9mIg94ZMMl50JfBOHTt63EDmBw+bqH6G6EcJuj53jI6azCF4GW3DOJIYt96inWKFHEzdtEAPD/h8O6zoBMYOFNriPT9fVY+IH3Vnjsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WsRlLZah; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WsRlLZah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CefDladj5nSLhnpyNp+XIwDMvLmV2maV8o5kEX01tG5yQRcBqSQ0uB7CUaH6LUBBm+MK7udsheOhAtrVFM9+xZlH1xxigrH8Nulfn8r8/cDg/KlFMhzaqB39WK4AuPSZRvZjohi5LHkquzW5nFCZomI7n8RjdKmyDY16pWaAOk5GzCo5lg8yURV3Dsr+kt9zHRvFeVDD07LcBcMSFlvhLAHbB48ma9gEHV95t5zhraJptkxAjJycWCJ604UUh8RcFynvjIEgappk+FPyXpPsfZyuYA0oq8FRXpVWwYP4BhSWlE2a+vhtWf2hgaHIXQARAyv26ue3Jso1dXD3z/m+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DEZFX237o/NWQOFKNi+xe6dJYayqcKouaS1DEYd3Bc=;
 b=I/+4A9dDxfaGNGmMASlNAqLdRCy8Y3CzyVfUg+Td5/YTGAzKWzHWEh9nkCAMv2SrRD0EENt6wMFCWEyHcEO71Sahmlj9ji1UMgQrpm2WTTee97duTLiriMWpSNlNEGYiaXrIq7fNhmaAW6BMkmgixf5dwWgCzAuKGzZq5Ez9+3McyRbq708eZ23160wINkopIpq8F3vfyu69vjEnNibDhyo2K2ipGR6RBr/kvq0Jk+xEDLiSnmGWoJpOUnKvi4vM2aY5Esrtw+Sk4b/tcG1JygUhXGT2iFiOBWIalAglwftX1hYanD9UIKOH6z8Vg3CEWd3Ig+FGpmn1K89p5B6h3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DEZFX237o/NWQOFKNi+xe6dJYayqcKouaS1DEYd3Bc=;
 b=WsRlLZahFpV23QfQIdLIwV6/bFzHXEX61n20se6MGL/YnGn+DiyRuT/MBWGNiY/8BCguYpYyfoq3X/n3fE1OTzEB2Bh9VbQ2g4Pwkbp7wWsl1wB/uq3QSLX/qVZ7LOxKBHevvv+h34h6QEdMj+ptyfVWZNHMe6JeVT6Xr57zZA9oMo5VtwbSdjAYG4iGH9fHw18WZP2qv+nZyQAP+4RfR1HormY2+oc19mF0meVsGkIhtQEbAqK4xBE1++xxFxDZxoQKiAXZDblvdlrgwZOA8ckV+71RtWqEjcqiIA0F08N30UbsCo4VZxmvk4x2LJqKkS6FqtDrg96GLjBlk36fNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:35:36 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:35:36 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 29 Jul 2026 17:36:28 +0800
Subject: [PATCH 2/3] arm64: dts: imx91: Assign media_{axi,apb}_root clock
 parents/rates
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx91-9x9-qsb-panel-v1-2-4d22fac95e24@nxp.com>
References: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
In-Reply-To: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0117.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::9) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|MMZPR04MB400504:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1b481d-ff03-4bee-3298-08deed54bdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G5OQyvBD0dm35By7pdvfhmMr8neyUXO+AKHfubD2dMOnt3ZyUj5YV2SN3EwQ4jkrU9qOfQHY1rv5i3xbDy2UeyCeGsHO176UxtwC1axKGuqdtWXb2PtCPRS9N8l/lzDcavztZTQvjJAXZf+1xypjqQyHrWVQoi955xem5lBB7qiycmLxKTjkNIILQgLBxGigo3OhpNXBYxEq/DXQpwiBcAgqUvbXEGr8THqI8GYRL47CRDmrLysd008rhLevAdXOBgn1/4yn7oBrP5hbSMm/wjbyEIzs4wDG+wxFYh6fx1HMGWSfArVe/EwJm4C+XzSCCyzIImGm1Y53sYJ/W6jIoRZh/vB+Lg4WZq6v9YptG8FhCCMaEbU/J2Rf97d1kVO2A5twEYEjFj4GzCNEvZ6aN8Tax9dPambudF2amUh3OErsWSJu4J+b/2jGzGsNS2LX0fXRygVEsTTUusFAoDhhbtQm2pjS/x0mngyXBlthWAh7Khlx3qJ1AbjuPfc9Hs8IdxkrNlWNLMfKiGz3f48US91+E5npD0x51Ji1c6rmNm4RKOsGqtINMIe1107ylLKnjlBvMPYjklZa05ObjNZhnSeqm4wJ+dVre8xM+35JONTX1y5eQWH9qD3JTGbYnhl4WGDjyQNvA88EAg+IHTV7jhw1eiFLJgGzwp1PxsY5B9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVVKWGJqMkh4b2srenE3TTZRd243cVNTOGNkYzc2Wlh0OHFhU3YwczFUWGF4?=
 =?utf-8?B?YTdSSC9jSlF2QnA5Y3Y4OXNwT29oY1FnZUtHVjBxSElyckJDcUR2VnlreE9m?=
 =?utf-8?B?NmFobFlYMVoxMERyb213OU9INndTM2dZY1JaN1A5QWpkZmp1Sy8rdUVtMDcz?=
 =?utf-8?B?V1ozZVQyYUhrcnFUTXc4MXBwZWoxQWg0Z3hqWGNnWmRJeHJRWldBeDY3MFlm?=
 =?utf-8?B?NWw4aGw4Y1ByNlloZGZ1eTg4QUREaWQ0T1dIRzFOc3RvVGhPUExKTDJKT2ZD?=
 =?utf-8?B?anBzNHE3d3E5NEZOUFNUTnkvditrVHZ2QlBsQzhBWEpKQml5NHZwZHhJS3N3?=
 =?utf-8?B?bEpLOWxEK1hJbU9LMmhxVitxZTFtTHBFbU9BQncxVVlURCtvQ3JMRkMvdDNh?=
 =?utf-8?B?bUNhbDA2NSt1cjVWZmpjUm56RnJueUo1UW1xOXZZRzZ3YjROUlNRK3FabTU1?=
 =?utf-8?B?TWRvTkZUZUk1TzlFdFdOMXNKOE92VXpVVm5HdXNOTWJacjlHeHZocXcwVStV?=
 =?utf-8?B?aGRzdml1UFNEZkhodXlOU1VMZEVKM0xmSDZRYW9FTTR6SHJBRG9EczlnZ01M?=
 =?utf-8?B?U29kekhVVUtGSFJHWTlJNFZJR1ZNam5sSWVLRk93d0J5OFZlMlE5MFJSWGh3?=
 =?utf-8?B?SEdEK3FGN3NRbzZaeVp2UXh2Z2UxekVQcmJNeXdQUWkycllNbTh6M21jSm5K?=
 =?utf-8?B?eEk2Mm53dHhaN09XNS9FQVpXWE9GM2R1SGJxV2pTU0ZxTFlpR2FnSXpJNW94?=
 =?utf-8?B?ZzJBN1FDeG1BQnYvWVVhTTZiSnFGMEY5R2ZQTGhvVUlxWnBwVFB1OUsvaTBm?=
 =?utf-8?B?Um5LSTUyNEMvVlZGSWhxaEYrbXU1SS9sUHJ5WmRoNEdSRHFNWmNvZzNOMTI3?=
 =?utf-8?B?bDJROXVVVkxJUHFYWXVxZ2h1WUJqd2Y3ckZPdUxUQm4xMGdVVlEwVkFTdHVF?=
 =?utf-8?B?RklUaG1iUFRrQmJOM2I3V01EWThnMFpOaVQxc29OZHVlbVptUm9mZXBvTzQv?=
 =?utf-8?B?WGRaUmQwSktqVXVrdGtIOGpJUUpseWsyaVA5QlExQ2tCaVVGTEJGVURvUWZl?=
 =?utf-8?B?dGY3REtHam5FdVZtYkE0a000dlRBNkJrbzduOXd5OEV6NytUYVpQTDg3N3U1?=
 =?utf-8?B?VWoxelVSRlVwa1B0WFpsbyt4d3d2aGdrSlFORm1jZjRDbTI4ZGJJSUxGdjlZ?=
 =?utf-8?B?a1Zsb0w4TE85V09YVG1idGprTWRubFBUTzhXazd5VHRsRDlvdnptc0F0QVhG?=
 =?utf-8?B?dk5XSXYwdVhmSENpTElRT0JRaVI4aDlnb2ppbG9XdzlpZWZNZUdRVTJ2aHdM?=
 =?utf-8?B?SHdjSW1IZUpsVTRkdVdDdEYzUXJiM0l5c0hFSlN1ZGpNS0VpUmQ2MmJLUDRQ?=
 =?utf-8?B?Vlh3Vy8ra0VrNnYzQUc3eFdCeGpGK1lUL3JuSmJRTHp1MytnNFphRmg2Z1F4?=
 =?utf-8?B?a0tucTAxQVFGL1FNZnFkbzRKZ3JwY3VmWVF2T1pSWkRKT0VxTm9LME0rbzFN?=
 =?utf-8?B?amhjaFA0YXc2UFRQNklNTC83Q3FsZTZlbFVyYjBEOWZvMDRuQzVBWUJVNkpY?=
 =?utf-8?B?S1doNHBYUVdkN0lhbnorM3dvYmx3SzRaNDN3S0F5ZTd0ZDZXNWhXOWV2emxR?=
 =?utf-8?B?bFZnREp2TTBRUnZWM0U4QlF0c3ZkaUNCcVNiaFBDQWpYZTJ1cXl3czhHbEs2?=
 =?utf-8?B?akFDZW9jOUFwWjYxMDZpUy9qZmRpSkpJdkY2eXNUalExU0pyM3Z1Y2hObnFQ?=
 =?utf-8?B?dWlCYWg4NGV4cGEvRndFenVnUEV2ZmFiNkE4QjNhUmpDQ0V6aGJYSlJ0eTE1?=
 =?utf-8?B?b09MVU1ia1pLRjcyODZvZEQ5S3B3Z1pvZ3RpQjVPamdyREJ1WGJTcXNqa2t5?=
 =?utf-8?B?cW1wZXEwK3Q2RzZIcGdYbzFidEtGYks4SjRGVCs3S2ZUTlJCVzZ6YmxIbzlk?=
 =?utf-8?B?MVBKQW5RekpDaU1xd0xRNTNEK25kSk5OR0NRZXgxT2ptNnljUDFFYk9TVXp5?=
 =?utf-8?B?UTFZS0pmMTNyVFBsQ0RLOG9ZbmRycGEySkpTMzE5SS9rZ1Z2SmNGMmxPQ0Fa?=
 =?utf-8?B?QWVVcE5EWUVhUG5ZR01nRXJNMGNTNmNkRTA0WmNtTDFDS2Y3Q2FsaTA4S3pG?=
 =?utf-8?B?c2VxMkMzZ1ArdnFJdnF4R1JScjNZUlY0TTgvOVdxemVEbzdzQzZ2c0ZmNDRp?=
 =?utf-8?B?VnJoZjk5eHZOSUhMZU56Z3BDMWpEOVZ1SUoxK2xJSjZpTGtnUFVkWTNuVUl0?=
 =?utf-8?B?K21WMVJIWFlYcFVvVDR2U01ZaEQ0VCtZaDd1Z0JhL2Q0SzhsQXFLK1VjSW5O?=
 =?utf-8?B?NVBVZlVSNTVTbE1PZnNoR2VwZGx3cUoxV2R4YlhIYXVzanBQbitXdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1b481d-ff03-4bee-3298-08deed54bdfc
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:35:35.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IY/ddQfDru1fc0BQn0hyVY4SlxFvmJe5Fb1MhkK1CWQD+jr6JalTCR7vvuHXmG2Vg9SXjmHDujQheRg/ND51+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

According to i.MX91 SoC reference manual, maximal clock frequencies
in nominal drive mode for media_axi_root and media_apb_root clocks
are 333.33MHz and 125MHz respectively.  Assign the clock parents to
be IMX93_CLK_SYS_PLL_PFD0 @ 1GHz and IMX93_CLK_SYS_PLL_PFD0_DIV2 @
500MHz respectively and assign the maximal clock rates by overriding
the original settings in imx91_93_common.dtsi.  This would effectively
achieve media_axi_root clock running at 333.333334MHz and media_apb_root
clock running at 125MHz, which aligns to NXP downstream kernel settings.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index df2532835bb8..a7355f533d70 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -120,6 +120,13 @@ &media_blk_ctrl {
 		 <&clk IMX93_CLK_MIPI_CSI_GATE>;
 	clock-names = "apb", "axi", "nic", "disp", "cam",
 		      "lcdif", "isi", "csi";
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD0>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-rates = <333330000>, <125000000>;
 };
 
 &ocotp {

-- 
2.43.0

