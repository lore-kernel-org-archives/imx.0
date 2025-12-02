Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BCB19A288
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686931; cv=fail; b=uRs3FdUY2sCVmb95zq5MKdDVIBpahD6esdqEosIH69qdOZDONMNrJVg7zTLBUWkRb2GaQie+zJwXpMo3QTEOxaspzQEt/yf3NxxTiw+/n0dAijuxB+3GGKM+RV9qqqOGtwGouE7V6goddPreY5gn9FEfwTE2nVWdmhkH+OISDbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686931; c=relaxed/simple;
	bh=1yp4KCwFLH+JniFXE2nFrP5Z2NcHXmXhCVjDFQEU5XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=otAsADCbno6IkrWmNqxtAiYLWnuZcBiukITrRRmcUDZ64KpA1Sjpa5/noVEX3tWOOKb0qp9DReVWc7BzDKqrg4QpfAPEMj6k6HfnIflQ+GG0Rcnx8PGKmAzmtGuOF2Kwsk/hjy99k6qOSwS4obvHVkr6Xw1YmSnC5qbMdI+5uoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bTr7N2rM reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bTr7N2rM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn9w+hTuDD/cmiCT8depgmlwaJPHii1jTghWomInk7SPG58GOuvK9H1tkvOy2IBmKtG6s4vYvoBBuftdpV8rzZMvOuDv8NZNS9+F+rsSaLjTbTAA06zYQSzh/hBzuSpolqasr6UJnzFJPYlJ4T5WSUtWcE1Uxu5al7afWoL8OmsSYliRV7wZitcWU4oCRij1INSRN4nsrIfTl/0VYG17Wg0WKMr4/cMRHRfrokPpFycVgxeyICSpJle2L+BfG2Bl7WNq8chmw8U1Iejz+Nj+7mO+ZRc9yK3JOcUa2Mpqs2ZkWZC5vgvXsTeTlfxv3XBojtJAXqp4RZRR/PRBaY4uhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag3vCvRfSK47VFS8U/X34HDNId4qa+kv6vnXU63tqUc=;
 b=LYwhj3q6vpi7Om1C59rEFx48YnEZBT/T1CDwBpa6v0FIqCmujpOLhEGtZiltWgz3fCYeatyl84z7shqRvO0DCRd0563EiNcrxynU7U54q3oitrMrC58usv5jdZc4woMqT6ScTbDqZx+e2+LyULYirDNbK6yI1uucuvcaMw6OiV7VhEtJJRlZHrOFiQpqB25MJQEpiHDNEoTj54z54T7+dzH/TWGTjKoNxHczR4CQsnvCH2vRSHCdBfuqV3UrWdtcZ6GipJwtm4vFJLcgDKw4U6wgppqzvWJvbfZPMqna8wwZZWormlQA2dXsjhxQCWxVzaFuZ7e2J5uRcYWm9ZIUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag3vCvRfSK47VFS8U/X34HDNId4qa+kv6vnXU63tqUc=;
 b=bTr7N2rMoD80/SboSz96I5oT0uGRCb7qiHIQgPh/WYgbflvSJ0RNS4a2JshfJQXf2k0JanOcYfPLrZ289D8CiGg0En4EBmqIwOvSlXBQHPKO8/ISgOMqiaNg4r5JHodPCH6/xzhGkr3O4A8JDURE36V72gtmW8gu5hjnVFPPDw7l3by/lisA/+bPDXVz+evnbme4TqI32/bDe1iqY0wPUF4VcUAL9DJTDAN7bbYjDKhJuSpSdHnwroFZiMHjcms8V5vorhi83Ki9CP0yF13t+Q0B+pH+/LmVF4toSLFM2x4t7VjLItr1F/aF2vUJ+FHfHkLrMY4gKZBDX9etmZDuSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8180.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 14:48:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 14:48:43 +0000
Date: Tue, 2 Dec 2025 09:48:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>, devicetree@vger.kernel.org,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels of
 lpuart
