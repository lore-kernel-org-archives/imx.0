Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032640;
	b=kwf+OWjclMEbO6LDLKwROC4ZSJwLbkzh0aWnXKDjVYZLjyzCzHMVt+b153g8GIES1wGt
	 2Y8rK2NapJcD/d3aJWRAmqUgN/zuPqbE8A3zwvzGueYDYvbKLypCfUlL9UdxjBcSO1jTY
	 bHWjVQz24rlptejUnNIevIKNoFq5Sn3EjyiVOoh7bsKQZC456QtRaCJMbXwdCgIKEn8kQ
	 uflq8T2xETD6NmcmB2ITJDSjAJkR7PPfTeMXd0DC0EfBG4M5C7ai4GIDW6ChpW0iCqc4d
	 biwd1Ezi7jm7dq2fj68xUmlObUdUDxikO84nEB9qTYr6eTDbtpp/qSeOdpgOfs/R5Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032640;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DDKqcvkyHn0nVAfF7cN7jubqP9SBC+2JdL5ytzegju8=;
	b=ez1Gh1fdqY9cSORxaPBcIVhMygqDbOPY98RoQ0PC6v9cdS5IidxN/G++yl2aRQq08F2B
	 3mKKnpRKstP/s7p5gFx7CDMN8LnqcYmbCiNuwiLjuGBSHxbc5B8upz4T3/HYYCkBdzOSA
	 CRnxtoNv8jG2m+LUaAceOAhfDQGWP91NJJw4jpM94fqO3weGJr2MbJS7NjFRT3TBtPJPn
	 drGcG7J3BpSf2Fwmh20QIxk6dpBugsX3LjW88IXoI/UMoWHFJ1mUwLGKirhhn085HVWGk
	 +UtcjfZiubzEDrKi0cRa57hOQmgzv38jRHuTAbkMcNCe4PFJqQr0omHYnx2DyqchrIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ooPZ7vN+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.9
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB3606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ooPZ7vN+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roo9BHMJQP95GqJxBd9kou2rYLDcrh4xG1BkXomRh6UEg7FBXKBrfQ6Eivfa1r1237W1UpzxlmBdXuQDINr6ZVC417F/yHhGyg+bVU4HLjCOU4l3Ocwcq34Fj9h8hwQof5c2OFYS49+MJWzOfFn8erDOyDwf1E6oMCdbG+5DtcGKRyDzy+2OHoWctlKL/qpYB3w/u0WRHh+QmsOnHkrnnIYIu9A3Oq7bNhhJCDclCLOoo+R7lsNUeeX7CddUCdKY2bXXXKk8ehcG/F0EDhDjVS3NqSMATb8I/lXSCy0DNL++o2tqxPUEfqImz9sBrlO75Vc+jH6E2SV4uTGvS7hp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDKqcvkyHn0nVAfF7cN7jubqP9SBC+2JdL5ytzegju8=;
 b=CpIkwD0xyDBkkl//443tzBBbDN5JPS0B7wv55JToq8dKZEmr/mqxCF7HlE6x58Gq5h+tIeIaLbHskUtgIIAYYiiBoLIm5mj0eg5RYiYif1nkWvNARd3RQhxXk3QzUpPy1kcxb21QrUSMXs6CofBl+5ZwWZeQJk+XIS59YZbofME7k9RIZdp0GweYHnNOoQLfmLR/fxhFViB1D5+XLVIrItnkfMDUazu6Qh08iv0A3ISpAy1+AYVezsNr2A2amtr9t98UBN1/7hWo+zwVHbSNQRT9U4xW93BraxOmBb1pHJcq4x9IHl88pamtS3SAURaBmq8hEkqUme8v9DwJGMKw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDKqcvkyHn0nVAfF7cN7jubqP9SBC+2JdL5ytzegju8=;
 b=ooPZ7vN+lzTbPBGrhww6Pow9yxQ1OT5R6GWD3OTf+3F/+sUs1iZfKREyDmhFJs5pJWQe5Vhu4EgBd6KJCMCX8Po3DlHyKogmIi4jH3pAE59ktM9JzfAok10Z0B6/vS4m7QQjLV/upRGxKEhKkthz9LNt3JzqiXA1YowCCXa3+lCxnO6bHaamtC2woO93Z/GIxDYqwCnnlH7Du9IPOyC5VYiUL+isNPHWut+Rlbb+Vq6yY3kf/QAjA0NWB6KOl2nMvV3XyuxJI5LplUdZhDXO7wMg4NPwGgZEmYNKEi+rNZ5VLwWD3d8eLE533tCPulvuBzdtiV9C0frvDacA592HFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10140.eurprd04.prod.outlook.com (2603:10a6:800:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:37:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:37:15 +0000
Date: Mon, 26 Oct 2026 11:37:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <at-BsPCwPGlpnuJ5@SMW015318>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
 <at8Pc9jDy0dX8Sr9@GLaDOS.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at8Pc9jDy0dX8Sr9@GLaDOS.station>
X-ClientProxiedBy: PH7PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:510:23d::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: 334da4ee-b48c-4ea9-0c79-08df337f64c6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|19092799006|366016|261026140227099003|4143699003|56012099006|11063799006|261022075727099003|261022105027099003|10067099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 10AvuLR/Npt2K/hAir0ddX0/AcYxswk+BIuW5MAQ5SU42nmmqHp0HCEmgGe3xIMrwcErZmsc+/ekNDutNFhcq+iiTUs5CW3KheERyBuPThzmJ12/kqq9YvOxppFBEbXcGYHc6k0bWkP6DUqfj3jfFKORN04aTtHz7OsINJu0O6ZQV1C56AHOCviBJLp22/uum4CxwhhKMfdBo2Yw0xiq9llyVrCsEApdrt4MvT52BVeUoQVvFSQM3FGhUpQK89v7uxyFxBiTKnkYL49Hh1DaqnkEH4jp9vj4Ytmr7tutdfDH6KxAAEvNb7a3EXXIbMeqfGjmfrhVwUxyRWfbJQfiwNbDyf2lkE6+TYrX1kG8moJR4/BdyslMg72nBC7FSf+8lR37TnssxOrDfbslww0txSAPWKL+03p8ara+yOTBNVl7sAVNu6RX3LkrqhzzIVB17mPq/S03/acUEci/LXkP2wHWyecAWeXTP4NWYtEV+IOTPsn8jwUwAmSt9myBAj/tC6o/L1Dsis30HVMex08drgIWHijd6D1Ij9trakX/ReUcBuZfS1Gabarm/UzCBlP8sLBx/ynFhmRDGeeXXy9FJpY1D+XXbfObZBv5OWLRGF8IbaudTVmmznfRkBjSAHbPuYnbNOL/ZeT9176EONwxNPpcYupjEJLkdpoH6dumC0s=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(19092799006)(366016)(261026140227099003)(4143699003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(10067099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NyXtvUCEIJRv2mJKYcHFa54xxjwNRMyl5xE4dhsAH8vTVC4MiqxR5kxkGfym?=
 =?us-ascii?Q?OO6xen1bV+IBLEoG+Oziegb5DckCC4K7uPnkXKbGs7BvgjKGwuc6bFhnoAmA?=
 =?us-ascii?Q?yU9JNscHgJuzKrOenHJzGwj0IexffE0FFfeudlc9I6Icb+sw82kmmOvJwbc+?=
 =?us-ascii?Q?ZY5oCm0aY8ZAEUak7IaTMmW4xlT+vWjV3qa/ZGZEIb2L2bc4YwY86gJOsnlo?=
 =?us-ascii?Q?SkkLabxYEzvXY5BVFuyeA8fblVG8jQYWsXk/ELAF4ohZFKz7cG8ULi1PFpwH?=
 =?us-ascii?Q?DzyJdpOMsDBYiUHTcyoBh3H2hgjcrvnRWQxWniwupA+17aRdkuNrkbZaroxR?=
 =?us-ascii?Q?TOHgP/LCd5FEdeXFYcwwxNi7PCB0sTEoOvkOcrNbcNhFFZaZfr0us0QInDv+?=
 =?us-ascii?Q?t7WYtOupIVZGlaOTiAE6/iyapMqExFttIDfHF1QQA/yCf1nZ+UXYOLs+hl7r?=
 =?us-ascii?Q?Z7Ns6h/GYRM+adkjfvNnd5nTTIkXXZBhO/yqNZmPIZtwMSOOdzLtJsKIU1hW?=
 =?us-ascii?Q?IJ1BXNrlHzapr11J8LGG7RCB0/G79wuGWUqDDR8lylDQFIXkPNzqHSXwb6HF?=
 =?us-ascii?Q?Ye5j8ykUvXuieKgCjWIx+NaEOIIvfjpSiokb4byPrc/jwLH44rDm7pKlWtV6?=
 =?us-ascii?Q?T7nmzr4TGgtk/Gwc8TxD4AzbJeLI1zGJQTSg17JN5cSW7RFkrc41o8DEA6DL?=
 =?us-ascii?Q?Wl0i4h6lOfo0sho3QCXBTZQRo8dP2MCs6hqmGEPHAGU3GiddBIA6K3Qz+wNI?=
 =?us-ascii?Q?Re2taKpUnkn+ubJsPKG4+bVdUJRCcQN7tguATjQNiqUzGAi/CEXvYNNsNCtL?=
 =?us-ascii?Q?OhAegDINVvNndTbVNh15zb5gdrHkb1kyIsktt4S4TRAj+gKuVqxogAIMj70h?=
 =?us-ascii?Q?IcJZqioA/6mMle65u/iJovxUOSswTdbahqY5Hc/XyYvcWO19GGU4d2//vGZO?=
 =?us-ascii?Q?Uh1aWVZZi+26/BtFPP+fyOrhxrNklJkyvFB4STItj1n99Of1BrBAeKBcxxfR?=
 =?us-ascii?Q?AzW6MA2y/a8yuHnaG0fbZcpi2Imr5pfxnBmhHKNfLqf3I2kyF3exOsRaP7PQ?=
 =?us-ascii?Q?mvDB8IuqGrVbN09h04ILm3Eox/aa8TEyV9xRrly3G6hCYenDD7lnWmKGetUD?=
 =?us-ascii?Q?D7QvLDwSBB3libADNgH44QVWS4isbcqTMoDPfPdNyzU3anliDXgfJBFN6PUc?=
 =?us-ascii?Q?K6BrZu4ujdPqjbqko1yOfIrbsN//A5+nZhJAkOWyYbDbyAKUx5rVaqX4a15G?=
 =?us-ascii?Q?1R15bA2DIZk+6OBkRMny61BFFubyZiWYsyXuWrLpkS8x8rWHv14ySKXGQyGr?=
 =?us-ascii?Q?YFiFYN+Qx7YUpCKC9c4QUHeUtu1yW51jWqrdAprRxTAwjEVbOPbHstURhEGv?=
 =?us-ascii?Q?JAAFWJ/bKkyPNApPqo6aPvSmyYckJ0HrCR6QadIte7nE1Bke26jtR2hw2p1L?=
 =?us-ascii?Q?tgivDEBneI9NnTPW4jVaMGsfvErVa3AKaQNZK9PYMbqxdws/WIm/ZibwRjmT?=
 =?us-ascii?Q?olcdEbK+tMmdTqFsEMoXPKIwXtrtQsIv/nreLJAJrL4+nPSRsUIJGyUVgu3X?=
 =?us-ascii?Q?THqeycDHc3xIayhLpbuAxYwkQQTTsrG1RNgsMxM7TinpQrm5YBO/oj0GXJZC?=
 =?us-ascii?Q?vJ+K9WD7EAWP/9A2CrmOmNHmSyYqQjoLivF2U1KN7j/UrQv8tKMU4kFVIoYm?=
 =?us-ascii?Q?/cCfaYKAM/U38khJhs+5JyHyU4lSHmnyBjBdapUix+eCUlw5zL1rE1+3Jjl8?=
 =?us-ascii?Q?Vot2hN4XtEKNgwWkPztaR/bQofa11SbSkqHlHZxUf3ERRiKWPj6X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334da4ee-b48c-4ea9-0c79-08df337f64c6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:37:15.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCMRwsfKfBGjbVO27XCqhdSW8F0jd8iCp8QQ7Ea2L4OxHj1v3/DUoBqm9axG6hWDm/eUNE1KsAw4u5KbJZ+9J7Hocohgha1X3s8m5sGWgyzWDUBdH492NO+8iXZK6ATL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10140

On Mon, Oct 26, 2026 at 09:29:39AM +0100, Stefano Radaelli wrote:
> Hi Frank,
>
> On Fri, Oct 23, 2026 at 10:15:36AM -0500, Frank Li wrote:
> > >
> > >   imx8mm-var-dart-2.2-sonata-1.4.dtb
> > >     DART-MX8M Mini v2.2 on Sonata v1.4
> > >
> > > These are proposed names, assuming that the same DT correctly describes
> > > all the hardware combinations covered by each entry.
> >
> > If new boards 2.3 appear, do you plan change to
> > imx8mm-var-dart-2.2-sonata-1.4-2.3.dtb?
> >
> > Rename affect addtional problem or efforts when back port.
>
> No, our intention is to keep the filename unchanged. For example,
> imx8mm-var-dart-2.0-sonata-1.0.dtb would retain that name even if it
> also supports later revisions, provided that the same description
> remains correct for all previously supported hardware.
>
> Regarding the filename itself, would it be acceptable to include both
> the SoM and carrier hardware revisions, as in the example above?

Is it for created dtb file? We generally doesn't finial results.

> Or is there a preferred upstream naming convention for distinguishing
> these combinations? I have not found a clear example to follow where
> both revisions are included in the filename.
>
> We would introduce a separate DTS/DTB only when the hardware requires
> a different description, sharing the common parts through .dtsi files.
> Our preference is to distribute complete DTBs that the bootloader
> can load directly.

It should be fine only if dts can be shared. It is okay to generate differe
combination dtb file by using makefile.

>
> > How about use boards compatible string? You add new compatible for new
> > boards, so user know this dts cover which boards.
>
> Could you give an example of how you would handle the root compatible
> property when the same DTB is used unchanged on multiple revisions?
>
> For instance, if SoM v2.0 and v2.1 on the same carrier can share exactly
> the same DT, would you retain the existing board compatible, or
> introduce revision-specific strings? How would those be represented
> in the shared DTS?

Yes, need revision-specific compatible string.

compatible = "SoM2.1-carrier-0.1", "SoMv2.0-carrier-0.2", ....

Frank

>
> Thanks,
> Stefano
