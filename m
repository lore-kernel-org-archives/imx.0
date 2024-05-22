Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C05B1E8
	for <imx@lists.linux.dev>; Wed, 22 May 2024 03:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716348959; cv=fail; b=O0+EMaKVxw12pekGsOJqQ3Gpy3nQDXb5sVcYflgDHwzSFWV4ic2HR30rmr71uqEwoyto9eI1FQxkaVECOokkhGEUwzbsWVYBClqzzdPEa2Z0lWxOuc6osdQq/35GPNwX9xIvNNkUipK48j9tchdGKlqWXIEU+JHFdlLREChOsHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716348959; c=relaxed/simple;
	bh=MAVxnWa8t7n60Vaf4epvz1SsQ9pw/bBXGbtzTjK7JGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=psxnmlbxkVwE1pxcOrZBXgBgwgHSUvMhCmNWa7BdnUAfop5OuTQSkdx6EY2201+KiTsjnqVKpLJekgioDI7KcykwX3p3T4M34HRubaWsx9w+CshEroTR7kKo4pCk/Rc5O7uvXOIVQ8lDCLcnLS9gFBpwrQ+0hs9+IW8KoSRX9Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=NpC1L3qu; arc=fail smtp.client-ip=40.107.20.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="NpC1L3qu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpUobLrUHur/fX7fY3PNx2PcVv/wvCj9QQV4hzMRRTmXFjGXQml/YdMnrmHSU2LA+sUFwKmWTI/8W/PZZKD9TcG57ZxU9WpYQif1DpeVM9Kh2efKcdbDOb28BpiOzdW3QYQPlgcuk3IFMY7VdJzlftfe4VVWbtbmi565Lc5DKm/DiAfTyIpFYAG+p2cZGMpm1x+ZjCrU45b/9BMUbKA7jgG5enmx4Zr1E5/WAX7BCfYWl1qvMqluyguKKlfoqBAUIJrakNieP2Oc19H0OYTaEKtKi02NPaf2TgefYrQWn66FJutSJfmqIPDkeG8Wf0H6vWEtN1GuwRXdXVZZB3rVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcilQmpwvcBk2x/T9Dt2w/zuWy5Dc97CwRyo7blfT0U=;
 b=gbCeQv//i5l1+ObZl2NxDpCwzlTfgX7DuqNutJ5rVoIc847/8AI/exjRwzehv/sh7yvrTxMW++4ixUEigzQAYrH85ZXdwL78TTps9IlV3py++/+MxxZiWW0lzor4LaQ1CjGLPCYr/XIJhQyK9yOMenY08xkPL4WtRPrzE0hHtunU9gu+10iazvWBCVRzAXJLpg2i81UA31rmPobtQ60oHpNuQIRCaYuSE485808lvOR5RcwF8dXeZ/Umyx7WeD3puW8LJ8COCGwT/NY+lzxUGYzurdVzoVANFQYNIWPk6MBuepqYDq1r/wpM9pcmkzbwvgsJOsOA0lg0MxBPC9MaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcilQmpwvcBk2x/T9Dt2w/zuWy5Dc97CwRyo7blfT0U=;
 b=NpC1L3quDM9QsSHwAehogZCH/raYyUOXAzwTmTtQX0Mcj65P83jm9iufricnBUWDqydkCbXoICjnyvwSlRZhgjJWN73uh5eGIXpNOsxCOHhFkeJ17vDbrM29Kc2iuHOgLajEiR4f4x6orH/RP3utyam3h90Zr9QiHr+lzbdhkcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB7569.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 03:35:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 03:35:53 +0000
Date: Wed, 22 May 2024 11:34:25 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when
 remove module snd-usb-audioy
