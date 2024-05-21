Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EED5674A
	for <imx@lists.linux.dev>; Tue, 21 May 2024 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716289057; cv=fail; b=civNDWdfGFsn44E9ZhGYTsuCJcC2aiCnlQBAbeDfMrSouvIrrl4yajWAELrcrwRc/UaPppVoyIsYcMYaCs9T4yAM5PUe+IFDGEup7ZFOm1ky/jnl9izEUPgoFwYeiNIv3A1+gZ52Yg27zVnvu2AD34DVsSm0Qf1X/rSyRWmQb6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716289057; c=relaxed/simple;
	bh=WEb+EgtmNprX4sn1rIXDBd0f2NIDvoJ0yXDNDV7Npkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lYSRR+gUVFop5tGLXf34SEeJLJjcnJmxpWk29fXAlxou893X55OB+Q/3hiS9AP5YLStEhQFL0frHhaYAhBSqxe9lewdy5Et5uRzulrIE2TNzgiFKEDuCqlccIupaVvqyNzrXaY1zym8n5W5Bh2wYpbdwUUmyzya3o7By/HGlGkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=LavQEP9O; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LavQEP9O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgOKTLZOrRhNntvjxptKoGf+26Ns2UPOTfO7dGXNp6nKYILKUm/lzQjFBvKDn1tJlTjQPO9gVwwypfzh6cK8EgXaDNpronGttuGplgtDR3rXsXQQr2rpQkUA4KahtuBSd2TsdcbidBuOoRKBxA7KrFiLv53neWR0d6z4N0PV8eZ4wdMDdSD/F+Jb8kY/8YEgKWTpD3EJEZ22kHFzcTVuAWsZIdDL40Ef2qTlt2FpyPO2dz4Yl73oy9p9NK10UVhhEi47I0rX9x+eTT2TfvQ5h2SUiY9me9p2YedJ8YbIPIwVXXwhV37wxKgiyzHEpkil8AO3fn0XwNU/wIAc0WxxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrJdOzc3r2i2kf/hpKgmVMvLuEhrv6Tg9rUi8WXTm4E=;
 b=jc2n58MIQEuVYlJEwtpdextup+WQStZ8uUt3GhV8rW2f9oPgu/AcYLlWOnh+Oee2Rn9ttBNRhBAfwtk2yqQBzJ5mvIKuDVA01G5G35vJBJmkU7acPua73cw+D77CsCvctq3WpQ3lmXzR2YG6rOtvtWV61XbTqPobPY9F9PuQL9qBvi5v7tyVvR3ISZ0shB64nDVDCy/U99STtMGyZQ8nzJrvnLd/vGUK0KrYCqqltJr4l/LY0RlYeIksHPurEFr6zVVrNQRlN52sY1Awj4ynZhm4XmN644rSVaAL4Hd7dAq9PdO2UYQNcHBz4Aq9tp3SAq1I0guINz/NEQ+sVF5gUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrJdOzc3r2i2kf/hpKgmVMvLuEhrv6Tg9rUi8WXTm4E=;
 b=LavQEP9Ohyc2HA4WtDjFN03OpCW0rTdi6dOVOK2DZ39xriz8PtA/JmpL17rByanAF/ghpkfne+bYQeUTWq2no2RNrss5h2eK+Y5nem4L/izUz76IFkq7cu6UBEHij3bplwW1PatSe3B3ZE5UBK3+DF5MjGRfbi+V0skI7KUE3eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 10:57:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::8d2f:ac7e:966a:2f5f]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::8d2f:ac7e:966a:2f5f%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:57:32 +0000
Date: Tue, 21 May 2024 18:56:05 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when
 remove module snd-usb-audio
