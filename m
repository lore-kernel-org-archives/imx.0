Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7836EAAC
	for <imx@lists.linux.dev>; Sun, 29 Mar 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789131; cv=fail; b=d6mOp8xNALIYt0kLcaSDy+qbtGTD1E3z0yOIe9vzK8z8sD1qo3TBfNwG9QL4P9lCGS4UP1rdyW0EnFVgYzRdk1aMi1AIbPzC1INV2mAWxyXIMnF1NF186R1iUWJC4d8Wwfy610HTgIZlWlnezCK0N9w0ksOsodvbZzVf1bMDu5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789131; c=relaxed/simple;
	bh=q/nHaQtG0Sawbh1YIEJURdFdRzsp6g1MUFD963RYYFg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZiI25ppJVsWpX3Gm+q5tfg3zI1Kg8Z8rX+4PZqddIqXEPnykJx9buWxfKjmGTaOO6cSOH+eJQyQsnoMS24xZg+8MtyNcY9lugwK/ptqtloz7np3qb6jYM6fkT6/I9Qx7E713P14qoOcMHHIFbhX6uMWQY1ykuFlcUoc8sSMAtXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BReSpqvI; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BReSpqvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmLkuj7y/G0AVY3WqbShZWiY9JsEJJJ7tAEACFMyiZajPZXRnJiLm9a8tvyo7HfZKij/aae65yUeFcuzTCzkLVFPUJCiI7biAhLf5AZKPndBkQgpMU1HqOfLYnFdgZ1opEjEcH0Wly+PAb3ObWMMgOjtlM67pwY7Rr9txNajUNlg+rFQksMKaSzSLXIcOQNg2tqP9iqtc2OqMr0MQPFZABU7mhy1RFHqLJJ1RlKX3U04VKOQgok2gfiz8aKHUWBG50jPV4migRZxBsFbv0GwFIRjmQtGVnTXKz1rmB92C1+LaS4Jc/L67AaR79Ypufq78FjI6Z2y6PHENE5EknzlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsByAefVd91VTTxAg4UqBKLnnBRJvX+e5zZlswqT6WI=;
 b=G+tTy1ioOaXi0B/1sLLONZRLwfPqhJlpQht+Vk4lVB0Yxo4CGWc1P2IVJOCYEVR4IjM+EKo6Vgk/TXiV2wiN8qVAVvEic4xgio33rag/OUfQVV+W4sCUitB/bRVVZyJpXxkg+lCSVz8BuioPn9RmBcybm2h9pSz8v5i0FChTOHzK+XdZtn2nb0eBrAdgF/EiUSMh0sYcAO7JowLLHl0gEkzvtK1UfdjAeH+YhgK21v1Ij3LVQ8PmtIdbDwlfOrKH8rs5AHVV8b572kk5OOSSqGLh/DwvvgBybdZ4x1kSDWer+cya9W8ZkFruSEWm9WXYbgBeCVz+2WI6f2wn3rte7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsByAefVd91VTTxAg4UqBKLnnBRJvX+e5zZlswqT6WI=;
 b=BReSpqvIO3wLlD0i44um+F75wt45hpolf3Pz2PVYLRIfy+dmkWdXxyeaho49dVapLLTqLslGihiMbSRlwcvhHRIDGlUrKPAWZZA3ZR16pXDIYhMiutLityIN8VPsdeU0uQJ4OeHsDKEdWLuApK99ocOldFXLbpVnxbtKW4SNe1QoBvFYK38FyfXoNd+Bz4gXDL5wiDY5PrWcUcGQUXD0S9yJ0NU9I+4ETsD/qYEKP9L4lgIt18FFScupivGbEdxp+mbrE+inzkU34K1dNxd7EUsImUz3U7bzujq/qRol8YW+wJ1N+RHF9hvByD1n7YDgpeUs+6g0MXHHBHVByMRmpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sun, 29 Mar
 2026 12:58:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sun, 29 Mar 2026
 12:58:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 29 Mar 2026 21:00:11 +0800
Subject: [PATCH 1/3] arm64: dts: imx8mm-emtop-som: Correct PAD settings for
 PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-imx8m-regulator-v1-1-802c0ec507cc@nxp.com>
