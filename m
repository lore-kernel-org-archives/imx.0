Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA06A29D26B
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361415; cv=fail; b=bnVs1GQTb/v00c9CkoGQQnhXmwC//8lCmmIUab7oarSDDFlxFaRKcfHDvpswDSkgmjYeQuOKpHaIEqrzn/ELavlm2b5OGJmY/4+bPGhVhJyW28inMKJOLJsIOghi3dRM41l9m3guR1bUorAEc+ivOhi1kF7A900x+H6B97xkMXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361415; c=relaxed/simple;
	bh=9ZOuLJEUjvCnwJzTO8ZLWExwFez9fyrXXRIvaAoVjTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QoffuH8VlVI5dG6rKb1JQttpJeF4vG8tdOgVFq4oM9teqJTirCIpcGb9EIooymOJYcRrJiQ9JfmMk9zbX09AlrW22tmgm6DweXkg68y5gfd6hLBknawB91FlH4uQWH9YL5NPNZPeRZ42smNNPTjTO9WHd+xGfOP5NtDVfoJroyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lki1MhTV; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lki1MhTV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0CXOsQC8AT3VnHS1qCTqf03sszyu3JhXLxfHZHZupwFaM+54XlLG3yKyQgyTxjCClu7SVvM1X+eqKc+aVAdFMZ3Txta52wPmC9AX/nVuGl+jdXev/ASCKcXBW3h8rv6tLWqAbDuunRz+Lt43edrav9radga1tkG3pl5r6xVr7U6tY4vzX9VWZ+QfBptvcH2bJFQpOfJ4G91vqfcCtTi4dA9k30Kx8CzBljIWSCtCLnUDJKhPRg3NE/o6GvYmQEyqIh1OIskUHW1qUQJQId3axstq3nMlOA7XqhzpnDgcRHDeUQrI7Rrd6a+32XRgHJp0ClMd/vLloXp77SVr9+JNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YA/5nlBhBYVVLIkO4yZpgtpv04g9RnofQ8jESFExo8=;
 b=BW86hByPj4fJlUWsk9qhmClrpq4Uq2xseoqk7EaWBitm9FD/5PxRsueNYxGMdqpDmSDWIjZcln529a5Y2Fg/HN/010ytlFlaqVxYySfzkzhVyNwasgtVvmbnMtTcWscRazMxgSdloTxUJN60I8pIjm8iaZ9bL4puIxqrMqGAn9cHcnhVXcLK73cnD13SGRMnpa488MkS49X/wk486S7ZgeulAOjnfDTH5mjeXpScRh/yiTBq9oybXBZcy4cmj5eLLLF97bisJd+B6Se1Gx9oDkyxZjlVdHSPAVAHcmYx77MMuKcN9mO52UvtVZl4zZdypSvFxVWRy2ZH9hhqRtvbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YA/5nlBhBYVVLIkO4yZpgtpv04g9RnofQ8jESFExo8=;
 b=lki1MhTVIT3/PKhcDQduIrhxrhFJd3CZ9/x7PWP3PdA0EBzDZmgqq2oxjVCr5wf9YIy8ODWO/8WFBB2C2GqhomX7KcrGdlyN1NE7vy9VbCcb6+3hN0Q5TI6PjofzGLG0EBh6v964h5FeVGN6BWh1EpKTirz7kFVx+nwo6/3J5BDOqaGkqNZpwr+Qml8vjfDcLTL2im/vuan0TieAv9X8ytoZMRyF+UQXfNX4Z+2j+Jn7byRpVZQ/urrrl27rgHBD/EM6dU8G4Axvi+od5n/eMX2ch1dEjj1EivoqE8TKuk3W0bhD+TCShI/R20Qw+uhq8iVHlMSAsTlVA8KNUVn85w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by GV2PR04MB12362.eurprd04.prod.outlook.com (2603:10a6:150:30b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 00:23:30 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 00:23:25 +0000
Date: Fri, 13 Mar 2026 08:24:55 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: lgirdwood@gmail.com, broonie@kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: fp9931: Fix error handling for optional
 regulator
Message-ID: <20260313002455.GA1440672@shlinux88>
References: <20260312040148.GA4007088@shlinux88>
 <20260312185854.75e7a7be@kemnade.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312185854.75e7a7be@kemnade.info>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|GV2PR04MB12362:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf507f5-fb4f-41ce-1330-08de8096be0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rZVxGH7rC2FKwIwoyH5FN1Z1K208zTt6ggLjbZG6yGGcodCdJjuW8PQqxlaSBkNmWlIZTxYIaU9VBIL2QMULj4SDHZBReAfob/Mg2+wPP1z2znI8tIUKFGn9QUzzBwNp3anS8kzSAemIIDej9W446RC1OBQoQHU12/6XqnbJ/VhG1kpyoqoAnI/I3yV7rOJkuvV1QDUCMxF8gY5sijIKxQt9rER9VvmwO9esU+PbZUXebVBDAqAxOvwXfkWAo9hXGZLzvkC/SpygyR3lE4kvIxHzjU6p6JGj/RgzhjbPWiU4bovLH9VJrmdIyubxVYq8kDypfwN27bf4RssBHA9Cog4aROGp5RFBvH6imUDUO982t7l76HQgyCxmi5PLHXJ85tZmDLyGFFV5s9sunMaweZsGhno46Y1kes7sKjwGD8kiYSmmqKmwppDJod3+4r7uTrl2VqEbheJmk7V3nVY27oxrRtC5RdjPM094cQssDPGjilbQRY95KWhvyz/aV5UXyLNRTC2shpV84e3XlnYmrKe+EIPWOvwF9Gltm/D1hW91mT2nl4HDDgQy90/sEwfFTSVDyd5BDDPwljfp43knQ7TOxp3gEBGn9hB2H9yvXWpgL3hKsid3xozCJZ4aXrglHtD3g/tEx74Tq4JCDtasEOcUc/mNxkqN2RhhYsYgbHklsHHrrpeMTH4tG2bePUQ6opdwd+uJ3i1smNwg0U2rTzWn3wn+6cPCkGsHE0Ro558tqKKBWafN9RkV0oPRPa/wV4VnnLTEfoOmoZaXuqRzT4/YbSuG+bShKwThIfUMlFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2j955dzEIcyQSW6BlYxJ0oO/tMNrg1Kg3QEy2qzfTQMKi4W/pvBrHZDDujn6?=
 =?us-ascii?Q?Ze0htsq/LaT+GO2QmJYOSAmbC67712qhwI5bF6hlqnfleH5UdAAVAu7ZVkIS?=
 =?us-ascii?Q?iHAsP/gE5UeKoW/f7JjSwBwHXz2xGDI4sYMcZUQ2kvXW/70XeFqC06F6yN35?=
 =?us-ascii?Q?ebWH5d+Aj8EaZ2F6kpD5aYpoP2ClHt8ZXl0Zbf2TpWeXafg0lmyhX1uhny1T?=
 =?us-ascii?Q?H0yVe861Vc8VymFwgAiHKJMlkhImkS6AsOVN6MmJzzfWV0Gu5oeAfNPwsfJv?=
 =?us-ascii?Q?EOh8kHuoRsIRRiid8+4xsGgJU0SIVeKNFmT+ogx4mHwjuFALr8GMApI6j68v?=
 =?us-ascii?Q?agwm1CfLFx3DTx69Ch32SO9Aq0MVfpheoaJlLijdaHCCRJnEo0qfeYII4dZ2?=
 =?us-ascii?Q?r9bTMbX1tv0mLP6aRj2vFBTzfn0WFkg30Vvwk63OiJ7reQAaHBBwYQmUNdD6?=
 =?us-ascii?Q?plOveQAvtU+zL/c2r1soCkFPcDAF6gjBkr8Glk0tqT6Gz5aTgWFPfTWa82/f?=
 =?us-ascii?Q?hWIzWXFA/q0GKLvuY8jWYh1eCrsts0KyrjTw3ZAupQuV9spwy+v6rMp8/RFV?=
 =?us-ascii?Q?uBQLAMrPCLxgKZAT/UrPQZaegFaYNSktnbW3atB6H/kCoUfRSP8hDHyhIcw3?=
 =?us-ascii?Q?/pSip7H1aCTh9KCzGyNwN+GmlJ0AMZwyQHTufZICmy4UY9bFZG5zQE5dxroc?=
 =?us-ascii?Q?+SiCyrM4ZCWFfh3TIJcN8lxPhzscZBoZA37Tw2H22KVJ3Z7CIgz8dNumGf78?=
 =?us-ascii?Q?AuvlT83K6QiHuc7qLxIpcO10vWVYoZHEq/5eORw7nhGYOucb9M66bBCViBM4?=
 =?us-ascii?Q?gzHeuJfksJHygcn3zaQOZeoYQ+sN1kS1xIr0lqLt2vzPA8uJw+ti0sIQa3wb?=
 =?us-ascii?Q?v03VmQ38/Q5jswnwWM/5TjlqS9s+gelL5PV9ihG3OMp4ZQBRYW2Zh7AWVqM4?=
 =?us-ascii?Q?XojddQhCZbhlvZoctUXNVLCuiH4dXmLBVtZ35hPfLk/b0++oGCY1Eu6PfD0j?=
 =?us-ascii?Q?Oi4eSU5pKYhaIcbjIqxSBvp3bIlCV5mG4Ndhajq81hzLvh9ylEUcB/pjZeNK?=
 =?us-ascii?Q?XWWWxVjkU8XkZUUNr2y1dHxwfqXcMfzzq1cez5JKObivmIcDQdo849M+2i5c?=
 =?us-ascii?Q?50//RdQO0Lle4GxXHo23/XvHQXwdTFqjt3TpWdCGIBy4Cqo3cYTiTy+VX1Qn?=
 =?us-ascii?Q?9TT5R2EsLnD8YnEahSWsifK8LmFQ6dIIAozZhx3VlsTd//IEijYk2cVvTIes?=
 =?us-ascii?Q?UDFPuaUDiO2zZ7x/CfxKrWn9CCGQCLqlxIPyxQjrsOm1KetVkED+q+QKZhF6?=
 =?us-ascii?Q?PCkWuHbFbPnHrKqWR/LTUfKRrsrersjDyk38ESrHtuFRvTqezqtVSNt/1Zem?=
 =?us-ascii?Q?7UEe6rPrLpZ/dQC1PGwe70aSu+pwEQBuQH+nQVvvgPPapyDCTRVNN3DRJngn?=
 =?us-ascii?Q?K98VG9DhXZFKvV6f5qQO4OUiQEmATDpBAXSwQL2eDyYvCRrv/qYjdlfNtSpm?=
 =?us-ascii?Q?/SAk4hc4p0PZWit1ZW1C50SklwTUAmj8hvVd0ufVA+7cYKV9eQ6ppqpiQxIa?=
 =?us-ascii?Q?S3SlZ4kr6bYyFvDl5F6Cg8JUzTHFO569HrHQf5HpLYdPqfDUkPGWL04gPM9V?=
 =?us-ascii?Q?9WnyHps1R0hT5kGKVrpxOddTw86MuhIfCnBnWz35bsWWuEJa0D5LNNK4xkES?=
 =?us-ascii?Q?CuUBmBAHwH3Om3y1dTKTwsCJu2gSNz264C37Bq3WzDbmTRyLcFCkJsPncQGT?=
 =?us-ascii?Q?7qaZsha/ew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf507f5-fb4f-41ce-1330-08de8096be0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:23:25.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beBIDQRg1fq7FlnU/CHKUvnJut8ubqWs2I9AydcWIzdI8i9Q17UdBaJt0TU0+vgLsvhuTgOEdzKo5C37UYkEFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12362

On Thu, Mar 12, 2026 at 06:58:54PM +0100, Andreas Kemnade wrote:
> On Thu, 12 Mar 2026 12:01:48 +0800
> Robby Cai <robby.cai@nxp.com> wrote:
> 
> > If "vin" reg does not exist in the device tree, the regulator framework
> > returns -ENODEV, which is normal for an optional supply. But the current
> > code treats -ENODEV as a fatal error, causing the driver probe to fail.
> > This patch fixes that by handling -ENODEV correctly for optional regulator.
> > 
> > Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  drivers/regulator/fp9931.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> > index 7fbcc6327cc63..fa7f32adfb666 100644
> > --- a/drivers/regulator/fp9931.c
> > +++ b/drivers/regulator/fp9931.c
> > @@ -448,9 +448,13 @@ static int fp9931_probe(struct i2c_client *client)
> >  				     "failed to allocate regmap!\n");
> >  
> >  	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
> 
> looking at that thing again. I think I have abused the optional api.
> Of course this chip needs a supply. It may be hardwired so something
> not switchable. But that needs to be wired to something... So I think
> rather the _optional is wrong here.
> 
> Regards,
> Andreas

Thanks for the review. That's right. I'll send out new patch for review.

Regards,
Robby