Message-ID: <20240522033425.yztpigsv3uhdl5zv@hippo>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
 <87bk503hfo.wl-tiwai@suse.de>
 <20240521105605.xcnji3d2wcihekhb@hippo>
 <87le431ju2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le431ju2.wl-tiwai@suse.de>
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 84784640-cc6e-4ae6-c512-08dc7a1048a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|52116005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Aw/E4WLqbQm0FXAgCH987+NXzKQCdz9/UJtCvKRKS0F0jP1K50AQzo/LSorw?=
 =?us-ascii?Q?d8MYqgEYcH4Pj3ssIOfZ/lfPQ2mhYnx3WsQ5YcC+4q+q3qTTWL1jj1yJ53OU?=
 =?us-ascii?Q?ppVNFcd3esLHlOeWpOfQxRFIbzG/vgCzuyPkhl2HN13PUrXW6xmwmxqtyMrS?=
 =?us-ascii?Q?hbxc+6HXvcwxxTtuhXxZOFpBCIClwf6taHCDyIydyrAoeediz+p+pjQfSepS?=
 =?us-ascii?Q?dnWdjIMxqbL6gsyb3U7ogZR6HJtKYU3IYzPKqfy1Rga1TaZu9gKpTCoiLzN8?=
 =?us-ascii?Q?NqX2kjFOfIs9cH8kUju+aywY8VmM60/6ZVZWsEdBn6lwNMwnWqrkxzYcVQ7g?=
 =?us-ascii?Q?W2yMfdKK2LLMHKmCKXDs1hOUeUEZIi2vgqfNt4c6zfuEG+Xb1FK33MJRnGv8?=
 =?us-ascii?Q?VSeMp4DxrPiuDdkWvCuaF48f9326j4kcYz1E/FG4l35Y96eHpHaHB0fGT3dh?=
 =?us-ascii?Q?gVHMUqRf1nZFv+jS5jzUQ5bCxhoVKpA+g8BfotPjZGToZLOKNR4NkyMDlwxQ?=
 =?us-ascii?Q?rTz224LBTPDVUbL5adGgXCqde5lvUAH0intLGJbu459Kp3ibVaiquJ+sYZ1r?=
 =?us-ascii?Q?Kxv44u0MXDsMX4ggjCn2ggVnumKuGxyLVjHZHg9LgBzafxmbgSgWq/AO+o8J?=
 =?us-ascii?Q?zb7GbX8w2WdJ08n50QRj5rPfx5AKohGpA9nZ3J0L1DcqpL6oKgSCQKok7T26?=
 =?us-ascii?Q?1vV7SWd506k8xXAKXTf5qCZTRg0/PIYtJe7/ygNbL1LcFrf7h02pAo3mjJ41?=
 =?us-ascii?Q?RtMLV7etGSMjJfjoc+Zy6VRgmWYC35R/6jEWLYJyHcQcfHnWe+2lz6VnH0gq?=
 =?us-ascii?Q?1ovCiqIISB/19zLz3bicpBbNgb32ZNRSKjVW/0kRdUVCT/18qk+I+ro7b7+T?=
 =?us-ascii?Q?WUiiW5PGRkEaqfrfEFc9lH+Akyb+gexEwo0w9BJmV/0xoY0aCfK4Vq5VSbuG?=
 =?us-ascii?Q?IcX2kvNGn5W9gbXdkgXNwsf7Htj5b7RNiFxwY8Pi0j5IUFF96M/8tOUsXet4?=
 =?us-ascii?Q?xqwSh5pC3YnQfonBLnizNWfQp+vdqI+HzrZOCy1I4uR1lT3RnLi3kHFGxJa/?=
 =?us-ascii?Q?9i6FMnSlgsnRkiqyPUjJ4bOe9p9NcRTRKaZj8hFmeZD0YJY+p1qt+v8FWMjd?=
 =?us-ascii?Q?tfHc+r4Ji9NoJweH7RysnSj85E2Csij4PwUoDLNeLz94jmVqYpNaI/EgwQq4?=
 =?us-ascii?Q?E8rvZLPSvQ2uwEmTTyxyaFaHHaDE5FnivO6LnzJjTvs/1ODlHu/23DpFACPB?=
 =?us-ascii?Q?Uk6Xe4ZuxkgKX/c7pBvsAc3CwiRXKr3ucriy/H0uBW5AUZIC1Pfk7ueZ+xDW?=
 =?us-ascii?Q?sAfk3CIWZFMPypVqN2a6DyeZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJFzRCbE81pGecRG3FcWJFRjleVzf59YB1HZT6FCI0C/7HQSuC46PYNkIZpd?=
 =?us-ascii?Q?/dhFjKXlqnlTZYNp8uY08KFBjYHDz5m+76w69oNOfXGgLhnpNOKxTCGUt+RB?=
 =?us-ascii?Q?AHUMNIFHPcutRhd+K+QBEWC80g+KaGlM0LMmr3HhxSCCPBqGNiOueM7FtUKr?=
 =?us-ascii?Q?QdPimyHu32jJklirVjNOa//5C88weA3C24MMHgwb26GNdALbQcHXAp+/uHjG?=
 =?us-ascii?Q?GiHgDPpQn2F6Kj27uJvYpbiW5XqR85rryXFZQTHJ1u3KqnI/x/qd6YOJOvgs?=
 =?us-ascii?Q?nfwu7o6asLKCKSAWjqybwCcahYkMILU0jCThbsxVGb5ikqzSgc7ue25CxRez?=
 =?us-ascii?Q?O7n5JP2pmiHJ7pRIbcn8hEaapGjok2OAAjTXFQVd37hbDScQyvckEjf2vd3b?=
 =?us-ascii?Q?etZIbBnbCjYE2ufiJ4Lg+3n/GPU3iwaVl2yS96lYqqgXSHe5aTLltzisI1LU?=
 =?us-ascii?Q?5d2aGwvI7LPmzpB16ZJSfXYmxIaHgLvDYsQv4NMsj4/YFGVX9q1+2mkPwcfO?=
 =?us-ascii?Q?i1eDFkbVrXxdf9Jh72rezsMX9Cw1KMLKuo3CXUG7/MoRUayUQRoP9RLF90/1?=
 =?us-ascii?Q?XcfBhZMIzO/N0oDGKg+KrAeH3uMbnXLzaiuhZUpNtvZOz/IBy5pvXaqpkAIw?=
 =?us-ascii?Q?LktpG8us4arF9OPaFBr4SnrnSPlQJvVQC3tqqCiMS7CMV/qwtMaSpX2PUCwt?=
 =?us-ascii?Q?MxawDeNTHB+wIoYdg631aOYz1iFg3WzKKS5tqrUi5ANKxUV/6jixm1UuB46h?=
 =?us-ascii?Q?3eYc5fPsigGr/BrD67d5S16KroIjs4NoyFkF4v28STFgqF6QEN9CEdrB8tBo?=
 =?us-ascii?Q?ocNDmfFxno47RQBJenYP6zs4JoS8silO6wlKEzY0DO6TJ2w1EOu+CLP0IJGl?=
 =?us-ascii?Q?JKS8DUNBR9ctzyHGi8AAGeGJWnGpLIhJ6w78UfgIwtWY82vWTHnd20Y8xEIG?=
 =?us-ascii?Q?hIFTYx7bWx6Mg0npKM1Pyw3Gw/R1dWmZy1Ytjxln2CtuvnChh7239I/jmPTk?=
 =?us-ascii?Q?9/I5QR2dE+DEuGSEBIW9ukME7Dzl8Pd7EBqTf7YVHxiSelKjph6+6b6Mdjnz?=
 =?us-ascii?Q?AzPIADuBFX3t5/0dyvBFfjLGAMszvckM9shbrMm8nR+a+0HCRTz1jslPTrHo?=
 =?us-ascii?Q?+QUd/ZLSVZn9dXM7JkbvDoOO6rRieBxyFKbE7pD7GAi6o/t8/sgBbBgjju7O?=
 =?us-ascii?Q?ZjhZiIWaCtyJ0mUMuW34T/Ylw+0ycRcHL3ar72HijTROZlV/quNAu8Qhsj+N?=
 =?us-ascii?Q?RD5oZaSxUhqkPZN0DvDzrqqfIqa1vbWznKFdv0WIx84cdnsa3piHrCkxfOOl?=
 =?us-ascii?Q?CTaWi1G6iMQzleahTHk4mwDhNjVBQn+rClDNIe9U/IYvUleLfaSY/T82RAX5?=
 =?us-ascii?Q?qVRQChevoDgyaq48BmcfHr1F7YuzirsiyDMywyHAKbfC+wws3+KHoMXkz8Yn?=
 =?us-ascii?Q?3eA/2d+hBeum4lPkhRpHROj3i9ZTFCNkujYBSMEwW+BezsutcfxtOcRWvgkf?=
 =?us-ascii?Q?ireDn5oQ2mQFOX8hXB2WTZmdKepPQ9ZpTl65x3lhBNMaNaWHQkK7Q8BxNtzU?=
 =?us-ascii?Q?p7fKbvX4Q2NHVcqt/mt/kVv4Ca3tPWRrwpY1s9zE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84784640-cc6e-4ae6-c512-08dc7a1048a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 03:35:53.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/Ucgp3yMshHh5ErKEmSWG76QRSC/K5Ohilx7Th4NYejhwx0eVk7R7w7dMKTMy7kQm7eAWonRjervAXtWytqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

