Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25406466B4B
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991504; cv=fail; b=YX4fRg+HG5/3xE1+E/hD1wtvIj7dEEbgwFMyGiJ//oEOjrcLseM8a1ITh9OXFCvOf1p4SZ2z0JnKVIh3zH8bwRXGbRk75CKUWicyEGuZaAQAAlJN4z9T3bJobqWT0++NNt1qCBkJ4JNQGGymSaYN5Y1TdjEYoJQVEj1c1a6lViE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991504; c=relaxed/simple;
	bh=cQFymXUmrv+J8j/INTwTfffP0bB+1MGBJVTQhkCdS5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pvMCfLTSDc/XRYJc6LM8DxDTWEZ2Bzjih7XqMfytIQLY0EtbkG3V2uyCi4WgyJFdm0ambNxAdtFibtd+b06TTCAazIc5AyA/fRdi0FN9UtJgGUcHkariZJrBEknhv1taKGk9g39PpZigMePQH0lp21+Z8NmW/rsn5VaSgdEEjS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hpz2e1pJ; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hpz2e1pJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhQN0AAvonaBTxWCXMo6nG7uQAla8W3Va42EQa3fC274btPb6poarom4hqos/rPWXmnji0WaVmYxld4E294W1YSlNPHHl5nz7vgQmvivEEbCPepPNiia869Z1bqnguk9X8gyOJqhMOcbJoZYrLs9eV0DFxILimCMFvfSPhI82MRFJ2Yu6O2lOGk5FavPqS5Yzn0G7DZga8fXn+xlk33+ObSr8MrnMOMUennaLgO1TmKGtzG0jkHtq+f7bwCsZeOJYQQxelkgwiPMnZhRtkSfQ2d8/F3YyR7Zi/kq8DRq4KYvNkcb285CxGLvXfYCx8MpHT6L8vIwQY8O8wpVgYrrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY2xIqfKP5SnKz7Kg73AusImjyjoKsyf2D5yYtLOfIU=;
 b=djTs9i+ab7AQMUlnF/r0itSBSg3SopulQ78Je2cDMyNuLVpmuK3vuqPEtWFJHnP3F92RJfDoADSKRmE4KoAnPWI5NqT073lPO6a3sU+M43JFTcEkYfjJwgK4KgPW7kDtylrJlJPq5AKCh2HispDHZO7YYKilN9X+vr8jaGvh0XSpUoUQjFeZt/siW44Mns+4BtcFdnI+NHTtxs/LmvtFHNQ1V6PRYnpL6M+WdqukpfGAE+pLRZ+YG8rKY3n5JmIJyAtorFLAH0vq+TIHu25/rdOH+eh+HWUABJd4q1rrd05sTvUMi5F9hqAqcC4K5/Jg20XiQXk4Gr+4z0WM3bAqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY2xIqfKP5SnKz7Kg73AusImjyjoKsyf2D5yYtLOfIU=;
 b=Hpz2e1pJ+ElkqvYsaxycv63ZrG5JfyQBTc7gSr2Os8P3TcczJ40OQ+wcLnHICxeKF7IWq7Yy2iHSCmWjvDBfAHLmnQKYo4MPUaP6YOcd8p2V758scGl8ORksxD/SC7898WeSBXQqTIpHMFpNFt3AKZvr5D2YHDvEC1z6eGQ4w1Y0qcKCGbLy1JEhpuKjnYd/SHPLH/8waconMStbA/0n8Kg9zCecSPNELp5WT4LPHYuY6Iav4LHYqbiJzmprJN3TTls8zwOeCEF9R5nzG4tQSEYJsrlqvclzwpmXD3WDhJqyVWGXqEx9CLa10fUScQQkRgnnHNQkG5MTyFwy4Zdt7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GVXPR04MB12157.eurprd04.prod.outlook.com (2603:10a6:150:315::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:31:37 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9499.003; Wed, 21 Jan 2026
 10:31:37 +0000
Date: Wed, 21 Jan 2026 18:31:22 +0800
From: Joy Zou <joy.zou@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Message-ID: <20260121103122.GB2474386@shlinux88>
References: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
 <aW+shmRG/K/T/UjX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW+shmRG/K/T/UjX@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GVXPR04MB12157:EE_
X-MS-Office365-Filtering-Correlation-Id: bc82bc31-c1b7-431d-a7c0-08de58d84213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kTjz7aIeaSPsI4/MgAq7B3zx89EKwDHVarcSgYNflqNo+zSq/19wEYxCFeHr?=
 =?us-ascii?Q?fFUXTAHTmGhLzaG2Pus5iqD6SF81MJRXpqgMtgIln1bV+OnKrwv+gNj1fSWN?=
 =?us-ascii?Q?rLKr7W/Aqa1+PFuoEOcWh4FHVaNPOZCmUszyRsP/nxNhT0KMfsTr2NRX8UL5?=
 =?us-ascii?Q?duAYwZhk3UM++RLyV80DX9w+8Xfu8uhS4n1jme8lmwZ3nSVBYiz2H0WnB4zq?=
 =?us-ascii?Q?X9MXkbFgSiFbuBBwTpGVE2Pq/7WqN664WhaXqebeLnXTNmBW1Jy+txdjgx1R?=
 =?us-ascii?Q?n+qO/uQzbt03yT23HJ19rzlLpgKI5oeM5IVWb+AK1NQ8kUe3rtk3un5ko3Ph?=
 =?us-ascii?Q?zMob5yVcnMTPVeR731Z+T/XE7zKIjHpI0OnvE1AjePfTVcBu44BbnLmBU2Lz?=
 =?us-ascii?Q?AaUa0NzTIGKxTDsd+lfg2OuJtOBR7m69gGJtYHxze8hLXYAZlGU0MY3QTTBv?=
 =?us-ascii?Q?b8WLYIcQFbAuSPOzm2PqRzxP8kpDdRxPHtCKLZzmJcKHk2gROBCRDIMLihBI?=
 =?us-ascii?Q?HwlLNXSfe0GPnIf17NxmuBssJSAxuGyB2L64tkxhZy2VgL4NO90UsiqME0LL?=
 =?us-ascii?Q?MttRSKMXRGNiy4qu37f1LeXjqFGviSflmgSNfnCvs4Ic7sZZO23nuRoQxtea?=
 =?us-ascii?Q?oNyQcuEGdA29FzRCypp8bYCE+JdWto+3RGvnFhhQlvQqEKF3ZD38GJjWBg9I?=
 =?us-ascii?Q?jZMN5ldfpQ73WROrxDefn7w8eUexuS9SoYwwGVVeiAl8nkzTjYBOKdmv0cxl?=
 =?us-ascii?Q?jjY1xKv7v8elzuLIvqUJvfB7zheSkREorv1akWJwDHOryt6I4WBZjinZ88gf?=
 =?us-ascii?Q?gaIT5Sd/52/MBPZgbLxFVfBDBMU+bR4ViwYGfqEUVe+wa6sQrBKyUfWnskj5?=
 =?us-ascii?Q?0nby0qqk+3TF9yzbuLpLE/aodMu2mXTrLPbGEqIfiep7e3p70p+mjVf2r8tG?=
 =?us-ascii?Q?lCJS92Tn8zBc+FrmsJM7oc0wlkIidaUUX45jvje8RnT6D84gd8APz9zzcy/Q?=
 =?us-ascii?Q?KRur4To5PsyuDh24S29t6QRtDX/psJVMDynVqJo632bbVz7gTIi17EPHyUHY?=
 =?us-ascii?Q?8/iI4Cw0VDlPTRm0zqIIVcE/Oucr1wLQ1z15WpdpbOfSUVjnOahxE3thBrMe?=
 =?us-ascii?Q?8RaqZ0PhvvBo2EbKyAdN8pTK5bT3OF6CUsFFvf5is3s25WcsYfe3n8LELqZV?=
 =?us-ascii?Q?Hq24l3sjkBMcm+QzIo2H8CpqPz1LF2ctuKO7repHXyGcy/rB5V7i2TVxdDTD?=
 =?us-ascii?Q?7bM2KTJhjC5RcF6s4b0Fb47qMmneaV8o2L/NKtS9CIgBGKiNWANxIrL21+M6?=
 =?us-ascii?Q?qi9WD+4q+cgwmnJn7Z7H8qFs6H6YK0hx72Welc53MuDc/EJDdCjBDfIRj9nX?=
 =?us-ascii?Q?hHHqgAmUy8D7PvokJn1Hcc9lBQ1rfcCKo9N7YPwPySowfmHFUdxOW1nv92EH?=
 =?us-ascii?Q?FkRBlsM3JC56eczQr5bUQi2GckgomSeGv/mZyaOHXlLTnjzuQWZVBPTj15J6?=
 =?us-ascii?Q?HpvZZQfgK/1qZ/PlcYAggAgqrqVTeB+kpH7KzkGNh52NxU2PufWeGE3lc+Zm?=
 =?us-ascii?Q?8KWNdB9wmd91LDuf9JDSWtHwU4p7cVc88BQ138HbvEV7cRz1w9pZLoruFutN?=
 =?us-ascii?Q?+dvAyF/0iEnnXgNA5Ex68cw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mjWgMyvWozwgdPv2p901D5Y1yA8/TRKLk/Z4hSNYKTtbixJzdYce4rZPMli4?=
 =?us-ascii?Q?dAndnsTfMh9zyQctsSTnb8y8OsMvlHZRQAcTcTg9z/qsNlrxo0YfFZArs6xS?=
 =?us-ascii?Q?iSJyT6ajuDavdf86DVPcgZuWZcabR9Y8mlBkA/HRtaO1bNUQK9bsYdOZ9WfK?=
 =?us-ascii?Q?2PG/zmqfWC0fwtTIRfl2kJPf5L5QeXyxfOu30qUKjGs4myK3iYHaXcM8ZgdT?=
 =?us-ascii?Q?/f2SBzUuqGggazUpxrGpo6lj5JiLNFumFx/IsNlvrtxYMt9E9hSDML2+1Sbd?=
 =?us-ascii?Q?B9KO4L+UPsdER807ZF7xIidsaVgbautY2qIbYWK4VdzOYe8+8ayW813pPNSW?=
 =?us-ascii?Q?rqiBjsanVy6oac1k1RScvWjih5L0+s3IKGMKAs8hQnvq26/xPjZnIdq+6wBz?=
 =?us-ascii?Q?Hh99cEbwxkfoX3Lc7QaXvce+2XyF67E82zmp1+LuvMc7vU/DOg3lrQ1ChsA5?=
 =?us-ascii?Q?yEoogFcc2rnoeNmvNb1Tb03yv9lw+Vfj0ppdcFN07cfxoY381RdJzZEUs8t3?=
 =?us-ascii?Q?RgDWfowvt1TukPF2kVX9gNwWu0c+hKojEmT20UEg1Zclojc2tO7IjRMZcEl6?=
 =?us-ascii?Q?Xea/xC43zlFGXzhhxhubcaa9kF7OFRF5/QE5I69LJ+SqZEnhDje55gRi9Rs8?=
 =?us-ascii?Q?Po5GMhbgdZy5E6yTmOs2JbAtyIG18m3q5JccrYeH68QyirpdpL+u4z6x9+s4?=
 =?us-ascii?Q?L7t1/G3Xk6mVk2tZx46BwF+0xiJSnOB6SOOlgrjGtqL24LZmYqDbxx0XTBkJ?=
 =?us-ascii?Q?3Y3EzzisHzWXvBMwjeGd+/zgsX4enAu8b8dS6O59Qby5p88f3cGjPqvALigE?=
 =?us-ascii?Q?WyIpYtLDyFAQRnp1elNFqjgJrMd2dJ2QiOdMEgxwuvO5PyA/REjbPS3scLp3?=
 =?us-ascii?Q?hkr8ot1DhU2//J69VgzwtLXIgznYCuu5gcZjeijIGDEfDrPjf1UjtH1X/0PJ?=
 =?us-ascii?Q?uhafmsZf82SCbJN22wUbRPCELTieoUdD0gcNquaxF/9hn3vLj5WMtUl6iCj3?=
 =?us-ascii?Q?bn9N1phtahWYKCq5uYgcDYHKCFUI2odLm0TLjlAB/TEUnG0HZpvMlWeFEfUb?=
 =?us-ascii?Q?LDRqc66yeNQdPh1HqJxNE7MBjRfu7zcVRLg2h9sm1+quuS6hvgbbqMVl0uAY?=
 =?us-ascii?Q?BVU4zrXAF2KXAeC5H3ELvoniullpaPUpiCpXREsvGwGourNYVhgzdHjqoITg?=
 =?us-ascii?Q?kKZJUzeWnB3apKU0enMb33hLMnMgY3eJDcQj5mFKZQ1nOO99cldWcoywonDb?=
 =?us-ascii?Q?CAu+uU0dti/nsAugQ2iKLCoStZ8kGftvt/8JAJT50Z/fJFH2rjYU2l1MMR1T?=
 =?us-ascii?Q?5Ewkf4HYZC9PleYphIg5wPCadNPyY87py+YEMAt12OSKS9kYHigqVxYSMj37?=
 =?us-ascii?Q?8H1SM34gJIrdiUmhs4lNjZb3IV0v1qSnkTCfShSHM3qRvDhXVBUKTMizxKfR?=
 =?us-ascii?Q?HaLfx05VjHMGeRqXT3YWhUtKM3obtz2c4VlgWwkwc5WFPImyEhT5ZDgMQWV4?=
 =?us-ascii?Q?6JCIu35xP2pP8cxteV87E6G4geEt0AX9hovupoek94s0wiLAkyHLmzUENL15?=
 =?us-ascii?Q?vAcXxhF8LLWmYfpNLRYPM2+Qt6DRDFZ3MBkwuUjwcCiGKbdwomCzYL8NiNLI?=
 =?us-ascii?Q?58BHUuA7/0aE3lbNiL72QBjN8tjPksz+S6rtWmar59c+UB2gTXSWTn/zN67P?=
 =?us-ascii?Q?usGBJ3SCuVIc9LU4+8h5oFnISxTm5OZeoE1ozI234542ADOJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc82bc31-c1b7-431d-a7c0-08de58d84213
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:31:37.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAaP4XMipS8oEn96M555MiiOwp2bclTK4Gm0Y8i5HN177dGBk+AIJS3PkkgRl7ZY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12157

On Tue, Jan 20, 2026 at 11:25:42AM -0500, Frank Li wrote:
> On Tue, Jan 20, 2026 at 04:35:50PM +0800, Joy Zou wrote:
> > Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> > use by V2X (Vehicle-to-Everything) fast hash operations.
> >
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > ---
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
> >  				reg = <0x42000000 0x210000>;
> >  				#dma-cells = <3>;
> >  				dma-channels = <64>;
> > +				dma-channel-mask = <0x3>;
> 
> Can you add comments here? v2x needn't dt node?
Yes! V2X operates on a dedicated M-core and needn't DT node.
Just reserve the communication channel for V2X.
BR
Joy Zou
> 
> Frank
> 
> >  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> >
> > ---
> > base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> > change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
> >
> > Best regards,
> > --
> > Joy Zou <joy.zou@nxp.com>
> >