Message-ID: <20240521105605.xcnji3d2wcihekhb@hippo>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
 <87bk503hfo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk503hfo.wl-tiwai@suse.de>
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 81128b86-6e9c-4410-eb5f-08dc7984d099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?epdniSqu18lUx9yeH1GaXO5WLc5YCmVs2nXRtVeL4YTPH+VoUE49F2KiyIMV?=
 =?us-ascii?Q?7qe+XVPpEl3rmT5du5DCsNG5ZACQA7knotuV7ogXSFwOaFSXhAAqChqj5Hrj?=
 =?us-ascii?Q?liZLBf9K16HoGw0VkeWp1L6jpyD36bnJWobFwhvhZ3xp+6FffOPm4/Me/qGN?=
 =?us-ascii?Q?YU2Ymu7exERH8Tj/PcWSM0zl2xY15b/W7roghI/ekeIJ4GB3pnc6OVpGzfnf?=
 =?us-ascii?Q?zjKXMQE/6LFx08FXNH5Elofpw7NVPj8NTzTvMGLAdCxxWwx2pVunGSaGnuG/?=
 =?us-ascii?Q?Al4HRFzSyNow47gS5FTAQlBpczLc6Q/hoKbT5Ib99o6p1HMamoWyrrUwWbXO?=
 =?us-ascii?Q?K7LbYORlB/Il8IGwtCpOhFcUrt0colRqc2M7/2hTY6uF2c7IvSuvYOdUP5t4?=
 =?us-ascii?Q?OrisViMRtnMHL2JZ6QgF9bO3MCLy7lVGpgldKQIl9YqWDIkTwN5X0AZvpgJD?=
 =?us-ascii?Q?z7fnyYZtbmUpgYUcsr34WlVONlibbgSD6PvHFhGa1BwupFYA5UJQtr7a2n9B?=
 =?us-ascii?Q?/Gwxsygeb6TvW+V50O0pIG+DimMvDRbkQDIkuuP5sVeNHU0xBFgqhhbeuVr+?=
 =?us-ascii?Q?GEBsEy/5EtnZ+NWGiqSdzW3drtMNz3BZsuXbFd9suBugcek4PXj0Vv1/0PAS?=
 =?us-ascii?Q?vK/WdYIesqmE4lAqPh2Y5hGZ2r3GUV40JUzuorXonYkjG9ceRALAymmRouXO?=
 =?us-ascii?Q?hBytmSFRmqLMivP0UksYPMVVCcEcoO6h8gr4qYd2WaZO89i6MuQ9MMMRT7YO?=
 =?us-ascii?Q?yQfUjY0ytKjeD7t/4jaaX/3IDZBmnJjpcP8dDeP1JRl+NxaoPB5XddtDyWdE?=
 =?us-ascii?Q?GBvALeXZRYEplQhgEt8nsFBgSoLVcuMHBuKOpyGQs4f/F1w6dO+xbhHtD2ke?=
 =?us-ascii?Q?KEksyMVbLO/qX+pThRGMZN2mAQLDD2tAadt8gSX2+7r2dke8BLc4YdGSlIs4?=
 =?us-ascii?Q?MbYQndLPewZC1oprmy1Q3FYPSoknuMBcfaoJNvd+icYdjBrUlPCVlbwo7HCQ?=
 =?us-ascii?Q?u3Z1EzWd7BIzeO6uFO3fJ7UBd6T7sYyNwM+YAGOolfuG+RzgfxSTtMEwa0P4?=
 =?us-ascii?Q?DeidRHEXL+w4x0tVJrjl5OMyCXdl/Bc7nKPk8+gK2hs9DG83Mt7nUMtPWll0?=
 =?us-ascii?Q?5d7B71lbQgOGj3liQCQ6B/mcljZRyq+5lCr9O4CuQUX4ULj4ISXgSAtYf0p6?=
 =?us-ascii?Q?yYzDIc+uNced0qQNVgg8F2EDLY7B4C5NPzQSQaZrdDw8/ExdnZ12zSJrDyDY?=
 =?us-ascii?Q?ltxX4abVM6/cHgZ6uAXCpcSWn7FqJ7Is9Mdzqc+2w/IHnKky6WMGvREMUSEs?=
 =?us-ascii?Q?xnX68nrgWdgixDSP8GcxjSoGAksYPXZqxBQ34MWSb6R17Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p06k4wA3jn9GkwGg7+k9oHIpMJN2FCLA7KVzf5nh5r6yX55HfNr1R9XE2vrq?=
 =?us-ascii?Q?3UyPjvvo5G2Q151mFDPn6LOY6WOBq4mcaN1e4w4TDfEOToujxAepwH4/0Ge8?=
 =?us-ascii?Q?v6fNwiXKixpe9usKmBXY2AtEIuh9Gp0fNP1KIyN/1eelk996eC2VbOcCLCj7?=
 =?us-ascii?Q?EffjGULyh2xv/vZBxjzTjNYCCXNC//ek7jTHQQMU2Sl0s+bw+oP/02Egi/mZ?=
 =?us-ascii?Q?yJnRD1/ti8S4cjiL2kDHU4281yZbDP2MQ+EUvVkwG0djZLe1sSIDFlWVluOf?=
 =?us-ascii?Q?Y25T9RKtFy8q9M6Rj4B6SEeQ91PKve0NoEJwKjzuKL8Jy9fwi8gNKApsAfg5?=
 =?us-ascii?Q?HB5m1XqAM11zakGWLFW+xJ0T2m53RzEBJ7YThCeTzzB+/8Xr6c+F8FCjkeys?=
 =?us-ascii?Q?tgj6XctFovSn7qqoSDuqWWb5WZG2DDiYqYzerX0EBt19eM+Ne0f+l07dazsE?=
 =?us-ascii?Q?UtzGL65z3bpdSm3LZbCa4GtbtTEtUZEtDg5L4Z4gIT1q+E0N9/taaiglezul?=
 =?us-ascii?Q?WNCRAfEbEylO5SAdsLYKui+oy2/vT/OabRGFaTES3abdpo7rxE0XWXqa4Fye?=
 =?us-ascii?Q?0AzWqWLwI9cjq1WIN/i2maDALPP5sCDsTtY74tmb+bCFl6rKkagQYCtji2q9?=
 =?us-ascii?Q?htz+TQaEvpdbKx2BGEEmvhomYIN3k5t6Fn0+6qvFxZHsFQezVIsj5C586A1w?=
 =?us-ascii?Q?1De2lLa6yYex9EG4nNpngHRlxqrfST09U5fk+JhJ7qza/jjp7TdJ/5kUybDX?=
 =?us-ascii?Q?HkQXHmdHgrpaEBVKswjpl3sW2Dc2ozxidZI7MEBwVrS5wKB8ayR4aSLm6XdL?=
 =?us-ascii?Q?vXZP3EUjfrYksI7z2/2R9S1AHte/MPywkRuoogLbe2saze5OEnQeewS6svAL?=
 =?us-ascii?Q?DR49ayAg8v209GMAEPe7K5xQUnGgFqlfHgoe7h2gcYwlWkoP4hthI+aahMEo?=
 =?us-ascii?Q?iSVu4qzkeLe79ih5t4iTaDtvVP2K0EG7PUpuR+zj81gtHWhhwrVOtE+jUagN?=
 =?us-ascii?Q?NND+Vf+7V3ioGSWH3vQ1+SiElymp22cTCjvsZvYD0TCNmovMmxDmMq2unffM?=
 =?us-ascii?Q?bOkwqck6zl3D1o+XU7xsdP55kenJa92BST7aLN/Hxx9pDtIioDg6c2qgi7hg?=
 =?us-ascii?Q?tsfMhhU7Ii2d2Z6A/Idqeu1oqIeDMLjXVCbpg1sjKK+yXvbsvIMnHOP08XNX?=
 =?us-ascii?Q?q6gbbjxGCOGK4NsCYdj6Uy816e9Pvjpnrp07QH6epQiPzM8n2DQ7MLDj/CwP?=
 =?us-ascii?Q?bil/gZfIVZblHOkFxkMbeo3KPAtCGcJ70iNhLcX9nIafI+1T7IKqtttlYZlQ?=
 =?us-ascii?Q?cxcaasueo7YCFuctKRbNS3SED/0mUHFlVg84r7Ej+OjlK8jBbv2KrYQbQAf9?=
 =?us-ascii?Q?PSa+9GnEnfLSrJM7rKzf/ddpdWzsiL2GU7Mao6BhWap/gMuXkbhyKmjHiN6x?=
 =?us-ascii?Q?l/2kb+Z606SEXkmteF9qZ/FUa8E0IJboJET6/ZGcv3Kdwfi9VD738Z1WhDq4?=
 =?us-ascii?Q?agcgvXMYmw4ORWMtfIvPr4+dzo40YMH4Xn0Hym+qaohWVAK9zGzlk2CETFIe?=
 =?us-ascii?Q?1/vrpKft0aoy2vigdv+uBWCX2JeBA6uPxOPE2UpK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81128b86-6e9c-4410-eb5f-08dc7984d099
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:57:32.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYSnDJUN+aqIstSHopkWFdw4vcys8nArBpJFO85K3NQzcwXZNjNCveXG2XFLdkVqX2UaSq6jS9aSRyWIzJmYOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178

