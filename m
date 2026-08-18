Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176B3D0C07
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079219; cv=fail; b=NHoieOo4L2y+w/E88v+oJ469gzy3h0JEmyikYn9/Q5YjohkTBHM/gw35rI4YRA4XQas3JzUex2AExppsi6JqqVRQAJ9YH9hCu9e9JsysEpKhqjemzXDBQCWDqmioQ6lLHL/BmxDH1uPlN61bZJTasrp+K3wDTlsj6tnbYQBBZ6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079219; c=relaxed/simple;
	bh=c7/5uRhDxdcKxRZG1EILVIRW6HjueFj9etVVY4GQgg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTdMxqbrXvJ52TEDhjLuHlCnyLyBwlcwqAp597Al5TJOoulYT3g0FGeVpUVED3sBxK6rvCyJmKpriGlpmMinnztxSj4qJHAJe5YIB+TtEnk8FCee6Z+RAmPuMF46jtCj8hFaBA7rFdKcCPm9B0Y7OL1GvHxMq2MfDQ5+IAt8o00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Un08dnko; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Un08dnko"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUj44oKudnD2m6x92s4p+X7VqiAK0FQiis3ldb5qaCBkJWROOAyeB+83gbjoRr9u8k0UwdgVsif0D6N7yaxQuIcqEpbw2SVrq5juB7B8qGKH5+c3gF0QW+rdvJez43kyXaibcQaOxFChu85IuvUWjuHlEVRSE7lBU33wAjoO1AagGgAMTA04KhYp81puznxKl4FntVDYtVx6YoqaWrriv8dM4bEnj3hbKRZc5+3T58nY1lfIQSMyAKYz1jE367wTmKifPvi07/coQGzNFs2/cbHK3uBNbmuTWfoh9V3pwon0nc4co/Nm6z+OkjbmmsbM03jO4RlnTQ6ssiXcWwb28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbpCD+8x48H2VPYX3f1hMuWD3/21KX7pgbQ6hcSoDmQ=;
 b=Ndxcx6GZON2cvqMpNRWDKILXvzM6GUWvUO+S5rPB7SmcUsXQoauaM/hb/zwvAyKuAsp0rjR2YFRq0p3e6CfRrV44nAhHMGpV0CL6CwCUOt2x6kJXavC9pMGhqtj74yBCzytYfjIZXeMZhutbQy+Hg83qoce8gecRE2L7X3MHriGxEzwV5sQ6PikkQBI74jo45imEcBtoub/5AU5XyU9Dc6X8QQKUqoco0Zocy9R9TsLhxH649gnRHzYknO4IXUNtPhc+k0Y+LOrQXF/V5xrrhNOCIotVNb51J4iaIuItVnWO5UTT83SFCYYUcyVLVbYi1q77CesJL2xk5tC5tK2JnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbpCD+8x48H2VPYX3f1hMuWD3/21KX7pgbQ6hcSoDmQ=;
 b=Un08dnkoJP2T1F0wbC2kniU/JArk/AZdX6Afrwo7lIb5jH4jM1Nx9us8chPaZ8/pIYbgpm8X2GODBUB31yNQJYmzzd6p8cL9kaqR0wNUz67Qi9ZM/p1BB+TxAJj3HTRPSPyod9QkSwHVLHUi2q+rvVJ8h9+hbuTWg1XLbIOam0NMsjyqAos/XfAs5I+dsDALU1tsBP3sCrgH5FmwJVDSiXoBuxknIWLkv2p0zTuRQxuelbyk+u4qGpmdSFJAR6d50YSx1UQoDQyHoW+Yuklc8gDJC976wnrZWIftBdJLVFOxsItFDnnLX1+Ohrpv/kNLuZ73uSnuTbLhnRczLc+Vfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 18:53:34 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 18:53:34 +0000
