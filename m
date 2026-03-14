Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36BC283FC3
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492695; cv=fail; b=iTkZVb9p1MoQlwa2AVM/cTFsp0HGbScwBb+X17wJQF7z5n+wUY5UzO/qDUhNCmqXjX5jVZkhrqmnAfABX92W8kTjK2MGjBGbQgE+feEmv6BQ/Kf/uv4B8cmIRwUHr16TIMDyyPtutpJqZWS5sD0Uf9rpazYNbWr8tRFXdmw+Qec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492695; c=relaxed/simple;
	bh=anGYh/i0Dm1nmnI5Hh95vRZHc/hbJXlf4YAT4haS+mQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ojy8ffOxMc84V2/y+KnLoN+EB+dw34fRLCruTkGqMFoay9KZmJvDhrdv5/Thudftq30hHkHHly0rgcWbRehqfKAhFnc9QsfPeE0SCDhp1SrtCLvZYt8bBADylGVH83ydq2vTIjTkA0qP0UIjizr5JiMeAllG07V2kET9Jd8ibFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IFY7BgoY; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IFY7BgoY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmjPkFFFDIwHc9QvVQuFOU9HOPSg+HH/I2z4hVFchnYAaAPf5jfrbkdCsR/+xoQXBVuFdkbm9jQ2pvT9jwdLmK2d8Vc2YH0xePbg26OhXNo9m0W6JY0YdJkjyvcCq7ZrM+t9f2P1agoJf5l8lXJCWa/6vI/0h678tXgyGETqAxVW+uzEg9W9bGjKyTVkiIvu3p+Sg65utXkxH3nyMroVhZry9y90+dX0tcWOn2PF/XFclfEhjfdpwU28yY6iJyPiXCjZ59vUxlHspFOe9sCqCXtNR2fFSohNRJxVB4J09eZRs43mgPDIczOdkGlU5fHg2mLb3HFhG21o5ppWkgoQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IQ1QUIrQGGzu/p6JzDK+XtEaMP9rAd61cYLWRQmZqY=;
 b=jvSnTMvJrFzY/BtDdGD6kufk9Oy2L8j4pHXGD7dTs3JZmV8WC0ozCCfHft1AhCROjv0vtItNsEb5uwzpiVhcmCyB/rHYQQ1AuZVu5EnAsts5KK4YH7imAJwE+tOttu2l8RUoaF93CgMgm2ZQ3zeeloD68/LAQLI/Ie4HrBGZrgr6FGtA0G57XuN8Rf32eVoDIO9L90dh3/AcxBUZu4GHGiQR5VP+q/Pmjmrez0kAywytoiF6XBuHUYfUcbL0WEOXoS5QNJ8a124XhKrakFmEavS8uDICi2FMfCK56K/vYQVz4GCaWBfR9L9VzGJGbWkn5HNyUfhBJzKz60pLfnOhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IQ1QUIrQGGzu/p6JzDK+XtEaMP9rAd61cYLWRQmZqY=;
 b=IFY7BgoYpxsLqowc5A5icd8h+ANYKPLBfu8Aqh4nIfUn4E8eq8r8+MmR9l4zszXIItsfagBaSsiyO4I+QH+yvpslumZJ0lxd+vwfXxMh8PhGl7zoeU9vS5dO78Or7VbbawaofxzFY4OsX5FHj6OXhQGuhrb0Nx2OBMocxltlZGacFpGAptBEVLmtvBEARBrj2nfDpQ0M7aPqAgy1IXa+TpDVxPwXJo3WZWO9drXHhDGu0jlvQrqA2dTw5AN/4cE15LXyekbIlxjp6NHio3CS/Z0R1Q41HsiTmaXIlinb77aySjlLwCvME7i4DOJ6dG0trYMQyYtHtLiNLDNL1WuFEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:51:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:42 +0800
