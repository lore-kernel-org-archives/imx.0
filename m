Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E951212B2D
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549816; cv=fail; b=SZnPdBMjnZUmk/CO3dlPgyF6kNShy27SRocRdlEqiwbnZNAdTT67TCLNDnJzecMv6hzrcl+Ofe9U6aiW1TJZmtjrNlRb4w/8OCBu4XlKMLbI0mcdSZRchZK255PunIskbpnft2Aj1NBvH/gcwmlmrv4WdHPqKK5sEg1dIHumuZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549816; c=relaxed/simple;
	bh=3Ghe6QNb+R0Ki5ozNsUwWcaBMceE4d20Mao8K4T1bVo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OmSY4QYSB8qcPj3GyP+eDvta+dWzjAXtCsU8zJTu3OsQ+iP0OhPIgnnLGDCNNYvwSTCOct2+4esjBCLNVmWKKtQX7/M4ictKpB638eljxTv2swBusWCWjs9Le49zoaduTtaRdBgN2Rehnwl3RnBMl8jXTaN4X9C2ZpKFE5hdGbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sk3/UREI; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sk3/UREI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6kJuS4mQNmkoEZfF4v8frm6FS8XULWrNJmFmlIX2l2ryJysjRlx0J+WwLvtCCYDRmVnFu74TWavjXp3zfUn1KZ/2nL62Dj38bYXjH7Xs8ByeC6HLit+0QALKjwLdmxBp0PidCkLLQy2AVlgEOj2bjAJMGtTz9l2iz6RKUc6Lhw+wAyCzC1aa1IerUck6peVJehGavVA5X7Qw1BTNvKjd3H2fSbPhhlMymtqfPYk8xdliMViMIt3lu91XlmfyFiEvJUUgE/TN+h3bk12vFtvL05XcZfJ7UVpmYWtg6u6tDBRxKzXyX768gpVzIQU/JOYe0WDhE8vToyjP0/sDZxQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu5YzX0lQxORfSzOhPyBLeDk4ELdhTsv+ImvSSz6TYA=;
 b=f6v+SPLRn8jhHGWAvE7nDGPI8GEvU7B0IVzH9jaOqObKArKso/QlKtcdIvgm+wJQOZ6qMhoPUnOFubgRoCQjJLwX6njnyqhze21BnkSQhl/oXshI28bUBtpE2+gvbHCXcfbbhJug0SZxu68lTx3zuMzA7NoodjUhAfJV4S6zheExTP1EoFnREC6gX/nMe72WRuZ1jFOyHnWr2TzCjt4HdzTYKlfct6s9VplMB3wzJr56UukDvCByA+wJk5NcxOxEDOtcfc+n9yPQ6BZ5b1LlNvzg0P+LCTiiU8Yda0RnfApASotZhl+PI1RLZWhacFAQA58oUgeyeerV3s21aJZSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu5YzX0lQxORfSzOhPyBLeDk4ELdhTsv+ImvSSz6TYA=;
 b=Sk3/UREIUs+Rb3F2VaqvIF6LoBE7ox6kwHtfX6BK63Z9Tgk1Guhc1r6zDGNp4o9i6Ldl6xHPSbigbeSMeKfmSDrwV2GoooCa+bBj/iA/evV70Ckevt+zylHj3BeZXJtrfFqUUrliaqCJ6Y+mizdWotJEVyESoGZWVGL1jV+nUXY8AwGyPmK5v6pUcvLtdr4uGzZqg1NvOgaFJ0WhNzqIOh+Oudv5swf9fKSGLcG5RI/QIfOakSFHqWDq9VK1f2AA1hLfs4bbbITX2jBbZaXxqHGNjADqaD52Ls/1oszd+xpqQiv//FnW5h1+ALgWrqMBJV2YyWcHAdpm9O97kXoLkQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 12:43:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 12:43:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbbBYMTEhCMwRsZE6F/AUFe4j9YLMhWBiAgADM3nCAAC/yAIAAaO1A
Date: Wed, 22 Jan 2025 12:43:29 +0000
Message-ID:
 <PAXPR04MB845968F43269C116E5C09E6488E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
 <8513553.T7Z3S40VBb@steina-w>
 <PAXPR04MB8459845E7D949680044E203188E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <3890686.kQq0lBPeGt@steina-w>
