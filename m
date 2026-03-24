Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0335298CAB
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382436; cv=fail; b=j6G8SWWk8SnAQHUJGJ8/IdtWbf6BCi4s9Mbc3MaGSNJaQYl6qm92WGzKGETKerc+zb6XnPstDQJ8YI0bsfDbfaiuRY6nTMKCKAEjZ9fOsC65p2jWLJEfWVe0VgkeJiVXbQP2kfLBhpXer37TOPU8xlI/6ylX6dSAznJdrvvGlsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382436; c=relaxed/simple;
	bh=7Sd+pJYi2YJ/KdkoL7GHue4k6ilx7lS4JI8VTGLDWkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K6dYcpAIe5mF4wU65Hd6PBlx4lRejWB8y80TGw0wUoAsQm/T2fyLtCtRt6m5zbzeqNLZhL3Mo7t8sPMF78CSM1lx54o8sdS6ZvJ3JqZK5+H8PIMtTTlK3bGZSGmlAZ/QQqq/Be5sEVPXA6dWalvI3U0ToadV3Uzi/cVkuUVLp3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TE8uFEmK; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TE8uFEmK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfzkF42CDkfBuh9GLfA2jPk19Bekrx8T/caj7W6hXX1J6osuVLZexB1vkuwrKVUl6s5v/VP41INBJB6TruE/Rp3RN5dT4OldOjVSk2SfCrTXurHf4DrBMHbEZn8O3HaM06joaEDJJfDa/LT7R0EmIO9d31zWhsFSLxF7f1uPFSUzcjQGPEU3RBgn2oG9t1coVCVedrl0gGdIaH9BoTJlnfqZeeCAnJ6xonmI5T1xqbrSlaO+qjZBoTvSEEPdc8eqnye0nI0wUmnrxoK0/okSbcr+3rEHzeoNBSFVniiA7liyeO4k7Cbd7/pM7c30Ah76x8w5DzxGOOckbH45cZSh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfDQjmTmbeTWTJ7Rz7Tm7w1HHFVE1VS+siOoGzPNxHY=;
 b=ZyzOUpNxGywpKvkcrYHP+mZJv3SQehKfRpM226iN+nXtRzduARUsRESz1F+Lmj3lP9znFKgDDt0hiGTJjo9LjZg4q34z7mN9VSEK9FwHbs2qea9RktclrOFDsABtTbPTnp9i2HsfNlNC3nA0zNU1oP/drHxPUTc5sAsgb2M+aX9aH4VD/dyta2QjXjkCVJojwIBxoXNqrJz1QU/whyvIgmkasA+t2NuxlfzZqkuJeJDuC/ustSmLqhExedIp2Muoo4mcycd6mHM0DK03qwPxZEh+BVb1zCy8cI34fHiBsNik3z9bsSPtnnDpfc6lhh7q9vJt98JljDHygsumeP69fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfDQjmTmbeTWTJ7Rz7Tm7w1HHFVE1VS+siOoGzPNxHY=;
 b=TE8uFEmK9fUII+RyH4kiT1F9ag6ox/R/EeXz9NbCgEsDd+5knBUZzBZMBgzshCJZecmB7PyLujJschEoMCfUmX37cXoMUNKqM4hNlFpXqX7L/hpaCwrGecZG3VvNzsVrR7kVsELPE22d+12CdyakZ1JEyx5zJOPwKowyy97EtcmShBozp0975j12okKgfasF2fynxWZVSlCWdEHQP9n1yFodVVrWIE/RA/IDnnI7GzuD5xqcD0U57dtdkXDYru18c1/q2iNrL+kLDO9LwxA9poewlNI7O93W0eAc6RvVYq0XH70gGWiL4NbHY7CSn3kxp9qXBeKDs39aIg4ONkfTTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10859.eurprd04.prod.outlook.com (2603:10a6:800:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 20:00:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 20:00:21 +0000
Date: Tue, 24 Mar 2026 16:00:23 -0400
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
Message-ID: <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
 <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
X-ClientProxiedBy: SN7PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:806:f3::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a1216c-9541-4b94-2bc1-08de89dffad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W83oXQIqVwWbM/bcsExvY2yCgiFpG/qkVPNwr4q442CLdwvjvE8TrKRKnMiUgT5gZOX60/Y+xvRyRvP2OpwlhyG8RMefshkPb3LYoZ5U5eeF2NdBNNCNq4CGjy3EUbdZs7ABImmGHcjOBKKklwVsnzVpjsebKoxUTmBhcAeB1TGvrucm0iWNAI/iZdhNlq9BB5o91TGuPBNEGTmwfLYTYvdFnHnXZsfKgP+AqB6ZaIH9e9+b3pgh3gSzxgSMXyUxSgKizpysUbePakGrR2zGTBUrldxscRQed3pxbjVH7oROKpU2GrWi37zMVddA8JODTrg0Bg44V+ponp5uhn9SeEODeYffNJfUTHUCbunZMUIaNLge7MucgDU60hPBOsWJcc0/42mDHyPdiSGQKHJIkyKLme1WZRNdtxtM5uMVD62DSWw4M2cM0gC0XE+OjP4xWM+QX7nylzTw/xSpyWGun8jGJynteUTySqkVMT1WuD0eJdBJ1NgLNns3Tgfqz+ok8PH+QYmogzuo0mcWf65Zf4iut21LaG5kzL2qdpvRG7bUC7c58d03o1tsi7c668uiaLuYkA7qnS2fv6sqZ/U1lMEUWYhKy/B7TUf2Br/yj4xsihar5oB2cfsBeoqaSpZGrVf36RYG11FICato0zHhpOloMNJUXAipkpOQr6I/XTxkNoxgl2o5Ty43dnOHD0XahoOl01pYBzKK4pQzwr74MNgMIIj1Fv/h0C1HOwe3xCygW6jOMEzOmgB6qjGhdeamoPsmZAUzZa/1ackmploxDd7VPuuccFT/L3FPr5r3WPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v6eiNxh/CUYCdlXWvBH/4GaJzaAtvSqX/CXaytbhEz30Ng/idZrYNsLnu1Jh?=
 =?us-ascii?Q?+L+cjlsZQJcCj2ewb8l/eMdxCzhQmgi62eoYUSE5MKV/hERT4dchEyPinzFX?=
 =?us-ascii?Q?ko+g6W30vT8t6FRKWiQ5bUZEkTOUWcxD+aGKuwmDxc/kTnwnkWEPk3VPKt00?=
 =?us-ascii?Q?DLsK0AhU2u4/+St+mXJPGPZ1H4Y+ohM+WWX+I2h8rmszSgT7fTBvMKKO12/D?=
 =?us-ascii?Q?2K21TCn7zGMskNmWpBuf/gT314ty+vElMrSU6MBEgU6cSuPFjmfjUhncyyUT?=
 =?us-ascii?Q?HfV45Yu7od+eDpkSENOFpEy7ozqt7LXRnegscqTLX/Xsv70BlP692AoBcdFV?=
 =?us-ascii?Q?hWcqPzHHAp7h6xZMmiUjx3Xd0b/6n3su08fdWAbxNb7t5ARirKSNjONyN0WZ?=
 =?us-ascii?Q?lSui8Gd0de4DyyQ2/AmoDPAum1q0eaIWr/NF3r1/sDd+bsk5/uhIzsw2PTRJ?=
 =?us-ascii?Q?ZxZOGUhfXYM+hZX1G8o05ZtqObRr+KtVu7btJx8l0e1mLcZKuPrND2KOK55r?=
 =?us-ascii?Q?RVWKvpLdQmROAoYehe2JqtLESoTlwT46wQJZgVxxnW+Bnh9Cr2UHJl1Ju7IF?=
 =?us-ascii?Q?k0wacyRHnu7vJt72ErVP1sSLZy9xEI0nLTW4C28gPde5xNt0Z59T+Ty5tvCr?=
 =?us-ascii?Q?U24nHXe3MqXNZ6AG9PI28SmVm72z7Gv5YzJBX63UYBji5s1D5V/kSHMv7zzm?=
 =?us-ascii?Q?bTyaxM4DyFb40VR7cZ5GZGsqRGibd/pey8gHHKzllvZubTUrx+5H+dpqmIkX?=
 =?us-ascii?Q?TgIFmSt4zN1NYTm9m3YPY4lJ0xIcDZr4d61v6FKCbLAR4U31L+VJKKstNejo?=
 =?us-ascii?Q?R/xnDpr95fFtU0HJg+m3ymxkLfGo7DGjOIScMd6+3UAcC2ckLkgKH0QFsyxZ?=
 =?us-ascii?Q?QYFWaC/TQB7/+glGTo9RopoLCJ/ABczaSpKcVztoWmFP7BzzgaBdJCePxEMi?=
 =?us-ascii?Q?2BnIqW4p9YREups7pZqtdZU9AklmUxUxnW3k9lnl35Ds3YYP0eNaaOahVrbC?=
 =?us-ascii?Q?W5EzaGFuTr3HC6xZumI0eXUn8AIcJsrzy5o7UxCYMDSYkI274GhQ+Z+XWc9a?=
 =?us-ascii?Q?f1vEvyyuE4+Fn4yRNNe4f6/4RAgVSEMvONkTvJV2oC48nfa7XTeyio2zZJ//?=
 =?us-ascii?Q?V2zjQUQ1vLr+WQSWco4Fe0+un+BFIQfJDy3z5ikcIieffkWQxGINQo0pOtIC?=
 =?us-ascii?Q?DdOgL8lKzyY8/DzvL/QTC0jC+t+r+Ok8TenyxzZrnDCollggo8mp/jpZTKzb?=
 =?us-ascii?Q?HYwYbF28GebtME5klgPx64otPPKNEfrzL4t3cEyFZtl6yE3zzalh/iOwc1ee?=
 =?us-ascii?Q?Vq4i304XKaAF4O3xLGFXkmDCFQaUs3/aHshq3vVqRqsFvBEiSSuuIBxBfKD5?=
 =?us-ascii?Q?EVh85NYOjpEmHJb+Mw21mvgWuxDAnA7HwWP369OraK++DbFIyUA0v64C1T11?=
 =?us-ascii?Q?35cYqwcO5cBtN5EF6tH5k6XFYI9V+VQiEfVVxIP6bO37a4LoHbxmkySdzTX4?=
 =?us-ascii?Q?VQ/OaM9Yg595vt49posOkCZbl6ly0c7jyuOu0NWBSxjQs1mmwpLvqpQFC4iw?=
 =?us-ascii?Q?z0/70ZAe6lLD8mqN2jf/rYdRUii9xEfKES3AmQWcvA9qyJU0Dmp9A0vwwZnI?=
 =?us-ascii?Q?oPJNJ04JfI009bIvjG9ad5InfFsybQWYV+rku1+STmbIqDZ80LvMtDrRXjN8?=
 =?us-ascii?Q?ZB58M1tfAbSE3+zmr9yZFaBdFvVNub3Ic5yHaUNzHXUZuCpl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a1216c-9541-4b94-2bc1-08de89dffad6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:00:21.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ1ml6ePd6jy6sajeQrZaH6dKvlVUVWA3YjrHAEulecLth39Bh1BMWD9c82GRlXPa8BVDB94khScUFvLDaCTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10859

On Tue, Mar 24, 2026 at 06:39:10PM +0100, Marek Vasut wrote:
> On 3/24/26 5:01 PM, Frank Li wrote:
> > On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
> > ...
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> > > new file mode 100644
> > > index 0000000000000..534737363c9f0
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
> > > @@ -0,0 +1,42 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (C) 2022 Marek Vasut
> >
> > 2026?
>
> That was the original copyright year when this was implemented, but I can
> update it to 2022-2026 ?

Okay, you upstream this year.

>
> > > + */
> > > +
> > > +&display_bl {
> > > +	pwms = <&pwm1 0 5000000 0>;
> > > +};
> > > +
> > > +&DH_OVERLAY_PANEL_I2C_BUS {
> >
> > why upcase for label, generally it should be lower case
>
> Because this label is really a macro , please read on.
>
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +
> > > +	touchscreen@41 {
> > > +		compatible = "ilitek,ili251x";
> > > +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
> > > +		pinctrl-names = "default";
> > > +		reg = <0x41>;
> >
> > reg should second property,  please dt-format for new dts files.
> > check others
> What is "dt-format" ? Linux kernel source tree, even current next, does not
> mention such a tool . I did run schema check and checkpatch on these
> patches. obv.

I send out at many place, https://github.com/lznuaa/dt-format
I write small tools to detect and fix node and property order problem,
it may be buggy.

These node order problem is easy to detected and fix by tools to save
review cycle and focus on the important stuff.

Frank

>
> > > +		interrupt-parent = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT>;
> > ...
> > > +
> > > +	ports {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		port@1 {
> > > +			reg = <1>;
> >
> > need empty line between child node and property.
>
> Fixed in V2
>
> > > +	#size-cells = <0>;
> > > +
> > > +	eeprom@56 {
> > > +		compatible = "atmel,24c04";
> > > +		reg = <0x56>;
> > > +		pagesize = <16>;
> > > +	};
> > > +};
> > > +
> > > +&ecspi2 {
> > > +	status = "okay";
> >
> > status should be last property. I stop here because these
> > should be identify by tools/script
> Neither checkpatch nor schema validation complained about these.
>
> I moved the status=okay to the end. Anything else I should update ?
