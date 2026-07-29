Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0A331A78
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359888; cv=fail; b=lk/RWPORdnIBKroZSmPPhhggt8MyVzGlIbkOCQQEZBMcCFm+g17l0Hy5TW7Or85nMuqmAPfRPMROvxUnQKxUtp4BpcudcuKwCaKFFLEZhVlovRp27wBaFvFbQ7d1TgT2jYWmiV9wX97XjbbdQDyEEzuap8mCmIbZvcppv+gDzBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359888; c=relaxed/simple;
	bh=RofuUcDB+3SnknatW8ewQBzymmOkPpfKaZoNDBhaEsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JlhVVFHXsjTT1EY1flR+xCeHDy6xf6dfsnquxRzwDoNWMA+6/8m2H0MCRDQhuYNAPGjgjRJDYvzywjh4Srznbvql6xriwed1sbXyktq5+s9pKLUcdBkLRtJ2NqYrkJM7Z6TNkCvJ9b61k3mQF2QpgyJVNX7JRgeWhV4oxGyfaBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h1cUfS9d; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h1cUfS9d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQgXFndxM/LxD6ORmIQpcnQv+I+jppXSRQZV+cnzXAX10OkpYyfGo/Q7jRZ+uSc5hz/FfgLoyirG+5OflhhHXBv4IrxR8ZwmB9Caog0tkImFy7oTT4Qt2NDW0RYnSX4XfOsHaNAvagVMBLxqHaNjy6yviz4Xv4t8cdqqMfCZe3IAoKCBdzRGnAJHATWSvo5hIVdCYnt+kOowvKvJOSGmzTcjEfYgCmfpq6Re+1n/mHqp+tf3m07+Tsk2H9JAycoAwKKnFmuTkhwO6cwZnwl0iQlIbUWYSULeJEuYwKaoPxdC5Ha8aKpt6ehYRjqqtmqmKlTSiS/xishAdGhAAzO4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOTMBEr03zK6M7Dc/YwGcVd5jWZ86XnQV51M8u7a/dI=;
 b=G4T2CsK1XP8aoW9Swc9WYfxjWYfmOdSQ2Ksmv2N1BbK8rTdBnuVE20/rN7TcS3fUFaU66Zb5FpINrSTrpbOCF1Ks0rkWRfwuqvI615P99VQdXpuv8X0+9EI0NC4s+9kJu/Lezhs5Oz36QpB1h7qpyCUb7HR0k7Z35qtuakisrWQ00xk0VU1VGubPXY8dgAr/trZaDl85BV0XfLEXTq07NPSIL3c14gR4hhq9idBiZ5aALcy0tUPdLvbO7U1n0RiWsS9lSeEbsWfu5Y7rrwMLMeS0MTUXADKbPt5NoyNiOg707fIJNPaGakHudXUwW8TlVfspt6wSSCs1nTKUaprgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOTMBEr03zK6M7Dc/YwGcVd5jWZ86XnQV51M8u7a/dI=;
 b=h1cUfS9dQJxhktzVJG9ggcwpeqmY3g/x6BQnQxp2tawAh3IYmg9MXBJ4IQU0X0DSMoY7vDDZgKmEn1IMwSi1BOKzJqrSsv01rhMuNA//q/vKg91XqBTWlWftlT21g4iJsLgAx+pn7etmZtx7gkYs7G48A/gU4XC1R+L4fF4arKJ71utcUafUhYaCFoPnbEbqtFCbNPD74jiN8wMLlaXUWhlTiUUGaP4ARBQXTAtgHB2BOYQxGbnkEkLf3fiaNspez0d5VXOmTQm65IAbbReppvuEyBSC/X41zwArjGNOKobvss/iTAbKm1yDYEgy1JkyKHKe1jNR516ZN0nKLXeiYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Wed, 29 Jul
 2026 21:18:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:18:03 +0000
Date: Wed, 29 Jul 2026 16:17:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Message-ID: <ampuAiIUR-1FUxV-@SMW015318>
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
 <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
 <amojcXE2di_lwB2v@SMW015318>
 <114bc96c-459b-471c-8852-36309cca10b6@nabladev.com>
 <ampkUinVz4s2sMEl@lizhi-Precision-Tower-5810>
 <03143ba3-e589-42b4-9221-59d9258e7d21@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03143ba3-e589-42b4-9221-59d9258e7d21@nabladev.com>
