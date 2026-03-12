Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6AC30100D
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298011; cv=fail; b=G2QP7ApslYmk2KbYcnpts+CeXziF+5qHOy6Za12G+eB68gzFu8dtjpCT90h3TEtoEBzAluTOgyKpWQwgH/V9oq249WyTpct6B7Jy7LqX6MjwYLyLSaTQCycBsTijQ0ONUSmgjNCWFdYmYsMr3A9PSjiVWGHQ2TMfBBd1Vm5Apdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298011; c=relaxed/simple;
	bh=CGjxHF88m2+EjxC24y3X6WsJd1H1NGKeiPFX2QBW8aM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J9RyyyINv60X6aiTmcucmNPPtdXM9jZlwGO+CMKueYf+QxSXDeDFa6X8UTY+FYts4b3vy9Y3kdyY3I53kLkDcNnsoxUZ0GrWBUf8CZYc04xBrUxGJQUN/prUUvxqK1xIs8/kw147TQqg10VSKbWmQMTjXq9+HkJqWW+uBpLW9RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lLTGADRI; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lLTGADRI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4gfJIAX8r7h8yNaVz+El7VnT/aUi4A1ibB7RqWFv8rxeAaX53y6FaSAOzdhryYlt0Ujh17p23VDuhIh5p7tBkOfP4ywykKTg4lfqSdiIt8ytQbOMgUm+zA7G62Bde7X/SiJibbqNSSjtxuBhwVhbGQKh5bFpRkhCuK5qhmIAE3f28iXYP28Y54I4hd/rVCQ+p8r8jpFXsI09iZMoi0Bx819oztlAPa0uZu6Vjr/jUXwdRxo/XUpkjAfsZlMHiJpGVqsprLKEzZaItuwdnRsaQFRvIqog+M4Auz1I7xTcQK2xPuDvzaCFpwSPn4JRV83YV2x6ZeOCkTWMLacGOzOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGjxHF88m2+EjxC24y3X6WsJd1H1NGKeiPFX2QBW8aM=;
 b=BLt351b658o+4EiU+Ho2R3o+HiF2YgcS526+d/qYECc5Ut8kqVZPm1jVtl214BfdSX6RcOICHBLEqlbKKVjbn5jLH0MV2/+4RHj73yxFp9A+rr2ZMZ6YsaL08OnFBIsXMhF7Y7CiXayjvEz2bjVxlrejyNpuKATtP1e0shncAou4lkXpE4UzKE1dXrg747N9hc/18QsiLT+aQVnO8wIzcDH3an2i2ZLVGcT2QVNXNUSTy3kVVdIMQ9Hk1xw4E3T54SEhjC6WCw9SN+sqi0WaLOs9e0RZ5p7hYI1UNSCk0W5YUocRTL33lOV6Z3EsWPa6IYZfdYY8FSisC9Z5HOy7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGjxHF88m2+EjxC24y3X6WsJd1H1NGKeiPFX2QBW8aM=;
 b=lLTGADRIa019exAa0maryg+rQHL2nqeG4PgUNFn4sw6eT2mV33YEZsEw+R2tX8g41w4EipmEZOXZwxt7MktgLrP23BwF7o1nsjPscVdPjRQJ/XqRLcNXR6I1qGwajaZO9vbeZq3V66mZZ8UL4F+bXX9z1w726ckE/zedhMbLMtLJKIgOIA+Dhm4gJS7NvCVyv81lCxRvvDPCe4N3x4R1Hl7t0nFACDUze8cTsGsdL+PpA5ebwskMQeI6Art4m6spYw2lzPGSYXcg0SOTbmmNdc3FhvbSlcWznm4W5gZCNHG45zU73FGXqJYiPRa3wKQeazTH9GF1LppUYz7LYFrJtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:46:42 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:46:44 +0000
