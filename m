Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB2372049
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464879; cv=fail; b=MMtjCeZpgm0UdM7475NHoZZ5thKCvQiYPkz4TXhowlTdQvXmmibaULQ3W9TbnT1GJQPSJALR6iPBXvXb8lOtIPFCdc2xBvLTqiaOgK4XdAmsHCYG2rew4MstplNlK9wmWEYmh8oWb/Q5LH139hLIFxf26UhaDDcYTO7zn3x4am0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464879; c=relaxed/simple;
	bh=hiUo1PAcEQdp2Ygh9ya0G2fmgAhcNJDwnODZWRmNrPA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CdB8qFeRS7dhRy1Vk40O6chRD7unaIG6XTX3hk9WOfk9Hq1ymL6UMS3hCEXn/yngcNWHGYHnOww2fmf9vlxYs/hAAX8BOd2B5hfZ+u8ABPn7aJkukftPvegFIeihvmUxftJCVozvJ3bisPGZeP+gw9FPmtxv+gMInYBBL1rKw4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SXPMLMzk; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SXPMLMzk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmRC/SclFRG5NT56KyF9K8LI1HBVNlpqIv3QYbGFkBHlMve+YMDGA4Zk9g8RqDIsoTV/5p0YsNtMPH6nULcYW1KJZyIcPpsRcaVsac4TXZgU5DAbH39PjSQE2NCm3Zh/OBMk169uit96zjSc64Tn96jU9azNJGtL1kE65dW8mTy1xbBP1fBmg/veeo8SYQJ3pz6c8ICAQWtviesaB128EMnEh5Jjap+znY2Qr+MjPZmFcdB8MD8CMdD7LqUooji6WbZPZ4rzXk55dHMKpjmICJViwPzGQXyH8Riu16WykbnVgawv4TioauhiP8bxZUMzGNUbnLydkYTN1KgZf3GzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Foe8qWvN7pc7a47xF/+zqGqV0l4IgoVNhFJK614TNC4=;
 b=w+Uq2RgjArofrbj3+baR9S5iRHGZBo7TAYHYeBTGJ6wzqfOLcMNcmcXnGe9mVKyWFvOkFp5eVr7mrgm2N3Rg1wTeLLo7X5UxfmQlv7/uVV80EwLKHXLeQ4HCy2kMUITprFqPTezQTfnz/fz3xl4MobjCJj1CwCnWutNMcOJxt8sIszflwT5RNnzBaUHsmE7kwAXJQHbLTI/IUQHCeSGVC1u82odf2l1CpFXQ6iiyUZmWiZoG/Af3LoHWNskitAv6qpdu2ciegMoWlj5stEtAY4lKBGAL0KkkrcMEnL5V/vIokYLKbmmzxQ+ymjAH3NWzshPfx5ywBY4iheGt9/YA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Foe8qWvN7pc7a47xF/+zqGqV0l4IgoVNhFJK614TNC4=;
 b=SXPMLMzkCsXUNc+hGv82kFFHvs2J3f//bwJnuNSo6QsLi4BcRNrUzTmZz473RNXAIFb6QqX5XB6bamdTu09xr3GHnYUiup/2YtqaFQUHTqQpdIyXupaRxEb15m4Nnkk88CCFA9YPIla5Rw6yIYM9zOk8rwglGDDTgQJWy3FFNek2KQaD0D0hx7bpoB68f0jHPwSA4geZTC6RVf/lmQSPQhRsbmgqYLiIi960Uh/7wB9yk40kY9HKn5HeYn+l8lTbC/uauNsAufLWZGldsE8RBwhs13ClN3/ae1RPezSytjzZ3O9/mDADELTvHSgxO8sdVRXK9tsqSlefeioXMkqtnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:30 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:30 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:16 +0800
