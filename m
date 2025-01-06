Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2054.outbound.protection.outlook.com [40.107.247.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48DF1474B9
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197811; cv=fail; b=FKS3W9Te7f8r1j5ZNyCcENCOH5IOiTm+NTBgW7AkWW06g423KnOTD6dXgtJDoKNn+AI5WRLWf9mmSrHT2cQcmkuNK8tBtbGYGt5MjykjKnsrGKqFEcAgyMunEw14zjpPsOTSZl4j6GC5NZ319JGaLF/pAfmleq5H7fqKQESO3cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197811; c=relaxed/simple;
	bh=vIHRQP6ThG1DSkXC8Q5HrEYqAyDWscsIqOrNniMdnh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LwPeRv7m/USZoZ2F/7cGBurxHUsAqs9fUOHW6HhDzqBsSFf2Sk3IPKDQUnb+ZVTZwj1c5syEk2HS5pHWWlYoxOe3vb/Pe59b9xy45h4Qyl26dkdkBrmqtkiaFdKng1HxRfP4uR3jbVeoTi0Dq5zfhbHyPGK8omoqYylTfx1GnmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OYWX+faj; arc=fail smtp.client-ip=40.107.247.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OYWX+faj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7LdFA2RZQuHn6MBqrJ86Cs1MAWjGXStyknrsKWGc6WL1hCp+r7ggi3iMD2Mj0IsSr49AaS06EckZXJq3pGwuUO8FTv1sewRO5pqvsCe16j/LmCfG6+HCoFRtPenaub3Gu1IiIa0kNPrBY2Ddugs/juJnh/AjnWOp8Y55iP+LHFKcSwzOJsW+n7kcHZB+tt9AlJAkn0ojNJjiuZy4DdqgmxGBfszWHDArgh564ayIg34bKPtfikv70wb2VT2PFGPF4s5z5MiFgnSrs/UM1q5zVJiYqy0QcYVmMQNeJVA+R+38vn38siZwuuYLQ4XGxHHeqcmgIx/EbriJ9XliU8cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbaCUdewMAbxpK2RtMF4rx7SyzY7OFTCQ1W+a3JPopw=;
 b=aCDXK2M9sN7Jq5LA1c5Wjg1MbokhigUAj+vabaEN2kTCPiQp17yZ/JqI6ZvzyQ3rJIQKAxndrme3aDob95n7+KILi8qjvhGucRu1Q4CVUNkDHZZr84V7sojAiyoieOFTwviuZzig0Hhfupi4+9+SG1DjQufifrAVsz3SGo6O0DGpyRqZGvWYhns7zBDGpd4zBUeLxcRs/LVKG+SDnA6n+01QXFHpeACQ8h7PqmqV8RZJ2uVha/xIhrSxqUtQz5fzhSNcTHXI+xLbPsHluU18j4n+ttgyedrfSJVQiRXNT+Y3G+C0GRoajG2C2Gp19KhfoqDhdXxQYZjC/FCZUIT99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbaCUdewMAbxpK2RtMF4rx7SyzY7OFTCQ1W+a3JPopw=;
 b=OYWX+fajE1HHSaaVGVvPZbyltqcdxHX/GC4ZT5acTLLTWEpO8/3wQE+neUJZfPs9fRU38k8aONXIe0xsC6UD8kMn/+59aWWb3YwCnrGfnmoqhId8vrPQf4QWczVFrOjd1JH97k4Dp1g76NMo/n3AOURoKLz9IoL+g9kGZaKe0+ngzKsgv9XjiqL20TC1/4QU9ZwZF5T2Exv+nzjlPZ8GVZvjjFikjafpI1GJWXT83Ap73bfo41nZ67MR3jQud2hVt5Fg/ZnEBxyVlaj783dEe7Lxj/XLr+XmrHMlOZHTGf4STr9ihVsKEuWe4Q2/h8v+OfaUZdqFBPCisuHh2pcZGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 21:10:02 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 21:10:02 +0000
Date: Mon, 6 Jan 2025 16:09:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-librem5: remove undocument
 property 'extcon' for usb-pd@3f
Message-ID: <Z3xGotP/5GaID323@lizhi-Precision-Tower-5810>
References: <20241023220252.1392585-1-Frank.Li@nxp.com>
 <ZyS/jGUf2C2VlJ4J@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyS/jGUf2C2VlJ4J@dragon>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e9b786-6b31-48c4-4e38-08dd2e967c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oAdLKngpyBEJEevj2k9pESp/zMfJfD9DboPsWN4JTsGntFqZ2NYk0lgrcSix?=
 =?us-ascii?Q?n6dC2HREXxLFG0W6iOBC4dkvCgDtNNi4j45j2KeWcaQ6iIVht5TFX9vUOEgH?=
 =?us-ascii?Q?KkFbAtJTWnOu5XvqyRYrzm7z1QPfZ/CDbe6opkZrMlON0l3KmDKhlF+eMIql?=
 =?us-ascii?Q?Vk23bVhAOilJdPDWj/shICGjWU+KR9ROl7FIKrODzcC4DfeD8fR9jCyTVUKc?=
 =?us-ascii?Q?rsjTVbEJxUUYRbWry0a5B5px2pkvB6YO8wBbuJd4mf/zLYk+Bw+/stDSpI46?=
 =?us-ascii?Q?GXSqtwgsLtPLBUp9OD3UA8N3rBc0WzRe3aofYSSWWr8JOkuABsJ3VZz4BvTR?=
 =?us-ascii?Q?h9WuOTP4dJK1S4OhCLRBeXNdAAmEv5ZmKrGnnUFaMS49Iid+uGKz/wzZZBGg?=
 =?us-ascii?Q?iBtUJSHuwwBmnKzsF6/fWlnchbVIOhVmO9p+8aLDW8zlzYG3H17S+vw7GEZR?=
 =?us-ascii?Q?Zm+XKgEwX6ykOOA/OMv1pHm7KEDpzXYkMmSPN2cTUtQzlodotK9mOefYpfcU?=
 =?us-ascii?Q?ljjZUcPveDuIdaYM0jR7DewwRbeWiJ5hY8pW4mrUYYX47sWyCdufM4F+rR/V?=
 =?us-ascii?Q?OJOVOQE0pBMB6OKftdvqIrVH/Wo53KxG/l3sFDc/JjaS/AFOtQW33Kimj+mS?=
 =?us-ascii?Q?gIlu2BkrE1EYhsm/kje3dFyAFMqwEvkBmdvtwtgbO873TDuOBmeeOIKKQrPp?=
 =?us-ascii?Q?7olt9GOhy9RbxcMycjWTXE53+joAlT2Es8e6vemhPH9aF54/pE3A3jrCPckH?=
 =?us-ascii?Q?eSZBkAs9ycHNTuPtE9wpgpxGsN/eLwWA6nD4v6pVzt6ZrXcn/OFB3Pk+Uax8?=
 =?us-ascii?Q?1SsPXNQN5xwTOxMK5tZ33NjSigyfGF4dP+akxOqZqqOlU3IqL4f6CqtW9RIr?=
 =?us-ascii?Q?zIvPcLadcDTwCTk134L8iu5qlUQ3aqO0KrUyEoUTGDVvebSAUduqPNnL9f84?=
 =?us-ascii?Q?hJlwlMYUGw+SLgXKSip/X/YcCdx3SpzJ4MqRUMIDpgtOOs08H9KYEAaeFmL6?=
 =?us-ascii?Q?/l2mA47vPoiaFxIW4FBp1vDRjCJjwVjLZ6PW0kHtzC+7PRqCBwwhdhMjVkzv?=
 =?us-ascii?Q?fG1YPhKtsPyqWOvmN01RQE+Q59T2tAdyrvMNgZj1KvAPgJ9w2+G2eiQkZO/X?=
 =?us-ascii?Q?rf07u6eeDjbsya5pA2R8rbNgeLX/RMiWRJR1fWvl1MQWGz0JthlFDEXPW+iQ?=
 =?us-ascii?Q?Mqr/r43QztAgzXDeRHtlFXRGhA6FvzhxJqFQaEdLD2JpHNRGyBoZAfOeOJJk?=
 =?us-ascii?Q?Q8Y8b23OZOZz9+WStyAG8fghqvp7D2VVhGKNei0IgK9V90jo7VmsIqvyTEtv?=
 =?us-ascii?Q?FpafL/TmKgsMWhNkqv8+WykuNJ28PS23cDP8p76hS9xSbgSTOYfpfO2pN5xX?=
 =?us-ascii?Q?N6aZbTqdzcdEewRfYlHHK3UDPdZx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yKibkKcRrE7uFyzdsJxrPCCtf4+hcczf/G8j/0bgA5muBzAi2isgOHpuLghJ?=
 =?us-ascii?Q?+Zd3Gxwt86Px8Ylhpd4f7WQfSiDuZbdfY4WvV6McwKO3TNK9AFDBkVYB4LAK?=
 =?us-ascii?Q?BCoVX0L0HH/K83qBKwggXj2FPSZdsOLUcwKXZS+hkR2+lBj7lVDjB9mSqCf1?=
 =?us-ascii?Q?mpjh7kIt8dDCqL1CGjSZjEkLmiWecTUu8HARDJ93gnr6vSMllyICyzaOVMZr?=
 =?us-ascii?Q?RZoALRY47qNbuEtscPhf4jbMrjdeMHQaeVzhzH9SGi7iScHFxJbFt2lwqTqf?=
 =?us-ascii?Q?NQvCNQsDDgQhRsOPgX/cWJNv5Cya/zfjTchjiv+tAPr4rNSH1lB3ki8uHbMx?=
 =?us-ascii?Q?r4iPW+RAwzdpirZTKFFPSHMc7zaa1/ONZRnHzX3HxSEQ3Ot27dAVAEpcfAdI?=
 =?us-ascii?Q?Lw/9kdq6ybToqjtnEfWEoqRfBWzDjWl526U419sRRmNIWSKj/aUlYwEB1JRR?=
 =?us-ascii?Q?OC6kLVG1eOHdZ+NSArAyvCmQzcqJSxtdoKY6j8vsOXdkAEqZZXERsa5/Z9ap?=
 =?us-ascii?Q?p9HxL6zVkKo5ueruIfs4GaIP9mFZFvL743yH0oO1i60fAjtCZg+56kaPglbw?=
 =?us-ascii?Q?px2t0SoRthkizRHoE8nG49Von69+kCUjEqMQwxgG1Zvm50CtbzUZm1umzV7o?=
 =?us-ascii?Q?3lkzkL2NS5wf8ZZFoOm+OnD7LKhX06tKX3/5CD3MZw1R/SYCU1RDBnocHqkm?=
 =?us-ascii?Q?bODYjvhxelKdFGPwGaLqPGDK+OgUBukVusxvzwlqIXkU4rHEYhztQ2VsMFux?=
 =?us-ascii?Q?FRXC7kjEbnXeFX7Ac4v1UhxC26CV2RAQb1vcpGF1yixXh5E0fYXKAuEtHLYV?=
 =?us-ascii?Q?Lum9nsZ1J5VONiYdl8kW0ll55Pyyc7399s/Id17xJo63aZVzr3DRjLAlDPl6?=
 =?us-ascii?Q?HVNcyZ32Mg3XOgt6wR6ZcE7eGD3f0ge3GgOlXgXwEUnNig1vQ91LF7J8uyM7?=
 =?us-ascii?Q?qQ4ATwtIn+Bz5g/LaWm3Aajrc4UDq94W5+/jkZhogAFSCMGf2Dh/DjmjMjkk?=
 =?us-ascii?Q?CdCFRpH2bZ1mlL4M7JG17ccXH3+ngt96ITlukZiLgH0ZdIvffRcwVQv/n+TN?=
 =?us-ascii?Q?SFf+3HMnpmlJz5limV0RdQjHlx7WTcLgXgPJpjqDwEK9mGShiLI2AO02dEiU?=
 =?us-ascii?Q?wuzxJEz0g1+nj7vWY4hkvHAfpx4UtwLm20T3fr/pM1sVcegf7HOw2EFmQF0Y?=
 =?us-ascii?Q?6i2zWdc8gL9wQwX/AEpfAWc2cqY8kYw+poyMERvSje1+vZlwwJHGx49n9vtj?=
 =?us-ascii?Q?YoLkeTihhGL3DY9b37PC7uwsk3iss+8pTidekki3p8bt0Xj8UaEqcds2PKyv?=
 =?us-ascii?Q?VNndqoxR/HPwP3oMwoouIK5p/bminxNaDT0MFzJ8O0b3vU+VBGWImlAX35QD?=
 =?us-ascii?Q?7RFOsubrDdiwEN/fdR347yvUCfX1nURGjYF285rHAz6IbJAlbnie/CEEHtfQ?=
 =?us-ascii?Q?i4nFmgB6MdtRE4hw8zo4zQ5zCRSqFp1EWIFkdXGxeOynVWdM5+SdIn6VhbwG?=
 =?us-ascii?Q?fCXmdxz7K9mu1x69R0nZhcH5cLBy2CCyXXG3lKTEEy3UuuQOOfBnhuSheCBh?=
 =?us-ascii?Q?xXyYwiWeQqxZG6EFQ8WLNcOErYjRvbEclWk+qlBy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e9b786-6b31-48c4-4e38-08dd2e967c5d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:10:02.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFHR6z9m+ggfPWqvPuplGREEj6NMoo1yJ0mCyGvLEF5Mgz1HR2QyzIG/bhWiTmR+nnBYVv4oULSvMWYZZ+8z4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

On Fri, Nov 01, 2024 at 07:46:20PM +0800, Shawn Guo wrote:
> Copy Sebastian for comment if any.
>
> Shawn

Sascha Hauer:

   Do you have comments for this?

Frank

>
> On Wed, Oct 23, 2024 at 06:02:52PM -0400, Frank Li wrote:
> > Remove undocment property 'extcon' for usb-pd@3f to fix below CHECK_DTBS
> > warnings:
> > arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> > index 1b39514d5c12a..61bdb43dec31d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> > @@ -794,7 +794,6 @@ typec_pd: usb-pd@3f {
> >  		interrupt-parent = <&gpio1>;
> >  		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> >  		interrupt-names = "irq";
> > -		extcon = <&usb3_phy0>;
> >  		wakeup-source;
> >
> >  		connector {
> > --
> > 2.34.1
> >
>
