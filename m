Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA923BE174
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467077; cv=fail; b=Z3+palrgINj03lqVr5GbhIjoZ1gPVJJYjsKWa5VAZTP4moc9syfiz7vEhZNrODVYwNwXwk3bQnG6rNhT8cGlXGMlQVdPmToZkRPtXMJxTm5JE7CR/iao0lKOcf3rsJRfBHp04Mafle8RBSEk0tLku+4vvf7qDQIjT2W29puuJvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467077; c=relaxed/simple;
	bh=aHSxkncYuX9+Aqmj16pFP+Zu9HLQnwWdhVw1cU74XW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yoinn4JPU1e7T+nI+p+ztUwATyMyvANkNDQt+4I6dlhPMO0+e5hL5NsLy4rZPwL8ErvaE9hSpQoqMc+LwLKlGVNR0uQb9nhhs24yLAhUpZlqzXgrGbtrKM/G4ca1Nu/frqWTF6LJVmtDVmkE+kr7vKkuUh0e2jC5k11lq4vHCGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Glg2vAO9; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Glg2vAO9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVjeYNv3JzL/upK7BaFjnE4OKD24wgeoeIdq6JMO7B0sdM6z0ndMCEtuDXDMdUR0Lxk4KfMfP34D0fnvqvTbo1fyxEN3aGFAaS9cd+udbZ3kOKwLL2pvucx4zBncMhBe3w0s+L+J6pbpb5jFLqrbjymaOP3J5dA2QRwgss6/7j9Y4QLwJ2Ukfk+VZTo6bZT/56tLUKHOT6ahugkjCi2t+ur73hf7xKyQJvyJMjeZLiiBtDtBkdGo25xXJF7j+/16e6lUpItW/tMVbFzy+4GS9Ny7BL0X3onhOjsm59NuELh/rK1A8zMeyt0ZIgFqlh7WJQikzZ3oTa6+hJggn1N7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X6vhgXy7QvBuA81/2XU7hjEj+02GwGDmJ7QkOMrJ2o=;
 b=cYYhDp8FsSC/tpIHN5ur+eJy29C5Chv0Zro1xpXpk/G4rbprNMQdxV9bFD3At9fvEQrK8TgNE8AvLBCEIdtRZpI89k30nbC8/ma4w8FQHvWiWObPxDfj4BukxdMm1IU8niBNjGNuGZHQ8ev0LysVvkd708WC3aUISczsw/q4O23nSOOSzj+kScbjX7Cs1vM2ycBd9EFS2wGCt4SJbj181ayg0vPbCRbC9lJmEtYyv6BPGZBHpFK8alAmCnNZdCcvZcTuA4dw2/RIrWIObnOKLzmH0aKX3yetQX2yUmNKFTApp2ELXDjjTdfcHoB+vRHgWQJHWIdVIU7eOUyUhucFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X6vhgXy7QvBuA81/2XU7hjEj+02GwGDmJ7QkOMrJ2o=;
 b=Glg2vAO9TUy0IfqmqEjh5JMiJkDu+TpLX2Ff3YUYZPTAAlngcOfZ7ooYNECYsIwjFhkwJOTbhk2oNMnzMmc6h+q1g1dG2HHPPAWTYsOYv0y4BlbzIvUlifuKgRVCC8GvPNUCIG8SesUfZSA0986KyBdODgX4FsYbJo5js4zU1BD3dNy9St+RZncBlKa9dycJVf+c1mmJV3TLQG0pohj38NUwbtLAPfy66fAetmy3KQfjq0Z90fnqjBunmWC41Qb/FtT+AtEjlvMI6RjxFVueFw1NZJmQ7ZvlAqif0QU7vYKtKRCt2aRZdgHEDT/OLM81YIU0YrCrUWAA77GeSnYs9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8987.eurprd04.prod.outlook.com (2603:10a6:20b:40a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 16:51:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 16:51:12 +0000
Date: Tue, 11 Aug 2026 11:51:00 -0500
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
Message-ID: <antS9HruNMrGbZIc@SMW015318>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
 <20260810190800.GA3046075@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810190800.GA3046075@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH0PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:510:f::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f1967b-bc36-457d-d4d1-08def7c8bff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jVclDC8Aj/SbEELiAZ55pm5bLefWah9Ypfh05TZFCeoqCQATxcfrCSIeOqCZnr+o6q44MY8DWHvVqIyWGldxcw5/6/oKfI1Jm3lOaFm6sGNjHIkm9kdBrj+m2E4FNrQrdG4DYQC6nAVUNJI1fzYm6NA2xejJVtoOUH1khzg2hUsbCj7bF5mbcxr6dSLsS+tfdXQ/MEhWgBa+Z6nsnoPvmYPXOWa56xoM7mSJqf7TRn3g0E9LRjXS2hr95eMsznbLt7RL+IE1hc0+Q1W4gwEw+G7w24Z7/cijy5KW2x5CfqQroQ3qX1YghCcpqpUAWhlU+DzpGCVubTOiqwy33Wvqe+JdgcFj3pFfs3timFchORU4RXKTW8q/a/QEDKpXGDKa7nbFYZjNuANoH31hngPpRkhM2+2tXDiXct7IDUCjtGKBpNRd3TJ1CsgWnAgtvl9Cq+mi3geD60skAkeuTQcifMVQDH2rpICaR7c9D41ECqUsj6/zd6sCCBcB9y8+9T8GGhsgu6FNTwaZVX/tSlQQl7mW5QuFNHCTn2GAiyMV/xyaAxp599RPm9rQ3YdxWjBeVQR5UCFQzawbrtPEzhS5t+E8S92saHoDF9m4iakLvU9MPIFzjdEtaU/9Afao1/kGT7NOsDvPIE2jAKepS9rquippen9fO+d+o1QMYnc5Fx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+BjP4qUMLba9XWg05uxv23jghXRSMgJPEPqyNoh8rUAbeHhCYdNdl3N9saTS?=
 =?us-ascii?Q?/AYepcLIIPqxvxcMPB+2cVPg/QgjJ0qz5+NiuTRjqU0TC84YQTB6trZKLfRO?=
 =?us-ascii?Q?UutV3IPVsmzde34qZ5HYb88NKxa+BRrxzvk4V1xpoG3YxLzRYa76BBcD/oMM?=
 =?us-ascii?Q?IOyZsDvsQVvozWiYRhklTiNQRz3V/kcw36T3fczQLr9o+w2hmo7Bwl9o6q22?=
 =?us-ascii?Q?Ns5mQSP5pmnBR1OCj+8ltwyWT++47IchpOuhbhYAbDcJTt3kXH9HAa01wgGN?=
 =?us-ascii?Q?sAmdWFAAWogELPdNTQGNoUZGMGtK9BOTEVnEOB5UQumfhDZ+l3JikHypoHdm?=
 =?us-ascii?Q?lbMybDwchIfK+7iv/98TJFbcVPL7wUyogRkjtNIEqJkt9O5mLpzBz29Vkk5U?=
 =?us-ascii?Q?QSCQalqhe9IKil9cOI02BDFXGHhi588wYIkEhXq95MxxYVTgO4y3kpMPrU4W?=
 =?us-ascii?Q?b7WNZ6QQhvS9hLZJUR2QFu9KShO1jiPG1Agj5GgxXr2ylVw5w1TEB8b7LZJ6?=
 =?us-ascii?Q?FUmZu0QrKax+F8DGM2pw4tyZQ/8pIwNdRuUpFC7DmuGCdDyRZrT9+art9TVx?=
 =?us-ascii?Q?Q0Oghj59Kra3HcYHdEMLNPcyilxiZ+EqvByreFmzIUyEZPzyhRgF1nbmGnX4?=
 =?us-ascii?Q?JEYNG1bUhWVSYSXHDk5bnyX0EII8vXm/LYUbJ0+Bq/Poh+v7+Q+QoCw2gbgV?=
 =?us-ascii?Q?boPwt3feMeebcK5QaZUsHy+ga41TqYoQg8bYWtUddPkgC6HUIA8i1rvQ6Lqu?=
 =?us-ascii?Q?wwMZMcwvlx/mtd4xy4nAUq6swEBOJJ75OOFOyi5dQI3dOJHozsFTNa2WsBJ6?=
 =?us-ascii?Q?PNpYLWcquNQQkHhFVNmLpmq2hUmTXfGr5vsH03xHkCDH3n0HpgA3KL5bYNjD?=
 =?us-ascii?Q?y6L2hCKaW4cAtIqtZEOUEnfIy/XkX15mRivHx8Oo9sP4PeMG0UFfYbEca3Kh?=
 =?us-ascii?Q?tZEXNTm4AUTwOQCqQiQPNgoDYAS9LQtPrmbSl+23iyw3nZNlShUbhXNXgi/u?=
 =?us-ascii?Q?R/Sq3NVIqf1aHKOYazo/QI4+kai/Xth+3sRsrp/EABbCSFS5vDx6tg+DLvHF?=
 =?us-ascii?Q?J/ztUapW21lTY7zdxU6DD5O2DV14GpfE+hrdlgL/EYOAOxkzzQdVcQn/Lps/?=
 =?us-ascii?Q?UA3d5JgtJhq07DG4PisiJt1Vi7QGF90q6U/6SrVmsx9DuV8l7sEVHdragAry?=
 =?us-ascii?Q?+MPwTB8gVFWQrs4JOoeyyP0nkhiEmxMlXxNCOvpq73A6aRE4kHTWGsZhicoF?=
 =?us-ascii?Q?8NWdcVXLoI/7+boj/ixAWDi/t7S+59e9ZAnYzs2TOWngPhZWXQd3ynXKEAVQ?=
 =?us-ascii?Q?q6o9BwdbYlSOAsDcCtAPZSHplVZZzM5q5LRpfjrAubTUPcDQadmFUomjKEMh?=
 =?us-ascii?Q?ueHSq6fCUbF0DRalyvhMBddQHEW+edOPsLVauBZYKlbVuXgJfGOslxx6nIwg?=
 =?us-ascii?Q?kXyPc5BRm6kDU5wS4PHA/gB8cERcWTuSFmOaVViLqKIEgs0oORyexvoqHKzT?=
 =?us-ascii?Q?nMJEu7R0TQIm4cMReOp0jquPnBgkR4l//xkc6rt60FuHr9eFOCH6w5335L3F?=
 =?us-ascii?Q?zbpnWW4moaJQLo4HiK9a0H3Jaov1O7pKbb/bp3RVjkJJi6glmiAd3gDO3jYI?=
 =?us-ascii?Q?A3kAyFDWmzW20L8XGEcruUXy8TIVBbNX+shpCqdP+3kJRt1wPIiYRj2T4rR6?=
 =?us-ascii?Q?V9dU58opQgJuJvnhZxRAAL0//hJfnylaAyYyHSvi5xRltFG5RmoIp2GgQmcK?=
 =?us-ascii?Q?9HIWiC+YxRWcVJjjueuJEeueDriLdj8ULvWu2u7tN5VssaWxtFCD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f1967b-bc36-457d-d4d1-08def7c8bff8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 16:51:12.2558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRuTAGnUmEzC6IGFUgNjco8rjrFdldSL28Fu9ZyNzoOQlF0MGC6aOYsDEO28rWhXb48eMvAhmB0G7smNyrpl0JofK1QYHgQYnJlxr3B6iMOLYM2TauQ3kKTHG+5KVBZY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8987

On Mon, Aug 10, 2026 at 10:08:00PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> > On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > > The clock-frequency for camera sensors has been deprecated in favour of
> > > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > > the device tree.
> >
> > Remove "clock-frequency" may break back compatiblity.
> >
> > A similar case
> > https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> >
> > Need provide judgement in commit message about impact of break ABI.
>
> What ABI breakage ? The latest kernel supports the updated bindings
> (merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
> clock-frequency property for camera sensors") in v6.18).

Dts now not only use by kenrel. such as uboot may use the same dts file.

uboot may still use "clock-frequency". but uboot unlikely use camera. for
this case, just need mention at commit message

"lock-frequency property for camera sensor have deprecated since
 ("dt-bindings: media: Deprecate  clock-frequency property for camera
 sensors") in v6.18, no known other user like (uboot) use it. So drop
it safely"

Frank

>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - Drop added blank line
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > index ca4cb986efbc..0cc05d084f9b 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > @@ -233,7 +233,9 @@ camera@3c {
> > >  		pinctrl-0 = <&pinctrl_ov5645>;
> > >  		reg = <0x3c>;
> > >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > -		clock-frequency = <24000000>;
> > > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > +		assigned-clock-rates = <24000000>;
> > > +
> > >  		vdddo-supply = <&reg_1p8v>;
> > >  		vdda-supply = <&reg_2p8v>;
> > >  		vddd-supply = <&reg_1p5v>;
>
> --
> Regards,
>
> Laurent Pinchart
