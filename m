Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB714B977
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775262102; cv=fail; b=l3eJXXw8gb44CnKGNpVniVBVOzMWVCio+tstuGco7tUVbi18tIndYiD51sbBpmM1JHPqGV609VgeUn7ftQIzjDq6SwkyEQhlSYmyniifdO0nfS9Oz2yhxYazFjxoUVuEi2KHULAgpSbo2YS8EpVF8oNzLb8O69LGpM1gAQzkxDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775262102; c=relaxed/simple;
	bh=xAHO+GeE2W6U1xVd0bWkj/23lVfCTqPgU8dOSlCYomI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KdgUjAQAYlCiBnCSty/4feAbpPokICCBhWASkmpUikjkVmmnkWFvGcf0KIhpcRb59tD1PhI9w0hHliizkl9wJrnUob2j5zueiblsQy/UOsCBgAHYxR+so45+py+NmeNOrIPfuuSq3LrebTqtxBj5n/M/aIv9d4QpDirWhzXcbT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AKhdwPki; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AKhdwPki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmWDIXfTjzPIltroponnUWzn0iwkLLkFe/tJTH/HKJ7L/MbTsZ+O+FsGcE0w7Gn2Hwuf64/1+Jm+WU+TcEid/g1VoG4zkcOVC7zA2joN/9LO0WnghxdCvU3dZv+yCX/ueiMgrJmYCFmPtWd3pqank9jziz8bFE64e3F6l67nqsHR1LYHlq6uZ+y6ABtPq95aJ2F0+WNs8lK7YIqYGAuTkDtx1TA5Up8pECK8a7RKbX+DRA5At7+y+7AneBEjQJUA6Shv9LVLfu8ypN1oAcSvY6FqLdeiZWmwcvFOY5Tt5Bmv0VIEAgFCmaMF/sAUbQ99Xurv2VDVySSGUbMgNI1qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxGa4zAxvBs16WFTnCWADjKRY+b/VvPbRjsk1w0aLZM=;
 b=t+I0pfocOxAD330M1z8ci5lHdWNB+aLAoMBlNQVJZSD/igdhHt7b6Ou+IsrZUbRnqPmOjHnfClM1Gvkrgb4ktoSByN9WvCeca+6hE395CYvGHmc4ytfRKzlnvHMd4ZsJ7UqQg21f7XRlIqcCb+62u10pBfjLrCtq9pIijTdIqYlELScagYdLj/WTl2iZ30lJTpTcC9Tq+EgIooAt2vM4AzTYwobeEP0Std/rA831Lrf1yRUVomfLY8TeO/o7Vy6cA9SSVV0t6WOSO6yQgPIz/nKL1XCGUJeIQBFHy9WueWXOrSH1UbP+sVYtdSuYw48+TMNBWTsqosCQxiW+wmY2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxGa4zAxvBs16WFTnCWADjKRY+b/VvPbRjsk1w0aLZM=;
 b=AKhdwPki7HqXuft48HEaR2HdF9T1AgYRkk5Ea9rhnx3eLfc/gntzLGZ9Jq3pJaW32nACUUTxxgruth7Yw8X5PumaylLF6sTZ6k6XL/cQB3OI/oNmTYkVPKRl9UutVQA1glF0dXS3sS+dVtZgQKJcQDrBfXDIWeMATT/s+PRtTA1ql03cA2c9jzHZMjapsQubIDvFoR7z4zeo8iVyMX8kI5+y1Pz2Ik6qlo1YOA68GemU5rAqzmzOfbS7FvXNRJgHBAjzPv1xr51RUXi7+a24p9ECeOtG4aB0D4pciK1x+vCinfux5Qyt7hfUeE97Egv5R4RiI9zVsKlewXRcRpomFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9321.eurprd04.prod.outlook.com (2603:10a6:10:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 00:21:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 00:21:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx8m: Correct PAD settings for PMIC_nINT (2nd part)
Date: Fri,  3 Apr 2026 20:21:07 -0400
Message-ID: <177526204751.3379972.10230351109063445052.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
References: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:806:120::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: e0579601-32f6-4cde-252c-08de91e0213a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|52116014|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	g3/CaMFiumeISAtiPnIQ3hJU7Hw5cwtYpByL7dJrDtiHdikn4m6vAZZSw058PKVzyQbZqZR4ol0N3LXPYARBEQHigm/G7FHTI499UsxTsrBf6pcc5KJnul+tEb8ljqwn50AUvYFPuAHWmMVu1X5EdPeslttOU5ctJq0RPNaXVNROKorJf5Eq6lG0FsooidqxdfxEoydpNQ+EzUQmf6KKWDOBQv+ngW7i14aIt+kkoP+tsUP7yvPWOe493wJL58AU4wuiWRZZOKJ4darA0C+dced/je9EWl5iawE8RdBBCACYxetV8Mf7nOmhjFMURCYvIfdlsJnu3FZT6O4LHp74kglf/XYXWbRSgOyOC3NL23qAgX11lgOcO374Urx+YTfodL5EV0oLb1O+KR5WhiYgRU1H5s0rf3ZbJxdhRtb/r5F2ctZSxKysmmDlSeKUWj4gcxI1GeMmO4wiIYWgswSgYMEvoyFA8tiOt9zpcD2zW7hpqcC2Jo/ej+FmYYLIiLQPc0AfPEx0NpgUJQi1rJcTZ1Qi/sdfuaZF88td9TNBxNjzLOlFQbaZo9gUdWVYt9F/a+MGsa3BwBl/H+lGoK4y0O762T2sb+CusHLV1YhNdiGH7pXJQM6iXqqg4sueoZpG3MLFJZJK392/ja37x1ggU7Tt3976MjaT6lFmdcQR81dd/Au4+4IpFno1lIFATO/V9T6Bu1drO6nhNnfduauolIfeZQZd4f0oHDqZIKv9LNXhPljavwvNGV35P3RuepfPk3t+7qOqNPp7zQ8k2wKmqos1/cN+3tdtYjvUBplp91Xzi5fDD0N31I8gZZ3LoN8W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(52116014)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elRhTTVCeWJ2anIyM0tkdm5aVnBMWFB5K2Q0UXJCT1lGQ3h0bnJleEpwNGNt?=
 =?utf-8?B?ODZoMTlWUlFtaG1MaDNmWHBnY1BjMXoxZXRkZ3BGdThyYlFGOFZSdi8zalRR?=
 =?utf-8?B?ajh6NW5jc0x6Uy94dThBNjlpMWJ1U1o3RVhpNy9pN0x5dU12eTdUbDhYLy9K?=
 =?utf-8?B?ZnZYNG9CZm1tQkV2V1cvdVdTcHlFcFBWaUt0SGRNNUtaTkVPb2JUVElXQ0Ft?=
 =?utf-8?B?aThSSkwzSk8rREZTTUloSGE1SGUrZEdqZ1ZFR0dHbHBoQ2FOcG56SEl4elRp?=
 =?utf-8?B?YlBzVTlhc0x3Tk1KN1N0WFZpSXZ1OVlTTWFZNGEzZi8wMWtHVjZZTW94MXNj?=
 =?utf-8?B?amtTbjhQWWtTcFdmK3lZZHJUTzRKbW1zVkE2RlNqaFRjRnRrejFtaXI2MFMw?=
 =?utf-8?B?YTBhZVJQSjg3WFRYNjg3MlNwbFQ2VGpFcWxxYkVncU9jNy9ZZDE2aFU3Y3NC?=
 =?utf-8?B?Q2owWGhYZWtvN0JQbHgydVdqMkRhN0N1aG5KMW11R3lqS2Y5QkhDeldGcXkr?=
 =?utf-8?B?WG14MHVtc20xUmxkeUs1WnI5ZldtZE52TndmRXRwc0hoaHdGSkloV3ppTzhh?=
 =?utf-8?B?TktOV3lsMjIrZUZTelQ0MFRXVGdSMFF1QUo3NFJOWDI2ZVA2UHJIeHVFM2tN?=
 =?utf-8?B?c0ZkckdIeEtvU3h6ajVyTER0cFI2bWZuT2N6ek9jS1pYT25TTUZXYXpMT1JH?=
 =?utf-8?B?ZFIxNkRtNmczcWZjcGczSnBQcUdqNXJTVWtVK0cvblVnS3pEWHNUM2ZWWkhT?=
 =?utf-8?B?c29qUXdLdGJRUGtSOC9JYmNXb3cvQWpVMldNRDZENjROVkRvcGRYYkM3OVJx?=
 =?utf-8?B?Lzg1cUZRVlExNTNaYTNtQlQ5UzlpK0pDbEZZWFcyUlMyN2xySHZIck1wR1NM?=
 =?utf-8?B?Ukcvc2Rrak43VXpoUHFyTkl6dTl6VGZTWnl4clh4bHVrdlpBVzRDS2liTTF5?=
 =?utf-8?B?RzNiZmVlRnhvc1JIZWJMWi83UkF4YTk3K3hwR2xPV3IxelE1UldtZnBiQ1B4?=
 =?utf-8?B?S1d4eW5DMVM1Q05nQUduQUNiVXpQV2QzZmZTby8yQ1lBK0k3VTdzUURCYjY3?=
 =?utf-8?B?dmxjQVpTa2xBblRFTlJVNEUzU3BKaXF6cFZZWXVyeXBzVWdWbXkvZVlVSUoy?=
 =?utf-8?B?VnI5anQ2Z29hOVJJeDl6aDRnVFFtQmpOZTNxV2k0Nm52RmlNU25TeWdHbm5M?=
 =?utf-8?B?SU8rbGlvaWlpQkhORERTWklXVGl2M0Exc2g4UStVSW9oK0lrQlVwN0d3U050?=
 =?utf-8?B?NHNaMk1xSWpSWnBqWW1pcHNvdWtsZEdHakNudTdpTFlNTElZSGxGelRFQ2x6?=
 =?utf-8?B?NklNZW9kcnVWaENhZzNZU1hERG5DeVVJbzdPcWZQeHF4M2dYeVNNU1V2N3RV?=
 =?utf-8?B?N0tYS1pJTDRCenptTlZpTmUrWVc0dW16OXlHbllTeVhZUytYNkNyN1Y0RVBP?=
 =?utf-8?B?Vm5BNFhwVlpzRUY1NGl4bFlmWWZ3djJPVnFjV2VWbitLYmh6bXBoYndHNXhn?=
 =?utf-8?B?aE5STWt6N01RM1d6YkVtazRoTXpqbTQxK0NNOWlFRy9VVFpvcnBrUFBwZDRI?=
 =?utf-8?B?L3VQcjVFNlpNb0xmdTc5dVVGOVU4SE85Vkdtd3BQN3BIQjljL0RiMjVyUFVw?=
 =?utf-8?B?NlROQUpXYmplWGorZkZmRmtiWEZzZWZoM0lJa1YrczV4cTcvT2tTYWpCVG4r?=
 =?utf-8?B?dFM4QlRrWUxkNnN3am1Td2tnL1NTeS9lVmQ0SHBPandLcnMzN0xvbkgvelNs?=
 =?utf-8?B?ZWREWFNLMUtvaDVXSXNINEZUVGpzZE9DbDY4RHdjQU8rWTJUaGp6N0JOMGJt?=
 =?utf-8?B?QmVla0YvZ3FlM1dka3RIR2hkWjMwWElTTUVSR0dKTElWdFF5WXl3RU5wVTRK?=
 =?utf-8?B?S1p5L0lmalRRMFRMQnV5OTNmNHMya1cvVHIwVWVndzFvTkZiNm5pa2hZOVlr?=
 =?utf-8?B?LzV1R2x0bG1aNm9aenhYeExQbzF1UWE4bTFQZk9rMkFTdjIxRVZISGEyRDBZ?=
 =?utf-8?B?eWd4dHBNMkJ6OVdxajhZZFBRSjBrWUViS01aZlJ6Zjc4UEwwRGRZN2ZOM2ow?=
 =?utf-8?B?SDZCWTUwTjZDa2tBaHExekdYbENLSDZlbUUyUGRrOGJCTEdnYnZBSE1BT3hp?=
 =?utf-8?B?Nk8xL2hVZFlQbDNQTDBGKzNEMFVYUFZxUG5yZktMZUFOZjRUMWRUeXVaa2Fo?=
 =?utf-8?B?R3ZmNktHbFNiZHVtdzJ4ZndFc2dHZjUzOWhuNVZBa3REWWdhQzgrQVc0U1Ex?=
 =?utf-8?B?ZzIrWFZ1NGM1USsveng5Z2d5VEhycUNKeFNwTzk2bjc5ODFsSVlYK2pBZ25X?=
 =?utf-8?Q?FtEv1gdiFJHGpKCh/8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0579601-32f6-4cde-252c-08de91e0213a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 00:21:35.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVe78LJ1YlXNSZb1ksFRsAYzBSKhp8zD6pP816p+jFdVhjjtCjc8FW5czZiT8+GjE3PLRkukRBKCFtiyvw9N0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9321


On Sun, 29 Mar 2026 21:00:10 +0800, Peng Fan (OSS) wrote:
> There was a patchset for i.MX8MP [1], but after further check,
> i.MX8MM/N were missed, there are three boards that might also has
> interrupt storm issue. I not have the boards, per NXP board design
> , PMIC_nINT requires CPU internal pull up, I think most vendors will
> follow NXP design. So updates the i.MX8MM/N boards, but I not have
> the boards for testing. If board owners would give a test, that would
> be great.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
      commit: 721dec3ee9ff5231d13a412ff87df63b966d137b
[2/3] arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
      commit: 0fb37990774113afd943eaa91323679388584b6d
[3/3] arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT
      commit: 42a9f5a16328ed78a88e0498556965b6c6ec515c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
