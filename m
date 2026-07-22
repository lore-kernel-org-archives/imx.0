Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5F360EF0
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731435; cv=fail; b=C0kk3sgz8NV7d+rlWYodDLS4Murefg7BgTOT08WeTTrMfePhIbMRgnj5rDy6GdlWFjaEA6zCUzUG3WyzuDZs97Mn46gYn/v6ZfZslBbAb/bTkpfHRM5XekoccroErRgq97G2nFDenBiqo8W1DIrg9F0D2DyvClGUnH1FmZUBZHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731435; c=relaxed/simple;
	bh=1RHKwATfJTgIp9DbVGMMNwBaO9vsTbUCOJUMvpLdm8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mob7hOm5X0KdPdt8Ot3RwYpOJnVkV3FQtVQS3uhwz7oj8uXGb31IESAjVui/yfXE99c6OLG5tdxKddoJan5dR7IZjPvk2Tm5C8XA2z+Sfo9Mv9N9akXs0/OGguV1hsLEp3TMtVkLi8hZMy4dnJoq8pV8XOoMb82UHf3Zma5omBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TQMI/VOy; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TQMI/VOy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPIMbvreAgCA7VWU3qUo7kcm7qsO9MMQqVtC1GAeWbjvb1OPXK4FEgZIUmePoN6LcNrKnsUyKrSJAlP0QzJdVayi8x51pF/O4UK1J4/hOYdK0DM8kFP8/VFhyvB00NRzyQWSbsL3xipYPmKWoujWmHlghI0KJqI6a5W1mXQgrttRiVs/RMuydd55UcbxnRwNRkViMM2CyB2kJBk/bZ2xJFktpVEZherIhS77zC4C33xKaX6VKJE46C0D9B9ZvzsxoLIGnixkD3nC+/JHA6Ywr8I0BcNTPzQQD+zEqHwZJ27iEdD0dbWpCkQnwIwXStM3NuOYGL7j98L+NvSu+e291A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeXTAzCL6ltVwsUCzIu4CtXql8QHfHU0lz8YU3u0JIY=;
 b=P3BbI1MTcE8Q6D+/UQ4/igVi/dclEFw/Qj3q1ZiTJR5oI25Lx/QevzkDOdZqWYnSirjPd78u9EdR+7oAC/1Dkuvq8rkL+ofNLxNrJMofAnoQ3YuBTSIvxS39EtGpMCV6uYkXt1Ncd1q+mbxhqMUdCB008ymP8KA8XyqgLfUw3T8S7U9b4dGjblOseeJgg1C+5UHQljB7jotdNtMZ9iHkhNkhvxKjfWEgI9nYO0gjh4rvxjdNXXywyRO01Guj9AWgtfsTZIbJDg8tUSls+VtyARSOLy1FZrHFTLkgr8jw0DHC9z9mR4zpQALvkNNmCdlD83B+y4BxmouvWNArhiueww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeXTAzCL6ltVwsUCzIu4CtXql8QHfHU0lz8YU3u0JIY=;
 b=TQMI/VOybldE5JA1rmHdnZ+eH+RjnsE0aUbH3sVBemMrcIO5zrunj3Pt+lCcQ9yxyUyMHj5xhAHJDSOrf/1sB3WhUaf+bVOwjA3p0Sx1E4gW3u22QQq1vYR0uvT6SS5JSlqXcM4mfHy6oBQiKqRcJ8yvBGCpCyd0o0wVoYd3CcmHj4YTo5Pd4iwOzslWDw4FKGGhwPGj3O4LPq6E/pKVm0eukQonNbqxY6fewXqu7iFOsD0mzWVoqQ4V2ugVvHOsE1if0J26wZO+Ythtj0oXR04xIZ5HFeI8qTd9WTaKDebaAkNPUMrFG1d+OIMzZatkGL5aQ2GNp/UUuCUJ9FF0Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:43:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:43:48 +0000