Subject: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=4731;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=tvzFlWPN40OVjbqcSZibLcu6oyplmN9svCQ1SFVorT0=;
 b=Q45KbP96vb4RfAbubAokAkuQ+BCQ1Z6h6+QxCPYzb1GhSUwULMdBcppaDiF58eNOZPyYDOa0n
 p4HiHU8T3/VCwIPp0+oNnb/1cBtIcmSr1phbQDoG+EC4hG2p/xFdVbN
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0134.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6430277c-a4da-4bc0-ccbd-08dec131c8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BLsJQHLBdRJzY4eqZzIHqVCQ/k9a83Mac3VwaLTX6/lnwoDc7kWvM0qLmIrpe8DX7mg/NRTeQ9NVCz48hjLk5cOveTrov7Ag8OSOEPTIV3yctykNseZxp4QqlUL6athlIN/aFmYZQymOa9mjoJa1vAmuJFbSmHFIAfT+PIOUX4Tcnd7EcwqiTKm9n7pNLsdrqUfd8+MP8rsLm/f3pPA2Ujonrv8C+c2HIZzOgw9BCXzzt7fQvdLlgkUMoKr2S5AtJV0x4cUB4nqCCv0AVgNatRJPp1x1OY6eXiD4MX2vjM9xtPG4KTBFrJkPHBSWweIpTN39fkqm2xpUi4Xd+B0TKwGthlH4QdFPoIemZrdwSD/dfVOX2uVprarVHOPu2AUUreT+vCVTAfex/CSnQePehG8zuuBILtFVzr3oThhTXC+axOMkSOUCO/4C8eUDe74uobzUgpbz73GFQ0Qb2ZjhUpV891Q28PxRU4MchZNTioPcMjhlXe6zXf9tsUK21mEYBFubgK6OVh8Sq+bFVZ5hnsDxlSxKert9hCmy5R5lk+2WIFtpz4ox9Pfjb1q3RCL3ujDORwC9HhCrKKLbe66Xl7Sa5zCW4L0IqFv8El/+Jrz2hEPKptqGW4+JwaQQdSKG23n56Nxzn4FtAuAQ5hzrrTWmlILboMqw8dkm68SB4WHkNInO9RXFylio3yIg6AqG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S002cVNRM3pwRVA0T2VMTVB5ZkVGUzU0d1NEZG9OREVlV1NvdTJ6NkZWM1NS?=
 =?utf-8?B?cUQ5R1lIRjljV05wNDJzV3BLeFJ6aE93WU9sUzRRS0lYQ01HNWZOQ3lwVzB2?=
 =?utf-8?B?MXJIKzh2Zzg2YUpDSnZEc2VIN21pdjBXRnhEVmxWLzFGUEN1WTJhQkdodGV0?=
 =?utf-8?B?Z1BwVFU2SHFRaG9FZjlQTWRoMncvMElza2lBd28yeERudklKK2xnaGVuNmFI?=
 =?utf-8?B?TW1RaEZGZHV3NTBHWm1mRGNBK1hZKzl0SHBSZXBhQm5YS1RrOW16NUthYlE0?=
 =?utf-8?B?a2pMOWswK3l0eW1TNkNFVHUvMVpYY09NejI2b2Q1VmlSblB1dXBYTXN5S28y?=
 =?utf-8?B?cTM5Z1ZRNE83Z1hYek9od3VnL282RlVUTFBQYlc0eEhPNUpkZ3FHK2cxa3hv?=
 =?utf-8?B?bC9YT3ZqeGdpOWFmYUFUdGE3c3YxYVdYRGxxV1k5bEU5S2Z1RVphWVY3aDNt?=
 =?utf-8?B?TmNHbDVvSnp1M0RHOE9zRVVNeW9aM2RQOGkySDcweVRlL05Lb3lsZXhiWEpS?=
 =?utf-8?B?QUI0cEtMSkE3d0R3cFFQZTllUW1yZGtRZ010eC9ULzBPQWZSaEI0OEZIQ0dW?=
 =?utf-8?B?WVF4NWpNYnljQUh0enJNMWlYVkExNDBCbHY3VmVtNWM3YWJGUlNETU4zTE04?=
 =?utf-8?B?bmRYdjkvcFl0ZDRPWWFhT0c1NjViT0pXZmorVjQ2MFhJVzN1WWxHZUNBOFlp?=
 =?utf-8?B?WVFqLzFqd2MreC90NWljbTVENHlHUnh4UE1KdE1vVXE3SW9VOG9mYjZRb09p?=
 =?utf-8?B?cm9HejdWbjZLVGdEdjd4MUtvbVFIcnNlSnV6VjdQZUZjajRFaVdQUEJhMG1s?=
 =?utf-8?B?cEl0dEE0ZHAwZG93b2NHWHNyN0lVT0sra29ZM3BXTERyZG1WT3hkTHA2U05o?=
 =?utf-8?B?SXRneWlEZXRrT2dYek5YMUY2Nkl1bndGbEdIVmwrYUE3TlRyRUsvcGhvU3lk?=
 =?utf-8?B?NzI0THd1VWtGQ00rY1QwS09Ma3lBN1ZEVEUvNmMvbFI1NkFzUU91eSs5NHNv?=
 =?utf-8?B?MnRFUU1hWGsyc3hNd3JEYTRRRjhrQ29ubVl6SElRVXhrWEs3WXR0SmtKSTlz?=
 =?utf-8?B?a1FOd3pUeU9JdUpqWVZSOUI1aFJTOWRIK1pxcFZDcTJHdU9mUnR3VHdEWSt0?=
 =?utf-8?B?dE1YMkhXYXZiZDNPZ3BGemxLcTRLbk9vWXhWOXlkNFU3REJqOTEvenNXNnkv?=
 =?utf-8?B?N1htNGwwUGxyTTZVMWZDZ1ZDYU1KS3ZRQnYwMWRoNUNBTWVtQTRpenU3Y0JM?=
 =?utf-8?B?MVIwRlk3VzFWUVJxeklsY3ZrMkRaTHM1QWxEbjVFSUhYbDQyN3U1QytpS0k4?=
 =?utf-8?B?MVFSaUQ0Q0NWL0Faa0lvMzVoU1Nic1loWjV5MlA4MkwxbVE2ZXpsYk5HSGtG?=
 =?utf-8?B?VjVWV01BVVJwY1NmTkg2SWlueldnTGw3aEhDTjBUbHdPUCtzUWZHa2d5YXdW?=
 =?utf-8?B?d1dJY0RwMnc0WmtsUm9IS1o4dm5sWmtYRVpaY1RhUmNKdWdzdnhxaytZc1pC?=
 =?utf-8?B?SEZEQzBVY3dPeENaUzhYbjNUOHRIRGZvSUFoRDRWWkV4STA2dlFWWE9OWFIx?=
 =?utf-8?B?d3l5bzkxWmRtZEJVK3ArUWV1MGE2aEgxNHhvL1QrZG5OSGk0WlVQTkhocEtY?=
 =?utf-8?B?VTVPdGljK1dTUVJ6cEpLRDlhUFRuM0hSM1JIQzZBNWNqV2FDUWpHY3cxU3hh?=
 =?utf-8?B?SVpCWXRKYkNLeU1BajBGNUVvd21kVTZLTW1qa1lURGRwYk9nelNyR00rZlhv?=
 =?utf-8?B?VWsyQk9Ga0NBUDFwZTRLL3FHWUZPRjlIdE0xWEVWellYNURNRVFIcU5sU0p6?=
 =?utf-8?B?WmRrMmxpWXZld3pxbDRISlNQOEtLK2tOd1VTSzdrVTRRb1NZYTJoNmcyeWZJ?=
 =?utf-8?B?NnVMdUVTazd0RXF3cElwRkFLOXNndSthUTlJS2ZVYndKS1VVcnVIRlhXOXJx?=
 =?utf-8?B?eGJLeWFkNlEyWVA1ckF2T1ErcmhkTUNRQTQvZUVJZjZRYWhXQUwxVVFjMjlT?=
 =?utf-8?B?VHIxWXU4ekYwUFozSVcvb3dQb1hJT09DNUZCei9hVzVkMDRTdm5UWUZTemVT?=
 =?utf-8?B?dThWbk9CcmlJaUJzMThrTzd4WnMrZTZtS2plNjFwcGtoZlJZNzI3VmNsbUxD?=
 =?utf-8?B?UytNbDBuT1BJbzFIZ3RLZlRvOEdzblVHTUplT3Y1YnBUM0R3VTdJOW5CUWpi?=
 =?utf-8?B?djB4bEdOWlk5dXk5MzUxZ2JKczR1K2draHU0aXBtTW1WUmovTkJvcFNyVDhL?=
 =?utf-8?B?K1BMdlJJS21ZYnRHazFSck9qS0ZlMnEwZmZQblVKMVQyZzFXV2l1ZjJ0eWJq?=
 =?utf-8?B?a2VjZ0ZBY1g2S2RCRmpNNk9EZlVHaCtjK1FsSHB0K3hmQmE0Q3RzdTBNa2Vn?=
 =?utf-8?Q?K+9/cozQmDJ2xOVV8pOrm3Ihh7dH6ouLHj9lR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6430277c-a4da-4bc0-ccbd-08dec131c8d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:30.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41O/BlE+pQAzAi4rvozPR/TPfZlGk+N1wxZ6UsGMqFSZeh3uQBCTqLEqf+lk2OglundT4aJMh43bIkWmPdyYh34RZ2IIPlOrqhA/tfzy7PO4SZhi02vlkJrjr0Q8fv36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150

