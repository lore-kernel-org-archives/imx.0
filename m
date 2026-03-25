Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212173EF0B9
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451811; cv=fail; b=ff2Y8OdQU/88gRIiI+IuPS2r6dEtm+UbzKA4Nxg+rfnDBYtqL38UJaYBYfcS78O801LKTzbVEZ/LKF9ubI2w6xI8hXjACdTbA21Iow0ksEAAb3kJf76oKpr/iv9YLZH2SOjHjcP9bioWu4SG/XHOBHCy1nub/xi6mJizzqzIDP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451811; c=relaxed/simple;
	bh=eX+AWpQMI6Z85JZhpdP0xKBHQL9GsafaFgmuE1oh4EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A3e+9/cPBtzb1Mr7lIWKLz2JHA0VRUpa7+SOBCwsztf+zcgIMyIAT2jWrp2wm2XgLHDVaHCb/jcBLhp2KZgdzDqEe3pDFYYlyzVnT9IZ84alxAsAr6UnxomuqY3vaASv5XsNtwHHhk+yH0pAWltWvTwQhjGfAEa5XXkdu1FhrKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kPLjiFzM; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kPLjiFzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9hXzu4KloXUFPyHXY+IEcGdYdAcbByV4Jxrjnc8eHDFZ/xUuvGxZl4QZRzG2HwKYX3Wke770kCex60SvVDmPsgwEEqqjL6ukUPUyjzJuXsFjDfl0quCrmq45/044/+t1eERNbLDwjjbEp//Z8fqaGIZ740B6jtGWW1sVzC6e433zF4ZR9iRhygHsot7UCEFwSo94IKb05tQ4LTQ11RvOdmMHzHCQg05a5KwnXKnvuBTbcNXJcm7uIeCA1OKsne182pOcWhNQOVKDI9YnH2NgVrRxOJtQe72aUHULSQIH9CRgLxh3wPmEsEteS9+VcCrSZTgHlT9G53QcelnN7gkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQBZymJBZ884z9vM909At0045PXx3xmpSGgqgpi1Mbs=;
 b=K01Xq6OFRvKw1iU4h8TI3SDISizl3jwazsEBRW5hzFZ4GGf5bvgJEbcvy379aSiP+OjrHBzTiM64itR8NZ5P3T0B4LP+sgIw3w4mNcpZlbXTJEapOTSeDjIyPNZXptjSn1m0SJCjZiFZxb/PR//6F3X4BQkNA9gW0NzEDochLztspayobVmAgvBfw6paI+P5z5rkaG21zPLX64kfG4fsZYMMLVxKXbsvJLtDKEN5P6KiaOVXKCC0BjSuK73FJTV+YrR/RJAna7paPoMBvEwqntDeb/3IuGyjYOiBZa9183yzuFMqvQplWQOAR+eY5h//wS//TKkc5Cew2FwWgjWqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQBZymJBZ884z9vM909At0045PXx3xmpSGgqgpi1Mbs=;
 b=kPLjiFzMBfpRBEUeHbIhaz5ujE1AoW6joMMGSBXUxMVuK0czTvN9hZAK4O+BfZdXZ//gBlK4azmGSgcCUZb8qI7T1hCznbLNxZ6/kBYd8sbCM8xxtpRY8FLrOLQrXIeBdtdNrjbFdCTDZXN/fZej0rzd+D+gI6uls9Hoy9YmpTLo9gJ/BJAJPya+v1ZGfpiZFqRVSYwneATLU0yRP1E2P9w0vTI41x6q68bxjlX+MTAU3H0I/zqlnfncz3G+ch5bRyDqo+nMiFw5hPP/4gPq6Gld8rMjUQt5V+5bgqIBP+dogwsYfUEf2csiYp2rezXeiQh8cH5085gUt6W4Bpsmrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10747.eurprd04.prod.outlook.com (2603:10a6:102:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 15:16:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:16:47 +0000
