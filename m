Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021118.outbound.protection.outlook.com [52.101.70.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC702EB86F
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759322651; cv=fail; b=L/nkGS1M9w37frIvW5orLCSUaGtKM+bNKgAWns4gLLsACdqPCJ+yo1YvzDFSmAD/fSo2iI+jO7/fG0RieswwDXM015wbu8sd/9O6ybJJrcGdJ5IWjlG79VTc2aFP4LozwVUf49pU7LJOa1nmREcGKAHiy6uxtnZ6EpIx8X6vP2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759322651; c=relaxed/simple;
	bh=t0ufISIYUvHR4esF3LWqnxvkXf9s3SWMc8goaA77qpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SXAf5RNQ10uYY5FN9iBorRlFKFpGlwGbkS2/aOSeNfsPExydiEYFJMmfhjgKkquQCWe1Y4SJZOqv0NlQqJwXByEpsyEKUPjvZBtoufTOgtBUzfn7vUEL875xFjqprh+Udl5WAnvnaTtsGyo46lxcPsmJUEiEgo6IAcEfYQm7PUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Hk9M/7X5; arc=fail smtp.client-ip=52.101.70.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Hk9M/7X5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWnyd0no/mkcaGiA7cG5BN4/IrvmbhWbfFB0v7132i1zAI5XrhFPQFvL8+O5nvadMC/cq+Un3xPSQ3a+DUH5xbQvvfJ256h/IeEDv1M84OTkNIP5eD6K0F7CMX6XlgS7RJ3RVi/anveIkLqykTbvFyYVX1JnVCnsS4O1tzGqJV7njEXGpc5VV33eACvGuclQ9BJGuMsTfzGccOS/9eho6qdqF2FfQu+nrozMImcRN4DKOsSUu5fi9cWe8J7iNq7gic1CIzAuy/x8K/AiMwPEcEYFJ5gMdZ6nvBiIMKo0cIQTQ4CJPDyyoGBfbUMvvrQEGCScFKqecvAPAKIJRr4msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47SpsYyX1bgCNF2P3mEdKn7UEJmhryl12V0WNaidOAA=;
 b=fwqOtGcTWWvFlrzb81K5HNIniXusuLfw8GaMuOvOXTiyaU3SlgSiDtOTZY3OsEam1gxR6AkHHpzdRhjXDUs4Biy/7oUCskJbbq8txOuw9yqOHGaAfYZx2quXvP09B4jH+3ajerVg+3hlD6XpkZypeT4rR2c+Dy8Ayw9+oiE1XYeaow1uzT82U1XdAORmNaGYyde/Zi0vurLCXxPE10DVXmvKZzXWAYsSQbrVsoWIfz9KlICMctQkZ3Ht2fLCeWzxYMUSU5T7w4aQdCNX4tXYHyYMz643dHFw+THD7q0dxGrdCT0PUsBXtQUfu9fxiVZsXsj+52V5X0WcABTgLuH79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47SpsYyX1bgCNF2P3mEdKn7UEJmhryl12V0WNaidOAA=;
 b=Hk9M/7X5Kx2tPR6/7YJHdZmzzvZSRqLJn5JGU6NZnusaqBPrnJFCaXeWpdqFCvX2W/7uoIgonQ61t3iWDTq5REVo7ps1BTVbpLhtdCTULRXPt8hoMR0NKshFtc4eK+4EJIH5yHEClQToglv3d9E+qtpLCfD1NYoWcW1qoiJMB/6QCgcWq0kWJGNLbfW/peX34AEDI0EfnTfvrcauTa1veJuLzo4D47NuUE/aFx6szi0pO6eLdlaEE5E8tM3h8neoc9lgZjS/gnO5AsxHRL2MUDwOiBVlUicHTge+xgRIGRUMJapoJPpLYd1FC9XyPHmPB8K7XgDJuIXFeS+6Wi4Fgw==
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by VI1P195MB2413.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 12:44:02 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::80) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Wed,
 1 Oct 2025 12:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:44:02 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:44:01 +0200
