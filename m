Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB73EFFDB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217965; cv=fail; b=BC925zOAm98TExUtB5M0CHsflY8CEG4TPKqVx0Toc68sbDnp5tnyP+Si8KRFinXLKgABB/zNWVH83TqgauLMvbYZN9zMhwjJNzD7eqhFAhayV1NdyV1DKdmMyL4/w0u4KAMrWw1I7vRPqw3qXN0dLggDIEU4K0kSLUmp5nvIwrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217965; c=relaxed/simple;
	bh=x6gXSjc1lBc0OmfbOt/t6pQ15CXtPaHKdSNYuei/kbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKrZTRVVMCAHFfoGR90T3I/SrZkwEnmg8neOnZAC5GcimHb1it74i5perXUomuoBVp/0ewgKQbrgL6+5TXFG1UPbNbS2MYicpqZ+AKYXVfFLmeiSMJM6x1XfnXN8AgxRy6xDdotMMqMAMgK6C+1mOgwfCjFRHIRyV1IeJjZ3q/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rKD/OgEs; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rKD/OgEs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC5saeC9dPd/09m+Paz1foudcRJTwt2M2/mmIzS/nXnRiJQ/xpCRNkw4f7iIfXLzYZQfzDYwH023I9wS4kVb6kR9cSudbJL/7ysNtRFbftTNOhivEupwT+zSN53DBU8u8joF6GbnwtizmIalE5ek94NmxB2RUkEnrMER+JZ4KLL3F4aGfxGEjsw0pURTqWOhiwH1RXsW29/I2cef65Wom5/9aQUlCjRH/wn2MHUQOci7SgtizHP0zIOIm0pFUN74rBqPLhQWrf5NJKdgx9eKX90aOOyOBaMMzwhC0CoQ4RML3HkEdGmla8uFUNFdIuOWomvdNTFMXEuRJYXst1u8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd/ZTVZhfit0/kxZEAn8ROoCGLAoxqZ5qW8pIIz412U=;
 b=gRAcmD6MWeD5GpNKPMxnxWOt9JsxODchWbTX/mbA5KbFbr3iw81CJD3lBQ3QT7TRagW+q7CmqFL4ySbhDg/5Qx3wRtb9PcRrR2xLHlroDpCKvNv9Nq4ZFeUWkjnf38gssguA1oNdEjW0XIonnrK4/g3OQYJnqb/MX+SoOUga3ONglSB9/TnYqi+tR/MI8nrrqURnbLTtSXlSk3Xl1C/aiQx+YntkjnXOwPQAOE14YL+IqaQB5KXNJ/iVnGvLV6zgbVQpQZXJ8a5Cqk1vlXEPoaCIxA8Z9iaaInvHYr4QztqBPyJ7gN5IKtIaD0sV3gCsme9y9Ge2D0lgmRI7Uvfsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zd/ZTVZhfit0/kxZEAn8ROoCGLAoxqZ5qW8pIIz412U=;
 b=rKD/OgEsbnFOyc+7XxJccipljS6SrBenVGS2l+K461nQ2Dt7qYXD/bJ9exqXDnPv1rCAyI9EGOc2phLyIJ4OEJzR8x62Fe5O7+9CxkX2jOWXhZ8bg4/D3gGfLg4V+mKGdRyNbOq7wccL/Prvst5X6K/ISu9IQIBHqctIrv09xD4eaP0qf6wQkv6y6r6T9Omqbl5EGFLCLa+cqKmC6XF4qb+O9lxl8Cp6KLfUFHVeshm3IJAuhZEUIi1TUl0/C8+Fpud8oIm8WIJRe7OubepMnfDpqk0K0ACPBs4ljYynor8f1PdELDoroaVe2CosNsZgkgBGb9rs2O3VdbxrYTSLpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11397.eurprd04.prod.outlook.com (2603:10a6:150:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 19:12:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 19:12:40 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/3] arm64: dts: freescale: imx{91,93}-phycore-som: Set BUCK5 in FPWM mode
