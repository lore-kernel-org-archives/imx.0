Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F034F247
	for <imx@lists.linux.dev>; Wed, 15 Apr 2026 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224732; cv=fail; b=Kac0q23/AAKXhL/AdpAcX8zKaBgDe0MHynI/EcsdRxgSb39OiAMEHBLAnXbdnnedkya3tVddSg5C8ih7RhnA2NFdHx+N+qgVsbI5iGk227HUxU27LiA6HqH9IuQAbSviqVvcClQLMdVwfj+mUPuWBJJW/A6Dk30ovud84OVW6II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224732; c=relaxed/simple;
	bh=SzU6raMOa0mSv73RqOMRVYyGZk3FoNzxJmFGlUqdg8E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dd0v7f41rk4LCC7ceAcZDmErB8Ibp5fdaEsUGcF1yjRBuY9wqvyu5MQiiuav1IRsHCvG013/j9qB0OGuFI65/zs5jIVZpvBiU0V2+P2eFDHHp49rSfXdLuksd063lQ9CVC1nZheBuRDHCfnVPnDTJFPivWPNZjTIEE2HsvqhNvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=khDidVJX; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="khDidVJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuVc2ixSTiCYKaz/+pO34hOHMfkr2lWits0326mj88VVmNDSfLQo5C98yKjB5azA+NxsuRoCuHkJwDCaMMlFWz/8NG29FMb0ekbmqmBk8Oiu3F+wuOtMkNB568lcUZZjwT1/CE3p1Rd+hZWfMKESG5kXpOrVqKDcEeSglViydoKRJuqCs0CckKitn1ApENuY356ZUZdvRxfQB4DpUjD1f5KgEJlwjHjlaWQnb0GY5xBdm/uvEgs42E6RXGZjeD/cmg4EPPptFm3dXeAJed9KIMa5o5++9kuvRfD5VdhDgZNJQQB0iss7A9m4UnOvtlvKDTyxJqJwCnYEu77aVrHCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lG/qLPv3am3Fh8QjgwrpLXDTuzCICbq1mCJfU8hICvU=;
 b=L5WGDcWRLAXmqwzLh8TOEAMMMVBXKey90inRfpKjC+CwhKa9xgZbKmWgmv4e0Wwaz/AuCjuTrYYOxh8A1/lqcq/fx4LMFn5we9lDZqW2ixRiESREgonz6dggJ6C2DCsj4mWNFQ7HIjd//9BRjHxbYM+QBwAml3y3uXFVUBd43NttxCnfS4oegIOxwnDorYK3OQ2dyJRPbBtMPypjcCEz57X8Vn+Z2sTssbzr3HucrcU7jf0H0J4WIbcYgXM4fwNlXyaFaQcV259KI9OupJp0KfWylZVmhxzzU299FSJ6qqPHXC6tcPPryYSAtBS9q+XKrvlyzOSCYrjNhp+8+7QTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG/qLPv3am3Fh8QjgwrpLXDTuzCICbq1mCJfU8hICvU=;
 b=khDidVJX9D9sBRs4XEp/K68QxNhmD4OK2F/fnlX3hB3N7zk6WJliKbanOfXo4BQrtefkYHAYY+0nHwHwUM2Ei/mvbLdxdAP1mII4Q2L9dxMb1LlUbc4c/Hwh3QwmvHC6bggPGaQWKD0yRiC/hSLJyJgt3DoHtSrkkvwbkedc8KvCJBy9yknMGoyDnuI3IXanNpaGXEKOyIzxOSBtkXHaERtyT21pGt2hPrMZFBUKbk58S+mQR+TFwxnbxeXoEhBK6LuCg7KCYd+1H4lRNAGLwKlqSv2lxtqYhNciFC1W3dOEukBUJxNNd5OdzxDYrhKLy6+7nin9M5swFhvEK1Ydzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:45:04 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:45:04 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:56 +0800