On Mon, May 20, 2024 at 12:29:15PM +0200, Takashi Iwai wrote:
> On Mon, 20 May 2024 19:03:49 +0200,
> Xu Yang wrote:
> > 
> > When remove module snd-usb-audio, snd_card_free_when_closed() will not
> > release the card resource if the card_dev refcount > 0 and

[...]

> > Then, even the userspace trying to cleanup the resources, kernel will not
> > touch the released code memory.
> 
> Hm, it's an interesting report.  Could you verify whether it's really
> hitting a module unload race?  The module refcount should have been
> non-zero when the device is still in use, and it should have prevented
> the module unloading.

Yes, the race does exist. I enable trace and got below output:
It seems that snd_usb_audio module refcnt is 0 after insmod completed. So
it can continue to be removed even it's still in use.

# echo 1 > /sys/kernel/tracing/events/module/enable
# cat /sys/kernel/tracing/trace_pipe &
[1] 522
# insmod snd-hwdep.ko
           <...>-527     [000] .....    42.147850: module_load: snd_hwdep
          insmod-527     [000] .....    42.148106: module_put: snd_hwdep call_site=do_init_module refcnt=1
# insmod snd-usbmidi-lib.ko
           <...>-529     [000] .....    46.723871: module_load: snd_usbmidi_lib
          insmod-529     [000] .....    46.724105: module_put: snd_usbmidi_lib call_site=do_init_module refcnt=1
