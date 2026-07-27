Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C73EEAD3
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171363; cv=fail; b=GysMNwhBLyWj3AYdo9D0PZmV9seQTSawLEx+zE+cWcJBuBi8jG6xJELM6/+LkyvCJmNKPOX9o/6w5zmV6QRVyRXUW1dSXHp4S7Cr6ibHZgkiSYTecYgvgLjUK4FU4mKSo4yUKegvjYtqqabkZWNsRnOsze6ryaTlNhgsJycJlJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171363; c=relaxed/simple;
	bh=LHFoUBFsvizjqyLBAacOodCXkNw/t0DkrOVYxGMxB1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ShjebQKqmiMOrZb3xRG86ToMPn7bamSivvCojTtFLDofi4F16uwOfCale4jB+lEApT2ejR2ADE23w37Dagfode8IPB6AipqaPmpXGnkEpRWPqkuh4+lnuwupTghmRElrzmKK+zM3X7wabOhgWly3eBR7FTk82JfctzhP3+KUo3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PglXHmZr; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PglXHmZr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRYAuesBsG3sSuNbW3aUJ8xki84DBM+zN9h5iZWyz+kBmPTdhrcoqmKepeDSCgHITxPNaWDn7/HCSZFBW142R0ScriMbkTqiy/TwDKaJuSrrVRh7lD8kdMEsMRc5+Alxkqaghe+MnkAJ7JkUsgtPfmGsvzbQh+JNSUuKLx45F4TpS7uKYdCvk0es1dnImljsFL2BS5QosLPj74fY1U3JYXb90Iv1jaWjsvD7OFEfilMrHPYzW0LT0MfzcqW0+nqq47+c3miF7YE41HRx40tMhJZY4yK7zezwAEklzTXU9pGXunB+62HU8ivqim8fWFNqZXjBTNFdymwL2bHAmuoMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeeL/wgldV4IGcDc/SLtcdiMWySDjhDQcW4Oo8rcIF8=;
 b=V9pOdsJ2jlppMw367DqUTbw7UeK8aouDy+Wsi839vh1qaOf2WEi33mnuUe0vWKyxsUUsKJ1ScB1o7xOUgN4CXjDyfkMnGqfKwUjmIsfM6uKbV8625agkYZo0apB//b1Pzhco6Gb+CScx1o3UHoerkKis3wNH1rEeJBqjdFLIQ9OPowVu/SZn8+m1y6wrlRcSkdMTBOOFuMa3hzXWyecIy8w1BE81q1CCfAGOXVriI47dYYZeAU/lI9UEDxTdzfuzWJAc3G3VuhR8ENisisRZ5Rih0ZmReBFjk37JMQAuyX/qxI8tAenH4eh7aGGWG90SbBCgqaQ8dKD8tgtbXqKZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeeL/wgldV4IGcDc/SLtcdiMWySDjhDQcW4Oo8rcIF8=;
 b=PglXHmZrl5W6xIlVHPoTorpv8PZQX1JccxrcH+UZMb0mMkSNYzmXdJESjUZlGGECiESpryzjeLHPcG5O8McyF19M8FLnJ62fOAuHUNwcKZ4xxQ28inVwuNfUxS8pBI7WejPgs0MeJGPRiS94EjkaEwKZ6UumTJ66pEAHEb98mq4ZxmLgK3hvBnSmJOlYJEH/4+9aC8I9Wh2Bt4y5Yz5SkTpZFw4+S4fYf/hxk0GVc6A4yUADJxcoQjBCiwAOeCGPrhYhCBxaEkt569qj7BCj8OzL7jSw8y5RKHZy629DTyj1P3NZML8wtvav4osdYukKwsIY37+spdkTwpkGQfL9og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:55:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:55:56 +0000
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
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
Date: Mon, 27 Jul 2026 12:55:49 -0400
Message-ID: <178517134566.2536664.8408318164646229296.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722113305.28817-1-stefano.r@variscite.com>
References: <20260722113305.28817-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:806:120::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: e7da4d9e-fe36-4510-7de2-08deebffed48
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 HfIzEDHgSvjxpjSi08hsouJrGh/8VLo5yWGtERxNUMXpz6CQZsDb3c+HwjwLeVDos1laA+0FVAzv2cr7riRP+rZYJbgL2XAQkTVoXPP4aBBbqtU9a3lgntNwiI69RHT31gue9BuvjiFBFZvGQ0HxcmDwPZ1bo4ecn4Ipu9S3b+R/XSjF1RkVztTf7COzbh0z6hMyi36OaEXOSvzdKhCex0h5G0d/MLdgtllbZfhe05Scu+PK9X5tPjosSnt+pbr71gerUZIAnEHETLkjn58ouPC+fq0sQ2fO45pQ6KyVKP+/ThciDRLu8JbJGov6SfVZugnXPvoXoNQyRWdZW6agrLGu340eFuiVDNLJ+z8ZIyU3Qi/HFlLpzWoOVJkZunfSA23dJTNJ2vQLgfoIEEbkeaoXiXwbw69zwrcd2Fb2Agw8i9vYetfyejSRXPBjzlXNbhDOe2GVYx3XiwRKmULnTHuAn+6rsBNfgXmZZRay2ARxc2nsfnUxoJtSPjP2odK31cMQ6PBuymOWtj5HiAW4EXea/e2cdBjM6yIl7gCTffqau/QFMIdIKcxMKuAzTnDEkOdDuDEIZ+kLyxJYUjNGHS35pYvayDoRPfwoYqghOUs5uFDYD8R9q9Vd6zQQ7ZDJg3w7VMRFjfyOB2Bljz0LIsAYKu6nFo6fslltK53nE+k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aTczaStZVkNxOU1vbHlBTXNiNnVnc01QNERwQTlPSWlKZEtXYUkrZ0RHamJR?=
 =?utf-8?B?MUlid3RpQUltcStyZDRMS005bzYxQ3d1Y0JQOVRhTkhFRWZnWmdCR0c3WE9G?=
 =?utf-8?B?ZHlzRW9GU2ZoR01JcXM1Zi8yY1dDTFhGMHZCYjRZT0tKb2lJRlZmS2R2Vk9X?=
 =?utf-8?B?S2RIVzZQcWJvQXRXbmtBZ05uTDVyc3FNWUltY3ZRKzZybmVLeWNvM2pHS09t?=
 =?utf-8?B?WXpkNnd5Rnp2VXZkOE84azJpTkQ0WUNtUzFreWxoTVBLcmpQM21nOERvR1Ji?=
 =?utf-8?B?NWdpa044SlM0azdSMHJQSTZrRmZKRnFad2JPUXN2WmlNVGw0MW1GL1BORFlV?=
 =?utf-8?B?aTcrRFJXQTB2YlcyMFpQbWgzTC9VRGhEMlN0WW51dmdjQStaQ25BNG9xb0k1?=
 =?utf-8?B?cFUvQ0FLQThYT1B5c3c0WlNWOHBnQUdlcEY0NHEvVmgweENpREQ4aW9zUjR5?=
 =?utf-8?B?QjkxTXU5OWtMMGdQZE9XRkFHUXV4WTJZb0hRc1pkMVpvZUFOdUxnTkdndFFu?=
 =?utf-8?B?aTcxRGlxSXg4RDh2blRyNExob1FmRjdUTXp3eVM2WTBybG91d21hUVBJb0RG?=
 =?utf-8?B?Nm9Lcjd0ZWpld2cxUkQ5bEhjeDc5VGNJL1ZtTkdTaFY1NG9Gc3NHVDkreXJF?=
 =?utf-8?B?V05XUVFGK1FoWUZhb2dSSmJMN3RuRzZwYXA2Nis5WW9ONWpZREZOa0o5STdl?=
 =?utf-8?B?NDUzblhCSEFQbndmK3pwbTZaRmtqTWl5Wll2VE9vLy9tV2lWeWZMekJEalZu?=
 =?utf-8?B?T1BuZ20ySGlZOGpxNVBpRUxmWnFVZ0ZuaDBheTNTWjE2MjNBTjNNVmFWTzlk?=
 =?utf-8?B?SEh2cE1ncHc3WFdlWm1hcmdodUFUYXBoS0hyM1EvZFJKWldVQTZVN3BpeTY2?=
 =?utf-8?B?WVJCb0VsZGNvR2ZlRm5FbHcyeUFzZVp3a3BXT3lnNFh3ZDJ5U2hOZkFTMUt6?=
 =?utf-8?B?NXdVaGlvOXJSWmdCUy9NU1g3ZEJiK2xaZ1M0NWc3dDBSdnJIUWFTalpJOG1O?=
 =?utf-8?B?b3VybmxId1dubzZjeWdwcUxEcHNhdGJUZmlKM0Nyc1FCL0RXcFNOVjcxSzZj?=
 =?utf-8?B?WWJnQVdHMXZjcDdDcmsyL3psYm1HY1ZveFlJakRoVG1ub2lTN0lYVS9xdVN4?=
 =?utf-8?B?Zk1XQUFHVDR6Tnk3enNyZFZEd2gxMGdOakRPdjFLYkhacklYWFZBNExVZWxu?=
 =?utf-8?B?dTNZbUxQWE0yb0d5MS80N253b2tjTEF4cVh3MUZvR2h3RDUwRDByRlBYZURN?=
 =?utf-8?B?clV5cWRSRzd3dlFMbnNyZ01wemFSaENpV0ZTdjF5STFhQnpZNnlYMkMvZ0li?=
 =?utf-8?B?VndmZWY3dDNzRGwrMW5HazJNMXNyb0ZUcGlQZUhqZzByOXJiTjNlTmwwNU5i?=
 =?utf-8?B?MjczREZiREJ3eXBUUkl6NldGYkFtbGZZUU1hV3dCV2hoVTBSYnRzY2FGd2sy?=
 =?utf-8?B?OGN5aHdLQ0JaSGhsT2svdmF6NGw0MHZnVkFjNUNzUXVreTc5VUFjSUQyK2oy?=
 =?utf-8?B?VkRienl6VlFCWkpMRUpEdmFoblNCd1d2akZ0NHFZNlhibUYrRmRPNXFUeVFF?=
 =?utf-8?B?NTdwTEZ1YW9XRy9MdExPc1VnM1p3cndUTzdmSit3SHNFZFJwelZsTTZ5NUVO?=
 =?utf-8?B?L1pib0NWOTZ0STZwaTRCeWk2VFl3RTZHM1M3NkdpcjhmUVplN051cWREei9s?=
 =?utf-8?B?R3R1a295bUMwV2k5Q0R1SVlJSG5TQjJxUUNyWDZLU0dtbmtQWUVUeE45WGdS?=
 =?utf-8?B?ZTFHVUVwYmxXWGE3eUtvZHFaVEhUb1JGSFV1R0dvOHRNb0JGTWtRSC9MbmN0?=
 =?utf-8?B?U21TTHQvM3BxYTNUSVpBUStUNVZubUd2SE4xbUpUeC95T2laRjgwUzJ5eWlx?=
 =?utf-8?B?bFRaWUQ0TEhSd1FTMVJGRWhHNC83emZEbkhyK0JlNHc1QnhXSzN5L2JXSCt1?=
 =?utf-8?B?c2RxeUlrVTNWVEN3bUNBSUlHamFQOEJldEgyKy9DUEtaaDBoNUJTTHA3cHZR?=
 =?utf-8?B?R252cEtreVRXK3dtK3lMMHcxVzRIQ29sQlpOK3IwcVVpVDllaEpYRlhVK0RY?=
 =?utf-8?B?WVFlVU84aU1tQUNhR0N5ZjdPMTdudms4QmNMQ2NBN1IrV0Fzd3BUTGo5dXpX?=
 =?utf-8?B?TmxSbmdQaUFSZFowcDhoSUhBdytSYUVjbVBpVkk5b3hqdjQvRkJaRmhxQU5T?=
 =?utf-8?B?N0tUR0NpR0hFRmxsYkN4R3pNQzRaMlA1VHRnVCt1d1YxQzVCeXdlVVA0eFhj?=
 =?utf-8?B?dTNXSXdUK0x2SmtwY3AzMVhFajFyZHpkQkh3L1lGTkx6MmJPSUUwQmwvMy95?=
 =?utf-8?B?b09YL0NsdXhncHd5RGl2OTk2SmFYVnlmKytLeFYzOTZKN3daWHp0U0YxQXI3?=
 =?utf-8?Q?lbYFvd9E7a0D5xu9Puoy/nvePTCgfhs7MLJlu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7da4d9e-fe36-4510-7de2-08deebffed48
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:55:56.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAz10ufeBY+Kpdr7IIbXdp26CxNoUre5fjoKTJOBRnNkTYRa8DCOxX3uUo+WpFslUC4wP4+W6EgCJmEPfuO1/6V4WptfgAqanwupT684HdQ7p+hr+/JW4Fiy7DD2OqkY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803

From: Frank Li <Frank.Li@nxp.com>


On Wed, 22 Jul 2026 13:33:05 +0200, Stefano Radaelli wrote:
> Enable LPUART4 and configure its pin multiplexing to expose the UART
> interface on the Symphony expansion header.

Applied, thanks!

[1/1] arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
      commit: 3c45ac08d2897aeb95ceecde25a6d4935c4ab8be

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
