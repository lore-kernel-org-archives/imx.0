Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F1299927
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765815409; cv=fail; b=ht9hB3C5ap3gKwGEXWJndti09iLNU/Bn/vVOxf/fh6NhskLcTiAxX3wyoxpTnUrBzlzeI4BmAeECMogZ26wxRe7+Xf56PQDOsCQ5cPC6ANxTTBV0FQmTENlGHoMKs/p6tMAB8ySXoUpspNdiNdlQqznxbVZsF9lCDcACV2UCcn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765815409; c=relaxed/simple;
	bh=ZzyODmltAkiJ/1O4okP5N9A2+uWMnhAqQza5tNOWNyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A/UmAFKJLYbFnapbUCwk2BH28oilDBJGdSFCOrdMXPEaO80mKqaWlcTxSQ/iNV9Y+/5aX2ykrZ4O4GbS8eR+fm2DE3PAjhYhlOtTzNTsJeZOaA2VPvY7KqTK9iAAbDUTmeoCNj2m/FPizr1ScEYiFmA9yqKxC+N1LR8skBazJoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FVTJ9L/E reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FVTJ9L/E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3w6MCCdcDc45HJz407ZN81sFjwQtjz8EsYIfnR5fQliA5m8985T1vTdR+8TcRCMT6DNJuz2OZmVPTjg5yHg7LsjjsNQeSDUz3BhFRPZbaSk2FiAk/1h2CelVbeWar3x1h7btniJXifCUUKLpBDTpO2sRzxUlmNV6TUellP2n3Qk/kuEtoLNPPzqIfpXMwQBkTYTcd72J7+z3u9BM0qMclFUz0seJREJcbfqbgluZ0zIxPJFQn90/AQcEtVPql8z6yVAPJ4tY28fYH5/Cq95B2GM8sS/s9xm58qXoFY3+oLDrUHe01KRi+1LwBoOrRANglO+OAJ4iKg2GjDOm6rK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0NzkHN3eq4J/qcEw6vLP+X96N0TduYP1BXb1w0JnrA=;
 b=sTtJ2LUhKQtYKBtOB0sitrYZv6zLF5UqyjwxJb7JOFxWHixV8BzaRbVYvjJUyqbr/x+DB+FFW+vTDWx79edNWjP+0kA2U+WhrnwzKd03Vg4hl4L+mUdqphPEGWZ7glweMZFZh//wCf+kp8tmxB1cp3+KpqCJ3QCYngQqDgOHKw7aEh8Kx0nkHHPb5ef5GEtOhf/Uo7YNynjFwIrN5K2ILkEz+agmzkRvSz7wNVPG54fSKGKY7L5HAzr24Doq8+UdPGg0fzed7H3QlhpIVFY99zYckhn4v+3nPxx3o4K/tjwaqIoWO5GE9ajz8ORvmyoACE6nTiEWKNX2oDUXTLH5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0NzkHN3eq4J/qcEw6vLP+X96N0TduYP1BXb1w0JnrA=;
 b=FVTJ9L/Evs8X3HzGsh1la4NUBmvgbWfFg+POj4eKQJG6L3DupmROuMzb8UT2blD/M9iNoXAhRrDEIFWJUfxgwVY41FpTa24j/uhrGo8HfpOidrF2R4PQwynKX+gLBLZbxym0cvO0Izuc0SBOMEbYGauQfNkX8lGKdbk9tzRfoQcrI3WxyxX4gVGlNZ4cW0DCZd4h8+x2EA2axJebbEyVkE1mIhzd6pHwalHvqGoKIdj8/Tt32ZGzMH8xA0vvS2RsPd8HGqYLU19f8o6/gpw9IoYJSpgXOiUbWozpNm1AHGJD0vfA20YYeuo3UD0Vdk8N6OBVSdfSJte7aMleLJ/79w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10804.eurprd04.prod.outlook.com (2603:10a6:150:214::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:16:43 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:16:43 +0000
Date: Mon, 15 Dec 2025 11:16:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document
 address-cells
Message-ID: <aUA0Y6mycZVX7cXD@lizhi-Precision-Tower-5810>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
 <aTxKqPqGdiHllLo6@lizhi-Precision-Tower-5810>
 <12807757.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12807757.O9o76ZdvQC@steina-w>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8e9224-fb7a-45f9-9e2d-08de3bf55665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?3vBk0nTMqFhQedh15Tb0wvX6ZbaQPK6Kq8FfYt06ZxxC90BzMOYsIeVhp4?=
 =?iso-8859-1?Q?qYHrxCOmBJgcLZl5vwCEpz9EecopuiN4sz0eKplkwLZrsFnEjCcg+0p972?=
 =?iso-8859-1?Q?QOuPES1s5YcgpFINShPmEqSh3hWV1hdYUyId3wBiHNmiy8tc8FbH6kbfFC?=
 =?iso-8859-1?Q?Bn1sLVwO/jLG6plOugiMLPQr9LjSGRPyykICWR4uXcDNC59jF70dHQSR0m?=
 =?iso-8859-1?Q?30HFR5rPXD0SNepKawfPJJQvS6vkOCo4k6Hjr0p9ddmQ7KbPKhnU/zvtRx?=
 =?iso-8859-1?Q?N4eiStF7hPfafyIO0YQJJge2bmS6uTyTxXnyeZYp0BLjyTP5o9k4mhAj70?=
 =?iso-8859-1?Q?hGxbM14oAr3on6PIrZhdeF/eCOGUFWlZrFHUSAYnePU3YO8iB14h80TQ0a?=
 =?iso-8859-1?Q?vUslDKvnIai1STlhQTu+BYpxcmn+GcHd+2n3P72x4Zf6wv5T+0HdmpB9aN?=
 =?iso-8859-1?Q?qh3vdhiZn041/ir2ePxhczzRN/Oxkr2hzLIKjtMEv4S3nH12E8+HXJmVPs?=
 =?iso-8859-1?Q?0FpuYGLf7/6Fett2zTyNbRYW/eTrMbghiDnJbeDq3AVdZcUK8Xw/tt4EZF?=
 =?iso-8859-1?Q?U7Q886hZdC4DXC8m8brgkTo75MMuEqZitvFAHv6q13cqaxI94VyhmlkZip?=
 =?iso-8859-1?Q?4s36s5Uq1yXXsWhxcTOEB7A4hZXQcGh1J/YvimymqnWAOZn2LZOAvZIS2y?=
 =?iso-8859-1?Q?TPlg8MeT0CSlvymGZddpJk6z24UPtCkjJoZ7XlMXCg0Pkz/nQvyYHSIAyH?=
 =?iso-8859-1?Q?VZnL3mS9yoRkOxymRIosKBpcP6I8q1uhQkoYQlRITT1yT6hy2K/962NDav?=
 =?iso-8859-1?Q?gibPzRUA9ncg0TXhtJAemXlWFsKqy2Xkweq/ZKSITnHmkJJDuRzDiUoM+V?=
 =?iso-8859-1?Q?h3XXJ2YFceSwh6jl1GsIUyiybSz0JGDslc1bdWMxvf1W/+SwiByw3gwDvb?=
 =?iso-8859-1?Q?NqTnvxGEReqQib6nwimjKp+5X58w+C8gw4ba9Tqy+S/TO+ruo5Rw0ee7eP?=
 =?iso-8859-1?Q?eIxISn85/D28bgmSMjypttIMQN2SlHVi+NfPrEBEj5p7ZCQzFwHiT2xsk8?=
 =?iso-8859-1?Q?t2oO/YUhgbfcTB3Yvuio6GX0iZJAWXYndkmCA1ipfzoNp3kFHAsKVVrDUp?=
 =?iso-8859-1?Q?WuAP3ftbKdvbpLuLUASBR36zO0RE1kadvdIcfAmRzajQqQfT/BO5nTBuno?=
 =?iso-8859-1?Q?gNtMuU2fmIZGs0ziNNMZ4DOEuqCs4yTXHBU79ZW2VuTTfHiMJmcM2MVUpA?=
 =?iso-8859-1?Q?H5d8C95CGi3ThJElJa56PmtmdF+N7an8oqtE+0rpy1+4X1KyHJhT/Zucak?=
 =?iso-8859-1?Q?+9T2zaXbkJ2UTQpJL2mItBfh32XM2km6LJryCIO8JFxMYYxY2gICdAHhY9?=
 =?iso-8859-1?Q?XweEXiyrrd7jKuv4MsMysiBLxSAqWflHbGOF7mjpYH/wBAa9o7p/6UL4OH?=
 =?iso-8859-1?Q?IjG83D5ion5XxIpSmoy0j0j2Qbqk4fOKNs1DNMQuD+AR67NSK1fML+9D1h?=
 =?iso-8859-1?Q?uKQTwphMsyKoOl/MHi3VuIG5V64TFgleucXXn0CLzG7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ntTAmiYCMexUAjeXbzSscQKr9CFQHKCRh7rZlv36Nm+U4oGswXNJbO+sON?=
 =?iso-8859-1?Q?y+1M7nSO4iw2iXv4zequ2alF3l2gDm/B7dFL5sJoZnN8t6Ji1Lwcilhdc7?=
 =?iso-8859-1?Q?IUm54zLcEGzbsM8mmdKxbyH/V8lQkWUD4/9wG25DihkVRwsTk7Jf0IDNp3?=
 =?iso-8859-1?Q?79oPEDJpMyo6wtzszeqw4rK8NBwVfLlLkJRBj12LfqMR84pLBwo41BOQpV?=
 =?iso-8859-1?Q?5BiFufbFt3cl5Q1lsf2Y5+wGLyvqui3Sqoh47JgeTAouSshbuPNq//Pxyk?=
 =?iso-8859-1?Q?fZIvwdiFlDIbnhqinl5oaJzQJYV2moN69vcuGp6gYk/IOhlWGClAfoNWQN?=
 =?iso-8859-1?Q?UlDM/svjA5haHM4FMHTeivJygmlOKuokcV0fy5MrTR+3YJl++OagUqerwK?=
 =?iso-8859-1?Q?RYPl6V3Caa9NIfqG3X8Cz8er5zHcoPnSY9Cbjlrk1GYL2D6l5xo/0m1WK0?=
 =?iso-8859-1?Q?IBSGyEHTfJRTApRVPf8sHoIZdeI5S/Jq10+5GsmiYaUcUJ/t/q1nwzuieB?=
 =?iso-8859-1?Q?TMBMLAerlPFmzMbYSWtss9W8PtwxpCjkYDw5hw1JGrWcnNdsmAqiHuEqQP?=
 =?iso-8859-1?Q?Um88n41IIkIZ4xdX5KSLZyTPMkaq1Tf50DIQd5o9OHrIZd4VWGuMQGRFhG?=
 =?iso-8859-1?Q?c8hF3w+eI3S8VjzUjCfVDFU3/h4u0lKjL8dFhRs7kNAhRezjelOUgitwh2?=
 =?iso-8859-1?Q?YTpm/N5kWlFw1AVHYhsk/AacSTPS2BMFPGA29TCtyvlNBjJyg4akU3V4fm?=
 =?iso-8859-1?Q?xjpFpFJksNx2iklAfS3M+qPM9NzBzdI09KYhwZVxylyjtmyIAi9e82G9q+?=
 =?iso-8859-1?Q?crJX3wJKbN0BeUcGJO3RCrwNU1+PD6IuKLMSUOPjSbfcj1Fi5Jv9TQthzB?=
 =?iso-8859-1?Q?1p3oKrAM2nmMLSpRK3xE61SIW66jwTa3OyE4IsyW/BAzmX56yTwrgOVzNx?=
 =?iso-8859-1?Q?30s8JX2KLVTqHN7/TSKcVDJ7WU7MuUD3GamNnFPB/uZexpvlfV0HxKPUsH?=
 =?iso-8859-1?Q?nvj8M6D6vhvLuDaRr/ngheMIFw2ys949nbcQ7RVQzrpXEPCsPL9TkSok74?=
 =?iso-8859-1?Q?xYIvlKUe0N60UyhZSV5uG0iFPntGYfWAL1WoSaQ4wCT0A3hSIIh+ajPkDi?=
 =?iso-8859-1?Q?9PPxMTyfM36r6pfgYb54WFbIb/tDmgmKDLtTzqoNFFWiN2PfWmJAfQ4xfX?=
 =?iso-8859-1?Q?zwyR7EJQZs+WLuPyKFU9GylpdtZOEgnzoExyJRUxa3AWr2iTwCbbvmBRZp?=
 =?iso-8859-1?Q?Jd11hgtJg3btirWhXSmkg4Q8LvyK7x2Uspy3g2GFACsfUjrvvT+Kp2QVbO?=
 =?iso-8859-1?Q?qaFVub71lhFe29rmQzEKA7BNXmfDs14Zrt7PpLe1iu2t7z69jAsgZ4/XIQ?=
 =?iso-8859-1?Q?HPVsRfP/dzfoyacBxNuwqXM4Cl6393SJfYkpI8eS/GgiLflF3E8lpf+nBb?=
 =?iso-8859-1?Q?bZjveV04ftSkzFn+ho6cD8ySiqk0payhgAH5+UOt8GNaF8rtkGCLOgyPL3?=
 =?iso-8859-1?Q?d/SEgjHU2lR5ztOQ3/2JamfvI9nBzd4jguo/cfwQtWZWhwyuguI30+W8hw?=
 =?iso-8859-1?Q?cACJJBZzxS6lbsx1KldcvXSWoCznIg4KOWdOzPfqbMCxqK+y3TtEHNF22f?=
 =?iso-8859-1?Q?C4qubS4CIE8cI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8e9224-fb7a-45f9-9e2d-08de3bf55665
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:16:43.6930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR947H4eOl1SlKb11PjipvpuGV3BsIXazDIZvgMB73igcpRt9H8LixA6/W2mKabXzjCnpkQuo5GEpi+igWm+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10804

On Mon, Dec 15, 2025 at 08:31:47AM +0100, Alexander Stein wrote:
> Hi,
>
> Am Freitag, 12. Dezember 2025, 18:02:32 CET schrieb Frank Li:
> > On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> > > The GPC power controller is an interrupt controllers and can be referenced
> > > in interrupt-map properties, e.g. PCIe controller, thus the node should
> > > have address-cells property.
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> > Strange, there are not #address-cells property for gic if there are not
> > ITS node. gic is widely used.
> >
> > Does gic node also missed #address-cells?
>
> Yes and no.
> Yes: see commit faf183a02ed6b ("arm64: dts: imx8mp: Add default GIC address cells")
> No: AFAICS this is only necessary if an interrupt-controller is referenced
> from within interrupt-map. But on imx6qdl.dtsi 'intc' (GIC) is not used that way.

Thanks.

Frank

>
> Best regards,
> Alexander
>
> >
> > Frank
> >
> > > ---
> > >  Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > > index 9de3fe73c1eb6..d49a5130b87c7 100644
> > > --- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > > +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
> > > @@ -38,6 +38,9 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  "#address-cells":
> > > +    const: 0
> > > +
> > >    interrupts:
> > >      maxItems: 1
> > >
> > > --
> > > 2.43.0
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/