Date: Wed, 22 Jul 2026 09:43:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <amDXGRT80HfyJwCt@SMW015318>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722105914.GA72270@francesco-nb>
X-ClientProxiedBy: SA0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:130::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: 589424b8-b2fd-432c-4034-08dee7ffa3ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 fIlZqQLlUwmGDUKnRfTIy2CqpEQh5VvRerGC02TiEPnmv4FCWs0+y0eLe8qGPGry8CyTmqJhF0TD5iHf8clJR1GxvXKjkTT/DeJGhalZmFkAg8a2kxlKVg+OwrRXOjKcAUbbmSkWNkfx7SHO5kx3/NSvD9DQ3DAReI2773rQaxlwy1pXyv5AqGnBys8QLjviZJfXsj94s+407kkmflAhHCTgXK83pky+PTU2Wcy6zo3ajcHhiFYq44ta5iiUqyQRsMMQC1jK2I1jtR74kWmKuazO8IbXC20JDQ6tOfYugOVcLfRyE/PB323vvcpc0GuUggPouw+pHbLdgoJ1FGFyi7fXHGdOaWQVI7GjwpHhNA67gMOsazZxyUpV835Stn54WhIXT6bOKG38xGdEBvVlFE1ptP/g0YKAQSV+9+HddWm0fdMCMvMzIgijsNwL81iMkRw5rDspHnUyF+Z0Lmr/l0HltPgLHxPa9tTHHWFQTRMfIMNoMV+Xfc5Zx/GUP3MPHniO1JJ13fegZFo7RaI1pBnTUTzKS+p3yO30sT2wnfGSo2pR8kemB4eNvelRv5sWP/7CqU0seLpnoH9u6y37VzK854t+RMEvq5GovNw4k29e8BB1CNhUb+xTzSMPwrghlfjZlpeTLp9KQ9NzAfshrY5e4eaIDX7ta/Wla+aXBf8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?r49gXxndzeJl/+1p8v7ftVTUmMaUa+PxHoG6eGfeSpwFAWGcl+eyfRNUGKDc?=
 =?us-ascii?Q?v8Yc5k2/OkpTqypNcN0ZruRcyFB/UeYow9MLQUZDnfBljts889uCLJyO97yj?=
 =?us-ascii?Q?ulF/eQT3XUWuawCieW5aeJA45TK0kcTo2UYrbg82YrwWHoqXfUpxXuaRpUnV?=
 =?us-ascii?Q?fObvnd/cAhMXQ/qvFFYHA2hepmnEI3UZ8opEG0M6YzoruY0LhInfWD0r9k2c?=
 =?us-ascii?Q?FJVnjiywx83pg7D/BUR8ytaou76mRmm6XgioW13Gh7myROJutV7JCYlgCgF2?=
 =?us-ascii?Q?po9WyrQ67SHhz+l0rw9yj3FrHoW1kcINnlwGVJzkHjg7lKxxe7mBWUmwC9zH?=
 =?us-ascii?Q?WXGwd4C9xyDJQUTg/rHkPPcAv/LtMs8/dTPKQVY9f+IQ4R5R913K+fIos4dw?=
 =?us-ascii?Q?gEX1HknUUOS7A8sRJp57I0OMWeLCcTCb/xx7E5ZZwHN1kTsIaWf7ncP2MsHw?=
 =?us-ascii?Q?fufCN3St9UrQ5NCKQUu75guedKARFRsJ4phYc+3ZUt0/nay9YfwRSGFPSYLn?=
 =?us-ascii?Q?WNXkMSawTZ7dkzTZLxCJ2ELbe33kkwREUTqpmx62KuEX7ONsqCNFy5kqENCs?=
 =?us-ascii?Q?DIt1gllYhTC9a3wnRoZIes3tvAqebmsj24GmpKF0t/Ju44OWW5Y6TnZLbt8M?=
 =?us-ascii?Q?U5skE2G5qZ4U+7afm+rWk4t7NktbSFwCuwVgJuNK0ZxXFjMVuGFJckqG7Qhd?=
 =?us-ascii?Q?3qgn9rQOL80f6flugrq8lAmYWIM5Z9nyfdBKehJpxwB8t7tbwaxGBanxEUbc?=
 =?us-ascii?Q?gjNfL3cpYWcM06vx0MIoSEm1pHyFM3U7uKGjU/LlXk+E1qtmZBrTzoE1UB4s?=
 =?us-ascii?Q?wlX8/FT/1mJJuzD4qxgINXB6KBKEumM+8uwftuDPMlrk7a8AeORzaj7QnN4i?=
 =?us-ascii?Q?hgZ4ntUmjDQa0xyc5eye4cdYu4Z4hvW1vIwMDd95wCcreFiYPd1ZFT9YxP2e?=
 =?us-ascii?Q?NauvJ9+3lmMzWsrPiTVXdkatDdre9eZuIir25g9vOW6to2l2kreN7lD7zaWZ?=
 =?us-ascii?Q?w4tLapDKll9LMcfMvGbIHbYl5k/y9toIGG4a50J4wzHeYorWf/HCrXrWMpoZ?=
 =?us-ascii?Q?2tfj77DmAZw8Sl//ZaER91pMIGFd5Z5ASakrYe+6+dlPqyrIbbImViDQUFQ4?=
 =?us-ascii?Q?woaUGKAvtGs9V/jG2zmNBbWIzhoJiA/b0Z4phKFEYINOf28yzdWH1Xn2cnJ+?=
 =?us-ascii?Q?ZQDDThBNK0fI1yyxXcJ6YipmngJZoKJFMFP621rM6g8hGQuXQ8+fsXvt72Qw?=
 =?us-ascii?Q?yeqBVntTLH+AEgDvo9YLn5dfeYG7ITa7aPP92jS+mmIw5zjONA3aQjv5K43S?=
 =?us-ascii?Q?065vRqtMqpDsQAQkg38HlXCHoZRfqfywl6I4qVmYZmpcl9jFtBKF08ilwKSL?=
 =?us-ascii?Q?uKox20TkCdObUhAKQkgh/tVIs08BxETdFX3s/XI0FWGGihXp6lhbOas5zI24?=
 =?us-ascii?Q?feYdMcf43o3tVV1/vjxdt90g8soBMmWmJnYYkgtUJNiz+Lys1ZIquCHpAySG?=
 =?us-ascii?Q?/cSt6br1b+A9QC0zarziwqbrSMWFOwWsN9u6zIpokNSSaneYFXw0aO3MUwpU?=
 =?us-ascii?Q?DXEnOYFRcnaCRRwW8hDKNiQQw5ow12oS3pwZ3KyLxpD0LRGiqB+7LQ16wkWH?=
 =?us-ascii?Q?xoBNk49sc9zWbUDTZijoERohwmEc7SFwcy8tSJU+7JKd8ygzhjz8tFDgjlJp?=
 =?us-ascii?Q?80t2GYuVeNMM43ipIOMVSKFa3NQ9TpLq5qMVxdDTFmTH/b2wUnBR5K/rQXfU?=
 =?us-ascii?Q?sNw3jkS+HhTxBukye9wd2eAsXJIZgorfmSU6+vycCQ2ddIjko1eJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589424b8-b2fd-432c-4034-08dee7ffa3ab
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:43:48.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUAwnLwKlJZbHiBAGGvs4GelT4AfjmElpVQUVf70y90Rz3sLA7MKju8MoJLnorEfFsJ7hd4ZLZ55Zw4nxYLGhofntTR6lyERk+Yy56sKaDLijw+drB2ARsjB+wAg0DuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046

