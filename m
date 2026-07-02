Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C507047DD60
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995042; cv=fail; b=RdV+ie+rFFoF5lBsRZ6Z0tvOP4KenRpoQt5O8zL7XQWicbXu35ITDStT8EcuzkNESnNo5fsjNdfUeaJEB2O+B0ngXtMK7d1IEvu1rniWF+ymXkTBpu60qo6a+g3BYrqhHSwReY0glBL71xaINtkCES6w83anuuFnrprb2knsqUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995042; c=relaxed/simple;
	bh=NJosfa6MToLnZ2U3OkhJuFyB7bq5h3fqSqJkiK1pYh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pIWpJB8XzNVqfSJuW0TIAKTDeziHzKkWj0eg4upZ39tbtwWs5upAJxWh4i/OthXnjWsS4fnjyoSukMgUIdi1TVtAsrFvzPqfcaSTCCfhchaDUjHyEgNVCdT6LlPKTkXu7QJRX9RgpjLebcxBHqBrb+rVsiRohMQS0E1wgI9INxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X068aKPP; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X068aKPP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDeY5zz2eP8fSj4AvzSqZtqI2U/XH5xT5G4ZrrtrgypV/lt14o/tRlrmj24r3Yva1nAFOxkeVIyN8WTkJhT1trjmTznk+TTZcumWy0LP40gyl/oCF5bKhQNIZH91d+CuYMPEFVMQiPGCbKOS2nCL8M6tRmf8OjKCVF1fQMU0ebjkURvfEmdo3/jBHdAOJypdzMRvjq5/1a5ytAQWO9ZxEi9kDwjOyqbUMNqK5CU8mGQYTIZPLS86zjnqf9K0zz/tptkWySmnrGKwihstky6sMrR/CTIsF+qQlG3SXZQY04v/B4KE9Y1R+xFliIM3ryexV3obKYQLMmD1ppjTgWJxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nEMQaKM2RATzk6vAZdT3nfnIXYypUIizU65bGtjkAY=;
 b=RIqg/T3ckYTWG0jH/vEAVbs0z9VZmg5DWrPTsPfX/PkZ5aRBss+iYrBO6fdqVYa1RySpNRLAW4zORH9tt+UiCOgUlPGC0GO6RQ/ZEK1uE6ph6FCagKluwIidlSy4jRmSuTxJGnDFqddCAJwpxgE9+okBtn7B80Ywm7VnOhhb5zkeyqb83qWsZwzN9x1R9ahjmpg86FLFeJF8iJHQX/rtX2tdqotM7t5ffavvK0Vvx+YC3T8LdBod/WZOhCNjFy6bLVfjUywfrj56X/SvfDiLt4WxYn7Zk2VaYyr8sDf4sTygPSER9fogFT7zbRCZvlJdWvvdJ9ak+SdIv1PQMn1uJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nEMQaKM2RATzk6vAZdT3nfnIXYypUIizU65bGtjkAY=;
 b=X068aKPP9sfVrYQDYlWv4ADIIIuBT5pU9prbsaMVrA0Qe7gWiVKC6BvbFnC7OMddP2kpgynBa3KTViaShgkARx1fvd4TfrrjpYbfVUNel9HfyrxWRD9Bur/as1qFQjb32Ofki45JYbb8ICmAeLpXR58HGcT76+9l0tI0pFBx8IalX5H2E5gn3CF1GBx05AgB2eR+qhzxOP7nGP0Ol6IOyzm1/1xWiMRkF3KNiixGTO5l61pUseBk5ghPb84zrl9B8wLQ4vCBvTS4nJxaZj1VFROEvUfteBSg7J3BGDKnEmhApd0zlhx2Qudh7d/Y952P80tTmQ9xSAfmjJ/oRjYvCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 12:23:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 12:23:57 +0000
Date: Thu, 2 Jul 2026 07:23:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] arm64: dts: lx2160a: transition to
 device-specific SerDes compatible strings
Message-ID: <akZYUNtEmdLp0Kvu@SMW015318>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
 <20260701131137.940145-2-ioana.ciornei@nxp.com>
 <akUjt5OPiO5cJ1D9@SMW015318>
 <b5lpw3xu6svsq7xmmgp3jn4cg455zhp3iw4q6lcsxq4bqy7mwh@guuitghg3xal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5lpw3xu6svsq7xmmgp3jn4cg455zhp3iw4q6lcsxq4bqy7mwh@guuitghg3xal>
