Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E82E736A
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719918; cv=fail; b=foLOBDlro3pIoF3aqPDWuuCgewt1YLwPYaFfPKUwyBSjrPzr/03OXcCyXP7E/IN1gTijMx8EF+sBLQ/4DK6SU/eazxRstZceAabhEz9WRnuTLv8l8rqmk+uUS2KZnUEXa0g6xKGMnApYvOpzm/wEeOakaBva81UoH1diJT2v9nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719918; c=relaxed/simple;
	bh=d3hfA0xLnQFxLhs6gFv4fWTjWxqjcoqXxZa2S55IxlM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=P9DK5HTSSIOysB8KYSG21oOhAHghzrZmEIt4Ed8oPbvevF2LiunCGEIXx5NDcQK0+gXY8FEz+aeznwA1aRoNDXr68KSMKL+lwqsBlttQ9CBvVWcW4f/u/fttIwTEu19arG2hvEspG/P1nLL+ZcNgz4wmEUj93LEne+nZY9LvAtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O+SjqxOZ; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O+SjqxOZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYBBRWJ5UaUPxsVcxnvjNFQ9XcpMyRcBo0HWHY8nqAFmOYbxUzmJGjXXoc4NL4zvlVShusOdGeQWP0w1qdRTv6FS8XwVAH16WDh8NWiu5JFcyj0HAvbE62uJfCgkDbzgErlzlOkxZVgBQwYRFhK99Iookiks1kX5TbM/becAKKomC1kIrhNwSmXghtfsHQyyCZR0xoOd04sLQkehvMq1Ijk4+dcNGMCdjYI2tZH5l5e97x1eCCbdWfpg7pwy2uElz9nhbOBt0YLzohzIwiuQuIyY+NFUrvyK63ILm6/AxiftCga+SlDo3lbuBQvFWrzeAB0Nz9lW/CZDS3oSCYl97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iUmIm0HJXR1gXTS9762PZq3INZrbl89O0vFzcPEzlw=;
 b=wmYDwcKHLpyFKNNZVykO1SRSt228bAModJqkJld6vMHbR3t6RTOgsN6vx7PSmFQOSe5272V+py0Hd4Yd9gfHNHFkmU5RLe7TmbMjH41MHdJR8+mLeza8uGkNWb1R/axMW8KrXxiIaulIJopRLHYm3chWNmlM6Pyhs29T/yP39qel+nUcd8lD730SgrEM4N+tLrnDSRAu/izYeywr2pqLR+5dfCOnVrj+HkON96S1l/ciQ7wHzoFUmEWAzqO5lduOfeBgeYLE5beFYr+lPPwokPyU8C17IXR3owRClOIaZrPuyzNaW8Zq3PjsTezYmRpYQlt/e/bwJVkleWS7YdDWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iUmIm0HJXR1gXTS9762PZq3INZrbl89O0vFzcPEzlw=;
 b=O+SjqxOZSq4byL+In79O3z0Q1/CJoLDpdnkWOWbBubvRdhPGNW9Xab/r+yyYTfm/zVD+W1tEEKSCuyzTvr4KvGYkY6QXgvkJIftxqtAuzA8VXXEi7eRg5oD/Hv7ro+sp7Po8v8lKAVH4DOrUlAMit8Ka51bPwl1GbwITiLgEUlXoBBM3D9C68nCqvzjBGvtQsuqM20BNThCwg7oQOHXYAyh8J/G160poTbhA42knASwznFuGfunLF6SnQ6o3UrEASnpG1iuU9ENJM2WAMMqon21P3mz3+++oJ26uxes+3U6qlMc4EGiNYX5Co8UfvimrBbHKXkW5oC78kK4Ujx86sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:51:53 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:51:53 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/5] media: imx8-isi: Add i.MX952 ISI support
