Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EC38839B
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330983; cv=fail; b=LbXnSm2rADcnMbHZherBO5kwSqRB/canWmMz4oHi/7So1Nbgk0/abYHQTtffKmBga/3VKhUi+xEbq44mBGidPE/8fnROgZ9cRvRz+DCVi+H3BG86t4UDsKbcOUrlqGRzS+gqVwKjj43rHyE7DkunIPCIarCdogJnJG1zDD7RGbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330983; c=relaxed/simple;
	bh=659anztEkiGWTd+aB2oBcyQS/4TA5vqlx0elXo6KTKw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DZ3iitiFrB/jS8wafPqwtBzF+aRTSmoBMcaN36OGng2aDGliTM67f7DpeQVmOYB3JJPJz8Go7lkPKIVbEy9wSc68Lvcm7MkIpsBWLA4lyZMEEvvQ/dwo0gK8SNxrTllOvfh063hvIAACIkMrEpjUs3HhpDWiat2l1tpwfBvovEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wV97+5g9; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wV97+5g9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+GWQsTfxCqRPZiXjVVKgTTtEGWHVc2Es97Eq7FAfweFGcTwL2ySPetR6E8mV+xaNN7+UmqFyq5lbwKEckvR3jVP8x36pxHg/K5w2By74EbkvpV0Saot94JSFaQ2/5oSmnNxb62iQEFhQvTrYGDz/K0eCRaRB5lsqthht59crhN+dkk5+TZj+yzzh+YDzwP5cH4ebTukVh4baD8yHd+aA7kk5BTeFXdI/qzB9Rq997ZHGU//qh1F0QyQhbPXokUpoJ01bm1ezwHhHBeaiRqr3347q5nIQNrPEd60HhkLibiy2PucGoCI3V82aarYz7HJZ+dNk9jZL7fyqd5rrJRvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zMBmZXnAeoP0yDyuaA/fBIaVn/JGfYF96VaR5RmWes=;
 b=JVKSQrxQ3fJQRX14r9pn9TNVMrlQ5mnBWHgDoF7mlLNHt+n5CFB6U4DMNPdSNTUXyA5v0TldKuQXQ/3hT0DRd7Brg2YrhXZbJiaBDJHHmG9s2Ibp0ia1OfcpeS6KoG7EZaXoNEBLnBR0sztB3EOKQZEvg2WRsRr+i4YWiCEvzk/Z91QoYnWJOPfJ4U05VKiJAa30ZHDnbCpgd4XNcDPnbzbUQxCAX00wxI2jMqVo6qoyevBIXXDe8UB7jj87VFCd0sY/uDo7Mxfy2RN9pIbbudupII5yNFS0KNjlul347OAirog1OCjhwvD6gZvr9+AKqy2ZAJTqM3v3sp1As9wAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zMBmZXnAeoP0yDyuaA/fBIaVn/JGfYF96VaR5RmWes=;
 b=wV97+5g91fXgTRW1hyhhLVM6jP9PDL1prgpvWvxv3p9SbGG6E25EMpBv7q25Ok6bLpyAp18+FhGI+sa48nSmSa0Jfwlhvc8q5oqnRdVJof4Ulrv0fpTcyewiwtqGxUtmLlY3GJ5kzCfXsniAhSCk2MuiLZ7GX/qBASzcjfCxNJn+pzRvxvBYaOVtKNAzDMmkOFMSvrug5HxVErFOlN5h6Iq+rP9Av7U/3W0824/XaEUJqby6MAJ1ACPSKVMCelV6mY+e4MAy8nqD6XFrX9plG4VnjHJ0u6E3UfTajKOAUqEeQ5ptMDt5wpDvLJ64Lt3uRTaUsVVhhqKmo13osTArtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:42:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:11 +0800