Subject: [PATCH 5/7] arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-5-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 985e730f-7c80-4880-84b5-08de81c86713
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	cz9r09t6OSAvDyxezvyXwzKy/suqjIk5A2LPtqym3I1PZARboMDyfwY0IgYwQHJFDVlmfSm42nl1ybT31CR7EMYLxUJ0Bqh71qYVmrmut9YCcc37pKEgWyQIt+6xEbC0opxpk0+uYrNJsUpJXgfqLwUD0zb3ccOP7j3JbkJG8iy+GHfPiuEDgT9ie94F3D8BXm9vozkbNit+O9fXUWjBNOueV2JZawZ4wIgBx1JDVrLXl/0QgPpDjn/1mqdtaxpm3R7OAceifCOn+0+CWg2s4WAXSRMGIY+F78qKdJbbHBkdcs7LIJfqeV8zQczSSxnNHpT6s0ImFGYrdg+xzqYkE4R71zHSllk7jeN+aZQlVWe+vxRo2q0QJDPekAY7QakSd/EJHXH+Y+gI935Gl7Ts884ffBOBaTFF45V/xBae6pg4gb0wNZvA5Tc3/j/g/jntabcYX0tUWj5svrbVvVNYMHRMZDRGmhJIAO56Vo22L314h3b8/Jj6VubUHkTVQvA5Rc4DpZpq+2INYNjB9K3dkDPbh++nIaR2GQ7Ns1Yd6NiiDjtBaTyQsLJ2r/xWTdyoaEBMLtk0KUUT1poSdbn7hAElR29xZ8ji4ebsQAj/lbhqkp6+o4ClCp7efoVEU6fPGMDBvHB2ERkRmIXOVCE+SNkHxRe/eZfEqylFAV3XxP+lXxRGBoyMiFK/hxlKIifpMwrjB3+VClnPvr4vfflSbBPT5giHSCajFxhAKUoVdfJ7yD960hVkNQgaVqWEAnwYRe7YxTycnTQMP8g/jrPUEQbevjiK3SHMezrzHzkYpNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFNdTRoWE1NSFJBNG1NcmgzWmtnc1V0UktHcjFDQzJFNzFDeVMzbDFwMTdq?=
 =?utf-8?B?a0JTSGVwV2tWb3Y1WTVLUkpLeC82MGVkdzVOUUJVWjkwTVJkN2tPTU5BUnBT?=
 =?utf-8?B?TldsK1l4b0xSa0dSM0pOZzE3QWt5dnA3Rjc3WW5ieXN2MUZWVG50bmk0SWdm?=
 =?utf-8?B?Q29zcTBzMERLc3ozR055ZjlaUEpMSW5TaTZtUDFUYzgzWHg5bkhlc3ROZU5S?=
 =?utf-8?B?ajZhT2I5Z0Y0N0xuaVE2ck56SHRVbEFIL0U1cFdqWG1FRkNYREdCNEZnQ0dS?=
 =?utf-8?B?Y0JrQmphTGpBRGFYQzRhQkY0SWxVYW5FWWhtVXc4YWZkZVRBN0JvU0NiWnJH?=
 =?utf-8?B?ZTNWWXpaVnJNNnFBSmtmREszamRZSCszMFdZcXhjYmlMa3BGUFl0SnBsczdy?=
 =?utf-8?B?WE04L0Ezd0ZucUt4VlRkcXc5NHMyamZCMjZZeitqeFROdWtBYzNIWEpnVllK?=
 =?utf-8?B?Z3R6OThNL3pzKy9oVERoTDVXV1QvSUtkS2NxQjJrN1BYY21meFk3VEpzeEor?=
 =?utf-8?B?a1pYaDdUdHY1QWdVeW43RFhGUXJnV1BtY3AzL2Qwc3NIVTNIeUFjeWVCK0sx?=
 =?utf-8?B?L3lPUXI4SldCNy9zQXhyekNBUWNvakpnQTVpUUNNWmpmc2tkN3g3WjJWY2xv?=
 =?utf-8?B?RGJ6NDRTdFhyLzRZZ21wS1g3aytncmVhcmhHcjcwQXFtaEpFOXVEN0lpVlkr?=
 =?utf-8?B?LzRGa01uc3M4aXcrc0N2UU4rWCszMzhsMjFheDhNcDRaZmVZN2JBMko4K1Ft?=
 =?utf-8?B?MnlWUm96d2JxL0tXVjgyOTVIMHZ4MjlzVEdHejNSbmRWNHZNYWFBOHBUR0RQ?=
 =?utf-8?B?QjlFTjlwMFBzNHVoWHlkclltVGJsL3ZyUW9jVzRRTGRRbXh2c3VYMzNmOUtz?=
 =?utf-8?B?dkdneDZJemI4UXkxMm5lcW9EQWpmS09ock1UeU96cHVDVmk4ZDlybm9UY2FS?=
 =?utf-8?B?QWJnNjRWdDYrN2FYRXBaRTdOYWFaVk9ETEpvNkdXZ0haWHArVUQwcFg4ajFC?=
 =?utf-8?B?TVJ0NXBzVXZPdEpIcVRZUkR5dllxZTNTeVlJVDByaW5IMnJWVm9ueWJwcWFQ?=
 =?utf-8?B?V3FSQ1M5cUJNKzVXVTlrbEZiNFFMQy82TytCQm9EcVFTNmNDL2xlS2JCYm14?=
 =?utf-8?B?TWF1b0N1MmVVcHlzcVJ1OEROVGJzZFlzQmtPMnZGYUdKNS9heU02NElxMUw5?=
 =?utf-8?B?TkhjL1dJREhMM2xBeHlZUlhTV1FlbGppa0E4ajVuUUZ4blRNVGppVytxSDJJ?=
 =?utf-8?B?OHZpOXpjVzlnbXR3WEdOOWRCbUhiNnQxTVpWRVVUeUFJUmpiUXRqNGVyU2Q5?=
 =?utf-8?B?Qmg4cndvQ2xWNVdBRzNmS05zU3k4V0ZUT0xjem1Ha2c1TEIxZGNkY2lpTDVL?=
 =?utf-8?B?cVc4ekRVclVCYk5Sbk1yWlRtQ0JwSXhDZUJuV1ZLVWtTV1BycjczWFF0NTZ5?=
 =?utf-8?B?WXlFam5SUVlUTkY5bGV6N21xbHN5aUE1KzFwZTNaY00rSW5nLzI1Vk45WVJM?=
 =?utf-8?B?MWNLbllna1pickFjU0FoTkFnOW9hN0dVbEZtVmpyYitIZTRUMVJzRURTOXJs?=
 =?utf-8?B?dG9UQWNVRnpUTFg2OC9UODZ4VDNMYmZ1OEwxMEJ4ZnZxUmErekVXWTg4QXVp?=
 =?utf-8?B?UWxaVVhRYjl4Q2I4bzZhZHR4bUFXMkk2U29WZVhpd3lZM3c0L0FKMllZSDFP?=
 =?utf-8?B?OUN6L0kxbURDdWlNbk9nL1ZnelJpRTM3QTlzNXJmM3U2cnd4Zm5OUE9USk9o?=
 =?utf-8?B?QmlTRTNlVk1GbG9NUklvYnhRQk5OLzhLN3pjTzE5aEoxL0h3TmtsMGp6OVV6?=
 =?utf-8?B?dzB0bDFEY25xdlFNTkFuZCsrMHVMUldQcDRCN2JWM1o4V0pPeE9oRkRRTCs5?=
 =?utf-8?B?V3BXU0tYVXBaellGbHp5bDhMaDB5UG5LSmQzT3ZFR05pdEpXc1c3RjgraEJR?=
 =?utf-8?B?U29LMFlJYXErS0EwUTZJeWZoUlB2OWhuYWVOVmV5dGFlY3ZVTEtzdEV2QzhI?=
 =?utf-8?B?bHNEVFBxNndaaDhtd0ZwVTRoNnlYUHNCQldiOXhiaU9uTU1Pa2NuT3ZZWVk4?=
 =?utf-8?B?TXdHd281eUVmcVc2TXFkOFlVS24wRUFXUWVrekhaRDN2TUc0ZXl5U1RqeWhM?=
 =?utf-8?B?alU4WSswaEZTUEtPMDh1aWJLc3dzNzVad0tEZ0ZTYzVDQXhpT2dOcE14WFpI?=
 =?utf-8?B?ODhWS1RTY3NCMFo3R2h6dnpXdDlsbWhsNVVsWDNIN3cxa3NJdTA0TUdIeUFl?=
 =?utf-8?B?L3J5THhHNVVmelJGbWRlNjVRcXVELzZLbFdrRjlra1B4dDFmdVVPaWFlMjNu?=
 =?utf-8?B?clhqMzZlYkRsTlUzVmViMWQrQTZTV3lTcVR3NFlEYnU2bnluN1Eydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985e730f-7c80-4880-84b5-08de81c86713
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:25.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7Hru2viRza8Ma0FUYPvcHwAGqK5BvJS1Hy310y5Yjalo3fISE98sSChDs45AfHZVmn8/jnzb+VuPHXKpQSkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Peng Fan <peng.fan@nxp.com>

Add nxp,ctrl-ids for scmi_misc to support wakeup from the peripherals.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d92399cd9eaf91b8ce373cd6a5f3aace..36b76b3e27eedf76b80b1c19e2a152d42bdbe1d7 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 #include "imx943.dtsi"
+#define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
+#define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
+#define BRD_SM_CTRL_PCIE1_WAKE		0x8002  /*!< PCAL6416A-5 */
+#define BRD_SM_CTRL_PCIE2_WAKE		0x8003  /*!< PCAL6416A-6 */
+#define BRD_SM_CTRL_BUTTON		0x8004  /*!< PCAL6416A-7 */
 
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
@@ -821,6 +826,14 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
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
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;

-- 
2.37.1