Date: Wed, 25 Mar 2026 11:16:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
Message-ID: <acP8V63DP8blyaay@lizhi-Precision-Tower-5810>
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
 <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
 <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
 <e580bc1d-96ce-43c5-880f-bb8ee31fda28@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e580bc1d-96ce-43c5-880f-bb8ee31fda28@nabladev.com>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10747:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba56db3-826b-41e9-1f06-08de8a8187f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+XQ81lnVPYX7Zn4d5hDpZHGpgTQ6jXB/1qpuip/C+xCjnOm4Swf1JiBLYnRu7m18ql63XhfqgXb0BENWiYq4aZ6oY3U7tcNbIcduaMOlGF8QX4Yn+4+/beiyxylScAm+1Ro2BF/53V2Tv2kYPoZyOxjFGXJKamHPUBnDdcu9IgfBply9Au0cqRftNouxlWWNHQCfyRNxds6RnC6O/SLE7Ac/xpyafqEgo9fuznMtMVk9kZ29sAwVT962e/Xhb18I3ugVIYpC0HTblb/Jz65Y5bCSlENg23C/HalQZnPIHmd4Fm1C2A2j6lnxQW2wKPFM88e8+3SGCneFPE/qrRv53a8B0kI4XEVqjuevBU08lIa3fhPEXBZB0E6ZFAaABHmAHreZoWuNW0IsYi3qxUmbeDByHwWTRYZ5LNvn7lI5/PfY9r/7NWm6w641CcKnQ/3HUTGM11YRYd/hvp9FUO0lU5J9E4Z5Ps2lWA0nLYZ3KOd5nHD4WMWNseqxv5si2oicyJ9ZlXMXI4gM+N8MbG03XkFZoZXrWOYslOyxv7/6ihbzHKdekCo9OEoBBWfOATLt7vA/h0E7p75br80DKIB3+cPV6nf1T9bj52ClFPdXQFrgt15G3ZKKRR+4syEpE8MEJDshzqNMo6SN19QmkPh3KhaZM8AQ3u41/jRgLzuIay9GmwcFiMFki5wD/0m0na3BMGSnQiaCygt+RMQ+pIlTtYZGlQD/gvKSG/ZabPAZ3VQsqmh0hqv5KkuCDurCGvXrVeuqJ64aNQ55bkSyM1NF5OpAkxcXOf5KAo1WjXwooLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ARf6YK6TvIqrdln0ismUJUtW9VJ5GfuSezZht+NiwrEx4pAWNrHmjY35f4Ja?=
 =?us-ascii?Q?Xp4v6J1JaxdM+vvOUzWEkFNHu0SMn3n0w8oc1zUvHbv9NLXIQZpa7jgJbw3r?=
 =?us-ascii?Q?CgB6Pv4F62wV3i5MQ1c9Vw28ci68pNTmp6+wKKlBTXF0DDLNroaurl08X+Xl?=
 =?us-ascii?Q?i+av48h9tS79W1+fYVAfVlAm1LerK5yKkx7elC0E3bsKL2NW2HHMVjojoCO1?=
 =?us-ascii?Q?cIBXtL0WZU1zjL/5drJhdJA1oiFzFLyBvWuAU9wt7VbH+rB7+KV8aNotBYZ8?=
 =?us-ascii?Q?2CFJniepwcngbh1x/sXlnerSxC4hwY6A31TChy7YhBRrtYJaJHi/W5xM8CBa?=
 =?us-ascii?Q?rsFa55eK+/kiLn2wkp1b03gmez5vDHO16j12axnx5uDPx5/iLlkRpWqrSGJ5?=
 =?us-ascii?Q?m3uQ8aREsZ7vA9QFfyMqq9lXGwnKJttn14/AANPKincz7TAEuvIDjoVaVrxE?=
 =?us-ascii?Q?e6u8yZ0+s/1yuIMnQCyu7OJ42LD7WCGMs3oT8lCmUtniO2CHJ31usmTgVLUk?=
 =?us-ascii?Q?k+PEIm5aqfef40Cvc2DyGyrVyHMcXtC9GhMrtLqfeOwwYoqmG8cXJiiRshJu?=
 =?us-ascii?Q?9l9wXZKLsMTAvl3eNBIc7i/otVPv3h1bi52vfCQQvqfLuubLGfPnXQKthPpO?=
 =?us-ascii?Q?4ynNW+15OYzVOSTRh+Zjdh6lVKixV16r/4RhfBcvh+Z/aP0sp4J8TZ3OfKJQ?=
 =?us-ascii?Q?WqXclmItGybwKCLhMXdVCGiV/9Igfk0Dae5h6aIJKnGViQ08rjLyVYw3Qmfh?=
 =?us-ascii?Q?QUhlmU17uY8OJnhoCchn5HHCvr0Bsuyf9HBhczhfJx6d/yfcDUCfy/2NdSX3?=
 =?us-ascii?Q?7+lxU/TEvMpidpQiPljqgvaWx7UblT7KpxH6yM4+ElK8+zfxbEtPkLBOYiVm?=
 =?us-ascii?Q?rRC/UIeqawphPDJ+Bh8xaVS8iS6GNVJq2aHsXRVtx4m6s7ICJl6d5tPNrkm9?=
 =?us-ascii?Q?b5bs7y5D/VWxnnVen6FWzOzZmWi/c81XVcPvQeHp2yRQ21PyO5GGvGJX+zdC?=
 =?us-ascii?Q?5ENeY/j2iqwhPCXwfQK5cNBBL9NKDlgFYCsKvVH3NcwXmv3WqM2pP8ISEP+n?=
 =?us-ascii?Q?gCcDbErWj+FQOvcjGyY/JyNnFULiWFc2tpJqnpwRBXcUGtalmteNSiyB6N+2?=
 =?us-ascii?Q?qLmA4ZN2uLDaqjQNufsh2xvybsV6mDT6L1lAR4cT2D0bKsGiHfm8dEztGAHN?=
 =?us-ascii?Q?8SoEhXBfMKfTI7AyFJ6VBEDsDoHL5tcnTGj9DN2qH3SP5fV9s93evwIG6CMs?=
 =?us-ascii?Q?Pkrwbp7EJeGdNEHWm6D24bjIyQhYQX6oLK5RwlMayEG70wcFRsgCKzEPEBo3?=
 =?us-ascii?Q?gwxRvbYL1LPcE3rXASz85ZPN6sgkbRtUABg9YdtZc6bTrTWsEQJwDYCer2CF?=
 =?us-ascii?Q?fWNkiZDq5fn7ZkIhSpmGrqDcZ9DWLRPMIYF3FLMy16nzr0sE8ulH4wLC4ziz?=
 =?us-ascii?Q?yqW8kWGQCPV8GRShClCm1B6Pp71tmrVJmrQ3efE3xiZyqGFjrRbvtf3oNd26?=
 =?us-ascii?Q?t3WHfUW15nZtRC8we/B6wdEuvtYjIid5cGsO9la0wVclnbhn9aatIqRhRj24?=
 =?us-ascii?Q?Xkv1L8whDS+k/kUNNY2qFVNrXvrCzFhqRllBotNwsMMe+ffXkXUoeR6PWzro?=
 =?us-ascii?Q?0ShRw1bbXgdrE5HB4t2QXhtI2gAXMOeizVYNROjRH7Dalj7jYGbWiSgqE1gM?=
 =?us-ascii?Q?rRkTeswUCyolsua+Qr2MxfUAlfpfBA95dWdVe7Eo7F018p56?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba56db3-826b-41e9-1f06-08de8a8187f8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:16:47.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enmnQkA6Dey4DW6EJHdbDfVUuagMLr7vHhca1k0BjdqFdhPJt39VMgIihBa+VdbgA0mJwsyNjWCpI3Qk8nTyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10747