Date: Tue, 18 Aug 2026 13:53:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <aoSqJ7pHEgJ_RZmr@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
X-ClientProxiedBy: SN7PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:806:121::8) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e13db4-c10a-45cc-41e2-08defd5a014e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|11063799006|56012099006|4143699003|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lWQKVavsPZRhubC+NleYjiKgr6yOqgt2ALoMELyuVMfz96dEjnOhuVGGWqtUae0g1xNj6ORrm8t8jvQPEB20JAYlAlzFviM+/U5k3qI9/hJpkhdSDYckzEf68BEAafLEWwD+vCL8AgFJoeSLT1OryB1SNfF2Qh/f2fJP677kZogMYTx445X9I6avS06bC3mKt0BxzsoqnYuHz74jVAdUQHCclu6ftdPVYcOK3jPWobRal+Zlaux7DbA9rR/V2Gh5F3f/B0SrIMnP9YhxFKzwB9tPAMnl5aegnG3s/xH2VTOSl76qP2XxCOFwhFyUMojir7HDx6+Mp6TakuG5lhSzBZit2LPzl96cpCxqvx8o7pbm0geCu0U9h+pztKxlDtreR6r3Dgar8oJkYXH8e2eiQVJNiwf7wmPLRj4USL92d7mwvopLt1tmK5BQW9Y1b+2iyBzySBawBwXPmQZHg2424sEd+YZM+hujv+DRjLE1wEHSSZilURV0PWCtPOhTopmM5DArLYihaX6IMWnL6ZdT61OSZ7OWX87mF6MXzftKXsdMWLc7SB3mqlrOeTnlOsFTfUcBJzYNQiAFfNhFyozh+eFtbpVhXnADqjNotUwwrp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NHvju5Ro6hQ7/c1k5J35XWnfZaU3PgWKRZUkxi2wuPWXVAdXrss0c0xaq7jp?=
 =?us-ascii?Q?YTvhLSQCTLA5gg+Ei/f9SEmRqVncZrEs4Gy+W+wblqiIMBEWEi9lks2WqOec?=
 =?us-ascii?Q?leeWRGdrYqdtxNM87/mMr4cU1Ze6pwO06wnQ8DSU8uTdbObVrtFWOTBzNNMf?=
 =?us-ascii?Q?h1yAQC0Cryl3KpAKJf8bdb7AtuxaLJ9GNwNcTZTxaFj8sLe0K4txfwS8AWjM?=
 =?us-ascii?Q?mT6EH9RJ5GGQ3qiYc91OdPn8f2c+AAFkM/I96onRfUZZ6NJUPSBsmiuXJex/?=
 =?us-ascii?Q?DsbCl15Ao1TRdHNSvUiCiIRiRZabtQLO8VoHxM5KQIV+pbxTwjB9bekyYIXe?=
 =?us-ascii?Q?yysfpXt3x+XHE/3N7rcUBAoDP48yrbJCVZSLIyJeunx74G1FacyzN7FsbT5y?=
 =?us-ascii?Q?Wc2COyGJZ+1BGu0Xv6AgiRjvBE3bdiySewJDyX90dVIdl3QYzvTnx/bMY3xz?=
 =?us-ascii?Q?BPmjpXWJVYHqC+sws4wwV2hLPU8sOpYzqcguV5sZFzoftw7W/gjr8csdGb71?=
 =?us-ascii?Q?qcLft/RfMnQt7fytswwEAzAUXJGkry/h9ryff2hjl808wPJI8iRRz+bx2Jy1?=
 =?us-ascii?Q?LvB+X6MKav3y23sq4w69gwXOTy0MwM/8peyx3aCM2DB5AhUYOQ1Jw0xz3L6z?=
 =?us-ascii?Q?KTExGXJ7QSjirJepIEGgw3xoVeXzMc3OfwEnvnBYwJ20WHIqHxhq83FzWk3U?=
 =?us-ascii?Q?LrrImx+7e8HRTR6CNnlkCYwrQOK/YhmFok9guoUitpl11AbbaCYbCrgcNVaB?=
 =?us-ascii?Q?EkQ7fUYj3G1Y+pzuOpoWVKDygTZF32R7lrKGnN3RaOzqQINQ3g31ft7Dvzzj?=
 =?us-ascii?Q?fHpMIr0v0mq4s3B0b7trwQg4s+NnX5ZE4XktTBtjbnsZ4oZJXIYP3tWwYegT?=
 =?us-ascii?Q?EEV1jb1Cv91v8gnDIKndvB1RomreeUiHdZKtInLK9ibDAfxe+ylkH2G4iQ7v?=
 =?us-ascii?Q?eMLma2h8D839UtUhliy9LIS/ZCLb8JNufqxdjQgjVVZdhcRjDe1p9XCzpq/L?=
 =?us-ascii?Q?CNOfS+RmCK5t7XD4E2ZUweYF6OUzjmyyteXfZSd2bKi51uTPNOf1O4EqmDm4?=
 =?us-ascii?Q?Q3npfa7KoNNBSr330ZTZ0JkkokiygKoi8EeMJcpVlV7ipQ0SfuEDPG9B5rvu?=
 =?us-ascii?Q?k18iO1dROlOR/X0WajdA93Tdf1K3j+PblAp+JRczkJGAUyZjMHpl9Lzv73s2?=
 =?us-ascii?Q?PN0IBiyYmlKI6uBVUQyb6YjRYTPg4a2KNbXhXDZbhSM5GCkuYSz1jXaQJ9cI?=
 =?us-ascii?Q?tb9KOUyHdw1YGnKi8cPUbfvJPplQJkwmhwXOIR0YscOOyMQ3gbb4NWpardET?=
 =?us-ascii?Q?rqvlRwbH2O+3zuqLro592GXnQUumRZY3J5eNBeFefIHiz511JdSolsmn0s57?=
 =?us-ascii?Q?XyDBUhHijc7MKMf/PrxkzZwuhd23YJ0MM4GmHPQ0dPauWDUGqpjXlCG9yrbr?=
 =?us-ascii?Q?suGiyQU4et1JloP2GKs8Ylg8F0B2ecSoW3RbJAedeCkfH7Hh5dmn1L9SvlN1?=
 =?us-ascii?Q?EMrRFh1CA+RNXdLBpe3CY4TlXNIiyGoku7DrnAoojVjfyDuo2RVKeSU4vKU8?=
 =?us-ascii?Q?xeQGvwnZHVC1h5f+EGA2CG3oqWC318Cu1yen6kkuZs8KeOuVNJAcR9NAIrus?=
 =?us-ascii?Q?6pEHz6tXtfUQVo3XOeeUTCB8+w7Dn1FA7RouP6JX30Z0USmXcP46add7Yi6f?=
 =?us-ascii?Q?PG4j1b0bk1saiEDpwlIWTkrGY1x/0OB2tF7ByJMeoXwiXlf2CFxjQe/42u87?=
 =?us-ascii?Q?xbwF+m03cEzy06pyGhhurEKrQv035DiVM9EZywAbaSl/ou0dnxPx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e13db4-c10a-45cc-41e2-08defd5a014e
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:53:34.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpVCyP3B1eVswe8OXYcxV52uJ1RyFNlbJnkCGqKlf9VMd+sReqexyjUmwYcRBcsHj8Hcl/2DEfa9Qx3ADVRvdCkpwmmDD8BaxBRlzM2xhRJcrx2dbYZ9N72VEckKiW3G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256

