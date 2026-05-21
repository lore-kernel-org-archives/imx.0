Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DF409101
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390995; cv=fail; b=rOpWr9m1K1F+K2SBLDz2hKy9ddvbrixHlayKBVMWysrDUB1Mo4ULjQVR+1dQVfV5/4vkVKhncGkjPWUuBeCpUP6157Sg4P75C68Ap8ksm6JJNCO+mi8qN9t9BMQyMswpSDVliPYWS8XncsRj55H4S6jzsLkoNRlQlCpysNMJ0Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390995; c=relaxed/simple;
	bh=i8l57lNsgJdi5OrogMUTQhSNSFRdYLNo/SBsSq+WtvA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ktf7jezExS6O6bB5JAS0mhsnlQWMv8NEyz0nnbb6JDwspfKYKwktaoUQjxaSQxWhcPaiT5UvQN+xDiC7A0j6drGyXU29owdUnOCWX84OHhxGRahect61yzYB1njO+sV5kQdX8JDbhyCeyVtxxmQE6SHy+6ttaleBGdkr6vYLnDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iSmyGA/x; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iSmyGA/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1h0AWe455N/yrza4RSorTqdsa425PYJ2aRbkFElsVftE++7rwKGnM5GVXS2Uc5eFiIGv75MA96cdx9xvPVYyv/xmT9SBxanh72wgYrzXcOOYGGM0JvQ5LiHHbTWWtctZZA7Ekqb4E1LABbQGOganjLS9+l41R6Z+ADgSWtBRH1Iqgdca69+SXViCdLpXER+Lqiih9Uw8MlWOw0kuAev+I6acO2vi1rv2YY6Mss9zwjARX6axMR3m6jwuLlLKcNJk7QZzNvn2YlPrMmY5bX0rSU8QxJdex0VpFBCDgEwd6SabqbW8vumRmWMKsYklF9jMOzV0a1wuRFWRM741uO1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S60yObmP4BxJyXCzxPpO+qahHBuV0TrWb37kp8OJaM=;
 b=xWAp/+tk34ry9k+NDIucbb8cSnd5R1YOpnpaZOf50tyYy5SkhERSI9BghLtAALgX9L/E50hENpzn8XHkQuSbP40fi5uh2gNlimotylBLYsvlk2z24Sp4bDeg6uWdv28OUvzZMeZDc4kI4AzRDVxlLD63cq8l4FGak8IPEByDGUvmUvlVG9pqbyT0p3+T7RjoS9Oao5pgdBizI6IZpyi6EFP6kbqokdHRtiX1cbYSITqKwYLtcducB0Hz8M75NzXHkKPLiIb2YKv0tf+grfj+624ctfJTOOYVx9HiBdTJ41GMJw7ii6GBfmcGv7Tms4kPuhSaiipXxZedPU51yzVt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S60yObmP4BxJyXCzxPpO+qahHBuV0TrWb37kp8OJaM=;
 b=iSmyGA/xQJxBT4Z8rDxHV2s+MTxf4/m2kSsPp2a/mQ6u6KdGbsizKbBYo0YgPXJ95UkixOibdhlAgSLnfcg9gUE7SL/pELZSXlVTalXUtDJuccMkxvfF7yBKXQda2KNLtxgABnjzq/RsEAwQdaxsH8Ekb6kUYlwU8BWrNwnePlAOs9vQ0w2KWrkqUpqUFxqUpGH60my2oNXK8Esgo6rzktHZyaB7oYsJE9Dxzm7nH7gOp+Qq3pVL+WpowlPnSrfksYJgeQJzyvRn240gUdP0FeOjdcOfUVFAK4lcU2OcY9Sjvv60IgyhXMrCdDsZRhUs/WTujL9jEqzZNOSJerwT2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:16:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:16:19 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:44 -0400
