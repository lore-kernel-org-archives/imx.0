Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2059.outbound.protection.outlook.com [40.107.105.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8F1FF1A1
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354031; cv=fail; b=kpQxcMjQ2fWHYPflBGpL0IX4s4q7AaYZXz0OzK2kGnZQBaVkRmYMyrvd53jEumyfW4AJYb9K6rVFoYW2gi9UUXZaFpaTIsbI39BvL//IfoTJceDYLxdsM5ZO8Ykf4ezoIYAncG1J9NkjuldlRrjyKz3drtpJ2dAdwaDZVKh39cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354031; c=relaxed/simple;
	bh=RIc+zbUbt9lnf5zrQAm9y7/I3c2cK5nUqV/iu8O9M5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G52aktQHTV8+G7S+FCihx/4c0Y0DZ7g1K5UFdl8R0rNzW6bwqoSNQ+44SaakaQfioBO6iAehzuZAyxJAZi3VQ8mZBhaYnFtBVjpr7OZEaT99e8qWsnuWYcrTMIAMQg3NxkWQcGgm3Ijo16AsDi/R0zpN4foly0HOwRDf1tgw1+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d7/JwBVi reason="signature verification failed"; arc=fail smtp.client-ip=40.107.105.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d7/JwBVi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cbbls78JqrYkzwN6ETsuFPcCixvAY5/xjjtwtz1NNYr7ooIDdeKrtnxQGqiN0Jqy56prsm4wMInYfLVmgY5DXFxo9eCJYOPDarMMTOXgNDqDzXz9LTgQDcbfT+7vFs8lcG2bwhhBpt03NTYKXqFpvpFwORXwFvTurMbDxSddTmhOSt1UGYzU12QzAkxqQ8W3yJLryotjVr8+Pw7LpRs7nGQ/1avrswYQ9aAx2NQek3dG4rUDpjQHjnHQEdCzpqVJ1/YcWa1B+m/8/QLfULiFVQbKU96+LqLw6K+KtVSB2qJCQsVe3+e71qbjcD5/Lg9sMWBCCtO+BkVEfl9rDd4/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX1zRlO53QnbFtJobJeaxdPyGrWqs+2Soyew2J3rCaM=;
 b=GpMPdZg1WISuYoW5nI8XHSwTVYVQorRM8xxTPYsbjHU4fCadTtGpN/PP65nedWJsAnuNhaIV7/tiGtCs5c4UzHrhH9DHdm7Edfn6URgMHOmCxjY/u4KXnXZ9zl1fgXpCv5IlR78GAoI6n13K9tRU5KN4Uy0IL3zKo5afdnVoFsaP479NrPpwwY5gng6yD4LQS51wkCY0nVQcOBDygYtZgiahUzDuP+p/4bHBxBF2Mo6/uQ5RMwpXkI5lEgxt0Ij5jvh4u5Apw2LWaOzqyw/mQC+Bll8WD9IBN1bDaC3/s1wfwyL41bgSUQ5vozHLyzh5wNDRf0UdLVnx2DCiS780KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX1zRlO53QnbFtJobJeaxdPyGrWqs+2Soyew2J3rCaM=;
 b=d7/JwBViDj/Hn7OR20L+2anuZSSQ41naGGcDip2wgzn97t5kbIGePHpwRJTkjnLxZMgs14u7MUdVVqQH3bxdag3ENqEVxVM+lkWvLGxWCR0gZ8NH4p8G4Z1/JbzFs01FFHG/BrW0Zuud2uJFJSDeif4xiqlfY1PBgBewYLLy5A/VNNTZNyHRPD6yXJShIA0wm9vcZ7GAncyX6WW77VsvXBZBN8utB06uyr4Ir+bkXnpIBU1EXytL3O5fRid9qvaJtPC9PoYKU6PwM/KLVSWbihhBuopK1/o9ci4LE3pirgz5/a8pyUU9ODukIIAo7PiNVYP7v8qZRQRNuw6N20gGnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10775.eurprd04.prod.outlook.com (2603:10a6:150:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 16:33:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:33:44 +0000
Date: Wed, 8 Jan 2025 11:33:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Message-ID: <Z36o31uhQuI5lcH7@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
 <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
 <Z31KrdxPULx8K5ao@lizhi-Precision-Tower-5810>
 <4427798.ejJDZkT8p0@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4427798.ejJDZkT8p0@steina-w>
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10775:EE_
X-MS-Office365-Filtering-Correlation-Id: eb994c5f-2b98-4966-cf2c-08dd3002382d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?kHGz7eygMGXhGrZgm4R6YqsI90iLd/ENmZT9eqXvmuXN4wV6K230w3+3TO?=
 =?iso-8859-1?Q?pz8XOWI3iVjYMMgzW2R0obqzwamySx2FDo/yPa/myhISdYoibCHwMjmv6j?=
 =?iso-8859-1?Q?ptiJTM7t19vBbt1SwZv4J6qOA7E0P+d1plsre3AQo2+u2T+nNu7a1SLGfe?=
 =?iso-8859-1?Q?Jf7w7+eiXiY0VfnZFIos1Q2dsWBS5Oqkue+kOB0GsmW9rW7HK63OzEhO9y?=
 =?iso-8859-1?Q?FpDYVdbp0D+XimMxinST0W2zVq0yXcYPe517wByPkswa2NRoS14r2xEm2j?=
 =?iso-8859-1?Q?dDp7bXaPO4H8yjo5OlrtYXYGLS16xwBSIpQPbCHK+Mv8nmVS4m5v5KEvQZ?=
 =?iso-8859-1?Q?jTG+1Et8Yq44XPbTBmHIIo7q9eoJ3mRj0xc/2P6tqyx4rzw2bFnA//NHmL?=
 =?iso-8859-1?Q?2C32ec46znN1oVEOhazZs9pL2kUxmRRfjSRKBh94PSjC2iTtKkarM4dyTx?=
 =?iso-8859-1?Q?8uZPBnv3a5A2CFI7rKmswzslbyLzMlYJYTdIl6RZhZeULbU4747D8f5LEM?=
 =?iso-8859-1?Q?xiZFmo7Mt9TxA5TFWt/bNFYIyHV5a7kC85ch8eLRFdH/Ax7+dKimaH7grv?=
 =?iso-8859-1?Q?NEgPrMD+Qn+OImpmkmVgkQviAfX8zQxDHxpcQ49xy0K6imftZcT95Ogspn?=
 =?iso-8859-1?Q?od9GrdeVbWiSwdr4k3pSMdg6U7+s0FS9fsZa8BRAzMhYDxPoOKTpnuuDB6?=
 =?iso-8859-1?Q?0Kod5vRpz/gSvkdxDVof9oblKMfviTArM48tkicE5+ut3dKj7YY/97A/c6?=
 =?iso-8859-1?Q?R4kL6fp7WdWJh5hanbl+scCA7hHUljU/c+1GBdcOVcryjB2oDW4SkswV3Q?=
 =?iso-8859-1?Q?yjU3fgcepQ/OMQiVoUQXmi3XtLa+3ynCu1jSbdqd/QnYjj1N1lmC4Vq5Pv?=
 =?iso-8859-1?Q?vU/rNB6VWFin/Sdh8ptMxBKcDvQdI4exYZpdKn2fmzWYDFiDdiLYELNVD6?=
 =?iso-8859-1?Q?o+Qeyny6HHenwDb/kxfxXyvb0ULBk7yXIzWKrs8U2k2TLmIDdytzhYBO4u?=
 =?iso-8859-1?Q?wzkBuNDi2KknIyRmpS609e7Kt4/HqGpPtFZd1ST9jEknQfxd2YiaKHaynj?=
 =?iso-8859-1?Q?LOuoDpyMIRyMQf3s1GQs2/iI5jAyIs3ZwT4NzrL8f6TLjBsBrNwqpL9uG6?=
 =?iso-8859-1?Q?z6ze+jZDU3SK9OLFFg1eJ6HlI2oA9v575cL+cS3x8iNLXFV+CRL7lE2X4p?=
 =?iso-8859-1?Q?VpXB8v8A2H0Rl1qi0uUpF12JsMzbiUiBnHuZvBfS8TIFFRUk0npLocBKqB?=
 =?iso-8859-1?Q?+5Z10DKzonPIx408O5/wdfJdEz4djVgsYnzYGIb/+vzYwq89Iz3AHvg1vw?=
 =?iso-8859-1?Q?PtselIlYOz1xGyQUbGFYg/lZC4zdy/vkNSFQSUTPWWfwYNl0A8bBRjo3a+?=
 =?iso-8859-1?Q?reUG4ZMm+oX686VmbqkK7eToDN7HzeuBd9m1WcvyiBqpSjwJp0YYGP2el0?=
 =?iso-8859-1?Q?yivt0MwDErUMcjd7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?h6Eb853qFxIrfhXXfBIVIFEio10hz35nYCGiMeGex5Hh4VYbuV6wrUmrVG?=
 =?iso-8859-1?Q?Z7xSrgAyVe2mQgIUhHa+BFyBwnFFxXuWcmVdwgvUvOwV7lMaLB0A3oEHXS?=
 =?iso-8859-1?Q?stz7vobgYa54CRwxJ4LDtrBrF6mbsoc0EsQpLVh1TS/tQvThOLE0XNrsxw?=
 =?iso-8859-1?Q?cSBSTnKICGGPUHaDcBNt8thm/kMGlLHJ8QLllNyFJaOteB7sSSqpLihmaX?=
 =?iso-8859-1?Q?5SiyvwTseJ+bt1M1bdcnVq1oW0wE/8ki6DpOlx2s3wqD2XeQ1yvgrWhhtQ?=
 =?iso-8859-1?Q?C+DVZ9i6BiTqaH4sqrSrpSuMMnEtNNGVukwDLlJEp59AopsPvUeEJTukex?=
 =?iso-8859-1?Q?k1qvm1qMQsnHGkN2xeQhZlcrxHjBlkoZyacuM7Tve3n4qWBuNGtTRz5hRa?=
 =?iso-8859-1?Q?2eBUL81RnfKkB3mcEPcU9llA4P71MhwpO2SXGzJ59XzPf5Xzkqb6Nm8/Z2?=
 =?iso-8859-1?Q?gs6vjwfVUwq0PC0sL5KE8Y1l+HzTmPm8AluTBLC0l5kShXl2u+XI3Ow/un?=
 =?iso-8859-1?Q?G9S6dx04M5bO/pqSBz52kfkL+bOrIXwbGYD6VrthPlXwd/SOZlRPfVlaFj?=
 =?iso-8859-1?Q?46dwRBbqTGqFCM4U+aB2BlkTRTE5cenzqfAXlwv1tpmVkAZrdUWKksU4V9?=
 =?iso-8859-1?Q?PVTFo3L4pI31WE3O6DpfGFgiTyZl20ZwRmqS5/i78tdQdPNZ/y2V8EHC1O?=
 =?iso-8859-1?Q?4tWNJ/b6eBneNjYFjKDUPq2y7I9/1kKKEZmMH2rPR+ZKBkni++WRjFD33L?=
 =?iso-8859-1?Q?UMUEJr3HoIn4bReJyeNjiFKsfdeO/VwKc7pPOoJ7eLkCAOAHDHawN77JYP?=
 =?iso-8859-1?Q?dIBlV+M9uGZ4OCijEZ2Wckl/mEX+k5F0JuZptHa3XxTX95UqxYQ5A9y4Ra?=
 =?iso-8859-1?Q?HYhc5LjJ4v231e++hWxEVk0vrPLI/pCYzOF1L6HNkNd/GrJSJI41/VrxF8?=
 =?iso-8859-1?Q?oWy0DujVTgePmeYS3Xa4fL1rEaPn3GmhIV6+SaRQCyilBzPgnLRAEcC6XZ?=
 =?iso-8859-1?Q?TmowN+slCCUy8MoKMX7+UOjVEnQxr7UFWlR+xSw8NMZ2h2R5LeyaHQT73x?=
 =?iso-8859-1?Q?aWuLtD/tPq7dGMn4wFPJy5TW8QjJ5Lt1CoQsRiO2k2MFhi3gyb/AVGyVU2?=
 =?iso-8859-1?Q?dDtq7IneF5ji5jBAwuM41Rou92ynbSbZ4NsJ0w0ekPS3/UgEr70omNvn3j?=
 =?iso-8859-1?Q?8207wV9VzlYO414zRt6VCE2Wm9P/rJsWRzKpqqu7WV1L46xHSdoUMx8QrW?=
 =?iso-8859-1?Q?PHjbniUhfH+aJeXgpTXQIQPSAfzCh+6a5mu5nyoE+86UwHKF93ylF55VJW?=
 =?iso-8859-1?Q?/LMs9XqhLrm9gwgWyCTrDeCBu4jwQDLHKoJmJS3hwofDVpXkf4hFR5R6Oj?=
 =?iso-8859-1?Q?bXsOoAuljbXfIx9ljzXEBDRmDC0HZHVRbsTlplU6pWE3B8GbN/TWia0hx2?=
 =?iso-8859-1?Q?YzeLA5dqxaA0h0M6jWBF4VsiI8pCO9bhIFruDjGAMczxdzxACvCd9Jjav3?=
 =?iso-8859-1?Q?tHUmU50tb5RPPMNL9VvaC23shVJvDEwTlZ3S1Jlv729AvMuPY3236IUOAJ?=
 =?iso-8859-1?Q?aTH0B5Oe553t5UJB6FW/2mJyIMgdCQG7LhJgNkbX8azMOqSFgpnS0iZ2Pr?=
 =?iso-8859-1?Q?MWIy+mD/WnHjE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb994c5f-2b98-4966-cf2c-08dd3002382d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:33:44.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrP4K1yZCS2aatUIaGX6/N62Nrb34cyOd9Hd4t7v44zH3IDMVeh5eOq7NOCnD0s7buuDbhYA0MuFG7EJ/wjRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10775

On Wed, Jan 08, 2025 at 10:58:18AM +0100, Alexander Stein wrote:
> Hi Frank,
>
> Am Dienstag, 7. Januar 2025, 16:39:25 CET schrieb Frank Li:
> > On Tue, Jan 07, 2025 at 03:01:06PM +0100, Alexander Stein wrote:
> > > IRQ mapping is already present. Add the missing DMA interrupt.
> >
> > PCI host side have not use bridge's DMA yet although hardware support it.
>
> So this is a driver limitation, right? So IMHO the device description is
> independent from that and still correct, right?

Yes, but dma register space may missed also. I suggest add later after
EP side support merged, which can verify informaiton is correct.

Anyway, I don't block this change.

Frank

>
> Best regards,
> Alexander
>
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > index 70a8aa1a67911..4bdfc15487cbc 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > @@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
> > >  		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> > >  			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> > >  		#interrupt-cells = <1>;
> > > -		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > > -		interrupt-names = "msi";
> > > +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > > +			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > > +		interrupt-names = "msi", "dma";
> > >  		#address-cells = <3>;
> > >  		#size-cells = <2>;
> > >  		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
> > > --
> > > 2.34.1
> > >
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
