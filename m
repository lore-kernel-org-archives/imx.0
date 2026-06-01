Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94128C5CB
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330734; cv=fail; b=SPFg13N7eq35Ej1JMCZ/irFpc+0mjCzqH+Ue7+sTmGXX7zxm7YRYAlOV6MoEJYvpdGTIu0rUPy5aZXF876f2UvgGnfx4j1P+gebLF+UrvSanjtPUS+lDzf9ikOn2wEyBPifMdCTOxxd9h4GlBpFsToD5SgtECk973EU0617+KTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330734; c=relaxed/simple;
	bh=mHHThgqeJFBPzpRLqUDbzMRiJqHJQs9PkSuMhs+r2lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pqTsyHp4zfb8dpO9RKl2cCUa6Mkvhwu0wf/wslgV93mVqsn6h004iyskFrqo07ivW4gkosDX7mHiIBeMTKrjtl7kRYO7YTYKeDZdeDJY+aUptLXVDJBPOXw4s+VtEw/lVqOdCHtYJaOFHsuVwyw41w2NoNEbkxPfGDIQKkoGvnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=McM3S01z; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="McM3S01z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RejAT7k5f65+vqZ3kWiLQW/G6rccy7TLrYleTw0Z/FxSE37DZFAB8l1gxRyYjrE+yboFfLMGUU8i5b0WNe4vfPY+OBNNRbFF74DmLkXd2Vo8cwwlZDLzX8EkEQ01j87ynkKFkB78w2a0BbS/MI9TY9vPmbORrf9F5tpKTiCYLJuScXk7Xzs3U/878q7JSRel61q/AB03zDICg3kZnIDc3OtMeAOhx5Sr7tNuBsUc4vhmulBdzYduEui7pEanwZ1931hmPPSrztgpqTXTsaTTx0s49lPb6uYsXCV2BVUtWEJEEj1/zDIxVrH6ojX/ezT9d1wcBCzNW3g1uIsw9wZvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byLO7ah9b2CkrJHzHYpi3mGjnFrwcIo8LVm3qGNn8kc=;
 b=SYpUjG90fkF7vn5DnLx3pTupDp/KdEFS0ig29jtsUsINBPwNearWb2z1kJHl+hiJbBNifsUypLBkukiZHK+DmS2OcWBdqrpPUotgiiMGD5RWkAHUXsZ8lLYEjTo6YKYOd/4b34uBibcaUbbmE/T0w7F282znCB0geUVLuP2XlCdCjl0i2NVBEyClnMk5+/A1rtQSMntYwZd2JMDcESNxFA7vAn/cOhtmm0Cn5k6ntLki/6BzUzuJCbY8ebE7kcD5HGrLT0/HEMWD8lPWNXgs8LoMrVgvU58Cykjicj0VrbNAq1X77pxBFeKgaQDzlnLr0K8DCrFEowqh8j/hy7kO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byLO7ah9b2CkrJHzHYpi3mGjnFrwcIo8LVm3qGNn8kc=;
 b=McM3S01zj3l0v6B6SdkroGawTveAilMEGTO9XoJqan5v87erZYGPqt5GOzpLPmF/MkFobNTCVh0oVTcEKDRNfovJub27WKmoI83JSgQGtfVRnhxzw2+Ykt3geg1NTiLlAc7eM0gQaeFNjrpZNfqYSf7edudgfs9VOXmd4P7e4iqAwOAkPB4U4GXR5rEUYdyPRx6ZRz4cM+nf64zGl/p/n6EhfD97G7JfvrIyh+3/FDf/bMpRQhb8B0r4K4uPRvZve//v7ks9/uiZNvgIKjHEmRL9vllZP8OQEzjxCjFfpSKgA5cmCs4l80UdY4KsxW63vF8Le9gg3x9qkzMsUoGxFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9963.eurprd04.prod.outlook.com (2603:10a6:10:4ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 16:18:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:18:49 +0000
From: Frank.Li@oss.nxp.com
To: Russell King <linux@armlinux.org.uk>,
	Yuho Choi <dbgh9129@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: imx3: Fix CCM node reference leak