Subject: [PATCH 5/5] media: synopsys: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-5-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=2243;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=SzU6raMOa0mSv73RqOMRVYyGZk3FoNzxJmFGlUqdg8E=;
 b=E0wp+fYoxJdSP7P5yBZ6Rn8YkQJtEeM/7Fnct8WQlK3yu7vjm6JMbF6ivgJpwK1dHYZP0Jdjv
 YfCqWoI4teGDBRefOH5TxJ+jDqBt21oi4fF79ORCdPtGItUbBvkdCFV
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: cd668df2-2332-4c11-dedb-08de9aa16127
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 0bW6UW880VfZTVmnQw+nT2txEOfzdjixfCqBqgwLc2IXszPGAd56Vx0GBR03VT5cq9aCNnnwh1UBaKFPCaOvnWkZU4V1yJHpcniS+gUsYq3fmpOSAq0ZLwwQ77yfvIVs9aCZkn/hV44DlLpD0l9Xidvh4Vk22dPgItWnKrkEDwsqN4fK3fXd9HbJLT8ePSWTpUnQJoNIfvM2RC9tbhuxSYncxulLBBNSzwV72cKjYUNwlZUIDPXy92j9AiWzw2u6huto4pRqG7tmJUDhnZcHer32XKu4h8xlh/ReYawYL8OIFZ5QrVnliieZm2JduJ7z2cmjw8MJE2zY/Gs5JV136nXW+YjZDjWBSefeKLf3rZZGozpc/np1EIoEINIh43Adg921xu60ZO1tvy7AjrMe/Zh6fX851LATIs9J6XHRo/SXe/8pOh39iNqwg1XX1RCkaCNM30DiiyLwvazaSKQII+dW/5c7aOXPQU5QbJLiroS15asX4YRedo4wZHcUrDR5CBkMomHW487DAJsxKWlgH8d29R6DyNkbnhpIRxK7TE3nx3nCxFBeL8UdNmWqGcf59oaDnmZNO05sjqikSggF/KAUmOEfWXuqSeOrraZm3ZNIf5Tk0lC7Jgic8mzphyqXYZfKfbLLdzisZx/W+KUpLi4VJ2cUlf5stYrhpsslrbtItRklXgL55okmAd80s8Lbhob8Z58do4MNPKfNDk0dFFPS/H7kynwI9KdPkc6cAH8LG0R36RT6QJzGrgM2YSR8M2cRZ5z6bBJdy5RHlezZRaetTLNEbMZaEo0uMmcue+I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?K29oR2JNSk1kWlFFT3hUVFBzZXdwYThsZHU5a0svN0hqR2Qza2syRWJzUU9z?=
 =?utf-8?B?Zks0djZtdjFqQndLN1VMbDVqUTlzQ1l2enNoNzYxMndQekpHMVNmWVpSU2NO?=
 =?utf-8?B?R09uY010dEVGWXNLa3d0Uk9aNENRWS8wcXJEWVZjWU9oQm41MjhHWjdXYmZQ?=
 =?utf-8?B?VHNZc2l6NkY3dGgva3dERHRKL3UrRlFqdUFHMXJtdEl2UGtKM2ZHS2xWdGp4?=
 =?utf-8?B?NFJnN0ZJSDJ6VHc1MEtMUGJvbWd5MFVqWXB5VjFTdm4zV2h5aktpVWZ5WitP?=
 =?utf-8?B?REJNUlgzVDkyN0d5YTRtRGdJR3VwU091TTM3SndWbHdsemVhZ2hqWWtreFJ1?=
 =?utf-8?B?bGcwTEE0OURuaWIxa3R6M3VlanB3VlB2Wi9jeStNOUpJQzdlVk9tVmlyT3Nx?=
 =?utf-8?B?bkRzMG5INXJ3NW5mV1FUN1o5YjlVZ0pnbDRBMWEyTnU0eHA1QXFGZE14bzIx?=
 =?utf-8?B?S3BjQWUvQXB0dkYrQzFhVW1DU0dtditoWWNTNXdXK0lWZmMrUjhzVTEwaWFw?=
 =?utf-8?B?WTNxL0NGVWdWU1JmTzdZN290VXhWVXVBQkFFNXFqU21tZFRycVlVT3pmR01P?=
 =?utf-8?B?bVVXeCtvVE5rdjdBd1BLeWxKZmRWNlZFbkpuQkFTck5US1FJcVFETGYwTXVn?=
 =?utf-8?B?Mk5DYmZvR1JqMzEvOVFTREZ2NVo0RDBjeG1YckJzUlFqMTIrSkpYTWJsUkJD?=
 =?utf-8?B?a1puVk1obE1oMVZnVUZlNFpUa0ZrTy9va3JIWEdNMmRYejJubG1GM2s3Z2l0?=
 =?utf-8?B?U29YaWRjSFlxNWRKeDBIZk1ySlZ5aEY0d1VFbkUwaHdnT1RlN1Rla2xiWWlX?=
 =?utf-8?B?MmdwdGNyR1ljNVBxOWRhTXhoNUUzblZ0ZnRQVE5tMnpFNmJPU0hvN2lkWVdI?=
 =?utf-8?B?ck1OSTBaSTZDWVgyYS9iczN5dXNaT2tiZ202dHhIQ3ZPTHBaZ08xZjdTaTlX?=
 =?utf-8?B?Z3pMazNXU1pFY3hVL0JhZTZjUmYzcjd6bDZnY1N4UjlTZXRaUm5FY1JPZHhp?=
 =?utf-8?B?a3preldHL3FZWUFLQlJ4cUpBVW4vY2hUNUxKaU1uMUZBcTlhOGtwdlBaQ1VF?=
 =?utf-8?B?b2ljSHN6UTRFQ3hqR0NuOVZXc01sbXh0ck94TWZERkppakRXbGJqQ3RhWEs0?=
 =?utf-8?B?MUFxWURCTnREd1JMNlhESTQvQnRLM3JIK1dtVU4wS2xwYUs0ZmNpb3E5NHB1?=
 =?utf-8?B?UTlYZWVrUEo5WUJQM3BWNENheDJ4Mi9KZnlIM0lNclBWOW9sa2pONkRRTUlL?=
 =?utf-8?B?RUFkZ1RQaWZ3Z0QvSHovWmJIdC9JOHpoUkNabS9ZcHZOSnBlcHlPWDN5OXhX?=
 =?utf-8?B?ckNGM1dsU2t5UlkraGRvUHEzQXVIb0s0YXNCanR1ais1N0tJWmw1d2JiUEJZ?=
 =?utf-8?B?MVRXZU1MVCs0bEVhdTJ2Nmpxd2lXTzk3OUliRnBSMzBySURYeWhueTUvTEY5?=
 =?utf-8?B?VTVIT3NOU0luS0x2bk9yKzkyVXUwSHdkc3RkT0ZUUWNmMFIvcEVMeVBFMHBS?=
 =?utf-8?B?cklvSUNTdlE1ckl5cFo5OHpBSWhyUUhWdUJhY0lSdVR0azk2RDZzZXNld3hK?=
 =?utf-8?B?a0VXejdRa2ozSUhmbHRxZ09qa01WazdDa25JL0M5dTNvRkZXdFUzZndoOGpR?=
 =?utf-8?B?Qi9FTkNCRmt0MmdQUkQzdkxZZnhrcEtrN0t2QUVuWlhnOVdCbmR0YmpyTXpV?=
 =?utf-8?B?bTNjK0tsdVM2ZkZWcVkxVyt4bHNJUUdtMEZUWlpyZ1UxdFFST3RWMms3VEVR?=
 =?utf-8?B?OXR5L2pPZDc2WCszd0JDV0o4YXJveTlpTUhWSVgvN1lZbVpCVStPbC9zcWd6?=
 =?utf-8?B?ZTFhSWtZUmlyN2trSVBYdEk0QmtXSjJ6MmFNaHcvTTI5S2N3bXV3ZHZOQmhB?=
 =?utf-8?B?bUdqQlpZU0lxeDNQY2JqQ0YwOEtqZ1M3bVRQcFZPa3g3aXlFNGpOSUIrNGlQ?=
 =?utf-8?B?NVBndXZCQUpUdEpZZFAzZ2Nyc3NGWlBlcFNkaTR6Qy9vME9lUm1zb3BkWVdt?=
 =?utf-8?B?NWNnZ1FqMTYzbC9KeHVvZUNuenBvSUxZOHN6TWhremxhcTltZnRUMGxFNnZI?=
 =?utf-8?B?dlhpYjBKTGFucnRJcUFnNFArNlBsMHorYVJ5S1RDNXlpSEVTWjZtT1FSRno4?=
 =?utf-8?B?Z0FEQ1hXbW5SKzgzbXJpOU1VbEJFZWxzWkllMXhxUmxBenZLY0RINHNmU1Ur?=
 =?utf-8?B?M1BMSGc2KzB0dXU1dE5WYVV3OGpHY2JvQk5vbGNHYndFN3VzWFU0ZkhMSTcz?=
 =?utf-8?B?TDNsTExGZHowMlNUS2J0WGtDNitHcVRBMjRNcXJya2YwaU5DSWNUNGhLblFa?=
 =?utf-8?B?NzEySVlwbW8vNUw2VStqcnJOdDYvaG9NZ1JFUVFkeDJUQi9wd3VWZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd668df2-2332-4c11-dedb-08de9aa16127
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:45:04.5036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vvuvbu2n8J4WiAJKGLxd558TNoe3/NIRhII34JvO7JtiDcWPU1HVJney1b+4vOepY3MEroT9BLIC9vZEyBSOEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785

Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
nearly identical to i.MX93, with the main difference being the use of
IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
However, the IDI interface is transparent to software, requiring only
a different register map definition while sharing the same PHY control
functions with i.MX93.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 27e4c1027816..bbb41baf789e 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
 };
 
+static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -901,11 +912,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
+static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
+	.regs = imx95_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "fsl,imx93-mipi-csi2",
 		.data = &imx93_drvdata,
 	},
+	{
+		.compatible = "fsl,imx95-mipi-csi2",
+		.data = &imx95_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.34.1

