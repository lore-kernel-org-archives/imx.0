Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5323358C6
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763167; cv=fail; b=cGAfIwFeEM+6Q+j86+Q7iI4a0ns5pyjBCvoBAyWb6MrNlo0iCZuP8EXAqkFxzeKyqXDd4GTd7wZ9ofLSlZyU2LtxBRkt1BZSAGYhguLjSbwR4sbwnQcaWllBRAu+wHqiv7TRQwvNtrqrtlj2nkodwbATQGKPp/U8CEvmuYgZtPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763167; c=relaxed/simple;
	bh=kFK88Cp+bxy/FpSi+xyLDbdFtWoCHkcyw2jV379bycA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F9UWBF++m4kDXeZsCmsrfWmiaD7GY0/laYD9G7Vz98YR71bHfBZQjmOqcIUgU4MrTxDaGADbIFm5SiCTmDv0+QIXGMXA8x2y9apv56PaF4Q4xp38dpuUu+RrOPb9RRbmW107BDE9dI97F16jgaG9SJopW0UGSGU53p69uCofj5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t8aZW1Bv; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t8aZW1Bv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcL6w39gfeC8juu4C1KQBtV/Bgs6CKc+93KplwhsvKGBRiY4bDoO/DVNlvncDPUcY0Lj46iTTBoCHuHh64IGKEp2KyMt06N1s8oV2oWn+klxIwTx1AjXvopncz3HI7UGSEErJmTU8pflPHutiFaZv9+GPOjUoMFzB6FspRGtKHcLWfttChDBkdNO2VinHuf4tSC+bG8LWQOY5ZbhjHr4CtiY5cHmOZd3vckzkrUNaOGWajkaqUL8Qx5OEMg+3eBx24NDIq8A0NZmylItraA7ofi0+lTLcKt06tgNvGRRUX0HiuELwhdDw1NUHBjHvSofIzMSEh9HXijj1f6PVMy3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+GHGZ0HLSaiYOM4DVdZXmx2qFCyFcFhMmWziDcnNxA=;
 b=c+uwelrx8UEg+Rr+RH1uLlasbwhHTbiult7qQCOEQ4+p7SqkQkY5I7OqhwWC8Ykaa+kLszIdmre/VJsp5Xa/cphDm67s85uBSeCgpGejEMT0S2QGS17bbJwP8EEXss88ZhQHwxNg+I4jEDAW8hu0hl+xcBwRbZSFuuTl6CyqxqD0m5GGcQCVI94Mb4NEiS/upXTx6A123v6/srGC5Rd9tkoDfblciL/5Zw8p8YPg7ZvELla1eKS8BeDMoeFTXREfncWnsmJlfZXdTrMkZXUwskhe/4FCOoLmBMiDo8hXeQsTxkNVu67RsMmnZf8gRji4zUGM+LN3SIVy0KJzvALgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+GHGZ0HLSaiYOM4DVdZXmx2qFCyFcFhMmWziDcnNxA=;
 b=t8aZW1Bv2HFU0ALXODDr+8/1V9JaLj25groMCuIDO8yuYXJN1e8yzIJR13xOkEh2qlOpiYz0I8jLL0+OG1YuLTd7rtRJCv21W2Q3OlP0dFqP2qm95v4imP8YNZ5N0+6SufwrazUJt/1Oh0kHi5Dd9fYH8Q7MSYA+B7VkYkaHVYAKIvlgb5ioICV2YK21h7d7zbZLDp5TJNirzL4dlNimvwP59/v/xL8QFxxVLVCHP93ew5cHO2J644FFW+h9EYcxr/Iit4AVwFkYUIPask7/rO+n1LRciGyaydqTREdHlQ0+P9bD2J9ZHCDTHCJ6K736cWVKrB60YGj6MpsQX+WZdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Mon, 29 Jun
 2026 19:59:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:59:17 +0000
