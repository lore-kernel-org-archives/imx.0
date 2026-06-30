Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903D3EBF0C
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814125; cv=fail; b=GT1UtWMprQ/j1OVr/qxTqL2o3IkDc+gXyyUPOcMaHaQ89kHD9V6LlNp8XREDUJmIJdnVM/HvNHs0ZvH8b7k0rWXRFYxn5b8i/J/B4hzgrzPYgyrtUUgDvelERFDph6elpvS5IX/EPVIRI3Knukc27QCjIjw/uUbBboEonxZA7+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814125; c=relaxed/simple;
	bh=/rzXKoGPL2pMvZuXKunfJ68e0rS8jcHPUQg6JeBua3k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BA5ZN3C0lX+G7FDv9HLgcza1P4ynI1EvLcfFGGSFZ5nUUhgdXl6t/gDcq/L5tQfbaYAzgoDmE6RX8fHN5HXKy8rzV7p07SKMWlhCGRmP9hrEZOcYbdrZPzZrRwPP+pNOWX0uiSgKgoZ05RuscEZiyHbafrKEbSNFg2LVDKrMAqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tymqCfPN; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tymqCfPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvLb3T4MN8NMZhVHNIc7VeVDXQQ6EhHVjytEsnJCro/ARN4UKF3BxycxkD/a2RowoP18I2CVA65RTgzVAmq2BeoybVs7wZsXHqEsMPXxA/dWnm88S/iVz2S/tRcnfGvaTmcorOBQiJLTGrDtRy//XFRg3zgqnQj8tLr9pSBjPQ2IeVGtKlVPYBAfHTDsh2onGS60qhjkXnXMIslxpVg/EJuQD1cQW1vMjz3l0mxtKMsf2lz20p7Q2hN8ehTZUlGtG2V/fVQl2hAcylkAP2mkM2Dw+ybFCCtc9NHVbOczDclJHpi7VwBvcwWyFl94ghUGGDOf12LV5l9Ndcv9tBfi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CqZnL9CQ4jPYPhgOFbpXYmhcadN12tUT6BLqWKdyDE=;
 b=OKQ29V9n7K5qXiVskHl057UVRRoxuZHr2MopDfIb/TV2poQ3JeX8C6QcwQmiQvKCW6GVPoorYu2txUSlSqlBItBqTevTdM62ByZEmJS6UrRW5ecJaQ597aV0nJ0fkx8ODt/ECeIsd+TYVzvNHTqVE4qF0NNVmyDu6XDJkO4F31vSTUWegzC/KgGneUCt+Dcw+V04Kg4c20JFhk9BCXjNpq/Y9BWSJzk2KMZrdclSRvRds7NRqAuNKn64av44j5mpFKbUMonE1sGXnlffBM+QcA5QBbb/hFTGFiYBmDRued640phe5DLTOEsG46efdsofH5R3E/u/+cQ9DlCpjdzwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CqZnL9CQ4jPYPhgOFbpXYmhcadN12tUT6BLqWKdyDE=;
 b=tymqCfPNwLX0QGu7u17P8aBz2TuuZAw/CQIBFV9oK5fJaVWUJHfZtWWCnuYnIGb6Wa24UOhT0VAQ9iDlakCNs3rd9UMwSfmlOqnBIOvOtJje0TEg9rW2/ZguTDhOGrkBL5lpqFwtrQ6iZsMuFoi4AmasxtAW9CRvZlg0Fdh06iTTTUiQ/CPx+rBWlTG1BjB9dZqnJEE0gpLm106R9EvzdwJWFejYQoRN4X3Dfrc65JcMnY/63iFffnNTWKhhnMQ4DidQ8eJQ26OZCRqgC2/afmtHEClrZxyQuiLDAeUWjxmrmPsepCSHVHf8efa3eqEo0tnyPn4mk47K5JuKnHHJqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10991.eurprd04.prod.outlook.com (2603:10a6:150:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:08:38 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:08:38 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Tue, 30 Jun 2026 18:11:30 +0800
Subject: [PATCH v5 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782814305; l=4800;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=izaxospJoiT/+YAo1N7NZOcOjtRsSv2ClLgWKBV8UgE=;
 b=dUZmOcl8pBKdcoKjB08147sTARvVfRV7e4NeT159KWw34uvsyxp1v/VzpAl61KYDJdRr94mEd
 6tpGResGQf+Azo+ivxByppDtdMS+h1klIRlPr09VzlVF2+LnomejZUi
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0285.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::8) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10991:EE_
X-MS-Office365-Filtering-Correlation-Id: a0811f75-28ac-4800-5d51-08ded68f8d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	4jKM/JgqaJ2dYXtJzzFBJbVqU/iLUC9Of+4bIIfZjVTAjSBzn/m4/GfMQu7dXBbuiTfx+IG9KrwoqosR+2uYmtqI/jmRVeRzY98tEr5khgJO13nCgxSafs9w7BURUZYEV0xohaOcJKCh3u61HwYyocaOI0mVp59vF3xWTE6ZRtlqDa6dHuzXRyChUz0E0bUj85udQc0oMlEmVRs6jWteqXCG8weIpy/h5Hx34pJwT3o0+IuPw3z46RiCafkoz3L8gwakRw9DrBv8cBytz8grfctddI1F8z0CIvGble31sfzzFTfEQtGKYS8Bo6GEUQMNmRycxUTuQ1hb558oLAgame/WfNJssA71OwuXBQt46NvL3DZ/uEW4Ot2GVP/CNsQTriYe28VPgo5AQAcMo4u/IXjYngAEr5qcY0U7NJVQqj3EMLdm6KxTZNRy7A7hOT/Kenyl+RvPVxWai4Hx94ekmESnnWQUVCjSbKDHk0lw7v955DkL/J8fE9VssmYQiV058j/hx85zovu0F1SP9RPQ1B8ONuCb7S+YdznSe1lYXsqs889Nc+wy7vgtHc60bDrVGkuzp+b2Fk8C4fqjltUlQ8JVEMA1mPrQBtpwNRJXHyEsKTY5MpUKnhLFHhGsIKUq4DcbPLMSk539lyfshnPaKwt1ZYDCOv7T/Z3pCcTV69g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJzcXBmaE9BZGZpUlp2VVlWbDZnNFJIZlBBWGJkc0VYb3hXT3FVeklXOFV2?=
 =?utf-8?B?TjBmYUQyanFUYWk0NE9aTC8vdWE5eFVkWGJUeXhhVGZtUkdNSmZOVVN0RFRQ?=
 =?utf-8?B?VnhaTVlNRnFjb3d4ZjZKb3VaTjgwSFpKTkVhUWRGTkdlL3FISzl3YjZMVjBP?=
 =?utf-8?B?TjVQSy9KTzRqUXNmTlZKVWI5QzI4bk5HcFNFYkN2dXFzRnBNNENKRFlJZ2kz?=
 =?utf-8?B?UE9pT0M3MmMvb3ZtUWFIbTRPWFMwS29yVVN4Sy81bzJ6dmE1OXVINmVHQmxl?=
 =?utf-8?B?Z1FxcUU5THZrMkdOWWlVUy9CVU50b2Z2SFZKKzRKclpCb0w1SXFCRUtZQWRN?=
 =?utf-8?B?S2dBc0h4K2VYbkJNbUZueUxkUHBNbmhhTDN2emVZeU4xN1puVmdnWWpkOGYw?=
 =?utf-8?B?Nkl2a1VNMlJIVGRXK2hVZUE0UGJaNFBjREhrQU5LdFFtbHorSzYyTzRtZlh1?=
 =?utf-8?B?dWlsTlBBZkpZRW03RU14RTRwd0JaQlRXTlpJLzdlenpRUTVJaU0xaVd3QkRV?=
 =?utf-8?B?dlE4a28ycWxlVnZRdHh2Rzkzb202RmlOQm1oZDdEWnFFUTJKd2FiUFBocjhY?=
 =?utf-8?B?MHYyU1REKzhEZ2lBRGhvRU5xeTI4em1kUWhVMVRNNGRGaWJ1RDJqdXdRT2RU?=
 =?utf-8?B?N2QyclZ2ZWxpbmtua2RJVUMvQnV0Zk04VXM0OXhIaDZ4anBhU1h2ZU9sZ1pk?=
 =?utf-8?B?TVZWMUlTbG1DQ3FUcG5vWTJNVS9jditQK1JqTFE5MGU3OTFBSGxnTE5WOXhx?=
 =?utf-8?B?NWw0WDNVTEh1bUNVMkt5bTVmdjlZL05wQlE2eWYva0grMllyVjkxdXgzUmVm?=
 =?utf-8?B?andtakdBUHlPNE02anNsMDF2SjZNK2xZUEF3T3NhRXl6K1hoOUxDaVlrWGZN?=
 =?utf-8?B?b2RZcCtjNHJlWThYbUZyYkVITEhCeEVVajBJbmF6UnlHTEcwQzJuSlhPelNl?=
 =?utf-8?B?d2FGaVlvQUh4Vzl0empFQjBzNTA3ZjA1dk05dENjSHVRaGxJZ0xib2EwSzBP?=
 =?utf-8?B?RmtzTnNrRnQyVG1iQWxmT091aklyQnBqQWx1U1A0YlJHU0NUQ29TQ0RkeitV?=
 =?utf-8?B?c1hNY1ZINEg2RDR6T1pQbGQvc1h6U0ZVTHJ6SjFJZ2JnYlhteDFaMXpMaHd0?=
 =?utf-8?B?cnFEQUljWDVsR1BLWFRGZWJ0VmlXdld3ZTR5VlVMYTlBZEloaUVpYVFzV0tU?=
 =?utf-8?B?OU1aeDZkNXF1V1VmUTBlcS9UYUNZYytTeENoOG1ZQmJWOTJjcjNDRHJvdkVD?=
 =?utf-8?B?WUpHNzNJRWlldDRaaDFyd0Q5MnZ0SElBRzR0MW0zRWtOOUZxWnY3U202aVdv?=
 =?utf-8?B?M1FUM3hUVFB2dzdTN1dFUklRS3FPZzRFVjBiTDhyWU9TWFdOVFRIMXdqUmFM?=
 =?utf-8?B?TDd6d0V2SVphRXNPRDlYb3E2N2t2eDRUeS95NTNWeVVVZy9WMkk3b0k2alU2?=
 =?utf-8?B?Z1dRa0xmYlo2OUpkVXVkQ2JNUk9DTlpxVmU2Y051RERBWVlTaFpjNTlrT2FW?=
 =?utf-8?B?VTMvcU41Njk3NXVRTVFKQ1RaU0d5MEVHa2t3dEJ3UGRmY0ZOS1VhNHY3VmVP?=
 =?utf-8?B?OWNSazF1NlQvcllRbkJkVFBFYkVVaWF5K3ZXL0g1WExlMEs5Y2JBQ0xnSCtu?=
 =?utf-8?B?dWdnT0dOS28zZjJxUXJMT0NkVjZrM0xxOGRyOG1WL1drZVZOM0R1Y29sMGZE?=
 =?utf-8?B?REh1U2pCMFZqUzhiSUFOTC9VODZENmkzVGszbEEvSXFwUisycGIyY1NoNTdB?=
 =?utf-8?B?THZBVEdJWXVmQnZyZU8weUUvaXBsQ2p6dHJaMS9DaWlDTk9veFl2Y240c001?=
 =?utf-8?B?K2RkYjJ0TmhLckxuWmNPTERKUXZjRG1ZUlhaaFo1ek1EYmp3eGhjQWNiZmJO?=
 =?utf-8?B?UDN6UkNKWlM5MTRxZGFQZ3B3VDBFbDRMQ0xqRUZZRGZvSE01dDBtM3QrVTVC?=
 =?utf-8?B?UGFONVlmWWhDV3l1NWg5TnQ3Q2lldGJkdXNoNjJWby8xWnhIdUN3Y1BBMjNQ?=
 =?utf-8?B?T1lDcGRtbUo5cTBrS1dUanJ0SFpYb2tnR0tOWUQwNGtUbWlhdEtsd0tHWFRI?=
 =?utf-8?B?VEZUNlVUZVBmNzg1LzU3RnVrVGtEUXJreENnZnRNa3BSQVJiZjd0QVppYndm?=
 =?utf-8?B?ZXoxclZnTUtrUXpMU2hkb21rL2YvcEgrMkpBVVhKaHB2d3VpeGNFY3hnbDZY?=
 =?utf-8?B?dkZsT1NxTDBUZm9CbC8vSEtwQzBJRE9nT2RMVlVCblRtSzhlZld4cjcxVkVr?=
 =?utf-8?B?dVBQazJ3QmthZmNSQzZ0R2tUdmM5TWppVmRGUTNHSlQwNVQwOWJnZmRJTG52?=
 =?utf-8?B?ZWRWcEZHaHlVbWpDSnhtc3BRWEJZZFJWNW00dUYwRzU4WHQ4OVlCak9kL05l?=
 =?utf-8?Q?9VzUcZaTDJl+PdPGjPk/j6cD3SKiuC3RV3BvE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0811f75-28ac-4800-5d51-08ded68f8d98
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:08:38.1975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQwN7/mQQER8RAoqgBT40tVEiSO5gB0KHzyHa2IfTyiLc/PzFFdQj3vG7MAujbJGOs4tYlQo0Cpi0okhYVYAh5sUjJa1MvrdILux5gCowim7LQ3yEocjbs9ErJfUs0Qz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10991

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
Changes in v5:
 - use non-devm PM runtime callback to correctly enable/disable clocks
   when unbind the device
Changes in v4:
 - replace guard() with PM_RUNTIME_ACQUIRE()
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 64 +++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 3a5788c609e1..9d1dd0e7352e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
 	struct tca_blk *tca = imx_phy->tca;
-	int ret;
 
 	if (tca->orientation == orientation)
 		return 0;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
+	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
 
 	tca_blk_orientation_set(tca, orientation);
-	clk_disable_unprepare(imx_phy->clk);
 
 	return 0;
 }
@@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
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
@@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
 	writel(value, imx_phy->base + PHY_CTRL6);
 
-	clk_disable_unprepare(imx_phy->alt_clk);
-	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
 	return 0;
@@ -693,13 +680,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
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
@@ -708,6 +695,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
@@ -737,15 +727,51 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 static void imx8mq_usb_phy_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+}
+
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
 
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return 0;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
+				 imx8mq_usb_phy_runtime_resume, NULL);
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
 		.suppress_bind_attrs = true,
 	}
 };

-- 
2.34.1

