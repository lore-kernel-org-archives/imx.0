Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95243AC0DC
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009596; cv=fail; b=T0NStFaaQ3mOZysiOksWfsGBD9FRl+0bOB9rymn9ojBmxhRcdRG98lx2QYLq9O97vO0z9W7DtFGWdQziLACn0Ii+9B6Hr+k9P7nuIMVooTtAihTOpMHT0x05iXav5CHPvmzm8TANZQk4x67dJGLNKjyIyMh7NwSelT2y0eyyBGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009596; c=relaxed/simple;
	bh=m7UKMEhrPO1x1VEjOF50uI9SJ5qqGb+xD2fTTDm4AtI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nm8WAFU/hOI2YV+WD5/WRC9zsLAWti2V0+z7tjqSDZrJMYcR3ypNjoVG0LQ1TrxuWJKdl+hz7LmR2ZtRDigQOpw2mc3D5mASGYazX1IcRhMewT8NV6NVtdetke7z6zowSFAVL6eV7mhr6yji9R3AyixjKUMO+/7PwyEULbtCUm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uh3vG11P; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uh3vG11P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrbO3+ZJ6Q52Kzab6GXkCxqKiejJ4npjcmpRva+IocZrQEhhJ4K3TM2Sb2akFp5oHsXSft3Rb6WJHGMZutb4AZK0jB6h4gby4jK0Vlkl5fFBZTXnTMXI5HBWnQZPbz+sPLvGDpCoH3+o8bMIO1MuvDBZANgQX2CYsjEi7lp37GuyFVmYCijFkejg2kvMV8eq1glXpJp247VutkXylFOYj8W0TLscZmNBUw7ufFU0VsnOvQ2O/FbkCTzmvNoJHQESv0Ds+gpLYWF3oz8421pfWMLaiYLljA+2+xvQuFuh62fdkN4SgnKDQjH5jdZBp1EdsucUY57i/e2/1YN2p1E0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCsPgjtOINv67AOey8s4V47k5BKPvj/Nx55hF+gcEZk=;
 b=gLv14efNDyIn2K0TMgPY390yC4JsK59ZG2WrkGKQ2z4UTAKaQpWLOhfLI3z5zWO7B3+kfTqq33wXuX91D/eB4gUvjlOT5E9my0cwcb//KFmCWhswcjyoTe7tlzxljTIbPEf1yJWZrZaxJcVAznA3uY0vqzP1mL2gt4XN+so/nHoAZ1XjHgxkzGB/7ptK0yyrZDyO1aWK1XHf4zSkCEXcVJFT1PYTbOT0cBFFnRvnr9bfGq3M/YrMi49SsCDkmlLZutrwpqX0dgcrCVwWKH7CyiXSXaT+54ddsTkk5Bt/LPjByi9Mv4Vj+k6gfRJzfJGkfd4NJKiT2KNVUpt/IgEVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCsPgjtOINv67AOey8s4V47k5BKPvj/Nx55hF+gcEZk=;
 b=uh3vG11P2AzB12MNC8w0b7lzuPSLjJPibWwRKYZv2Kqo6N6imvySVuEQa3z4iCsFHlwuJjlROsYJzen1YxE9CDwZu12IB76EOnZwSnoOBEzvwCPZVRMPMN79Ac29Wv8zZzeTC5Uq6+inTmk5yLbw7Qad33X58F3dg/6mrEzY+rzJIKt1EJajPEQTmsP1w+gcS6jXxDlADGOtWon7k/d3MnmNixcPU8fR+1AdJMvqN0rYbrd0pDw/y/yF/7PL9UmepF+F+xt33zamu/+PhcSzxvVVuFyOR/ZLL7CdB+F48fP8h36yN3nFhimBvjBKil9qnvuLrwDb5DWqW8MaRb0FRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11869.eurprd04.prod.outlook.com (2603:10a6:102:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 12:26:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:50 +0800
Subject: [PATCH v2 2/7] arm64: dts: imx94: Add V2X/ELE mailbox nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-2-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11869:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d35221-5174-431b-24ff-08de867be853
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/92vGS4aWptplMDm0MYFO3JM0sAuXfTvmgGIWdcY+hNhVEIB20UJ6C/TkMmNll+O9eB4BK/4oq/6FDFP4xicLJg1Ig2L1HtMNb7JLkW1Sqi83JASqW8nyZQLppr/+Upo/KrQqyMP21ywTGdjDZow3OWGEY8P0hkJ68GKthAoVDuuEDGxyra/6san8XrcG4hBC77RH0zmct/cZXuCCvdequn08augQnm5OXZY4jEykXZi5MGSrXNXNjh9UZKwjJT4hsgsJffj4vFrKXeuTmiwVknr6ZQ3CAYd7VLADGN6Xt4grRgfdOrphvHSW+M9LZLVQlEIjmPa7KIfGKBhy4SNs52c/X/IbWMkP1Aa5JOKR3BYumhfem7VaJsl78Zde6OW+3yOc7hsQExwRnnSGsjCkAxKmBeoOIxB4spYP9L300Q55aG6ANsluQCNTs7cFSRK/y6CiDOUflKY41uQKGHKz1tGishggLGwY3Ek58Mml9KsZFydFF4zGpafelhian4xWh1K3SbluTZ6Qc+RXxUy4WH+r7LIpBZibCGVWsTI28DisDJ3WjIWh2Fg+w70wJhFX/6kh+msg585Alc5Xk2br1dT6HKR21zuV9vGF+8W1DqFk9KreEXe6p9uWesjog6zxka4/BEQI3f3Fy9CigID8dKnnfwbLx9dxHIxPnzSWWBAiXIbztLrBqw2Lk0alvTCML4EIzLJ+pJ/SQnPfMLwuE3zNjAUUe5e5ARbGK9MUT1CbpQ0V6fePYccoLDgqVWGw1XPBW2iDke5q0SuAvQEdgHAqSIBXTDMuCupIKVrCfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1pdThjZTQra25kUHNuUDU4MjF0UFNwUmZiaUMrYjV6VGVDbXFqY2hLbWtM?=
 =?utf-8?B?UUx3NTltblVkRFFHdDRsbEJmTjcwYjJ6YTR0MTlwM0hhaUVINnNDWU81OEJ6?=
 =?utf-8?B?cnVIR1MyNmhRRnFWank3RVdieHIrMVA4Y3dWUVRyVllSQVkyN0ErdUdRUjJX?=
 =?utf-8?B?dkVKTXY5ZjhuSVVNYkhsTU9BbHlzQVFOdG9tc0IzbjRjdElSNjFPMGtFL3dK?=
 =?utf-8?B?MWprY05vdm85WFVqN1BiVGhXbWNWWVpkeFViakZaRzlRTTJBa1FrMjJtTEZE?=
 =?utf-8?B?ZklZVy80VGNSd2I4WVg0RS8wbCtGV1dCTmo4bTNZNW1sV0tuVHFCZWZQNG1P?=
 =?utf-8?B?UE9wbzk5VThxaUJKWlowRnFYNjNKV0VvMGJLejJrcXpSblNkc2hFV2M1U1Rn?=
 =?utf-8?B?WEVMU3ptek4xTkszMWhuV2p1OUNxRXk4VndDVzZFVVQwVko3T21PWmZweUlU?=
 =?utf-8?B?OGJKTEpvQ3VaNTJBUjlpQzJTa3BiWlB0MXZHTEpTbU45cHVVN1JUVklQeS96?=
 =?utf-8?B?OGQ3Wjg0ZWNudUlkUC9ZRlNLUkFMRUMyMkpWc2E2aXk2ZGY3MkwvdEZFVmd3?=
 =?utf-8?B?U0hzNURHankwRmd1NlZ3Q1JvNzBNS3ZNTkwxRVpVSjIzTUdjeEI2Z01pUllG?=
 =?utf-8?B?OWUrcWkwaENoUGgwMDd6S2NWc1dxMUMwQktoaHE0TXJyZkI1Z2lyN2ZsajFX?=
 =?utf-8?B?SkZxWlJFdzhFK2lzblZRZHl0d1pDNG9oc0NpRjg1bUhEaGJKbGxuZ2VRYWRC?=
 =?utf-8?B?clMzckU1TDRLVDd4cmlmVW8yVTZVNHplQkJlOHJSQjdibG5wVmRTdFRhSnJL?=
 =?utf-8?B?ZENPY1UrMDNjcGdRT2RaSS80bmhhNVZOZUpFbC9RbzZXT1lJVis3VUJRaktp?=
 =?utf-8?B?NDA4T2NBTGdKK0x6QVo1aXg1b3paUkxtd3p2SDNSZ0NJcGYwZHNPcFBaRk1S?=
 =?utf-8?B?dzVWdFRtb3BWUXIwZEZtUWpNSndVazYrcTBvOXFXaXp3ZTNTSElVRnhIcGxC?=
 =?utf-8?B?c0ZlbXlubndhRjA4ellpU0prTzZJOE9XKzIyNjkwazcweS9YbjJYa1k0MVN1?=
 =?utf-8?B?WEdkTnBvT01SMTlEQWJiZGdxQnpNN3RjY2VDOG5peXN3YkxpNnNpc0JEbXQv?=
 =?utf-8?B?YzdIb29jYmRlY2YrRFBmQUFNeFFzV2JXNmp6cXlBQ3hwWXYwbGUyK01qQmUw?=
 =?utf-8?B?bnVnRkswblJBRlJZTWhNUDhkTSsxeWYvYmRTR09CQ1dxc0o4MmQ5Nkl5K1cv?=
 =?utf-8?B?YlNQa0VlZWtKM2FhcE1zMkhGQTgxaitwZUlKUmhGSEZaOUMvVThRRmxDNVlP?=
 =?utf-8?B?NFlkZlJURngvcS9mL1lkbjhhd0NzWDU1eGFiUW9QZ2NuNjU3YXVFK2Y1ekg4?=
 =?utf-8?B?WTBLanN4RjBwQVF1d2hqSzVkV1pQczJkbUJEaERZMjJzM25leEdTRCt5Tkkr?=
 =?utf-8?B?cE5CYy83UW9vWU16cUVHZk5sbjEyU2VTZEZxNVFOS1p4KzRsYmUzU21BK3Zr?=
 =?utf-8?B?U3BRQTV1UEFDMnRjQUlrNmROQzQ1KzViWlQ3UTdNWlR5MXgwbmJ5TSttRCt1?=
 =?utf-8?B?K1FLUzY5OUUwT2tETUhzQUpyd1lHbXZnMzcvRlFMM0g3VVVUelRiVHJhcnNE?=
 =?utf-8?B?ZXMrREw3bVVZVlpsWVRpclBwblZkSkY5anJzTlBjcm1JQ0hxRUNKZE5uSFVi?=
 =?utf-8?B?NTUyU2Q0WDR5NllDMFRrN2pZU2crNGs1RWpGSmVxWGt4Y0lHbDlFNmloQnBZ?=
 =?utf-8?B?bUlXcEREWDh4c1YwT1hBay8vVmYyeHhBcThLMWZ3UjZkN0NTMmM4V1g1Y01X?=
 =?utf-8?B?a3AyNWdFTnl4aGlhZUVMVmNpVVNLWUVGUzQrVDF6SkpoWk4yZmhMcWlxTFp1?=
 =?utf-8?B?VEViK2JqczQwUUE4eHhweFVlRy8xMURLTU9VaTFkS2FsN3hFR3pDZXRoa3NZ?=
 =?utf-8?B?dlUvdEJmUDVkbVBHZTdlMVRsdUFTcnNlOXIyZW1aWENDc2N2dFd2RTZmaHhR?=
 =?utf-8?B?TnpvMlArZ3dPa0Zrdi9WUldUWjJaVEFSanl5dk0vY3FQL04vdGpmWHRmbFY1?=
 =?utf-8?B?M2Vmd0VrdVZYNjNXL25VQ0d1bFgraVh0a2d3Y2trbVB1RXhxS1VKbDcyeUox?=
 =?utf-8?B?QTB2UXV5NkVsU3BtVm1kUE9NODRpTmhyODNacThWOWJZZURDY29TVEh0NjJI?=
 =?utf-8?B?QVoxay92Y1paQkJaOWFkZmxpenpXY2x0L0NseW9lcnNYOUlQdkwvU3dvYk5s?=
 =?utf-8?B?dnlRcDNXQzBEb1FZTWtRS3k5dFV2dm1kQXczQzY2eS9Pakw4WGJKZWxJNmZj?=
 =?utf-8?B?QnhIL2hoWXB2MWVxMnlRMENKMEZMRndQd2s1aUZrOXlNZ1dlSXNPQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d35221-5174-431b-24ff-08de867be853
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:27.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPyTD42QNRBTIdgCrl/EbEZAq7LJchBmvxpD6JSItRgS7Mw2UHIxNFopoVyzhMxkA+Btl8Fjaxg0oEiAoRcbJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11869

From: Peng Fan <peng.fan@nxp.com>

Add V2X and ELE Message Unit nodes for i.MX94.

One extra V2X MU which is dedicated for V2X fast crypto engine is not
included, because it requires a new compatible string.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 38488147a3ef2f3e9c19e0ad14de2b98d85639d2..69ede676fc04ede23faceb8f24cf740697e40d7e 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1212,6 +1212,48 @@ a55_irqsteer: interrupt-controller@446a0000 {
 			};
 		};
 
+		mailbox@47300000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47310000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47330000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47340000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47340000 0x0 0x10000>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47350000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47350000 0x0 0x10000>;
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47550000 {
+			compatible = "fsl,imx95-mu-ele";
+			reg = <0x0 0x47550000 0x0 0x10000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		aips4: bus@49000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x0 0x49000000 0x0 0x800000>;

-- 
2.37.1

