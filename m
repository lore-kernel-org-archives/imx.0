Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B5420499
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169371; cv=fail; b=H+8UUR/Coez+/oHd9Ab43S6ikQaBTkUr4QlSzNX+MMVpalWrF508NZvfQi1M8ce6zgqRgNmVVF0sP90dLqUNBhZzwATVvcO0BuH9ZslZ9PUetj++o/JP6Kqic3KS0oCkwTH2HKwaLSOLjD7X+ARoLA//2hWH7eUpXXvDmLNQOWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169371; c=relaxed/simple;
	bh=5UOups00U58nCq9vlQlZQi6i48mL/JbuvWy9IJ7lbDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HBQL3cETw/oYdV8wNogbR9GmaV5ED11iHOju9k5HHlk81yMkkk/W8JjMO9TioJzxlQvtkMZ3qY1NsbCYRQEJuQcBBedRinLRpn2D6ka5EQhjD8NAJHH0EDOvV8Z+1CgCbALUZ3Oo2npd1v6Y0SGlNmEB0zMewRGpDOJUUPpAasY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LTS74ptj; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LTS74ptj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3V3ggihA45RfcbYHUH7Yztjsg2MYvAkN1ZQLRVcO9r1aPwMWnKW+IG3bgRb5DFjXHqvMrwj1Vmt/+d9Id2P3uZwFETMa8VmFLpAZluuQRfVi49GbQfFuC54RAsd/YCHo1R7UChCTe7lwempF10g0NnSOCPt8Sf9bxTlCAUVjy2HDrHfqrC8Dqjy29tivgtTd1IU0M8nyJlxalDYJWiJ5aZc3nNyJnEX/qgxQRQfdi5r3huI34LGhQD3TfAtPwCIFMRK4o3PQ0FNDSbxVyUeGU9BS8kH6bGvsmwFdJuWiFuN751m47ycgykjJRGZMzUXnrh4QLZjmGrqaNlljbCm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=panrC/Reuf7+SPXEXLitbJGpa4YrHNhwYQakLy88rvU=;
 b=bAe2VRIt7SIFT7CTbimvaWaRDHltylvlc90Rku6Su8U1zNZVEE8NSb8oRnZ13udR86qRXZ889jUOTx6bBDC5sFeWmFd9oyN0L88SP5QO4xfozCA0L+p3wrvyqP/0GnmwszLgFl8h3fSAo6wRHPxDFgxjlIPWEwRpOLfleVCFas8GoUNyDtsvr0+SLeEAD0u9wNYUZVKXnRy+gSzBpLgJfQdrl+s59OD3l9XxnZm9SNHpQObSnq1rZxmsPrt5LnjRmAZat2vKhl362EedUT6x2ugpXCnaOKeAyO6zYoyN1gsgY7hNmcz6LtwbjWWtn6pMhKzapveHL8QubyE3uaBeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=panrC/Reuf7+SPXEXLitbJGpa4YrHNhwYQakLy88rvU=;
 b=LTS74ptjnx6c1MbvPSybZYbZnsBMa6hjTzCWZqSe/xcA5+41MTKLBOGnnfp+qEe3fsYvoSHkLiA3pYRUUywcjJLvYrN9BjXHyoMebVbQNx31sgdYKNg+YVu9UtxOMZP7hjZ/Kn+Dc75qxQmbiSXf8bZOz7dS2gyevFr5EJLC3KvfXpdMp60a5bV7zPbHRT8V/2g6T2W/HYS0zyNONO7e0qSpIT9cMmgVfCMsCRpKp3lFFvwlo6yGzVwNxwFXkxip46Cx8es8Br4dhQcOT8mJUxX8WLjjRV4hij3b2xQyjZVuwOnlud13A7+u4xm75vOkigS0qZ5G3zQ7zJCgcmxD8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10651.eurprd04.prod.outlook.com (2603:10a6:102:483::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:22:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:22:46 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: Re: [PATCH v3 00/11] arm64: dts: describe the Lynx 10G and 28G SerDes blocks for Layerscape SoCs
Date: Mon, 27 Jul 2026 12:22:38 -0400
Message-ID: <178516930294.2511550.7471897073188886058.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10651:EE_
X-MS-Office365-Filtering-Correlation-Id: e9caa93a-473f-40b4-0c5a-08deebfb4af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|18002099003|5023799004|56012099006|22082099003|10067099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	caBSDb5se7ytXX+KcTkKHcN7JrYFjSSa9PMyfth2hWu0b1FkU9F39sYTvk1xkdqQT/Odk8UVuW8cUp0fMgVTkhw2F9Kds7uUBqIdc5U3EU3xNK8siThqcmlZuSYrUo8xFuZTXlo4YUXwA19Yzb94K/YskgArcI7Ddooj8jxumqK1HD0/SzRYOVO7kNG3DuLe/kPL7wvD42lyWiHOzcJtHEktVq8amtYy16BHGTUpysq/4Uk0LJG9FSFZ2Tlq5salzdZvCkDIf+7XpWqasTRusKnNMHaGB1WbdiqmKcHc7/Tklg9Yam1uYYKgbrPwmUlF5dXn2d3qU0UZRMC9EHfAoDIY2uJkVU3l+1Co6BdwKgqt/7gTX/QYqP0s/gleTKpZ4LuRanGHgZT1XAIqeRkPRJSpu25P1mUu5OqmelK6bcqJUeaRzboBeYZB3TwUoUbDVF9qXEIh7Vpz6d5ooVbx9mwAr8Ir6dqNPHOCfPwKwFVhmU5BQ5CK9+uxyTg0P0mN/HrjCFkvVmYeCmb75nL8p7Ie3VAEOsgVT1f53u2RyprAU8KoQjh6xxu4Ub3K4eM3hX2ghqMuiJXDJqOGOL0iOdU+08XzByemf8IQtVs84x+wzCxdCTXIYCRe1BuijZVg+xLihnz4RmpqV+iurAVCvCsuRv9FF0OGJ9R4/83FhtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(18002099003)(5023799004)(56012099006)(22082099003)(10067099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amthQnJrMktKSjg0T3p0M3NrOXF0VElKQTVIa3dUVXlpeHlEYklNN29SSlhk?=
 =?utf-8?B?WnBJS2pZNmtVcjI3aHlvcFJZK3ZZdi9YaUdLRGZOK3pRWGNLZU84SFBnbHpH?=
 =?utf-8?B?b0d5dkJKUjBzbXdZa0tZaW12blRsd3p2NDdUQmI2aDNGWnltZkxnaXBCYk9N?=
 =?utf-8?B?K0toeXRKMWJxWGdmQ1RMRjh2a2pEZWFIYXFNbWhNZlBKZERQbUlvUXErNmNH?=
 =?utf-8?B?a3MzME5xZ1BORHEzWkRTOHQwOWh4SFFDSTlweGQwbUJibENBQzRDZ2ljc0ZN?=
 =?utf-8?B?UW1VSXhkRzYxcSttVHJGRWJOUU05dzNxZ1JmYks5VXVYQVN5ZVFUZm05YVVx?=
 =?utf-8?B?dE9KNnBnaHpqNTBkRnU3V3c3K29Qd1g1OUlJNWM3MFM2MFRZZm80cGxLamk0?=
 =?utf-8?B?NEVVc1BqYnFaOWc4RHV6b1JjYWdGdml2SFFoVkdXcVNvSXhzYjJCUU1XY0dU?=
 =?utf-8?B?Nm94MENOOUk3dSthcG5LU1JCMU0zRVJvb1lCYkp1clQvcHFNQnBVTzJRaEov?=
 =?utf-8?B?NE1iOXBVVmE4bXRJK3FMMHdnVFprN0YyWm9abnp5cHh4ZUQrVS83b0J6ZkJo?=
 =?utf-8?B?cm1tcjQ0OXJFazU4ZkI0NWFOYU9UZjhSbDdRRkw5ckUwaU1tT3IvbTJMenZa?=
 =?utf-8?B?QUlzNlpWY0d2anBNTXk1TWdxcXdkRDZLdkUrZU43MS84eU5DYmw0VUE0clRz?=
 =?utf-8?B?SlFZQzNsbVpUUUQrZXlaMjMzcXZ5dklUTmxCYW8xUWIrTjl6cWFrejhnK09I?=
 =?utf-8?B?ZEpzenZaakM2aWlmQXpmQVoybWd6UE1Ca1hpK1hSMHlDNzN1S0JFQ0NkeG1W?=
 =?utf-8?B?MWRsa0hNUjlNbHNlVHBlZlJCWC9ZQzRjazliODVvREZLSDZjUUNhSTJpa1FN?=
 =?utf-8?B?cVdJNmN0TTQyYW93bGxwdHhmRG14OHloOW9DNHFPWmd3YVh4Tm9LamZJL3BC?=
 =?utf-8?B?NmpsR1J1NXRCaDlVQ0dlUmVQNnN2RlJUaEhnRTBZQktldDA2L2Z2c1FLMm9v?=
 =?utf-8?B?TVVyZHplbHZUZmU3UlF2OFUyZGkzNjFBenYySTZxUWJ2NmZnU1JCSzVBYzZW?=
 =?utf-8?B?aFY4WlRQaDAvQ3d4dFNJK0E4bTMzQjFTN0VUbUtENzB0NTJJTDlvVTRXWDNQ?=
 =?utf-8?B?dWR2bERzamg2K2o3T0JZK0puTGhlT2Z3QVJ2cU1WN29BTXRKZkVjWFVTOTFU?=
 =?utf-8?B?SDlpTWxrOGErQ1pOL3JzSHpPNHZNdU12dkxnbW0rSkRUZC93MitwMlQ0Nlcw?=
 =?utf-8?B?bEc3bUNGUnp6OHpCM0ZkclQ1ZUlqSVBySTYyaEx2NmRhWENZcDgxVjVESyt0?=
 =?utf-8?B?eG52d3Z3VlB4Z1hCQzRBNzlUQlRZWkdOdWhjWE9PR3RmYWpDM2VNUVBwbVM3?=
 =?utf-8?B?aXdmUGxqK0dFVTNyeThrVmdwd0YwVENhZXR1c0lmVU5XRG02eWI0QkYrVFoz?=
 =?utf-8?B?YnhKMzRPblY1REw4TExiZzN0U3dZNDk4WmpPSGtoSVJnTmtFdHp5eU1ENHc2?=
 =?utf-8?B?Rk1WdlFBMFFUTmt3UDJsdHlUMmhnVnpha3BwbTBKUHFybVFzQm9lNjFvZU5V?=
 =?utf-8?B?ZG15NWJ4bkVoMXlVVHNRUU5kaWQ3N0V2SnFZQ0tteTFwUXJacGhWaFFkWG1a?=
 =?utf-8?B?L09nakkvVG5tSlZzNUJId2gwbU5nQm91RTdGbUIzL1FlenhZZ0h1NTVNTVA4?=
 =?utf-8?B?c2V5SUxJVFo2NUc4KzNpbldta2ZVKy9rd1pTckNuTDdHWEpjSlFjU2lwWWJM?=
 =?utf-8?B?K2t0ZkpNYU1zMVd0dGF4Z0F4WW95NnhMbFBsWE05TDVTY3c2OWhVQ1VwZ2JD?=
 =?utf-8?B?M3Z3L0RSV25kaUFZeWM1WDJNaWx0RjBuQjRJdk4yUTI1U2pvU1lBWmN6YzdB?=
 =?utf-8?B?emVpRGJMQ1VSa1NmTTlCb2xhUmtnWS8ybCtWeUMybDlVNGE4KzcvUUREcm5v?=
 =?utf-8?B?a0JnZ3NhMHQyTFFLeE1BOFIxaEZMTmxRUHY5U29yclNDZDdqVHFaV0JZSnY1?=
 =?utf-8?B?b1dxdFI2cHZxNFFOaHlaQUcvUmpjK2ZJTldzZWFBZjZzdnpWL0lhWTBmSTBu?=
 =?utf-8?B?ZlptVElWTTFsT053TmloVklWcVlnemR4dDU4QU4xKy9JUkJwWUVWRHU2d2Vp?=
 =?utf-8?B?bGdISjU3ZUR0SUkveGtpQkgxWmtMbHpNN2lmc01zZ1MwQ3RRR0hmTWd6TmFv?=
 =?utf-8?B?NFNJRzNyZVYyWm5Ja05KVmpDMW5SV1kxK1Z2OUtXM2w3OE0rTWxCeWdMUFUx?=
 =?utf-8?B?ODNZQVZBRndldFhaSmxhWXdacWQydW00RXhUYXlObVV6QnR1NHhoSWdXN3R2?=
 =?utf-8?B?MmJuNi9qL09VMVQ0Ti82VE1wOFpkUDhOREdyR00rNlducHY4bEpoekNla2Uz?=
 =?utf-8?Q?1qz9Ai4SYh7IhM6sfJO8leSqhXBeyOnaFfoAT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9caa93a-473f-40b4-0c5a-08deebfb4af6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:22:46.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgRULU8qZln/5yUWj3+MLK3TbVgZ9zRe+7WoYAPECS/9XQ0FGYv93zCwyno6/tQ8fauVfd/XlogX4hJbqBhDdK2BFN076Mszi2NZmnSn2rmBhkebLVVKx4Y636lVYM91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10651

From: Frank Li <Frank.Li@nxp.com>


On Fri, 17 Jul 2026 15:06:24 +0300, Ioana Ciornei wrote:
> This patch set adds the device tree nodes for the Lynx10G SerDes blocks
> found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.
>
> The first 5 patches slowly change the LX2160A DTS support to a new
> structure which does not use any delete-node or delete-property
> directives. This is a direct result of the discussion with Frank in the
> v2 of this set:
> https://lore.kernel.org/all/akwAmzAbtg0Ejey0@SMW015318/
>
> [...]

Applied, thanks!

[01/11] arm64: dts: lx2160a: explicitly enable serdes_1 node
        commit: 8f62ead195283b8620070985ae642a5a1db88843
[02/11] arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
        commit: 12422fe9b3f4876f953bb1699e8c2c18084e58d9
[03/11] arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
        commit: 9f0f43baf1ed556e6b16ddd5403dc44c5f21eb6a
[04/11] arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a separate file
        commit: 8f69555ef54c59aa0207cdd0e15939417730a4e4
[05/11] arm64: dts: lx2160a: split the dtsi to avoid delete-property
        commit: 285560f0d39dd6cd40c5c83470e4d3e43effd4b8
[06/11] arm64: dts: lx2160a: transition to device-specific SerDes compatible strings
        commit: bc12e3ee01c82f2da45c6240b74f501b82732b27
[07/11] arm64: dts: lx2162a: transition to device-specific SerDes compatible strings
        commit: 21cb12ad026e91aca65329531554ec1e74a32e77
[08/11] arm64: dts: ls1028a: describe the Lynx 10G SerDes
        commit: 2b64e802a7c8a577616289b023a98e009318123d
[09/11] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
        commit: 65121d706ecd9c7b1365f91cc9f4e3c01fd9f15b
[10/11] arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
        commit: 9eb4d238348fb1b81cc25ec3c50c13b85b6055d1
[11/11] arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
        commit: c482d6c37187fe38662f278213301b7828cda662

Remove "This patch" and "we ..." in commit message

Best regards,
--
Frank Li <Frank.Li@nxp.com>