Date: Mon,  1 Jun 2026 12:18:41 -0400
Message-ID: <178033071109.4115625.12881957851790369586.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514034004.689829-1-dbgh9129@gmail.com>
References: <20260514034004.689829-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:806:d1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9fa2b4-38c0-463e-3ba4-08debff976d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CxcnMJazS5xPUPpwaA/Lgj3ihK6UneZc7rtYJNlhYMctPsISIC8MQngBwIXNT4dYy24xYQBUyq0naDOrsTwppwjGCauFyk66yrGanRv13B05EE6xvXWLjYfnlfQ40y3QXDTgrjWgLQ5Zv9Bw58OnMXBIPSky1r5eEJS8eBoBYxTUD1aI53RamJRb07zMDqkKTbSZ+FwfaurYWT2aR33rzPorGo9H3nx5IZLBQmwfj7CcSGqExjJlwhzHDbOk500aC5ux7cqg9/I6sqsr5o53TZM3kkZR08K69Lti5q/Tjngjw/E1odumSkc/9HFEdn+bI7UvVEAp5CgKidqcpOG/puuXrC1WX2NCtbwU4q8c4Wul5Kz6QZGHCa0jYblgqCeLOvnIaW+WP9G8gCtSm1PSThyBCgRkkXmfEgZ/gIYJETDflwlp5yHpgk1nb6ju5t45iQ6q7taB2YOWW9w9ZPZMvZ2+LnXUmRznJoTYohSmH5RXLcnlQmruvgJTPGIBXawGrvUlNWNpdcd72/WeH21WCuiimLIcqkELRXop1/uF62ALJMd4fLWBTFxsJN86z5QsidJUmXMt5EOtBgYTEYLiCYR+wg52fazyXa2HEIbC7rzyZ6JrEI60fd0yz7dYe8Z337g8h+JyJ9kwQVaoNA6/rWoDmuNWheXn4A7WqL25Lcm+lX7l4vehEerhBJ0QkGah
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHVLYTB0SHR1TlVsZTVKYVFDcmJYTVlyS2cxb0xJMXh5UmJIZjkyei9MY245?=
 =?utf-8?B?MFBkVVcxRTNMOVhtSXIvWVBuTktoQVVPdnZqdS81dXJuaUdvczB0UGx6Y3JI?=
 =?utf-8?B?NHRkaUgxOFVsWEdNb0VQdWhtWjJuclhkTnY3Qm1hc2tmZmpVazAxU2ZoUlI3?=
 =?utf-8?B?czZTTkxYZ0VkWjE4TEtFSnZGdGNGbGhMSm5wdm5ISGhSVkRMbHNlb3ZhaXZ2?=
 =?utf-8?B?SjVLdk1Ka0xpMFFKeTNScHN2eU5JanVUMUViNEZzMmRMN0pSZDEzdWpaKzJi?=
 =?utf-8?B?TExGWUhHWUl5K0dhWnpqSHYzaXc1bmR5MlBBVzErWm1IZEordVNZY0tVSkdw?=
 =?utf-8?B?ZHg2SG1EZGNxWUpBcVpXWjA1VnNicmx2d2pEc3RHK3MwZ3J1MVRNQnpTdjc4?=
 =?utf-8?B?emxRckIveTh3R09FZEpWSkZJbUJ1UlRXc2JFYm85WUxVR0tMYUtsdUJTaDJH?=
 =?utf-8?B?WDFDRHl2S01uTGVGbXJVdEFkTTR6UW1UVzRtUDBuenlaN1o2OFhVeVpXUkJP?=
 =?utf-8?B?WlFldmdXbVIvWWxmeHVXZ0dBK1JKdm0vWTkrOEFNTy9VcVJTTGEzRTI5eThC?=
 =?utf-8?B?eGI1SUVneW12ekU1UitaOGNKSWg3L1BiaVFqcWdxaWFJQWlHeHBoSFMvRzg3?=
 =?utf-8?B?UWlMclNGNDhBcm9WMW9lSmtyeWZDekdSV0VwdW5Xa29CbHE0MmVXSzNjMFNl?=
 =?utf-8?B?SVc4ZDRCYnM4UEkzWEhsYktPVkpISkdaOVRkNlY4OVFWYXRVczl1NXBHalpt?=
 =?utf-8?B?dnFEQU1jdzVyVUV5bGRSMGNhQ01qc3RlbjhER1JTbjZNLzh0RmkzNDg5NTZH?=
 =?utf-8?B?ZERVVURjdnNHejZVejlmbzlQS2dvTmZ5dml6ejJaeWw1cmNHMFJBRVlCbHc3?=
 =?utf-8?B?UDFucGVxQ0ZZRHdGaXFwUkpEdVFvdDZ4cWMrTWJudzNNUUxCVUdSclJUZmtJ?=
 =?utf-8?B?ZUlqdHBJdDAyNXJPNGNSb3hOSXRGYUM4SGpGNW80WmNJaC8weUZMa095d3Mv?=
 =?utf-8?B?dUc0Tld3V2k0OVB1VE9vYWYweTFmT1kvR1MxQU1pWGhPWDB1Yjl5Q1JMNjk2?=
 =?utf-8?B?VVhpd0tyZWZkcXRZdzZqWmt1bnZIcERiYnNaengrMW12UWFWZnZRbGhnNElk?=
 =?utf-8?B?MGNJa2RFRm43Zk5rajZKNW00ZDVtNGYwOURodTNiaGFGbUtTellTWDlBVEht?=
 =?utf-8?B?d210ZHJRKzJ1T2szWTRHclc4b2ZHL2w3ZFNDbVFFSkhtMm9NVWZZRHJNNktH?=
 =?utf-8?B?ZzZBeThlVXRVbFVyZ2h1MkVkdzFQRjQrOElqMnNqd1JveGExNkd5QVZrOFdI?=
 =?utf-8?B?dWNVRVJrRWlnU0VqZ3k1aVVpeVhneTBMRkdVUEFsMXNmb2FMZFhLRzZXTlRs?=
 =?utf-8?B?OGo2dFVHN05OdGJvUjhqTm12eUEwcmc1Vi9iUlFnUEVFeUVlVU9GVVNmaVZK?=
 =?utf-8?B?RDRLbHE1N2Zoa24xaWptM1Rsck9tY0RXb3dKeGlZT2hicjMxVHZZaVhickhu?=
 =?utf-8?B?aWtWUmVHbXk1TnhzUTNJQ1FqN2hpUmhIRFJFZ3hOY1RzOXFOcXJPcHpLSmtV?=
 =?utf-8?B?SmgvVHBwVDhaTnA0OW5qRTJCdFlYT2lwRURZdVNSTGVvQ0NqVTdQazJ4VnNV?=
 =?utf-8?B?N0U0ZmNMU0hGZnN2YUtkOGUxRjQ3UDlUeTZ0MWZ0eTVxbG1MTStOVXhiU1B1?=
 =?utf-8?B?Q1pwcmdWWk12a0lnVVVvTk1tUDAxbU9tdXpmOHNrTlEyVm5GeE94UzJNVmla?=
 =?utf-8?B?aEgzeUZaMkRheUg4R0dKdERDVlVRbGRyWXFYQVYya042aUtVRU1UVDd3YWhi?=
 =?utf-8?B?aFpISkUrOENLcWkyeG5scUI2K3ZNRWZLck9mK3ErN1dFYjFQU0tQNzJaTFFP?=
 =?utf-8?B?aE1oN1gvVStpaDlxZG1ndHBCbTZ6VXA3cUl2RlZIWUNodEplSjBUcFM4aFNE?=
 =?utf-8?B?d09VQkpJVFc3WTlkV0k4UXlESE56REJ1QzNKNkVYM3V4Nlp1VFV4OFNBR2ww?=
 =?utf-8?B?UTFNL3dVLzVpQWV5eTRDZW13K3diekhvdFovVEJyWHQvZzZWaVNNVGkvZ1hL?=
 =?utf-8?B?TDk5MWx0SjIzY0U4NTN2ZG1QbkZnOGhFU2NzR2tBekdtMjlwRW9iUVB6NmNn?=
 =?utf-8?B?Q2VyUWZqUFJyTGNqcVl5dmd5V0lJMklwdEZGMUpkT2FRaERtUmVpSGprY0RM?=
 =?utf-8?B?Sy9jbitjczZLM2tnRmJaeFRQTEVHT3JFUjI4SmxjVWFiU2F1MEFLd0VuOXZ2?=
 =?utf-8?B?SE9odDVjTGdzNzBzSVE5U2FDd201RTAvUmtmUDZTMUZ4Rnc3ck1lR1Yyc1d1?=
 =?utf-8?B?dUo0TVh1RkkxTTNYbW5HZ0VqcUtqMTVrSzFiWUVybzVNQlpjcVhjcHJscFlm?=
 =?utf-8?Q?YI2lllrSBX51gGBs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9fa2b4-38c0-463e-3ba4-08debff976d6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:18:49.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFP2WAhcUfG3IqJ+uW91WmVuUqV9/8Hs9olYmrfymyWGXSHa3tEa/hfvUNYbu0j6nccFcNsym/MX8rXHDUf9tzljTW4OPtsp4n4VF0tlCoOwFtkMhOVSbfI5/5N/KJ2I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9963

From: Frank Li <Frank.Li@nxp.com>


On Wed, 13 May 2026 23:40:04 -0400, Yuho Choi wrote:
> of_find_compatible_node() returns a referenced device node. The i.MX31
> and i.MX35 early init paths use the node to map the CCM registers with
> of_iomap(), but never drop the node reference.
> 
> Release the node after the mapping is created.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: imx3: Fix CCM node reference leak
      commit: 36d46348eb5fc4bc505cd2290ddd70c25fbe6bb3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
