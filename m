Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9F3D1CA7
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041907; cv=fail; b=sy+jToRYNN+POQ9LRMWqclQHl3bd/MladlJ+S6/oy+fikkWdmbd9joNRYkf/Xdxajv3+TiiJOdD8tJxKkuTCSaPeaHiPVEdlwEJHbVENUrKy+HoSuEtdsWY2BGgkJ9lW7WbmOFrTPID0pSCHyfrrNHJRXHqJdBlmM9Re6q4fOSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041907; c=relaxed/simple;
	bh=2e+qLoW4ysYK5alpKnoLWGnMZU3P0vz2t7BmWxPXz2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ToHTCOwpr07bz1Ysk1hNJ5MuARCsSo5H71gVfcH3HrpCmqO+nn/EwPv3kZK2pCaYxMgKisvgCWuaKB6tFh/SYG/eGxWkZpzi/k0mYstkecRV/amy4vqWj5j+fqQ7uRcJY/VAn1OSHdLJSlEf8eoGDtC6bij33U0L/Uaj0sn8mPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kR3A+VEj; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kR3A+VEj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGbkO8BJzsYtweSWlY2S7A71sp5vSMrLyknrfSMbMlyVkZyKr0OdD9/NCkhWk/I6YMTa9u6f3zf2h9SOzM2IsrItiRRHVdNPwbsh/ZlgHTePxAKtzFCyBr4BbDwB1IJz7yup0OGVSwk4vdN4SGQUohe8cByzuGc4jRcp4SLHPuK4fD+UjltV4bq4HcQYOH0lyt/ZGlEmGsjTyEeNbS2FOs3vjiFTH7MJsBMO7bHgoDk2vc/6iFzm+26/2TC64rlwVUPkCTFTBLp+LwE7ZVzdXlGf0xkCMvMPXhMPpOaj4BiiHky7fBayTjRFUd+QB95Nvr/d0/sKrNN1UxJ/vNG9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWQvwbyX7/pmWeVbIHidNmNqZ/daBCXmiXt1Xjf8Iu0=;
 b=jAIfRv4ajFwoGOSH/4V8+qEme4Dl9MzXzegzA3gfQFJ8TzRjXwmqDrsvCXhoWAQxZD9dPnqqrWmkG4DUkkSeK9IJGvrkjdrEACfyK0NPhVJsipbFHpAq8v5EqxVQjegQQ3B4TnA8Pv/nLJ+1xtPZkrSBiIJRPa+Ug7VZvPyjB9VbQlZ4TFCBsoHI186z6rJdlawi4IOTFsJypPJD40rRES0Vdlv5oLe++LxlIYStIrWi2lxLcxmyKwkdQAuRS23knHuT5f2CfYewvDpCGUgWQFP0KecMOnggvJ30ygsgrgqnoSWUkTpVhf79U4RMzb49gP+3tlvrcEjL7nQKEzK96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWQvwbyX7/pmWeVbIHidNmNqZ/daBCXmiXt1Xjf8Iu0=;
 b=kR3A+VEj0x08hRcg0nHy3k1JzfmlQue3tyl0NGnZPd5eBWp8xMOQ5Af/43AZJ97lNmcPv88yeJOepfisjpDIKwv+cOziLurybzqS4XCeC1QbkeqwtDB1Vd2+6VExsVG1PCsSWFtkG40IT3RpuRwCR6+MkAYkCK9VuNAn/V8bdw9pmOD5nivsSoTrMA7n0hRRxlYDdSr32oq4AUBZX5w/pvZ8bSjZx6RecnKhb4+zERd26i+4t6SB0+TKc5jtAbaFLCA1H/xkVrwWwQGARDA5vlsYUfh1dC9JmrDEaKjUX8zA7gYvhqip2T0uGCZaYOP2YFsW07MTKt/Dal+hJq3gqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA3PR04MB11203.eurprd04.prod.outlook.com (2603:10a6:102:4ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 17:51:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 17:51:40 +0000
Date: Wed, 25 Feb 2026 12:51:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ80BWH6DRu8_W_S@toolbox>
X-ClientProxiedBy: PH7P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA3PR04MB11203:EE_
X-MS-Office365-Filtering-Correlation-Id: 78127a94-6a9d-4a07-66b7-08de749687c9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 CYU2q3n4AOZSGTo/gp0BnrorBTi4UIvlKhM/zx+ftEwy/ilBg676YuH6HpD5oU21OgICGM+Mp/YFbdUyPnU16ey0BIZYhISlsgYqJPURyK5JzB2Uny8AKAc7gVA1cTFTR06DmkEe/osjQgObrI57pfvD4kc+FozyMJ/wbjtcOxJ+gVAOB6QYRs4TYaPiE0Uc9bHe3HlyGoCLAJ7S4bdO9iP0lBSF7Gq8HqAej5oYjsSc1dGxFvn0QvxsDMyzctqjYZ15VCeP+HaaMHYq0UFQqhgdyavr0qI++Uky686VxTJn/yzPC3FJjQG2oDYvmyPYTmf7xtJPm4PxbXLBsqGwNliv7aHKAkqHox5sVCNBj4HeSR587mkV0JP2j3YKFe6lz7H4JXadHf499+8N+OOepiPz/zQlgBjj5e4wT/QUvC8S14bZKc0aixTK4w2cgb7sHUnCC3SH39MA1kHr3dpBEvh89L0XbYmXkgIfXyCsQeRhT2NXwa9bTf5LiKgwMuW7V06Raf3mPOO0UEW10G0GBEwnbqHfvK0QtohdGQRNi1qbxZSdQ7+CrwAdMqxyte3HqLGC3WdlbKCSR2OlWMTHHz/UjnwqKz7/WFnM+E5bwtfqM3ZPmcCXcCmFTcyaHS+fvaATPcK+rJJ4vRUL5RlHxTArx5B3t9m1mT3StP9dl4xQOuadI55gpLRlNmgDm30jx9EUw8BIdt7zK8EChg4WRbSthODt8in0rEU465TQFjr/688D7oLIWcIZdt0iwaiKREzz8eBxhHtuDR9sZNpp35oQunVItlkgVuj+kveK/94=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MkM5ZHJuTDR0ZEJvY1VkSVlFMzBaTEF6cTExd1FiUGFtakRYc1Zta1NONTRG?=
 =?utf-8?B?Wm00dVdhNHkwYjBWdFQ4d2lCZXBXMlpIZzFwTmErejZHekxMSnhEK1E0UTVH?=
 =?utf-8?B?VzNIV0Y5K0JzVGlza2c0YU81cG1HaG1BZDk5aTlZOW1EcGxtL0pGZ3AzNEZm?=
 =?utf-8?B?aTB6Zkd1Rnk3QnU2a2Rhb0QxY3M3N1ZtcGsvbUZSNXQ4bm5ZQ1Q2YmhCeVlt?=
 =?utf-8?B?RnRoQlZkZ1ZSMTJlcnhtL2Fpa3BUa2d3cis3LzVBZFlZT2lRcVk0SjB5VjRN?=
 =?utf-8?B?T1VybHA2U2Q2SVFlbEs0blV0N1VsazdIM2E0U3QwRmNpZW55QzhGS3NBNjdl?=
 =?utf-8?B?TEtGVzBLbkVZUEt2YjRjeForL09mc1oremFjSzV4SzJEWEdjbXR3SHNuRGFC?=
 =?utf-8?B?cGZDM200STRCODlrNU41S0JTbTdjWTZXTmVEM1lkMTgyYllIR2g4MmFwU0Zy?=
 =?utf-8?B?TEJrblcxTzJZSm0rZ0R2b2haWXFtV1I2S3kyUjNISFIxUGlBZS9jVDl3OGpy?=
 =?utf-8?B?OU13SjBqVkUrMm4rOVFScEh3c3hseGI5RElRblp2YnVsZ2FvNXV6bmdSZWEy?=
 =?utf-8?B?MWdGRCtPRUtHSzBRck1uN1pyMzJyZVI3WnJ0OXFvUGtaNGh0U0x6NVZXc1FO?=
 =?utf-8?B?V3h0ZmVjSjlyUGJQS29RdzI5WW9LU0VVVkp5bDBIQWNhK3hQOHlnOWVnaG1y?=
 =?utf-8?B?eDB3RzZCcDNPM1BIRlJaUENsSDltVWpUK1dsYVgzaWE0VWo1VUJEM1V3RXVS?=
 =?utf-8?B?QkJMMzdmQVFWS1IrR0dEbW1FdWZDZmhEbGNnSU1KMWs1ZndmZ1oxUG56cWVk?=
 =?utf-8?B?a1Rkb01uRXFNaHpLRE1lT1pTUWFGZ1N1TENaREg0K0hXTXQ3T040azgwd2Vl?=
 =?utf-8?B?ZGNDaTJua2YrVkh2WTdwWE1TdXJlVms4WDd1b1o5VWtzU2JLcDVlbTFQanRH?=
 =?utf-8?B?b0F4cjlScnJYNmVDUTU3dTE4RzlmSFl4dUYyNnFvZHFaZFBFUDV0Y1Zrd0xW?=
 =?utf-8?B?U1dXSlVZMkhFd3NpRlNQdmdIRUVCaG15dVA3SnhJSTVBemxLVkZYU3hJNWlu?=
 =?utf-8?B?SzdRZnFuc0xYTlVNSStKWWVtdVNCcytRQXNtbmx0Z3NteVA3QTJYN2c3cVdk?=
 =?utf-8?B?eTRGM0dFK1Nma3BtOUNUb0Q4a1N2dW00aDJ4d1NSVkV5b1pSdWdhNXpNVDI5?=
 =?utf-8?B?WXV2WlE1cFE4V0hOK0lGYWN5VmtXcGlTdHVyNDFkamhzRlprWVpVa0tlc2M2?=
 =?utf-8?B?eVZmaDlhMm9VMlIrVGZOMTZPUmJwMnIybEFnUm41b1R4dUUxY0d5SERhOWoy?=
 =?utf-8?B?MytmRXhSd3B6bzdPUUZ6NmlYUUtLUnorL2FxMzNlREc3bnZMakpWeHZzeit4?=
 =?utf-8?B?R2Nhc3FXQUJnczg1SjEvTmJHNGRzQXlLQ3VTNFYzcS82bVdsaEc1c2YrWmc1?=
 =?utf-8?B?TFUvRVpkb2MxT0s2dFE0TFR5empSeFlhUWNTWFZjTndjd0hkZ0FqQkpqaWJx?=
 =?utf-8?B?ZytQaGpYTkFwUkVhUllCVHZlSHgxK0YwVmZTRExoQTlOU29lY3BobnRHNU1m?=
 =?utf-8?B?SEtKcURLUHZkMXFkRG5McHlXUExIWE10cFVaMS9qUzVPT2pDZ0YvWkJlaE1U?=
 =?utf-8?B?azVVVFlGMnlpL1dlL2FMQzhKVG1YUWkxKzEyYzZFSkNPK1JpWFNJaEF2aG1M?=
 =?utf-8?B?M0NlZS9jZ3BrOFlMSjJWOGFaRG9Oay8xT2Z6MlRLYVlFUFNtaURjMC9rYnVP?=
 =?utf-8?B?OWsvV3htaGJWdWF6RjB0aUVDV3MyYnlGdjRMYlp3RVdvejdGN1VPYUN2c3hM?=
 =?utf-8?B?TnIvMDhjcVNlNEZIQUJDbmNBNkJOTEd4ZGFXMFlqUXp0YmVNQXowUm5hRFUz?=
 =?utf-8?B?SEZ3ZE1Yb2NFL2Y3Q3ErL3J5bS9YbkUyaGhYV1Ftd0k4SFNZc21EU2J2bmNp?=
 =?utf-8?B?NFVxNjIySDhERTZIQW5UTXRuWnVKZXlZVjI1L0VhNEJhRHo0NDNVb2Y3ekhr?=
 =?utf-8?B?aktDa21wZEoveVlEVUkvMlRKR3hvUEJXOXdKdnM1UjMzZ3NXdEgxQnFwanhm?=
 =?utf-8?B?Q1FUZ095clpGL0lhQVZtZ2x1OW83cHk2bThHMlZjdE1ZMU5BVlYwWmpwdE4v?=
 =?utf-8?B?U21IMmhDYklZRzNaQ1o1V052a2dsc0hIVVlLNUhsbjlxS3d4T2hYa2swLzlS?=
 =?utf-8?B?MWlpLzhjYnVmdUoxWm9xNG16UmdGSUFyQjZhMGtzbEwvU3hKVDdvcDJZb3By?=
 =?utf-8?B?OVBHZWJVWTVIWUx5ZXdQYWcwM08yV0NYWWdBTmxZSUI3RUpIUU96UmxpeVla?=
 =?utf-8?Q?zwbSsWVBRP+ez1c96m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78127a94-6a9d-4a07-66b7-08de749687c9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:51:40.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UphVADj2C2cRKqU9WeJn/6aZueNXuY+IxL627oXkCQGecXk8Z5vk1m75Z2/HEP4mBTkSOHPL3FV9x3zdIkb6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11203

On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > Hi Frank
> > >
> > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > >
> > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > > >
> > > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > > again after reverting it.
> > > > >
> > > > > Although this has only been verified on these two modules, the issue
> > > > > is expected to affect all device trees using the gpmi-nand driver.
> > > > >
> > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > ...
> > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > [    0.960500] ubi0: attaching mtd4
> > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > > ...
> > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > ...
> > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > > >
> > > > Can you help found the real reason why not boot?
> > > > nand@0 is preferred format for MTD raw nand.
> > > >
> > > > Frank
> > >
> > > I guess the root cause is that the driver for gpmi-nand predates the
> > > update of the binding rules which want the nand device described in
> > > a child node 'nand@0' also for nand controllers which only can
> > > control one nand chip.
> > >
> > > While it is possible to update the driver in the same patch set as
> > > changing the device tree to understand the new dtb rules, maybe even
> > > falling back to the old definitions this likely breaks other users,
> > > most notable U-Boot.
> >
> > GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> > boot problem?
>
> My concern is that the new device tree (with the nand@0 subnode) is not
> yet understood by other consumers of the DT sources, e.g. U‑Boot, older
> Linux kernels (before the driver change), possibly barebox, and any
> other consumer that relies on the kernel DT files.

I understand, but we need move forward. we can keep both for transition.

>
> Updating only the Linux driver to support both the new and old bindings
> therefore solves only part of the problem. As long as these other
> consumers do not understand both bindings as well, we cannot safely
> update the shared DT sources. So I think the commit needs to be reverted.
>
> In addition, the proposed fix in the driver is likely incomplete:
> with the old binding there may be child nodes (i.e for partitions).
> 'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
> a node whcih is not the node that actually describes the single NAND
> chip.

I know it is incomplete, just want to check if it is the reason cause
boot failure.

>
> An alternative approach could be to update the binding documentation
> so that, specifically for the GPMI driver, the older binding is also
> considered valid.

Not easy to do that, I try many method to update yaml file. common nand
flash detect node node "nand-controller".

> Once the driver supports both the old and the new binding, the old
> form could be marked as deprecated, but still allowed for compatibility.
> This would avoid breaking existing consumers while giving us a path
> to migrate DTs over time.

Needn't revert all, just revert delete part, keep both to help migrate.

anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NULL);
fix your problem.

