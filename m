Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD104A2E33
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010197; cv=fail; b=feYYT40ZCCxfufuN6MfCic4lkfqVsy+d8iYZB/BATGw4aaVR6qsozNrEv/hUKjK+yfU/1G481vM4EYB3jf0tkNqMyePCvvO/ZHKnX4qjDiuXXRTL7OoA9oBoLgbJHuwdkWGFvkHDPEL0BF4444FXy2j1gDnApB/BMWtAkOztpDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010197; c=relaxed/simple;
	bh=fi2D5e3DoyAMM12UkW0/WkaNG3Cd9tf+Ag0FQgdQMkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=DOVZtD07Y2WcSu6+g43Eu2ZTjYzQ9eZD4UTO2RSXmNJIyvmX5vJUhbcvrZF0jxR7O41bImRKUTEfurFz2sjzqtq12zV7W0NM9HWEuSH24KILD/5Qcxi0u862azQ88SeAhtJMeoiwlGD3v3GITHR/Dj6ASDDdX+AHVgUzujnZDTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f5yz2a2L; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f5yz2a2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE4NG5aT8NeBx1JWfw/pLsJExUJ9yFXCfjia+KZdEzPtd/REUDV0jgqm5K6mx5hEydiAnk9euxKpZpve/b+zCt/9QctRhBMIJEpz+oTQRFKoYSmE1Dw/tmrn2jbB1ZT2PvPGiGi3gwdW3vpHZhd2Snxe92Yr8pFBQ0psKblrlRBwugp1+s1EXBPzitgGVW3/TJHlHyDLLdJ+hbWUKdqODrhzUUDj/hrSljrEdvfTwLlN9jxkhKLW+q0DSqOEujGbcKoY1+WN4wtPOtfm2HTfBfcOFkaCSetZRig5QVxh16XbErrbUo8USKmuwbcwSFgg6/euKvUFe6+9yFCLPyGcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAOl7kyvdzhK2syRmEpoG4dBq9yu6u33rO0/xs8pf6Y=;
 b=FTikSXWt6dOUz2wd9GGOmg/4VkWBek6tGMkM6yRsMewcZaxhbru+ApDOBBdz9zPls2jUk+KofcGghSWbI0QqgsuFDDl1w8z42dbFn4SpMqmWFXW260A6+uR9OiHMKbtE90sZKPwRulUeecI7kF25/qigC9Rbo4Fd4l/1Vegpq1w+8Yxc5gDDd3WgJ0BEWlRsK5G3aDKqdxItkxhgALb/YKmoLB1snh9ZVbfMt+x8/226ljzIew3pYkJdxyUA+YX/s72Q8Ujz2FDufBqCdJ+BeqlTmLN6FBy9lElqaYl1QH3jbUlya6wU5vMRSgYZ0FKKv5FUdYfenCDARRPMP02y6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAOl7kyvdzhK2syRmEpoG4dBq9yu6u33rO0/xs8pf6Y=;
 b=f5yz2a2LRoskiX5yM7E38lrIffTAqjF5u5rNwYWHpWm36NEjD+9QRYgThCkxEwsU9MxcoHIk01tXAUELMxcpohhJOQ1m3oQqiqfiH+vLYf9PmPJvq5DTjpYArvsKe7pxFFrqXiA5RScG+9RMLU6eHjBKKWLVIrBAzM0QNCa3eO0ulL0p/5Q0E6Vf7sTzR5BsxrS1IX6BpNwH1G5VnrWbLzGRPXsrA30FfawGjg06x7AKcnqckNk6BFMP5JN/BWlYus8yTyhn8oEH4axF17N1SVgpukPJadHszzAhyEiMMQlv33jdxrLq6zssx7duYaQXVrbPL07tPtf9JloxMN9FuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB9873.eurprd04.prod.outlook.com (2603:10a6:20b:672::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:43:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:43:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Josua Mayer <josua@solid-run.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
Subject: Re: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX91 and
 Symphony board
Message-Id: <177801018709.1991623.8249927723333943780.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:43:07 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR11CA0134.namprd11.prod.outlook.com
 (2603:10b6:806:131::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db5b80f-55d4-4722-2ec3-08deaade89f6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 A6wPzoaZX75uxT1IarhGFXJMZmA1GGhbb0qyFwDWMDD/dPXlCjdleqHpfIiCgyeUQLJvvVD59ahPfmnCMS2JL0WiSnWtlE2sQKF6U6lBjePd9jiamDIwTH8PUcJVbqKwyQvE6EzEP9IHcCG8FInnRGC+rkP9/64MoFD9docTgkWmn99N9/RBuP7ymXwMOobZYwDojm2kBjhlCRB6nzmNdewM63gI4LUNuvNi34VtHTNEEIJGpwo0kdX8SwCa29DnkEAKw6x8B4ygB2hDWHi1RTfOo7MDzKiO2jGoXiEt7QzHc9H6du9efM5cRlGCI+0e2ee2RkkZ9TXe8kR8mx/vyJmLJBThv0+Y9cAOyq55Uq0jGz2PWkSJoP7VX/CFzfVmLa7U12jYuTuPc1qW2enMzXACqDektPQzn5nDsVQDPyGHyHulF9lklwrs1SYNJQhu2TaG430RAau9scCbalaFko9fMlGuWA3xF8SxjBMYdimbvda9ZRm1vsxi3xAE0WMUry+S7JIGwdlFr1qb5+IcYdSxm+nurOFL67nLcwew+IB8wasV9YdT8uPn7wniCJxxXrqSEMpQqP7mnrNEN5mvqcjnGYG1tf5OyWdXUJDRbFxFLR8Zb2CHwntS/+V5Yk+YOCJTwWYGPbsFS+/TnUDZQn1n6gTLx4L2CLF6C+2DwQ/BCsTvZhX/UmpMWxRohDcp+kLOnEUZMH1xQ4XENYmVNk623cwT5/0u6gls1sdPY0jWx/adl3Acu6tdi+OlkZWt
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cG01aTgvWm0rMjFXOGY0K1NmZGc3Sjhvb05HMjFUMFFEZHlMSzJjUUZQdXVy?=
 =?utf-8?B?VWtrZVlEdmViTHZtekVpMEpYb3RzR0ZFT0FTKzQ3Q0hlWE5hMXRuYjJDMW93?=
 =?utf-8?B?T2x5cWlrVmxSK1dmTGpNUVdpNXlFZ1ZGV0lHTlFLZGhFUjFpQkVhUUc4Y1Ar?=
 =?utf-8?B?L0NMZU1VRHUzM0tFT1dvaW92dlphZGRmNnI3T1dBNnhrSzIxcVduTVpZcmp5?=
 =?utf-8?B?T1pqcDUzNVVvNGZEL0pQUVk5cU0yRVBPdjJzbmZyY3lydC8wQndtRG1KS1Vi?=
 =?utf-8?B?bEgvWjMxR3A1dVAxOUNYVmVrU1QzejQ1dkJ5aS83eW5EQy9JQWd4MW1WVDJr?=
 =?utf-8?B?alNDdjdTSGJGNjVSbXlZaWtUbUhqV1BDdEFjMGYwQytEc2lvUHlucWhBRkpM?=
 =?utf-8?B?c0FWVWdNUzZqSTEvYlE4L0ZWa3BEYUl3RHRlRnhtZUlidEh2REVHcjdKTmk0?=
 =?utf-8?B?QjRod2xwYkhZVkxRUzg1MXNKZDBSYzBKbHhPSE9HdGpNcFIrd0ZSS2tveEJM?=
 =?utf-8?B?UTVNR2VjSzEybEJUam9xcU5Mb3ZDL0VMYjZHSFY4OW9Ic0FSdVRsNG1wNlZX?=
 =?utf-8?B?alRSVlBTK2g4NlJHUjVuSW5OU2VMVnBvZUR2SnZjNVdiSlUybW5CZzJFY081?=
 =?utf-8?B?MUVGOHNLSDhNbERIRitLTnNqbXJ6Mk5nUXZydVBScFBKWFBtYVV0czNFTmta?=
 =?utf-8?B?ZzRpTUtqcXEyRXpEenZhWTQwT21IYi83T1JuSi9zWThnd3FyYm9OdUQvMytD?=
 =?utf-8?B?YVgwRlhlV2Y2bWpFb2VsbXF3L3VXSjAyOFhkVjdFckpRekNsbFBGc1R3V1h4?=
 =?utf-8?B?Z1YvOG0rRkhhV0JZRkYyQjBoZjhNWmRVa01yQi9aSmRPNEp0c3VSc1lIOW1k?=
 =?utf-8?B?cnVQcHJDZDlsY1BoYmYzU3V2cXRtV0ZtRkZxL1RQeXR4SXVKdnZZQlV3a091?=
 =?utf-8?B?YWJUMkI3QndjZnh2WGd2d1dKaW9qRzI5VEIrNFRVM2NkbzZXOHpuMm1iUnZ0?=
 =?utf-8?B?ald2aEROazAvTis2SFBMZFpMcklLRHFRQzVZbDVPS1pmY1BLblR1enRabnlx?=
 =?utf-8?B?WFVITWl3L3MwMnZ4OHZlbWNqdG81emtFUWpDZFJ3SEhvVlZOUnpBaG1GRUkw?=
 =?utf-8?B?RVpNUjlONnRaWkoxOEpwRGs1VE10NGtlVWxLMWhqVm0xc0M2aHB1T2NIb3A5?=
 =?utf-8?B?TWJqWjBsRC84N3I3aUJlOGdaUUI5NHY0ckc4UlYybk4wbFdIbkNzR0Z5VUV4?=
 =?utf-8?B?UDhRTkdLbnFWV1crcXRVbDU2aU9IbGJ5Uk1UWkpWS1gzUWVoNXhPOHFuQVFa?=
 =?utf-8?B?azcxT25KMHFNSTFSMUxJRlY0WEZ4b1l4Vm91cUF2NDcvZlgyOFlyM2liRDFn?=
 =?utf-8?B?R0FyUlY2ckFHWWVheVpQcnZSRCt5WjBtVmhJS3VOOXNqTmJRS09IM0F3TEx1?=
 =?utf-8?B?UWowaDZVSmVVSGEzQllQU0FxSUlxT2VydGJGS01jTlY3MkcrVk9aWWt1NEF2?=
 =?utf-8?B?NnNVam9ZZDQ2OVM0cUdTcmduQktzL2RPalFMWVFqakREVW1mK3h5SW5qanFY?=
 =?utf-8?B?L1RWL2xPek9BY2duZjYrUU9TZUcyQkQ4a1BtL0pGZXB4SnFFZVMrVHBLa0dt?=
 =?utf-8?B?YlNmZkJVd1MwdmRiK1Nkd0Jzc0RuM3hLci95SDlURzhCNEZ0TUlCcFVWeThO?=
 =?utf-8?B?bGF0SEVpc1hRVDZqTGRDcXk2WmZvSmZSdTJjd0p0NU5iMmNYR2hxNE40QVo5?=
 =?utf-8?B?Z0VPT25CWFQwdWVQcUREekZySG9pVEptY1dteVo5emNJRWgvN1U1S1I4ek1q?=
 =?utf-8?B?bmNUWWM3WnBhUXpaY1NpYVRjRTdVU2ZnTkVBakVld1c1UFdmNHBNOExOSldW?=
 =?utf-8?B?RXhJVDJMYTNlREpNb0xQeFhJOHA2NTVuVFhzWUNUa3FUY2wxK1hJVTJOZWlK?=
 =?utf-8?B?d2N1M1paT2xiQis0eFk5cU1rNnF5WjJ6ckxKTHF3Qnl6WFFyZXJlNExBdkVv?=
 =?utf-8?B?eDc2dVBSbXF3TWZHMnB0M0NaRzRiQnprUS83MWxaeXdMYVVIYWhrWGVkdndR?=
 =?utf-8?B?aFJCNUQ4UlNzOGtyYWYzUHVMT1B4K3BiZVJubzQzK2RwYlZCZ1BWRTVQYlp1?=
 =?utf-8?B?Ly9Kd0l0V0JxOGZ4MXpxWnlaUHlnOXlGaGxOQ3Zpa2g0enZ6QkErZmdvRno0?=
 =?utf-8?B?YVBmVkQ0cGVRN1Z2VWpNTkhZdlIyZHQweUV5Tm5JM0kzZ3k5a3RWNy8xMGcy?=
 =?utf-8?B?dTlFVG5heVNOSFZaT0UySm41UXZyZjlER3ZuaEFkMThxc1RSRXM3QmROcWRl?=
 =?utf-8?B?aUN1M3ZnTms5aENmOFlSNi9EdjY0SGtSMHhRenpSU0NYRnFwYzBaUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db5b80f-55d4-4722-2ec3-08deaade89f6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:43:10.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TToMGBemC6bIB3EIbJKDXRsS+4VPKaDXEv0NezQf+AMxYAKLkfGHmXKF6ddPq8UnjTbGYHT/p4mkYQJ+koZUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9873


On Wed, 08 Apr 2026 19:39:43 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SOM-MX91 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
      commit: 05bee22e1af95f9de50b6873690952808c0ae54b
[2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
      commit: 92e5a1654ebcaa5d03f26e924932ad954207f9d1
[3/3] arm64: dts: imx91-var-som: Add support for Variscite Symphony board
      commit: b3292129dcef91ce4a4df878a9286a39fed0c811

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

