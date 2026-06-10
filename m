Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2E2874F8
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781118521; cv=fail; b=KvzS3xumF2heFHoJcmhbaOcV/UzEaXjT8VxunshonF9STK9aIZ5/lqkjv7Gkzp4h2gOaGIgagUkIPTcbwJRh5ima38sv6jmB26q2symTnkjoj7YuCDLQrjRH1nEl0LkoZiYaXilrzz65TVgU4LN1rAYf3MBTSpFbBdQUY1pAG5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781118521; c=relaxed/simple;
	bh=lX8XXNgExUoYlTjp3mRA9I2mBq4wpedaopTCb9tstKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u8Qxz40LPzTqky/86F5R4wmTS0Y9lQbTV6H4Od0HHVz881h3tYoo0T+7PHf1U0IsSXYRqaMTRyYmAvFwgKWqhlNDADVTcFXvjh52qUQLVLbAQIFRlukJ8CLyWtnPIrOVB8+NkbJk3fK947Qw4W0ykNP0afOoeu6rpjr0/GoKa8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w+JANX7y; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w+JANX7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMRDk55KiWGWVj3WDk6kkQ7gEmrAslBXwYtDSvG8t3bY/SVvLbiUrz2dru2hRTU6ViIt+A+vzJGwwo2rhJFRNiNvE/2jieEpDJdZETrJlwSyeT4FtblkiI4mNLLHsTQJrTXHeuVmdl4px+sYm613ANl7dHD7KU+dlgrWubxn827ZCSANGB3x1MUGdC/VfUV4acwdt/nvLEimK/cj9KMenEOxN8cs6p6pejtlbgIcLWggoBjvtQP68/mT6gUFi+WqaeRN8vgye7CSJk7JaLr+txeBm5WeeoMlULB6yLqXvumAU6BlksaHds9M02a6Ib+uFz9HF7OhCJtlDgB/A5jatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o22zv4OTqT1i2kna89k9iSiNM7y6gvHq1ee/Tp9mH0=;
 b=fcMGB3W5lTdBQV58GOvZZESYQ5mGxHYjfNQm2Vn9diKJVEmdR2sW+d4O+f9shJ3rvxlD0yDv7kZpg/PdMkW5VyzE3Mhs3ik6k3WRMWr552gYWbc80ZOfXXB1C79NCJP37AprGqVR5/qFhG68Bv8fpJk+/D1Jmwi/2B2cnV6JG/T9y0s3003rvfxepgKe6akAewQmLWRoY9KD4jsbnJUm9ki0cei8Ue8N8+pjj8RQ5rqm0XK0LlO8+KMVg7Y8A94UpAJ8mM/QMOn0iMeIxLL+O5uBNoUl+nw42VJoVh/fCr2YQcns/9lpUlLXoP5GFeq2gAaJHS+Le6uiCjJVyspqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o22zv4OTqT1i2kna89k9iSiNM7y6gvHq1ee/Tp9mH0=;
 b=w+JANX7yphdP/UH4fw4klppR59WGgnTOVG3X53KAMSBihutOjqId8F26xZOiVy2lKU1TMoMQN5i8HF7R2n0NPe+mGiAdE1D8WJdgXSYWOrTwrKqwRj1AFNt6hp4VfB0WaelDCdLVappixmvjkB5UBQsPLzJr6d9J3ByOjDg6r4NyyBUGTE1x9TASBfBXeBVR6EegviFOaMfFsOgc2MiEYIlcMlV69F9Ay3uUIrgVjtwGI82fi3yykPkE3Na/3wvYh0ermZG156cNUohVLGEHe4TYBLTdr+VaprguoYSoKmLYjU3tte9NdsNxQl3+M/sMk2V4zi296owCrjmheevT7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6946.eurprd04.prod.outlook.com (2603:10a6:208:186::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 19:08:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 19:08:37 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: (subset) [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Date: Wed, 10 Jun 2026 15:08:29 -0400
Message-ID: <178111844864.1088466.7414551932762014103.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0053.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fd62fe-c866-4048-6015-08dec723ac7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|7416014|1800799024|366016|22082099003|18002099003|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Rz1xNr/291M1W1Zu2apIdZesZyQQ5zWE392z8KkN1cdZ2TOG6IkDSHImoESYAN1kM/ojuFfSJuuWcmPzfX3/q7cXDrMyWJIL0qPhav5k+FvuhzbSee8YZrGmjBXgyNprrNedhJ/rauVOyojiaYwdTUIGCxitguxjoHQ8RNjLa5185xLphEusEhOXQdK/QZsf1gcaS6MFbKfv+rUSXTALIWsGv2kD4hrwwuo0ApchxG58o3S5+Nxx4VFVn3EU+CW5TkP872bbrWhmhEK/GX/xYBPZvAtgNPKDHM675OdFNrrUv+dftIzK6ywTZCN0wectH/UBD0foteAUnJKYJ/oHaLjz2v0C7rcpnRMFQvNGC0PHyl1L17/BKeHHnCk1DKLd8azBFiv2A1Kk1ICDyqnaUR2VnPDjV3gb3WexeMe+GpInxq/y/wysZMFktduaArI4Uni1l6jOsU8+nwLBrUbs36xwsqsNR4krLkUtLBFSWUM51KdziEh713n6nuuyKRO4vh1N+6416CIZV9c8Bhr3cmxIE5oG252+tgcGSb84UjRGUUn8TsGufRedI2rm47F2l1BYDcI9Snd2RwRcg08ZZihhMy8y7Az9WlyT94FKAVbcywq5KlPQ345z2ODVpEqRlcn2Blo079fhOkjTroUPjl9GV7whH2a5wHEQV1iIKPjxQZ+AA9emEcadJe3ugr6lTKNAOXyY/SnuFJr+wa7sjkakfDewDt3RsHdAhHlTINE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3RYQlVRWmh3Y2tZRllyYWF4Q1ZEcFd0cnlkTXFPcC93RlhYVEh6OHhRMkNI?=
 =?utf-8?B?ZDdpYXIvZ1M2YTBpc1J5T3FxL2I3MnkySWNLcEpkNnhZV0dLd3pxSlo4dEJD?=
 =?utf-8?B?Um5JYWV5QzVhU0E1eXdBcjBjSWQycWthWHA5M0NhOGtsQXNYYUJaVWlxM25u?=
 =?utf-8?B?UXp3SEJGT1BxZnNQbG1LeW1TQ3ovZlpNK0hNZjRSVXNBTG9EM1NxamkvYUhV?=
 =?utf-8?B?US83Z0lMSzg0YlRIMTUxbFpJRDc2Z1pvbnErRmpOSUlJY2dSQW1nL1NxakQ0?=
 =?utf-8?B?VVBnVVc0TS8wUVViK0ZGN0hwMG9OU2V3UlJtUndUYjJneXNhM0Z3ekF3Nm9J?=
 =?utf-8?B?anJEN0k5RFVMakI3SDJxZnZQTkUzQW9OeU1nZEN3NG1hSmFUelpqUVI5UTFI?=
 =?utf-8?B?Q3BtRENYVHh0M3RPb3lNbDhTRWg3aWFLUUNWZnE5UUJhcklZeFZ0Ny9STHVv?=
 =?utf-8?B?Tkt6UVY5TUU4aFRCV3JSNWxuUE1hVnVXN2Z5SHVjVTcvT1V6RDNFTzhBOUcw?=
 =?utf-8?B?S0xQS3dtTUYvaWp4VjV0RE1PYmlmWFkyVlZqZzlUbkhKbVZ3R0VXT0ZjS2lF?=
 =?utf-8?B?TkY3ZnBRbWJUZHU5UUlOTWJJVGhNZVRLdTZkNzlPTzlYNWJVak8zQXptQ3Uz?=
 =?utf-8?B?azRPSi96cGFnSVM3SloxRmlwWGZLNE9Ub0VpU1h5U1pobXJmN2cwSk9MalEw?=
 =?utf-8?B?djRNQU12T0ZNRWZKc3M2b0FyKzJNZ0tvNjR6ZG96Y05CS3h5K0wwMkd0ZDB4?=
 =?utf-8?B?TXg0SzZVMEFWQXZHK2VZMUNQcXZiWXk5TDJQSDBwS09XRzFuWklCZFJOZkdP?=
 =?utf-8?B?RTVsVmxlT000UXJ2NmhibElXSWFRT1ZPMEpYYjBieFhxYS9FNTlJa3J1WHdB?=
 =?utf-8?B?UjRLZXplV25PVldvd1pvOURwS0JZK3BkWFZwWFhxTWZiVE9jYXhEaCswNHV4?=
 =?utf-8?B?N1FJNkRmU2ZLSEdNYWtXNzVmTGE4VkpDamV1eE9pU0NWZldFdXdtM2lSaUpC?=
 =?utf-8?B?dzRDRkVuSnIvM0k2OUw5RUtrd3VMSS8zUDZEakhvUjZPS1BMNWZUVnZUMHJW?=
 =?utf-8?B?Ty9obzVGdGxzQzlnRlVFUGdnMkdkYU8wRGRwTkZlTVg3VTdrR2Z1T1pUamNU?=
 =?utf-8?B?Y3NGbFZ3R1lHT0FoN1NYdWNMT01rS21MQTJTN0R4RTVjZlNsRzJsNVNpWHR2?=
 =?utf-8?B?YzBwdU96cXM4TzZ1Qzk3RHdvNW5iMGt5czErSGdSWXd5WnJjeGIvK0FSbWNO?=
 =?utf-8?B?bWpoVUw3L1NWOW1yV1huQ1lQN1F6N3JYT1MxWVRLdWc5N3phcUdTVSthWnRE?=
 =?utf-8?B?TkNiZFRPclIxMFFGYVMzcTA3SmV6SzkyK1ljczdScy81Z0hlMW9OcUZCNGtn?=
 =?utf-8?B?QTdSUzBzMjBKL3NocTMva091KzVjMjRYYmZ0cTJtNmtKRldRWXhvY0NCblFo?=
 =?utf-8?B?NEdLbkNEdWFqU2RZaXg3NjArbS9rSXkxeG1weTg4MFhHVEg4RUtRRDBxNlMv?=
 =?utf-8?B?L1h2cUU5TUxsWlgxZzRnSm8yNjQ5OUkxSGllUGpiWVp2Zm05L1N3SXhmemZw?=
 =?utf-8?B?QjJ6QVJ2d3BROUJ4dmpOUUlLaDdsYUJxVlFhSHRYTi9MRkZLWVArd1VjMzUy?=
 =?utf-8?B?MEQ3aXBsS0FHUnZQZ0pWNnk2TnVKeFlWUHlHL1NsVHJmaFl4dUtyUUl3dmox?=
 =?utf-8?B?Ni9PemQ5K2NNd0MxYlczc2VPZDN6MFZhRGxlV2duUmZ2TkpIbTVQaXhBVVRy?=
 =?utf-8?B?UzV3OGNtaURnUmtudUpSeng4bTl6WHo4RjJkK2o2MlJIUDFMaU9lbkdUTXd1?=
 =?utf-8?B?ZmtPMEg1MXduLzhkd2Nyc2piYzhtU3hpMUhQRjBjbDZPL09NcndMTEt3Kzly?=
 =?utf-8?B?dGpKdXNiUHNBRFkvSUdXaHRBaEVoTWlLMVdTVVBMY2Q3aGtnRXBXVldaK01O?=
 =?utf-8?B?REhoQml5RkxHQTlPb3lDK2l6aEphVjRXeHB0V2REeFVWYVJZN0Fzdjc3TXNC?=
 =?utf-8?B?RFpXMVJ4aHIybW5MV3RZTUw2UCtqMnErb0ZpMUo2UkRyOHY5Wk9NOUJ3RFhw?=
 =?utf-8?B?YzZiTS9pOTQrOTl3MHhCdDhlTVJRdHlWa21IVjdtN2N6TXhSUEhyR0JTQ2xu?=
 =?utf-8?B?NFZVMnVtdkQyNjZNd2p0RWxnaDFaeE1LUE44clJwbWJzUVZCZ0Zvd1VEaE5F?=
 =?utf-8?B?ajNyTjQwTUpLUk9vNGtMTmhvOVN0RVA5eXRiRTlIT1VBMHBjSEVIbkY2Yldx?=
 =?utf-8?B?clpSMEJTbXVhREtCWUQzQ2hLTm5jNzZlSEpwNk16VURWZENOSUJwWWRpRURY?=
 =?utf-8?B?eWJqZnBnVzZRUHM5eFVsbFljT0p4d3VKNGVkbXFXbGx4aHJNV1RPSG01dUNr?=
 =?utf-8?Q?7aUDHp2Ygfn3/bsGik3izNdjX7Qj1o+gU/GQX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fd62fe-c866-4048-6015-08dec723ac7a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:08:36.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEhqYkunXdgmN1J2MGFAU9rzSrn9Xqoy3cpTFTzEDR8MZVSfhC0485q8qUukHdQcrIDEX+87DWmHWcyKDAMyXTz9Fyka5/oRSkTqZA28cY10nNkt2qzYTad1uode15Ld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6946

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Feb 2026 17:28:23 +0800, Joy Zou wrote:


Applied, thanks!

[1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask property description
      commit: edc448e785891cca747e21c6595e050d3d3fa434

Vnod have not picked it for the long time. I picked it to make reflect the
correct settings for i.mx

Best regards,
--
Frank Li <Frank.Li@nxp.com>