From: Teresa Remmet <t.remmet@phytec.de>
Date: Wed, 1 Oct 2025 14:43:27 +0200
Subject: [PATCH 1/2] arm64: dts: imx8mm-phyboard-polis-rdk: Add USB1 OC pin
 configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251001-wip-t-remmet-phytec-de-upstream-v1-1-845d71bb1e1e@phytec.de>
References: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
In-Reply-To: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yannic Moog <y.moog@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Teresa Remmet <t.remmet@phytec.de>
X-Mailer: b4 0.15-dev
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|VI1P195MB2413:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c08024-7939-4f0c-e9d5-08de00e8335e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzNrUUgvNTd6WDUrdGIvQ1laMmM2WjI1Z01LZ05GazU3bGpTNGtxc1VlU1RL?=
 =?utf-8?B?cTE2VzZ0WUFQSGZkck5Yb3MwcXFncTc4NEdycHIvRnVzbCt1ZnAvR3kySnN5?=
 =?utf-8?B?dVBwMzZPSFVZTjFpZ2dNUVBwMGw1MGRyQmtIN1kyYks5S3A0ZlN2a2ZtdUJH?=
 =?utf-8?B?a3JUYzRDK2pHa3VVRy8xNkNJS1hFbk40WGIwd3pwenNzZ1lnOFNTanIyNXlo?=
 =?utf-8?B?bUFneXJpSVdNcGdqcEZQS1VOYm12d2x0V3YrWW12QytnVUU4Rnc4NURUTDVi?=
 =?utf-8?B?S1B3K0hKNmkzL1IzbW1FSWRQY3gwekNFMVlPRGdJc0dMOWRwYzBWNHpBUW00?=
 =?utf-8?B?bG5HdHk2dXkzMDBsZmxERS9mR214NTU5UitqYmJJbENYa1N5TmV6NVRwbjU2?=
 =?utf-8?B?dGdIOUtBb3hiMjQ1QmVhOUxBTFg3Rng1Z3crL1U4YmhzOEJjdUcreDBoSGxI?=
 =?utf-8?B?U2tScEhzMnByd2VvYmJtNy9hM1FNbEtEV0NoVzdZY3c3N0xGcDdGRytFRHpZ?=
 =?utf-8?B?UTdzb3hkRWJnU3J5aUtCRFJoUjl1MWJ3dkUwU0pJVUZBVmExUHF2WGpNbXkv?=
 =?utf-8?B?TjltaGFMWUpDeVhFY21EVWUvbitqNjJ4S0s0T2JTK3c4MHo0M0k0SVl6Q0xv?=
 =?utf-8?B?M2RQc3MyOGtFWHRuNmo2R0FnQ3M0STNnbUxHYjEzWWtFWGtSVWs4WmpwQjha?=
 =?utf-8?B?aXV3TFZaMUp0WHNTQTFaWVY5MmNsMFZrdVlBcytTcnAycmpmNXdpOEU3MWpn?=
 =?utf-8?B?ZXpTSkRVTXJ0RmxIdnNYdEpLVWp5MzU5VHdUTVdPbE1Ydm4yY2pNRU45c2xF?=
 =?utf-8?B?U0tnNUNEdmQvV3N3SzJpSElZeThYSk5zWEYzYnhSNG5OaWtxaHpRT3BIL24z?=
 =?utf-8?B?bVkzNGNWM2dNN0JmY1NreGdTWkZLYmJVOVNiNU1MWW1NdUozRnhBaDcwRnh2?=
 =?utf-8?B?cFh2ZGlaN08yMVB4YlB4MjRmcTZTRzV1UXZkeXlZTFRiVGV5OGVHdVVubUxW?=
 =?utf-8?B?UEhlTXN2dFBCcWw2TDk4RCt0dW5TTHc4cmJaWERDZGNzK3gvenJHU0F0dFp3?=
 =?utf-8?B?MDBaWndHRVBTZk55aElXZWJkUHE1YzE5RUlBZFBOQThGRldwc2JxUlJPWGFZ?=
 =?utf-8?B?OEJwZjdwa28zWEEyTi85TDNmSm9ub0U0M29UWGNkYlZMelB2Mkhab2FydFY5?=
 =?utf-8?B?Z2toQ3RRQlB3dFhrRkQ2RWVPT1F0MXFHc1ZOSVFYSmJPS1hIZ1pLM1EyMDBs?=
 =?utf-8?B?bmt0TWx4WUtsenYvUm8xdFIwZElwMzJyTFF4TDN1UGthWnJyK1NsQzArMzNm?=
 =?utf-8?B?MXFWNDRwdDFmTW0xV3RXL3FwbUpRYk84Z21pb1BOdXp5Uk5QS0tWK2NjeGNq?=
 =?utf-8?B?T09nYjM4TlI5bHhHNHNUc0JwRkdBQkRCNnlkYit0dDgwVE9ieDZMb1k2Vlo3?=
 =?utf-8?B?Y1VMaTY1NTBVRHlVUHRFM2VBMzBoNU5nYnBCWDJGYkR4V2VMdThROFFEdy96?=
 =?utf-8?B?eDV1a3FNWGpiNXArZmhvQWRYaXVxdjcwT3U4Y2k0SFdnbko5eXc4a0dQU1lT?=
 =?utf-8?B?RGtYSW9rdHpPaCtlanJrNHMyYVlBaTQyZUQyUitLNE5jV2VkbWxTQjdOdEFt?=
 =?utf-8?B?c1FFQ05kRHFLQUJiVEp5QitTdWFia3NsbGZNRE5lQkI2K3RCVlNkc1ZHMHlS?=
 =?utf-8?B?eEk1bTA1Z2NnSkJLdUt0dHZKZVhaNEY2SGNQeCtpUnN6U0V3MVAybS9nK2No?=
 =?utf-8?B?bnFsZVU2Q1g1Rk9WVmRlcjZkVm1aZldwZk9wMGUxL3VMc2VxQmtRcjZjaFdx?=
 =?utf-8?B?a0ZHUFY0OE9CUW5CVUMwbnVTUzByRHNSV0lMbHVyOUVPK0pyTGFqQysrSVlZ?=
 =?utf-8?B?bDFCMU5IWHg3aE53b014d0NiYmpOd2Vtd2dUQWJKWDlYNElVVk5UaDRZVUpJ?=
 =?utf-8?B?aFF1TUpXR0F6UWUzZWV4NFFwVTJaV0ZSN1ZWNHRGaVF5cGZXSS9MUW9sY0I2?=
 =?utf-8?B?VVA5TkUvU0pMWVA5cnFVajZnZ0xPeUtxc3czbkNwOVlPMm9SdnQyYjVNRnpF?=
 =?utf-8?B?Mm5MbmhOY0J2M2RML1pUdG5scGtBZlBXTnpmSzJ2MnVoNmxzMWxUYVpkUUlT?=
 =?utf-8?Q?lca8=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:44:02.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c08024-7939-4f0c-e9d5-08de00e8335e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB2413

Add USB1 OC pin configuration for proper over-current detection.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index be470cfb03d7..35d8c5ab3547 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -285,6 +285,8 @@ &usbotg1 {
 	over-current-active-low;
 	samsung,picophy-pre-emp-curr-control = <3>;
 	samsung,picophy-dc-vol-level-adjust = <7>;
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	pinctrl-names = "default";
 	srp-disable;
 	vbus-supply = <&reg_usb_otg1_vbus>;
 	status = "okay";
@@ -458,6 +460,12 @@ MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x00
 		>;
 	};
 
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_USB1_OTG_OC	0x00
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x182

-- 
2.25.1

