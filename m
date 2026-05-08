Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED66F225413
	for <imx@lists.linux.dev>; Fri,  8 May 2026 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272039; cv=fail; b=aGC7vIH+up75v75TqXA3398baKwJ7Ss3n9oOoafWY8pq3+bTkdniJFc0AS7W2jFhd3Pd7p10h3BT/qQMj4BLCLmh/DpctBmJ/euHyxLs26rx7DSLDXlCFKDmTfZ273cZlPQ4Dvz/NlpK+PbTm4WhrajHXBf3aDJjdL/AjqdiRKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272039; c=relaxed/simple;
	bh=kcMtBPMTdQVosYLq5OaN6L4ZLionGH/Z21qxTGJgQpk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=I4dNvp60p1ldh4GxypE7Dhp4BlpKFoKHf5cU5zz26pP4ZJGZx5Xopd0AAZc6dhnzSexQ+3LArya/doAh4+ZdufhgppUZtKiAGfaf/ix3YB9Ii5R3cptHeNDkgCAVySGstA6g52rNnf7/y3SwEBe/gJeKITzRDehzQTAUigdZ/J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=apP+2iAT; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="apP+2iAT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjqUc7VBwm9jKeK32wDcnYRPeVwNrzbl1c+Raiw19EoO0aomj4L9OHT0tYWmcrxUM1BbfFTyIuVnyXNS+UQPjw8F3KlTxwA2Vn2lN8sq56Qonvb/M2vnsPL7NUdLj5OPsGJUkcKwlaOYoPuEXuLGEb+8XiIMLBGWANCUO5tox+0t3eMasoBveDsctMLY9lre5tuXvTEuiEnXoQI+mHtFU/aDi4jX2IdO+dMilvQ95/mmgtP4jUg9E+Z8UDq5CbsDMMZ/H8rwMf2nfqfh2qChswbFLId4T/EqsnfsX5A5mnaOypC5dKA7dSVML6DmT1o34dz9D79u+wJTbwMnZpD2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHCIua9S6BocCMlOwU0flioKqoDxR2U/nPhlxac8Nf4=;
 b=WqKWOcH00iEbq4QzDk8FopDbIksccuVPPDPWaKCjHQMMjyH8kGB/ktuAUle6XLeRq7Vm5Q9vUzaUbugRLE4E142dNVZsWpvqsYORyXxiQUfKbHf2kRiC4WVkvoFtZ5emwQngS44D1lv+YUQMCOF2rO9+dyPcEClpBta0G1iOROj6mdE10eaPlaI5xmDw6lAezZrOlcxOVr+lyaz9ja4rbsQsEN3zWG9qPLwW/NtXTFlDf7tTcjMfAhJA+aYOYAEAqhv80EhdTZj2GBZBci5p3xM/lgWc4TlRALIV2LBxbn5e+rxFsDRkcUYrA3xttpM2eBjGGJra2I8R+usXWI/6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHCIua9S6BocCMlOwU0flioKqoDxR2U/nPhlxac8Nf4=;
 b=apP+2iATHppwbt5kvYSnn53Uv7B2gyVf0QSbTsDadq7bEODUsMnojW3eH5r0A1badnwqmyZ+EkMtu4Gpy+X3Tx1CesW/WPN/N5D5l7hueESS1xCunaCdQPrq2XLBrDHqs/OFBANPRGz3SpPBHpdkj1uxoLfbcvA8GQfGLOfH9GN8GkBztSwqLjbOMlqRZrXQe9aUOPJ9JmrxcLU5vN62msViqnYbQzRGp1Gv+ySLsZXO/1KQ9cel9e+jJXt8Msi6rGnL+D7BhL+XXlh07SblA2gnIZsBJisXdV+nGWY8jIjB0Mo/eoR+bRVI+9cYFKn+w/I15St78dKRQUk+kr8xdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 20:27:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 20:27:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260213171715.3465064-1-Frank.Li@nxp.com>
References: <20260213171715.3465064-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx: Add fsl,aipi-bus and
 fsl,emi-bus
