Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C813AC00
	for <imx@lists.linux.dev>; Fri,  8 May 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271335; cv=fail; b=SdtIUZ297gk9BtmXAGeRp8+yKVJ8cnKDFGbyfQ4Okfk7YXd5ea5VzMnM5bFh7CUP4Z1YTsl0Y62h6IbLXVKI+e4MkO+T1oZ4Qg0AfheencGB0kRgTHWq79YkP37jJYM4Rf+P6Gf+sE5oo06YluXH0CYcBphZHj/vv5jAryON0bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271335; c=relaxed/simple;
	bh=3Lfo/40dPaaJHOFy05G8KJRxIqkd+0JnnDfEA3EMmRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AiIwrcDrWe9B59n0lq//Nk+Lr4Lelps5WDDUcUa7fqq2/bw9SegVH1qE6WTRZejPidIp/6BkejQorLTumlbElW6s9BzBTLl4J0NNxz8O4/0G5DJu9x5us0dmEcCpDhKf7hzwsjKl9oqRt2PQy0drU34pzHDl5XU6i9cgX3fDNzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=deaAeHNj; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="deaAeHNj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJzhl7LgRyV3jW7dQfzmGisV1hjrEtuihTh6XQXcM/y1oaMZuaz7HcfPFyp/xlGNcKNEDBkWcAEUfsRWcoyaz5JTWnXmXJ9uR+pSU+VdnxEThlkgR/TOHjI6cfWq2Hwsq4+7LWELCVXrs0/WON+W1g4ztVi9DV7bAMqQLrkpp8qLepKL/a2H3dewpCAcmqR4FusaTULHYbl8Z0NJVsAq9JSTlYfgB61QDQcMjmfl7o6p82cC4Yy3sQnj8e33/Tg47t9Ov+R5g+o4zlvRJ+d/64wqmQtTb53Aclz/xCCC/URx6LXfJOcHs5SymdFUT3H6IyDRZ+y+Sdtl/tfsxA81+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lfo/40dPaaJHOFy05G8KJRxIqkd+0JnnDfEA3EMmRc=;
 b=srJ9eMXnNir8O7qOtnxADkAxt9TtILOdCnID+GUucL9e+1QujArgr3rM+WP3neuK3GRw89CfYlNQCeP1XxgoUvrrSBHp2/3F/62ixJV6Ns8augIreHa2ezqBiTZZn4Gl2E+oe0h3SyA7vPBxffELAAHKojYaYs3whds1MsnMBa5tXIN6O6R05vjrFqf9DUCLPowNIBIktar5XyzHFqIo5xayOwx+DxtzEIPCVLnv2hi2l7x164pct8Hrth37UQ2FMPHccph3H/waKt3vWHkkECW2ghVy8FMxdLgZxVyMtmnubbQUkJyI3HH4Wc4YJ+wphi2CHVHOIIbBLETyf72cWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lfo/40dPaaJHOFy05G8KJRxIqkd+0JnnDfEA3EMmRc=;
 b=deaAeHNjK2GFTqeg80T8rInrs2Wn3sYAeLQ97Z+PtdEd8OXhHIwAfJJVkQLPL4XQdWxAeQgVpx8ffhuE38QHlgYpb8l0E3InwKQAvWafzkiVS8DNx+RHQT4+TrFyq91lKKpg6MuodJmLOu+RDDKop/jKIAlVVmxVuknz+NdKeb0BmcSPxzjP36dDtwNc8GjxF84PJjW+xMk1MON+Ix6qNcGJxe/Pd9dkwuHo0lExCQ2X6CsFqhttivwPw7P+eelNRUNzitLuvgf9/b3myOWNe6YXxTGIvS43zv/ohiyhVcvAYjDe7id1tFjM3rJrsoGh5d6KkAGgBojwj37pqcIMsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 20:15:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 20:15:31 +0000