Message-ID: <aS78RJQAJDf6iU6X@lizhi-Precision-Tower-5810>
References: <20251202111638.3553-1-sherry.sun@nxp.com>
 <2395053.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2395053.ElGaqSPkdT@steina-w>
X-ClientProxiedBy: PH8P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: de01f512-cf1f-42b0-3890-08de31b1e402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?nafcCyoBWS9QSCCO4gNV5koX0CD/MIlErQLidMOtiYfpgiSxJdysf4GXFm?=
 =?iso-8859-1?Q?DZg6EQRBG2Umgowp5z3okBGE3hxTfjrLvktmqltm6u+fSmXoqARFvC/qmH?=
 =?iso-8859-1?Q?uszAlJl7qwDuUYhbR+DGd+8/L3EEtcVn1heqacUEb4Sr8mpqez26kiapIN?=
 =?iso-8859-1?Q?jhkGIG51xYkRzmybdfebfVtal/ifrsFYIWmr459GhtQHR0JCXbKLaLq9PN?=
 =?iso-8859-1?Q?rMU6qkK9r8h84YLJgegnpzQVaamt5nzF2uK7sxJC0rxV2IJIaSvsG+Htyb?=
 =?iso-8859-1?Q?w1l521nQgHJ8cZxO99DadCt13BWc/XouizEAM0rIqUz8SUvTMCoGYVANjS?=
 =?iso-8859-1?Q?F4fpaiLHwYzRw3shhb/1jGa7RzNNnYBArE4N0t1v5iduIFTgpSEYjGhKZW?=
 =?iso-8859-1?Q?wIhFiNbo4KDqQ7aQw3ZmlWOd/y4P748URsvtLzv5XhpzMqAmbCIgeRqEMw?=
 =?iso-8859-1?Q?U72xHZymNeoo3PU3UIdgTPT3ZguKbFUw1pKsQ0BclWCEu7QE2lC4yMSEqR?=
 =?iso-8859-1?Q?iq58P/a1oZxKetuR4O65bjG7tiwr/SGV5+n8MMwNAMjJb0l6BSGDTgZa/i?=
 =?iso-8859-1?Q?oyruFczHD7Ysosg2uh41Urnf24gldbBsRZf0pwvOfizBQGunXrusx/rg5i?=
 =?iso-8859-1?Q?hKgl/OWoKssp0FEta0fnz7iGLHpa/vdBve3U4dXX001KmNIHIPSP8DWDn3?=
 =?iso-8859-1?Q?eTuUazzkCZwFYi4f4rd/yUhx7MBiJY/3Hen9l5kdaKBo7EXBbUNFg3oJ+q?=
 =?iso-8859-1?Q?bTR3zWUS9gdmm+C44rJ6hCmECvogvddglVhZETDf7Pl04DLGlxDKI6/jLB?=
 =?iso-8859-1?Q?k9r503mVoFpjN+NFpH+FBtebUuYvzf4KRLIQ+Q/TNWM5jAKCbycjCz7LaI?=
 =?iso-8859-1?Q?FQMkx7vLfcyt7OHM4+ftaqYdpwjHiOvYIG0Np7qRrlNjRu08iPeOJ8MFxH?=
 =?iso-8859-1?Q?OhRHUGP2hPhTw04wyJ9gXGsrTSEzmeHcoG3l33peVvv1/kl5H0+Z9NEmYf?=
 =?iso-8859-1?Q?CbfQ/G0Aj42RX9N2A/BzVQN9c5A9YQpMzVjhLmyUZum3dW5WUYkjGt7jTJ?=
 =?iso-8859-1?Q?CpVNg+ChD92JgzpHkhrWdAA0WPLHTejnFTn/jfoZcmZ6ep5mdcXDzNnT1H?=
 =?iso-8859-1?Q?PUcqeW8fsD83f1o9EdnJFnlkF6JtlbxqEkGi7jNyIWts2YFuwfP07EcoL2?=
 =?iso-8859-1?Q?Rbd7dbURGcEMaQv9mXpJntAUFVM5RWQZdWAIf78gFbV9bYe8UPjjf/vTxc?=
 =?iso-8859-1?Q?2GRpi+h5jGtpHBfmYHhTRHeahpJLtwje+CfXcmjglXHpOo2kL9C7tsZ0HW?=
 =?iso-8859-1?Q?h+dKu/apnWwRnmg/UCgmg4LwVOzMA+PeTDdeTu2bwHJAELoLdT3j9pDj+8?=
 =?iso-8859-1?Q?sQf/kpiKe+wC9QyqL3TVTbXvYgXJap72Zs9t85AUB/ay6ggpsm+tFiXIw9?=
 =?iso-8859-1?Q?RvoYL84yLxV9Jr/CooHQG4Bh40Zwpt1o9XG2yjbwkfq8o7RrVLehEzKKMs?=
 =?iso-8859-1?Q?l2oNmZEAuSTJWPneXoir7q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jIKcTukexmS2gihfmlXpW11VwhIchyMmbNXoL+iVt/BMIk7IrHvrp0T8pS?=
 =?iso-8859-1?Q?fHWhT1RRualJKCyZ1RFOUfM/DGXoJo89DQEhU94GMoqs+TyAvMYK2Slc5j?=
 =?iso-8859-1?Q?vB9Ro3/lbGN7X3KdnRJ6Eqo4kY4kOS0efLDfNXSvwk8iCZ8j79xaaA/Qvt?=
 =?iso-8859-1?Q?pBGPD/ZzEwX3yLdVE83Z/YDe6Cr65PRZVAMucsgxITLwTrSMdFkmYhH4o5?=
 =?iso-8859-1?Q?keXuOxUDryydTFg8a6DTx63GMV/4/rXBKAUQ6Bo9K+vz3XuePmCQRYexcL?=
 =?iso-8859-1?Q?AKGSt8roD3hxdKOHbDM11haiQyBQkAhLwMMSVtX4VN8LD8ivrmu5ljhNru?=
 =?iso-8859-1?Q?7BOdz72fYzG9J609l08rrso+b0yjYCHDZPf9eEHGLkVvXSwdTrhl9fxy7n?=
 =?iso-8859-1?Q?4q0hFMKfZWTtB4K2i5shOa2R2Fur8O71VPC9wKjIgAtdiVZ9OZhqmDGHfy?=
 =?iso-8859-1?Q?aK72MAOYaTWVJSayVkQoFPJvhdswRQx/rIie7occ0+/W05bL2W5VQEzPgV?=
 =?iso-8859-1?Q?Dtf3Qn1IWE0lNryOC194mG8pKYgUSzwC3o2lPRwocCjq97BmLikyolP10L?=
 =?iso-8859-1?Q?I2uBswYAOf3VxFpX3fB5oPfSqMRQZ18eDJYq0UvWFxCbHZ05pPnzZjH/zi?=
 =?iso-8859-1?Q?2Mhhr/Y1l93UA5bo2WdDFs8RMCy9WB0YaI1Bfsq5zXrvzFICBrV4vJofaL?=
 =?iso-8859-1?Q?52Np8b6htkZ7eiAFLdv9u/M6+KALU6ihkMFAdPa4qmDcWNVa1lRaatLGeE?=
 =?iso-8859-1?Q?ob7ZX7CMuoq1a+ylF4OfTtNNYmrqLAilYUyPyCfANT7p+lO1fFJhJ/JH7C?=
 =?iso-8859-1?Q?aDur00Gtr6r3d1M+T2pynoX8qbAyBTFMlMMnxfOpc+qTP5x48uAujzu4LI?=
 =?iso-8859-1?Q?XwgfsH8hydRqZZKYjDxXRlPL/03rw1POwCTz+DL0//IyxOdKTOjAts3vm0?=
 =?iso-8859-1?Q?1w7XTuwKIOcFfczU/59VUjLi0P//QnVKHyTY3pYxslWXL4y//eY+s4yVsU?=
 =?iso-8859-1?Q?1TJ4hFoylW60LoB6KGqh2A07pyxvuxG1FI8bsmwdEYqhP0mwOup1dbq3MV?=
 =?iso-8859-1?Q?XWmZDJ9Ne/fXLm94Twq81POudIvNXWBcdq1zMVtfDDf6zOz40/YZPccrIS?=
 =?iso-8859-1?Q?3HfcySpFU+vmJcPybqfbS7hBgVPrqFoaMUoHPPZowP/CTZumTAPOZEPYMk?=
 =?iso-8859-1?Q?ve6QmAZ5HPWvzFehhzwGHFFyXkioxsknRm3bx9hDmzaQDiAlCxzcbe/Dm+?=
 =?iso-8859-1?Q?b4BhNkVPGNHRp+aZjBZw+SiekXQlwRYouxZXYULgAyhg0HnYxXIBMlfDB4?=
 =?iso-8859-1?Q?qbihbNDrC1z7WiXwHZFpS/ddCt4B4vZR/oS9b5WGlFPixXmjVd3OIDvt4p?=
 =?iso-8859-1?Q?eI1dh7uDTWWG0iLs/JzPStAu9nBbdzmL/GblbJ5dPiOy95jTNeRCcUQg1b?=
 =?iso-8859-1?Q?qWrioO35x4O0kfHtAQs9xKYIxnt5TLQaJeL0iilesTT4D9QOv4I0SeEEQn?=
 =?iso-8859-1?Q?5zr1CMgQk+Ev7ybF8WwF9/JurBHmIj4ACf6gMkycMAKGJPg4sApA+7Xaoy?=
 =?iso-8859-1?Q?l6bgAT+ErLjSUGS8jVs5lG/e3sS7/wlJQxcLxlzdGHfkR0jkGLaRys1k4h?=
 =?iso-8859-1?Q?oLCfUgIMNqM9M5sb1Pe0GXsSOq9aqEY5MA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de01f512-cf1f-42b0-3890-08de31b1e402
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 14:48:43.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYIyzgXxE7fM7Off6KXtjcZAoZn/qBz8O3z6FAIQWlQTStKbBUndWBV25XlW/ORP4ThmQPn91zUksDT/hyJvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8180

