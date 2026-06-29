Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A993B2FED
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716686; cv=fail; b=J4XszPO2RAoswxLVL9JGZ5eDecjJjqjC1tkY/TK11HWAQeBqOq17bVSpWTDalw6ZDAh8p/2hEDPZZLejLSxCbyYPFdo0keZ6rMTnMT+NCcQTN5ltq7Nvt0WHC9gO2PXFTEfN996De7ilPVv/M/iEbbHDx3hHCju31Cnf2l7ByY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716686; c=relaxed/simple;
	bh=cmncyOxNTesigKs9GjWP0WSdP7xBO1uzX0ihG4Xh/Rs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KWAhuvptm7FhhqZVXcBq6TB/elsfQJ3QbfcyLqR9aTCFSGDzgSeMaz9LINTjfLvwUDTvu6HOiD/x1f7vhgGZ/Vf7TdkUZPq7JLqneZxIDaPw+1qisyBj9k9Rl/QevvPi1LU0Y8aeCC2TMNMfaMmzdtgqAK+HDuZktX96Sd2b6ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qi490XJg; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qi490XJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMD9IHvOx8KJGR4vcGnCkKLApoGWzpS0ak6puKUUh1nEZs6YxvygXpMCyGycFXEewOOr48VopK+U1JrAW+GjhSOUaicBFBOf2vX/B2r+PMzGDCPE0gdIJ7qyDZDkZIkqxB1POpAPZm6NCSacaZBWDH8ZLwaQicdCDVbk/KjcFcC9Gge7yGQBt7B+mntQYQDcUaqpj2RsvHifBJQaEjDxr9BSdGwPQfLrKR60pcpLARpbugGeXq2HICByIHFRZ07GeVZD0kp28iERXgmz4RAwDTP0JCIUEPMxIoXF9Ve+aP64PJrBdUsFvdsoel8qr8rFMTRkEXQfj3LS1Ti/pDm8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poY+yWeeWpZsc8RleSSUOgZrlwh+M0FrFj8lR52XvHs=;
 b=k9cWn3nQewSB66vL//C4gRsT4eNxV7EgkNghLVnUwabwgJRoZThlT0NytkZApMYrv/qM4MOzCND0NImhGve1GXinb6k7CyO050mXEBY3LjiOEhfx0W0K1pTR3Ew0dax/UTcDiMsDwuICrPNa5F+T5Nmdhey9Oe8cPb6F+8ZGRV3TjMA8R6r5kGkU4TMyzx+eFfL/3I0PEIi4p/F9gxS0gUVgpE0hrjhDgsXSTJ4iKj0TbigtyGJ8qiRyfAH+jUXvl7WB2zGl/+Eap5+ylxH24e1ATysDb0adAdTyh/rManSLSPmCvvJB8AlnM1OYIwmxENZ24FOGORL3lVmyJras8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poY+yWeeWpZsc8RleSSUOgZrlwh+M0FrFj8lR52XvHs=;
 b=qi490XJgI1xEpwfU7DxoWr/F3YoSM902YW3bf8r6V63TxNvCY9DMfPTRQCq7qMcyoJkXoYQprShujgUvYz8tm+MeoDI2MRWZkOMNQNZtJ5RMFTeFp0/hNq1EMi0BXdtvh3uayph87impS4LCcHZHWMhVxYw8RcdKR9m/W0XbxeSntn995+4Nb9GBZiXV2lAIC1O8F3/8OXxp3i0DxnqBj4Lc2bHWg2+lJDPTB4xmxiJju6lQSnWrUdTMc1VROSe4CT7wKTT1268U9SP3uvoquva/Kv3ayPN/GcczFcq8ydZaWVouGNkmPvuNCs7hVCEoaaSl5yfP28PwylaK2VsZrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:43 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:43 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:52:02 +0530
