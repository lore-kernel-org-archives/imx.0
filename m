Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FB47ACED
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330264; cv=fail; b=iQNxdjzCmwY7VAVZfhMVPbdLLdMPAIUdk1rRynRjh+qDrfO3PeHo+7z2tUv/9KKedRd0osqAdCtne9ci1LI5bzJwVZtTJeta0OIo8fFDyyGWovti25WZCKRufvi4/NEV6aGIK9nlqLsEPh1aDpTaWz3UiZUzbtnim+wiwO0LJPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330264; c=relaxed/simple;
	bh=ZomflEDPKLsQxO00eEHusRaWLXfrvMcwuGKNK5zE4cI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=tKOC9Xnv9efyX0Zw99qDm4s13XJ2LUjaqGTxnOEBmqwegds2PkSOQF9zguYgRtQf7Cfwj+ddBUCBHNBJjrZmn5Lx9pRbXn9/jq0ZzjusrUfVsiDENCi8E55EaZQ27Wp1Pq7vUSOEAlDywNNnd3NGahkcyVwlA40DmI2Wyszxbr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qU6XsDo7; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qU6XsDo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5r8oY5cgCEHNMyHmPy7qZMrFYGdU5DYDAdexfaJVY1QwDUKnFfUq/GsuKXk4SDSRkZzQGCOWI9Hv9jjmoFOMMYoct461yZSMiBC/Cm6i/jetQY8sNpyrGxhitTOgqy3SWbC9HFbP48GIzgwtKuvOq3mGSS/sYn/PvwlsF8BjlHwUC2fbGTYXjBrBJQicgoV1cp0IfPvzePV83P1rpgWX2FFrjFckXm/6CDkwqKFW68EzhumdsfxMs4zgzOwmd2yb6St1cm7WEbshVrDSC0VbhTuDFxQ0RAbD4dnwe/6N/7w1K7dDkYvq2AMM9ybgwTYxXuwEiaKAPPKumgOuRNE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+PW4R83+Lypo4hBms/2CAE3TcXPbOiPP94PKqG/Kk8=;
 b=u5cxQF2v/OHm8ZgOpx1coLOWwVccYDRS3Pn0+6oWo0igCDm0p103aeW3V+0gLUH998TGlABproMO6GR1Se7iNbPiXkfnvOuihju4Xu+OyqN2La8t4v4mOslf64enqKNuTeFwGJMCo96J3SBro8SxpjW8cZozmgjFCgZNlvWh/25d12T8V5tU4pAagCFL35o8tvw5rBJc46AK8k+dzWP0vHmnvRCHbw3BJIOiV2HditkUs5ih/y0ymrG25ZbFEPkckgBV131Gyt45NmXaq7bvGQsrizT6qhZIgW7CZfS6as828kyMNbvTi3p3i0BbrRu2ze6TA7ZZdpclzIH1fUj3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+PW4R83+Lypo4hBms/2CAE3TcXPbOiPP94PKqG/Kk8=;
 b=qU6XsDo7Hu7qsczyuvYF44RbLkMkfXP1J9bI3q3xBpurBGSS6b6e7LzDj4Qlw+Qvx7YRvpxxXH/3zBx/tqBa8LBCnVaTkoNg+PsduPJfuGG2tian2lFblZ9DwCePHtIhnuRUaSC4SmNxJ1wP6fUO59bokB1N0s/UtFLVtZU/QwfzaWrBYn8riJSpYY3YUuvol39Qct4xkUJX0aSK3WK+mocy1JIxvoqm10OI492ovm11AozwOCBZe3SmE4+IPyyHvZT01ifcI27diqCF/l+mUjp97j40bjDxfCjLer0zN0PSJkSlgWQLwAYBEDC9VkWH/eiUc+DGdzzxDVtOacr2oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:04:16 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node
 names for remoteproc
Date: Wed, 29 Jul 2026 21:07:56 +0800
Message-Id: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz7aWoC/02NSwrDIBQArxLeuhajkE9XvUfJwuizsdAYfDakB
 O9eTSl0OTDM7EAYHBJcqh0Cro6cnzOIUwV6UvMdmTOZQXDR8FZ0LCzBa2YiMWmlrI1tNSoF2V8
 CWrcdrdvwZXqND9SxBIoxOYo+vI/ZWhfv1+3/umvNOJNNN2rFR8l7e5235az9E4aU0gfU3KQgs
 gAAAA==