On Tue, Dec 02, 2025 at 12:48:15PM +0100, Alexander Stein wrote:
> Hi,
>
> Am Dienstag, 2. Dezember 2025, 12:16:38 CET schrieb Sherry Sun:
> > The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> > order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> > update imx8qm-ss-dma.dtsi.
> >
> > The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> > dma-names") just simple add dma-names as binding doc requirement.
> >
> > Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> > the FSL_EDMA_RX flag.
> >
> > Fixes: 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel order")
>
> I'm wondering if this is actually a fix for 5a8e9b022e569 ("arm64: dts:
> imx8qm-ss-dma: Pass lpuart dma-names") instead. 616effc0272b5 just
> focuses on the common parts. But I don't have a strong opinion here.

Yes, it should be 5a8e9b022e569.

Frank
>
> Thanks and best regards,
> Alexander
>
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > index 5f24850bf322..974e193f8dcb 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> > @@ -172,25 +172,25 @@ &flexcan3 {
> >
> >  &lpuart0 {
> >  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > -	dmas = <&edma2 13 0 0>, <&edma2 12 0 1>;
> > +	dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
> >  	dma-names = "rx","tx";
> >  };
> >
> >  &lpuart1 {
> >  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > -	dmas = <&edma2 15 0 0>, <&edma2 14 0 1>;
> > +	dmas = <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
> >  	dma-names = "rx","tx";
> >  };
> >
> >  &lpuart2 {
> >  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > -	dmas = <&edma2 17 0 0>, <&edma2 16 0 1>;
> > +	dmas = <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
> >  	dma-names = "rx","tx";
> >  };
> >
> >  &lpuart3 {
> >  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> > -	dmas = <&edma2 19 0 0>, <&edma2 18 0 1>;
> > +	dmas = <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
> >  	dma-names = "rx","tx";
> >  };
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