From: Xu Yang <xu.yang_2@nxp.com>

Add runtime PM to ensure the PHY is properly powered and clocked during
register access, preventing potential system hangs.

It guards register access in the following scenarios:
- PHY operations: init() and power_on/off() callbacks are guarded by
  phy core
- Type-C orientation switching when PHY/Controller are suspended which
  needs explicitly care
- Future PHY control port register regmap debugfs access

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 60 ++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 591ddf346061..b0092c34416e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -136,17 +137,13 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
 	struct tca_blk *tca = imx_phy->tca;
-	int ret;
 
 	if (tca->orientation == orientation)
 		return 0;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
+	guard(pm_runtime_active)(&imx_phy->phy->dev);
 
 	tca_blk_orientation_set(tca, orientation);
-	clk_disable_unprepare(imx_phy->clk);
 
 	return 0;
 }
@@ -620,16 +617,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
-
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
 	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
@@ -648,8 +635,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
 	writel(value, imx_phy->base + PHY_CTRL6);
 
-	clk_disable_unprepare(imx_phy->alt_clk);
-	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
 	return 0;
@@ -686,6 +671,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
 	const struct phy_ops *phy_ops;
+	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -693,13 +679,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_phy);
 
-	imx_phy->clk = devm_clk_get(dev, "phy");
+	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
 	if (IS_ERR(imx_phy->clk)) {
 		dev_err(dev, "failed to get imx8mq usb phy clock\n");
 		return PTR_ERR(imx_phy->clk);
 	}
 
-	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
+	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
 	if (IS_ERR(imx_phy->alt_clk))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
 				    "Failed to get alt clk\n");
@@ -708,6 +694,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
@@ -735,11 +725,43 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(imx_phy->alt_clk);
+	clk_disable_unprepare(imx_phy->clk);
+
+	return 0;
+}
+
+static int imx8mq_usb_phy_runtime_resume(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
+				 imx8mq_usb_phy_runtime_resume, NULL);
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
 		.suppress_bind_attrs = true,
 	}
 };

-- 
2.34.1