# insmod snd-usb-audio.ko; sleep 2; rmmod snd-usb-audio.ko
           <...>-531     [000] .....    59.720852: module_get: snd_usbmidi_lib call_site=resolve_symbol refcnt=2
           <...>-531     [000] .....    59.720922: module_get: snd_hwdep call_site=resolve_symbol refcnt=2
           <...>-531     [000] .....    59.722334: module_load: snd_usb_audio
          insmod-531     [000] .....    59.893096: module_put: snd_usb_audio call_site=do_init_module refcnt=1
           rmmod-541     [000] .....    61.911391: module_free: snd_usb_audio
           rmmod-541     [000] .....    61.912291: module_put: snd_hwdep call_site=module_unload_free refcnt=1
           rmmod-541     [000] .....    61.912315: module_put: snd_usbmidi_lib call_site=module_unload_free refcnt=1

[   61.927058] Internal error: Oops: 0000000086000007 [#1] PREEMPT SMP
[   61.933320] Modules linked in: snd_usbmidi_lib snd_hwdep [last unloaded: snd_usb_audio]
[   61.941320] CPU: 1 PID: 476 Comm: wireplumber Not tainted 6.6.23-06215-gc5317d88b3ec #719
[   61.949480] Hardware name: NXP i.MX93 11X11 EVK board (DT)
[   61.954950] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   61.961900] pc : 0xffff80007a85fb88
[   61.965384] lr : snd_pcm_dev_free+0x28/0x5c
[   61.969567] sp : ffff800083f9bbf0
[   61.972869] x29: ffff800083f9bbf0 x28: ffff00000a0b8000 x27: 0000000000000000
[   61.979993] x26: dead000000000122 x25: dead000000000100 x24: ffff00000a2dea70
[   61.987117] x23: ffff800082819ce8 x22: 0000000000000000 x21: ffff00000a2de800
[   61.994241] x20: ffff00000a2de9a0 x19: ffff00000751ba00 x18: 0000000000000000
[   62.001368] x17: 0000000000000000 x16: 0000000000000000 x15: 0111289e3bb3ce7e
[   62.008489] x14: 000044678c0b24b6 x13: 00000000000000ab x12: ffff000007b23200
[   62.015613] x11: 0000000000000000 x10: 0000000000000a70 x9 : ffff800083f9b9e0
[   62.022737] x8 : ffff800083f9bba0 x7 : 0000000000000000 x6 : ffff00000a2ded98
[   62.029861] x5 : ffff8000811bedc4 x4 : dead000000000122 x3 : ffff00000b52dc80
[   62.036985] x2 : ffff000007f36240 x1 : ffff80007a85fb88 x0 : ffff00000751ba00
[   62.044112] Call trace:
[   62.046548]  0xffff80007a85fb88
[   62.049683]  __snd_device_free+0x50/0xd0
[   62.053602]  snd_device_free_all+0x4c/0x9c
[   62.057690]  release_card_device+0x24/0x90
[   62.061772]  device_release+0x34/0x90
[   62.065432]  kobject_put+0xa4/0x120
[   62.068913]  put_device+0x14/0x24
[   62.072224]  snd_card_file_remove+0xe4/0x178
[   62.076479]  snd_ctl_release+0xfc/0x114
[   62.080313]  snd_disconnect_release+0xcc/0x114
[   62.084747]  __fput+0xb4/0x274
[   62.087798]  __fput_sync+0x50/0x5c
[   62.091195]  __arm64_sys_close+0x38/0x7c
[   62.095113]  invoke_syscall+0x48/0x110
[   62.098857]  el0_svc_common.constprop.0+0xc0/0xe0
[   62.103554]  do_el0_svc+0x1c/0x28
[   62.106865]  el0_svc+0x40/0xe4
[   62.109918]  el0t_64_sync_handler+0x120/0x12c
[   62.114266]  el0t_64_sync+0x190/0x194
[   62.117933] Code: ???????? ???????? ???????? ???????? (????????)
[   62.124011] ---[ end trace 0000000000000000 ]---

Then I take some time to check why snd_usb_audio module refcnt is 0
even though the card_dev is in use. Finally I got below finding:

I build kernel and module with below configuration:

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m

Then GCC will add -DMODULE when build snd-usb-audio as module, but will
not add -DMODULE when build sound/core/*.c.

When insmod snd-usb-audio.ko, it will create a snd card device and call:

snd_card_init()  // sound/core/init.c

  #ifdef MODULE
    WARN_ON(!module);
    card->module = module;
  #endif

However, MODULE is not defined for sound/core/init.c, then card->module
will keep NULL pointer. With this results, snd-usb-audio module refcnt
will not be a non-zero value.

> 
> Practically seen, replacing snd_card_free_when_closed() with
> snd_card_free() shouldn't be a big problem, and it'll work in most
> cases.  But there are always some corner cases that might lead to
> unexpected behavior.  So, let's try to analyze more exactly what's
> happening there at first.

With above finding, we needn't to replace snd_card_free_when_closed()
with snd_card_free(). We need to find a way to correctly handle module
refcnt since this should be a normal usecase.

Thanks,
Xu Yang

> 
> 
> thanks,
> 
> Takashi
> 
