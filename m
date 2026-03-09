Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB03E5EE8
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075086; cv=fail; b=b0bmGGPJfVEvsusPwn6RPe7CwVOOPsb+gNgjCTiGt6nsAHQqoKjeg2Eh5JHOTmNT/n23bMZOH2iW3GKMUkCgCaViYWKKqEJzRsDT1ib6ikFocSCx71aqWWkkrSmWXKzM8qMLHwsoQ5Am1DPQ/wXXRWOuoBH8hXoMi+CTqM7UbM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075086; c=relaxed/simple;
	bh=9zpXYsoarbyr13ThMyAtrQ77D475gNcqONYDp6ixbYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+D9KRkp1bcc0gV5EYga04O/JH3Wrdf+zYIsOhIfnvFYdvUHxOa4bKctB8Pp86yzWjE+8TKRdz0DgAHwo4wO+YHTOHtjGCZiE+qWidB9EUSlk1CP2qOqtDv+iQ7TLKQvBZOMPivAFFk4eDOk5SpGQWLQdMfGowrtoNVlhAIbUS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EY9p1+C8; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EY9p1+C8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/t9bc38KujbMCOwka+1ss6gNf97jlcbkhqwpzwOxr3uNUNitHLaUbzFZd51aagjNIQjklIOrUqX4555QWyRUGxqWNPIWBzyCnMJIlZKbjyaZWAQa25pBQ7q6h1A6Ikpwt2HZsvxKqSU9Rty53956LMJ9+JE5Bta99u3yGiaQ4LNS9arJRWtYWOQBzqCRNLZ8dScdf2r2zSoOLEYuVXteUJHwC8PZEvIdzByoy8Ebzg92NTgcCcvycgY8QvdXDt/kp3ikL3YyzBI28eOYq3K00azLuhWqiLt/ljsNN4wIfnNoKCeDAFqeTmn2RmgfX9dRCy2/m0zv+I4LU4uLr9LLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hglg7GU3RWzI8/D34BNTE3eKa5p1+1rNWdMGIQeCDOs=;
 b=Nf2HtGfGQZANDmnGI491V8CeJz5WfVhq/9yfT2DIC4/NOC9rPizaDD8DRhS09aaeCXXZXd+NY8tWQ5o9mpVYfhthvuAzD5feYn3t6kg2JHjtO0Cp7TNUgU1ELJ6qcs1RpV0SzvaZujg39wMHOqYiBrdyQAPrUs5GODe8Cqi4JWWf6Wv7dcAj2q7eitJ/NyWbYroYe3IXB1y5ywv9QRgPJHUBMpSsqEfz2eOdSuUyUOMLHyl3mLxMz1VrC0+WaSn5yyTV4mqFGT41r2YZQ3XDUcD15it9zQi0j75f7YwhpVtfArB1UBHc9txF6dhgcAKUhCJ3U8rHhuOILU18JGzPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hglg7GU3RWzI8/D34BNTE3eKa5p1+1rNWdMGIQeCDOs=;
 b=EY9p1+C8yD0QzfU5ejM+tKZ6azNBRWGVwn7KJ5RwWcgvZOhFKn1Aih9981Y4EvggzwbpGrnroz+18avqekS8T9wf94FqhY52LtHDOkLwponwf14ScMjIM4eiic6n285E/EzRnLWvFsgnJbnFb3nRFrvaOdQIXKgPanadvo0AIfp2dEsCPTQcLF2P2YqAV5aHDngxoGCSEhyj4mGuDu2tUCUOJA/YsNbuzkHdSD+ceTENscXbUqcTbgqWNLXrt+HmHZuMtyju1k9vNyAfyy6xKOyVk5qJnQqsdKqIpEjl7579ptKAjCv/nfxdL+pp42rwRJiIpDZzViz9Z7JldFeEsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12392.eurprd04.prod.outlook.com (2603:10a6:150:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 16:51:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 16:51:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Mon,  9 Mar 2026 12:50:56 -0400
Message-ID: <177307502164.1721116.3204716549576546635.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
References: <20260226130223.613325-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:510:4::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12392:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f153a3c-5a35-4714-f694-08de7dfc143d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	nGXsDNZ0KTbGIygQbfIc8bvz+3e62TawzIXxjDMYLY00HboDltkCE1UZgpwiW9TR4IsnBzw9D7x9TpCRcZ1HB1Nlg2tjmymmOquielEa/1OmuRJybFt5g8+t9lx9EjyrTZK0O9NFyZYzKj3j/4qyrbiY+Z0x05CjivkAN42KdcWhtljrjWYgwyvCQVR741o2/aO8rLRDPZWl0caq/wQ5gm+3BiYHvFmwVGCDY/VRAcO3G6hSQd58drXsTtCnn6S8eykrXN7w3HKB7luXYWePPOq+7n8VaD6wLVmzUZh0hZ8a72wd5jcn50Vlg1LLdFF4z7waCf+qPIKeZmvdWnjxLVqDgoEmmw4ucU4jCrMNskZ/DMtljffN+HapQyTV0wDCGCzjm0ZPHuEE2q2+Nwg491l+sbwyph180bSSZd27+MfDCAompvQg/bIgHGx8f62ZFf4h7m9cI3rx50/pROLrlcnguJztrysd9/aM/OusBsWtI/9a22BA2YDJAIdrLEEQxd59qKR41jdO114Xh1QbRrTKpcgWWXJO0obbE2DyUTsp117TmTUJBJXfoeg95hQoHOu9alqEl6UUHudumReIqRvJE8V1xqAjWqhDuLLiV2X56iu5YqpSDUm0IHEe4E60vrJT2r+j/n7fOQK/GF9gK9+9oKmwAbou8kT4ZqubzITJFT7wt86eavzF0BPAJGuG0hnXXvYF5hLKDsvYTFnE9mo59VIVz1xmcPngAWCHeqf5Dm8q8pDio18yboDRiczaOL9NpM5VWmqsKuvDfE406zuSXrJGyDJ9wdNK1GKXx5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZHN3J0T014THNiRUppZDNhQW82SU5jU1I4TU45RGNYRE5YRUFxNWV5ZGpt?=
 =?utf-8?B?V2JrbUtPT29YY050VTk4WjdaWldaZ1N2MjVicXNBZmxiUThjbm5VaFJxUmZn?=
 =?utf-8?B?TzVZaHFiWnRsS05uVW5mYlRHZVZaM2lEcVdHY2krTDNQblU3WEVqQVR2K1JQ?=
 =?utf-8?B?YmtwRlJFWkZJd1AreXkydTNNM2tpSHRJWERoa0tDekpYcnM1eEt4UnhSTmRo?=
 =?utf-8?B?NlFOR01zMUl6ZUJYZk9RQlRya0xMK0J2QXVqZUJEMWZMbnM1dlF5bDY0czBX?=
 =?utf-8?B?dTBPUUQvdXRMTUhDZm5SVXlhMDE0emNOdEUxTCtsS1FreXhQTDNaK3RrbjJ1?=
 =?utf-8?B?UzY3aHNUVUZML0p4TnFWWHZmYzNDVHJxLzBjYW9DZUo0L0pkUUVNYVJoTGho?=
 =?utf-8?B?aHliNDNrYnRHWFR6blpkWnRWUlpqendhVENVV2NWM2txeWg2MW1ZcGJ6T1lZ?=
 =?utf-8?B?ZExJOGZ1QkpxbGcxM3VKcWlGdXdrRjlKVnhZYVNITVM5c0h1cWFBYUtkYStE?=
 =?utf-8?B?Z2VTUkltY2Y1UTdQZlBmRVVwUzkxZGZaQjNFdWJSaDJmTWp6d3Jra2kzRnFT?=
 =?utf-8?B?OUFPVzdiUWNlclc0YURRUHNVcWhUMVdvTHA0RVNxd1JpeStHY1VCSUMxR2w4?=
 =?utf-8?B?VTBCVzRscHoyb0x6TVd1V01UQVM2cWt4dmVra21QaXU5ZnJXd2VrUXp1SmVI?=
 =?utf-8?B?UXhYcFQwQXFiUEpMZzd1S3JVcUo5Tll2dUVzbnlyVEtuZU1objhWQmFVZUNv?=
 =?utf-8?B?NW9TZ2h1UENybENtTFM5ZC9hS0ExYWtzcEFqbldVMS9UcEozUWRxUS9IdmRy?=
 =?utf-8?B?QUpyMDVnaE9jNVJnUlQ5QldBZGhSdUV5WGVLc005Vk9oREFNMFNKZkJXVStp?=
 =?utf-8?B?QUk2R3VZdWxweE43ZDhTYzJ0RCtWTm1PNGpLem9TSHBmWkJKNEgrZnFCdDVn?=
 =?utf-8?B?Q05WTWZYWUgrbG55OXZZQmFoT0dWZUgyamNHWklEWWIyZGVkZFhMZDlmMWN1?=
 =?utf-8?B?WXJvckNzVDZScDFuRUJDYzZrQ1V4YlVSbmU4MGgyQ2tROFZoRVFFdWx5d3hM?=
 =?utf-8?B?OXV1R28yUlBDcmJtQW9maFN2T3RkbUp0d2dVQjByUG9yN0o2S21iOHNTLzF1?=
 =?utf-8?B?WnJFbFNRckhVV3YzZ1NKalUwYkd3VDgyanpMQ0pjNFcydzlQQkFjQmEyVDQ0?=
 =?utf-8?B?MnFzT3I2cFUrcnNLMUhybWlFbmo1SlBqWG1NOXM5UmdoSXhiVDFLdnowVWhr?=
 =?utf-8?B?ei82cTJGd3lOR1NBV1ZzV2k0UjZMRnowaEd2WmRyYmRvbWhaRnZSR2RUQ29z?=
 =?utf-8?B?UXc2NS9GWmFYRGxSUnN2WmowbWRyNGxQMUJCM3FNTGZZam9WOVZBUXFqaGtx?=
 =?utf-8?B?U3NVdnRJdSs5a1BRRHhlSzhGdTIwUUZoaTlxWmp4aG94cXRTWXVneGExeGlZ?=
 =?utf-8?B?OStvVjZtTlc3ZlhiSVZZMEVFTlYzNThva0U0OEg3Tk11TkxENENLd0Z4eHlt?=
 =?utf-8?B?V2NXWWE0S2Y1RGdNMDhhdUZXS2xhRGlNSWp3cDgwOGYvSWg2RXVMaGZ5bHl6?=
 =?utf-8?B?Qm9PY202OE5uT2t3bFhSbGVjc1B0ekhGMU5kS3YwYUExbURxcmxjK0VOTWJH?=
 =?utf-8?B?WXg4YUk2QmladG41TkcyZ2Z2aThsd1AxbXlxdDJ0K1diQThXMFBBckxtOFNK?=
 =?utf-8?B?cU8xZmxVV1cwN2NTb3M2RWJIWndYSFNSQnlLTmw3UXp5YWRiVHQxalNKZ2to?=
 =?utf-8?B?b2t2K3hlYk8yeEhUcjNQQkRwYjlPSVB5S2N4T25hZVB1Wm1rd0tBbjVMZVo0?=
 =?utf-8?B?OGQ0ZmVFaE9lQ2VhOEtKVGJ4UFhWL0FGNmNxQWF0aE00Wi8zZzFaMll4RkhX?=
 =?utf-8?B?UmJHUGNYR0oyd2ZCZzBWM3c1VzREZzVja0VPdVJNYk5ESHNVSGYrM2lSWmJM?=
 =?utf-8?B?QXQ1dEJoelhvcktRY3VHQTA5emxpWEMwZ25Vck5hN2ZWQU1NalFVZ1FSSUlY?=
 =?utf-8?B?NzVxVUoxcm00VlZkTUN1bjNiQUNKbmx0RTBFZ2FOY3F0VGNaZiszZTd6QTl2?=
 =?utf-8?B?a1V1aG9YYTdjQjEzQTA1QVFiVitycHNJK1RnQjROQWtBeTd2dDdXWHpxZ0VP?=
 =?utf-8?B?TEVQRi9XaHZJdnRnTEw3STdvWDlOOUcwYk9tODArQ0JOd1I2emxYNUh2K1V1?=
 =?utf-8?B?aytyNzhLSkY5RmVHRU9jT2pqTGVxS0RiWmovazYzcHp0TXJNZDVlWFYwV3pQ?=
 =?utf-8?B?QjN5Z1YvL2VlZHI5OGtyYnpkR2F3UHNlek5GVUZIaDdxQ1drOU51MEllSUt4?=
 =?utf-8?B?bXlJbFVPdkEzTzBKbXlEdVdKaGFrVzBMMzFSU2ppK2xoUm1iK29yUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f153a3c-5a35-4714-f694-08de7dfc143d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:51:16.1926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9EIUyQ+geRignGKiJVZT5dclSl0LCHe9VbBYrlyDcLF9Oj7EcL8PnHGpyLZBg85Fi24joPfOrIqAJTfQu3r7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12392


On Thu, 26 Feb 2026 14:02:20 +0100, Alexander Stein wrote:
> The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
> ethernet controller which can support up to five queues. Configure
> these queues in the same manor as done on the imx8mp-evk.
> 
> Setting DMA to threas mode is necessary to prevent FIFO overflows, see
> commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
> on eqos")
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
      commit: c13e7a4c4a26ce6bcb4dcf0714f657a1cf65fc40
[2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
      commit: 1b88aef16b819ccdc314b099d1a3f1931c7710f0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