References: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
In-Reply-To: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd580dd-8f6a-4b17-1ea9-08de8d92d943
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ny4OjR9k9uzVcGRextB2BY0nvDn0cheQfpdPn2k2dNEMFyjBS1cCG/0T3ezMnZxIk14TtFGEVjGrlysYEmFa5dpfFIM3D2299dU2swwdUBY/NFq0Or2QSQbtg50EqtdQdabwNdYx7uSzSUIFB35akZpIl8p7Aw4PRECajSM+cBU0xoPRnZ1WE21k/5Xa2kPPPV94i7g6tb6u0Xw6TeZ5DOwfiVx4GXJPP9I1pfVw1G6/IABCTqjqvyvMgsWedc4DHO74qhwEpXpu/0G+TSCTZU8J6b6MRmI5xj3T0krLpVmAjNxJnuXXpAG+ZGzEVZvM/L17SoZHfNapN5pawaMak+V/NX7MohMfQMxsrijNTA52lc03hGEe122slr/EssWqsPtnHA4VRUPUrZ/GEAiKl4pUtJZGFBoBsyBGfBXU/AhL/drsiklHteFjXiTaJqy821truwGAD/xEDtgme8BAfxz/KErHhefxTgleBXjsoMAvyeaj3TthpmyakUez+lKiciXYV4A0DQYkdM+nCWb58hmNtXwwdQ6L2mpVNYKzsOAcLcAj32VqY7nVNBVwqtcJXY8j4mspGTSFjBeYu3nWVVNyqu7tUaPSTi6dhEY5Nt9qBP9s0bQ6MOr9HJItgsrfzLsarRvN9aE9AzPUc4cBARZKda+beREUvf0V5XiW4ZYC8GqDE0JVeaacxvLy3jo387qNoKmhqY7BtLVy4sjD1EFgWChAupfRoi8GU12Nge2Ab4k2VaM0D7QJgVynJHkOcxkooMkyFr/X2aOt1FwK53X5R3CmVQCCwH6dCQDwknTv/8iJB5O6vSKrdt3bSXIY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFUrT2xWaWRzNnprdFBxYVg4NGN4SUs4cGVoR3B5RXM4SC9lSElEdXloWWor?=
 =?utf-8?B?ZWJldHBLUEZDeW9ZNXhONm5XUVF5UW14bldkYW43cUg1WWlla2FXdUVxZGtK?=
 =?utf-8?B?dmRGSGl5RWhnOXNCUnRCVUdTSEk5VFdZV3hyVzhBMzZTelorM3p5T1pWRkdp?=
 =?utf-8?B?Q2Z4dGxZSVNXZFlMYlVNK0FCbXZHWEdIWlUvajc4WDRPQWhuUllsK2NCbGcy?=
 =?utf-8?B?RVlBQU01V1NjR3FhNDhPUnYzY2l0bGlPaVNNYXhLWk9JSTZ2T1lHazI0WU1L?=
 =?utf-8?B?ekdvNXc2OW9oY2hxYXpsY2xYbUU0QUI1RG9ZNVZXMjRNTkFtbExkYzltMHBj?=
 =?utf-8?B?NzFZbHRZQSsyVjA4ZjJSRVRYeVV5aW1UU3NDMWNVMExoWUpxL005OUcxY1hS?=
 =?utf-8?B?cDdkSnBORGF3YVFzNEl3OUd6YXNEUmZKcS9HeG5oZ1ZQbXhxKzJiU2lQWlRn?=
 =?utf-8?B?MlVtZlhMWEFhY1RmRmcxL0k4N2s3d05pM1l3TU9YUzlpcUZtN2txNHJhckVN?=
 =?utf-8?B?TzdGTjJOdERuTnJZQUxQRWxkdTYrT21NVUJWNE95NmlYdzRabk1saTNFZnNO?=
 =?utf-8?B?SGVGYTF3b294VXFVaVpIcnNMVXRqL21FQkx5US9wRnEydUI5RGR5SjJxQkNT?=
 =?utf-8?B?MENIODErTGVaVEE0WTRkR2xQRmtWY2JNL3JUTmFJSGI5OXlBckJTc1RIcmxH?=
 =?utf-8?B?aVBaSHUvUWNFOU15UE9BT0dqcE5zeVVCaXlhcnRDWURXRm9GdEh6QTEwQnda?=
 =?utf-8?B?VCsvMWdESk1uRWJGcDY3RXA4WEVlN0tucGZmNVQxNDBMbENJR0NUQ2ZiUDNM?=
 =?utf-8?B?ekdHS2FRM1Bzd21YU0lzUzdNNWRVSjlpSmxiVkNmT0pyZGlRcTRkRHFSK20x?=
 =?utf-8?B?cnNPdDRZT0VrL2tBS3BuK0ZYZ2Fic1dQZVlpSHViTTNhdVVUdEM5TDQ1RzRU?=
 =?utf-8?B?Y0V6NERmajUxemhkNS96b0tjcFhPVkRNZzVoYy8yVTFIZUdKK3kxU0ppejRV?=
 =?utf-8?B?TnUxYm1Pb1J2UjhNYllQMnFNYXpuS1ZUQ0JRd0tkRlVWS2s5TWExWDB5Vzdh?=
 =?utf-8?B?VVI2TVh3YUxVUjZTaTVpa2lkTE9zc0JRcUVYRnBjRVg2RHhua0xkY1M1R2NH?=
 =?utf-8?B?VHJWUG9rZWNYckJodmtEMGFMOEN1YzN0b3VUQ3hESUdsdGZBTlM5NXF1VG9z?=
 =?utf-8?B?Q05xUEdPUkRCc3RZRFFhZEwzblFZYmRkUTNBT2RQTkxnN2VBMTBzeVhDMFZB?=
 =?utf-8?B?SmtNbytnenU0YlNPb3NDQk80enZDUDJha0Qxb1pmZHE1NE9WeHJDazZjODBK?=
 =?utf-8?B?NmFlSDgvT0pRN0FZRHY3QXVaOTFITWZXcW55UjFRNjdPUGRkQS9Gd1FlZ0JK?=
 =?utf-8?B?SWRodjFLWjh4ZVNKTVVxWVI1T3M2aUFTUHF6bUFKNElHSEtZc25BQ0U4WGZm?=
 =?utf-8?B?bWp1MUpJRGlpazZXeU9YSCtObXRrQ0VXbTdTaGFURjdoWFJ5WUFwRnVMemsv?=
 =?utf-8?B?R2tOa0o1MDBuZmNmanUyYURDNFNCZTZZMzUrVlRwSGRJcUtkb3c3MlFUaXdn?=
 =?utf-8?B?NTY1MGh0Y0hqZmpLU01EK0xvalFzZTBKSmRxTzZmeTk5MDNQYko2RUxNRUlh?=
 =?utf-8?B?QVhJOGtaRWw4VndNS2ZJRVZGNHZ1b2ZadE5lZ1MzNkR1MkhQcEhuSWdwdTIx?=
 =?utf-8?B?NlhTSFMxUDMzSXdDZGNZRVc4ZXNXTTZwQTFOeVFxQ0VpRWZLd3Y2MG04dzZ1?=
 =?utf-8?B?bTQzdndqUlpCYWxacW1TUFFvM1Q2QjhwbEY1aGlSU1J2eENHTS9VZ3BsQ0ds?=
 =?utf-8?B?NThFeHp2bEl0eTRzN25ZUFBmRm1qYjNPa01Hc0lINGd1VzVvZ1dFcGpYYzBB?=
 =?utf-8?B?MlhJMkxVS1FlMlJFaU4vSDMvNHdJUTNNWTJoVG1IMzhCVlhWcFZ4VDhWZnhp?=
 =?utf-8?B?L09XVGs0S0FHNm9ranZDSFJtNVpaT1dWb1dFMEdEa2tKS2Y0N3dROW40Mzgr?=
 =?utf-8?B?SkFKeUZRcm43VnJrMW5Dbit3MjJBUVBMZ29Hc2Z0RGM3cGRQOXhmaVZGMFpp?=
 =?utf-8?B?UlFOVDU0aUFzS3hUSG1jY1pLTnkvTEpnL2JSUU5MN0dQZUw1M0lqdm1xYXlF?=
 =?utf-8?B?c3VkWC9ZN1ZVUDdVZVRxV0c1aExUVkpzT0VJQU51VldnQU1WNitoRGVneXlU?=
 =?utf-8?B?RGxJQ0o5VVZWZFNQU2hHNnhFNXFvSURTTi9mV2NHOS8rTUVIOGZkMWlZZGtZ?=
 =?utf-8?B?VXdBUXZCeWxrMEhkbGRsVm00SlE2Ly81eWNVMHBzelZ5eGxRZUNUZ2lFNllI?=
 =?utf-8?B?R01LdTk2UGswMmtsT2xIOGZPRkVVRzJ0YnNMTW9HenpBT0k3VUovdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd580dd-8f6a-4b17-1ea9-08de8d92d943
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 12:58:18.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgaPMa4PELnQzWaXoMJd1uL1+HxCWvZzVkC4DLJtHbXWvED1n4NjkGXQeNq+GiVCHUgbC+js5f03YIpaT8dRUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

While at here, also correct interrupt type as IRQ_TYPE_LEVEL_LOW.

Fixes: cbd3ef64eb9d1 ("arm64: dts: Add support for Emtop SoM & Baseboard")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
index 67d22d3768aa8ae7343cffeebcfdde89ed25cc2d..507d1824d99d99b1f795b14aea538444c9476f65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi
@@ -60,7 +60,7 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {
@@ -194,7 +194,7 @@ MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA				0x400001c3
 
 	pinctrl_pmic: emtop-pmic-grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3			0x41
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3			0x141
 		>;
 	};
 

-- 
2.37.1