Date: Wed, 26 Aug 2026 12:55:41 +0800
Message-Id: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1xjmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NzXaCK+MzcCktTI10zs+REM9M0yyQzYwsloIaCotS0zAqwYdGxtbU
 A6uPCeVwAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=2158;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=d3hfA0xLnQFxLhs6gFv4fWTjWxqjcoqXxZa2S55IxlM=;
 b=zWYennDVz2RtDtJo1QAZbzdFoDSQV6g1wcnRED2tVaC8zRdACljAuUjV8o4GMbBXIuGLIIVwi
 JokSeo3d30tBdbmUWwjagaQ+Mdt/97/X9rW9287PSDcY41lXy0lJYKg
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 756a54f9-5f58-4883-ceb4-08df032dbf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|3023799007|10067099003|56012099006|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Sgk+9K17pn797WodBgx2QfV7diDZd1EXIAvE53SYG18s/HyCPu8agMfV6cbLFYY2wqekBlJ77rqDOdmf1on6RDagNTlYgOBKBTUQ5nbNdDvNSthj9Elu3j6mre7QD1E7aEOdtSezTnNZ7TDR2FCIlatR8m+0mUV9IQ6nvA2jDz0mlJnTBGf7GGkQyG2o1IfgWgv/K5rwy++Epr1/w0okidyqDw+/yZ78dGEcZ6/fSE5r8xu2Fyyj+IfXpGp2Epx4iB9twlkCL1pqU2vJCZgk/GBkVBH959ZlhXVRACVvOdl5BfhLr6/tQX/4RYNSF5Q4V2LlIkrDjP21kd9DnhbEACGmnQEFZh8iw/eFDN1WbSsu0ZPCQCJzRWFqUZdDu+uCIZjuZE0qA34pvenkjMDwzSiglhkuPQ1HX5HAg2kMNPmzbO8GyxhIvVuFjCAjtAOZ9umkZ9+0nCOZ6GsApAzpfioHSGVejIZH/watucFvIfTDm+9ICceZH6Wej2Nhmy+1jcSrOWqlRSAqPAz31dfP8ICsHs4pSYDEFEDX7WiRVkt67AQXon0h03HgcmrOmn9T/ahCadhfQaIqf5RnX613NwYsEps+ZKUHeFZkTVfueSMoBwfntccYicTe5ds4F2F7vj3hj6PN1PcQgKXj0wO/Cz3UBe7fsGjoijuMsEFxNoPZZBQhmCR66yNBClBAaGyVYvvC9I2RXfi1QlWj0nHRFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2JRQkhzM1FodXRwaDNOb0NUNTFpNlVXc3ZOcmlCbXM4L2dEK0tzWE40WWV0?=
 =?utf-8?B?TDJlbzlKajBKM21CNnhKd3ZtbTA4N3l3LzR6aW5FYjUxeW15RFl6dFAvVi9Q?=
 =?utf-8?B?c1BlQUJzckZuSjJXTkNXaCtVU2JIUWxEcEFjU2RhalNOUWdqNTVFL1dyWEg4?=
 =?utf-8?B?MUM4bXAwa3JJZk13SDgwTm51Y2t0cVdUdWlXaFUycUEybXA4dmk3YTQyL1pT?=
 =?utf-8?B?Nzhtb3ozKy9UZjgxbHFJK1FCUE9pSlFkMHNZQ3hGTlEzSmk5OGxLcStRUFg2?=
 =?utf-8?B?RlRseEdtZXRqK0R2aHltMWdwYWtBR3RWZjRaMlYvYTVNelNMQmlCSTZhNXRw?=
 =?utf-8?B?b0NVL1Q0aXhSNEVGTnA3NnJ5dzBUVXRCWDZkU29NeVhUMTNpSWp2djZmejBh?=
 =?utf-8?B?UmVFQ3ZEdWVJNFhDdXBnOXFuQ2wzY0tHbkVHcUFmTThtQjRCZFMyM1hYUG4x?=
 =?utf-8?B?cFFhVlVrbk9FT1IyQ2prR2pVN0cvdlJMYWVPMjNyMlptY2N3NVQ5TEQ3QjJP?=
 =?utf-8?B?ajIyRm03dEM5UFdITUdRZWFSMXlycmVMMWViUHZGWTkraERQbDFVZWd5VEUz?=
 =?utf-8?B?REl3Nk5oSkxsTWNDSldDOEpKd0QxNndDZXNPOGtRdXUyWUVYdkowNko1eVdJ?=
 =?utf-8?B?bklPWkNwS1BYVDlZblI0VVl3ZU9tdndvZGMxdVVROWhiMUZhUnZjKzNlUFpX?=
 =?utf-8?B?NW1EbmV0NHpiVDJieXcyQlpsK2wwaUoxRHcxTUJ4OVI0YXNnNVZhcFExMkV4?=
 =?utf-8?B?emh3UHQ3R1JBU0RLNUxhSVFQTEN0RmIycmRWbThMY1FrbjE5YUxxK3pWbjcy?=
 =?utf-8?B?ZkpBY0FJUjdBZmphMWRUeVV1bEtoa0RyY01FTVRtb0RSOVd5OTllRkZTOG5V?=
 =?utf-8?B?Y1dMTU9zQXczRDJ4ekVXL3pqWVpKaFR1QkQ4cmR1elJKOHFpOE1NMTdBdVZH?=
 =?utf-8?B?VGsxQjVNTGNPZjhwcFFrMGVJZk1jWnA4YmlURFlTVkxXbWhyczFac0NYazls?=
 =?utf-8?B?YjRtYU9KVys3TGYrekhSaVZlK2dHays1emhESWVxcmh6eTdOVmZpSy93bUZS?=
 =?utf-8?B?UC84NnJ3RnczM0lpd3VGa0pPYUpEZTg4eGdIOGFPSlE1andSY1dYUDdQRTJy?=
 =?utf-8?B?M1lsQUp5dW5nWFAzdGgwT3JqZnJJVmtVb0p3YWROUDVuUG4xbWg0THpIVC9i?=
 =?utf-8?B?c2d2cFArWFZzMk1PK3lnSnpsOGs3a2pqcjlqalU1bVJHSHhwYTEydmVLZjQy?=
 =?utf-8?B?M2lSUmtaS0NSTUxXWlhpNDR1a2xEQ3hrUWJleXdQTVpyZDBnMmNGYlBNR0cz?=
 =?utf-8?B?SkpiTkN5QzRlYmpjREM0ejJCb1A3NEgxU0VqQW84dTM0Q1V4SEFqc1FENkxK?=
 =?utf-8?B?Z3FkR1Bqb0lwTkh4NXV2aFBQaDkrenJ4KzdPdTE2RGluUjJZSkMrbjlGRnZZ?=
 =?utf-8?B?aDdRdHFER3loTmxCckJLaG1HLzRZemJXZG1NWXhzSnIrdjUrWHlmZXlSdWJS?=
 =?utf-8?B?d3dOanJiR24wektueHd3WTBhNFVSUHBTQW4rRmVsM0F6UkNHYUdueWdtVkZI?=
 =?utf-8?B?SzVNdlZzZGFRQVZWVWZFWVBCZkxzTUdpK2RadTRKVmNLNWEwcVJXRWozTmVt?=
 =?utf-8?B?UlJPV0FKZk1TM1huaytwMkJCeVVON2VKZHgvZ2RwQmthSlAwMy9qMUFkdDhm?=
 =?utf-8?B?UThIUXdxUjhFTmZQMjlza3Q0aWl5TCtOczFCanlRWStzNVFzd1ZObzgwOFhS?=
 =?utf-8?B?MjNVenhsWFNudTY5OVlvd0c5NDFmU1Qrd0M5aWw0Vk9oTk83SGxBaERmcUpD?=
 =?utf-8?B?ZWVJeVdwK25QWjAzK3R0cmR0WUpBeENGUG9KNjltZ2kyWDhuMHhpLys5eEdy?=
 =?utf-8?B?WlU4NEFGdTdGZ1J5VUpva0l0M3dJc0xMQmtHYUZ5M0RyWk5WSmkrM3ViRlo3?=
 =?utf-8?B?NWpFVlZ1QzE5TVdBYTN1akQ5S0FOWkVyZVluQURoQ2hZMFJxVUt4d0VuWkNN?=
 =?utf-8?B?WURPdkJUYndQcVR0cEJoQW5BN0VHdzYyMG1obEdZaGJySm9CSjFHaURybjVO?=
 =?utf-8?B?emh1K2xyT0V6d3Z5T1JxWEozVjBQYTNTL3R3VUdwWTZXOHZMdFc0Ymgxb2RY?=
 =?utf-8?B?OUxMQlMvTlczOXFNbm5jQjVweVA4NFVCY01zMS93ZGcyVmdkNDZKL0dDc0Mw?=
 =?utf-8?B?eWVDait1d2ZLSXpvRlhzdlRGTGcyRE1WMGxHUUF2dzdycEdvMVFVOE5xU0JJ?=
 =?utf-8?B?ZGhGSzdSbTZsN21pTWNYYzRRRHRoV1UwK3JzWExwTjJLSFhtZzdic09aYk5m?=
 =?utf-8?B?eDNMam1JYkZvc21Gb1kvY3dtR1VXbVdweHV4Q2thNTFxZm5sZVpRbmJhSVhz?=
 =?utf-8?Q?KrtOWlM5fxoD5ycahRPUd8CKShmk9VWklais8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756a54f9-5f58-4883-ceb4-08df032dbf75
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:51:53.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6tYC0GdFIqa1p+ccZebdaAXKB0bDvAdhzRheUnMUjhNCCxbFmbc/cZ/lmtc2MS/cp2/qhs4j7+PU5Iu7cIAGd1e+HvldxW43dAIWJrx/6GnvedE+eljHwlfv5ZMZljR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