X-Change-ID: 20260728-rproc-dts-3f331df7ceaa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3fd8e8-1706-4c76-c85f-08deed71e514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2FJpgV42F395n+HCu5ImDjHTtwKEBgxpe6rbV1inKUsgJdx1P9AjmA72xJsJ+WDQb7wocoelDt1iD1LwCm8Qgh5ZJR0VP6P9uFfwZCtMlqPb/XJ2/z7V4xO5T3JwWe6BhTNmYPGEqwv+I6BojwtRbrFi7QwdQfF2sk1Xpy2oOXRW5f9/cDwGqrfHxR9iq9epn/g2LUzmyRu8IfKQMy9Rsc6l8q7RfGHPs3RtjB8KhXBXLx7L3hctYAK0ZNAVwyoZ25r57q/QBValQqyX4nngFSWX7Ytv334L3GazIHWvfq00Klb+HKGGahAnyE3SBVlVsj5J2+Ulwu8CMwjzgMn+F8phSlbeyLY8G/zoYHhUZ2J+tCV7Q0elQG+NdERx5Lkf5vEgjR09ZdjSk6HwGZFeA+eyyCAUgN1OCF2tvW5FhNHpa6KfbOo2zfmXRC7Kv/0valMhrnoTkEj2/W3MkE8uUsVcEJN4Ky8d2el4qTAd5Vk1B0aFhgSqQHRDCRgysJ2G7ZcN3wVt591WFgano4kPqIdez9Zpi7jNmkPTahIUH4ExAiIELaXX8oImoW35wrewTThOotSTa9vHr0Nw6/tdvZ6XTHOVFTeGZTB5GIV0QhJY1QEJn0vNauO5hnM/irGX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHAyd255UWp2ckNsTURqZlZIWnJRdXl4Mzh6ZFNqQ1h3M09PT3Yrd2U4SzFk?=
 =?utf-8?B?Y3U3ZUxzSU9pY3REbU1ralYvZWI0UlU0czlPV3RRK2VKZHFuV1BkaHpoUC9N?=
 =?utf-8?B?TTRZMFRDQlRKYlhuZm1uSGdmVVQzYlluMjNUSCtPeUhsTWFpZkFQenBzZFEw?=
 =?utf-8?B?VXBDSWFMWkVZd01mRnE2WXM2Zi9hNC83cWhwRElkSXNJT0FrWGNXWFhHUzd1?=
 =?utf-8?B?OEhSRU4rM0VtOFRWNkRGckM1KzRHSFgvUkFSb1A5bW5XTDNzL1BnK3JobDRx?=
 =?utf-8?B?VGFEaXpQYTFwNWxKQStwcGlYdTR3QzFyYTh4eDBnTXhNWlY1Z1BiV2hWTkxl?=
 =?utf-8?B?M3AzbUxtUWd3ZjhDY1lFRE9EaE9nRnl3WklqTFF0Q2NlNXdZK2ZzUlhVWFZU?=
 =?utf-8?B?N0M0dGxrbTdLQ25kRFd2emFVc0dvT1pyVHU2c2I2Y0hSRjBOaGtnR0FwcWJX?=
 =?utf-8?B?ZWtMNnhCanZvMEhiVnI4NG9XenIwdEdTQXRpZEsrTkJRbkY3MG1YTE9zV3NC?=
 =?utf-8?B?L0FXYXNLNDJEalVOQVF1NUUwKzRXbkt6ZzQ5UWh3YUFoeFYyU3lOYzZxWDRK?=
 =?utf-8?B?dVlqNC8zZ1JySUJURnFydEh0RDk0YmZLTEZXNjZmcSs0VGlveXNpMHBOV3Bn?=
 =?utf-8?B?QjlNNjJHemJKaUtpVzBNOU5Uemc3RVpEbTJ2dXd3QUdSQkhpRHc3aktma2tD?=
 =?utf-8?B?N0syQzVRSHdoQUNwL2JVYmdyQzhWVHJGSEIydHgzTkdJQ1ZuSnp1Z1RJS2lp?=
 =?utf-8?B?dFZ6WW40T3FrNkx0UzJsWjJpNlZuaHZIbnhWWndwSnI2cXFXWlFDenZKbWd6?=
 =?utf-8?B?STh1SEpCanFNVDZ0Nm41ODlocWtnWDFsaWE1RTBVQXQ5Mmt2SlQ1d1JBQU0z?=
 =?utf-8?B?a3ZZR0ZtMTBDMUl3UUk4ejE5UzBOM0d4VC9MYTZtM00zRDdPaW5URXVIUUp5?=
 =?utf-8?B?OGx5YjRzWno0QWw1VTFZS3JGL09YQjllUGZhS216MUpzdFlRbDRyNCtJNlM4?=
 =?utf-8?B?M3lOSUFaUjYrYUpEOUVLaGNzM1RaTjd0VzJQNE00SWd5eDdpa1BLOGVTUWJD?=
 =?utf-8?B?cHUwczJBMnExSlNDY2ZJWFV0YVMwSk5SbkhEWGVnR01tSVpodDRjMTd4SHJk?=
 =?utf-8?B?akV4algxK0MvSU96OURTWGd5NEoyOUpMeFl2dndkaGYzVHVLUzh0b3gwbENG?=
 =?utf-8?B?MEsrTmxuSUhYNUgvZUxHRXp6RDFHVHR2OUYzOWprajdPQk81SVZmcG1Ccmt4?=
 =?utf-8?B?dWJvRStvK05ZNGpmREZMYjRJYkVmYVJPWEZFbFFwRXQ4WWN0NXFyNjFoQW1G?=
 =?utf-8?B?cURmUENNSnNIT3E3OEsxaFA3cEQzY2Y1aW90L3lGWlNOWGlUMXMycCtmaVlL?=
 =?utf-8?B?dlB6bGd4RkM5NFIvSkZia2t5d0dadGNkeHkvdStSaUN4enpxNm54R1lQTzlm?=
 =?utf-8?B?TUQ0bnRGYldNUXoxOEpWVkJFYzhJNW9pdjU3bnEwVGtoYmw4UnVFRDEvZktx?=
 =?utf-8?B?OGUzYmhkc3pUTkFGQmh0V1A3U2VEVXJJdXFJakgyRnpvN3RVeWgrNmt6SmZp?=
 =?utf-8?B?T3FCdG5QNUE4ZHBmak16RDc2VFhwdmZUdCtuUFRGV3ZaZHUwOWxQRDBBTGVK?=
 =?utf-8?B?WVF2dWtmQi9GR09CR3N0ODY1RTgwU1lyZldrcHdIamN3Z0JNZUZHQ1NoVk9x?=
 =?utf-8?B?YlFIOGpmem9JRFovZVRpMGorbHVXaStvSHlsZ01ZTStPVDRUaEhpYWo3RDI1?=
 =?utf-8?B?UTF4dWpqNy84VjZMRkNCWWNhU29Qb2xRU2NtVEhMdW9WOGNPSGpQS3NZbUVT?=
 =?utf-8?B?L1l0anoyVEd3ZCtTTVdrZDVBcEFmcjJpWDhpdWl4MS9GeVdTcmdKUmI2ZmFu?=
 =?utf-8?B?LzBiT3lxbXI0cmhiZXZEM2lKNVYyM2k1Tk1rV0lvTVFZL0F0WjdlZ3NMTGY4?=
 =?utf-8?B?YVhGZ3lrMk54MUxjRklkaDFLeVlPN1R1aks4TWRoWjlqbHlBYUppT0pBUlk0?=
 =?utf-8?B?aGkxank4bXRFbUV2c0lUL3R0Q1NsR1NUS2FaektLN2I1YWtYL1lzOG1xSFBj?=
 =?utf-8?B?N1hhbHJ4Wkd4MHdqb2Ewc1BiaWlSb0kwcGFMWEVsM0NhbUE0WnhtUzIrcEhm?=
 =?utf-8?B?dHhMa3JNRU5mRko5TFg2TmxQYlhxYUVjU2VCNkZudEU3ZW9wSVZmb0ljTURw?=
 =?utf-8?B?dWF4cWN4N1RpbUVkSWRqODZ3dzJacXpGeWxUMGNpeHFVckwvSnlTZEU3UUEy?=
 =?utf-8?B?Y3FjT3VyTnEyL1VYRmtnVXk3aE9vZUpUelJTc2NUUVRueHJRaGl0R3ZFTk1q?=
 =?utf-8?B?d3hoWU5oZTcvbXZXOGpTZE1PaklGaTV0aTFCRG0zRldJUXIvQ003NUUxWU9Y?=
 =?utf-8?Q?X1j7vMTYVHwjsCOwJehQZf+fxUEtdFRr4Nd6Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3fd8e8-1706-4c76-c85f-08deed71e514
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:16.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB2r/pX1dlqKtxYgfZXFdxVXFhBojHripgOXllapquYsBF+CnAqmget/8IylFVDkQuGFVSISg+QKtL3Wl0WA5Efup6FEmH6WOsxpjGm4AXPN6Ay2jp3QmdcHGuovuF3j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions. Several i.MX
board dts files used incorrect node names (e.g. "vdevbuffer",
"memory-rsc-table", "memory@..."), causing the driver to fail these
checks.