On Tue, Mar 24, 2026 at 10:43:25PM +0100, Marek Vasut wrote:
> On 3/24/26 9:00 PM, Frank Li wrote:
> > On Tue, Mar 24, 2026 at 06:39:10PM +0100, Marek Vasut wrote:
> > > On 3/24/26 5:01 PM, Frank Li wrote:
> > > > On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
> > > > ...
> > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> > > > > new file mode 100644
> > > > > index 0000000000000..534737363c9f0
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> > > > > @@ -0,0 +1,42 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright (C) 2022 Marek Vasut
> > > >
> > > > 2026?
> > >
> > > That was the original copyright year when this was implemented, but I can
> > > update it to 2022-2026 ?
> >
> > Okay, you upstream this year.
>
> Right, V2 does extend the copyrights until this year.
>
> > > > > + */
> > > > > +
> > > > > +&display_bl {
> > > > > +	pwms = <&pwm1 0 5000000 0>;
> > > > > +};
> > > > > +
> > > > > +&DH_OVERLAY_PANEL_I2C_BUS {
> > > >
> > > > why upcase for label, generally it should be lower case
> > >
> > > Because this label is really a macro , please read on.
> > >
> > > > > +	#address-cells = <1>;
> > > > > +	#size-cells = <0>;
> > > > > +
> > > > > +	touchscreen@41 {
> > > > > +		compatible = "ilitek,ili251x";
> > > > > +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
> > > > > +		pinctrl-names = "default";
> > > > > +		reg = <0x41>;
> > > >
> > > > reg should second property,  please dt-format for new dts files.
> > > > check others
> > > What is "dt-format" ? Linux kernel source tree, even current next, does not
> > > mention such a tool . I did run schema check and checkpatch on these
> > > patches. obv.
> >
> > I send out at many place, https://github.com/lznuaa/dt-format
> > I write small tools to detect and fix node and property order problem,
> > it may be buggy.
> >
> > These node order problem is easy to detected and fix by tools to save
> > review cycle and focus on the important stuff.
> Maybe "make dtbs_check" target could include this tool , to make people
> aware of it ?

Good suggest, but it is not mature and not everyone agree all code style
yet. practice and run at imx project firstly. It is not perfected, but
helpful.

Frank