This series adds support for the i.MX952 Image Sensing Interface (ISI),
which is a minor silicon revision of the i.MX95 ISI.

The i.MX952 ISI reuses the i.MX95 ISI core with the same 8-channel
pipeline and 4 pixel link inputs. The key hardware improvement is the
addition of RAW10/12/14 output LSB alignment, which allows the ISI to
output right-aligned RAW data directly, matching the V4L2 format
requirement without the RAW16 workaround needed on earlier platforms.

The series is organized as follows:

  1. Reorder mxc_imx95_data definition to follow mxc_imx93_data,
     matching the order in the of_match array.
  2. Use per-platform format_mask for the output format field to
     match the hardware register width: 6-bit for i.MX8 series,
     7-bit for i.MX8ULP and i.MX9 series.
  3. Add the i.MX952 compatible string to the DT binding, sharing
     the same constraints as i.MX95.
  4. Add the i.MX952 platform data and of_match entry.
  5. Enable RAW10/12/14 output LSB alignment on platforms that
     support it, removing the RAW16 workaround for i.MX952.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Guoniu Zhou (5):
      media: imx8-isi: Reorder mxc_imx95_data to follow mxc_imx93_data
      media: imx8-isi: Use per-platform format_mask for output format field
      media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI compatible string
      media: nxp: imx8-isi: Add i.MX952 ISI support
      media: imx8-isi: Enable ISI RAW10/12/14 output LSB alignment

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  5 ++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 42 ++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  6 ++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++---------
 6 files changed, 106 insertions(+), 37 deletions(-)
---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260817-isi_imx952-66ca65f9b638

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