X-ClientProxiedBy: PH8PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c0348f-8207-4797-54a4-08deedb6dfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dCXyJI25RddtNfaY7vZadlfNvqeYilsD0ytSg3rl8XwbJ48qkx9gTr0J34W+dPYkJlviGCoxT6g29/3go1KxZvHTIM2Cq+2sWCYtwmcyp085QXJMGQxGayHdW2pnasrWGbZ71Dbzz65e8kj20vfPEob7XqoxHTQUJM9KMuzodojRSdUz07nN7zt6QRqgxPFNIIm/Ph0KQLyZ9346QNlxFuOrtJTHyN0ooGinF5gMpb47sZLw5EJU3cCst8RyA3i3bo4XjEkuKIPc0JIw1sqopTQ7IezKG96xMHxujmBZvtsrpsV4yj3KseZvhHVqAwGDXojFdnovGVaynlHkzqhyz7dcDPkFUg/tSHKZBKntBN5RsbfjtuOkylmbYcs2wKBlsjWFSqmy48w7IcAQknn+Zr7AtYxzW3Gjgk8gH8dZFQnGsTVu07gg9raBolguEsy8V7TQroZ5Bq9MDU4urT/uYEFRxG/HWDpH5t9rVrZ19YJzR70en9tKhdtU7xv92BVnDBsSM4qfys3AnnQVuAGW8gHNNsutZ+KkXX57nz5I3bAZoYxNQkUIvNX4hiMmevajXVkA47kO3Qy3+XlFtmIAu3Nws6V0Pa6oWxUP+E32xPxy3YhmBswTC95CLJb1vt9++20W6DIIQWKmS76vtYhwxMHSOk4cPyUfTpdNQ0H1EJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Z+dxfdogQn1oC7u5BwINxYppushNjNknlvFbiiAykHJLfTzCpfjZMIDLXku?=
 =?us-ascii?Q?lt9M2TG2E6Snk4BeSJKvIqD2PxZlFMicHoA9xM3d7IPR//s8qlIghibh8ExQ?=
 =?us-ascii?Q?ji6JXBr8St2QLN3gtVgFXwJ8LZfReFNsSbo7tRrMIc4ZrvFAQfceMyN92BrS?=
 =?us-ascii?Q?SwgFdFW3DoFN1NqEaFsNPx9DUbuCMch1nMqp93G7VcU1FzlBedZ99rEkTamk?=
 =?us-ascii?Q?h5kg/mWEcjzDqjzKnsj5R1pEIisO65JW7E5gYBtBk8Er+54NnMNtORtHj5nj?=
 =?us-ascii?Q?SPvlNRBZPWRtYbxzO4704kAttLRCCK1YRaDPKx52ZmxYEj7IX+1ThlfpA3Wk?=
 =?us-ascii?Q?gJ5wENT7pH0JrYX4MK2dMjQqRnuasdQzhlOXSkfETeUeIot8MyR3Zf1i2nZC?=
 =?us-ascii?Q?c5YvCjRBvvWHPqErOEqswD0WHNWGbuhKVNhG/20GS3/I+Hgp7JF9tgHdyUvn?=
 =?us-ascii?Q?e/Tc6dVDvPKixmoKj5vgWPwqEVNHBtyQBQYDNRnw+AWdB8c6TOTIsb3Dg7//?=
 =?us-ascii?Q?OF+bojp3WxpmWmbBTl1twF1ZuGE7XqxwKMGMF68nlQu+4XPtcsY/HBq7Djdh?=
 =?us-ascii?Q?Yvn/G7ljBAzTARaPzBn33WHJzlp8STZPCZoab4RpTrsoLqgOLqdxF9sc822l?=
 =?us-ascii?Q?9dbQN/jMXpfI3M5gliGjsVW6sIE36ugnbTPu24LGL7m82ldUstOx6EWqlzAQ?=
 =?us-ascii?Q?oNLINeTnHMVFDrkqlPAqGGx6IfzUfnM8Fhzr/Ktry7re7w7pb/eAa3BZHhwS?=
 =?us-ascii?Q?cUNzlZ6HUocXpe/nO1Kz13JyQ3DNRnyA9WQDDWG7dp49pC0CIsgwGJ8/jm0T?=
 =?us-ascii?Q?rbqRCtSx0YhsmvuDQ21aJuS/8JSKQ92+qZRfQaz+dHAwPxTQW2xIglJawQkm?=
 =?us-ascii?Q?zP95k6fWs7jRBxwWQipZdPjBBB1lAVDdAK6z/bDJWEtU/0ON6y+GRNok8IwG?=
 =?us-ascii?Q?Ag8MByqCUHai6JWf6n2RkrRiKwuUH9yROg180Onk1nnUBs6SIvvOft7QmqGN?=
 =?us-ascii?Q?qHslsqKVFhFeS781Wkr0CHJmA4bKdEBcy+wtkDchNl0Y4elziEjBDvnA+Pzc?=
 =?us-ascii?Q?Z70WCLQA0kK9+84K6AUiXm9ZN7KnP8veEvo8M4w7TzD1zico8Tat/rqGM95d?=
 =?us-ascii?Q?7UX+gABfWXJokPKYR97ZeDa+0eE6e3WPdp3uGKq15gwu4VvdwgnWMe7UmJUy?=
 =?us-ascii?Q?ujl6esy6umNHgLjDKhjK1KloBiRc4Eu11t+5PiDZ/pdv5O7GN4hBaVQmTrEZ?=
 =?us-ascii?Q?rFASUQpY33o6taG+teUYYxmAQL8w+6WUHv2uLunN/hVh0ObAdGJjQIODZphV?=
 =?us-ascii?Q?4ldyQpOlFH3KmVmjNpNxpmJ1P/QYJuhYsd85rnWSeOwBfmje5RQxB6YDb2DA?=
 =?us-ascii?Q?jlv3cffJIRiVqxRvOqOVRIuWp5P3jtM2/WOgpoMbxRaR9AarAqpy6by8vM5A?=
 =?us-ascii?Q?k90/3MMI8h4jxUefNfHf63Rj19SSPP18xNU2P8+NqXyeQpdX36ZjfSVc8v5k?=
 =?us-ascii?Q?i2eWVWZJ1yX7qGP/msvLliq6/EtZWpQFA5vA81pXV/vya9+a0VkrrqQ3GgxW?=
 =?us-ascii?Q?DCy976R5TnF9MWQHSxFwPJZd58JPwPmQktlDxrjCYfJbpANdkdhIfcVDxMWs?=
 =?us-ascii?Q?MqyDh3CZUU4yXNeOWPzDGFhzKeMGTXTJYJYiJIB5Jr9JcAwAjktJwV/ToNOv?=
 =?us-ascii?Q?YOxlQpE1BbOOZGMNxAKrFuuMTvT+Gx/N0HVb9mNLubg9Kfr89a9r3G6I9akk?=
 =?us-ascii?Q?+ei8Iv5wJ9yAVAYbKLlGgyvs/wo1BEuiViuCt5ZKHO5yRyUr05Mk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c0348f-8207-4797-54a4-08deedb6dfd4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:18:03.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slhuGiOsuEUxHpazbVynk4f12Y3S2LJnwvIgl+x1TbjDhrkP22sl7IcLodWiEs/fmEy/jvvqQ5fOdkaSccSBDGtnmpbT0Igw8jQr3Lu+2Mpn0Z2Zp4CuFXhjEF3mXF0F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917