Subject: [PATCH v3 5/7] arm64: dts: imx943-evk: Add nxp,ctrl-ids for
 scmi_misc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-5-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: a22c14a6-11cc-45ed-d8f4-08de89682750
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+uC46LXRtZhccdYZe1kEamwj8SI93fgS86aBmECP1CQfemDD8k0UUwo7io8zHLZFRDxRMdjY98618csHFTIIfdS7SpopkmShfMy4JMShiQEMT8EmifGVYpWMsSz7k13fNpb3KKWgX6ZKOVIeE24HKEk4fEwBLaEipYZK97Tcnpr7sDCen98OegJUR2JXUF2wlWBz0+KLSekYZJiSdRCQ3TPjyJOSTzlqysX5FVJ6c+R+EIhGocLWPOxXGf/Qyi2bN72nW2TrSI7K85bM7Sdu1EU3ZLWl4By4sRpczNiYdG0rDl+PQTVpJIXbuKp9WPC5bMlWLcbRx4RQRyVnvP/6GVijb75F5p7vooSVyLx8SjdHoHl4xqT7xeUJHFpXI4jTRKk9qg81H9LjsLMU118zU2wrTKrUP8yLhdo5jhhsXG3UYO8g+r+KjXir1TcotMNvsk9Vl7ZLocOQLVUMUZSBA1coDnQN4Ryb/Vc5MUGF2L103lDzAOP1jrIufhPSrcO9p4CXSs60RTkwA190lcyf3ddAykJqeYSwftu96Rv6CwCFjdeAGhsTzidZAnB9Mu1UiGfJ/ZXUx9BroiIOd3bfuIp4WZ4ja/pnECbIue7P1cPUYCKpbUS6/UyN4u6ayMMOGclPsPkiBgsHSgZsgillSLhEngQQrjfVEtzQWDfAloBavDXERUkD2nIbRMHToFfaApA2j8r+1XMOPwaXfNpleW/wyLNGPL9CH95mIjFjcMgm9c6WhPuOLWFJvAkz4M3sX4mjYii81IKRhj644LxxeqIQlqPnTQfzNXQSYdMpGv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTczdUJXKzBTNGpuUVVETVJVeDg3M3F3MU83WHM4OXNFaVdmYlAzeVlkenQr?=
 =?utf-8?B?TGViK3lVY29tUWp5THY1NjZ6ZTA5cTQ4VkhDODVYZ1dPT3p0UWpkYkovZkQ4?=
 =?utf-8?B?T0wzQ2tXQVh2bzFJWmlwS3Q2SjJFZEcwS0djMmhKU0cwQ0Y2VFlLejB3ZmFI?=
 =?utf-8?B?T3RrTldlcUhKWFlDcnB0dTBMeUEwMFY2MDliUm1mOWtsdU9wbDN4cXZhK28x?=
 =?utf-8?B?UU5vNkQ0R2JsUC96UXBhZjE3cFZMb1J3WFNMQmU3aS8vU1VLNUlJTUtFZSt6?=
 =?utf-8?B?ZmM2ZlI0R2pBK0QyUDAxR2FiVllUcVdleGpoQStNNGZNaEVVOXlUMmpOUUZY?=
 =?utf-8?B?OVA2WWRNZFNnUXFkWktaWXN0TjlIMTJnS3NVZnJyUXVVM0M4c09sak9ZUXBE?=
 =?utf-8?B?THY2ZEJTK2UzN3lNOU1kbHdMa012MHdESlMrdUg5cEFJWjhNUjZqS1Jmb1Y4?=
 =?utf-8?B?NEZCbmNGcktBVjNwSDRTcnFmVDk2Wm1CbmNYbUhJZ3VGOXgrVTFRdTcraXZo?=
 =?utf-8?B?dXpxSGhOWW5RalBHSWZ6eEJCNElMTUlZZkxCWVZBT3diTFV4UE1HNFFLUTQ2?=
 =?utf-8?B?UjdqL2pGREdGaVhqby9idUJnb0NBRzZScFB5Y3lyK0VwQTZDQlZiT05Qb3Fk?=
 =?utf-8?B?V1NrZmkvcm56VXlwTU0raUNTZVZjUkJyNW1aaGN6c1htOGJ2Q1hMc3ZEMlY0?=
 =?utf-8?B?RjNsWUdub2hGMnlSc1UwRGo3Y2k1a1lXZW9uTEE2V3Y2NWNjT3FZa3R5UXg1?=
 =?utf-8?B?YXFGWE9VSS9qSE4zdytoYStWeFBFbkl0NFM4YzdvRlRFd296eFdPbU4xQTJr?=
 =?utf-8?B?SU85VEdjc1p2dXVKS0NWVEF3QUV2anI0TXZwdmhzNzg3QU9hSUZjYVdaaUpF?=
 =?utf-8?B?WllBUlhkTXA5TGJnanVuRUVjL0piYlc2eUl3QlkzQVRZbXVUMVoxbTh4ZWlq?=
 =?utf-8?B?bzRZS01IeWRUQmxhYXdrbFA4ckNuQ0g2dUFTVzlLd3JYbGZERmwyQWQrNXk1?=
 =?utf-8?B?Vjc3amtVNlJFc05MTUdoNjB5RnFrUDljbCthZ3BSNVh1akRkTWRJWWJaWHYw?=
 =?utf-8?B?cFduSlJDNDNLQ2cxd0RTd3J3Z3JBVS9RbnI3YjBEYldpaXpSYXlxazk5Q0No?=
 =?utf-8?B?SkFxVUIvWmxsUnAyemMrRGJPZnBMVS9lSzRPVkc0c3ZtNjk0ODcyeFU4WGJW?=
 =?utf-8?B?eUJkdzFCbzgrUEgyb1JGZlpZeG5uR1FGeUhoNHhMRXZyc1NOMnFuTmJQRWU1?=
 =?utf-8?B?MkM3SGdBaW5rR0Q2bUNLejI0VituRFMwZG11QkM4OENYWFljcU91RkluQzRm?=
 =?utf-8?B?c3E0Kzl0Ynl6RXR0RlRSb3dUS2pWcXp6amZkblpQMkRwTTFEOUlTNFNNMkM4?=
 =?utf-8?B?dVdIYjI5dWFFLzdzRDhSdjhSMTBtdkwvTHh6QjZ5cllPaGxvMVg3cGV0bjQy?=
 =?utf-8?B?VUpxM0VqV2JnNWx5eGR1U1JDNHFRZDl5NXpkcWpuQ0dOUFE5ZDV1MFRPcmNv?=
 =?utf-8?B?WldSMFJVaEw0YjhmVXp6em5MU1Q5ZmplVGk1ZThyTnhuZmpkRVhqZlhGWXFR?=
 =?utf-8?B?eEtBRUxmSnFKMU8rZENWRGdWdXk0bXJJL2NwUE9ScjBFTjIxVEdVQmZVRkZn?=
 =?utf-8?B?MGl3TVh2cnFHNnlFOCtIaE1VekV1UmVPZ2FHaDFtZ2RlSVhwb2pCZWR0UjFv?=
 =?utf-8?B?YlhRcW96NW1jZEVVN3l3VzNTYk8vU3UyVkFieHJnU21FejdPbFZEc051ZUVk?=
 =?utf-8?B?cXZ2SlRRWG40eVphZ1FLM3ltbUUvSU5HK1pZZmFwOUx1akU3UlBtWDlTYi83?=
 =?utf-8?B?S1kvY1NuZUYxWFBrMVJmTklXSWllYVViNWFUN2tycm1sMDlSalowT2VuKytX?=
 =?utf-8?B?VVh5bUZDMmp4UUlLRUFGUi8yK1Mwc2hBL1RvdjJERlJkWldvVGxYUWJTMWhj?=
 =?utf-8?B?MEJEb3pIaFNoOVNEL3JTUUsvZmFXeTVSbnliS2ZOOGVTSDEwclFPdzNET2Nx?=
 =?utf-8?B?WnlMaXowSkRab2lmcjRNUkxqSUZGWDM5SkYxakd4bHF0YVhOeGYyUzhOY0J3?=
 =?utf-8?B?UjdXaGZEM2JTL1NWa1ZmcjcwVjJScmNSdGdhdXFJOGd1OHI5aDQ3Uk9vY0Vu?=
 =?utf-8?B?TjRHQVN6dVdHaWc5Z3BTdTVmM3JFTkhxTFFpRnJLZXNtbGRaaW9xMlFrNzBp?=
 =?utf-8?B?OU5ZWExVRVZlaUF0OVBGaWs2NWlNRmZ6TXllZEJob0hCbFRUVlRmZ1ZXd1Nj?=
 =?utf-8?B?akVrbUpIeHIyZk9iTjJGTnB1K0lnaXRGNC9xd3ptUTVUY2hKZDlHZ2tOa3lE?=
 =?utf-8?B?dVVtYmRLWkR4YkN3NWxDM1hKeEZsdHZMVlhRc0wrQjAxdWt3YjcwUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22c14a6-11cc-45ed-d8f4-08de89682750
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:36.3895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2dCNBHbTkscQBLsMAsp53Yne05kXMGDEg7+EuhpHTGieUaxdUkKC3l2fnbXZSHH8MgCI45rGyAsOsC6DQ+dTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Peng Fan <peng.fan@nxp.com>

Add nxp,ctrl-ids for scmi_misc to support wakeup from the peripherals.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 1d834379f602dea9eb70381f6fe2ef6e3c938a80..ec728efbe15cf0b97deade68445b23528325b082 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -8,6 +8,12 @@
 #include "imx943.dtsi"
 #include <dt-bindings/usb/pd.h>
 
+#define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
+#define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
+#define BRD_SM_CTRL_PCIE1_WAKE		0x8002  /*!< PCAL6416A-5 */
+#define BRD_SM_CTRL_PCIE2_WAKE		0x8003  /*!< PCAL6416A-6 */
+#define BRD_SM_CTRL_BUTTON		0x8004  /*!< PCAL6416A-7 */
+
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
 	model = "NXP i.MX943 EVK board";
@@ -878,6 +884,14 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
+			BRD_SM_CTRL_PCIE1_WAKE		1
+			BRD_SM_CTRL_BT_WAKE		1
+			BRD_SM_CTRL_PCIE2_WAKE		1
+			BRD_SM_CTRL_BUTTON		1>;
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;

-- 
2.37.1

