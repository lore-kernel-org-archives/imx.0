Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945EF382395
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306932; cv=fail; b=jPs/BJr0SU9CQaAv4Wt4HQ9xX836xWkYMGYKaHdufTPMB8Dx2OZnCpnwtndtz7ysJ26ochnko7BsQ3IaXzIGvdMYiPM+wXAEjjIsMxqtz6p4txkw0R5/WrYgp6pAFo0ZDR7sUAG202fRhPKMSbpL2e5IOklYBGGJ+zMQK4tGOvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306932; c=relaxed/simple;
	bh=DntKT294OeBFnyPvEBNIwLlXvoJknr0bCT8GEs8iy3s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qqZhn0I6eDYWPWEqQ/RzGSkzHsnTlGJsNwetdqYXRAzb4YX5RfVYqCPbcmK2+NkJqOWXCJOJQhWpPeuqOB7n2w+109qtBVKk4kIzIh1NQsJSTIDdKaKETxwlOCFIeftzKnjARhzAeEzr61PAGT5PCSXcXtttUhTmK/OS3Q5Atts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JXMqphih; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JXMqphih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/HyaQ+7cdlwGQZOtf4chw77K0tdEc6X7K7j+yatampX5quCFYD9ZJSOBs9jmbhZbEvzqvd3pDz4jtKPWBzRxqd+pUbiK0Qgbnew5UKPO+RVjiVHusbXWbv7EHvN2edu2SWMLI3VQkm5BXZX+jrXzUdPJw/IXn3fg9I2fYDZybzQWnF+VofTNKPB5A6oidStLWqfakrUljxF7OQTlNThTuzQaY+qB9tyFsl52jL2CyL4K0OfcgOa4/FmbcgEwcCJU4Na+e7sT5Wk9bw9hd5vqwCZICxsOEs1NjSd/u6YrWLUMPm8KwYB0yZypTtMTkEQZ9gMtsETUse28+m+F8lCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omXLYU4U6ucASjjAshQAq6Qx92Hcb+iHxXf9DKW4xHo=;
 b=jtLhwUWCnrDYhpMD3zeSo+8zAg/jeockGTHBJFphjITwPJRtOjNYjrWJ+xS60ehlS8ZN0wr01TrOJR8LEFTpOKJqQAip/lSiPyAXddI/AWysTG5O3C6HSwoOjkOVASDHrQB4FmLwyGXG2unE9AcGSviMeMw/Pb3OTUC1ou2OBpXbpLVgOpUHxVwEmSHFQl2y2+ZYZCVi02rA9qMKYN2y/mrmzuWM/pODbHR7iOE0sYVIgYj2JiXJo1Wuv3kMU1vQZiUkKFcPIIeYHFk6OSPbbKhaer0BfrBYXLr3zOxYPJp8PW4s7oGXi+MgAsynk6eRjnGswxqJ24L9NkGJUdh/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omXLYU4U6ucASjjAshQAq6Qx92Hcb+iHxXf9DKW4xHo=;
 b=JXMqphihXCkN4wlvWGBKbQIfVtV7zhQuia83nT8CPscwfNaWaVX7NTuZPsWQ7S541nB+U0ZNRqP+weuXuYUnUGT06icZYS+lU724fbUhnbctXQX0I70mem8IrihshQq6/k+OU6gKRw5axM8qu1fDiJ7qUUndqWdw3Ce+WHu+hBKKnTgBHoPbcMD8odTXOrFZ55nOa3HrkKHY2rMzu87IG/lskPXvzR3Cilv4M2uExxcQc/zUOXXbLCOPeKkjwD3Z45wEUPEGo83pmeD3aBcjW2Kje3WDSvDClgZqVfOUzarPi/rxp68Vi5YUyz/2Wc33zqDp4Zq0R9LQ4fTwf7Azqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI9PR04MB826873.eurprd04.prod.outlook.com (2603:10a6:290:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:35:28 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:35:28 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 29 Jul 2026 14:38:34 +0800
Subject: [PATCH v7 5/6] phy: fsl-imx8mq-usb: introduce per-variant driver
 data structure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx8mp-usb-phy-improvement-v7-5-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785307123; l=2898;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=XbodJEBvlAK2LWyWxBODl0U2VKC2kV+8R9ztVacshJA=;
 b=EsXTkYMxFLdGEECIbwnwo/C2foaI14AGjV10Zj0tTdZpwH4F7Nn7P3mGlPD16pBLDLYBPFIeX
 TYpU//PJOTCBorrH/FeWt3HVAtLJh15PmtXiJTdwHJxTq8s0KdU80Hr
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI9PR04MB826873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a010fb1-d850-4780-9581-08deed3b943b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	deKKLS2tSxxPbHmvcWJFsXXcboHGCAMqdYJ3pvv9PrEULT3RW8axQ04/+p+ikI7vq/r/dcTS9bEeW9vVulqskS2ZGjlijHjBS+bXnUiyhtpiELaMhjD73BreuGbJbdqFsOnxP9OiYxdm+hqIa23qTupKRFfKIhu9Yk/nRhHn5JjNvIq4pGs0JbvrgBpq8fXxJpCgkdeQICRMU0/W+Y6WZPiwFZ+5b/cbQGu+Cy5fe5Y457mx3Pxy+J2KkTYBRzMpZY6NP3OQqfDagKG5r0GydNRkwSkQY8s4t+o4ayAOnGsNEh9umME44K+EoXrqjgTmilegqq0SRobM0WxT05SP3EY6QY9lAOj6YzSRzaXMuFEhKZ+qlmjmz3BX2GL5QuzrpCusj4Y6XZd8bUGP9+X1A/LydbWg82LECYekY1enqGpIQEMxniwmmp4WB4sX+1CTB8Bquc9Gcd+f1IkCC4r0/qNcSGM9RjifPJl478wXFmG/bA0nkxf1G7Bfz2fNuIJu6I8Ie0DVl2Snra8ZT4Q3r0rlLx6IZSjTDEbgB9UQNz03MTjCGZz+0KdBcI+/tKAbjqQPJMBj4Y+wrX73eAAIQoAnX0w1SfJM9vHaaZ1NiwHf7aIRNCxXXpLTe3lic3US5qayloMr82WKC0U4sJl/h6L9+RSli2CSm+5v1NHUV1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3Qvb2xTa3BnV01SU0t1WGdoT0djZVEzeDMyZ0JIaU93M2JtTXA0WnNNZmlq?=
 =?utf-8?B?eGp3bGJVL0JHTWtkSmxDYTBhTklmSUpOZUVQOGh1RkZDSTdna0c0aGdRVnpm?=
 =?utf-8?B?TTNjWU9XR295TTdRdC9ody93MEcyVTZNajBKRFJ6Zmc3aFVUbWNUNVA1NUhI?=
 =?utf-8?B?TGNRUkdIMXRyTHI2UG14ZWQzemN6VHNFSHRDd0pMeVFVMzZWaEtJNkZMdFJn?=
 =?utf-8?B?dHJ2M0c2cWJON25KMWhFaG95eXdqSkZNSytwa2RvZ1RoTzBsVlhsWGVtVlJz?=
 =?utf-8?B?cTh0SUpqajJyeWs2Sk5NcUhDOHVPeTUxMFpsVnU3UzNMV1VGV1krbE9LcGFT?=
 =?utf-8?B?RzB5U3pIT0FqRFQvMXBraGpkTVRGQ3dTMDM3OEJ3ZTBER1JXT1hXeVR6a0c5?=
 =?utf-8?B?Tk9hd0UvZDRBWjJxUHpVUld0Z0VuWktYMzljNTg5Z0d6eXB5elRoYUdsWmdF?=
 =?utf-8?B?NFgyeCtkeDd1QWFQUEJTKzVVbVcyd05mWkhMbXE2VEg2YVZDWWtaREoyZWlD?=
 =?utf-8?B?ME5HMi92Nkd5ZWUxY2w0d3hrNEZldnN1YzFNd2E0MUFPc1RueFNFZ3d1OVkv?=
 =?utf-8?B?Z3ZGZU56UDlwQVRrc3VLTkt6aGYwaXRyZGQ5U1J6dFAwTmdybk12N1JTQjJX?=
 =?utf-8?B?S3JqSDJaeTlkMmtYLzRuNnBTMmRqN1IrSnQrcUVPK1R1M0JjQzg5Y25ZMURj?=
 =?utf-8?B?YXdTZlFHUy9xaVgzbVR4em9ORGt4eU9CcUZ3UWdaNGhmM3phN29VUG1Nb0NZ?=
 =?utf-8?B?eWRDdm9vMkMyenM2RVVncUdFYXpMQWlJdEVxb2s0eS9GMnN4N1ZrOUlCRWVS?=
 =?utf-8?B?bXN4aVhGbkZ5czFrLzNUOVg4V0hSZWxYaEMzRy92MnBmU1BpM2ZBMTNjUlVI?=
 =?utf-8?B?SmhwbjFXSWtYV3NkQTIvU2JPNDJhZndncmFFVW9lWjJlcGhiYUprNWRjWHBJ?=
 =?utf-8?B?cjNYcWU5SUpUVFpucFRBSElGS1FFV2g1UDh1TjVMY3hIYTdSTVlrNnh3M1F2?=
 =?utf-8?B?Nno5RWVwLy9rZ1V0bUM5cUZUMngxWTVqKzcxb0N3U0NQdGptWFZDY3Z6UXo2?=
 =?utf-8?B?aUJXb2JWOWowRlNQS1RRTW1YQVZxZEZheXJrd0poNmp2WkFWc3pRbmw0REpF?=
 =?utf-8?B?VWNRNHdXbnRZUTRSamltYTc2cW8rZmxlRmUyN1ZGWE5FdWhjeUQwSThjQk1x?=
 =?utf-8?B?REhxcHFCcTljN0JxVDMrMGEvUFBpSWNsSmZIN1UvaDR6NE1IMUpEYjhUaWlk?=
 =?utf-8?B?d0pRY3lkSklMY0pqdGNMbXV2ZTBPck9IYVIxMCtUQ3BTYWx0bC9qL3VyQUtp?=
 =?utf-8?B?ZzUzcllrZEJ6RVFPTXcyZ3RKZE1VMGFPMWFTbVQxUkdhQm9nTFRzMEljQktq?=
 =?utf-8?B?cHFvb1VSWmJYc2xpL1kxVG1ITHQ1Z09PRGtiZEM1RVg2MHNnOTBmS1VyNzBQ?=
 =?utf-8?B?NUl5bjN6VkU3Nis0WnpMd2wzTm5jdHlvTGdZaVZBVDY2cFo2OExTY1RkL1Yx?=
 =?utf-8?B?WWtDQlovWVZEYUhLSmFDUTdjcklmK1JQakxpOUxUbWJRaTFvU093ai96cWZq?=
 =?utf-8?B?WkZzaWl3TEZOamxIdTBwN2paTCtqa0JvOHVJZCtia1JZR01Uck1QUzZ4QVpp?=
 =?utf-8?B?S1d1cjFoV01hZ29aWjZ4MXJGT2dzQkd0U3JWcGRGWkl3WnM5KzRTWlFDWXhx?=
 =?utf-8?B?TFNPRG1RRkViek5WYW5TSkx1RUhqNGFvaUcxaXUrRSsxTm9FTWs4eTVCeGVE?=
 =?utf-8?B?TnVCVTRXRDRUTDdWQ3VmRW9XY2dHMm9MWUZGTklZbUh1NXJMc0x5Z0FPN1ht?=
 =?utf-8?B?OFpuVDlEemloa25mVWVVaWh3UUpicmZwbWFlOXk1STNXL29BRVlROUFEcDdR?=
 =?utf-8?B?V0VJY08xTlhyM2c5dTl5RzdvaE1DTTc5NjB2bFNJVWN1L1BySFNPVERLc2U3?=
 =?utf-8?B?MjJ2bUhjWlQyZmlTdTZ2TXBVSHdGOHhyRCtTWDRaeUtCeVJKZGNPS21uT0Jj?=
 =?utf-8?B?R2NQNzZKQ0gyMm1JTVRLUDVVS25mSDhtNW9ybW9ReUN0M1YxQ0VqeGs3Ym5h?=
 =?utf-8?B?c2RsUkJHeWJKZXBra0xycldsY2hKZzF4SnN2cFVCbDlLeWUwUjJIZCsxUnVO?=
 =?utf-8?B?NzNDYjNObkw5SjQvQ3EyR2JXeGlidUw4YlVPcUpIODVkTDErRzdleG16WDdy?=
 =?utf-8?B?NVVNWHlBODdjWHkrV3RUZHk0WHhtZmFGRElUSkVBK0JnZVhPVHVrbitHOGtV?=
 =?utf-8?B?SEx1WCtrTDQyWVNvb2xoazRPeVNzRWZkT3M4azE5c0NraGpLaFdvSnY1YTRO?=
 =?utf-8?B?d1VTeHMyNzRhRUFqdUlZeGd2QkxwZmViNUZvWW1tYUNWTk11T1pzYUNpeWk1?=
 =?utf-8?Q?9D5oPA6pzNajTX5cccYICmgz/sRzAvAg2vaC+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a010fb1-d850-4780-9581-08deed3b943b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:35:28.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jbFJLfFmpTF4p3unsNTdMobmSOJ+7tasFtNdEAN42HTNlVO7eM8cojg7rIqwzfGUUYYQXbW82SudfPBNzTKUBcHnAq84CmBbT61uff47RHULJlpwZoLlpTisCuh42Xc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB826873

From: Xu Yang <xu.yang_2@nxp.com>

Replace direct use of phy_ops pointer in of_device_id .data with a
dedicated imx8mq_usb_phy_drvdata structure. This allows per-variant
driver data to be extended in the future without changing the match
table.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v7:
 - no changes
Changes in v6:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 83d5a44c4084..eda6064de005 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -132,6 +132,9 @@ struct imx8mq_usb_phy {
 	u32 comp_dis_tune;
 };
 
+struct imx8mq_usb_phy_drvdata {
+	const struct phy_ops *ops;
+};
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
@@ -660,13 +663,25 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
+	.ops = &imx8mq_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
-	 .data = &imx8mq_usb_phy_ops,},
+	 .data = &imx8mq_usb_phy_data,},
 	{.compatible = "fsl,imx8mp-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx8mp_usb_phy_data,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_data,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -684,7 +699,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
-	const struct phy_ops *phy_ops;
+	const struct imx8mq_usb_phy_drvdata *phy_data;
 	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
@@ -719,14 +734,14 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->vbus))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
 
-	phy_ops = of_device_get_match_data(dev);
-	if (!phy_ops)
+	phy_data = of_device_get_match_data(dev);
+	if (!phy_data)
 		return -EINVAL;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
+	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
 	if (IS_ERR(imx_phy->phy)) {
 		ret = dev_err_probe(dev, PTR_ERR(imx_phy->phy),
 				    "failed to create PHY\n");

-- 
2.34.1

