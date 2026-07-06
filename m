Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B4383983
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351672; cv=fail; b=PByags6iRvaH6rcErVjxN6aKBS37Xd2CDu7u0QUUbeWv5GNtMuiUbEqEPOvMHnthM2cRmJ5fZzmjc6tpt5wZjLtuEXfDYtypjK+NuNIF2StsD3eVvZhaSPC7VuXPPRNg3lPuE92hBeHoNXnsVrqlslxoOQd4ahg1qrf8L7Mgd5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351672; c=relaxed/simple;
	bh=9MAdHwjozXi0uAfl0hxZHWAMSD8DN4RWHQ1mP/+r6gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+sGyI1em8R0Nb094iDhYylnFzIyczccyv6F2eO123GySvkCDkIGDgdYcsiPYo4j0DaJlT+MM++w/cdhB+fhfh9VFdPu75DnO9JGdW6HgMkUETFopOxDUl1om+BZUsVWha2tmtPRHy1+kkpNV3scNf4IJYX2ZJ5oQtdfoLeySvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GxaL2gOS; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GxaL2gOS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvslZDDasIzDZ/8K2EwOXs2Nl5i/GhCHKNnG9eYKqHziAK6sh/cfN7n2e5QvNe0XqGzMYaQgU9peYAoePCIQYbtGjLT75syJOUkcRHZH2ZX6A9DQSiohKMmpZLA8OpedTPEq39EZ2mk6ioJl/uObUr+QJA4iUENeJdhNZ9Wyy1ku6ZkKKDwhGPmxVU5aLupDb8lTGPERyPxrGSj/rYdp+Je9LmHZkGtBahIY18JVYakeoqgLgUoeGBq4JZNIRm9/wQoTU8KmaHHnYL0XxpgWAfjGrrKMmHlJbNU5waDWvB+cUdpjYzUZqsWyk3a9Lklz/xCfpRiIjBR+zYeyjQiLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKaRlSaPCMMykShtkS0LUKLERzI486dy1ONsqiQCpNg=;
 b=dLkX1ozj2naLZ52La2fXLkUKPXpcQLFydawOfF1x4jo6o7w84rKt2MR95DbpXvOLxSIGHZG+NSEuYaqWykTclu+VdHAbWaSWRTDJuBsvSb30dfHIrav4maWpswoQysNsDLoOT+jDKAqWWJA+Qj0y+gL3hQOSo22f0DKpA4PLjjfUGXpxrDkuKJAhWtBh+b4ijOlx4Y2FM1X1BQ5gmOKUpA9V9nbEHSXnLF9lDMrgeh2Baw++p5GlDxXgVlnOJB4p6d5Oe7cjM3bJq4IbSqBtms+rS4U3nDn2z/kq+1spx25cfdwMEIDD0FQG2llx3TlRCTa+HccZRv2YMEYukzPSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKaRlSaPCMMykShtkS0LUKLERzI486dy1ONsqiQCpNg=;
 b=GxaL2gOSconzQJkztYZ6OdWieU6sLNnYm+WRhibeBa7zrvGZZ2ywuVASjhrQJF+FTGq41/jwDwVNNFFuU4rubjRqWh3wpjIVaVwqdt1TcInQfU9r8pCtPP73MvStrK3dsCVrxOc35NrfCE2AgcGy3oXmQhwl8OaoTsN4jy0AOVBGFjOsoLvCaAytXpQmbDVOA1VqTDLgJwP3z3m62KhUV4IplauuKSBtPy9+JL/gi4VnRGLpD6hGIrn0LvYixp1stLolemswRnR05UY+7xD/wP7VH1tLwx3xcc+kx55BJ/bi6csCE2obkaeGs/f6YNU4nnLSib6cGO1gdYtTJIYJ8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 15:27:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 15:27:47 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v5 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  6 Jul 2026 11:27:37 -0400
