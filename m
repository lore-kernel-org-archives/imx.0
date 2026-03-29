Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1436E49F
	for <imx@lists.linux.dev>; Sun, 29 Mar 2026 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789135; cv=fail; b=T/7GGVubnN4oY5Kd35LeDlo65IItTPSI3uRXfr45QUmq70XMYGS219weHnSeE0AKvVwr9p+5wILwgc830+KsYdpATPFgWJpiFJOmVreKli4Ljj1NF5pq++r7BMrhWZ/Z4dMBmJthRCIwz70FgqRJleUgljVYflVZIQP1Tn3ClJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789135; c=relaxed/simple;
	bh=nstHFbN22JQbNGBFUlYI+VQ70Ws1FloUoTr6PEFUT+8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b8nr8AxBME+zBP3U/L2mHS8tvWJ3RI1Y1EerZ5b+8gL4cU4ngDPlFVE+gR1LAvKY31GYH1XInGZOaBdQ4uC/sAv0Qev5pETDSmpoqPTg482iLdpD+9R3mv52qGAVHLDJA8VO1jjk590atb3C9BJkukHGJhq8XXZ1/OVUF8dZTgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DfNXWtES; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DfNXWtES"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXQ/KbM8QaWrfBKLluBoaqKQxRflpNEwJW3sSqgpssEopmYM2BrAJfwyonmsFRb8qu57c3IqC6FoWPs+jD5Wts51V/UCyYqxqd2qtZPCBjlQ6cppwpcCshHaMtvI0QzYl6KskZQsviLKaL2WkgkFeyIaDFOZlv1udtAQ1fjB5phcv78+s3x11Ti4zQ3wYLazvNCOly3FD7g3F0H5VGUZ8WFEO+E3Z06urYcs+kYNQ+D/uwgiL9ZYNfT1pPezNQAA+e9OGcpcncrYeW/TySPizgh/uDPG2j+Q/uz5GreHeaK3BS/RI74uyXKuEg5pWSS6h96X7Sekb18tmSfuGduXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gf6sG2ZH+mlJg1SVGQrJ5hAqw8BHVwolEdTT1WX3NA=;
 b=a/3vdeZQkiRMN7B6S9lteJ2Vw8ZCJsOX8QnryBtb4QzTGcDsN2t/DaaR6FUmzylwLoX44dx/YDUhgq2BRFYw3+xVSzazopagC2a6RPlb336zP6acX0dKoaHsoYQSFL8e1LCM55QwhbddFmFLFj7+up/sqTLEBUu7zJbr9zUmEy3OeGI0On2fUtWmT6dvNWiLNO3s7b315kxjtqN/j2bFL11ZKxtTCTWuOOXcHUiH4vFqShPJQoWtcTpC+FnJLYellQkphFiGtvQGWgW18qmS3EudxWOJ3RHtBx3Vxvr4NdFndqtnhUC2uclDazOX9W0dtkELDxmro9z0S3evA7YTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gf6sG2ZH+mlJg1SVGQrJ5hAqw8BHVwolEdTT1WX3NA=;
 b=DfNXWtESYQOpKA4riAm32jQVYEbu/bHv3aMzBWBecpfidnJcsOcsc945zDF34WPiA2F65mc2oe87hpwHgwo7azGtD+73WJkbvlaswqaA0uLGwIqcRkBLenx5DC7wuksPOaVP9QuMPFYEotsW5ztRwbQu9LO9+tTbIgPjccaO/H5cFtWV6Z5IKB89TvMsXDbkbzFqWL9AtyLldMuGjpcne7dr0dCHnrM+yU1CGaKycn4oVz/ADKlEgPB4sKjRQQW4dIBC3132yOCI8ei7i7EZgcGM6UU7DU9qsRRwRGZJL4wdkY8ly5f61bj1aiVqvYWFOopIsp9YcdwbSSmnrzj8yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9376.eurprd04.prod.outlook.com (2603:10a6:102:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Sun, 29 Mar
 2026 12:58:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sun, 29 Mar 2026
 12:58:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 29 Mar 2026 21:00:12 +0800
Subject: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for
 PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-imx8m-regulator-v1-2-802c0ec507cc@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b639f43-8099-4977-9af1-08de8d92dc5d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GRZXElheHnxPltwUHlmMCv2BL2Q4ez07OIKUOWZWBglHeSmippTVifvt6r5kcwJTLVU5AnYMR3SnYPFYCtSOYKCr09RfYnbWkQXvR6Fv3NGGN230SjsusFmJ+YfXf+WxIuGe1zSjDBrVSsaHZKaBMUexJQg+eET/z1jakVU6bj0rJ6Om0M7/zXCEGOZdiy22S93V7xcbJ3Amo990M1Q8yp7gY3zM/aztRjyEC805Yf2NoA2GxteAgt8uKzTYj/KH9zygsiYStUFGHmjkv2eTT4/9/qC9etwvt2WO95CdYS9nKBKmc82fT3GRPq++qa8AJrpncJZ0MLKWq1wRdbFS3uvcQ7mV/gmlngB7Txdm9srAEOmHYxzBK6bXxSx8AfrJUr6DRgkql7faiLAGjUW9IGsDOC9HwKP+ZrR5kWrsTJknDvjcRcnQoNtAIvzT1nkJDtdXl/TaE33dH+PqMkURo+SgEIZWyaNdv39n38GPo2MqD7H/DO5g486Iv/fEWSgKEfPUlWvX2AstnCbmBf/ZSmVU1U1cCnmUEjtr580H/JH62ZvjQBOcKCpeF3WWhkg3vbxUP2TASu3Iw9b1h0DMkmUMroxut4uhb1fIgzpHZkd39OiCuzo80wO0YdIYIUpNS12jrw32GPyquTkfWbdyHteOcmum8pVaVttqGM5CRRXRixhPpf8Ou6icElEIl0ZuxIb867WYXty8ZiULef/nj1tBxJ0g4nmfLSow/uoei3bJu/2ZuMM91Gv5yHsIs7o3xtLNTfUweGRpTdvHY86hTODEXUnDgF1/RLJd1maVxjKt+sa0Y5pfu4eRtB+YQysO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckF4eXY5YzEwbHZLUXRGZ0VBUXZVL0djMjhwUThqWHNZbml3dTk2VFRNOCta?=
 =?utf-8?B?WmFDbzN3N3k3SmdOQmlDSXhmdm1tMkl5TWEwUTFQS045Qy9TeGlXL1pkUGEx?=
 =?utf-8?B?UHJ4bWFDZzhZdkE1MHpXeU13RGFiRU9vV1lSRVc3K1YyS2wyc09qSVovU2VB?=
 =?utf-8?B?M2ZGcTQrdE0vS3pqbi8xb080SkJLOHkxNkQxVzAwTWMycnpHZ0ZOKzI3cklP?=
 =?utf-8?B?RUliRzFMVHU5WndLSzJrd0tTcVpOcUt1b1U0WGlYL0JSYUpLaUJTY0RTYVV4?=
 =?utf-8?B?V3QrQUVqOTQ5RHJPL3ZCbG5tSnRWcS9tWkU4TXNpazQ1aU9hL3BqQlNFQ2lD?=
 =?utf-8?B?VUFxQkdxeVg1VXJlUks1WlN3THBxdVp3bnhiaXhPZEJxa0hNSm9ZNCsrdEYx?=
 =?utf-8?B?VG5ISnFTdzMyVEwwNm0vS1hnemQ2YzZUalRmY3BMaXIrOGZSUzNWRHdTUXdp?=
 =?utf-8?B?bGt4ZCtzb2VyTmVPcnJLZ2RiMjRnZ1hyR2tVUjBQdGdsblRkcGhHaEVycUNH?=
 =?utf-8?B?a09OR2xtWjBKb1dYSFBndHoxVGxPVTdtYk05bi9aVHp6LzFOZEFoSG50QmN1?=
 =?utf-8?B?VitwOGczWXh0SFZVNW9aMzRCMkJmVGI2ZmxaWjNLMEF5cHdRUmhqbEx1OVJC?=
 =?utf-8?B?U1hsdUVDS2NsR0lyT2FrNGVBUUR0MWlaTTlaaXJkeW40TmdtdTliYVRaVm9M?=
 =?utf-8?B?TmpmWTBQeUpjb1VnZ20rZDhPa29rYUZqS1BBRFQ1cnlZVnc1TGlWWlJTV3JI?=
 =?utf-8?B?MGRSdzZyU3RiL1pmZjE0UXJ6TTlTcUpObjVYQ2Zsa0tQU0kyVDRudXRGbHJD?=
 =?utf-8?B?TTA3d3l3R0pMUDJkRGsxaXo2Y1Y0SmM0WkVwVzlUMGFWNmNoWDhkaTBDNzEy?=
 =?utf-8?B?WFVrRU52Ukk3MnBoUHBKQVFocmprS2x4SkJiZ2Y3ZGo1TzlCR0J3dVlJZHda?=
 =?utf-8?B?bUM4L3ZUTURzaUZ1V3ZkSDY1cWdhREpIQTVhY295WVpzZXlFOXVWaFN5U05K?=
 =?utf-8?B?R3NZVTBldWRpajBwbGk5WjJiY0dYTjYxTjhuVXJqOUsxVUUvSEZqU2p4K3d2?=
 =?utf-8?B?aUtNVHJiT2ZEbVdJa0M1R3orVndoVzlFT1YxUGtablc4WERvdHNYRTdsK25l?=
 =?utf-8?B?OFRyQWF3MXlPcFlBUTdKdEtJT0MxNWhPTEIxVmV5dC92NEhJRHA2TUt2Y2Zr?=
 =?utf-8?B?bGJtVHFMNXhEcFBudWQyWFdXb0JuU0wrSDFyK2l5M0FjanBXUVVCeWFwZVNr?=
 =?utf-8?B?aSswYWc4RzEySnJzZUVEVTQ1VGx1ZnhDSmZlUnAwSVYyL0psaVVkVEVaUEI2?=
 =?utf-8?B?VDZleTIvVXp1RExXN2ZHQVlUM0xxOXJHSERUbkowa0g5QW8rVS9PdFZuM0sv?=
 =?utf-8?B?RzJ1OEFMWHpQdVF4cDVLZkhubkF2b3owTFNuaFovWUdreDY3LzZ3YXlLNlVo?=
 =?utf-8?B?eXlGWWpWUjBGSDl3Q2ZkeFA5bmw0eGFyWEdtbVdLK0Q5Y1B6QUhjU2lVQTJK?=
 =?utf-8?B?eXRZWmd5aDZGY0xuMFFCK2pjSVdGcml4cm9kQ0ExeTA1UzdiaFVCYzZoZnJX?=
 =?utf-8?B?NEVVMFAxblVQZ3FEeDdkbndoRDY4RWZGNVpqUXZodjh6R1ZQV0ovRXdQNWF5?=
 =?utf-8?B?Y2JlcHJlOVBpVWlZRFhvTmUwNEV2eFBqVS9ybVltQlJBQ1ZUMVdsZnZNWk9j?=
 =?utf-8?B?dFovRHlJalF6Y1dDVWVhbnMwTTNiVS9RRVRnRWhVYTBsWk05amF6aEZrNUVu?=
 =?utf-8?B?VTdDS0JxNFZyUGJaY01xdlY5eVg3NlAwc0cwNlRiU2Y5S0NIeDhMUE9aSzJH?=
 =?utf-8?B?SG5ndzV1NzhVL3VyVmNXcmo3K2NNNytDQ1hjNVgzeGQ0Q2xkUVdKM1FidzNC?=
 =?utf-8?B?YzBzS1VBL1cvNzlzNldteDVhVmxleGJBc2poV0NBdkZ6eU9GdFFFM05hb2R1?=
 =?utf-8?B?OHlOOU1leklYRTRIQUhHQ3dxQ2JlanZCSWExbkxKRjNFRHZ0UXVqbDN1cW9T?=
 =?utf-8?B?U09WWUd3S05ZVlZYVkFneTk4WHNrTjI2RnRuTnZoWllTR2VUUEQ4V0I4cWR0?=
 =?utf-8?B?VEhhZlp6VWpnSDBzNTdZQVFVR1RYQStzVWJKQVBqN3cwKzNOSXh1TXBFNFp1?=
 =?utf-8?B?dkRmeTl1cERqWkgyZmpJMm5vak5HVWt4WnJudm5ueitmSDgvaU5lb0RiL1ZO?=
 =?utf-8?B?QUcwMEgraU1SUy9ETm92VzBldFNZWEhYVjUyZEFBL2x1TkFkM2tzaFFNdGpL?=
 =?utf-8?B?UmIvRncrMHZ2WGZESGxwV0x0M3hGcHlVQlVoUzN6eUFsK3F4L2I3dHRJN0Nl?=
 =?utf-8?B?TElKampwY2trUzJ5RzJ0dVhnWFRJZ1RSVHdGWlEwbHpKbG15WUIxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b639f43-8099-4977-9af1-08de8d92dc5d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 12:58:23.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZ+aYU6GckCWZ9MP/5oSIJzNUw11RWjd7yEHx6ZwzIpL1Gpryi+Lq8823wq/uiv/7qJ2FB+lPf8Iy0mI4YfP3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9376

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: 3e56e354db6d3 ("arm64: dts: freescale: add initial device tree for TQMa8MQNL with i.MX8MN")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 31a3ca137e63640a2387d3497274f10a6b8c6766..48a687926aa1b88a3d8bef25ff97bebec3777b00 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -283,7 +283,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 	};
 
 	pinctrl_pmic: pmicgrp {
-		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x84>;
+		fsl,pins = <MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x1c4>;
 	};
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {

-- 
2.37.1

