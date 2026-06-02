Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2736F917
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418156; cv=fail; b=bKQ2Pey/q043QK8p0uk7GquIC5L+VWo+i4qGMaiEg5w0dit7KY8lzZkd5KpyayMNgetSY2t6bf3ev+WdyCMeEC0HhR1bLP50OJLX8NDRuwkpPwLdZVKChHTaGPM5RpFOWkE5pkOckuP/DH8oo6NP/A5HWsCdTr0RK0DcedcNIFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418156; c=relaxed/simple;
	bh=mQQC/oKiJHsXq9/RbDAcUukceXgpPvueSlCTh7Qr1BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkSr9nmnQYDqA3peolEIDwj8CdLn5LkONYtOgO3S3eLQnrysEF97WM/vWk0xDsP4Lj7gBq+2KQBlZ5Dkb4bPHAghKQ64r455wABRcEhYmfmZ+Y3k26GL2GesUNgvJVGrji8QQYl1xdQSTAuKJE2sPPyZYWkdW9YJ7ZPSiKkPLbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AhOWQcFT; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AhOWQcFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzfJTxbsNynww352zrqT0a6LR1IUx2pagAt0pQHifmThZLpYlhhFAmTbY+2Ihxc1Y3svKifg2VIoOcWpyUwvMed157EWwECn1WWOwvDf5Bh84XS6pwnCf+vXRIxzYQu639+HzYCXNKAV/ZisIhKA4VawOjNYd15pj5oxoUmUgARFVRSHU0OC65idYy2fIBgsyWEtOXwb4owLNex06DqNxwcoTrak+xI62l2/Pw+SIUyzv0emJefUlHl3RmW/eYrqoAtkcbMH3GOSEjPxgdo5Fdf5TXo8A8JuEakYRf4fLg4ySGLjLSfD+icDMLpGEoZ8q2Wcg4BXQPgBFVZEr4lF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViHr+o0osjYxS33ALpfUFUnnedtqEfgkKog70waTT3U=;
 b=KTv9PBW5K7239FE5+l+7Zhlhb9j3Cgi4s+y8k5tGP8VBr5WtGABWw1DKc+kqRBIcBDcw1KMyr5Gtsti3gE8LTrk9bgKs69kqw22wBidOn9yMJ9fjXnqjHjnurr6ymuU/3BgXQTLnS1KOb3veQrD2OLVCf2A86P2YILOlUbXnkH6le7Kj1Drpn3zYbRSvloKzagl4FiPGkN8kkCxlR9X+Mzj/erh+D8AWvTHghGrU6Hqtvk9mx4rEbweub+OoyI6WUXOc8bDdbQ+dHSS6veHMrMaBR6QXs33mN/gOAy/Es+3w0guwDGk2/ojASocViCvuqLXyBojIEE747/QZ35VVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViHr+o0osjYxS33ALpfUFUnnedtqEfgkKog70waTT3U=;
 b=AhOWQcFTmqyIOe5vA/Kf57ymzz10xvKdCHQejm7X+fCZt3Ww4vbitmJEoUTUEdla99fRa7eKgEsIqrnirPIvIREeeyLU4jQLLRccoMFGNQ8rOj5+zw/6GmpXi4WQVsBHrh9JBrRiP8Tmiz6oeJCSXljxVfRcyl25lnBQSSZKYUYi6dBzIe/orbuFWSeyuB6B1x4biQeTvd4EMqld9+q7TrFLL7DrGPO8lPcBGaBSXI6yoyQo/tkItq23PD+k5CD8NMyLxHxFAKAyyozGPo9aU2D5cBnnLiwxMmWT+AvfaFcmO+GabCy4RxpCUsOwqbijI//Zn3NweNAisLVpngjRSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10154.eurprd04.prod.outlook.com (2603:10a6:150:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:35:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:35:49 +0000