Message-ID: <178335164742.1364211.14423037178041926472.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780998600.git.stefano.r@variscite.com>
References: <cover.1780998600.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 58807719-537e-4b30-29cc-08dedb73220f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|7416014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 sQP4sD5QSORk4Xj3JQNIkB/LmY/u9PJVw0gvL55wy7uZRLExulKyUPXI16dbe82bOfCVLMBcFeyIRGcE5qTB9PoJIr2Nhsv3wd4bTUYXf9X0z9CTDS00gr8Gd5Tp9YRjRn0FWGGTsRjDiK9MlGI1JDGZbP1nt6T6wkPRgB88y6N4g+Ye5tvW2djuxt/Cd5fZc4RuGkESdyUw6E4Zl6bTh5HNj9/vDAHJGCdtomjPGX6ONSJ8bgQM660Zi0/oUQdYqMHRpBSnC8vUIpZsQodc3gRlTcFjHbxYCEqDMLUg+ylP+m4A41wrdXzNAjd2xb8PViv4Sf08jOYPECuXko/SnAw4FXrFlUsBp4t67/LNTo9/CmGzDwf0siYJ98eou1DopRE4h3q5B66h2XhlLbkXc45oc0TsaI/ZH+AUkNIPkeWsKFCCPsKCkTBk63s6R03V889uOshjKvXDjJIftlarC64VgBTeG5SCzDy9Cx8TLeGCsWp1v4AI7H96kdW06B+X4TyqmC3jLjl6Dd4vP0m5DJa8W4+uUThxO+1B2isWiEqxCV2/6BkVSFX7MDjvE0EkY1OiByaBUmJhBfRyw1/0m0XRxMvoRbcw3d3FFGOd22CGjpJnorauEUHoWxeWVGp+mBQp5qyB+91OPFO4Anb9HjT+dlMAAmI4F2865flD2cs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2s4bEwwK0VpYzkvZjdYQTYvTDlLdHVVazdubU13Sm96VjcwMVB0alZ2V3o2?=
 =?utf-8?B?a29pY05QTU90VlBEbXpLQ2RSOXNOUHB2MHVGZksrWDNUSDFIMGNPZXBoNXFu?=
 =?utf-8?B?ODdkcG01MzFpdlpvTG1IbVlsR3lXSGpkTjNqUCtuT0JpYUdvV1VpcGVzaVJZ?=
 =?utf-8?B?YThhajk0K25SNk1sTGhXN1JnWVAvVW9CZmtEa2JJcDBHUytnVFNjcWVmZFFT?=
 =?utf-8?B?ejJ3M0hYWHNST0dEYXlvbXlITVBnUlY0VVFUaHpzOXlYYm92ZDR6eWZyWFJp?=
 =?utf-8?B?QzcxY2FFNDBCNDJISUwrNm9oU0RiNUd4RHlLcWtmVDE2NXk0WmcxMkRZaUNT?=
 =?utf-8?B?eVlzOGN2NC9nb05UWEg5MjhsRmc1L0pwcG9GTG01Q1RJMTgwcFVKMEY3bFFr?=
 =?utf-8?B?MTBldGRtNXZBejRxbjNidVpMMXNZMFRqOTVaaSsxbkNjSU1pa3dURTFoeWIv?=
 =?utf-8?B?dWhycUZidDlJNzRrZWhSWityWjJJOFkrYVhUT251Uyt0cThLSzUyMWZHT2ZO?=
 =?utf-8?B?Y3kvOEUxTXprWXIvYUlTYnpnRU1GdHpseGhIYjJTUWhMaEN3M2dwam9RYWxY?=
 =?utf-8?B?Y3ExbXJqV2VpN3JNYnFXYk9tNTlvRzhvY3NidHdFMWNzZmhKREl4bzZNcGVu?=
 =?utf-8?B?d2N2ZU5yVmJ5RmNnSkg2dVhrblJoTmNMbUFvSHJIRUFYa21SanlYdkhQVjZr?=
 =?utf-8?B?NldxZlQ0Q3VYc3ZFQkFNcGg2VGpHSGdRYkNMYUNhTFBSUVNjS0E2dlZIL25F?=
 =?utf-8?B?S3R6MW1iSDJ4czBqbFA1Q005U0c3NEJGYlRIZ3hsWlVBOEhuWHpSTGdhWkxr?=
 =?utf-8?B?RjM3T2hUeUhKT1VwNGNMOTE1eDBuV3J4TlNMaHhmWHF1aS9NVFZZMzBiVGFp?=
 =?utf-8?B?Ny9MUFZLU0k4MVdjZ3luWTV0SEo4SCs3QjhHTS80Sjk0b0ttYmtDVTJHb1JN?=
 =?utf-8?B?QjhKNUZHbXVLbXN1M0k3dkNpVTZ6OWxtSWxwcjFVWnJwT1VvUmxwaDdpOC9Y?=
 =?utf-8?B?TmVMK09kU0lrN2xaSzhoRHR0bjkxTXNXaXJvcVhKd1p6Mit1Tit1c3kweTdW?=
 =?utf-8?B?WmNPRkZlcURia2hZVGQ5ajAwZ05TWHJZM003ZUVhZHBreHp0bFhkU1FMaWcx?=
 =?utf-8?B?Zk9kQUlCSFo2UVVTTjArbC9HTlh5N3RzSzhIUzJuck9yanZDeFVHYTFlWG5w?=
 =?utf-8?B?d1dZYnZaa2RBYXlQem9iTkZuMDNQbXRVTWVDVFdzWm1FbHg5U1pRMTdCQnhv?=
 =?utf-8?B?TnBvbEtJcnBoMk9oZFYwZ2RLY3V4YlpmTTJNQ05MekI5WVFVODNGUGpaa0xT?=
 =?utf-8?B?NUtXcnNqVUVGR1BXNVNQMDQvMEhaYlNPajJJV3VoMm9Ud3ZHMnFuamRqSlNI?=
 =?utf-8?B?dUp1Z2U1UWF5S2Z2SlBUUzVwMFVKSzNrNnpzOHRzQ1VqM1d6TUNJb3JCMDFX?=
 =?utf-8?B?TjFNMzlmTkxKZTdjRjJNdzZaUDl0WTNULzJ5U3AvNTg2TnNLdXNOdzd0TmQ3?=
 =?utf-8?B?REJyd1pRYUZiVC9KbkV6WXQ1bmg5Nnl1bUtYczBxSkxkUDBocTBOK0FBa1pi?=
 =?utf-8?B?ZExLbDNpRnA3eXg2UjZXNUhSUXVqcm5yS2hzVlFuUEh4VlRCVm1EUmx5Q0Fw?=
 =?utf-8?B?YjhaSGVBRjU0T1hqK2tvMmJvZHRMeUJUT1lvb3dMSmtXNjhiTGgyckhkd3p3?=
 =?utf-8?B?R2IraE1VRjZNRW1hcWcrelNVc2FuVEpsVlpyY2V2b2xpRml1TWxpcFpOV1lT?=
 =?utf-8?B?MkRnMFpFblM5K1F1UC8raE5KbnY1L004U0Y2U1F3UFNkRm1ORVhHSzJaMGR4?=
 =?utf-8?B?QVBrdmM3bUd3dTIrV3krTlo2STNvUUhCOVJPdzlOOUtKSjQrNFo5TjEwamhM?=
 =?utf-8?B?U0dKb3Q1TTNxc2hCTDd5RHNSMkduOVBjNjdqbFpjN25VbTZUQ0FTTFUvUmJz?=
 =?utf-8?B?SUhibWtSNzVOdjlMY0dPUzM1RDQra1BVL2JBVGdOODZZdVFhYU8xUVRtNWJh?=
 =?utf-8?B?VTk5VFkyeVdMbE9wWHFxeHBXMmxsN1dZVWtxZ0RvY1REakEzMEVaT2JBaTRz?=
 =?utf-8?B?MkVlNDdzUlIzcVpPTklmdXVhMklYUUpJcmVKWWxSdmNESTBOOHUvdEN0Zm16?=
 =?utf-8?B?aHRNQUkweXNNTnBKQ3drT2szdkFBaTk3VEkvakh3UmUvZEJZV1Zaa0ZvSSsv?=
 =?utf-8?B?ZVhxU1F2dWV6K0VDVmgveng0MjlRV2ZhSUR2SXBtMXNmOGVLOVVoc24wYktY?=
 =?utf-8?B?VDhEME0xWDNxWmdJZlJRTHBVV0M4MGZEVDRZc1JOOEhjREhjNFg3REo3S2tM?=
 =?utf-8?B?eDUzVDd4K2paTkE4bzRYSzc0Tzc1ZnBwLy81TzJCcFFRR3lTb2Q3UktJNTFj?=
 =?utf-8?Q?ZFRnCw3jW7mt0n6Ar35/svVE+eVM1tmIa7N3m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58807719-537e-4b30-29cc-08dedb73220f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:27:47.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl3WSG+yjiOQ9W5N1jS0AUpQbsp3HjrMqSyo9ybiC9I3I2UbzV6fzpinxkJL4yLjrytJ7X9duHmk2TSnQgHCpRhzYldqMrSDvC0ZZPYDYpCTtxxkWv4oIE676GDnGzvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483

From: Frank Li <Frank.Li@nxp.com>


On Tue, 09 Jun 2026 11:51:17 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX8M-PLUS
> system on module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
      commit: 77c0d4cfd43353e8bdebc4eab8e579518e2dbf5f
[2/3] arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
      commit: d08607aa231e026cd94b4c33077f8b8d28731952
[3/3] arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
      commit: 41cd3d91ca8595f48cae5169ff8e4089c88670f2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
