Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49584185935
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 02:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856444; cv=fail; b=YigCCXakmVVyd2+rGOZSsCUrW2hYhUDr8qmWYJgqFmbtOG2dWoxFlaQ9b1SONbeFP7IKMYRrYaYV7+5EZBL71qTY3HtmCX2dtYzOh466JEnU5Hov2xg+Eek07wFWaGwnW0Jb5lwBriST9EMgiWxfCSVpFdynY914osam3GHOd6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856444; c=relaxed/simple;
	bh=HUR2FjXjtLzuoBcoCA+nm9enSiME59vwiNdVJMawhmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fQ1/gN6BLc8L+AG7CpqFRAMUuiJTGr0V9BPAjBjk1XKCG2MLB5nMS+ZHxaqZ5oHmXyxDwksN/znYtbyvzrU9AmkFk7buaJVuq4uYrKQPtxdZ2q36B8gClIMa8tnYkCwDndbdw7w+37cCAm5xIKVjJHhEIRzJeTwuXMYZHmD/wNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lDBHCX+Q; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lDBHCX+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM/yAI5nC+minMb3CLBuyaMrP6aRx7BAEf+nXLrzLnzOj0zpYrLp/Tkeix7kIpQY7R2iMwmBTuu+lyMdqRQuuDpN1T9Nqj53OLMTo04Ym4Wtt56IkGtR/IQjOw64xhHleRrbXfBoyuF/M6shJlMERqSG2z2OftTIpJl17nbQ64Z6I3tC/MHZqqQjalhiJP6cA/Fkf5Ui85hkuVt5l6fkWH9VUYYgYrRvRvk3qUsNAN8hmltHH3XSTbHQ4fJ8mIsppzqHaM/sYBgMLbwZdpM1WsnDw810hhn4kUiYbi1KHfh0ce/5PQnOwpjXgk8sqrYDuoZpfhgq90MprINxfFnGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYHa/XPHV0B4Jsv5YKyALerd9JymxJHIJyBmfExLoI0=;
 b=KHj1ChWqWNwXoYmwhl8iLJPua22fZfG7xbP76+mymaqj+Efxw8SoavAYmKR3+6XpP9P376ymH7oFmwjRUHu/lEvnfojYtjwL9FLk3Uq0YmDb2ExMAZ5O+0Ob/jTbrfanJDohyvc2YwwyCg1ZyABc3fsvmNLi7PAYp/GMFXzN56x3umph/qCcdX+Pcl7lIJnAL2PQdNi1a7Xx6Qq+kIWZ3Cm1fMcSnR52RlAzibq6iBag19tazVRp1WLlyXPt6ZcuwurVsTH2CRXQBrJhDOj0RSSsOGZFkkN+e7VQrwv3fbF6PeV9DmA8WNYLWURPLasC8IxWba1tpdxZ0VAi/3P9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYHa/XPHV0B4Jsv5YKyALerd9JymxJHIJyBmfExLoI0=;
 b=lDBHCX+Q3lTXsBFVh4BmzEE3Tvoh1gpWDyCiHjRKkfWXwDuihLfT1np6pHMrga8EFy+eQyULBA6RuoTuJQD0iiY1OW8JV02SInobA49nKZo4dSe06OUufyLVkiXM/AnALiWx4Oe8REDl3PbGFql3xISLEZ/Lv0yo4fOFmM4Pj5sb/8rWxmIO9fIm/PS8t/xfksN4HKt+U17Ud4ofyfSx8+M38bbgrePHZstfG8GWy0lkpZ8FYBujNGMfy1N8HJ7r4zuyIp99QnWlPVGcIVsI7KSiegiLvrJmpbOyMr+RhRSuPTIB+03Sq7qLrjFblLHZwJJhyJfbAkYrAdBDzs4PIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB11074.eurprd04.prod.outlook.com (2603:10a6:800:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Thu, 17 Apr
 2025 02:20:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 02:20:37 +0000
Date: Thu, 17 Apr 2025 10:16:49 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <20250417021649.rltm25nmj4etwn4d@hippo>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <20250416105940.1572672-2-xu.yang_2@nxp.com>
 <Z/+/pgmR4n71iTkE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/+/pgmR4n71iTkE@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB11074:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9902e3-fefc-486d-08cb-08dd7d567127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/I7P5piKM12Lx98RXoe/tyP9VShDV1Q64xbrq3uF+PYuOvui5+gLZZ12EAG?=
 =?us-ascii?Q?39rUBBgD3jSCKlXpZIZ7FNnMKikR0llaKx16tivxLKK3TrL73xUBg+f5xf5Y?=
 =?us-ascii?Q?EfE44Il6jifQ/O6bicPlDJDSul+AHpt3zjn39ov6K4Y1L8IjkqLHWcIBr2nv?=
 =?us-ascii?Q?9kle47iiiMTYpxYg5iLwkxbeaKKsWgpsbhloLZC0BKSsuTW/YrsOBbdL5Pp6?=
 =?us-ascii?Q?A5BpwVH+zHGfm03I4vxgH/IeaMCttAkkGYmFs663zMQP+K86Sa8GQ7g7DOdN?=
 =?us-ascii?Q?lfE9l7/gmPoz8O4h0l3ynHkILEw1ajrwmuZL2AvZet8Z4tYrXwNT/vO25VGu?=
 =?us-ascii?Q?GBg6Qmtf8cjeVOakLx1gdJ4wI9aZQVMCfkeaX0vsiDQGh7qJ/SP8IKm1HoJu?=
 =?us-ascii?Q?HaBWqJTRu5/b+rZlREY3uyD3EGKzD4Eo+7409wSwUbcaMwUc9SZRxWtLGWFk?=
 =?us-ascii?Q?GbQ8dRYLPlOwc8ntUVaYnqHX1oJDdZyv8jOc2orT+5S2IZPXXz36ASLKBTVT?=
 =?us-ascii?Q?KZDs+THwnX94tWSyuthMOjyadPNADSmGxOho7PUdPfYMUwGNQkVDXnp9FhlF?=
 =?us-ascii?Q?3oirNTLB3CPVjv5LOs2dJ6EQOSHiyI8rCWlFFJRmQjB6WqAUQazJzccCWjyz?=
 =?us-ascii?Q?L5QK9V3INAVqFpOSi2Oxxat2paRxGfCFBkggjoPdd/vPg03e65ep2u1uNQxG?=
 =?us-ascii?Q?kW0+m1y7TnhvwFMLK6/7dH0oGSaxBUzZKrXG+qX6DTDyC5enWuOLKYhyDnHL?=
 =?us-ascii?Q?XCeKm8KdKln7DGXMzHy8/bQekR1XTV3ycFLvN/BcyPdnpTgS7oTrvUzHLf3E?=
 =?us-ascii?Q?sPRu9AH3P00uC989C18jxXX8iFJlhoRW50QPAEBGWFSRO875zdEeH+gaq6Tx?=
 =?us-ascii?Q?NN9RancBLZD4U61mDyBXF1f1/Yn34In1Oq6siXe5uNfTc80NtavIF8BUILZ9?=
 =?us-ascii?Q?x1//pUzth7ENRQWxRMwH5ici+HDI7/WZsIN9LA5in9IFDKccP1r5oBjLYB89?=
 =?us-ascii?Q?FIstoJQI1P1kvpNLmg+qGs3kooOrX7YoCYA535xbjhXXKfjeHd9QFAp6IrQa?=
 =?us-ascii?Q?fH3qUGqMatd7vhBrA7yGyrqvfU42hTwJJvhjyuLL7q0dNR70i80VXeU+L3OT?=
 =?us-ascii?Q?4m2d1R2z4yZG1CIIeWmt0M/SVJrtk8RJ/lnHY+xyssQWswN70mWE0heY1koj?=
 =?us-ascii?Q?1IDVXgJ74WJtpipimKr1J4jC4El9YSEIoKYYbAo3Y8IfcxKjuJiVL9/E5PUC?=
 =?us-ascii?Q?lhE3Gs5Pl9waWfxS8hwIiYHXtEX5THDSinPi5v2F4YndPbS6IQUAXvT+w2oa?=
 =?us-ascii?Q?w4TLE9DB8WaIP7oRTPJd820ChTUNgU9wc0SMZ5tn4zy6KPI+bxKnPpBRRsYS?=
 =?us-ascii?Q?T2i7feUFk4LltAEmJKg4uIoedQFi49ji50rTQpBJDZZZ4/rAIH0ozhSUhcMo?=
 =?us-ascii?Q?EkTAmCEJWceYJSU9ide4EZyA4RQL6e9MaD7LFFibpN/2TZ9nb3USSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVlY7xamWY88oUJdP0WMfXu45BnbXVSj/WskXqTBsLU2H4Sq3IlyVpm5OZoa?=
 =?us-ascii?Q?hQz2BzJJMlqE6Aidn0lhvCuMCu7Mdo04FfhVJvwwuy78oJjjJQxH4zDCuFWs?=
 =?us-ascii?Q?kQBq5JwTwxQVG7Sl0nyFo+sa7G8ZZ0WaYORfGlCNdNVIIsLWOORLDhGh0JWs?=
 =?us-ascii?Q?x6tut9TtzWwXkDKQXq8+wU9sjXhyRRUAS9rr4ybdllEF96gMkd+gZRJGxVLA?=
 =?us-ascii?Q?4YF08Vz7vZwdayUCARAHH9jcr1IwHwIZ0YQwgntqcMS6D0ec6p7CglklflcZ?=
 =?us-ascii?Q?iVPgnB4m/BYVckJY9UCgKBr52vTl7JvmLah+9C8jxQnDc8/anYkgwc+a2M7D?=
 =?us-ascii?Q?XnIJvkvhcfzd2/tutgM9DAPfVA2gpSe7RJDyV9E3DfRXAlEzZc1u2JzmoA9e?=
 =?us-ascii?Q?Rf4xqF3eWeqBkUR4eAGwJLWKxdDr3lcmrlJaVejhiYFMYtn5zREOMNEoI8wz?=
 =?us-ascii?Q?AkVBTLpf+enxWnXoA2yApRFhsR8wcT+r94pgyzU4TCk/Gq9mhYZCidEjPQFK?=
 =?us-ascii?Q?VhPfJN0vKJUHILiNNMjx53EhJkidwekkyUTZ98B29OOzk+g1hs+WQfzoF7I4?=
 =?us-ascii?Q?jOSVx5yDD60gDiEI0tO2IU2YWA5wmnV1vg2OCMp4BKyMBWJ6QsO4z12lFH2O?=
 =?us-ascii?Q?BJbthvx4XgjPrUPSzBdUSPWPCRHcf0ir8CwPo/lRBxQMikOd/g9C+i1TXvEX?=
 =?us-ascii?Q?EIvhDAWnOhLOsRxgacF3uAyi6Ic5VOuLmKb5nZpDDUV6CXHMFWinD9UYbdTp?=
 =?us-ascii?Q?m3Cg78v6Ic1wr2xytQx7ojYbdlmuRcMVyw5c6MLgmpue2TmpPfmmNqhom2uQ?=
 =?us-ascii?Q?kNFUWlhfBMC66SYaimQa+yumzNgrLxMpiwL6PuFYju8fn20nTZGCFJ9jm2ng?=
 =?us-ascii?Q?vgJfDGyOwcjrvswD1jaskautqctR1JvQ1wEDeW6cAWiHxvoJumg+0EvEQ9XJ?=
 =?us-ascii?Q?6HhsHVuiVBCZE1S/dm0+izmd6Dba8ToQzUuovhRpZXv7DiqZoxw9VMIDusQe?=
 =?us-ascii?Q?1HQxJnJu14jje8dewtk25eUQAVyJFcEvZUUvblVX1aD1m6ihxm6vxwNAl9GQ?=
 =?us-ascii?Q?xFtQQbs90DxyH6VE+/5sUcfOc6MMocO4RcyKIvfTXgnGQe2lLUpmkmdghF0R?=
 =?us-ascii?Q?9Fx7ddBOybUPEQxfZ1BvAB59w/drIzrKJe/ZXFQm617jUmkqzuobBpTaG2Iy?=
 =?us-ascii?Q?FhghnHQS8FnkAADZFh4hYuBGE5/Zp/m8OT64FPS/jnaxkDpgnuPLY8zfBjMI?=
 =?us-ascii?Q?BM19F0EnaOaF/m0uwyz3OoxBfqXHb/8WUluWHGHyoR8k9OPg1tqOt9qnQo/t?=
 =?us-ascii?Q?9jt5UUn2o5+Z1qa2WPGaA5eueuGK+fuzTzXgW5oXtXkASnFwIFjyNPx1O8ZQ?=
 =?us-ascii?Q?amWTg0uGmLS2ROAnC8tOuTTXil4w7LbdCXobEfSy8ooVs9jNxDsiRTx1lST1?=
 =?us-ascii?Q?GaZ4egRaXnynVB+eCvsksZt6tLIy/T9L8yY7woEUe5Mc2w3bAa3dBICkTQmj?=
 =?us-ascii?Q?vIOey+K4807PU9gjq3bN4w3ziq20f8qAAWWibSqXzBGQZVdE9OxrRuxeOxSq?=
 =?us-ascii?Q?jEGa8/xnCTHh8vciKA//+rP/9DttjL07uAt5wQpO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9902e3-fefc-486d-08cb-08dd7d567127
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:20:37.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS11BDjdtaSyLnEhzP88w2yL7Uvb2QwJah9QHkCOSSBngp7BO34SdW0vKYDyIidj5pV76tebxHstNLP3+jG6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11074

On Wed, Apr 16, 2025 at 10:33:10AM -0400, Frank Li wrote:
> On Wed, Apr 16, 2025 at 06:59:39PM +0800, Xu Yang wrote:
> > PTN5150 is able to detect CC polarity. The field[1:0] of CC status
> > register (04H) will keep the result.
> >
> >   00: Cable Not Attached
> >   01: CC1 is connected (normal orientation)
> >   10: CC2 is connected (reversed orientation)
> >   11: Reserved
> >
> > Sometimes this information is necessary, so add orientation switch
> > support to correctly set orientation of multiplexer.
> 
> Add orientation switch support to correctly set orientation of
> multiplexer according to CC status.

OKay.

> 
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/extcon/Kconfig          |  1 +
> >  drivers/extcon/extcon-ptn5150.c | 40 +++++++++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> > index a6f6d467aacf..fd4ec5dda0b7 100644
> > --- a/drivers/extcon/Kconfig
> > +++ b/drivers/extcon/Kconfig
> > @@ -145,6 +145,7 @@ config EXTCON_PTN5150
> >  	tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
> >  	depends on I2C && (GPIOLIB || COMPILE_TEST)
> >  	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> > +	depends on TYPEC || !TYPEC
> >  	select REGMAP_I2C
> >  	help
> >  	  Say Y here to enable support for USB peripheral and USB host
> > diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> > index 78ad86c4a3be..b7e05d921c79 100644
> > --- a/drivers/extcon/extcon-ptn5150.c
> > +++ b/drivers/extcon/extcon-ptn5150.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/extcon-provider.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/usb/role.h>
> > +#include <linux/usb/typec_mux.h>
> >
> >  /* PTN5150 registers */
> >  #define PTN5150_REG_DEVICE_ID			0x01
> > @@ -38,7 +39,11 @@
> >  #define PTN5150_REG_DEVICE_ID_VERSION		GENMASK(7, 3)
> >  #define PTN5150_REG_DEVICE_ID_VENDOR		GENMASK(2, 0)
> >
> > +#define PTN5150_POLARITY_CC1			0x1
> > +#define PTN5150_POLARITY_CC2			0x2
> > +
> >  #define PTN5150_REG_CC_PORT_ATTACHMENT		GENMASK(4, 2)
> > +#define PTN5150_REG_CC_POLARITY			GENMASK(1, 0)
> >  #define PTN5150_REG_CC_VBUS_DETECTION		BIT(7)
> >  #define PTN5150_REG_INT_CABLE_ATTACH_MASK	BIT(0)
> >  #define PTN5150_REG_INT_CABLE_DETACH_MASK	BIT(1)
> > @@ -53,6 +58,7 @@ struct ptn5150_info {
> >  	int irq;
> >  	struct work_struct irq_work;
> >  	struct mutex mutex;
> > +	struct typec_switch *orient_sw;
> >  	struct usb_role_switch *role_sw;
> >  };
> >
> > @@ -72,6 +78,7 @@ static const struct regmap_config ptn5150_regmap_config = {
> >  static void ptn5150_check_state(struct ptn5150_info *info)
> >  {
> >  	unsigned int port_status, reg_data, vbus;
> > +	enum typec_orientation orient = TYPEC_ORIENTATION_NONE;
> 
> Move to first variable to keep reverse christmas order

Okay.

> 
> >  	enum usb_role usb_role = USB_ROLE_NONE;
> >  	int ret;
> >
> > @@ -81,6 +88,23 @@ static void ptn5150_check_state(struct ptn5150_info *info)
> >  		return;
> >  	}
> >
> > +	orient = FIELD_GET(PTN5150_REG_CC_POLARITY, reg_data);
> > +	switch (orient) {
> > +	case PTN5150_POLARITY_CC1:
> > +		orient = TYPEC_ORIENTATION_NORMAL;
> > +		break;
> > +	case PTN5150_POLARITY_CC2:
> > +		orient = TYPEC_ORIENTATION_REVERSE;
> > +		break;
> > +	default:
> > +		orient = TYPEC_ORIENTATION_NONE;
> > +		break;
> > +	}
> > +
> > +	ret = typec_switch_set(info->orient_sw, orient);
> > +	if (ret)
> > +		dev_err(info->dev, "failed to set orientation: %d\n", ret);
> > +
> 
> Does it need return error here?

The context is a void function. So it'll not return error here.

Thanks,
Xu Yang

> 
> Frank
> 
> >  	port_status = FIELD_GET(PTN5150_REG_CC_PORT_ATTACHMENT, reg_data);
> >
> >  	switch (port_status) {
> > @@ -152,6 +176,12 @@ static void ptn5150_irq_work(struct work_struct *work)
> >  				dev_err(info->dev,
> >  					"failed to set none role: %d\n",
> >  					ret);
> > +
> > +			ret = typec_switch_set(info->orient_sw,
> > +					       TYPEC_ORIENTATION_NONE);
> > +			if (ret)
> > +				dev_err(info->dev,
> > +					"failed to set orientation: %d\n", ret);
> >  		}
> >  	}
> >
> > @@ -219,12 +249,14 @@ static void ptn5150_work_sync_and_put(void *data)
> >
> >  	cancel_work_sync(&info->irq_work);
> >  	usb_role_switch_put(info->role_sw);
> > +	typec_switch_put(info->orient_sw);
> >  }
> >
> >  static int ptn5150_i2c_probe(struct i2c_client *i2c)
> >  {
> >  	struct device *dev = &i2c->dev;
> >  	struct device_node *np = i2c->dev.of_node;
> > +	struct fwnode_handle *connector;
> >  	struct ptn5150_info *info;
> >  	int ret;
> >
> > @@ -311,6 +343,14 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
> >  	if (ret)
> >  		return -EINVAL;
> >
> > +	connector = device_get_named_child_node(dev, "connector");
> > +	if (connector) {
> > +		info->orient_sw = fwnode_typec_switch_get(connector);
> > +		if (IS_ERR(info->orient_sw))
> > +			return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
> > +					"failed to get orientation switch\n");
> > +	}
> > +
> >  	info->role_sw = usb_role_switch_get(info->dev);
> >  	if (IS_ERR(info->role_sw))
> >  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
> > --
> > 2.34.1
> >