On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> Hello Kieran,
>
> On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > >
> > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > camera module.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > >  4 files changed, 119 insertions(+)
> ...
> > I think with the Toradex ecosystem there would be some value in
> > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > so that we can abstract the hardware which is being 'added'.
> >
> > I think it's important that we tackle the problem of combinatorial
> > explosions of overlays when we can add a component to multiple
> > platforms.
> >
> > For example, your OV5640 camera could be added to many different boards
> > - and each board could have many different cameras - in different ports.
> >
> > We should not be copy/pasting overlays for each combination, or we'll
> > have 'thousands' of identical overlays.
>
> I see your point, and I agree that it would be valuable to move this
> topic forward. I will raise it internally at Toradex and see how we can
> contribute.
>
> At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
>
>  | DT connectors have been discussed for the last 10 or so years and three
>  | is still no real progress.
>  |
>  | I would be happy to send a follow up patchset which would convert the
>  | DTOs to whatever connector implementation format lands in the future,
>  | but I am concerned that waiting for DT connectors will block this
>  | patchset from landing for a long time.
>

I do quick check for ov5640, we can use partial connectors, which already
in kernel tree.

use duplicate label like

in mainboard
csi_io_i2c: &i2c3 {
	...
}

csi_io_regualotor_3v3: ....


csi_io: connector_csi {
	compatible = "...";
	gpio-map = <0 0 &gpio1 3 3>;
	...
	irq-map =<0 &gpio1 4 1>;
	...
}

in 5640 overlay

&csi_io_i2c {
	camera@xx {

		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
	}
}

https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/

Only clock part have dependence. other parts. I am working mipi dsi for
display, almost work except panel show have some problem, which is not
related with connector.

Frank
>
> Francesco
>