On Wed, Jul 29, 2026 at 11:14:08PM +0200, Marek Vasut wrote:
> On 7/29/26 10:36 PM, Frank Li wrote:
> > On Wed, Jul 29, 2026 at 06:49:03PM +0200, Marek Vasut wrote:
> > > On 7/29/26 5:59 PM, Frank Li wrote:
> > > > On Wed, Jul 29, 2026 at 05:50:21PM +0200, Marek Vasut wrote:
> > > > > On 7/29/26 5:30 PM, Frank Li wrote:
> > > > > > On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > > > From: Frank Li <Frank.Li@nxp.com>
> > > > > > >
> > > > > > >
> > > > > > > On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
> > > > > > > > Add DT label to SPBA5 bus for usage in board DTs.
> > > > > > > > No functional change.
> > > > > > >
> > > > > > > Applied, thanks!
> > > > > > >
> > > > > > > [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
> > > > > > >          commit: 697f6889aa50996de067a8d170323535570052ad
> > > > > > > [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: 3eacea24d258ff5169d84a419b07cb5828e91718
> > > > > > > [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
> > > > > > > [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: cfdee13eba802665ecd8751fefa754a759f414c4
> > > > > > > [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
> > > > > > > [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: dca8d10e97bd121494106f54f4577291a9bb0f13
> > > > > > > [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > >          commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
> > > > > >
> > > > > > Sorry, I have to drop these because met build error
> > > > > >
> > > > > > Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
> > > > > >
> > > > > > Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
> > > > > > make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
> > > > > > make[3]: *** Waiting for unfinished jobs....
> > > > > > make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
> > > > > > make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
> > > > > > make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
> > > > > How can I reproduce this build error ?
> > > >
> > > > Apply patch base on git@gitolite.kernel.org:pub/scm/linux/kernel/git/frank.li/linux imx/dt64 branch
> > > >
> > > > make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 dtbs
> > > It seems to work fine:
> > >
> > > $ git remote get-url frank
> > > https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
> > >
> > > $ git reset --hard frank/imx/dt64
> > > HEAD is now at eba4724641990 arm64: dts: imx95: Add dma, intr, aer and pme
> > > interrupts for PCIe
> > >
> > > # https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727195244.78199-1-marex@nabladev.com/
> > >    -> series
> > > $ git am v6-1-7-arm64-dts-imx8mp-Add-DT-label-to-SPBA5-bus.patch
> > > Applying: arm64: dts: imx8mp: Add DT label to SPBA5 bus
> > > Applying: arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M
> > > Mini and Plus eDM SBC
> > > Applying: arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul
> > > i.MX8M Mini and Plus eDM SBC
> > > Applying: arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M
> > > Mini and Plus eDM SBC
> > > Applying: arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini
> > > and Plus eDM SBC
> > > Applying: arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M
> > > Mini and Plus eDM SBC
> > > Applying: arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul
> > > i.MX8M Mini and Plus eDM SBC
> > >
> > > $ git clean -fqdx
> > > $ export CROSS_COMPILE=aarch64-linux-gnu-
> > > $ make defconfig
> > > $ make -j8 dtbs 2>&1 | tee /tmp/dt.log
> >
> > Missed
> >
> > DTC_FLAGS_imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01 := -@
> >
> > did you set global env variable add -@ to export all symbal?
> Sure, I always have DTC_FLAGS = " -@" set . Do you want that in Makefile for
> those various DTOs ?

Yes, we need make sure kernel pass build by other people.

Frank