This series renames the reserved memory nodes across all affected boards
to use the expected names.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Also fix vring, rsc-table, and dsp buffer node names in imx8dxl-evk, imx8qm-mek, imx8qxp-mek
- Add fixes for imx8dxl-sr-som, imx93-11x11-evk, imx95-15x15-frdm
- Update commit messages to reflect expanded scope
- Link to v1: https://patch.msgid.link/20260729-rproc-dts-v1-0-368bca0b309f@nxp.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Peng Fan (12):
      arm64: dts: imx8dxl-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx8qm-mek: fix reserved memory node names for remoteproc
      arm64: dts: imx8qm-mek: fix dsp reserved memory node names for remoteproc
      arm64: dts: imx8qxp-mek: fix reserved memory node names for remoteproc
      arm64: dts: imx8qxp-mek: fix dsp reserved memory node names for remoteproc
      arm64: dts: imx8ulp-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx93-11x11-frdm: fix reserved memory node names for remoteproc
      arm64: dts: imx93-14x14-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx93-9x9-qsb: fix reserved memory node names for remoteproc
      arm64: dts: imx8dxl-sr-som: fix reserved memory node names for remoteproc
      arm64: dts: imx93-11x11-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx95-15x15-frdm: fix reserved memory node names for remoteproc

 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 14 +++++-----
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 14 +++++-----
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 32 +++++++++++-----------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 20 +++++++-------
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  4 +--
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  4 +--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  4 +--
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |  4 +--
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  4 +--
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 12 ++++----
 10 files changed, 56 insertions(+), 56 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-rproc-dts-3f331df7ceaa

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