X-ClientProxiedBy: PH2PEPF00003854.namprd17.prod.outlook.com
 (2603:10b6:518:1::74) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 4334398e-aa9d-4b31-aea7-08ded834c963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|3023799007|18002099003|56012099006|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VtJ76xXMqrRxFwA+v9e25NOknB9Oy7/8B11O2ZmKfQTu8rvlp6Y2r4sf1JiHXwFP7c4HM2YPZ1a2Di2UpptBrhO7toGrILCgtwhFi0ht5DRtrdFPvhjlfTJCqS/GGinXC+ydMfRKAP4mygv5+sAN0nlBU7N6IIFlXYaiMM7VZg65vVugkQPBa387jWfC63sRT++KpLUGciawTFx2yz5gG0eKGR/XQN6VsaxGqj41KvwrxUJ/OL4K0exrnXJYm9RpBYXBZOcWVWvRcbuhSzvTr1x30jsGMPh6ewNtgxqaYCS9xuECEGiIvQGp2YF8FBgZQStZVMWycDLvHXWQTKuQVmU8uZCpj3qrTtJh/LdNa5Q6p9Apvh9nzsaaqD8wcssW/8UimllbbhSjNoGsTM3WfghE+QArDYFUy+7TW2phe4riGuk8fkvRf91Y5m9M1PN7McKNEycLofxV+Os1VcHqQwm6Baps9Hi1w63UyAllpKDD1bjcQTDDUuFGCgK9xl8OZW2dTwmSlDdKn9cqpsCm7C5WFydwa+nd4+50uu8aAX7FNWehWYsjHgxAjLfZUg5KUL8gmO8JXZRcffCmDQ+AwA1P/aiZFtXTP4D7pp1SxbqTynw1zhqmZ+zYrF6XNdtXMuZCtrAJxlp6I08RPgCOWEHB25faSCvaS5EhIyyea2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(3023799007)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBg0Kh61Ru7Sg+dhAi5orjUOT4Ywxg1lKim66XGLcd94s9FZxB1G0Ms9CWHD?=
 =?us-ascii?Q?husG5g3gLsWLt/iOt02f4QDnPy8EogzBsyTPwhr+kAHFAnHmvJMykDY3dWfx?=
 =?us-ascii?Q?7ay97upb/+2qm3oIIV4d1K8pe+MYDuyoF+9MB7++rf0I+VOzSu5BbnZgflGa?=
 =?us-ascii?Q?9kVNZr+wlbLsX5tMLdd1odDv9bQy+uYvQ+EpKnj0yuR8xghscM0D1VAmXnDr?=
 =?us-ascii?Q?RjFM4hlmDLJ/ya1HTyGkJn17I40qUpkmrXbWMcLxJzNTYGpqx9CFHTC3rllD?=
 =?us-ascii?Q?30LnWu+eySmFIwO/5vmoLL7K5qc3CtMfIRO2NznXPfRXUwKKDYc4WfWSekJn?=
 =?us-ascii?Q?iz9+VTNXhfWkEeqPcSDeuXdrXhfzS8atWAkEY5DSxolVl595p45j8ucY9FoI?=
 =?us-ascii?Q?6DiQmDrx2R8i1J5RA4Goj4ooV5S8zE9+XnUqHgU4EjQaVsTjgRwcdq+NLn01?=
 =?us-ascii?Q?1rNtMooTIeW3eu0LDyY97Vc4GNHVPIiPNnrUl04oyj/MMB5n7NE7II1RJE2q?=
 =?us-ascii?Q?bgNi30VOg8OFg5eboRQ78Wq2Wr1nP4JB1YJYfxgCcyZ4NFUENfdcdw0BEwK2?=
 =?us-ascii?Q?DwkKx12JAmCC/P8v8GNwnaoH/TyGRoNix1yRAiMt356miufJagSMOxTCL1bb?=
 =?us-ascii?Q?JcQ0qIfWNxUU79mPltzUMJqx3VuMX9yuClR8HvKAWA7Gxkd35IvaJnVMe+jE?=
 =?us-ascii?Q?9xS2fEZr0BnqOLbNj5fP/5sZTmF0UmPuNbN6pYY7ta83vkHR4APWmFhzSmD8?=
 =?us-ascii?Q?CmtWpMxxe9YXZ9XGqODode2C/poLlWHJovsMx6ZxBwV1YB1DYGWz6/71Yjyg?=
 =?us-ascii?Q?CBWpbEf3Ua3oMYwMt0vJOBXZA10/NzeC/9/ZaHjfu8HVjK+zNe+TQ9tsL07J?=
 =?us-ascii?Q?saEESNkmdw5nnia0YpeJ48PEGPe1C4v8VLjNrzyhRK0pFCh0/e5KhKvY0KJw?=
 =?us-ascii?Q?0CPPljlt7udh+BlQQb5uy16txET3kHWTPSeccV3Etkg3cwvHiK8jkxgbbXBB?=
 =?us-ascii?Q?yRqOwvFUhzQ2l4ZqPslAC16Mfe6u8m8tX34gsUmFiyZjJhEcGIxsL/zoTGRe?=
 =?us-ascii?Q?dTyHuiSqNCcT77vnWuMqzJNUO6/fncX+C/UJpcKjrGNU9IlAGNTmjQAWVbBk?=
 =?us-ascii?Q?/pk9RCp14rVCixhBEi/Y0ls+5DQn2w3opb8LRlokSP1/Ub3GqgYLtcGaGAAR?=
 =?us-ascii?Q?sqccioYie6cqdhfDLdkd0poMaxjbRwxqlnFissouWpklD5eZaWcjpLYtmpNt?=
 =?us-ascii?Q?FWEWjytk4RSObL6asHc15RHvfF87sGxiT7r5Cacu1BJ5m9FdCENYQl0bsFK3?=
 =?us-ascii?Q?GEru7MLzwIqzYTaGQ3GIB2DYVp+XOCsemwoct7mOKb0HLOSr6RJTE6+RSVgf?=
 =?us-ascii?Q?VBeMZX3NmHni538yVcZTERewzYzzyoPDSoSRVlQGH2yLFV1cOB5IMhteEmRG?=
 =?us-ascii?Q?VEZK8CWQEtQfFSMDGKkwYHfNXcjG2NnlmpgK5GLktIlB1G+2ovFw8YyPi8GE?=
 =?us-ascii?Q?opKy3MW3KezLTN+9SjkIqfJEYOhmIPwS6JO3dU/jjT+YlUUY++XZLw5IfIN2?=
 =?us-ascii?Q?T6pCl1FQQ69uY8c+mOZ7rA6b/lSd2Ei+aYOl+Kso60YZjxb9IWviKRI7qWEk?=
 =?us-ascii?Q?BsutsukTEHbGD96yNZo3H/jXxK/qpJoRH/C0i6PijPVVFAzSdrWnzShDppy0?=
 =?us-ascii?Q?ymkcJ6fQRSqucZJqNSZpoE2TCDX7mGaeaYeWeEsXaqNUAGEGlNnsqxsR7Sx1?=
 =?us-ascii?Q?e/dmGcvkHAFc6L0QLYY781vjhsC9RzbHqRLkuf5cNJOfcQF6nT0y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4334398e-aa9d-4b31-aea7-08ded834c963
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 12:23:56.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVOy6C20faK0QqVW0KHgoG4pE5ZLMnrsnDKlzcKd3kKcZ19qlt1iUwJ5Lsv5m5FBAop9SvFOwB6aRzxpWHQOzAQQu1H2rfu9PAFZuKHbYLBpiLNRBXYZChTUbyDKjzTm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484