Message-Id: <177827203017.69860.4472612137602659044.b4-ty@nxp.com>
Date: Fri, 08 May 2026 16:27:10 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: af66e50a-0285-4030-161e-08dead402fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|56012099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ji8tno1F78j1/ccANWCmzBel1lpwE8xH3yiCIT9sLjMaSCXfjCne2jPlvqfgRNUcIG8Ai9tffseEvIgyLbWyciOqxglA6SZyF5LPSrdEXJ5Jgbb6ZKxsxdUkaaQFAiUVNibBJQdU6BwB5xUbAUgIsV2+m0h+ziRkBGgoeGV5j3f84MRy99Kh4mTRT8NR9KxVGFGfRwOfV1CXO9mj/U+e+gNVrymqqZYxJ3ca3MVJg/B3kCa0x8exb4ClKUzwM6/fds0lZOJzkkuNmslyjaN/a1jar6wln+Zw8K9NWVWbkHwBq1li6IIOZsyOsff8podBf4lS++zo8szIzHj8V23yUh8mfh7tbUraiQ1WaMitmOOErWT6Bho1qQi0HB3xRzreN3gp/00ZoB0Sl0Ulp3flKNAR+B3+7NLuv/LVxU2PzgzGB7iF2jXv3G2ZeK+/Aw+5xoix9dfUTxEbSOP0qrHw1/SH4CCn9XMq7h9I+RXoIvx1Fo1tSxhok8PFqvADr+YYgs5ULKkzYP3o0ULdM0lYkYmKDC3wr0yI0EJNIvbLKqHCOnUtA5e6byONlM4ph/SjkCcIRYy/X0voRhD+ye08JpHraBoNHGEt5MvjSUAozSrcxokF23o5UgInpVAOSdSL2zbEhRC8XNZ0Dzi+xFPbg5oZ7UIXSWyomXmdxKBHMupoXT75XgbOl/vnQj51E8/Pow5HspUEtfsqgNT0kOyhAPJ5sIZaB6a2f5+z3+rUEjbv+ugD4FMOXHoCJ1z/ihF3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(56012099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09LTXJLdWh5czhaS0R6VTViUWRsYWo0bjRHOFhRWGR0NXhxV0ZZaExDYVpm?=
 =?utf-8?B?VEozSEpGY0R5ZWx6c21nRmJseEJVdEpmMjhBY25tMWVBZng2cFVPV3h0YlpO?=
 =?utf-8?B?WExGL0Fid2Q1QmF1NWRYUUlZV1FGR0V2RFlzSWhMTEROTU9NanpFV3AxS0xM?=
 =?utf-8?B?Ym1ZOGNwU1JOS0ZGR1B6M3pXTmZIT1g3amNQL1J0cnNtZ0Z4MEFKNnZoTHZ1?=
 =?utf-8?B?OFJhazFCcEZRYXo3bk01Uko5d1RsS2lyc1ptN3I0VkFnY0JZdVR5Z092SzhX?=
 =?utf-8?B?UU5hbVBVcDA5Uk9kK0RTZWJubW81QU1uOThpcHBjTEZmb3FRd0srY3JteGlu?=
 =?utf-8?B?OTB1SnRodjRzblZBM1NtTjF2MitDVUZJY0srNURoYmZWOGlDbDVKb1NQNitj?=
 =?utf-8?B?dTNSSEdEYnk3Ty9uVnpvMTN6SHp6OHp1V2VTRlNuUEloOThMVlRlZmFzaHJq?=
 =?utf-8?B?WkVkeVlMclZuditZdGVPMFdRR05waHh3bUVFZDUxY3psajFkYnkzbENvbUVj?=
 =?utf-8?B?L1hRcy96YTZ4UGY5TWRHM0lZRGtCamJqRjExYm9zTDhnQklZZ2h5czc2bGtV?=
 =?utf-8?B?MDY0ZndPZkcrQVg5SUZYRG9JRHBNSmlSeHFISFh2QTF5Wkpja0RtanB3Sy9R?=
 =?utf-8?B?NFc1akRCT0hnRWhRVjhraGY3Qk1iM1hSYWR4ZU90U2E3UC9hNWFPYjJtQkFv?=
 =?utf-8?B?K1U0QUZYUEV2SGZUVmFmS1FMVS93M0UrdFlCWkEzQXZDQnpzWFoycmFYRmFB?=
 =?utf-8?B?dHNoaGh0M0d1MFowNzFKcUdDY2NlaXJENnhER3JKbXNQU3hFTG1uN2JhNE5Z?=
 =?utf-8?B?ZnNoeDNWZWFsYzhnVFNMdzN5QjVRSU11Q0YxNXlZT2ljVlpDZ3BMZHR2N254?=
 =?utf-8?B?dTJ6Rm1GcStjY3ljWHdJRDBjejNUeTRwQXAvSEdXTXA5YVNlc0VEZlpOc3g2?=
 =?utf-8?B?K2w2OXlHUWZVazRkR2FzNTZmMHRCZVpQLysvWUxETUd5UTBPUEhPaGhWYkli?=
 =?utf-8?B?NllVdEhieVdTdUFCdzU4Yll6a0J1MXdUR3dlV0lhNU9kSTY4VXNVQjZLSWhr?=
 =?utf-8?B?ZU5TYlpvLzNqZXltTnBlbGwrNi8wMEJFTXRaNlRPUXp0T0twNTJxaG9EUVR1?=
 =?utf-8?B?b1hKR2dwelI5ZjhwTlhTcVRVMEhnOHhpdWVoZmJYL0U0VWdqQjRjYkhCTGFh?=
 =?utf-8?B?Y2VUdGlSc1FRRzZjUXd6N3IwcDJJMWxDMitGZGtXQk4xcW4yQ0xnTll3dXhH?=
 =?utf-8?B?REtMZlFaWWl6VWdxaEdtYkNSUkd3bWgyZmNlWEFhall0SGZrY0d4dC9NWTd3?=
 =?utf-8?B?TUpYdEFjZXlET2ZZZXBhTGZzdDlqcXZhcnFOaDJwMzZoOGh2T2cwQ1Q0ZXZE?=
 =?utf-8?B?M1RuMzFGYkFyVjlnRldBdnMyVXRtckRFTjlwZG92K0w1Tk5Pcks2akRIQXdH?=
 =?utf-8?B?cnN5UDhFRitJNUNiVkczbjQyNC9iQW1jM05qdlkwdDZhMXVIU2ttRkY5ajRI?=
 =?utf-8?B?QW9lWEhQSm9uVExSM0hmcldBTkRBNzErSklVM0YvSENaUWZFTU5aTVIvRzdx?=
 =?utf-8?B?ZWlXSHhGU0ZXZkhzMWFGV2NZRlI3VElIb1k2NVVkUVkycDhGU1dZdDh4eXhI?=
 =?utf-8?B?ejZuYXo4MWRlL0p3WkZTL25DQlkwcTh6MHIzZytJWVN3dWJlSlo0cGFjcDVX?=
 =?utf-8?B?bmhXV0lTanVUM3pSVHAyZnNNc2FYa2VoV1I2Q01VRnhCT2VzRE9zMURXaTFr?=
 =?utf-8?B?SzU2YWtXaWk5eVc4bitrZzRuYk1yZXVjQ2JxQTBVaTlwR0tpOURkOVdIMjFG?=
 =?utf-8?B?SjVvcFpPNm9rMGdYY0NtTVNXTmhKYytSUk9ERkRrQUJSNS80YkRBaTN3N1Ir?=
 =?utf-8?B?My90VmdMVlFTOXN2TmtsaDUwaUQrS2tROHc5b0ZiNlZzOTZXNEZpVVdBc1Y1?=
 =?utf-8?B?N2NDMlZGdWlwUndncmtnWWNxMGlHckxObFNVWmVYbllaMWIvTzVQbmlHUDdl?=
 =?utf-8?B?UldyeE00RTFWVEpXMUpxWVNIMnpFYmsrL0xVTWRSckFEbkFSWkIrWk5QUzVQ?=
 =?utf-8?B?QUg5Q0ZTRTdLeGh4dFU3TTRzSjFmcWh5WDMxUGhDUWg3bi9MVEZyZ0NOMFdj?=
 =?utf-8?B?SExNdkJIT0p1YzRWUGpJNmh1L2VKblptVlNsZHAraG9tTHFSSnlOcHhwSW5G?=
 =?utf-8?B?ZXZuNGVKTkhzZk5BQUtjM2tGS1ZOdElqdFZQdlV4M25IbG54OExlYzJnWHNa?=
 =?utf-8?B?T1VxTlhiaEljSjhxMlR4czVjVmJJOXRJc3VnTVJNMlZ3STlrWmVRN0RzNVp1?=
 =?utf-8?Q?XUIJz4e4Lqn7/+p7g/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af66e50a-0285-4030-161e-08dead402fa7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 20:27:12.4160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKCmFxqR/ZnuGaTkJna1uy7wfoiB5Q9/lkjaDjFUrrxH0uKzTYYs+10HLuKrbjF2xtkdXtPXWJmeryx3crh2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759


On Fri, 13 Feb 2026 12:17:11 -0500, Frank Li wrote:
> Add the fsl,aipi-bus and fsl,emi-bus compatible strings for i.MX1 and
> i.MX2 variants.
> 
> These compatibles are only intended for existing legacy chips (more than 15
> years old) and will not be used for new device trees.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: imx: Add fsl,aipi-bus and fsl,emi-bus
      commit: 405b3e83a8b5ca38cc4e26509cb08d8c783e385c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