On Tue, May 21, 2024 at 01:32:37PM +0200, Takashi Iwai wrote:
> On Tue, 21 May 2024 12:56:05 +0200,
> Xu Yang wrote:
> > 
> > On Mon, May 20, 2024 at 12:29:15PM +0200, Takashi Iwai wrote:
> > > On Mon, 20 May 2024 19:03:49 +0200,
> > > Xu Yang wrote:
> > > > 
> > > > When remove module snd-usb-audio, snd_card_free_when_closed() will not
> > > > release the card resource if the card_dev refcount > 0 and
> > 
> > [...]
> > 
> > > > Then, even the userspace trying to cleanup the resources, kernel will not
> > > > touch the released code memory.
> > > 
> > > Hm, it's an interesting report.  Could you verify whether it's really
> > > hitting a module unload race?  The module refcount should have been
> > > non-zero when the device is still in use, and it should have prevented
> > > the module unloading.
> > 
> > Yes, the race does exist. I enable trace and got below output:
> > It seems that snd_usb_audio module refcnt is 0 after insmod completed. So
> > it can continue to be removed even it's still in use.
> 
> If no device is opened, it's not really "used", and the driver module
> can be unloaded at any time.  That's the intended behavior.

Hh, I see wireplumber did open the card_dev when it scan card devices.
But wireplumber didn't close the card_dev when the scan process completed.

