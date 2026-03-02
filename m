Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4C41324B
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466582; cv=fail; b=fZREHF+5A75j5+/NpXveLTzbYFJ3e5qA5yhULnhNvwqGl6zIcUSxPZefEbE5CWuIj/32MREFf1p8UMPCWVCezl837gHEm/Sa1aPSHaniTrw51ksTPUna4zVd+kdVpJfZ3nrKXnVzUqCNrxJ48VYB4tW+mPYG9Ci8d0awgWj0/9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466582; c=relaxed/simple;
	bh=QbT+PtK8OXuIJnecgTPd+UVBqAzJtVbGamNG2DaDDO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YeeaYcI86ArnTprcuza4pn3opv17sGbnQLaQR3CZvATsBK6FWcm08ViFusYLrkxr2hxLwGWCbc36aHyrcKu3u5BCYFw/LLufiTj8PasgM00a7cevEq9wWG9vrXHBhqQZVVR4Leb+2F4+uVOI2+SZY8vh89J9MaJo+rabbhblVqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CHB/eULy; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CHB/eULy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxox/PsPlAc/MXqD0yQnmxC4fWMPbnL7w0dr2zOJpRJOd/nONUKsobb6dsGwhZzcKvLM1pmqVNTOxjp/+TnU/VrE5CID8S/Aapg+TBH0tkQpehsvYlI1eyikD7+yXYMJZEpJK60TMhx6si8La0UMt0nkn7IOlzIZN7oFX0Z+v6957e+10dnn6mbxLWN0F26aTAzI+ax1vKPm+DaNIniUBvhNZqWb9i7pdtalQHv7XFsaL/cFBTjZGGWjLUntb7NaFEJfRBdVhHQWHlIJdaccwyxFvDTdxY6j8go71/+a2ub5RbnCIw55sweMMxaDzGINnM8ENIWDYH++cjUwYwlUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IQ7vecwazViK2TamyKuMUv0/mT7FqTwBD923j2VzXg=;
 b=vlGhxq58KqjCMJzi+D6issulZuezyQn3jjfBYSo/0OiSMECVEPVdA2vnqNisq0Id5kl6zP+tKoOKlTBcNrXAADU9HSAHL/L9nkR3mjXkS4R1aktKemK2rUlYS5XzrvB/dMVPdGwhVl34WRtDpcHzlDLl5b9dndMQWQNvEmlNkz0ReVG6zngDlMZaYSFWNXS9Q9OlWmHeynZWSqloj+Lx4HH/c8f7uUu5taPqFRJOG9c6FFvKPSx1PKU4XX19hXmxY5MptuK+KZGYn9r/gSxfVVEW/QTwBK544MZOKsiBFKAaVPKMFw1/7mmCtoaG5bVZU+FjH82k27GNNpXGAI3Xaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IQ7vecwazViK2TamyKuMUv0/mT7FqTwBD923j2VzXg=;
 b=CHB/eULyg7ineHNg0D3q7c+lporRtNSjTvleGGFtHI6/26hsy7shWN7lLfswyDq1pwinGvS0apAP7v/Oo68ct0b5XcQMnXqBBdRiaZTCDA6cwOgsooAK2U04hhY/xsN2Et92DriqydKTqNq+W+tYlwaXnLZ5fKzBbH15pcR3RHwje34W566fbbAwXfLGpEq15710f5HjvINA6OYbZgFzKNAhq1uFhkbglAbximPf4bLLFJBIpzE66NL2lsBykkHaqZuTaml2MDIrangpxoFsVBEDqdwHWvZZYnF554kmhR3jYFz2YHYUObrSIU5YujOc/br4UEQ/tdDC6Kri+hDJ9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7545.eurprd04.prod.outlook.com (2603:10a6:10:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 15:49:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:49:36 +0000
Date: Mon, 2 Mar 2026 10:49:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: max.krummenacher@gmx.de
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
Message-ID: <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
 <aaBA65_zLu8S6WMS@toolbox>
 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
 <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
X-ClientProxiedBy: SN7PR18CA0025.namprd18.prod.outlook.com
 (2603:10b6:806:f3::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 08abba10-b475-42d5-a293-08de78734d68
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 cR+LZzc8Vy7Ell3hIwM3rKWYJHr+Mt5BLdAXK0rHeQJuSxWLLo6vwEvY01NswEJjJoCWgEJ2paAxapK3wQqIZeq0ugGyYy5Sqy9FKh1SLN7bDfEH8RbzrPAVPTDxIKCDOc/zy2Xvjh3EnWzmgEa0VlmDNodPDj4q8d98hhANQzcBYs/hFwT4V3rQ6nsHUB0r1vZ8wgJWkxW4+oZ74bKrdc8xKYa/zEKgAekpZLWlP7I3kCRu+SoPAO84WiYnQXGddtY+6NWZCa8kHFAC9xGH6g5SzjkxDXptylyMqDSRB/MmCmqb17sVHmaA98WWhx7sozxLWd5ZNDsuWAq6CQGLQ9qvIjIwP8btv1rcoCZtFbnFtFJn1BoHFvWJc2PeTYsebRwPJ1jeLKroQMETpesXRphSekQLX0J+jjHU89VcN/WayyuhbOZkYbxmUxP9p9IBkAMQEFh/WdfaT4rp3gQyIe1Inv3dFRc41cBt3emT9z/N9mJ1TWCEVKLZ3znjseyKnxw1goV6pFNiC15ZbJ+4uQ2JVyU+U7FezvERqaVymNmLFy2YFPi1ujf8x37o9bZJG0qTAJLV/CLx8u68Ch7VIb0FnfVviaclGAlivqtDa54a4gZrkQ7VE7O5MmYB4ZmnceMv1av/jTmi1FH7LbgDAPt9UlVZiO//X9rd5Oj1/E8DG7a6YF30mkvy+aPsRxLBHLpcwlMXi8uJSVdmem3WgKw0Vc6+DlvO0l0pGcyOnRKwKUdGOFuDkL58Jx0pmGFZzt6oGXZEtJZ8zmOUhIWGE51cCXgljtVX9sjuthLcqx0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z09salAvQ0FYWFVSRGVBZURIbGVxYmlYZ213UTcwMi9kMWx2em5ITk1ZdGxQ?=
 =?utf-8?B?cTRWaFRrU05oOUh4UXVoV2hZeGl3OE5HT0FDeWtPYmtzTjAyMjlFVVE3ZCt2?=
 =?utf-8?B?OGRLVExOVGNHVFlJVVNrN1NzTzVBbGM2Rk1wZU4vSFBiRUlUUWRjT0prMEc1?=
 =?utf-8?B?WTc0UTl1NDhNcEFWcWhsY2FnTSsydGloWktOZVZsVmhvSW1VRWM3UFpyU3FY?=
 =?utf-8?B?WEVCbG5mN0lEZ3R2RkVwRGwzWVovc3ZZWkRwYW8zY2MvczdwaEVJS3NCV005?=
 =?utf-8?B?bUE0TytkU2s5ajFrZU4xbGZwQ3IzdnNHRlgwMGFWUGlkM1RFUmlBZncrVkZQ?=
 =?utf-8?B?MHVFSit2Qnp2TDZ6cXA0SmttcEZlRXVpSmkzclBBNzViR0o3VEVVODJxL2dh?=
 =?utf-8?B?TXFrMGRkUVhuSHJWQmtFd0Qwa0VaL2RoTkdwZ1ZVUTErcHhNZzM5MGFCUG1i?=
 =?utf-8?B?VkFVdHlPRlIyR25kTU1HRUVYRjZKS3Z0U1FKRHRUQUNRTUIwRHpEUEdSWE80?=
 =?utf-8?B?d3ZkbVRDaEV4bHd1bTRsWVRnMnBNUnkxZ3lzd3o2RUxFNnJuUkxRS0dlb0Nk?=
 =?utf-8?B?UTkxRTkwcVpEN1l1NmZrL2ZnUjlNVTBjQ3lQS1hDaGhwQ2dRR0dwakVpUFpW?=
 =?utf-8?B?T0FyeklzeUVoeVUzMG1LeGRKd2gvSlMvaXZkWWYzQnpKcHJ0KzQvRDBzN245?=
 =?utf-8?B?Z3Q4enQyNkxEVzM4L1R2bXBlNXVseHlVQkhzci9FaGIrdFVaWnZudHdtMEtj?=
 =?utf-8?B?dTd4anZzbHJlMlRGNDYrZjNLbkhhU0wwcHE1SkJhTStkMnpMdE9SUFRweFdw?=
 =?utf-8?B?OEREcnpJcWNkRGNEYS8rTVNUWGNocFo1alBDQ1J6bDNTL2ZtMkVQU2tXalVt?=
 =?utf-8?B?elFDU3dZZSt6MnluN0xuRGNKR3lpS1JmSkdEb2ZLK2lZUktydUJTUU5nWUkr?=
 =?utf-8?B?Yjh4ckk1T3JaUm84QkpYV01UR04wU043ZUFBUEorbnBEUFhjamNoUlJqZU5k?=
 =?utf-8?B?cmpnWjl4djdNOWNkb002QlBnM0ROQndGWTBHTUk3a0xRSzNRT3NUZnVUcGxJ?=
 =?utf-8?B?QVRaZy9sMjZSMW9DemxhMG1XRHp0VnZCcjN2TkNnZG1FQnRSZDZIZDFteXND?=
 =?utf-8?B?R2xKaWJIZEsxc3VsUVB3dHg3Mi9KTFlkOWhLZ0t2MXlYc1dqajRNYW8weFU3?=
 =?utf-8?B?c0FlanBNVm1KZmxpME42UXJZVEJ3QStHcUtNUVlKY21QZDZIbjdYbkVZZXhk?=
 =?utf-8?B?bit0c2hQQ0duMHlvVU4zRk1jRldkSkhOWFI5c21pSzVSNElISkFSTFRmRXg3?=
 =?utf-8?B?M2VEeTdGZjAyLytDcEEyeW9TYXBDeGpiV2R1WHZSUEptY3VGaE9reEdGT0NJ?=
 =?utf-8?B?K1BrNlFMdWUrMS8zSGtDOFVvN21kTTcyUGFYVldyMTN1OVVlbTJPTlpiSVJE?=
 =?utf-8?B?YnpIT3BTTDQ2a0NQNzVxRXhWRVQrWXlZazV1V3k4cXJ2R1Y5eE5pNFlTcVp5?=
 =?utf-8?B?YkJSS3pUVHl1M3BrZ1dBL1lqSlRDUWhPankxWXZialBIVGZiWjlNYXBlK1NP?=
 =?utf-8?B?MnR4ZUpncUxJQ05KampVMHE0SVgwcWJYckZ5MnVHM2RtVU5PRDNpQllXWm40?=
 =?utf-8?B?TTdVY1hpWGxDV3R4ai9zdlBWV3hKbWV4aHdwL08yNWZZNngwVFRPbkpvbklQ?=
 =?utf-8?B?YmtoKzZvTmRFOWkvQnhmZ1dMQkROWFRBeXFWTDdJRVA0akZ6MnRMUG9KanVQ?=
 =?utf-8?B?eU1wQm1mb09uaXl6c0hGaEo3cTdDcWE4Ti83L2htRWJxOENodm0zT1RtZFFO?=
 =?utf-8?B?RG5TLzZFUjAvbnQzc2gvMEx6MUlZZUxjdHVFYURLM25jZDg1LzllajBjZ0di?=
 =?utf-8?B?Q2pwRlpFYVVDalVLR3lNS1JmNVR0bWhWUXRKRW9PeTlTbVowc0xYbFlnQkZu?=
 =?utf-8?B?SDJTamdVUkxNL1JOWjdscXhhbWFGaFdFZnJNRWlQVDJpWmJjeGdLcVc5Kytt?=
 =?utf-8?B?L2F3cERhVkJLbFVtSXFZUW5jU1RSTURBVWZVbUIxUytmYWNRT1orMncvWE5V?=
 =?utf-8?B?TkgyaTNMUkJTRVVVZk9xTHpNZVZERUNzVDJBV3A5aHBxRGtSVWxBbFp1TFkw?=
 =?utf-8?B?SEUrU2tPeHZaVW5nZndHN2FYZUZqallSaTMyVkhTVTRVekdqNlBQUjFCQmpQ?=
 =?utf-8?B?SStBZEtaZ1JYbUV4d1k2QXduSGoxMzdpb3VNYWV1ZWZ6U2hYRlMxNGp5aW9T?=
 =?utf-8?B?QmRMVVE4TGdGa1MwMG1BQytjNzI0U0E1VE5RZ1lxS1hsbVNQTEdMc0doUWdW?=
 =?utf-8?Q?8oqckCjGhlhv/Cbt0E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08abba10-b475-42d5-a293-08de78734d68
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:49:35.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Nq6DkhwtjbGWtj4zdwQ8z3/nJWCalFZEMhP29EKgoy+qI8aUzQ8Yrd0n1TrVJxwjgX8g1aEggBfPU8byT4DZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7545

On Mon, Mar 02, 2026 at 11:53:00AM +0100, Max Krummenacher wrote:
> Am Donnerstag, dem 26.02.2026 um 10:12 -0500 schrieb Frank Li:
> > On Thu, Feb 26, 2026 at 01:47:39PM +0100, Max Krummenacher wrote:
> > > On Wed, Feb 25, 2026 at 12:51:32PM -0500, Frank Li wrote:
> > > > On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> > > > > On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > > > > > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > > > > > Hi Frank
> > > > > > >
> > > > > > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > > > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > > >
> > > > > > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > > > > > > >
> > > > > > > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > > > > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > > > > > > again after reverting it.
> > > > > > > > >
> > > > > > > > > Although this has only been verified on these two modules, the issue
> > > > > > > > > is expected to affect all device trees using the gpmi-nand driver.
> > > > > > > > >
> > > > > > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > > > > > ...
> > > > > > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > > > > > [    0.960500] ubi0: attaching mtd4
> > > > > > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > > > > > > ...
> > > > > > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > > > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > > > > > ...
> > > > > > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > > > > > > >
> > > > > > > > Can you help found the real reason why not boot?
> > > > > > > > nand@0 is preferred format for MTD raw nand.
> > > > > > > >
> > > > > > > > Frank
> > > > > > >
> > > > > > > I guess the root cause is that the driver for gpmi-nand predates the
> > > > > > > update of the binding rules which want the nand device described in
> > > > > > > a child node 'nand@0' also for nand controllers which only can
> > > > > > > control one nand chip.
> > > > > > >
> > > > > > > While it is possible to update the driver in the same patch set as
> > > > > > > changing the device tree to understand the new dtb rules, maybe even
> > > > > > > falling back to the old definitions this likely breaks other users,
> > > > > > > most notable U-Boot.
> > > > > >
> > > > > > GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> > > > > > boot problem?
> > > > >
> > > > > My concern is that the new device tree (with the nand@0 subnode) is not
> > > > > yet understood by other consumers of the DT sources, e.g. U‑Boot, older
> > > > > Linux kernels (before the driver change), possibly barebox, and any
> > > > > other consumer that relies on the kernel DT files.
> > > >
> > > > I understand, but we need move forward. we can keep both for transition.
> > > >
> > > > >
> > > > > Updating only the Linux driver to support both the new and old bindings
> > > > > therefore solves only part of the problem. As long as these other
> > > > > consumers do not understand both bindings as well, we cannot safely
> > > > > update the shared DT sources. So I think the commit needs to be reverted.
> > > > >
> > > > > In addition, the proposed fix in the driver is likely incomplete:
> > > > > with the old binding there may be child nodes (i.e for partitions).
> > > > > 'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
> > > > > a node whcih is not the node that actually describes the single NAND
> > > > > chip.
> > > >
> > > > I know it is incomplete, just want to check if it is the reason cause
> > > > boot failure.
> > > >
> > > > >
> > > > > An alternative approach could be to update the binding documentation
> > > > > so that, specifically for the GPMI driver, the older binding is also
> > > > > considered valid.
> > > >
> > > > Not easy to do that, I try many method to update yaml file. common nand
> > > > flash detect node node "nand-controller".
> > > >
> > > > > Once the driver supports both the old and the new binding, the old
> > > > > form could be marked as deprecated, but still allowed for compatibility.
> > > > > This would avoid breaking existing consumers while giving us a path
> > > > > to migrate DTs over time.
> > > >
> > > > Needn't revert all, just revert delete part, keep both to help migrate.
> > > >
> > > > anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > fix your problem.
> > >
> > > I tested the following on Colibri iMX7.
> > >
> > > kernel 7.0-rc1 and DTB are built from an untouched kernel at commit
> > > 7dff99b35460 ("Remove WARN_ALL_UNSEEDED_RANDOM kernel config option").
> > >
> > > kernel 7.0-rc1 patched has the sources as above plus the changes you
> > > propose to the gpmi-nand driver.
> > >
> > > DTB-reverted has the sources as above plus commit 8124b4a4a96b ("ARM:
> > > dts: imx: move nand related property under nand@0") reverted.
> > >
> > >                               DTB        DTB-reverted
> > >
> > > kernel 7.0-rc1                fail       boots
> > >
> > > kernel 7.0-rc1 patched        boots      boots
> >
> > Thanks you for testing. I will work a formal patch for it. Can you help
> > rework you patch, which keep both properties, just revert deleted part
> > and keep everything nand@0, so it help transistion. you also start work
> > uboot part.
>
> We are happy to test any patch proposals on our hardware for U-Boot
> and Linux, with and without the nand@0 subnode.
>
> Please note that the current state as of Linux v7.0-rc2 is broken
> for our NAND-based modules, and our CI no longer produces any useful
> results as a consequence.
>
> I strongly believe that, as an immediate first step, the commit
> that moved the DT NAND chip configuration into its subnode should
> be reverted.

As my previous said, can do partial revert? Just add back property under
gpmi and keep nand@0 node.

For example

--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -260,14 +260,10 @@ fixed-link {
&gpmi {
  	pinctrl-names = "default";
  	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
  	#address-cells = <1>;
 	#size-cells = <0>;
  	status = "okay";

Remove "- nand@0" part.  You can use "git add -p" to do that.

Frank


>
> Regards
> Max
>
> >
> > I plan give additional 1 year to do transistion. This type layout actually
> > exist for long time.
> >
> > Frank
> >
> > >
> > > Regards
> > > Max
> > >
> > > >
> > > > Frank
> > > > >
> > > > > Regards,
> > > > > Max
> > > > >
> > > > > >
> > > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > >  {
> > > > > >         struct nand_chip *chip = &this->nand;
> > > > > >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > > > > > +       struct device_node *np;
> > > > > >         int ret;
> > > > > >
> > > > > >         /* init the MTD data structures */
> > > > > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > >
> > > > > >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> > > > > >         nand_set_controller_data(chip, this);
> > > > > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > > > > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > > > +       if (!np)
> > > > > > +               np = this->pdev->dev.of_node;
> > > > > > +       nand_set_flash_node(chip, np);
> > > > > >         chip->legacy.block_markbad = gpmi_block_markbad;
> > > > > >         chip->badblock_pattern  = &gpmi_bbt_descr;
> > > > > >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> > > > > >
> > > > > > Frank
> > > > > > >
> > > > > > >
> > > > > > > So I don't see a quick fix other than reverting and living with the
> > > > > > > dtb_check warning.
> > > > > > >
> > > > > > > Regards,
> > > > > > > Max
> > > > > > >
> > > > > > > > >
> > > > > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c3 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "disabled";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c3 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	#address-cells = <1>;
> > > > > > > > >  	#size-cells = <0>;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c3 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "disabled";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "disabled";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &i2c2 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > +	nand-ecc-strength = <8>;
> > > > > > > > > +	nand-ecc-step-size = <512>;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > -		nand-ecc-strength = <8>;
> > > > > > > > > -		nand-ecc-step-size = <512>;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > +	nand-ecc-strength = <0>;
> > > > > > > > > +	nand-ecc-step-size = <0>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > -		nand-ecc-strength = <0>;
> > > > > > > > > -		nand-ecc-step-size = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &iomuxc {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "disabled";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &uart1 {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > > > > >  &gpmi {
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	status = "okay";
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  &snvs_poweroff {
> > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > > > > >  /* NAND on such SKUs */
> > > > > > > > >  &gpmi {
> > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > -
> > > > > > > > > -	nand@0 {
> > > > > > > > > -		reg = <0>;
> > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > -	};
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > >  /* On-module Power I2C */
> > > > > > > > > --
> > > > > > > > > 2.42.0
> > > > > > > > >
