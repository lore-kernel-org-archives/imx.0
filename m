Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7B2D9ED1
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813263; cv=fail; b=VJ5w+1mWZdSUU7MNV+dKhIWwMlg2AdP43d0RgQ3gmz9LLw8RFacoBVkmGLeLPXlrOdhm6uOXhaLzuQGfdYD1BEsIph2fOJWveSeCURWQuvfLzovNK1FFSsvRSa8yfmf1VU9IZ61oPqCNUX/J6pfptDcDHZg1DpoDLrWWtKxbU8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813263; c=relaxed/simple;
	bh=0hfg06xeXSXicFHjDN4vRIAkUAiuE0cJmUzl1jQmEPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cqp9ne8cOGoGEOYX/u9wVRgwF1Y4KOQF6lEftXgvgn0VYXzMaV9o3qqQdK3owCYqsAna+qq9aUjkgnZNg6zLu/m4ghiZn0pKT19p+jZCRvWPHe0xeFr2Qwkgxe6+U7dUnWdcN4pInA16t718Unx6DVRnTWEW4sGNd4P7ewoIREI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UUMSEGvB; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UUMSEGvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5ib8zrfhx73VQm0oe7+exMCyICoKDDRaAEUDrZcIFMjvltr0Shkol97r2/Vp5D4RuLu0AeMuv9kgiYGocsS+OPu5rKRntxsdavlgGqj5b05jXE6JTer2iSIGVZqhKIpWqAJxHZkZTmN2UIQOKwH9kKSv1U62WzRwimy/M4EGDq/ZqVGUpillxBuPGwclrdwCRG1Hl0v9lFWvvw4fm79pX7qIDzcyQFRWkjtpNR1PkvrHB75PXyKl2r99vhPxM++qyldRb9KflQwPkXvt44VMEPIwCPftvDb9CXjS1cBShv961u7c95BU9AdaixkHQjO8RAyIUUMKqT/igkRtveXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13teqRpAijEkDHrBYLtnQL5M72RTqMo0xCMUPrUjwBI=;
 b=x98XEAR//9UUagScZ1Xy4tLNyi2EPIXpfJ84PkIqAn9aqIWY2VpKsuPU7jFuSbPOeccEyhS6WPWlmgUo1TXzXPgWWStrAG7d7kkg+QivHHgMjmKULAU3P+CtkUkQTvOquwN8BMgI6ITCxJxdJMHkZIzv5Ng+5eaFJcWU0qd9PoUADmeUsdPY7/P0Uw/1RYwhl4BBRDy6iWSAT08QOnmfoJ7YZzNdXzLP00oikgpdxU4XQ6tWA1GA86n20lBNNjfcpHXqa74Wl3Qd+riIpgLS4hCJZy/HD9DAbjgkdkArAap7/FrwmoNWayWmXnvfP0+sBRyGYaBGYfkZg7BDmxy62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13teqRpAijEkDHrBYLtnQL5M72RTqMo0xCMUPrUjwBI=;
 b=UUMSEGvBR0aSkqX3cBkyUYYvkujTiHSAz9+Hms1QSOKkVWWKnJSUddyAO/hazKW+TCbTIFsAUSV3XxwVOTqbhoO84pQjE7M5QK9Wym983EqjWhWq44wFtxcZCjkkfKbaiZrQpjNdREuJg8hMhyR1h7AoExBRtR1/mcD69KlVeN93l00aYwLP2cbsn58mz3O0SIM0BM3jEtTO9s+ZgLJ7YXwEHKOIR3P0hkA0bBvlFMBWdcBTrG5fmLPgmq5k9pRBzaflE72LqvTQztVPKzc7zJSDv9gMZ4Hay3mrWUpVtTEAFDwWD15ggIr0p3lgkf/5nbLEwFgMbIEBWh6C7BxfRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11822.eurprd04.prod.outlook.com (2603:10a6:150:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:07:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:07:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Date: Fri,  6 Mar 2026 11:07:18 -0500
Message-ID: <177281321975.269574.15412276944981439762.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11822:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5e6811-8801-45f7-5e4e-08de7b9a7ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	/udeURXeUeRMjLTHHtYMQcvLdY+sAeLvqFffq6YMp/M+q4u1ky206ZAnfGMJIxxJMwvCfu3+bJ0dflXB3Kok7KINw6FTKNOHQYuDbUJjBcj582H8J/i1jRrxtLWc3kpbdxSTEYhgrZvSeuiwvW+ypB/YT6OBlQGEIV4R9PKozjJ8sIJwf4kgn1HttCkGkh4NUvTcxQUwCf3tvq08ePF/+HJikyoxipaakkJ2JDkqjcGmuW2xkz4z5a17rClOTtKf2/dUOhYFDfIJLoiIqaerY7L1f6getwIQNwel7PFCsduuGHs6MnqeO9QkO8wetKF4Cg62VzqbUzEtcVbOpxssWPRCnsS1bqi8++7tE5bkOuDTk+cZMhSzmip969PsL2dxggUDEJlm540NyIuEsIaa8iwJw334bviLtSHiitdEw4eybkJIESuGt5ca9BcZkPk1JVRw+4C4Eh+AbHLztreprF4/MaN7fBa2Gz6N7fFRCHPG1lND1muW6kKiVVUnfttnCHkVCvZL87J4JamO3uTVxUj7ykVLveYkkmLXbs4ELSvDynZC5l2jkOtin0RXARQNrB+RH+jA3wmjh0lIz2T9e8grEK/IaRRobNHqQdGbkQjE/xzpatVpzHCD9XB7ESvsO1XcGcE8bbkIJTvGKmaJAt6idbZ6En53HM5AS7DV2IpSDWZm13HoT56aOXDtC1Ybnubyu/rOfEMlr92XAtKwQgf3tvMH9xOedov5oT+Gv6fumkVO+AcUFc9vh4MdhUoa0ze9E2NbgXpOM2s+KGjUyB7Sp0Wd45dLp9U7izhOx3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2h2MG5jOURQeEZ5L2pDWlpzdUF3cEYxQWtUUkZCa015YmVkMUtRRG1lZVNF?=
 =?utf-8?B?aGRaZCtEOW54YytJOG01WFQwQ2pMeGF5dkdnS1ZhMDNLWE1nNWJteEFrVkpu?=
 =?utf-8?B?MzdYYlVrTnVRb0ZEZmhMU3NLd3FQSkt1aVN2d2gxbnRRZVhkZXJ6T3hxSmth?=
 =?utf-8?B?Ymh5Q1p3Wks0YlM5T2lqMkFNQ0dld1hQSjFMd0x4T3BPczc5dEYzcFZocUlk?=
 =?utf-8?B?Y3A4NEt5cWtjY3ZGUW0wY3ZIZW5ZNUdEbnpVWkZ2ZGN6V1dXMW40eDB1N09B?=
 =?utf-8?B?S2l0Q2VLWmxvUEtjWC9Ga0x2dnlVSlQ5SWdWU1FzU1BuTzhTby91VHVOSVJF?=
 =?utf-8?B?OVV6UWdYT01HSzVPQmQ5WVA4aitPVXQzZVc2L0g2QzVpWWo4OTQ3U2lma2Zk?=
 =?utf-8?B?KzlwS09SZnNVWVBxS1cveTZ0ektYWlFoOWhocFRJNDRsUXJhaVNxRm92S3pl?=
 =?utf-8?B?ZjIvc2p3d0pzdTgvMmJFZmRhS2tDWWE2d2RWaWZmaTV0Q1M3eWF4MFFVb1Q2?=
 =?utf-8?B?bGRQUTA3bjUyUmlnRVRrRUlTZ0tPaUlrTGRaNlJXWExXZUdaTnlOakxxY0hU?=
 =?utf-8?B?N1A1eWRscysxRjdtRENBYXVZUUMxNkJQd0ttMTVEVG5DNmFReS9WWVBwTmx3?=
 =?utf-8?B?QmtUYjhBUWhINmEvMHlDNlJzZ3crZ0JLTEZNdjFyeVJzSTg0OEpQbU50WXBI?=
 =?utf-8?B?VW5KZE5aR2hFTStHaGF2Zm1kU0RqVERBNlFxRUJxdFRvV2VEZDBpVWJZTmwx?=
 =?utf-8?B?UEhKa2JESldkTG96andDbEpocCtZeWNtVTJEUnQwbGZqeHBvWFpIK0xFQ2JQ?=
 =?utf-8?B?MkdGN2VsbU5MTnFoejNOTVY5aE1XYVdIVmx4QUttbGlFYlJBcWh0SWdTbXdD?=
 =?utf-8?B?MEVrbVNIaTNheVV6L2dHVmYyVjlObVllZE1vdVdOYXR2bHc2YTE2VmJkNW9l?=
 =?utf-8?B?d0JBQ3RadjBUa3lCRFZsdXNPVXhkV3lwNlRvVWRjT3VhcmhVcFNVbGRJSVZT?=
 =?utf-8?B?Y1FmTytKNXZGS2ZhSmdIMUwyTERlUGdHeE1OYU1RMjd4SjZvWFZMMDRoYzRs?=
 =?utf-8?B?d3Z5L0ZZUnMvNnU5M1luZjJEMWI4Uk5vY0FINDBzdlRmL1g3UDVnRVczUnF2?=
 =?utf-8?B?NHlSeThtN2lZcHlnbHplUU50TUowNWFBbVhYTkxjR2ZRbUVHUTFhZTVxSlpM?=
 =?utf-8?B?b0YvRXp4eHlLUXBiOW1QUklISTVETHBqaEF3d2pscmRnaGpFMEREM3V6RDNy?=
 =?utf-8?B?NU52M1lDazArN1JuS1daR1pxejJLWDRaTlBsa09XR041SXJtc0lCdnZxTnAx?=
 =?utf-8?B?T2VnWFpjK2JQMEFvR3UvZGtRTSs5NVhRMGN0eDZZdjErOW41a2tPbnUwenZq?=
 =?utf-8?B?MHNlVHdtWkNoNFlrMTlNcTQrQUFJOXBsajdoOHJZVnFGRVhhVTZQbmJrdGp4?=
 =?utf-8?B?RVYxM3dLb3FuczI2RkFlQ1Q5RG0yeUMveXZGd0l5RHdMVGgycStVYUtraW5N?=
 =?utf-8?B?bmNxdER5WXI1MUZlNFJPNENiOHlpNlJBb3h4ZFh3R0lYYlRlSlBJODB5OU43?=
 =?utf-8?B?Z1dKMEZ0aEdsdFBldXQ5Y0xuTWhMbXdybkxFT1RqcGtWSFRXUGVzNTR1Rit0?=
 =?utf-8?B?T2QwYXRPNm9GVkx6U21NcDBCY3lsZ04rMnNGNzZlczlyM1hGQWtyQ0Fhb01o?=
 =?utf-8?B?L09LLzkvbUF4Mm5UbWErSjhpMzBaSll1KzhXNERVSER0TVRWbzliOXJZY2JN?=
 =?utf-8?B?bEp1NDJkN2JIYW1iS1FoNVJKODJjRkZJZytSenNLRkp5ZlR6Z1lFeUQ5eERu?=
 =?utf-8?B?RG5DVUsxbldtTUxJb2R0Qkx4RWVmY1ZQYURYcldKK2dmV090ekE5RmFXc1VJ?=
 =?utf-8?B?WEVzdUpDYjhVQS8ydG1wcHJQOFhEVFhFY3pxS0Rid2xEVzJyVEttMFFTYmkr?=
 =?utf-8?B?Qkg2YWxQQ2FVRkpvWFJWVUxmOG42d09PQ3B1clB0eGhBRGdBbHpIR1NXOEM3?=
 =?utf-8?B?TVlRRkdQWk12OXBlb1RpZzdzTWdaOGtuaEJLQnVQdHM5K0tnZ05zTXZHOUpG?=
 =?utf-8?B?Z0tyQ1ZSbHkzZEpDQTEzbXlIcHFBWjFtbjVqMmlLRkZKVjJqSnV6enpYOFlX?=
 =?utf-8?B?N2hrWk1NdHF3cHVpakpFeVIxZEwwbnAzam55YlpscjZIZ1RtZXE5NWZjbDVJ?=
 =?utf-8?B?cTNSU2x2U1Z4SVBYYktGUy9NcytnK0lkQ3FUVmFCK0xqLzdrNWE3UkNNTkdu?=
 =?utf-8?B?Y1lzNjhBOHgzZENnaHM3dEJ2dXFURGRibVFsam9hUk02YzgrNDdEQSt5SjB1?=
 =?utf-8?B?QnhsSGZ0Ump5clV6a2QrdGU2TTVSQkNVcWVpZmJlU0RyVWFGVE54dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e6811-8801-45f7-5e4e-08de7b9a7ad1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:07:35.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gyrutyBFAa/QNB8vs298YlGTes/2OIGuOMmAWlW7XRlgCkY0QIr+ljPNtEt2g6SY8NpRYZa/1yxEIDsW/wgQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11822


On Fri, 20 Feb 2026 15:30:01 +0100, Max Merchel wrote:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> Changes in v2:
> Improved commit messages for commits that add boot-phase properties.
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: imx6qdl-tqma6: add missing labels
      commit: 1153d2e24eb466c73bc12eeaa6045781d8c32b72
[2/4] ARM: dts: imx6qdl: add boot phase properties
      commit: 60d7f4ad760bd6803756e2ef4bfe3d716de8a2bd
[3/4] ARM: dts: imx6qdl-tqma6: add boot phase properties
      commit: 3ff92e7fbbaeab51dd54b22774353ede11ef4b72
[4/4] ARM: dts: imx6qdl-mba6: add boot phase properties
      commit: 8ef9e4c3306a22ab760d9c8f5514c6f315091f6e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