> 
> (snip)
> > Then I take some time to check why snd_usb_audio module refcnt is 0
> > even though the card_dev is in use. Finally I got below finding:
> > 
> > I build kernel and module with below configuration:
> > 
> > CONFIG_SOUND=y
> > CONFIG_SND=y
> > CONFIG_SND_USB=y
> > CONFIG_SND_USB_AUDIO=m
> > 
> > Then GCC will add -DMODULE when build snd-usb-audio as module, but will
> > not add -DMODULE when build sound/core/*.c.
> > 
> > When insmod snd-usb-audio.ko, it will create a snd card device and call:
> > 
> > snd_card_init()  // sound/core/init.c
> > 
> >   #ifdef MODULE
> >     WARN_ON(!module);
> >     card->module = module;
> >   #endif
> > 
> > However, MODULE is not defined for sound/core/init.c, then card->module
> > will keep NULL pointer. With this results, snd-usb-audio module refcnt
> > will not be a non-zero value.
> 
> Ah, it's a good finding!  That explains.
> 
> > > Practically seen, replacing snd_card_free_when_closed() with
> > > snd_card_free() shouldn't be a big problem, and it'll work in most
> > > cases.  But there are always some corner cases that might lead to
> > > unexpected behavior.  So, let's try to analyze more exactly what's
> > > happening there at first.
> > 
> > With above finding, we needn't to replace snd_card_free_when_closed()
> > with snd_card_free(). We need to find a way to correctly handle module
> > refcnt since this should be a normal usecase.
> 
> Right, I guess a simple fix below to replace '#ifdef MODULE' with
> '#ifdef CONFIG_MODULES' should work instead?

Yeah, it works for me.
Will you send a fix for the issue or suggest me send it? ^_^

Thanks,
Xu Yang
