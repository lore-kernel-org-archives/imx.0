Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79DE77113
	for <imx@lists.linux.dev>; Wed, 22 May 2024 06:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359852; cv=fail; b=V838Cud+BUxhG23md2J3Zy8jkGmqQ3ZGRxAX+L5ces/RbhSo+lGPI9rQStifWxajc6mtpTyNzGOV6UpdPENXgMM/wdoXGNDlK1NfjZRdvF56gahLkDTqWUHT+hMpnLKc9yG7aAJu2AIT9NCIBdAHfxoeg8EOXgj2XM2TeeYxPOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359852; c=relaxed/simple;
	bh=t/QM6BrighKr+G8QVXYS3vQFjE0QojzvBODTp/fYaJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OcvFl2epzINGiSxOJoOkYXNthcxKzmfNxe/5wZq6s13tYeBoO8MIhXKUtz/ZKfYhRDlVEpNpkutpVSg1lvWg5KnkTJnxpIMXZlT6oFItVsTqXaWEFWz+xnbyB3ezVIfpuwJscmOsEbN3c7pCCrl4l9H1G++5RfjY8q25Ues/SoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=GFr6BuVX; arc=fail smtp.client-ip=40.107.21.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GFr6BuVX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrKS7TKVr8qL+/+iFtqv/vbmNXMm0uz6+k72eTJNyiXrF30kzPczhJLAuN/VLFnvMxI6gDzINGx0zYWsaup+EVDpIPLNes/sa8AVdFg/ehne2zSBwGlNQiNkogLZkNPASzgTZq5er7s8BjeCpXi+x85rq57tDS/DCtfa6+tnAZcmIqa8p5PHGT+eYwrfyLIZv3DiIdkvdO9aeXnPVHpytJOwGgrgFQ/Ljr4l0+uBm7URvvi/iRvJwfq4BEOeEv4B98BisYN73xdj4JNW9x2kOa7fuiQJrEvbLYi8RLCd62mC6zOdaiYpY1I/q6s0vSOM2XKZPZlCSCvlV+qpyUuEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ/fILY0zNdihHJWDXv0PqLriQe1wwJ9i74/GxqV1kg=;
 b=A0qkynPO9L17YxkMdXoy2mHAHEPQ76HRAdcgIJF6p+ndKzCpjJzP7++daLsAdutV9Vi8iJXjrO+xGJSFAJSV9Xn220f9N4XCy7vCU3S3Ww9VV77eMQ3EkKvVa/LlOxfeKQRCK3T5ON9Ea2T0ZHS54kVJu81e7O7M/sb7yS1shdf3gO0AfofSSq5dn6VcXsnOzUHksZNqUhDKiIHHF952ctWq1pgKesaGx6shf86cyiUkfsEHdbAgB3fulYY1pb5vNNxy5kaj8Im0wTud4YSQjPwr23911raiFItkwQy4abFLP8cRZQeBVAUmhk/DrQsdMmmq30JNJU+AGoW1mrRQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ/fILY0zNdihHJWDXv0PqLriQe1wwJ9i74/GxqV1kg=;
 b=GFr6BuVXWuBpauPFhLXkPvZSf7MAmTFThRaY5QV3oltNDt1c9viPS7o4hLREduM9mlWKSxsgCrH8OnLQWAVUoD4wNUAvKCmkD+DxYpro03xKeu3eDOjYgM4BkRy03M2pk5Ms088+yjMb0ct1W/SrArRRyoXePLkcBOM2XGjt61M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10710.eurprd04.prod.outlook.com (2603:10a6:800:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 06:37:27 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 06:37:26 +0000
Date: Wed, 22 May 2024 14:36:00 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when
 remove module snd-usb-audioy
Message-ID: <20240522063600.qbf5dsk3bg5523mg@hippo>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
 <87bk503hfo.wl-tiwai@suse.de>
 <20240521105605.xcnji3d2wcihekhb@hippo>
 <87le431ju2.wl-tiwai@suse.de>
 <20240522033425.yztpigsv3uhdl5zv@hippo>
 <87jzjmz8vv.wl-tiwai@suse.de>
 <87h6eqz7rv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6eqz7rv.wl-tiwai@suse.de>
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e85e982-a5db-493c-88cc-08dc7a29a54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vdxlcYVLXBsgqL3mtQ3wcpy22M1hc2ytBx50eeEtC/lVVpk3NsmqHZkW3q7P?=
 =?us-ascii?Q?pt1jrWuMvlrIKUhTs2WLqehRgvcWGpvaGbR5gO5C9hLaDJxQTK+XSYWfS3Ov?=
 =?us-ascii?Q?lauN1nEi6sq8SWFrAQ/eqZpOvgRoO3tmAhr+wqNRpgMHUo6aq3JWPZK4tT6g?=
 =?us-ascii?Q?HYKZncPkg0cXAldpMQin5tvG/nl0FAuYIO6PsSeJPEAbuy0eMFyEBCWUKuFx?=
 =?us-ascii?Q?Embvg1qrgYvqGwWmYcFTHWKN1YrQspauj8q/A5xsUeTA0fqYEmyN/371nm4Z?=
 =?us-ascii?Q?opnUebJ3y7WHhkz7qnovOhL4MC2L+loGAvFI4ArG9gcUGfBjd2Bk/MW3QlHJ?=
 =?us-ascii?Q?PShXi/BGGolJBpCfdevJxWIt39WPJ3uD89yAcoVHRccQkrtFVw68TiU0Oq6J?=
 =?us-ascii?Q?tvzSS4Mf6Ayn6inWkayyyAxEbMw1s+a0ODL7X5/L+4mJquCJuNWKYL63UyOY?=
 =?us-ascii?Q?WztGcAZaviOJR8Ia9ajTm1pC28PbWaehfj9GILfbcHKya0IHfbEoimb38GUe?=
 =?us-ascii?Q?Lp8WKSCeNTrnLfxEtIxoljAKS47jV9VR2KLeZsq4YkDbjDYXyUGqK6YP1fa2?=
 =?us-ascii?Q?KC4h8h6h5X+kKdmYvusVcJAST6/Z65KHPdbvsjfYzKyGsq+0ynex2UpwFypx?=
 =?us-ascii?Q?fVQQ735qjDLqw2mitF/wknUEX/xcoywfqFHW3xdH2CDK9o/BPw7LEIMQH98q?=
 =?us-ascii?Q?uGIImZCzJ+tfxq4RETKFSw47A907Q5uqJUhRo+Z/uUu0+CnCb+zoj6l+ZxYP?=
 =?us-ascii?Q?FEbgah1EkHbcJw+hKGiUd/UhL3vncD+Iu28ZJPuxN05MMA851on7YvDDE6QK?=
 =?us-ascii?Q?h6TOqHuHlRCnLpgFrOi7a0unpEQ+DWVuzeHmDXIErU1jJDzMXvxZLVxlIRip?=
 =?us-ascii?Q?XbMdKExvkxtCr9cUdDUZ1TUjFEJOczks8Pcx2q5dBd7syUjiZJeBjBE1X8nK?=
 =?us-ascii?Q?s576H/J1nnO6e19wZUKmCUDYfnCBOiiFRmTRaxrFuYQnTo+FIfk54X8ejw89?=
 =?us-ascii?Q?zQKpMLM1CUA089GP5Td+4/sXV5kI8g8LzMO1X6nSqTHEa6zAK8cx3gmWq5kx?=
 =?us-ascii?Q?VOwHWiCtrQmmiTvtbtiLeWUwDsoGxaFPcmiq6Qw8wH6N7+qpw/+5xzDejTar?=
 =?us-ascii?Q?Nduf+9dTj7DhWy0inVTZb8WCG9VVTCJyjAaD7M+bz8eyQaYnLp6Bly+TANye?=
 =?us-ascii?Q?OvToQLE4M2DRRlB2Okfrl3WCG2lpeLUbNlF6R9WYFNPekfpFZHTPbFGoWNzU?=
 =?us-ascii?Q?dg7PmAQFDcYOtHl7eEQTSGRnjoyTCdKFrMf2WTHNgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AFSGcu6gx3UD7IYrolb2vpPpskmkt8D3gLF11CbQwD0Lth3ZiL01FKPk4oHQ?=
 =?us-ascii?Q?nK6njOnVHwHkHQLl6+aba2vnniB1Z9TuhYuZqsCB1xnrUO8yd4UabhkYSt5e?=
 =?us-ascii?Q?8d9MqtE5FEmLp8gtKPwcOrNM/tEbBf7bJHNjXOqll8MU9xU0ecupJXzCYL9L?=
 =?us-ascii?Q?fECNvUG9UPpRAiddgUJzq5IVqkHKQoVLv8CGbjxwXb1g+GhVLm922911K00S?=
 =?us-ascii?Q?WK+n/4UsW2H1tJd9t/IgjKmZMY288kNnXq+dGxxKOjV6rz1RYLzQ88j6MtNO?=
 =?us-ascii?Q?EgrawvqR4OQhLYnczd5liNsdFr7nQF060YZXj6205R3kG823BQiixTJ6aHIK?=
 =?us-ascii?Q?010UMHGsBbg7T5XfwQqU/FVDJxcotgqpYtgv0eOUKXD9FxZ76AvYppLqEAuF?=
 =?us-ascii?Q?UAw/Hsl/fkBz9D/ePA0lHpCEQVzOj1E12aWKG7L/3mh8neVv7IbpfmcfQyX+?=
 =?us-ascii?Q?lW0slK/7vYG54FqbH29H5oMHY/cWKSOBl0TcR15Let/AC0HNa8iPqrLvRCWl?=
 =?us-ascii?Q?zVEoTYi+t0FDBIeHz+PJIsho4iMPFT3LlEu1U6fU/EW2onnnVAKK1FhUmU2H?=
 =?us-ascii?Q?BUoRjtqRakw1nwjP6P8zr3G1EaoogiZfK06W1b2SlAaSrrLVANLEo4O8HTU4?=
 =?us-ascii?Q?7KCvMQ0KW6F5i+sIJB9a6OQmN/MVMqaoNFPctuwwziGCugKV6u1LGf7q1+s4?=
 =?us-ascii?Q?4ERbIMpc4jyC5XMLUAoLJ3qJ+zqpeB+JYSYx7b7SO4pfxTeOxoQSH2gPsEQr?=
 =?us-ascii?Q?XIXiYQcv4AOqIRMwIysQIj9J5XvZ0nkkOzyHXdh6tFGjiDk+80RNpHOKT2sA?=
 =?us-ascii?Q?Llz2Ty2yyZCfoQUnxOPDn3CWr8JYlfWIzzb/2skTnu5HQhUXkhT70GG5YOze?=
 =?us-ascii?Q?Wdt4pcQgdFa79ah6dpND0Fk6+NXQf6hxM7VdixJMVcYtJoIAJrOrjKHKoVae?=
 =?us-ascii?Q?OAMMJsjdbvFs39cuw3Fck4xh6GvYbmjyMbmz+TTaurVWcNkGlWXcIe7TEFa5?=
 =?us-ascii?Q?+CcmzrxN2MNRDiY9s2jNAUdXgM6IMU67s3HI7gO//3QroyYMZIRfJDyzDlCe?=
 =?us-ascii?Q?v76D8jHUyy5jZjJnGjpr+pdQmgq+pM6nJx5lriTJ/fY4KxpKnWGf+cE35v3d?=
 =?us-ascii?Q?Io87FkOECaOWpO4XvzfzQKNIzR5AlMHK2XjWpzcjbVJtaiHETtI8mzZR3Jrj?=
 =?us-ascii?Q?CJTzCFZ5F/UJTawH4A3n9ouFjk8JVnkix23OiEH+RwQHaJv606eRWLSolsZr?=
 =?us-ascii?Q?KtXCM+LrqLpKcQz4us/jMyzGxKmFSlN3PoaxhLMRwwCRPoX/onMmfPzXWEbM?=
 =?us-ascii?Q?UHLvoR+NuMMIJUGhVqfhqvSuISn1DSftxg8yGq4B/N56ewSCAxvo1O0XLb1i?=
 =?us-ascii?Q?AO8UWYN/dP9ACeiSa9zlrVx+y+oi9aH+pmcrfNP2xQPcTbagz2hR10Hk77nH?=
 =?us-ascii?Q?Zwn+lh8L77SfVy55b+RREsEpaFmwatVImis87IlWW6hB7o3P4sRRz5kn0jgD?=
 =?us-ascii?Q?elmAtzV1G4QIawiwh7nbmnn4cudVpp3u35ldJ+AvW5hboEMjmhqv+3sa4jrb?=
 =?us-ascii?Q?zHDUc+Xg1+YZXn6eZOwRJgJ1BREMAnHQJ1o3hT1d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e85e982-a5db-493c-88cc-08dc7a29a54d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 06:37:26.8608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LggbM9lOUr81Qz2XTEodsEljEgYUF/1qgLXxymfPdty4EyuS7cF9fiSjzUsem1zjJeXHRdNjECMLY4ZOVGxiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10710

On Wed, May 22, 2024 at 08:21:24AM +0200, Takashi Iwai wrote:
> On Wed, 22 May 2024 07:57:24 +0200,
> Takashi Iwai wrote:
> > 
> > On Wed, 22 May 2024 05:34:25 +0200,
> > Xu Yang wrote:
> > > 
> > > On Tue, May 21, 2024 at 01:32:37PM +0200, Takashi Iwai wrote:
> > > > On Tue, 21 May 2024 12:56:05 +0200,
> > > > Xu Yang wrote:
> > > > > 
> > > > > On Mon, May 20, 2024 at 12:29:15PM +0200, Takashi Iwai wrote:
> > > > > > On Mon, 20 May 2024 19:03:49 +0200,
> > > > > > Xu Yang wrote:
> > > > > > > 
> > > > > > > When remove module snd-usb-audio, snd_card_free_when_closed() will not
> > > > > > > release the card resource if the card_dev refcount > 0 and
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > Then, even the userspace trying to cleanup the resources, kernel will not
> > > > > > > touch the released code memory.
> > > > > > 
> > > > > > Hm, it's an interesting report.  Could you verify whether it's really
> > > > > > hitting a module unload race?  The module refcount should have been
> > > > > > non-zero when the device is still in use, and it should have prevented
> > > > > > the module unloading.
> > > > > 
> > > > > Yes, the race does exist. I enable trace and got below output:
> > > > > It seems that snd_usb_audio module refcnt is 0 after insmod completed. So
> > > > > it can continue to be removed even it's still in use.
> > > > 
> > > > If no device is opened, it's not really "used", and the driver module
> > > > can be unloaded at any time.  That's the intended behavior.
> > > 
> > > Hh, I see wireplumber did open the card_dev when it scan card devices.
> > > But wireplumber didn't close the card_dev when the scan process completed.
> > 
> > Then rmmod shouldn't have been allowed, it's a consequence of the NULL
> > module pointer, I suppose.

Yes.

> > 
> > > > (snip)
> > > > > Then I take some time to check why snd_usb_audio module refcnt is 0
> > > > > even though the card_dev is in use. Finally I got below finding:
> > > > > 
> > > > > I build kernel and module with below configuration:
> > > > > 
> > > > > CONFIG_SOUND=y
> > > > > CONFIG_SND=y
> > > > > CONFIG_SND_USB=y
> > > > > CONFIG_SND_USB_AUDIO=m
> > > > > 
> > > > > Then GCC will add -DMODULE when build snd-usb-audio as module, but will
> > > > > not add -DMODULE when build sound/core/*.c.
> > > > > 
> > > > > When insmod snd-usb-audio.ko, it will create a snd card device and call:
> > > > > 
> > > > > snd_card_init()  // sound/core/init.c
> > > > > 
> > > > >   #ifdef MODULE
> > > > >     WARN_ON(!module);
> > > > >     card->module = module;
> > > > >   #endif
> > > > > 
> > > > > However, MODULE is not defined for sound/core/init.c, then card->module
> > > > > will keep NULL pointer. With this results, snd-usb-audio module refcnt
> > > > > will not be a non-zero value.
> > > > 
> > > > Ah, it's a good finding!  That explains.
> > > > 
> > > > > > Practically seen, replacing snd_card_free_when_closed() with
> > > > > > snd_card_free() shouldn't be a big problem, and it'll work in most
> > > > > > cases.  But there are always some corner cases that might lead to
> > > > > > unexpected behavior.  So, let's try to analyze more exactly what's
> > > > > > happening there at first.
> > > > > 
> > > > > With above finding, we needn't to replace snd_card_free_when_closed()
> > > > > with snd_card_free(). We need to find a way to correctly handle module
> > > > > refcnt since this should be a normal usecase.
> > > > 
> > > > Right, I guess a simple fix below to replace '#ifdef MODULE' with
> > > > '#ifdef CONFIG_MODULES' should work instead?
> > > 
> > > Yeah, it works for me.
> > > Will you send a fix for the issue or suggest me send it? ^_^
> > 
> > I'm going to submit a proper fix patch later.

Thanks in advance.

> 
> Looking at the git log again, I noticed that it's rather a regression
> in commit 81033c6b584b.  So at best we should address only this
> regression by the patch below.  Then the rest '#ifdef MODULE' can be
> replaced with '#ifdef CONFIG_MODULES' in another patch as a different
> fix / cleanup.  The latter changes the behavior slightly (now the proc
> entry appears even if you build the sound core into kernel).

Yes, indeed true. I agree with you.

> 
> 
> Takashi
> 
> -- 8< --
> Subject: [PATCH] ALSA: core: Fix NULL module pointer assignment at card init
> 
> The commit 81033c6b584b ("ALSA: core: Warn on empty module")
> introduced a WARN_ON() for a NULL module pointer passed at snd_card
> object creation, and it also wraps the code around it with '#ifdef
> MODULE'.  This works in most cases, but the devils are always in
> details.  "MODULE" is defined when the target code (i.e. the sound
> core) is built as a module; but this doesn't mean that the caller is
> also built-in or not.  Namely, when only the sound core is built-in
> (CONFIG_SND=y) while the driver is a module
> (e.g. CONFIG_SND_USB_AUDIO=m), the passed module pointer is ignored
> even if it's non-NULL and NULL is kept in card->module as consequence.
> This resulted in the missing module reference up/down at the device
> open/close, leading to a race with the code execution after the module
> removal.
> 
> For addressing the bug, move the assignment of card->module again out
> of ifdef.  The WARN_ON() is still wrapped with ifdef, because the
> module can be really NULL when all sound drivers are built-in.
> 
> Note that a NULL module pointer won't caught by ifdef MODULE, but it's
> only for special kconfigs and this warning is only for debugging,
> hence it shouldn't be any serious problem.
> 
> Fixes: 81033c6b584b ("ALSA: core: Warn on empty module")
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/r/20240520170349.2417900-1-xu.yang_2@nxp.com
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 6b127864a1a3..ac072614d1ea 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -313,8 +313,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>  	card->number = idx;
>  #ifdef MODULE
>  	WARN_ON(!module);
> -	card->module = module;
>  #endif
> +	card->module = module;
>  	INIT_LIST_HEAD(&card->devices);
>  	init_rwsem(&card->controls_rwsem);
>  	rwlock_init(&card->ctl_files_rwlock);

It's okay for me. I'll give a Tested-by when receive a formal patch.

Thanks,
Xu Yang

> -- 
> 2.43.0
> 