In-Reply-To: <3890686.kQq0lBPeGt@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBBPR04MB7594:EE_
x-ms-office365-filtering-correlation-id: 7ea72a7f-92e4-4f2d-c649-08dd3ae25fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RY8IhnecJUibv0FiJKwYXSRaRWGnUY+gZ+BgyygeT8sPst0VnxN5ZyJMPxY+?=
 =?us-ascii?Q?taOL4/ki4W1hL0FCSCvV68ahPjf3HqUuYpK/I2koVhQ8hbolvo5/9QlomVKg?=
 =?us-ascii?Q?crDR9n3IPQpP3a5YHMJGS9ZYBvy4N6kYLSUts1WrnmT3ybJ6eOk3eY7lWMco?=
 =?us-ascii?Q?7bACcRMxkDBc9IQdhnvaMg9TEuFEphprvKfcts4bsxZRtUE7SOtomh1zYKG9?=
 =?us-ascii?Q?IWlG53mHrh4B7hkqfElo5axMzBJniJMCUYhiOROjXQ7a9DPYX3WkdGXYNxYH?=
 =?us-ascii?Q?VvuVvaBEF15rbVjK92fCJ2JX0kr8MDjfBDPGD+b8blqm7hcC1RMagKhQ+Es0?=
 =?us-ascii?Q?+JBrUmuPhwAbs6JSAZN6A3DKmjTGEtdTA7T3Gx6gAeyhIGC8FVhDneoBY9mE?=
 =?us-ascii?Q?oRQsExDrlPKbuARBkHOaU25fkhdPRVmxizxN3r9nLlC874KKkY32Ob8aShvt?=
 =?us-ascii?Q?pbHG0JyDIFAH7w+dwWdjZJx/LdS9Y8dTRpmnvS/VYr0S8ZwgkfL27PAyaht2?=
 =?us-ascii?Q?NAt4gRCuvlhC73Xe0Iv2NkBjiW5n1FlrxbWgaVIL5dYUlrcfqPB6g1OovIrp?=
 =?us-ascii?Q?z9G5YytHtPDCkDi4xQn/HRFjA+1486UQX0XkVilWCJAYGb2qWYJ6FZaaQpdk?=
 =?us-ascii?Q?0ZdtoYG64T3fcsLjpG4IYFaCTx0UNLQ1bCKOPYLGZCiA7SxAhnsIfOtzekh5?=
 =?us-ascii?Q?k3GijinioWEAwp7QjRrLMiFn+hADvwEpp8UgGn+pHdrJBsn8tGHRz7TMF6vN?=
 =?us-ascii?Q?QEZlsLNOMqErQCTqlfYh/AV6Jo81Nc6v7AXoQ/GI7mciTb5Ztr09n12KtlvY?=
 =?us-ascii?Q?xgeTf4f7G+CODBQCS+EhVR4TlmKcNsnDAdOO+wF6gwpSz9h/5AArbBbMgrqh?=
 =?us-ascii?Q?7636AevTbsf6Jq6XgvRW0dMRWtlkWK1cDPMxxQimaX+7zLsfJ7EYDocF1eaT?=
 =?us-ascii?Q?mDhw/p592Rfe++DEudXRJl6IRNzIP7VOf7aJVi/tgW1279L+OggtqnWNnBZS?=
 =?us-ascii?Q?1hSgw7if4H7WX+yDjM1V3IPDEr+y9hMi9Ad3U5tWUBA6ZgVj0f4MDv55xK9U?=
 =?us-ascii?Q?V44UZwwG49seV6qwlDeGCmnQQta4Z8nWPNsbwxoKx/48tmGS5NqrYFZjAmZi?=
 =?us-ascii?Q?DXNxY4mxoLZRgu1hD4gKrCbW1xNu0+kinxl/xpSPwjYL6WTv7J6UUuUCWYVS?=
 =?us-ascii?Q?qW6oJSnjfU9/sVVoewvW+5LLd/oCfpYS1al56miYmtTtO4nQfEpoahB21Fd0?=
 =?us-ascii?Q?gls4n4JlmyxqJ0r5CMuqjssQTRvhhT4qD8ndm1m6QJl9f4/JUYdWaryniSwT?=
 =?us-ascii?Q?00Cme7cFzxX8sVvZsXmhglg9Ym2MMOeNp4R1RIp7i++2clFVX3J7AdOvgV1e?=
 =?us-ascii?Q?wrDUAh91fUO8udYIj8WhGxDk6MKbUgzwx4VyHPWwvwtfyutXhhjYnC+aVo6r?=
 =?us-ascii?Q?s0Urpde8Nnj51E+ltz40hWxl7FJaJ7Yx6bFzg0knavn+Q1ojNgLWYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L1UP66kHprilt4qVqLxlQLw4G19aRu/zqPa8wf76wLSDeRSzaFrNMJbBh7tq?=
 =?us-ascii?Q?cgjy+W6N7eGEd6JZtEqXZlVAXYTMn6eVbbm4aeH83jCe/vYBmDw9P+HYiO9u?=
 =?us-ascii?Q?/6LEh7kviHlEBe9waOKqpO5wNrT0xZ89Xq+ZnpMS2MYrqufEuBwJuJQ/iFMk?=
 =?us-ascii?Q?aOhIw/sQo5g79P4GkGCBMalYkGOplo3rAWV4wcoGa0NVI2DG+233x9TuCGMa?=
 =?us-ascii?Q?iSbCF+zzOdfJf5IUZlqQHc53DJZ9G0R++t8UUprfUI17F8Z3J/tovGE54xYe?=
 =?us-ascii?Q?ohuQFIpi2SNDSh6fWTdbS7cM6IHm/5fdI+9tGoRjUZxbW/ffU1y3yTlMLqLs?=
 =?us-ascii?Q?fHod3SW6tw4zIAz7XW94CaYnk7Rzpb4sqJmhXcFwUIxhFpoaYgIs1VDgjXFY?=
 =?us-ascii?Q?4udt4DAZXQuHuBqsHZkLHdouWWH8S2Po849Xpt7EGpimq+xkfklt4blNDUpU?=
 =?us-ascii?Q?8K7Cgb2eGQZ8VVmPmSxq001EVfwpqT2x9juO7GWR9vXG/Tw4UXqRlz9tX8TA?=
 =?us-ascii?Q?5XlUd4NEFJ5FIkEbH2bo/LZuBgm4QhjiDR8hxYw1n8d95TDtTV3ItS0YE8in?=
 =?us-ascii?Q?cBaFCo1w+QkHU0OJJYi/CMUeTf3mr+0oSu6kBL9CoVGdoxMlWZg6J0mbL9Aa?=
 =?us-ascii?Q?bsPuOYe7cCxqjL6UHKN07e4Plyxc5KNCthSV/F7eeolvcDGd2+TQLYE4naWT?=
 =?us-ascii?Q?cHHuit9a9PzpDJ/8MoQO77D37IwkWLEAuwAtKDqpy8HL9+5+s6EulEzzHS9M?=
 =?us-ascii?Q?uR8VJUECae/5Kp2Iw4TtxQHflNEAg5AECOmtX6yPQIqgdPME0+4hHUwjBla+?=
 =?us-ascii?Q?apCohO0gWWOM7Bt7Ci8Rp9lFMwy9bnf6QYMlArAHw8pb3SfUFZ72Z6Px7mmx?=
 =?us-ascii?Q?iFK25VKw4d49f63JgPKJAXVnA10VCAqH4Z/I40thEUoqRynQ3chIsG/H7y9n?=
 =?us-ascii?Q?q+t9qlEg9scvw9dZQ8FWQ1L6xAiXASFW68vpv5aygh4/UDC3AeFYNu+cfsuD?=
 =?us-ascii?Q?KTsV0lnbzC6Dh19oJ94TYE8YE9oMSMksOnAJBZCe7GPxgQVULrNBDvNCDA7h?=
 =?us-ascii?Q?ObMSRtw5tKIJcBcXRcSbEMhP+mhY4U8/GG9D0jC/dHnGPUAxSr+dL77gII4x?=
 =?us-ascii?Q?LYLHua6fT7EC0sT9V+0DhvkGkpRVMBA206AbWVF+SIYzOTHPmeuXTjaILSqi?=
 =?us-ascii?Q?GTJW9FVG4K3NzmG2Q8kWX/iUzoBH1qJ9ot4YoXq5V3lg3a0BAMu40ghHOhgX?=
 =?us-ascii?Q?MhCUm8wZN5Dqr5NfjyrYv6p0bEgJr7dEW1a6Ivim9wFpVjo1Tbm+LUdkkxls?=
 =?us-ascii?Q?KeKDehpnuoeUXUJzTQ0BIjVoEKiuXqVwLeoYesFtOPUPXCmPAJ0hfLG24+wK?=
 =?us-ascii?Q?2UeTI33P7yJbKWtmjNs0JecZSmTQGR4mAQbyk/cYdo98NkGRKbwjyOfmXieY?=
 =?us-ascii?Q?kAL6vZzXY9ArzabNbVbcNtil8PT9YM/QPa+ce2o67SVNfSwWRDdYsIWFkmL0?=
 =?us-ascii?Q?H8HllBbvqlVwtVMp6322ho+YbpML4GMimGAO7PMP5VjoVs9HT26o2t6pTm7w?=
 =?us-ascii?Q?c9wlGtRImJeGU1AxxqFyAhHpElPod9hegR4t1S1p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea72a7f-92e4-4f2d-c649-08dd3ae25fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 12:43:29.9376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGv4vfnh9T27BZgx7a9S0pyNJ6t1TDz9Dn1CKjCdKE1/e+4Xu2zQ7YLKRPvQj3JnAcS+/+aqZJ5MT8rUbyGW/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

> Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> Am Mittwoch, 22. Januar 2025, 04:36:33 CET schrieb Peng Fan:
> > > Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support
> accessing
> > > controller for i.MX9
> > >
> > > Hi,
> > >
> > > Am Dienstag, 21. Januar 2025, 16:05:32 CET schrieb Peng Fan (OSS):
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > i.MX9 OCOTP supports a specific peripheral or function being
> fused
> > > > which means disabled, so
> > > >  - Introduce ocotp_access_gates to be container of efuse gate info
> > > >  - Iterate all nodes to check accessing permission. If not
> > > >    allowed to be accessed, detach the node
> > > >
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/nvmem/Kconfig         |   3 +
> > > >  drivers/nvmem/imx-ocotp-ele.c | 172
> > > > +++++++++++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 174 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index
> > > >
> > >
> 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1af
> > > d753534b56fe
> > > > 1f5ef3e3ec55 100644
> > > > --- a/drivers/nvmem/Kconfig
> > > > +++ b/drivers/nvmem/Kconfig
> > > > @@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
> > > >  	  This is a driver for the On-Chip OTP Controller (OCOTP)
> > > >  	  available on i.MX SoCs which has ELE.
> > > >
> > > > +	  If built as modules, any other driver relying on this working
> > > > +	  as access controller also needs to be a module as well.
> > > > +
> > > >  config NVMEM_IMX_OCOTP_SCU
> > > >  	tristate "i.MX8 SCU On-Chip OTP Controller support"
> > > >  	depends on IMX_SCU
> > > > diff --git a/drivers/nvmem/imx-ocotp-ele.c
> > > > b/drivers/nvmem/imx-ocotp-ele.c index
> > > >
> > >
> ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760ee
> > > ed44a989992
> > > > fb35c462c0b4 100644
> > > > --- a/drivers/nvmem/imx-ocotp-ele.c
> > > > +++ b/drivers/nvmem/imx-ocotp-ele.c
> > > > @@ -5,6 +5,8 @@
> > > >   * Copyright 2023 NXP
> > > >   */
> > > >
> > > > +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> > > > +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/module.h>
> > > > @@ -27,6 +29,7 @@ struct ocotp_map_entry {  };
> > > >
> > > >  struct ocotp_devtype_data {
> > > > +	const struct ocotp_access_gates *access_gates;
> > > >  	u32 reg_off;
> > > >  	char *name;
> > > >  	u32 size;
> > > > @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
> > > >  	struct ocotp_map_entry entry[];
> > > >  };
> > > >
> > > > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > > > +
> > > > +struct access_gate {
> > > > +	u32 word;
> > > > +	u32 mask;
> > > > +};
> > > > +
> > > > +struct ocotp_access_gates {
> > > > +	u32 num_words;
> > > > +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> > > > +	u32 num_gates;
> > > > +	struct access_gate *gates;
> > > > +};
> > > > +
> > > >  struct imx_ocotp_priv {
> > > >  	struct device *dev;
> > > >  	void __iomem *base;
> > > > @@ -131,6 +148,82 @@ static void
> > > imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> > > >  	cell->read_post_process =3D imx_ocotp_cell_pp;  }
> > > >
> > > > +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv
> > > > +*priv,
> > > > +u32 id) {
> > > > +	const struct ocotp_access_gates *access_gates =3D priv->data-
> > > >access_gates;
> > > > +	void __iomem *reg =3D priv->base + priv->data->reg_off;
> > > > +	u32 word, mask, val;
> > > > +
> > > > +	if (id >=3D access_gates->num_gates) {
> > > > +		dev_err(priv->config.dev, "Index %d too large\n", id);
> > > > +		return -EACCES;
> > > > +	}
> > > > +
> > > > +	word =3D access_gates->gates[id].word;
> > > > +	mask =3D access_gates->gates[id].mask;
> > > > +
> > > > +	reg =3D priv->base + priv->data->reg_off + (word << 2);
> > > > +	val =3D readl(reg);
> > > > +
> > > > +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n",
> > > id, word, mask);
> > > > +	/* true means not allow access */
> > > > +	if (val & mask)
> > > > +		return -EACCES;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv
> > > > +*priv, struct device_node *parent) {
> > > > +	struct device *dev =3D priv->config.dev;
> > > > +
> > > > +	for_each_available_child_of_node_scoped(parent, child) {
> > > > +		struct of_phandle_args args;
> > > > +		u32 id, idx =3D 0;
> > > > +
> > > > +		while (!of_parse_phandle_with_args(child, "access-
> > > controllers",
> > > > +						   "#access-
> > > controller-cells",
> > > > +						   idx++, &args)) {
> > > > +			of_node_put(args.np);
> > > > +			if (args.np !=3D dev->of_node)
> > > > +				continue;
> > > > +
> > > > +			/* Only support one cell */
> > > > +			if (args.args_count !=3D 1) {
> > > > +				dev_err(dev, "wrong args count\n");
> > > > +				continue;
> > > > +			}
> > > > +
> > > > +			id =3D args.args[0];
> > > > +
> > > > +			dev_dbg(dev, "Checking node: %pOF
> > > gate: %d\n", child, id);
> > > > +
> > > > +			if (imx_ele_ocotp_check_access(priv, id)) {
> > > > +				of_detach_node(child);
> > > > +				dev_info(dev, "%pOF: Not granted,
> > > device driver will not be probed\n",
> > > > +					 child);
> > > > +			}
> > > > +		}
> > > > +
> > > > +		imx_ele_ocotp_grant_access(priv, child);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv
> > > > +*priv) {
> > > > +	struct device_node *root __free(device_node) =3D
> > > > +of_find_node_by_path("/");
> > > > +
> > > > +	if (!priv->data->access_gates)
> > > > +		return 0;
> > > > +
> > > > +	/* This should never happen */
> > > > +	WARN_ON(!root);
> > >
> > > Even if you warning something is wrong, aka root =3D=3D NULL, you are
> > > still using it on imx_ele_ocotp_grant_access(). Just return early.
> > >
> > > if (WARN_ON(!))
> > > 	return -EINVAL;
> >
> > Hmm, If this really happens, return early or not does not make much
> sense.
> > Does it really matter here?
>=20
> Why does it not make much sense? You already know something is
> wrong, aka you have a NULL pointer, so it makes even less sense to
> continue.
> I've skipped through the sources and looked for
> 'WARN_ON(!<pointer>)', most of the times it is actually checked for
> early returns.
>=20
I will include the fail return in V7. Please help check if other parts are
good for you.

Thanks,
Peng.