On Thu, Jul 02, 2026 at 10:35:00AM +0300, Ioana Ciornei wrote:
> On Wed, Jul 01, 2026 at 09:27:03AM -0500, Frank Li wrote:
> > On Wed, Jul 01, 2026 at 04:11:33PM +0300, Ioana Ciornei wrote:
> > > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > >
> > > Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
> > > instance is present in the compatible string, to allow reliable per-lane
> > > capability detection and per-lane customization of electrical properties.
> > >
> > > The modern bindings are backward-incompatible with old kernels, due
> > > to the consumer phandles being either in one form or in another, as
> > > explained here:
> > > https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/
> > >
> > > One of the major differences between the LX2160A and LX2162A is the
> > > SerDes. So far, LX2162A has used fsl-lx2160a-rev2.dtsi, but we need to
> > > split that up even further, and derive a fsl-lx2162a.dtsi which
> > > overrides the SerDes properties.
> > >
> > > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Enable serdes_1 on all board DTs that has consumers for it.
> > > - Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
> > > - Remove paragraph from commit message which mentioned some consumer
> > > changes that are no longer needed nor part of the commit.
> > > ---
> > >  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
> > >  .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
> > >  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
> > >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
> > >  .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
> > >  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
> > >  .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
> > >  7 files changed, 190 insertions(+), 4 deletions(-)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
> > >
> > ...
> > >
> > > +&serdes_1 {
> > > +       status = "okay";
> > > +};
> > > +
> >
> > Can you try keep alphabet order? may old file is not ordersed, but try
> > best, at least should before &uart0
>
> Sure, will move it.
>
> >
> > >  &uart1 {
> > >         status = "okay";
> > >  };
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > index 1d73abffa6b7..a687eb3e3190 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> >
> > Please split chips dtsi and boards dts to two patch.
>
> Ok, I will split the serdes_1 explicit enable into a prep patch.
>
> >
> > > @@ -621,17 +621,163 @@ soc: soc {
> > >                 ranges;
> > >                 dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> > >
> > > +               /* Note on the interpretation of SerDes lane numbering from
> > > +                * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
> > > +                * The letters (A-H) correspond to logical lane numbers in the
> > > +                * SerDes register map (lane A's registers start with LNAGCR0),
> > > +                * while the numbers (0-7) correspond to physical lanes as
> > > +                * routed to pins.  SerDes block #1 is flipped in the LX2160A
> > > +                * floorplan (logical lane A goes to physical lane 7's pins),
> > > +                * while SerDes blocks #2 and #3 are not.  The lanes below are
> > > +                * listed right to left when looking at that table.
> > > +                * Both the numbers and the letters are according to the logical
> > > +                * numbering scheme, and do not account for the flipping.
> > > +                */
> > ...
> > > +                       compatible = "fsl,lx2160a-serdes3";
> > > +                       reg = <0x0 0x1ec0000 0x0 0x1e30>;
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +                       status = "disabled";
> >
> > status should be last property
>
> Ok, will move it.
>
> >
> > > +                       #phy-cells = <1>;
> > > +
> > > +                       serdes_3_lane_a: phy@0 {
> > > +                               reg = <0>;
> > > +                               #phy-cells = <0>;
> > > +                       };
> > > +
> > ...
> > > +
> > > +#include "fsl-lx2160a-rev2.dtsi"
> > > +
> > > +&serdes_1 {
> > > +       compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
> > > +
> > > +       /delete-node/ phy@0;
> > > +       /delete-node/ phy@1;
> > > +       /delete-node/ phy@2;
> > > +       /delete-node/ phy@3;
> >
> > Now, do not perfer delete-node. if ver2 is not include phy@0, ...
> >
> > create ver2 files, let ver2 include it. Now most people like A + B, not
> > A - B.
> >
>
> I am not sure I follow what you say about the ver2 files - are you
> referring to -rev2 or LX2162A?
>
> The LX2162A is a version of the LX2160A SoC, also known as "LX2-Lite".
> And the main difference is that the LX2162A does not have the 3rd SerDes
> block and only 4 SerDes lanes on the first block.

If it is the same die and it is disable by fuse box. I suggest leave it here
now because default it is disabled and try to access-control-cell in future.

https://lore.kernel.org/imx/20241212-imx-ocotp-v1-1-198bb0af86a0@nxp.com/

That these nodes can be dymatically disabled it.

If it is difference die, it should lx2160a.dtsi include lx2-lite. you
can rename old lx2160a.dtsi to lx2-lites.dtsi. You need adjust file name
and I just said overwhole method.

Frank

>
> The delete-node is reflecting exactly how the SoCs came about, the
> LX2162A is a smaller version of the LX2160A (which came first) and not
> the other way around.
>
> I feel like it's unnecessary churn but let me know if you feel strongly
> about this.
>
> Thanks,
> Ioana