On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > >
> > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > ---
> > > >
> > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > >
> > > > why not share one dtso?
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > There are two main differences:
> > >
> > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > in the one without the mezzanine.
> > >
> > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > mezzanine board.
> >
> >
> > And there are for imx8mm
> > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> >
> > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> >
> > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > work on optimization solution.
> >
> > If use nexus connectors, we can share one dtso now if there are not
> > clock settings.
>
> Hi Frank,
>
> I tried implementing the nexus connectors in imx8mp-verdin-wifi-dev.dts, and
> modify the Mezzanine overlay for the LVDS V2 display to do an initial test
> (diff with the changes at the end of the email). They worked partially, but it
> introduced an issue where the drivers come up much later.

Thank you for working on this.

> Before, the drivers
> relevant for the display (in this case, LCDIF and the touch controller
> specifically) came up at around ~8s. After introducing the nexus connector they
> come up at around ~20s, after the board has already booted (complete logs at
> https://paste.debian.net/hidden/81acfa7d):
>
>     [   21.008400] input: ILI210x Touchscreen as /devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-0041/input/input3
>     [   21.014785] [drm] Initialized imx-lcdif 1.0.0 for 32e90000.display-controller on minor 2
>     [   21.029634] Console: switching to colour frame buffer device 160x50
>     [   21.029823] imx-lcdif 32e90000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device
>     [   21.031376] imx8m-blk-ctrl 32ec0000.blk-ctrl: sync_state() pending due to 32e30000.dwe
>
> Was this behavior observed before? It may have not been noticed, since the
> drivers do come up at some point, and it may not be an issue for other
> interfaces, or they may actually come up earlier in other cases. In our case
> this is important though, since visual feedback from the display is expected
> early.

Understand, we have not notified this problem before.

>
> It seems that the drivers are being deferred at boot start by the
> device_links_check_suppliers() function. It runs through the drivers before
> they're initialized and defers them if their suppliers are not available. The
> GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> (through the of_parse_phandle_with_args_map() function), but from what I see,
> device_links_check_suppliers() has no such mechanism. It follows the phandle to
> the nexus connector node only, and since there's no compatible driver for it,
> the function defers the consumer drivers used in the overlay.
>
> I think this is what is happening mainly because setting the
> fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> flag) solved the issue, though I could be misunderstanding something.
>
> 	int device_links_check_suppliers(struct device *dev)
> 	{
> 		...
> 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> 			...
>
> 			if (link->status != DL_STATE_AVAILABLE &&
> 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
>
> 				...
> 				device_links_missing_supplier(dev);
> 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> 						    "supplier %s not ready\n", dev_name(link->supplier));
> 				break;
> 			}
> 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> 		}
> 		...
> 	}
>
> Has this behavior been observed before? Do you know of any work being done that
> addresses this?

