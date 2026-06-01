Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCBA3DC4C9
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333589; cv=fail; b=a54kAKawRpM33Eyw0BufiJKS1kxQc5E1xFEMYvIypT5liwoxC8SHX4KfeJS4UHdHnBkMRIgyA9k25kiBlFN0RLnjK/XHgFj56Ky6/QvOj5/6KXPixvggOFGd0mT8xhhqLMO4Aka9axRmwbvqqoGuNAca/i/OZYxhyfrje4DVbvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333589; c=relaxed/simple;
	bh=pwM+r2iA9IAIznVzvd8ffDRy98GEDFOwKS9E7HYMLMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dJkEUimyZ3k/+2Ng4NRGxgVaxSrNnjfLSJAMQE3j+TEgfDLKENb78oU+h9k0OTxNz20SYRw36y3RrVEub/Q71AR8dVYJ7E2S6C+Rpm78v900DB+NRKk0mm/X7yWjKfXdFCrJumodjwTBzTfCGBpgFZa93wZWQk6IBQ5s+5icixU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YdfgrdMK; arc=fail smtp.client-ip=52.101.72.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YdfgrdMK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gqh7E8BftGiwJ/v+w8bGjXrIq/XXfJ/k+7sY5DgMGPdK5aACvOQPnBPkrYngosBSY+175phUK2PFe0aUh4WuzVaqvpF+NPg0cVsQ+nA7wS+zbUbzVkJvguorh/WkcA7W+Eif9SEqZrnPz1TAuVb1cSAig6QhtV+1diiAponagE0lYaW7lwO+X8rt+BELazUH9ShnraWdQaSQGLx8J8NqzeuBdZ47tLUELiy8AeIvEm+DqM1X2wVQRyPuBKg2t2Sl/8p4Y6nS3FtbNXlKETqmuURROz6m7tTTDlWdWBYgPSKaB/4lOJu3DC7P9qTmoQdA4+O2jK1FjK3rnhvVZH9AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8n8tUsoYoRoZW9s8YHYAj94X4aFhzicuG85N7Aedio=;
 b=T93HbGJrHFtitftEd/3RgLGgBfucbF9YR2X9dj1oV8IWTXWjXSCjHh2Xtm+reRr2RgDGbGw/h7+dM9BByCKVkXm9Qoljtlk6ZtekJ1yC1xbCGtWPb1tokZZAgqARRVKCSEiT+fx2r+1VAspASXwkCLFYMedoaV9TYWKae+vSyFtVI0AlrRksO0aJup6sV620jXHZKB5g5ifH6eVxvKc8MeeHYVYKa/whpiq5WeR/ImL9xoCKaY8ObMZhQoWfIqTeUyNsFcxzydXxuKJ0pmud9C7hXzNCWg/4bFPR8iO8pCMvTuA57Zl0Z8852+iyQ+/3v8O98CK0DigNvt9V9U8X6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8n8tUsoYoRoZW9s8YHYAj94X4aFhzicuG85N7Aedio=;
 b=YdfgrdMKgbuAQRism9XHm/4qpNG7IDYRda4PLG9NkEdwSFT/JvmUqaiHaPR367BlYvIMc2/U2H9WspBnVWeQfz9AAKUlA4sCqutDQTBJ54i9uII9ax5wV/ZhCdEC9PZ4RHsOYrkL4fHhOJjzy/UMrmDOi16cEl1S1rTvhgvmlsgT2xmTjj9YGbmc70i0kimeSt+giYlatWYCkEHP9ztP3yuJQzfxWeRMj8453u+eqRbWI4v5wjledcq0j5JafVpEC0yuJuJSsuJFCDPJJL9QDGTVuKTDaL6VghKhfC5xhlo5z8rX/6hXENn5Xzj7msdFFY07zVuALLu4JM4DHI3tMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6841.eurprd04.prod.outlook.com (2603:10a6:10:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Mon, 1 Jun 2026
 17:06:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 17:06:24 +0000
From: Frank.Li@oss.nxp.com
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v2 0/1] add PIT DTS support for S32G2/S32G3 SoCs
Date: Mon,  1 Jun 2026 13:06:17 -0400
Message-ID: <178033348063.32569.11863761918539278765.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 7863ab7d-ef58-474f-c922-08dec0001c1d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 UjTcZoZ52Y1KM7tPXs09GdeXgBwRs3UrG3gt+CHSKFN8Ipi9yxdYUDNRiVi7lNUaesVl7fd/xtER+InSwNlFG/cycRUKi0QtYWNTTiDyuF6X/lyQ78PWFz0sv9Zsyea6hSJ7KRbCMIWtvssAJ7+QQCnN8wlmGHgkJni6FGIxU9hkuYGw27I0cyduVI6/V5R2/dEJBUE4KVOT8jtIj1b2YIdmZhgaQy6Mcp90qT3DMkQuAzH0soya1aXZLjfI3Fy7BN2hPjY7L1dwK9UIxXNDbyy+ejqBEJqFUWwDihQgbNJdX/5rBfteZQoBW2QCVRUOVSxreJGLe8QH9Wougu6Sc4RCawjYmJ2RjM6r2SlecoV300azS+gM2ClHWHVKjCY/ptmDygQAK7FdV2N4PX6YoALtJ3newGsLecPY5rvzuTerYQYcEFM2UHMcb91uFtDYJIrsdVm2SzFJ0FVtG0bdHxUezt3qVm1joudBPOCLwzsM3z8amRRdhbJmTQv6eLw9M+SKD6kFSOGbyqVsH4lZ5KJk8u+W9yzJVjDgQOkrB55h44ub2V6kzIOxtON2X7Kr5HL5V0SfA04wAWqnC+ndaoQDRSCz+pN7fs1AveWdN5AqSx+VB+DSjM1v7St+yt+5YENJAVUq5jSKQe3PEZdA/FAALIVHsYFLiahQMH04ZpUkuScJcikeYOMBKy2GKxUe
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MWh1TFNmRVkyUWduKzRqWGdMSDhCdERpaUFkK2l6bGxIVnd5T1ZnM1dYcjJl?=
 =?utf-8?B?SUNYRGJURW4rNktMcWRlbm1NcW5aMWhlNERHdEZ4V3VpdkJqNldwMXNFSGd1?=
 =?utf-8?B?Z0cvS2lIRGtFOFpkYytSQjlnR0ZaMm04OWgvUnNMbnFpQnllb1hiYlBBWmpv?=
 =?utf-8?B?VWJIYi9Ra1lIbFhyNXdVZEFYZ2dHRll5QXZZMFRIai9pbjJJOCs4N3JCKzJr?=
 =?utf-8?B?RWF5MWFKK2hmTzhvdFM1MldUcUMzd2dRZ1dhOFV0YkxxRnFqMW4rdEpsYU1F?=
 =?utf-8?B?ZnRGZzBCaTQzc1RQakhsL2ZXQS9ONkpvRzV0V0JGOFZpN1ZRWE12RHNQOXls?=
 =?utf-8?B?L1FsbUtSZWtOZkFxR1E4SzhlNysyMVpmTUdxN2tvZGJoR0llUFhzTUl3UTE1?=
 =?utf-8?B?VWg4aWVSQU9pNk9TbU1OM29JMGwzbnBEU1dkbjdGc21lQkJ5c25CNHBZdVMr?=
 =?utf-8?B?aE1vWEtpNlp1Ukw5UXFuUjdwcmxoM2xBemNlbEFFS0ZKNllDdXlWQ2IyazlL?=
 =?utf-8?B?Sm5BTC9zTHMzSkFnTExIaFB6M21nMHdsNHpXMWVsem15WDBKL3lxVjIxc1BP?=
 =?utf-8?B?dEE4dllBRlQvTTkwWCtEOW96enNTWFlnYi9XZUpKNHp0clA2N05uZjdXd2VR?=
 =?utf-8?B?UTJ0ckdyd0dTLzhVbkdyVmo3NWVZcFIrYjdNbDg2SGhMSmJmRHY2bDBCeGJM?=
 =?utf-8?B?R1pFY1pKVHo4ZmwvNGNTWDkvS2JRazA5QnRzVGNWcVJGdTVDZkV1ZXFBUE9i?=
 =?utf-8?B?SVVLbHNLZjdFVmdxKzJTWE4zVjJ6VHlkT3dlZElkZFFpS3FadWtPeHZ0bUtr?=
 =?utf-8?B?a01DUXdTSkdDL3FxQlRkbzFNQkhBa2xkL3FYSStlWGVReGdPbVVmUEY4MjNC?=
 =?utf-8?B?V0k1dHJ1NDNBRmduZ3JJeVI2dFVXUkp5OWVDeWRYL0pwWWxFUHNtWEVab2Zh?=
 =?utf-8?B?R0x1S1pGbE1sVjIzRHNlVHVoUHVmWmhQSlZmbzdlS2JhSmMzY2h3UVNBMTY3?=
 =?utf-8?B?bE1JUmJQQ3MrS0Fpa2J0WnBnU2pML3g5akt4a0tUMWt2MnZZTHlLMjREZEZ3?=
 =?utf-8?B?WXd2aUVjM21DNmJ1SitTYnl1WGpUZ0R2T3QzZWNwTUs2ZVZHRjlGM3J3MXJW?=
 =?utf-8?B?L0JtYW81WW9UYlo0NytmVDVDMEZMTlMvRUI4S0NFN0UyOE9sWUtTd2d3aDg5?=
 =?utf-8?B?THMwYWp4ZHkwQWRVRFp4R0F2RDhSdTJWWFowV2FPUzIvWGcvMTQyTlpMQllo?=
 =?utf-8?B?V3Fjd1NQNDNKQzFjeWRQcWpscm5nWUZkUExBTC90VHZTTVRrNkNtUVYyeHhZ?=
 =?utf-8?B?b250Y3lOR3NMM2VVR01Dc0hKR2g1N1ZHSldvdXlLUUNlS3R5MWlidzJLTXhv?=
 =?utf-8?B?NjdEckhIMzErVlpyM2hqOTRIUXFobkpsdWxMZEhpQmJwWTREamZUTElTN1dz?=
 =?utf-8?B?dHE2dStLZmhwUWpLUmlRQzNXN1JBd0EydEFkczd2c1FaNkJFMkxwaERNOU5F?=
 =?utf-8?B?Q3dFYStGZ1dyS1dBYkdpeXRIMUFVdXI4SWF3dmZUOWg2b1h1R0FXVW5ySXJK?=
 =?utf-8?B?L0taOXMyME5rSkQ5MVJQVFQ2R2t3TGNlbW1wRUlyYkViOU0vek80YmZORERR?=
 =?utf-8?B?U0NTbDc2ZGVkRzFFVTUvMmg3OERwVWY3Q0hBUEl3MGEwU3IwZUVhRHpqUnNR?=
 =?utf-8?B?ZzlMM2lWSTUyMzFTT1ZlSzBWZnluRWNiZnpmaTNZL3NBaGVxRlcrNSsybjBa?=
 =?utf-8?B?TGpxNlQvL3hwTWN2UnlYSGlJcVBUaUFOVlozcU94UStJN2RxZjZRSjdvMkZT?=
 =?utf-8?B?Z3RUc09ZWmhjMHNTVE5yYWkxRHB3RjRwcWwxWUhVRjlXbmE5SC9RWGRQdnZR?=
 =?utf-8?B?eWVlZjVndXFlcUVYTmlPeE9sbWlwTGQvYVh0QVJNcFl2VU13eVRlTlFDRWo4?=
 =?utf-8?B?WW5kYVdKZXYvYWV1aVVqVkV2YkxQVXR3QlQ1N3hISjR1V2t1cUdzMUdmdmZh?=
 =?utf-8?B?OC9sN2JXZkQ2aGVMOU4yV0J0OWJyeUYreTJ4aGdLSWw0ejdGU05IUXIvejhK?=
 =?utf-8?B?UWxON0RmVVd4NzZSVGFXSjJLNDczelVGdFZ2d2txVENHcENKWVkzVk93VTRa?=
 =?utf-8?B?WGdYaWVIYlFEeVg1K3cxTHFJOFBqeld3U3VmRU9FcE80azhUWkZzd2xRUU81?=
 =?utf-8?B?S0lwRnBENVFwZVdrN3B4b2d5QlFaTjlhTzVXUkVXUmhMZ2RKSG15QnhiUGpx?=
 =?utf-8?B?bVJ3ZXVUN3loekxTOGpQMlc0YmQzZktNZUlidjBZNFFkcVJVZS8zVElaRW5W?=
 =?utf-8?B?OGNaKzcrZnAwY1d0amlRc3p6SFNzQnBWc2hLOG1jdUhOb2ovYUF1VDdRajkv?=
 =?utf-8?Q?rDm59d/FvyCmp7QsyBF2qd4TUY4OgeiwpXEVE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7863ab7d-ef58-474f-c922-08dec0001c1d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:06:24.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7kSOOfKLulQIusOngOgOt3EOMpDOB62TpzhQlZM4bvONtFsm8nN1mQ0y2sy+n7JfxW1GBiNyna0BmnETg2B6aM4NzGecnRbrpcBHnjauO7S/oRBUigH1OJ5CBkEdN+J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6841

From: Frank Li <Frank.Li@nxp.com>


On Mon, 18 May 2026 08:35:46 +0200, Khristine Andreea Barbulescu wrote:
> This patchset aims to add one change to the S32G2/S32G3 dtsi support:
> - Add PIT dts support for S32G SoC based boards
>
> v2 -> v1:
> - Drop the redundant PIT example from the binding
>
> Khristine Andreea Barbulescu (1):
>   arm64: dts: s32g: add PIT support for s32g2 and s32g3
>
> [...]

Applied, thanks!

[1/1] arm64: dts: s32g: add PIT support for s32g2 and s32g3
      commit: bb5a85e485e68f17e6b20961ce2868e7aa7f1799

Update node name to timer@ from pit@

Best regards,
--
Frank Li <Frank.Li@nxp.com>