Message-ID: <09d0151e-6cf5-4425-be86-86f9c5e1447f@oss.nxp.com>
Date: Thu, 12 Mar 2026 08:49:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: imx952-evk: Add PDM microphone sound card
 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-5-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312034912.4007057-5-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::15) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: ea117d63-be11-4f25-7fb6-08de80031fc9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8zSPe0i/03+w73yH1wZIjlknYYAPmV4jOCSb7pxol35Z3VSheLJj87J2nUWzUpWz8mQMC4TxA9DiZjZJhFTisgpD/5pN+fq+yROQkGvGeYrcW8yhRBmGjf5P+iEbLiDwSBvlbbTV6r3SF076HVVn4bSyLIU0zYvWxDV9DXEEerQIltHsp0XYq+AkuFpEFGoRFRWK5MNmAheqChSN1ZPO21v+qb3CfxEtk8gn/Uf7dh0HlQG3XdTXWVR9U4WvkN/C0XcuPeVF8khm+KOOI7dwhIyuS76FQg1OQO4LrY6yy2CYBRT/oLxZ4IbbXspMXvBkj4iddOcT/hwPNwTK2Aa8bPCxvMbYcOey2jtQjFPYisiPxG3HR5X4D7QqdbwQTbb7kitNJrnCLLGTnVWUGnnm9HgPdSJ7PRY+4EOmJ6UB2cnlpgKx/uN11K4/7Wxj5GliKQIBE8KlYrX2b0MkchfDOoetOUZ+2HjTfBntzM8MS5GY9KUXZDArgJ5K0L0nkz0ft0s1xXLPfS4gL1Mf+B9qUWmy5jC4nkcM5Sl/AQJtz/ZDfK3g7cbMXjnzKL1tQhm54K2dqEXl+pU7cd+gVWizGkBqlaRgfg/Gq6BnOyiGfnBBg9zne8qTkt9I2v3NPmzLjZn1Gg4TmcCqUlxQw3YozYHr9n0iHHP0CzeVDnX0PHXVDO1FINSRu48a3FJ6riiyG47ou3ccucDv5U/iwHNvmtXmMvIABTQasLzKI2fRCHMrizrWGSbOt0MaT5/GYkWlbT42a2+mSdbzhWGfAWfjVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0s0T3ZyMHRFZTJSYmkycHpFRXpVeWdQSVFsTDR0djJjbFVIaWlhOS9vbGNZ?=
 =?utf-8?B?eXNiV09nNHJHTmRRLzY3ZVYzaGk5cExUdHVjd0F0NktjR2NjZjNwL21xZXhC?=
 =?utf-8?B?T0gzWWZwTnp6N2lOSFNyRHp6YUJsTDIvTTNWMlNyMVFaRVFiNnVhNFkrRjVz?=
 =?utf-8?B?NFV3MTNIVS9Fd255dlBodHpwZEdzTDBjcVJhUk1FY09sQmcxV2FGVHBXVTQr?=
 =?utf-8?B?R25PbVk3Q1VDdFAvVmp3N1hqbnhUcmY3SDN2YW1ka0dQUHUzdlF5RG5TV29S?=
 =?utf-8?B?WTk0YWUyNlRvRzNLWlZPVVJ0VHNzVkZEczlyOWJ3NUxJQlRKUXI1eTlLQ2xZ?=
 =?utf-8?B?dXZNVWdqWVgrU3BVQTVLUEg0STJhdnNDQU9iaWFxYnZjTVMwL012eFRjMzZJ?=
 =?utf-8?B?cVUvdHpwZzdINHphdEFMWjFNUllHaXRmVGVaWmI5WUJhTGx0NkpNODhXTDdG?=
 =?utf-8?B?Z1FCQ2lFNFdYR0x2RkxKamxsb2Y5UnlRMnNua0F5MW5QUXo1M1RrRTNYQ1ha?=
 =?utf-8?B?TkJHQVBnaXdiMmhjSUs0V3F5bkRRS1l6OERTMlBiT0g2WDhsakU5bEFQYnE0?=
 =?utf-8?B?TXpsL1ltUm9VOGV1bTlCbGZJT0NXSU9VeWg4cnZrK090T2RhN3dDaEtMbzVM?=
 =?utf-8?B?QzVFbmtWWWRzRE4yRUlxUWcxWmY1eUFQTFQ4eTBuMUlHSFZ1WEVIMjN0M2c0?=
 =?utf-8?B?MFVmTUcxNCtuMmU1MGVNOFVJV2FFckV3RjNxR1lkL1ZKR3l4SFF0bS9RaUlE?=
 =?utf-8?B?amxhWXhpNmplVnBzdERvcitpdGxlQzZ1TGZvcTUxUUlNdlNIN21TT0N1VXFD?=
 =?utf-8?B?SzJrSXJCOUViSk9wMFc2OE1kZWsyZUNUWnFKa2RXMkVEUWZQaG5rQWIxQ2NO?=
 =?utf-8?B?THdwSzMrV3B1K0ZyQ2M4c1dSVGp4VGNhNXp4OVpSZmprRGpUOW42bmo3M3kz?=
 =?utf-8?B?ZzlTQ0M2NnFSdjF1elUydnltd2g0OU5LOGNaWkJ3ZXJLSnlpZXFVQWdBMG1q?=
 =?utf-8?B?NEo4Zkpid3ZzTmNPbGFzNlNYMFJoNnlGSjNrRndCcEZZVWc1VDUwYmxpRVMz?=
 =?utf-8?B?QmUyWnBsUGE1WC9ONTMydDBYNU9kU3NOM2pYQWhMY2V6WDlieFVzemkzbDhF?=
 =?utf-8?B?UFhrT05pK1J4WGNTdmRUWlNReEtDVUxJYXYwc1Z4RVRYRm52bnM3V09VeGJw?=
 =?utf-8?B?eEJFLzQzMDVncVJ6TTdRcTMwTXRRdTdOakE4OEEyYnZtd0xIdHhUdVlRenRq?=
 =?utf-8?B?dVZZNDV0eWYvbTlzSnZFYkJYOGdYZ2FPdk4wR0M5MFduZE1BRG9xYWtwSFND?=
 =?utf-8?B?NjQ2L2I0dWdQQWtMYnE5ME5jWjlxZGVKUlhUQUR0b2ZOR0x5d1FvOWNmTkYw?=
 =?utf-8?B?VTdZN29uaitlSk1oRXVsUkU4RkhUUE9MdHk3K2lMQmtRUXptQzNqUFpjTG13?=
 =?utf-8?B?bEtNUG5EVjhsakVzK1pGcTRWUEg5MFZzMEF5Q3hRSUc5aFVBaFQxbmFFSUdo?=
 =?utf-8?B?UWQwdG9HTmtCU2F1Yk9WcW1kdFZGQUVUdmc0ZURVN214WFd4ZEhsMitZaTlS?=
 =?utf-8?B?cWNDMm9wRGlncjJETEtMZ0JQTzBRdVpQKyttNG9aaFJHcXc1bUdyNDJGRGcy?=
 =?utf-8?B?SUxEeUt3NG10bGhRZEJRU1FmYkc1TCtCdFdieGNSVGpXc2tPZTM3bVhWbDB1?=
 =?utf-8?B?b1R3NC9vemYwY2ZzcG1tTndsWm9YNkw1eUU0S05pNkowaGJMZjBvT0tZY2J2?=
 =?utf-8?B?VEkydEt4YlgyNEV5bEVKSWxLczM3eUlVK09jVkx3OU5OZVNPSXdxajVXZVJX?=
 =?utf-8?B?aTI3VGRlTndLTHdMd0JKUE9TbVpkaXlmbWZYc0hZQlZnMWVKN3NHY0ZkTUF6?=
 =?utf-8?B?OFg2Y09vbE9saG91SnRVaVZNRlVBeXlVY0xjWGVsTGdrTkNxM3FMNzYwYlhG?=
 =?utf-8?B?a2lFazlCTUs1VGFwZm1ZZ0dCV015azhkS2l2bktHbW9obm1TL2hnUDRmWGJ6?=
 =?utf-8?B?VkIvWitXSm5Sb0x0WEhuNmFva2NFUDl1WTJvNEZlL2tHeWJYVnpicGdjQ1hu?=
 =?utf-8?B?eEx6dEQyaE1sY01qbEtHTGsxUGpPTmZYUURMbDR3NTErOGpkbWJDcXR5Y1Ro?=
 =?utf-8?B?YlJEZEpFUkpacjBQK0YyWFlXL1ZBTlArc0Y3b2tHSzZNeUhNbzhEeEVDdStV?=
 =?utf-8?B?b1RpTHpqTUNmNytEbnNFVm9ONTZrVmwwRTQxUXJRdlE2YmtmMWl6dmdBRUZa?=
 =?utf-8?B?ODNDbTEzVVBEbnhDUHRCbVROSVRqZ3BscFg1Y2lJb0pTTTJuZHhiQ3R6WndF?=
 =?utf-8?B?M0ZJbHVoNVBQMUtHSUFCWVozQlN2M0NGRDBCeWhvelYzK3V4TFhIUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea117d63-be11-4f25-7fb6-08de80031fc9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:46:44.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/pNpHsXlKAgZ54ZuR1WnxvT1Y1L3x/MH4NX/l6ss2AYmAyjFpJhcPxluCZ03pL6FIvsLf9Cox3ltzhmZR1kDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

On 3/12/26 05:49, Shengjiu Wang wrote:
> Add PDM micphone sound card support, configure the pinmux.
>
> This sound card supports recording sound from PDM microphone
> and convert the PDM format data to PCM data.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