Does a dummy container driver (for debug) to proof your analyer?  Let
me to find time to debug it.

Frank

>
> See below the changes that I made for this test, relative to my last patch
> (only a draft):
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
> index b78322907192..4aa1c407af3f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
> @@ -21,9 +21,19 @@
>  #include "imx8mp-pinfunc.h"
>
>  &{/} {
> +	backlight_lvds: backlight-lvds {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 45 63 88 119 158 203 255>;
> +		default-brightness-level = <4>;
> +		/* Verdin GPIO 4 (SODIMM 212) */
> +		enable-gpios = <&lvds_native_connector 1 GPIO_ACTIVE_HIGH>;
> +		/* Verdin PWM_2 (SODIMM 16) */
> +		pwms = <&lvds_native_connector 0 6666667 0>;
> +	};
> +
>  	panel-lvds-native {
>  		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> -		backlight = <&backlight_mezzanine>;
> +		backlight = <&backlight_lvds>;
>  		data-mapping = "vesa-24";
>  		power-supply = <&reg_3p3v>;
>  		height-mm = <136>;
> @@ -53,13 +63,6 @@ panel_lvds_native_in: endpoint {
>  	};
>  };
>
> -&backlight_mezzanine {
> -	/* Verdin PWM_2 (SODIMM 16) */
> -	pwms = <&pwm2 0 6666667 0>;
> -
> -	status = "okay";
> -};
> -
>  /* Verdin I2C_2_DSI */
>  &i2c2 {
>  	#address-cells = <1>;
> @@ -69,10 +72,10 @@ touchscreen@41 {
>  		compatible = "ilitek,ili251x";
>  		reg = <0x41>;
>  		/* Verdin GPIO_3 (SODIMM 210) */
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&lvds_native_connector>;
> +		interrupts = <1>;
>  		/* Verdin GPIO_2 (SODIMM 208) */
> -		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&lvds_native_connector 0 GPIO_ACTIVE_LOW>;
>  	};
>  };
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> index 72a4f846d694..1103da3d34ba 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> @@ -4,6 +4,28 @@
>   */
>
>  / {
> +	lvds_native_connector: lvds-mezzanine-connector {
> +		// NOTE: Placeholder name, no binding for this yet
> +		compatible = "tdx,verdin-lvds-connector";
> +
> +		#gpio-cells = <2>;
> +		gpio-map = <0 0 &gpio1 1 0>, /* Touchscreen reset GPIO */
> +			   <1 0 &gpio1 6 0>; /* Backlight Enable GPIO */
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +
> +		#pwm-cells = <3>;
> +		pwm-map = <0 0 0 &pwm2 0 0 0>; /* Backlight PWM */
> +		pwm-map-mask = <0x0 0x0 0x0>;
> +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> +
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-map = <0 &gpio1 5 IRQ_TYPE_EDGE_FALLING>, /* Touchscreen interrupt */
> +				<1 &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-map-mask = <0xffffffff>;
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X37";
>
> Leonardo