From: Frank.Li@oss.nxp.com
To: Shawn Guo <shawnguo@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: imx: fix device_node refcount leaks in src.c
Date: Mon, 29 Jun 2026 15:59:09 -0400
Message-ID: <178276314320.2442110.12854756898743672312.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0140.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: d1117475-e272-4510-df01-08ded618e6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	saHgthQCD864/UrJ+fo4mPdoImeAKHRZl4VUkFk6pvQ0tmQnF3WtwmmvH3uT+C6mMPuy4iGRbosvNTeSXjdxR8/ySsCkF9TtSIOIyzAuOlnkvnlPlcbDaije15ZkCqR3oXhFeKZqjsUmB/bgOEz2zksUIHC2c62RMjjKanPWqExDYyX00YPXr9qRcj/2+j57CudymdN5dgf5byzMKbHdxJ6kkHaRC0Jm7LnlNHwIjJ+SV+IBdjvudKdJdnhHGU8IwUhfdJMMTYv3LkE4I+4cSyCzsNINiezpVvlKbbuLyaimuPXUzQy4oBkbGEUrGfQjcXpf5qBosNT9ZaiZR8CSnLU667P43S2ZqinUVvZjU8kDYxFUAuKIr7ma4xMXZLKDuMqdRFYTjne9o1VWN0Rra+RGkgp3pfiHaZZDtdZTKNfo2hIHb/1W1cPkK2JjUVXCAjbiUTAHCuWWfZz9g4pe5q51v/MI/ozjvSBnfQ9CLTZZeBHXZ4auo7LB0KdLPd05R5SehX6iwee91nzG+0/cOI2V3v+4lx8TvBjc8WMNl0+XylCv50nnJ8locwFWE48XxFY6ytS41fF5gpeE73YIS+Rs9bhsdh79580RtPYeD5zFRYOQMKL03nPB6XTnl9SLMr11YsQGQlU5lFccljM7DLfemQAh61Cipn3EPEv2D7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGEvc2h5V0hUSzZwTnFqSlZRYStlQ0pvajE4YWw2QWxQMElORXhPQ2lTRTVR?=
 =?utf-8?B?ZTlWd2VvL0NleCtQWjR4WDlmc3h1TVJ5YWl1NG5iT1ZSUzRRbEpiNjkvNEhi?=
 =?utf-8?B?eG1Lc1R0Ym1kS3kxU3FaMDZUeVYvbXdDU25VMVA5aG5XQjgwK2hWSEJudk9p?=
 =?utf-8?B?WUZTeDdWY3A5OStwVU91QkYxUHE5UTlUWVMwb04rUTBORjlHUDZ3ckM0WG1F?=
 =?utf-8?B?VXlPNEI3dU9vVTlVNndKeWdML25hYTZRRnBCS09YeTZKZ3N6K1loRkZrVHhx?=
 =?utf-8?B?dTloWVY3U2hsWk5zV3ErVG4wYjh4Vkd3dlViUkFxQlI3TEpNT0JaS3JMR3Bv?=
 =?utf-8?B?L2JSQ1AzcHlKVFVKTlpPaXNTdnlWdWNWZ1JwanQxa1VQeEZ1aE9DNW1BMkZD?=
 =?utf-8?B?RitPWEJXMnBQNG5qSlkxazIwWVVIS3hNcm1TaTNWeFQwZWhJSS91UkNQVElt?=
 =?utf-8?B?cmFKZzBkWVVUUnd4SWxTaXRpQnFjZ1BiSHo5RTdnQ0VoT0JHOUcwS2pSUHNP?=
 =?utf-8?B?VVhBRTBRZnF6cENZSVlxWHlXNHZGWXlrdWtFRVM2N1BsS3ZRdEdIOGJoNHBO?=
 =?utf-8?B?djNJV3FVWlFCL0lydGtvN1h0clFUNzJjTFh6em1qN3J0aEgyaUFpN0FDMEJV?=
 =?utf-8?B?bHZpSmwrVEZvdjIyVnhQVlFsWC94SHhqVmpXYWhCV1c5czNpR0VCcm9EckJw?=
 =?utf-8?B?TVFFaER1MTJtTnR2UVVZTFNLSFRPTGZpaUJDdVdKUExidTNWNzg0WEZPSHJp?=
 =?utf-8?B?ZHM5S3NxZUU2Q25tNTdNTXdaaUNtVTlQOVlCMTl1SndDYmhrS3cxOUlzM0s5?=
 =?utf-8?B?ZHZvRWl0eUVQSFhZdkJBUW1sbi94NC9EQW83Z1YyK1ZFYjV2eUlHcHUyamFU?=
 =?utf-8?B?bnE3TzM1T29ZVXY1ckdOUU5RUWtQNDJPeS9odmZJZkFlNjhnRW9VL0hPc29S?=
 =?utf-8?B?TjJwbHJXTlU2dWI2eFVhMHp6L2NTK0Z1bzJuWDZOaHlZdTdXeXBDL1dSalV4?=
 =?utf-8?B?OW52Y005WUNjYzRFMTAvQkRDcWFzUG5wVklUaGxjbkhNSkJPcCt6RXR4YURo?=
 =?utf-8?B?a2dtcVB0b25HaUJSWlQ0aWpDdFp4QVhYcnExVlNRMkhOVzg5L1kxZUMvN25B?=
 =?utf-8?B?dVc2WmZHbGdiNzZDdnA5dDRad2NsUmRtenlTL080d1hlVWtqNG5FR3Y1bk9U?=
 =?utf-8?B?SHd1SW9teS9ncnBwMWVKbUtvTE1TT2ZzNDlTajlPOG93UXBmaXNwRnFNdUFI?=
 =?utf-8?B?Y1BGSU8vV0x1MitPZXZDSWpPL0pHVWN6MW9XT0d5alhBY1lkUXhDRmErcFFJ?=
 =?utf-8?B?YVo2bnUxOVpSYmZJQkxRb0prcXBSVVBNVnU5ZmtUandUZWpIZExZUStyTU81?=
 =?utf-8?B?U1JuOG9zNTNES01WN0FDaXVOaTVlSmdIVWVWNi9kTks5eVU0Q3FkSnl4Rlo5?=
 =?utf-8?B?SXkxVFVsRXFxb0d3NkVPV1BkM21KV3d1N3RsajUySzhRUHFzNldLNXk3Rnpk?=
 =?utf-8?B?a2NCTzZjNGM3aDQ4MmRKbllGSkdGR3ZLK0I5NWs0THdQaXdQdUxQM3VTSWdW?=
 =?utf-8?B?K05OdU91OS9pejRJUXB0a0IrdnNGczBmMTNYemp3UFNsbUd1bzdLbnVaSURU?=
 =?utf-8?B?VzVCeExLWnNVUEdFaHhYMHVqRWRrY3NpYVdaOGVJYzRqQ3V4WUF3QnpFZHBO?=
 =?utf-8?B?d0gxaHRkdEdkWGlSSitKQzMvdWJUYWx0QURsTEkxcXpiV2YrSm9KUkZtblRJ?=
 =?utf-8?B?QW55REdoOVZhNUVqWlJTSVJBU2tZb0tSWHBsMnpYSCs3eXhQZ2ttZzNxYlpQ?=
 =?utf-8?B?MUhDUnZXQU1RbUkvdnM1MDZ3bGxtSVppbExTRnpUb1RVSCtqdDJNRGVBOFpv?=
 =?utf-8?B?TUJ6NkZhcC9nc1pjWmV6SFdvR21vQ2dBVTFvNk1EeGVZSUJMQ0FZTGk5TEU0?=
 =?utf-8?B?UTB6TTN1UWFmR0MrSE1VVUx6RzRhMjJCN3k2TzVzU3ZpNjIrNkEyVktWN3hl?=
 =?utf-8?B?amgzS21NODRnQVJ2MmY1VTQ4UzI0aDhtNEU5aDRHKzZtWThPT3lRU2RXVU51?=
 =?utf-8?B?V214ZVBhZW5Qa09yYk1pQVRNSXJZUnYrTzJKa0lYTFJxeDBRSHFEb3E2eGlO?=
 =?utf-8?B?RTYza0ZwUmRUUUUwU0M3MFZ6MThVclpPUjkvVEZLZzkxWUc2MTNyKzBwQTdv?=
 =?utf-8?B?Nk9pM1Y5Nmxsc2w3bHR3ZGZBaHhWa2cyZnM1QkhueEtkQ0FsbmRaUUEwbEJo?=
 =?utf-8?B?SDF2aVl5bDRrN2xseGh6b2ZiWXlYeVBGS2J5Mi83bUtPZHpGMVZmM05mL1M3?=
 =?utf-8?B?aE90UUE0eVJMOWt3aU1wODV0N1Uzb011WnlKVTRLaG1CN3RXa3pTZW5PVVBi?=
 =?utf-8?Q?50ZDzsbMlZSvAfUuGQEkxS3WHrAg7z6YW6lMT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1117475-e272-4510-df01-08ded618e6cb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:59:17.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0wzfKkzG40ocs/eZeApjCN5wcxzimWOtWnohHq1dUYSVwU8S/lZB58Wh2iF349TkaVwYEZMN6FbUIwZTNM+MSqAyVNkjcai56A0Pf7F+17QfVulOKRGWjxfZ0fGfptF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599

From: Frank Li <Frank.Li@nxp.com>


On Wed, 10 Jun 2026 15:06:23 +1000, Weigang He wrote:
> arch/arm/mach-imx/src.c leaks the device_node references taken by
> of_find_compatible_node() in two __init functions: imx_src_init() leaks
> the "fsl,imx51-src" node, and imx7_src_init() leaks the "fsl,imx7d-src"
> and "fsl,imx7d-gpc" nodes (the first one twice, because np is reused for
> the second lookup without a put). of_iomap() does not take ownership of
> the node, so these are one-shot device_node refcount leaks per boot.
> 
> [...]

Applied, thanks!

[1/2] ARM: imx: fix device_node refcount leak in imx_src_init()
      commit: 936407c3563ac745cbbb9953c0cf2472128a22f4
[2/2] ARM: imx: fix device_node refcount leaks in imx7_src_init()
      commit: 3de939b2ac843d56d88e2ab1e1b1f667cba9e1d4

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
