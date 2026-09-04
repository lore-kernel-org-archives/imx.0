Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB04AA1E2
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532103; cv=fail; b=bj8IzjXJFZ6xhzg3tYnJ/W96P2DvMsA+CPOdgt/mrtP+mPhWoZB3OS+hOdRaHoyR2U5umtZrkeesHkruC/3lw57GMqIUz0Hp12i2NspL24E1wgktqbcgiXNIV861xLu/ckZCKXa08XUSC5dNve/UVnRTdk5/aIYacBa1DBGZLsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532103; c=relaxed/simple;
	bh=053YoGRdJS66Th8/Jsnz75CXf0/RSEVceExoZu4sujo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jlUenz8uvjdELtKEUDb8PQhgierfwd5aM23ld/+TvKmb8wp6V1okqQlV/3Lr23APtqrl4z+epJSDLSALgNCq4EGMBxU1ofm1LwlL4sW1m41wp4vGO+U3MSb4wnJve+1+GGpYfhZCdiQ1oKozUfUVnumKonYSdHrxmMclXBF7uMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e4LXQCB6; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e4LXQCB6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfNRovpABPJnelQ+hY6mYbVPIXjfv0TcIH7n2Jngeefohq9yHQ+VvzHGoGE0BNcVQ5iXkUht6HAiyZW6r2HvUIKt5owQY7JXiwz8V1KYWBMsw5i6QLDkgfFq29/bIkwDdJpYFDu1jQguBtOsieRxMRUqtpEKDfu1gNrVBt3z9oCX8HHVguwRboaRLkBNAgI2ipKv9Rvl/JVjfIAAK++D0Y7kwuBT/rJbwLiBXml9/hGWYfrRwFTySYIDiBwd1ktxDsAFmzKnUX+0xBxESyhASmz9k4KcR35CMw9sBRy8Rc3ON7rGDTALZCcyBcMnkxE/LgkLXuiPhSZ8K5ee5J7a8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFdFnCP5ogOrEyzMM5b6Qw0+XmCV+SmHlZaZeU5Di/M=;
 b=pJC1tTOGnaA+Hp4vrLscShEfaRm9WcNhZ2TcUfIXVAolgq9vf6pJGIh7CVenNfmoOFMswKtPmfCHYxoCXExKQHVAqvHchl4Dkwy3RBqPyGBS+rmVHTZtMWgSv22R0iYSqafmxcRYFLAQcTD9UE5oBHa6isldE2eIqiBJ2lMR186kkPHNUwuW3pF746RE/sXux43ggqMHzRtNKc/7w6qve68goHOV352XyvDTlmyKZCQV77FJVtRBCUs0phmIvFTzZRY0gFmM8/Yn1mtc6LOaSoIglcHLDbxZHO7p859F/m9vYy5xsTZMdHnWRqXpIpH/YAvBUvjg51xFIzjm1nuItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFdFnCP5ogOrEyzMM5b6Qw0+XmCV+SmHlZaZeU5Di/M=;
 b=e4LXQCB6xM2tAzu4zuucYaErG4Ty8C5g2OufYquXwvj5x+rY141U0Y5Hk+h6CwNktsUw8VQVXLvYnRSLtgjYOftKjRkH8EzA6+jjQFr5tz+6jB1Ptz31oWFcqxFlu0RuDYSB++oVY72FMJ4HOilYFQvDiwSvaHl+sY1BQO6rUchv7B34rsUi8JFotTEW9Wt3GOCfpkSY99jTZKMQn9KUKFD1EwbHH4MLP1+WQ8vQLC8uC5AwgcE30mw0VrnFrAvLIFVduCn1QCogNCujxn337vYmzKQQibWzRajHWWataSkCSmUVnAKn8ie5hcne+VaUz+kfPnJVlPAqGNYaIok68g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12276.eurprd04.prod.outlook.com (2603:10a6:10:629::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 14:28:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:28:18 +0000
Date: Fri, 4 Sep 2026 09:28:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <aprVea-DJpPYEYkJ@SMW015318>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
 <20260810190800.GA3046075@killaraus.ideasonboard.com>
 <antS9HruNMrGbZIc@SMW015318>
 <20260904142238.GB795906@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904142238.GB795906@killaraus.ideasonboard.com>
X-ClientProxiedBy: CY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:930:1e::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12276:EE_
X-MS-Office365-Filtering-Correlation-Id: 373ae19a-02c9-4526-c7d7-08df0a90c3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|19092799006|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rYFGeWFSUuVivyNB9jJ0TVyiMuJnO3e0Y/RYiMt1KNxKpgXC+8eY3ajPIHxb7n8DrL0TPDRtNlMTZWLC0UjC01/wL6hdoNgcOr4k09ttGM/jCbMAmOZ6330gOSivclVEVJZcygTU6ocf+46eC/TtSyGNjgsFrPtATZ9lz71o2jeMojrIYzj3cqM/bbGuHbQUDws6ifTMAeAq9rkM7urDjRmZwiO0w6xgMt7zwH+k0gjmiG1DgZGMtuWKXrjufnVi4tEfCCB13y5LZkX63VOiNMfKPzT34xM+o29XHozrYqRifEQKCUJD0bBIrDdFDEAWPRtkGLag9BguOItHNizpZvQBCzM3QtdjFrLogHUWSk9yNDOm/Ha4ROlUOXDlBbP0z2pfS+OFhfODXHlGzbnb0gtQAKnsWb8pgup8IRG6YrNvZQE/TKLHYaudU7d8YsiSZZEZJHILGhpV6jgdBRtt4IhjpsiKYLSf7DM2RLyPvS9kmdgBdnYx6CZeCmIjqLOo1rdmXXlFoNm6uvb/xLL4R1O5huuxpwzc57REsxvCVNOnWgFPh6RUeM/+i3QHVAkd08DAovS0tSIHGcsZHHEU6Q6LHh4atbfiRvnB1a78Y/A3LaCf7VxeQOkX1rr3bhHaxeOpwrJky4zN7NZfgAxX9tOdz9/I+b9sXXtInEYU8q4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UPXD9u49f9oeLTxwObR8lbSh30pFvxAYIbRTFrlSbRi9ru8GbumpmfyFrYPH?=
 =?us-ascii?Q?a8iv1Ygvx2wvTUWooKy8ps3edYGhqCMxnZxfhJ6sYkNKLa70h9kKAUDZTtu1?=
 =?us-ascii?Q?TMBh5KodZfPFbXqVIZjm3ZGjEcR3G4SXs1TxLQ5aGRUoMYOIj8KsSaW97Rje?=
 =?us-ascii?Q?QJwkxwANmlbbpRyVhjBvvYAVSOAlqnF8yhs+EG0oIABsyaPl/uPDK4m0/4lw?=
 =?us-ascii?Q?KqEWd1DMS8jqI1ZnFVTFxOD0JR4KQgifUoaBfnK/WB0DnhAxIAcx5gYI0dth?=
 =?us-ascii?Q?UXx9gzd8041GRwwyGF4CXf/rUiMOCQdFtf41Cxabe4ZHHRjh2kjuQvQBldc5?=
 =?us-ascii?Q?7pE2Yy8FcNHeCm4id1xCMuXbMOPko5dGL6ROwOP94hExC9tN2lVXqYh/wm+q?=
 =?us-ascii?Q?KfX88cNgbagCblZRsYuQeBiSUxTzqqboXUldXjOwnloPrUfEBCuDjlWz2L/K?=
 =?us-ascii?Q?IVm5P9HyLMqj+xUWBul3hPN2wb9aUZW+Dj6eub9u1d7KszE4OVzLMLQG7nSj?=
 =?us-ascii?Q?ghbON4biQTQBcd4OY+wwsBkekWMgi6fK+vEy9xh4dtszh21n0keqZsZdcDVD?=
 =?us-ascii?Q?aceXPCAgW3i2icmacLBN6RL3IRVCB1ifk36dCGTb3cfTf+AGcgt9WaNpvfgK?=
 =?us-ascii?Q?Dck8wkCLKJO/MxhSiAVBTxminfz3wyu33S9tcTxdQdBCuHVV/O2EEySLlMfb?=
 =?us-ascii?Q?6EPOIKyd8xlYWoEGZ3LSAtVAag1v7l8qhF1uj4ag6GybfM28M8ZdptTWbOSl?=
 =?us-ascii?Q?8bplO+cvHq+VkLWH57LqziQqTfMt58C26Mh0tOv0AJPAZvEEnal7yCxeFWBw?=
 =?us-ascii?Q?mB4grGteFIl09SlxsiMOOjUC85qPL70NxB66AtcJZprWkMmlSVs9EpfcRc4P?=
 =?us-ascii?Q?xBZwVkaQ8rQhfWO6xrRtvyrYVoARCKPE1M+2m9c51Y5rsfDEpGXnE+2PZqJ+?=
 =?us-ascii?Q?40yE+ewslfHBKzOBsZWTayCl2IMwzKEDTcEJHfcthl/R2wIjUqye+ptLHZo+?=
 =?us-ascii?Q?aXra9du9r8J8XX63ytonKuN5vPE+IFyWm2zD3Q/liTFx2P60/YkALZNK5eSx?=
 =?us-ascii?Q?HW4QeqAl0XG0EkwtlRtlyrhkDwWCsuLS1KOF/9eoH0aKYgsK2d3EvCBMoyyw?=
 =?us-ascii?Q?lbM6krBa6qf1xEGY1WjzGiQhfSEnUf3BER9Uj68BxDTIqhz8X5McwVc2KqAb?=
 =?us-ascii?Q?1eWHI168XxqHlOBjKHUlhm5NN2Vx9hvUEHm39l3Ybk4uf60OCwuZN0OoKNNi?=
 =?us-ascii?Q?TX6/r1q5J/lk+9w15vZaaMCDgWuZcO7BtFnY5gOY1FnF7N6I5FQUu3vKUnSk?=
 =?us-ascii?Q?RAiTRiz1DRz4XagrKmRCN1XQUvwFyNyVTl3ITh1ptU1yL6yEQuNEjQVBq3Y4?=
 =?us-ascii?Q?WysiJ6tXyN6JclcN1yyRO7SuZxfeTj6x9KHJj5Z7yc04Hs8vwS3COyJ9i4QF?=
 =?us-ascii?Q?8oflmkqfxIPN5t+1AWlgkfnlHTDScJLVDzn/yYplhH3BmV30wBL6GzuqL2Vi?=
 =?us-ascii?Q?C3c6sPBNh0fKs6Si+IfRtFVMPEX3LgoL14oojSWg6Sj08koqZK77d3uMxx1I?=
 =?us-ascii?Q?xK8zegMtiRhg9NHINcd9k4a0Li0beNRITwGmq68/3yIcKa7qlbYUnTiq4GGD?=
 =?us-ascii?Q?121MioPPgpJcAUZ0LZd8n8TBZwPARzBF/kcQKYyGlzlUpfkVtwiLAm8DSnC6?=
 =?us-ascii?Q?iUsGLqvABQ1rpRc7ycYiCWlzmkkjAza41GlsLnEQLHhhX7F5s6m9NEa02qnv?=
 =?us-ascii?Q?pyqd7rh/pGWXjBtY2Sn8HAI9WGwWdkfyxgtLhrXS+o2183PB3KH4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373ae19a-02c9-4526-c7d7-08df0a90c3b1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:28:18.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJEYSjjjLUJTuJoeb6i7ehsBVt3AbyBtMltST7jIFWpBYDjLAcz58eJAGBuuY4pOrLRsM20jZX8MZGJZo+VzSo4v+DNx2z+VIMHSvUqnJxFjGGZPuB267R/SbIbKC1Z8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12276

On Fri, Sep 04, 2026 at 05:22:38PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Tue, Aug 11, 2026 at 11:51:00AM -0500, Frank Li wrote:
> > On Mon, Aug 10, 2026 at 10:08:00PM +0300, Laurent Pinchart wrote:
> > > On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> > > > On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > > > > The clock-frequency for camera sensors has been deprecated in favour of
> > > > > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > > > > the device tree.
> > > >
> > > > Remove "clock-frequency" may break back compatiblity.
> > > >
> > > > A similar case
> > > > https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> > > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > > >
> > > > Need provide judgement in commit message about impact of break ABI.
> > >
> > > What ABI breakage ? The latest kernel supports the updated bindings
> > > (merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
> > > clock-frequency property for camera sensors") in v6.18).
> >
> > Dts now not only use by kenrel. such as uboot may use the same dts file.
> >
> > uboot may still use "clock-frequency". but uboot unlikely use camera. for
> > this case, just need mention at commit message
> >
> > "lock-frequency property for camera sensor have deprecated since
> >  ("dt-bindings: media: Deprecate  clock-frequency property for camera
> >  sensors") in v6.18, no known other user like (uboot) use it. So drop
> > it safely"
>
> How about the following ?
>
> ----
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties since commit
> aa1826696a55 ("dt-bindings: media: Deprecate clock-frequency property
> for camera sensors") in v6.18. The Linux kernel ov5645 driver has been
> handling the deprecated property as optional since the same kernel
> version.
>
> Replace the property in the device tree. There are no known users of the
> property outside of the Linux kernel. In particular, U-Boot doesn't
> operate the camera. Switching to the new bindings will therefore not
> introduce any breakage.
> ----
>
> If that's fine with you, can you please update the commit message when
> taking the patch ?

Yes, thanks

Frank

>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > Changes since v1:
> > > > >
> > > > > - Drop added blank line
> > > > > ---
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > > index ca4cb986efbc..0cc05d084f9b 100644
> > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > > @@ -233,7 +233,9 @@ camera@3c {
> > > > >  		pinctrl-0 = <&pinctrl_ov5645>;
> > > > >  		reg = <0x3c>;
> > > > >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > > -		clock-frequency = <24000000>;
> > > > > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > > +		assigned-clock-rates = <24000000>;
> > > > > +
> > > > >  		vdddo-supply = <&reg_1p8v>;
> > > > >  		vdda-supply = <&reg_2p8v>;
> > > > >  		vddd-supply = <&reg_1p5v>;
>
> --
> Regards,
>
> Laurent Pinchart