Date: Tue, 19 May 2026 15:12:31 -0400
Message-ID: <177921784142.3033084.3141629456597441423.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507062058.1711292-1-primoz.fiser@norik.com>
References: <20260507062058.1711292-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11397:EE_
X-MS-Office365-Filtering-Correlation-Id: 67da5105-fae7-4934-00c1-08deb5da9855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|3023799007|11063799006|56012099003|22082099003|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info:
	21DkEMbRCpS32Osk8naiujXo7H2rukuDU0yrNMupD8ee8Pnd3eoaH6q7iMRQ2qJ5JUTkDohQI31hoOg79XsbBsM/FhO5dohOiOwSEDwDyweNqn5fB8tZ3cUihk3+7dbXh9e5rnk7UA/UJyO5ti913Xj8g08QDHixbg5Re2ETY8ib5WORw48xacSXn1CQtMHvfsdzj+nPCVqRB9c11+sTo1QZXJlwN4AcZ2r801qip3qxvsjCHkNflKgOpgFW0Vsny3/l808TCTuE5kplRnmS9ZprVBipsQ8wNYyqAPF0LUZGTsPx0eYmJuYeLZE3WeINePp0jzajQea3OjWCPuEcBD4sN9Xq495y9L64+CdxJtZVc8c5z7kQGYA2mUVRirkyAO7Qtg7XptKH+Mw/xNflRRyxlroE/HJMZoMLzWYAFqqIYXvUnDI1EaLVDzeHcT2TSnSSDU6260Fpx/jJt2sw9meIWfJiOd0VRf9emocNJ2wlDEnN9UdSEneIUTcB60PoXh9ui4h491P1Ry0Rg77c7E5oRTVJk8j4HW3kYoU8NAd29n7p+owuJnX8z43DtjW1qvb/8LbMUHDu4HFhc6CmZxDghKvpTqJzDuoh4dX9mJImMZgnYrGhp2bbWmDsvtKAvlaPRRG68xkVHUSIMsq5MzFKYoT2H8VSuNepHyU1KlYoEFFv9jhcXoyPGBkIP5Gb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(3023799007)(11063799006)(56012099003)(22082099003)(18002099003)(18092099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1MrSVkyUzJ5cDkvcmZ4c3h0VlRjUkRZemY2VWdJSEZRMm9wOXdLdHhMd3Fz?=
 =?utf-8?B?MUUrOWFDNEpTcnhqZHhkYmI5S09BZDZCWSs5eURrc1NmR0tEVlBKS3c5a0Rm?=
 =?utf-8?B?SVdJa3JvUVg3YXUreGlHbHBxQkZMdGpTT2tJTzRGbjl2ZkU4MUJoSUh0MlJo?=
 =?utf-8?B?dDJLY3Z2TEhrMzV3eXBkSlI5UHhVRnc1RjZyYTllUlZFK2JSaTV6SXRST1oy?=
 =?utf-8?B?emk0Ym9yYVBiQXBSTDZnWDYwdHk2V3Rud1BIRE5VWTV3ZGYwY0JNZ0RoZUYv?=
 =?utf-8?B?eHk5U3ZneFhwNG9qcWF6ek1KNlAxNzBpVFhWRXZ1bGl3YkRkTTRWbWJPV0lt?=
 =?utf-8?B?aVBsSjA0Zzl6MThiZ24zWWdQRUdTdEdlL3QrbVVsa0lzWVEvTE1zTERZSHlI?=
 =?utf-8?B?SjdVOUFseGRQUitCc09SZVI1QU51ZHBSVGFEQnpvdmNtK3M5d1o2T253ZTkx?=
 =?utf-8?B?aHBQUDJUMXZJTkZMa3J5bHdkQitWcmx1cVFVTXBuTmMwdkJ0R1lwYkZteXFO?=
 =?utf-8?B?WG1Pd3VwUUlGam5FWFFoQ2lQTk9YaXpCM0poenJ5eThxL01KL3lNUi9WU0ZV?=
 =?utf-8?B?ZHY3TFA2UjRhODNpU2tzU0xJdUJwRjFBVWZHakhnL1ZoRXNCSVltcmU5WHBa?=
 =?utf-8?B?SXVMWENLTXVYSkhsem5qVVNrOERmL0NBYU9RWDM1UXNLYVU0SzJPbEFmUFpp?=
 =?utf-8?B?TzlvUE0yeWlDd0xnWmdxNnB2UjIzWHJ3bmYvd09HYnJrclBKaGM5R1Y0bmZx?=
 =?utf-8?B?eWlEaUJBRElETkFlQURORE9HWFhkMEZtbkpaNUdVclRzTEJQSU1KSkswUFBo?=
 =?utf-8?B?cjZtcVEwK2NBYlpMYkdIcXFNekxTNjg5LzBGVjhrcS9nZzkwbkNYclZjYW1U?=
 =?utf-8?B?L0lNNlorNUF6WVZsajdZRE9qb0FBdXRWVCtTaFFIUmtyMkcrTStYOGFnM2VK?=
 =?utf-8?B?bnc0dzR5VnhqR0ZRUDE4SnhCS2pxV1BmRU0xb3dQaStIYVNqb0pEM2FDbU5R?=
 =?utf-8?B?eU1nMXNveFJhbmQrSUZjWEFZcXJNZ2w3SU8rLzZsaXUxTG1qcFFFcFNyUC9i?=
 =?utf-8?B?MzJJT0RsU2F6SUZYcXFidEVPaXAxa1I5VHY3cGVxT0h3ZUZnTlZtV2tEQ2dj?=
 =?utf-8?B?Y0VSUGp4UTFiam1WYmZZQW02b1I2M285WHc2ZHhTTWdIWEVYWkd2eVdIL3I3?=
 =?utf-8?B?KytQeWdLVGlPWGhlL0ZGdUNhZkRBWUhSanZSaTJGOUtRN1IvdXJnYVEvakpv?=
 =?utf-8?B?Q2pSMjZ3bU9DUVo4Ukd5enFCY1RVeG1Bd1ZnWUhOWENjaURWTkl0cWR5S1pR?=
 =?utf-8?B?R0JadDNZR3NqRjRkak9pT0duWHhzN3VpTDdMYnhpL1VwbXN1b2kwcEdCa3NM?=
 =?utf-8?B?NTRFRkRvVVJyTXAvaGUwSDBiRkdlUHgzU25RT1pEV3JVcnl5Z1pXcW9CMXZP?=
 =?utf-8?B?dVdJRmloR2tEVncwTEdFSHk3UkdpcWs0NHlYdWFnbU5nZDYvcXpTeDEwMnhR?=
 =?utf-8?B?Smc2bTNzbFkxMzdDOWFEb2pEbld6UldGL0ppYTFmQ2drUWJsQmdEYVE3Q0No?=
 =?utf-8?B?WUR0VW5NWTlhOTh0ZHluSkczdzNwYUtSc2IvRG15REdhenROQ0pwTGJMUUJj?=
 =?utf-8?B?OHFiMkVQMS9mb2U5MDEvSisrZ3NGUi9LQ0NUWUtrTmFTNy9aWllaeWpFN2lM?=
 =?utf-8?B?QUNyVUQ0c2tYTERQSFlZZEdZQm93RCt3QzhReXIrOXdPSWxHMFlLTERmTVRp?=
 =?utf-8?B?a1hUSm50K3ZOQkhmZ05pUGJNblh6SjZDQmxvSjA3ZThkbTJVcENiUVNGOU03?=
 =?utf-8?B?eG5MZVA4OHduNWlIMFZCdEkyOUNxZ3hUMlAzcGVVMjY3NDM3TmFYMExGM2w2?=
 =?utf-8?B?Y2lzbkFoOVVEcTF2VGFEVE1hMk5qOGFMbkU5VmhSS0VNN2xlaGdsZkFwSjVG?=
 =?utf-8?B?b2d5VkNGcTNsWjNtZTRmOExxQ1dLL0FoVWdCeXI2UEJtaklmeUNxQTFCUHZZ?=
 =?utf-8?B?eEs3QjR3ZUFlZDZHZFdhUm51WU5iRlIza3U3TktRUjQvdnVuSmxJV25TbUlE?=
 =?utf-8?B?NmlCTkE0SFBsejdNV1Zoc3RJTXdjcW1NdWIvRDJSclg5REZWTHJPT0E3RG5R?=
 =?utf-8?B?VndPN05kc2dNSG9JeFoxRVR6TE8vWDZOcFBBL1pwVitYd0lDbko2NHlYa3Zm?=
 =?utf-8?B?M1pYckJudjVGeXdxOXZUOFdaUVpWY3VBSWpaV01KUU5ydVBCck1tK2hCUEpv?=
 =?utf-8?B?NE1Lc2lKTFdCcFhLRHA4d0VJNFpoYXBFb3BLS0pZaFlOWE1Tc0VsYVBsVHpx?=
 =?utf-8?B?S3NtekxwTDZDL0J2MXFJeXRITWFKb1g2YW5QWjNoTU0rOEZNVDlsS2hERUo1?=
 =?utf-8?Q?rLLOVTRGMA6SmleIdgfEt/5DtYlHhdFFrwtjW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67da5105-fae7-4934-00c1-08deb5da9855
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 19:12:40.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peg+1J7f260QB1MYlOsJXFmtldCpjuWAv2cPa6hAYlOVN4NarpbSJmCKxEDMzu3ENpnLQfkJgoPRNsGiODSrowO9ka6E8O2tX3OxjpBSifEAVMBMmTByyJ6Q5uV0JsiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11397

From: Frank Li <Frank.Li@nxp.com>


On Thu, 07 May 2026 08:20:56 +0200, Primoz Fiser wrote:
> Set PMIC BUCK5 mode to forced PWM (Pulse Width Modulation) mode instead
> of the default automatic PFM and PWM transition mode. FPWM mode produces
> less ripple on the output voltage rail under light load conditions. And
> since BUCK5 supplies SoC internal ADC reference voltage we need to keep
> voltage ripple to a minimum. This solves issues with the occasional ADC
> calibration procedure failures on phyCORE-i.MX91/93 SoM based boards.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: freescale: imx{91,93}-phycore-som: Set BUCK5 in FPWM mode
      commit: 5601ee1b64da17d2df2e657a7f1582ad468ed4d2
[2/3] arm64: dts: freescale: imx{91,93}-phycore-som: Adjust PHY RST drive-strength
      commit: e1b256ccc5cc3fc59a67a261d711bbbb989d7512
[3/3] arm64: dts: freescale: imx{91,93}-phycore-som: Improve USDHC signals
      commit: a6254c90e14b5b9d0b2222b2121598fe12f55ca5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