Date: Fri, 8 May 2026 16:15:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <af5EWnJyP6leh5ao@lizhi-Precision-Tower-5810>
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
 <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
 <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: f449f47c-ae13-40cb-124d-08dead3e8db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HSvwqh86PxmEl03FktTgUKLiyOYLJ5hpq/fgt/fdTJsqwwz7xIIfROYRp0l/9lXGdNwj+65ZvHFfrFCY9LsN00UVxRJwXzntS5JbrjnxUhYhxfmASfSVvD3lgUV/rTaEKUHyRgMEVBj//99NrUrnSYkoH9OYF59OkSinUnZvgQTrtjzN36X4jM/i2R1Y0sE7FiWWp5wiYqgNsA4DDNl81OjK0cK+DHnV2K7tQR1h7XqxOGnYxtONyHdfCaxDLFW0o+fwbWPzgRwWKhNlf/z+xMaRr7bgtlh2cHjAekvrneEvlZbJuRQsCt43D9iGwViBK7FdzbjV9/ezjuoIu1tq+hbZW3AtTLgNN7nNwX1iDKVXXP2gkhM8pCO0jUAweS1wu1S7oPUqastWp2cGAM6xsffuP02RvNLE0PuUHbdzsRuUe9/q9dJkcBgheICXU/r63Oa63EIZb6MuLhuveBdw0iJoCtQL8V7FvcYEq1EKP6he1nu0ZTrY9bu9xMszF7SBsQ0XoVarhiIaaflY5Akitv9YDRdb+WzY0V0IyD8yhSqzSdPPSL562ubuAFRDkck4/KS5P5ON9l845UCf/rUwlcIAGGeq2+piQp4be1MMUoRdbSZD/kx8PAqjqn6xeaeulB7KgtIUFShj0+quBFnNIYFEtgu1AY99bs5kgVgujfM3UgFeAyUa62Oc1KVq5n/BOth4pkPYwfzhOmgqZH/REwF3dI9Wy1KPMC40JOdoJzibHV0gZr6HX87yg4BfVMUI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oYhu14FlSAD1t8Svil1Te3bSc6tfiwAhMh31dvFUOFKEui5ddeEwKDFLyC7Q?=
 =?us-ascii?Q?ynY8Ap+vJVmfJaFOUu6ZFR7XIKX9rVwcn76AH6s1hspeiQUfH0Fv9nc4nnO4?=
 =?us-ascii?Q?hhiePpONSLIITPHKtBXVpv5AN0zkrf+4QN0LPtjOyxPZPEla/pREAn7O3+c3?=
 =?us-ascii?Q?5fy7y/VKDoz6w3NRQUsl9lgoWnxejJ21xoBQsvl4XtjlZEvoRVtyDqynj1kp?=
 =?us-ascii?Q?mkDbbu1ztyOQoD5Fjar2zR6IA4cWedO7ZZoZ28LQJBWKlKc//JwDDfSP8O1G?=
 =?us-ascii?Q?4DawsdLlwNmWIQPJEy8vb6j3LwgaDznoFPy5iI/Tge+XCGlEC6Wb4OqUqdDg?=
 =?us-ascii?Q?oEe9Gfdn+s+lj4C0A2pgwCetjLcpmyJH2zXrqaCuvWGNtkvdsbbiYhJ8rnQv?=
 =?us-ascii?Q?PKayiT9jMyK6/fjHSIcCTdf0ktbISlQwq3xsxl4WrcJ6gWUA+/s0tRckz09U?=
 =?us-ascii?Q?QgRTxsNFntiO0ghAW66pH22oU+m2dZAcCYUL9/h+cTJIzk7S2m3j4I7HC0ES?=
 =?us-ascii?Q?YMPECpjwbitLLfUHDSGwvrKuz+aCHy3es/iSVAGKRM+y0nT2Ty+o3wxZ8n3b?=
 =?us-ascii?Q?ZndAviwbCZMeczR2noKtDsTdSO4D9YUDpb/Q1+forH5tdB3Gh0RETrc4sSUa?=
 =?us-ascii?Q?rS/x0p9WvR9WGWbQkx0kEySOjl7kBexkBoZ+YCNRTWeSD31m5EECbqI0QYIO?=
 =?us-ascii?Q?OyqpwzlU2SoxrZdN5TCunpJla+tczN//hvutn+ONn7CtolOMaI74qycsQwzz?=
 =?us-ascii?Q?iFGV6Rle8ZXMEDTyEM2ZTgLllRINdoUdVyQ9icfBuHi0+tf1XUHP9vtddI81?=
 =?us-ascii?Q?z9exDTx5mQaUvplOCruUEFlpEhrrZ8aiwFLFZBI+HU4YjHsBjD517MU2WdBj?=
 =?us-ascii?Q?Wpr2WPydgmnZ72oVs45RRvJJc+16dOGmmg+T6+gKzt5xcZQb+5z8JBGTzd0X?=
 =?us-ascii?Q?blr/QhGVLVtJXvoyppuBUIVlMVC0M/fSHJfBxcHxbu8ItR7o42tBMhgKYKMu?=
 =?us-ascii?Q?rHAYe6OKtSujNc5HWSQXtEJ+vNjrvNww3Lwezp4JNJPYFj2GtsqiIuZC13Ax?=
 =?us-ascii?Q?jw/aAn2BhP9tUzO18VGtqJRLY8uBDveFvo/XCN6AzkfDPjBk5dcxzwgOSUPw?=
 =?us-ascii?Q?UlqKG5HuoSmWFhHBZL5QTy377EyQzOWKOOCSWCVzx/qFuMdG0nbUz+/YXqqe?=
 =?us-ascii?Q?ScrcySvEdTnAFfdkU38h1Ik185Qe6NszPTT01eaOW16cje3lhVD/7qbpaGx9?=
 =?us-ascii?Q?3i56pS0K9yRmRbmI2nH34iaJ2V/DoNN5YEi7HUDIwiLswMicLCRc9MH3Nfde?=
 =?us-ascii?Q?vCsKBB/+QV5Rw7hKqnEWBDoYNbYKOy8+VPFcNjCGyRCt67euZhb0yml+eBD/?=
 =?us-ascii?Q?aQPa8l+W/xRv3DbCPGFMLiAw+NeIp34eFjliZ0100CrL5VpaCXw77kbM/foW?=
 =?us-ascii?Q?x2XkIWJyTsq43u8/hDipQ44uuT9ljMcgtp9Km8D5bZNeHhStVIscV7oOmyjW?=
 =?us-ascii?Q?wsWMsMR5shxiN44SfV3GU9EdTlNFGqnOxlFFOgNQSX/C9cD+JHPHjlri+OV8?=
 =?us-ascii?Q?U37SQHQ2tdMprbk0TxxjATIUB0q1LPUoV0AaYEpyUbH+klnABll+Khp19vyI?=
 =?us-ascii?Q?N3Y0gNjBymIEf+VM0E9OztadJQKHUwIRdu3z6I8QlIYclT0AgjlRoHxFq94x?=
 =?us-ascii?Q?kxvnlf7SEmEV/qNhjim+ccrs+m+Cbee7LyPL4eCFZ5OZQpfMkcIIWEP0RXX7?=
 =?us-ascii?Q?HX85B3fLqA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f449f47c-ae13-40cb-124d-08dead3e8db2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 20:15:31.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9/KHWD1HmbcLbbZvvcgy82ckoe44zfTxn160AwohzNMdu56BKT226Os6eZe+kIeodruKmrUWevy4jMCfzu4ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559

On Fri, May 08, 2026 at 06:20:10PM +0200, Marek Vasut wrote:
> On 5/8/26 5:46 PM, Frank Li wrote:
>
> Hello Frank,
>
> > > this patchset is now split. How can we proceed ?
> >
> > I am thinking about it. I found an old thread
> > https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
> >
> > The current code base already supportted partitial of it, such as gpio and
> > irq map for connector.
> >
> > Internal chancel liu have prepared version by use nexus mapping for audio
> > boards, which almost done to send out to review.
> >
> > I want to wait for a little bit well to resolve or partitial resolve N x M
> > problem.
> DT connectors have been discussed for the last 10 or so years and three is
> still no real progress.
>
> I would be happy to send a follow up patchset which would convert the DTOs
> to whatever connector implementation format lands in the future, but I am
> concerned that waiting for DT connectors will block this patchset from
> landing for a long time.
>
> So how about finalizing this patchset, landing it, and once connectors
> become available, I will send a follow up conversion patchset ? Would that
> be workable for you ?

We still have times, can you wait for chancel liu's patch for a while to
check if his method can help this situation.

Frank
