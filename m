Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A362D0600
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630093; cv=fail; b=qxSTSCtyEAFKxnEU90vHQuQe3ptqeex8gR9LwgRMb49rheH1ZRcoXAPxWql03NCM7GyU+mpw1x8p7GLy20uljO1jtCRlJCyNGZoTEgYp6I99w6Z2cTF5aiAqqEmaj07nrCOb78hLp71towI2HjC/K/JcrfBiF+qaOO8MM/8zyis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630093; c=relaxed/simple;
	bh=C3SNtLpqwIdft89pFChhQO9mr9Kv2e8Gv/NbLBO84IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VzRGCCXNdnGg8WwjE0bi5gWhZG2fCuH0d3OKEnI32Hvwj87Ou1Z277HaggL23m/XpTOX0LUP6Cy6+Fiy4jHrlC9wRu30FiDgDseie/gEs4yAsNGPKlFDJ7pp+xeb5KECajxoffvUpU6q6zYrjU1HjBE2twAPDkyzkAWPxIbCkC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K1SzTj1L; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K1SzTj1L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3/umoAbaKBZLPWM1UBmE8pA+cKlQmmcx6DCa/e/UhbQaOZKYSBAUmMDdeNfB3mhPldbemk50Z19Yp0VHNN/FCexoSucPJHIRK583ap/Iykkd+B12E70b9I0hC0lba7Kbq9Coh6FAfoIkKYfQWtyDFHy+mZFAb0OFNzzzWgtWEURsZu6kXBAZYFimS41UhjLaAj4hqvcaNt+ZL1GnsMumSMFjKyDgwWcrmO75D0HKDDO3oksso8iqDYM5Jjw/c+cAkXoP23Ngi9bhwnPCpLt2jsjxfOEAZkLhrexZ6bc9Dp7d5uM6qOb0weWqI83gKzTbA6C8SYo/knHP831WxgM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMPpmAiEeKnABQZWG2K0fMDDlaSVP3CPzjJC/u/T4xI=;
 b=K+Twp7tzBFPpT5vrmQqm8JwpVSR3ILiLnnYkU9hJnefuwQMAIfsVscr9D/Fa41M0Nf8LGpHoaMPWeaIIGlfWuqhVFU8y93hEUqszHyziP/LbZHRIsJFB3QNG2olktxMIwxLQWH4b2t9WAuSitSwjL3eefw2rI7sO5VGZl1Vn4RHxiN3V87jC+gf7SWNOG4LaHWrmoaCe6coMdrEAfQh6Kjc3L7upub2oRNZYBYT4yeTOj+joWUfLVXJVI65IRlGIkPWKOpOG01EqGiIg5RWIgKFKh30i7P06FbffM5hTi+tyBTDuYShB6d5nDH6rHV0wNqlxCafhUGs8jxoK7lmA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMPpmAiEeKnABQZWG2K0fMDDlaSVP3CPzjJC/u/T4xI=;
 b=K1SzTj1LjmlNek31apxSu9eR8YlDIuqssmDzvh0BQpjQoUEY44QoThbg7ZZLqIiCY040ynzVo2RmOowK4T/4pN3R3o14yb1QMPs+KjnX8FBj15dUISua5NguCYnEmsQ1QGYxoNv12P/c8YHTX7lmbdjteim9bAn7DxWcY1X9/EZ3QfwpUQe5iRPf4odYvaXvWpcQf/tsn7jN4HjZaUt/k9CZ7mAedfCOfnM55gXJj6lUasmwrEYiZr7rZU85Pr/LiQL/SEgQHwwjD8Vxq6u9EYVIKmNOyYYYdpVaylBtCDrSJ7scoydv6YI/AMqJPSHtei7rVf78nBGtdF7gguTYQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9275.eurprd04.prod.outlook.com (2603:10a6:10:356::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 19:54:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 19:54:47 +0000
Date: Wed, 28 Jan 2026 14:54:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d9bdb4-b60d-40a9-c10b-08de5ea7172f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mlfpUR1hzp1k2asZjXUsvVy0xDPhEKSxEv7koj8sK506n3zDYJXHEqh68t1K?=
 =?us-ascii?Q?Xcv2UYUkUFZKqSUB1gZQ4B49Hg8aOptjYHFzltwYIyW53HOp9VmrAQefWbwD?=
 =?us-ascii?Q?zK5TSCu5qXXBwQ4dM9wPH5IDTWKEI1bXsnZznpdHcWmFM2+y8SUcYjEDhiFI?=
 =?us-ascii?Q?+8H7A5V/GWA2ryVqJE+ZmXAUhFPPpjS8P1obWC9IEg8/EfMsPwGxR5Nr293w?=
 =?us-ascii?Q?vh/1gm8hOYUogMl8uwyEPoYvJg6sTgSWiagHTZFCc7k8LuHOUi2fsasqu5+F?=
 =?us-ascii?Q?zEqxQTmJCbx8UXg1RQWkt/Kc1r9wUHPrAEi8F7mhopVDmt+nux6DtYE+uqNp?=
 =?us-ascii?Q?zUaUHWpw3tFhW3rSvkboPylM2Rg2pTPK1ROFAmCJSg4WO/G98vQ8dyeZPmDS?=
 =?us-ascii?Q?7AiJe/rv7N97oVF2AcY9JFD6oGZTGBYRFRysggQz1BnS1oFNLJqtum1KOxon?=
 =?us-ascii?Q?CTCLidLu1FPUCSWk50ef5HGacjjZOtWKOxhZbMOREaj/xQcJlTW5IYaYnmIx?=
 =?us-ascii?Q?DK4DdPIhGpdyrtk3ZvnFfuaqFMgT2PXTGqXPn767ni9YLyp6AuXtZtg5cLXU?=
 =?us-ascii?Q?Dj9eWwbGsy8h1zH/sWiWsd8xpOMst4ViMmfkn6ZWxNnJQfBAirhlmMC+LTUx?=
 =?us-ascii?Q?0Y8G7yXWv6WpUFyMe+PnUCPlnSTeHIeIQ7sOxNOhzVhGE3bcQYUZZ/QygfW4?=
 =?us-ascii?Q?EaG/yjjlcB6r4l1O8ANDy7FLKcfcJpQ7C4+rat24gz62j4aPTESDtg4WUJ0j?=
 =?us-ascii?Q?Swd65mBbfVUbGtEni211VIEcy5plLBEBjgj2iIerCmw0gdkSD7st1piqPart?=
 =?us-ascii?Q?BeiKw/DG+csTtM8j9U01Xa+vp0qYb5Dgzt0Mu+9nRbsgMghm2GLgwg21RQS1?=
 =?us-ascii?Q?Ow9bPC0ANdJKzG/emOmv0DFCOXGS4nY/IlRYqMeTBIqAtLsutpU7L+/fPcBz?=
 =?us-ascii?Q?60NS7vlY5gJfRqn/uPzwi4miqXao6xJ0Kek+Qzl7Bxsec+nOdyXhl5AQpgcX?=
 =?us-ascii?Q?/tC40o1Um7iCPpMkPUYkflqJsbe6G3VGSN5ASWBA4j41RYANFUgDb2coiNxS?=
 =?us-ascii?Q?FQUItcKDCSB3mCDCPETZVFo9J8v5oac+6IFKmBl4Hyh+CMTXMb0k2+JDJAUX?=
 =?us-ascii?Q?35G79Hk8T70CQ4S6+1MYA29p5qXdkGL8IQ5Oc+mO3uBy4A+jmC+RsF0TAzQn?=
 =?us-ascii?Q?kKlHEsTZIYilZ1nxgiU6vzUq/ZG3578CG2DweWIb2vzNyv6o8SvH+/fAMuAh?=
 =?us-ascii?Q?oqfA3iTvwd3YwX3chaJ9LoMmQnoePiWgt4KhS9qhTblU+Rv2/qW6htRKj8ku?=
 =?us-ascii?Q?8KwxfimP2KU+WMuptAO+7VUh/+k5cqi9zQk+S6uDiymNAO7eT9IILBmM6Vos?=
 =?us-ascii?Q?3NwvidtFV9d8s17n+cRBgHtyiirjRPjyWm9Ci86IaCkXBGSkHkORiqcQj+Qj?=
 =?us-ascii?Q?wjFpz0zJwoJSeajSVjAt2G5HToi76k0SUHgMnik8PpeTiz4BvB1HegMAipeb?=
 =?us-ascii?Q?QsQehYG4M87PGkOgjjszNi5v6UAJvbN9xKvDbs6210wicSpZ8Lq3Od9Z7pdq?=
 =?us-ascii?Q?HxIcbJDyVt5fCetOY9IhA7RnZ/IBmzl0Q6W+lesqQJjE2TGNHdqiSXRKnAnT?=
 =?us-ascii?Q?JAh9SzY3zY9KxYeB9s0hLGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U5Q7FVbH7MjKOrVWH8h0pMqVdUCfTxTvhSlQ8/cVqUAjXoPVm7Q7fUrRkCi1?=
 =?us-ascii?Q?T8SXIeMji4lhPxBCCgkO6gdE5spMwD0Z2vy8gXQVO2+r/dBszRnVdbF1JGT+?=
 =?us-ascii?Q?+jtnO0TYc7Q2AqHVaDLVnwS3pG9LH92ODabbnfIMWD+cvFTWTqlNiJybrNzu?=
 =?us-ascii?Q?KnffnNiGAmFeZeCjEV0gDTxaytJRT5yJUJANcDNlX6WefmQsSuJTXPEkTegl?=
 =?us-ascii?Q?eg0nDrQMvgRZIRExFa9y9OAHLqrAkWwKsmvKGiG5phJCryceyqaiOJJJ5Aaz?=
 =?us-ascii?Q?Uwy4/1qEmABYpOP9NroOAjdhH+hkDxNzhVDO11JW3FewXNsNUnyu7+tQiUaY?=
 =?us-ascii?Q?9dbap+Gf3Yf6Csn9DChEljvNm1juiyrkZ+EyIuKB1185eiG5aIg25x9FmuXX?=
 =?us-ascii?Q?BQtWT5z0s8Cu3IKxFRxyg1L+vuto95G/PGrcdhtiWKaBlXYmueZALkyKa9Yr?=
 =?us-ascii?Q?3FaCsf14lDmI9nzD5uOCuJF2yY2YDf/1RwQymUBgA1Iencjy982BGqZ9aHkY?=
 =?us-ascii?Q?bAj7XUELX6E01W9s5whiVpzDf8tUgLl3hFxDfIBxDzptitEuhit9f/2w/INs?=
 =?us-ascii?Q?r1WuXR6QGyq2H3H1MdzbbtJQXH49bMDKvceGjhbnzzFsQM+P+eq7x+f+t1ZH?=
 =?us-ascii?Q?rvnrElP8cU+CtwJUvt+FOSbo9tDnDlqDRE7PgDZQ2tiYAEnc9uSlqXLlfQwV?=
 =?us-ascii?Q?YtJe04K1B7pu1/a34t0vovGLC4WwDPrIcB8iN0Ev9HGaOmJgihCUogcw4rY9?=
 =?us-ascii?Q?qLdRpvxAr6pZqeO0+VPcTdJbZ6PP7abWfo++fO+bm5ZsOsvHbVLTCZBds6/i?=
 =?us-ascii?Q?82FQdWxS1TjSYZOvRx8m3CyYtb5bTPNqFooko6+hsKtYvs5Ioxa4NTYFJDJ6?=
 =?us-ascii?Q?uDEXyA7V+Oc0mH3hgCSMeyAAfSH1E+16YLrFStrVKEhy6lSoY82d7V76UQqc?=
 =?us-ascii?Q?q0LDJuxspgKoiEzMau04L5NU63w6amK2IKC1z9/JrCX5Ob3uazRzxoytrQKc?=
 =?us-ascii?Q?chv6MwfQY2buBtZX19fGo8RIgUZNjuZt8iHgucj/AT72qWunxrZ0QbUhOBG7?=
 =?us-ascii?Q?+CW42QJhxikQQL651K2Bv+n7YIYhNODt4UFv+ZoOwBhkdXdmtqUkhWzBJpVZ?=
 =?us-ascii?Q?XCZiun5FJw7xpw4xZSnzicVmBGndakxPsuYkObypkG+LrlmwpSDFoFDElKkM?=
 =?us-ascii?Q?5H5gpPZyXEI2AcmZ+pBCk5Rey6A4XWpFxieUGM9+uZXeLDWoUPPzO6f/xj1q?=
 =?us-ascii?Q?Y4setX0PFcvty5/847UcTVQA0v9L5eNksj7gHUm+73fCNbNbfx145yAQQnPv?=
 =?us-ascii?Q?ICSo3jyRZvGM4HUAsBqqd0BtyUSxieBx+bRdZR6i9GQEm888yW/3ItygEmuA?=
 =?us-ascii?Q?xrqX8+IBrMM1s8twrPMBx1CcU4YYvITfy8SizFcjeg2H8f0oQ6Rz/8yLBt5H?=
 =?us-ascii?Q?/1mbJz/yBTkeCkYzAIZ8iOwOW2u12l58If4yFMRKYAckykIthKZXs5E0gUbm?=
 =?us-ascii?Q?KzsbAp68AY49Ra1sPP4JE+dQorlGrQSA3pcLwm4bP1ELoo0FaSEfuOhwmE95?=
 =?us-ascii?Q?ZvUcvm+hUUQjZPQ9FkdUhGTPOR9tqd5O3ayHqnnrIfdqOP4dwI+eB2f2caWe?=
 =?us-ascii?Q?eW2XYWOYQKgR+Ul8WQzWWBHLmpGqSbd8zUIXc92lTLRIncHziuXwVjvp11Tv?=
 =?us-ascii?Q?swyvsa/oG9BOKLExmJtxuyeIShunUYl9Z+rIcJsGIiVSiMXAvVMyGOMeNDTQ?=
 =?us-ascii?Q?T25qyOKfHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d9bdb4-b60d-40a9-c10b-08de5ea7172f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:54:47.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyRH3UFwlKDtwi/yW2NBnWDSZ0U5MhGhUSjbONJ96rfoVZtz22N/3HcX8K67oZO7b1DSl/QFOQhrnfCF//GFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9275

On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
> Hi Frank,
>
> On 10/15/25 21:48, Frank Li wrote:
> > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> > warnings:
> > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> >
> > Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> I'll take it for v6.19, thank you.
>
> If you have any other changes in the queue, please feel free to send them also.

Vladimir Zapolskiy:

	look like you missed this patch.

Frank

>
> > ---
> > Resend
> > - colloect R-b tags.
> >
> > change in v2
> > - move to nxp lpc32xx.yaml
> > - fix ea,lpc4357-developers-kit include lpc4337
> > ---
> >   .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > index 6b7f5e6f99cfb..1e290f16a7a50 100644
> > --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > @@ -22,5 +22,27 @@ properties:
> >                 - phytec,phy3250
> >             - const: nxp,lpc3250
> > +      - items:
> > +          - enum:
> > +              - ea,lpc4357-developers-kit
> > +          - const: nxp,lpc4357
> > +          - const: nxp,lpc4350
> > +
> > +      - items:
> > +          - enum:
> > +              - ciaa,lpc4337
> > +          - const: nxp,lpc4337
> > +          - const: nxp,lpc4350
> > +
> > +      - items:
> > +          - enum:
> > +              - hitex,lpc4350-eval-board
> > +          - const: nxp,lpc4350
> > +
> > +      - items:
> > +          - enum:
> > +              - myir,myd-lpc4357
> > +          - const: nxp,lpc4357
> > +
> >   additionalProperties: true
> >   ...
>
> --
> Best wishes,
> Vladimir