Subject: [PATCH v26 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-6-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=N8tUVQXEroXZzC9WTmsqy/TcjueLhUhHqJI7EKpQOoA=;
 b=ux1PmQIpB5C2Es3T+1ycjO5roiXTN3KoF1/TBAzIEAd3+f9bIfEdvTb7SiO1b5/rXQvUJ0zXz
 O2CbBdLNdnjAZjFPUj1lEZFLRRLqAFAUISEsgUAHFbMpRNpPM+Z8WHr
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 920dff62-a10e-4237-48bb-08ded5acb1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|11063799006|22082099003|18002099003|3023799007|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	gJcU7whrwh+Lt+gHylg9QjSxZuSg3GTEnhrZe3+rvySagsKg3XeniOWBor8f8XVFyChBgWNbrGtdy71zEifBIkGwn2ayhTKN+6W9C/X0dgsxTqJRjdnuaCecBsFNlC09cGJj9RKCfui+BFgm3M3cBWzMtiqQB+bB9QzFn5GsPd4CcjUG+y5MdodpqYv8MENA9VZ/Cq5dvMso33WY3Je2aa+e60o4WOzos+Eo3HTrCgJihF+ETC6OKjfqod5g+XvB4XQ6g7wME/SERq09rc0w/kdldlUIN4uqV9LgvmjmEu/xSwe2povrSf38wD9/4WilkypVG7k9Fi5rgKMIDDqZG2sQYdILGmjO6pGBXPqKvZYJ2nkKO73BbU3GCcaebqB9PfVGIiXDgNJrfNeDNyyX25RW8KZ17osO6NXgNBWT8atVXUze9q29ZhV/0xYhutiEW8u2Kvgv8w010DHVxsoRlJJmhRdVaHEXrgq8PzNUM8gN+Yg2Hmp/AWfo3DEbXJAbc6b38B0fOLqjLyNIrw/aDUQpFC2IVXRiVDd5o5IGW45iJOCBwQGEHRgGzXisG2QoeHoUsLnGLZXfsOOEXRepamu/4PC0MAzxDBngOQ+hTCbpmbPo8SPJgFXhcd6Zk6xttNj/pSCCl2YTLyy7y6nJ95bImjYDzBCLlUGoFUN/9l2vUNE84a8hxRxa0vFCuigzsHgNV8KYHK/8yn3ccNtBhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZSYlFsdTl5K2dVbjNNOXQyclRpamNqczVXN2VlS0Y3R2E3eG95bXJHOVZ1?=
 =?utf-8?B?K1dGWVREVmFYVkRaL1NvWFY4V3I5TmJMQ2Z4elZCL0FuaklENkxuVHB0K2hZ?=
 =?utf-8?B?OTBOd0NKbGdydmRBTnR5N0crUW1acXhhWDZXaVVVNE1xWDJpL1B1ZVI3R3NR?=
 =?utf-8?B?bWFyOWh0elVPenczc2NUTUxpQnFKVXBRNm4vWWZKZWY1b1kxSXZyaVcvMVZB?=
 =?utf-8?B?QjNyVkkxU3NtZnNhREJOY215bmZDalZhKzVpKzMzZTM5U0VURmdvUXBNZkNI?=
 =?utf-8?B?ZjEzVDAxRnkyN0ZEVlJ6cnNGdnpHcHoxR3ZmMkpwSGVMSmwxdW9YRHZEell0?=
 =?utf-8?B?OGIzMGFNOHVoandwQ2pjc3hJVU9HMnBwUlBYQkZKczN1aldWVTFGNS9LcWJS?=
 =?utf-8?B?THQxSG9aNDhnc2p1MVEvVDVwNUg3OUI2TmhmU2NFVDJORkJLRUswZUhMZmJp?=
 =?utf-8?B?NXBsRVpHYXdRQVowbHJRWmtGQWxzdSs4V1JBcks4UkJ6eGtzQm5RYXlHZi9R?=
 =?utf-8?B?UXIrbmZJVEJvaVJtaWJvU3ZjdnlVSGxpTEZCRzZITlFXVDA0RGN1Sm1sN3Nn?=
 =?utf-8?B?WFk0TUtWVlpndVNYdXZ5bVcvaGh5SGYrWFhWb1h2em1DY0F3ZmlaNnBEa3dU?=
 =?utf-8?B?alVNTHlZSUVlUVZIVVd4WVVFaStnZlJmMnQ1L0hFMWVGd3BIYys5YUNhb1hJ?=
 =?utf-8?B?VzNQL2FoMTFFampXU0ErR0hqSUJONW5aSlBZSTZESFFUU3o0aUxNTWcwSzFx?=
 =?utf-8?B?WUcwaElMdVdXVmN1K2ZZcmxhby9DV3VKUEJMWTRRbitXVHNKcjdnRzUwUDRI?=
 =?utf-8?B?VkZkeDN0RzIrY3lla1NjaUt1aWVsTDZoVmhhZjB6WXdvTjNjOWUwc1hMekFn?=
 =?utf-8?B?NlQ1VWEzbkNYc0M1aGRCcnc4MkNvdHNOYS9HZ1FVKzEzdGRZWSs0bGp0a01N?=
 =?utf-8?B?aWprdFA1cjZjYlREQkNnazJjNzkxYmRQbjF6Ni9zd2J1ZGZUN2FOTTF1bHpP?=
 =?utf-8?B?SkpoekRBUjdpOHBHZHhiUmpMbDlKVW50Sy9oai9YMlhsMGNhanl5ejNIZGZh?=
 =?utf-8?B?Y1ZsellNcXF5cHpKeU1xNTU4aXd2SksxcUxxTStEMnA0TFRhRW53d2wyNGZv?=
 =?utf-8?B?RVJLZG5XNnBJM1VxdzNEejBGR1Baalg1Vm9oOXdZK0syMzdLUWMxY3ZqRDM5?=
 =?utf-8?B?OTV3Q1FlKysyNXNKbGY4UlllMXF1b25EUDAyTEVob0VCV1BCSXcvakFZUFM1?=
 =?utf-8?B?bEdnQURBSTFWM1ZBbWFhQm5Zc0R4R01rN0U3WkFUUzJiVU0yaU1CR1RQVy9q?=
 =?utf-8?B?UHJwWE55WFFKRlNrWDlSVm5pQzVSbitXYTRnZUJyVDlXdlN5bTUvL21sQWNk?=
 =?utf-8?B?L0dnWE5iUTF0aWlKREJ0V3kvelVkK0dIZkF6UXpBVytsVjllM2VrMmlBeWtu?=
 =?utf-8?B?aXRxYWtucVcwQVpKeGM4V2ZvMTQ1Ymk1ZWl2dFJQUXpoY0d0dFBLWGlsK3Rk?=
 =?utf-8?B?MWhyMjhnZm9KNU1rWGlUaHZOb240ZjEvaW5CcnVlSCtZdERMSWZsZHA3blRN?=
 =?utf-8?B?bStvM2RGUDFxL3RUVS9PVXAyNzVrZHJReEpyV3NZU3h5MUZHamlJbHIreXh0?=
 =?utf-8?B?SHZKS2p6UkVqcDZFWWxDR2NIQ0U4UllBREpSZmxZQUxUdytMZWw2Z2poVmpO?=
 =?utf-8?B?cjVCWGdJMWtrQXBVSW1xZlVPRzl0aGJwc3dKd1oxUUhFMzhDTmxPNTNXNk5S?=
 =?utf-8?B?RzgxNXlEN0Q5V3VhMDZTeXZKVDAwd3UrNjd3M3h5YjFYUFdDWXNOdEk5dFNQ?=
 =?utf-8?B?K0UvVHgwckU4NkZOeHErOTErSFVCNWEwRkhzTDhrRkxTK3dTbDZDc0RGSzQ3?=
 =?utf-8?B?RXpaZEhBYUlhWHNSaU92VGpNV0k4Z1k3WkVKQWx6bkVJRDRoR0s3V3BuODUw?=
 =?utf-8?B?MFoyWU5NY25DWmpKRm90TWxOYWM5MDNTS3AzdEFlMk5USEU2ckQ2ejRac0FU?=
 =?utf-8?B?REdKd29reERSd2tqVzFGdFhWb1NSMWQwL1BvNVRnOHNseWlVd2ExL0phNm9p?=
 =?utf-8?B?TjZnWEluM1Rhb3NoSy9ObVFIa0VjUERPTVhSam5VVEI2L1JScjQxR05PU3Vp?=
 =?utf-8?B?L01jSHhBZUhRYzBUQW94eFVNUEM5emliUlNTQVlwR3JkamZVVVg3RERkWTVx?=
 =?utf-8?B?LzBHdEd3bG90OHFXWGNPSTJmLzVUck45OElZS3BIOFBkQWxjYml5UDlnYUNv?=
 =?utf-8?B?YnhIWDlGcXgvOEI3aEx1YS9tdkhxbFdJbk1FWTYzRkxIRUxtc1RkWExjbWc4?=
 =?utf-8?B?WGJ3WUQxdTRaK3NWV1JwMVNjR1BMM0RiL0NIVmM1UkFwWVk4ekJ5R202cjIy?=
 =?utf-8?Q?S6xdvixpPmuFAoApfYtlqGWl2xSVFVrwf5u4R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920dff62-a10e-4237-48bb-08ded5acb1e5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:43.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0LGfw2RqQcMVkf/oIZhdWyKmvfvk39J22OPYU41vdbZDT6dw1SEUr8ssIteEDpcSasV/UnpE2/SeirRianVf/7QLGcSH5Mcz6mSQRMwID6m3OG7spQxok3H60mPpLu1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..933127f870c6 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