From: Frank.Li@oss.nxp.com
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Tue,  2 Jun 2026 12:35:40 -0400
Message-ID: <178041812850.3294201.1500478837852378765.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:806:20::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1bbb6f-1117-4515-969d-08dec0c5007f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 kUen7WbSarlxhE+rqmhXVmHUf9emgCmw6dhfnYvwdE1re8Utqv+qqdXC8zYYHrpzj0LeOI0QvbDfLG+J7/YsIa9PM/1w/iNG0cy9XFh84d6LgJo0+gOON0yGAFcrCenrvbtNt5WOikKnXfMZtWylXqN93mlr4GcL9kl0NPtccERjSeUHDetwGWwo1F4dIfB67xAZH8b8l5oJPav+sDNN9m6R4iyNNKK1Hme+v1YLn9QjgpKR4uL6NfbwjkRZJSmKbN2emUCwQEeW18x7frjDAlUnJv0o+293tMZEo04oZ6jpu8xu8w7GE30o7FBFXcT7ju8MbZohgOukDqgWRSQTaRVb7XRbNtsyeJf1A//1Oo+Z8CGp6J6VRb3df58QOlWaI8U8kKJTq7Nlg/mFbSDvRkdS7ppADKBrcmVTnAYtuQjjppRCLwbWUpjA0q0qebIE5nGi7J2lYu+NXLvxDsEU/IWSVgS3ZNgQGYSHOs4a7z2d1wg0uCA9RpnhgQfoYHDyLQ4XCMEYwp/vAIXdWHahNAxYhqEGk3BZeObRsBb39/Ljkpkc2n4kb2Tno+aMk+GrM8ZBeRFqEXuYZtnAhDzewhkdZbx8xJdw7iCPAHXn1VS+uQRNqXQ1pRyyifhTRElY85S0U3zGdThAiu4gGh7Eqa9J8UQACJF7j2t0uqcKzqDhRqAL1qq+MMmIp4v6W0x3
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dzE4WkZMaysvbFkzZWJxcXFIUGFvUWNEWmRpMlR4T3VtTXl0M1ZGVVdrbDNO?=
 =?utf-8?B?Y0VpVDlDSGdFQjMxMVh1WENWSVE3cEJrTkdOby9sdFEyQ3BqYlF2SkVxcmVm?=
 =?utf-8?B?Q0Y1ZzdGMlBsd211dXBmcVJIZnJNR3hodnhpeGVFOHE3dXF4d1dUeVkvMVZC?=
 =?utf-8?B?REloUGY3c01mOExlNmc2RHVvaXBYSHYyaFY4Z3k2cm5uNC9SeWpYWXg5cUJa?=
 =?utf-8?B?YjNtUmFqUkJZRE1NOTRsWGxmdHFkZlRTQnhrM1dNYjBOQlBLNElRejJMYzdP?=
 =?utf-8?B?NGgzQnJqdi9Qek5vYm9aeFUvbUpDTEZ2dlFlVWpVMlVKdk44azc4c2M2eHIz?=
 =?utf-8?B?VldXL3lUZTgxcWNhT3pkNmxkZEMza3kzOW01VmdmRFhobkRONDYvMFJra0VX?=
 =?utf-8?B?VDBWeEdZM0RDNmNYb3I3WjhyTTB2WWk5UzFwRXpIUVVZOUJjSHByVFg4NjZm?=
 =?utf-8?B?WUVQTFNIaDlsTUc4QzlPcTdxaWZtNXVQRW1iY2QxODJFSi9XemEwVGIzUTNK?=
 =?utf-8?B?dU04M2JzVHBrN24wbW1BWmlFRi9Ya0VJakl4SEpLMmpJTmgzV0xQOTNJV0x3?=
 =?utf-8?B?SW9iWjNyWjZnSmNjTlN4S1JxYWZzM2ZJdnZGVStGWE9uWnJEVXhzY0FkbkVP?=
 =?utf-8?B?NkZJVEsvbkpWTlBDdEhLeWhWYVBVRHdnT3N4RVkzcDNxZ2xTc294VGxBNkxa?=
 =?utf-8?B?ZnR1dDdVRnlFcXpDRkJZWGUvTjAxY2JmVU5wVVhwSXdGZjJsV0tNbFZhaE9v?=
 =?utf-8?B?Q1VkQ2w1czFlVEhsOU1DcHI4NnZMdG0vWEFZVG5JdFJFVVdHVkJ1b2tzcEc3?=
 =?utf-8?B?UFNVSjZXL3VWb3RvaXFPTUFRYnR2NnFKNVhrbUUvQU5CSGVEWkE5U29OQ1BM?=
 =?utf-8?B?WWptUnV3VnBSemluTEhZb2JFeWlCVi93cDBoaTJSV2FoTEUwQkRiM092OWh2?=
 =?utf-8?B?NTYxbUcrdHA4YlZOaWZ5aVdNaTVQK29DdVRJY20xU0cvVGp4L29xSnI5aVFX?=
 =?utf-8?B?ZjN3b0w2bE0yWllmTjBtazhGeW5JVmhFZTNMcjdyV29mWkZHQlhsKzdxeTho?=
 =?utf-8?B?KzF6ZlhLa0pvZytCbUFkK0czUnlBNWJ6MUlPUXg0cVAvclA5UDVnUStyWWlV?=
 =?utf-8?B?eXo5SloyQkd6SkNiN21RNlNOMjdvWStsNUlnNkVXdHZGL2JScWRGY0pJUEU0?=
 =?utf-8?B?WVM5alVmMWNhY2ZIT3FESlZXS24yaWJTcFJidC9ReDI1NzNRU3dWOEFTLzht?=
 =?utf-8?B?WVhlL1pmU01WTVFMWnBPN0NZeUNXcUtqWWdRQWFkT3dTRDFGS3MxSkIzZUV6?=
 =?utf-8?B?OEt3ZWkyenhtMUluaTdBSGZ2OFprL3Ftc085Y3pLZVVPOERjQms1K1lzclRs?=
 =?utf-8?B?ZTBOSlhKRzRMeWNwK3NIN0dxbWhEKzZRN0JYaThQZjNBS0JXb3krTCtBSnhU?=
 =?utf-8?B?VWNZTFl4N1JXSmZ6ZXNyWGhKSTdoUVMyYWFlSFNTS2c1eTVkeUtLZWlMVmpT?=
 =?utf-8?B?NHhDVlBwL0laSU5pOVNrenNMVlg4SnA1YmFHak0vYzZJVzRwQmUyTUFBOGYz?=
 =?utf-8?B?bTU3bVZZd0hJTnFxZm5BVjhWcVh5dURqelVIeDZTQTZKRzVST2taN0N6R0lr?=
 =?utf-8?B?bHlmRHMrekYvSkdrdHVEdWluMktVd3dNZEEzdDllbHJ0WDZvcmdtcFdma1Vh?=
 =?utf-8?B?S3VBWm1OQko2TlUxYXVSVWVKT05kSFVldysxRnVueXZxMVhCSE8wNmx3R2dF?=
 =?utf-8?B?VEhYeXBzbHJZRHROSWloR1htRjM2RG0xQnl6YUVrUVZaakR6Y3BITE1lWnoy?=
 =?utf-8?B?d2RDQ1NwZWJ6K3d6TnhDcEVDKy9raVphbVI1TkV1QVU4ZlRmNlpjaGRxUW1y?=
 =?utf-8?B?dEkwTlVtRm1CWGt5NEYxaUVuVG9GdUgwOHRSQ3dBb1laTUJoVlJ6NFhtRzlv?=
 =?utf-8?B?dEJFdVpRNWRCRytCRGk5VzJ1eTkzazZ0bkFoaGpDelVja2ZNK2d4VlVZV0hG?=
 =?utf-8?B?bU1VZWduRUxodnRDNERacW9xZ3ZZMHFBWWR5OVdaUWZ5bzM5YmZqTUN5MTBm?=
 =?utf-8?B?L3N1blRGR3VXM0FWN1IyU0RLZ1VqZ2RnQjg5VzFqZ3dzLzhseXpESk9seDdY?=
 =?utf-8?B?RTRiQzl6SXlyYnpIMjRIMWVZb0hLcWNzZSswQm9la0JWSDB4R0IrWlRUSkNT?=
 =?utf-8?B?VTNQOXVGd2VXaVR5bEdMeHBWRlNjbW5sd3k5R1NUZ2pqOEd4K3daaktEeXBU?=
 =?utf-8?B?ZlhMam1panZidWhBYkRzSk14R2djdkd1cmNubHVuK0U5UVFjaUladlVVaXhB?=
 =?utf-8?B?Qms3TGx4NkNCby9hNDZ6TEZOdC9xRkxXNGVRNnZReEdhTTBFVytjMStNKzlG?=
 =?utf-8?Q?zWcXpgI9vidrOK5n29JPr6/VKLG8uI0Vs62hK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1bbb6f-1117-4515-969d-08dec0c5007f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:35:48.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+L7hnf8OqpkN6wpqHY8SefYXe+aQ+vPYpnYV8RHGCYAEg19jrU06Y2dvE3Mlgrq11Pf/e6pYoOIwsRSha1oqBbl4iL0Tga6IqVKaGSblW6weEsBgeHo+kolWNWgwRoq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10154

From: Frank Li <Frank.Li@nxp.com>


On Tue, 02 Jun 2026 12:23:50 +0200, Khristine Andreea Barbulescu wrote:
> This patchset aims to add one change to the S32G2/S32G3 dtsi support:
> - Add PWM dts support for S32G SoC based boards
> 
> v4 -> v3:
> - fix indentantions again
> 
> v3 -> v2:
> - remove vendor internal issue tracker
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
      commit: de1ad533cc630389c47bdd0b45c3b55aaf428c30

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