Frank
>
> Regards,
> Max
>
> >
> > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > index 51f595fbc834e..fb126a7c4a61e 100644
> > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> >  {
> >         struct nand_chip *chip = &this->nand;
> >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > +       struct device_node *np;
> >         int ret;
> >
> >         /* init the MTD data structures */
> > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> >
> >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> >         nand_set_controller_data(chip, this);
> > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > +       if (!np)
> > +               np = this->pdev->dev.of_node;
> > +       nand_set_flash_node(chip, np);
> >         chip->legacy.block_markbad = gpmi_block_markbad;
> >         chip->badblock_pattern  = &gpmi_bbt_descr;
> >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> >
> > Frank
> > >
> > >
> > > So I don't see a quick fix other than reverting and living with the
> > > dtb_check warning.
> > >
> > > Regards,
> > > Max
> > >
> > > > >
> > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > >
> > > > > ---
> > > > >
> > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > index f452764fae00..547fb141ec0c 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > @@ -36,12 +36,8 @@ &clks {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c3 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "disabled";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c3 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	#address-cells = <1>;
> > > > >  	#size-cells = <0>;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c3 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	fsl,no-blockmark-swap;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "disabled";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "disabled";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	fsl,no-blockmark-swap;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &i2c2 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > >  	fsl,use-minimum-ecc;
> > > > > +	nand-on-flash-bbt;
> > > > > +	nand-ecc-mode = "hw";
> > > > > +	nand-ecc-strength = <8>;
> > > > > +	nand-ecc-step-size = <512>;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -		nand-ecc-mode = "hw";
> > > > > -		nand-ecc-strength = <8>;
> > > > > -		nand-ecc-step-size = <512>;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-ecc-mode = "hw";
> > > > > +	nand-ecc-strength = <0>;
> > > > > +	nand-ecc-step-size = <0>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-ecc-mode = "hw";
> > > > > -		nand-ecc-strength = <0>;
> > > > > -		nand-ecc-step-size = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &iomuxc {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "disabled";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &uart1 {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > >  &gpmi {
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > +	nand-on-flash-bbt;
> > > > >  	status = "okay";
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  &snvs_poweroff {
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > >  /* NAND on such SKUs */
> > > > >  &gpmi {
> > > > >  	fsl,use-minimum-ecc;
> > > > > +	nand-ecc-mode = "hw";
> > > > > +	nand-on-flash-bbt;
> > > > >  	pinctrl-names = "default";
> > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > -
> > > > > -	nand@0 {
> > > > > -		reg = <0>;
> > > > > -		nand-ecc-mode = "hw";
> > > > > -		nand-on-flash-bbt;
> > > > > -	};
> > > > >  };
> > > > >
> > > > >  /* On-module Power I2C */
> > > > > --
> > > > > 2.42.0
> > > > >