Subject: [PATCH v2 6/6] ARM: dts: imx6-display5: replace marvell,88E1510
 with ethernet-phy-ieee802.3-c22
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-6-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=1476;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gaVpfU44yuvPoz+UsTZNPlJbMIkb86kscxJBtMbIaUY=;
 b=OvNfs/LBLCqU92OX7ZAE5DMWaPSTDXE5Q+4QLq+KJCwC5jox4S13QaGcIen1yaB5J9qyTHbye
 1IR51DLAsNWC9JN1aEbIglnvAu6jk92B+1J3H0t3yW36vIqF2i4E4MA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:510:f::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b15cdf-b68a-45bf-98cb-08deb76d7024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NsH7tYf6O6Rq5r3eEvBPjn37E1Jx9V6J3rDD5y7mG0IvY7XJS6C4wFS+CXQy02c2xPFCF/PVI5o9Gxk3CXkkD1myJHnHalQwHFm7KPsc5dPIdfwAATnB8s73OV+YQobVpk9R+yucpz/A2f5DycNZ9HrXeHzgJHRsZb+JtIR6pckaPmea7aG+6g84BNH6yi3B1NHh8e1MsFKqwIEexltL/zK3nhwZxBlrWWGja/4Vnc49jhqFsfIlIujxJ2HLOa8k/qMqzwHwaTO5PLHPcuiz86DoNN6aFWvsxSG7e/d0oLajseT+hKgo+9G8dKCxH1KrtiNr1MgYA8LJ9L2tTVXDZz1GNZePFZEAGLSViGgQiZgjYlYVEXV3PY5w+Ja+dsAr3k9i47A4+r8D4sIhmDLNkhQE4SkHnJHQlSzR09YCyCZniXJqDxlDEpIXaidX8i9FAiE9gydQRX/Oi7aYbwLCdt4Bp9ZtjpT5Y1VyRaX3azUDQbGunKn+IdsVVk1GsUkzaWjjwoD4pdZUJXeUQBoMWdRxx0aMM+VoOiHWpQGfuz6qczi1Pdsm9L9ztSALak5V/DYeJdKErnzDJSZahepua+X+zw6Ojyb5u1BtQb4xA4B7eTyEeljrB7DBe7fds0tuCVVDfeZD3rcE6qOEDwJE+Bo/6fPZU/as7u0AY+NPgFDm1KzcTfFV3DmPNka8YWAl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajZXekhhQnpzRGkzNFgxVzdzVjBHOWNpTVU1OEtJcmNaL0E2b2JMKy9RY2xS?=
 =?utf-8?B?cEw3NGhqYm5rKys0Q1B1NFJoaWc4K0pFUE5qcUV4emJhMGpRMFlsWHZKMHYx?=
 =?utf-8?B?QTBiVWlkZWkvUmdzL2ZRL09YeWdMUVdDZnlUNCtVOUUwblVUNGowWXQxZUNh?=
 =?utf-8?B?ek9WdHY5NFNURHlYNVUybzRHaG5HVVZxZUI1QmtnMnFpVnlZRDF5VXBGZ1ps?=
 =?utf-8?B?S1NWTTZrNURDTlVBUkpFV1J6NnBsbXFhb0xJeEJMNDVuQnVVREM4WkZVRHkx?=
 =?utf-8?B?RHd3bU1kVHN3c25VN1NSYzhhemViaFNLd2lVS25hc1RuZVlOT1FNY1d5VWhO?=
 =?utf-8?B?VlpQMWY0SVpNRjZ4Q1VYYXJOSXlaNWMwYUdqRXBzMmVYaEp3NWJaTExGaWV6?=
 =?utf-8?B?ckE4ZGk4TEZ1Y1dmR3RkM3pjRWhWNnNpMFpaNnJuY3J1RlhuMFphY09XcllI?=
 =?utf-8?B?MWNDODRLSmg2YUhlRTZlNGNVay9Na0tGWEErc2wrZkp6OEl1ckpDNzhuNHVa?=
 =?utf-8?B?Sml5WVU3am03Q1BWeG02b2JtTjIrSlZ1TWNHOENyOEtFMDZpYnphazh0QWQ3?=
 =?utf-8?B?SUNXbWlrNm1pYyttS2w0U3BUK1Mwa1VRKzNjZlJQN3U3KzNDMTE2NFlvT3g0?=
 =?utf-8?B?aVM0dmRJdHl6NWlKT3Y0emdZWEZZd3dBN2gzNVJtWENaV3B0UXBFd3lidldK?=
 =?utf-8?B?bUdIa2kreTQ2M3NPUjZHeFBJanYxejlCUGRWL3BUcldaT2J6eDJaRkE4d2ha?=
 =?utf-8?B?OFV4ZHRaUTRwa3B0TStGLzFMd0EvdnlwSnN0ZzBNcVNpTkxDZ1o5amZZOFZL?=
 =?utf-8?B?Q3pGY0ZHNGJnaXd3d2pJdDlYNHhLOUdYdkR1SW5MS2NIamFwamV6cW5ST0V1?=
 =?utf-8?B?K0FTVFQ5M3VoemZRRFp5dXcyM2tWWEpGRzRQTWZUMHY5N2JOa2FjMzdRaEla?=
 =?utf-8?B?aVBpYUNETlJtdDR6TFdJeENHM2FmL2ZLSEsrdVlXS3RocDVpVHhKR1YzS1hX?=
 =?utf-8?B?dzNxbS9BT2dpNWwvdjl2a0M2NTRDWndCV3Z6MHZUTFQzR2NmVUdOSTF1WGp1?=
 =?utf-8?B?ZUZqd3IzQjdXTE1RaGhWRXpjMVFFaWFGdkxJS2ZlREV3Y3N1OGp0Tld3dWxw?=
 =?utf-8?B?T1U1SndwN3d1ZDFGMlQ0WmJOMG1RYUNtUi9ja29JdlI1S0dmOTRuL2poUHZz?=
 =?utf-8?B?dmhCVkZ2SC9jVDBpcTk2a0FmbWl2L0h6VHJNU2pmdlM5alZvdVhsTEJxMy9q?=
 =?utf-8?B?RzhBemtOVGxzM2g2M3NlQUV0VmVPQW1YVGRtSDVBRGlzRWtwczlHNmdmWWtk?=
 =?utf-8?B?N0laZS9sV1RXektwWkdpY0cxL21DeGg3bnI0ZEl3MnJnbWRZTnY3bTE0M1ZC?=
 =?utf-8?B?VzVJQ1B1VWZBSFhzUnN1a3ZtNm9FUVp1eEFqN0oxQTh2S0ZhSW90QUhOdFlY?=
 =?utf-8?B?L0o4czhSWFdwNXJsc2pxOXYwaHZmaVM1Yk5aSEc3TC83NDF6YzlGdWJ5cHlC?=
 =?utf-8?B?SXpKdUszZEsxd0NpY3BxK1hXVThzY2toYVk0SHlDWGlYNC96b01Cd1FkUExT?=
 =?utf-8?B?djN6OVpiNWFwNmU3MzNOSHMxNC9lVXE2U1dDY0lLMm5Qd0E3d0xOK0g2TFpR?=
 =?utf-8?B?d1AweFEzbHY2VGFWMnRDWUpSV3JNbURGeXA3MHdaT0tGaFpzODlEejFUYm9a?=
 =?utf-8?B?dG42ZFkyc2piVHN2U29FdjdzYVVSVE0rUXdQdzBWRVovNEcybnE5VTdhTGIv?=
 =?utf-8?B?cFlBWENIbm1mK3RBT2g1WFN6Z05xK3NuOTNOS0U1SVhUcHlrME1CbFJEUkpH?=
 =?utf-8?B?RXN2ejdDOStrRWx3RWN2VTFSelJhN3JpT0M2RlltaUFrSHZaMGljS3NqaGl0?=
 =?utf-8?B?UEtobWc5Q1JBQ0FDMCtheDZvTHhqdy9TMTVDNFdyR0hRYWNiWXBkMVZLZEU4?=
 =?utf-8?B?VFUwbm1MZktaa3JPRXFXRS80V25mKzUrWXA0UDR2eDZRU0JFams1b1paWjcx?=
 =?utf-8?B?eHorNjZZdno4eFZhQlp3U0JHY0d5ckt4S0RVaHVXbGNudm9BUlp1NXNrWVhk?=
 =?utf-8?B?VXk1VUlZU0liNHdjL3lkbnptemk4VmErcHJIeisrNk82YWQreGRwUGduSFJW?=
 =?utf-8?B?RGw2SVJBRzBNemFpb2ZTdUZmT1FaVms3SWFoU0JxRXZaRlQ3WFIrMGlnVGdB?=
 =?utf-8?B?WjVmTkhlelZEWEsvSFNZUy9YWUVoNTZhTXlSelRUNzFjLzBBRDllTHhRYmtp?=
 =?utf-8?B?RXdFVE5DN291YlBVZ2hDUGs3eVBKTkJybmJXbW9MUmdsbDNVYjRCSUNuTDQ5?=
 =?utf-8?B?UDd1R1N0VmQ4NGVWSnVENk81WGRRZ2VtTUsra1ZrV1R3dVoxV1FNMHVxdmhp?=
 =?utf-8?Q?/i7LqxoE+9RRRfn6Ox+rcTDbKLSozF/x6bB/k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b15cdf-b68a-45bf-98cb-08deb76d7024
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:16:19.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqXnJFe+f4oTdCsPE3sRwRtqqbMOsxzxVHwqMrY8LJPj/DLoCicX7yVtQ26B6eQEjxNOx7BoBVIW0FO3hiDAo9tY2QmAXHT6Fouz1jCRvyf2DA0p20aWXBjJSA9EXUAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Frank Li <Frank.Li@nxp.com>

Replace the vendor-specific PHY compatible string with the generic
ethernet-phy-ieee802.3-c22 compatible.

The marvell,88E1510 compatible is listed in whitelist_phys[] and is
never matched against a PHY driver. PHY devices are expected to use
the generic ethernet-phy-ieee802.3-c22 compatible unless a specific
MDIO driver match is required.

The 88E1510 is compatible with Clause 22 PHY devices, so use the
generic compatible string instead.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dtb: /soc/bus@2100000/ethernet@2188000/mdio/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88E1510']

Known other user (uboot) did not use marvell,88E1510.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
index 4e448b4810f27..21e8bbdab4e69 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
@@ -208,7 +208,7 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		ethernet_phy0: ethernet-phy@0 {
-			compatible = "marvell,88E1510";
+			compatible = "ethernet-phy-ieee802.3-c22";
 			device_type = "ethernet-phy";
 			/* Set LED0 control: */
 			/* On - Link, Blink - Activity, Off - No Link */

-- 
2.43.0

