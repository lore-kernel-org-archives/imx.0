Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D23803E3
	for <imx@lists.linux.dev>; Tue, 12 May 2026 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610115; cv=fail; b=DPEZfJmG3vmS204ZHxxieC0KJu/IA9hlN1mzh3ch3gkGe+oYnb8cvmifTsceLR0BqWrV513/IxtUpCwFuUmJYvbRkPh+zEO4VmV6U/J7sCRZJpDGBey6PdUUZXldnAPUWLTKYat5ZPYL59/bL+lLldXMZ8ebK+71crLELrkEUWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610115; c=relaxed/simple;
	bh=B2aAJ9TuVumjmktTliYZC2VvoKV1A/IDP5kx95hVuf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bh/GpMrXETVnjHUmv01kFTVYAEYtha6bYfJhqGNVlSgj5lckWSkY8lua4sQ0OfIa7D1LjlGjExY6YeSOXNw+Js+E69edCbaparQfrh7XWpDLegiMjiyikLR7fElyuE0Hi5PTlPDgnj6SOKK2mLXO/j6VTAHMVTfw36MVQNboCDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dJGJb1el; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dJGJb1el"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OD0cB6cxxs5LxLkdiFbV7ty5b+L/RmJ5Xr5vfHpmOg1X9PBKyG0VyJFVDaNL3L2Wm5hH7HttxRVtCucaB65wJlN4eunZ4qh6ftg7WW0+bRCloegXXpBMdhiS3DgU7kyCrxvRjC1vw0zg4bStGYH1THiRkNxIvRjOv3BNQl2ApAO70tIPYbMKq3Eg36v5JAFYHzkWo2KOxASsNDBwZGRUk7IVOVdrsnIGYUoTfF+HuLeSsjSZPeI3+VIzt0kaM5X8Uhj2Neu+KwK0FDTfGae0KCTJ2x2ws6b5Lbyyz2+lSYCajuFyNPbZFLMaWsVO0pYXIm9khGl7HJpf+6hqsijhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AW2r2ZRti2kt6ntYBazQAvxQCdr4FodyRRBhgu51TQ=;
 b=zRj4NJg7bkXLln+5xlo7EbiH+kAlNPJKnNTSvlXwtR0bU3OJafXpCPNA4n0T+aYbjnRAajdGzMzk3iDBpj+7UsCmmOJkrJvafKizpXHytb5m6mbDYTOHH9FtknRgNST/IiKAt+U6PbhVF62wbwRGzdovMSKN3jj5+IwB6lJXKtC1vtWTNd3S+CwG/weZXbqHJqpGqr9R44Z91/SmsFT2bVpoSRlIVszV2xADmEGOLeTVsHlraNftugtlbuytVYAexDwPIc3hSEnlIteTMA+Rsk2+8imny19ls7ZGFpTAscEGVZSOm/lP49gSCDhN75rsrBSZtAi0uvw9aL8AmmsjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AW2r2ZRti2kt6ntYBazQAvxQCdr4FodyRRBhgu51TQ=;
 b=dJGJb1elOAjN2WqDYjcav+k+MXowF0Fmx6TrY5KcrBqggMwJavTSj+r7mM0Pg5sMKOOZFhhxzWnKrqvALq4Fs8laxTWNXMrDIg2CktbdIBt0PryKZJIUq1obKUEx8z/bJoSOT0deCt0a4spjgx7fnh/jev2/bTS3dA/3n3ZMK5KaYj9RIYhxY5AnCRmuY6RgXhD5HJepkw6dI5S3j+EysxeiEGwg8BWjutucVCrDME9lSvY7oC+HQAxELKGcg9ygGD4g+pHSyjndRKvgDyoPeKJDX44qeGTPxDEJwdp1GcnOgdFRtROhGxR/6biPARPdr7ycIoM7AXiCwdEgS7kV7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB7014.eurprd04.prod.outlook.com (2603:10a6:20b:121::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:21:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:21:50 +0000
Date: Tue, 12 May 2026 14:21:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:DRM DRIVERS FOR FREESCALE IMX 5/6" <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: add deprecated property
 'port' and 'display-timings'
Message-ID: <agNvt9RbRFQ395uE@lizhi-Precision-Tower-5810>
References: <20260511220924.1905571-1-Frank.Li@nxp.com>
 <20260512-surgery-operative-046a90f84ef8@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-surgery-operative-046a90f84ef8@spud>
X-ClientProxiedBy: SA1P222CA0124.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 54aaa0b9-f502-4d08-1b3c-08deb0535616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	O47xgM4lZir3axNSg4+paubTH2clLjEdxwh6J2YL4tKeI9c72mRVoW//xxePTxJiY9lmgbdjPVrvK775Tk6/RRRKOcYLYbW8XOKSvH+xNyW1n9eEXpnRYoFkPpgVd11aLMdMqdbSU4HB5VpHka4Wbxd9QiTnepl9NFwPgYDV//Bl7AoVubrR5CA3Mc2oTwBgKve0DN51lEafnUrv9zHvZ+OO31kpPR4DJcyX18S3//olUMCMWfvQgYKrn8WfQl3+tXWF0qflBI06KzU9w5/hoVmAuDMbdA0XRNzLqhZz0VAVnCMfej5kVkYkN73I3Kaw6YluM4TxCearJfhwXNUWplIKHfJ+n38nv60QA1TbGht3XlQAp8/Wb4wyUOKQFHwdTdLiDHJASTwJdsuekaqhMTUhRBEqCZ+1OQ1qPjnLwUjVO5/ONgzcwnCOjz58Tfhvnnet8juiw8+N7TaVMuQR/uOz9ZMh5yIKKAkgGtLL1IRv+m2LSQpPdfs+edWYoRFL+mgq5FYypAooNcLyRbMBLXufUi0PCoBhdc74odLQ3hs3P9VQ5qnoTasTkYlfP++guhhgVyG0RvLBsNOQVFPSefxVC+pcgGLp1ISEMsoVo7JqO/Cs21jfpvXZ/QOnHhrnTlz0SxUKIiglm5rrPrHrkW/V8tAqW975nZanhWaNUwZ8P09Inr/yckrnGLsh9KwwaBYr28hyMS0csnidt18+y324OXkHFqPnma97MDCLWaR3jJYUG9BOFafWcNrVYVzl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SaGGGuiIe3vDB5U5L1yUcn+ewjuaD5WdlFOHSfRSbo+vAKMa0KggH1kp86+l?=
 =?us-ascii?Q?iThpqUNp2NjhT1TmcTwgCbkg++oP+U5NHYhrjSiZp072dMceCbKtS/lRS8Uo?=
 =?us-ascii?Q?SbDyx/S3tAijKtSaEXn1mPfZAjLLOuiwLbftLp/OAgS8RWoeFkH2kEy6NI9X?=
 =?us-ascii?Q?pK7XDfL+R7c2zV+LpZBxuZyYHHpVfEZcWo0hG1rx23gwe7QeyFxIc5xxVg29?=
 =?us-ascii?Q?XBbMgYpbUmXcBQ7ZQ0UBBDVF8MGQMLlIQkgA230jivRRf9FCE6do41Ia+GOY?=
 =?us-ascii?Q?xTpRLORSqWxvs4y0mv35fWw4NRcSrkEzkcypRW3uhfTP1dZ5dHZk2kQqN1bM?=
 =?us-ascii?Q?KdzbSNtjRAgXnJZV2ZrmJW+E7eqPUtUCyO7gYbl+XaY1PHbLxzkY/1BYEBWM?=
 =?us-ascii?Q?Cl/gAPs/cZbG/UBUqDehkltvglDJNHiJvTQ93+r/bpnpPI9hldTIxEpD62B+?=
 =?us-ascii?Q?CJ8ETAPMUcpuaSOsscJhbLP3BjBkma7N4b9OqKUVMbFP2HekKH7RgafHZgE+?=
 =?us-ascii?Q?TS8nOiElmJFiAZ8+vvCsDrjB0g2Qit9EcWZXVo5CJ66i4+ztq+TipQ0gW7qG?=
 =?us-ascii?Q?f4S5nPN7sVoc7slKgUDDNqNttxGC0pPIJrORdugBrI3Jmqa7Fq4hVaFOitkt?=
 =?us-ascii?Q?wX9cmMaRYxtYfTuCmk2K78o4oray7TpmzXgSP0w1QdKaUCKtWz/ZpDZhiJ9c?=
 =?us-ascii?Q?0iF7rwnxvfBR2EkiBspKKXezGufrII2nub26syCFmOm6XjJdJ6+snsupLGYX?=
 =?us-ascii?Q?25grnZ8/D+1cxg/I9JC1GR/umBJU72Nsp9zA55QMKfEiv6KvyOwOxdU44sWc?=
 =?us-ascii?Q?xnwgdI+dkOpg9ltYlRG3KZunTP8lqdYYLj5bLny1Vjq1dx+muUdx1x3CQMfp?=
 =?us-ascii?Q?TMNoHLsxuxRm62TscSuT5EWegkTDvbkDxgEtx1ZStqaRxannYFtTA2GwBs/h?=
 =?us-ascii?Q?mk+5epgZQMwEM0sRyMoonzGbHruVyj2GcUbYAblG903zcE9Bd/EELcUORcBY?=
 =?us-ascii?Q?AJWNg3v+IQc/En1XUcDofqn5XA1BQlCBkp/bfCGgmtXWaF6jC/VsY2exAaWH?=
 =?us-ascii?Q?Vkp8NDPMwr8QcyEeCeDKNHJ+8MGrG3173qrTPxKN9j1xHYlm7rSIyWT/b08p?=
 =?us-ascii?Q?GzssEECHNXkJyp57qv42Jt2gLaQLASvXwrR/+AuHI5mshR4wdvfXihTtEYyN?=
 =?us-ascii?Q?HUXsWTDae3FVDc9TI+GWY9yU6oNEilbsVyPE9ofQSGvOjelFuAJOVnHbxCSn?=
 =?us-ascii?Q?1lQbkjHejTP3yDkDnOdlHbWAjEmNk3shNN0fNWVzJanzd5pPEFGsc5FGwrmL?=
 =?us-ascii?Q?GgI6DdD/pIud7x5jIO0SL5v5g1AHNSObXEKMYQCYYaZoUzEidzGXz/lqz6UR?=
 =?us-ascii?Q?KIkUORw8gWZnfVnHNjSPFgNoz6rPpp6W+dN/Zrk+5u1DxOaPqwDBIzyPU+bY?=
 =?us-ascii?Q?BxA0T7r7he0t1QkmI3+NIgUZVRvphRvGLcKZkh6UWjEqpuRQA8Pw+IObWwm4?=
 =?us-ascii?Q?OwyybeVIrtJwok0yY+zdEQ3lWFej5bpnjhxVvruALpAVPJijzk1cwloWyWqi?=
 =?us-ascii?Q?xDwAchZEMWtFxQ0rTrMr1TgY4FzLZ0LBpCjQsIx8yuz5SNlGL6gUa003Cu9G?=
 =?us-ascii?Q?P3/phcTRzO+5MM/AkbTMfPYusUQ85iq4f2HuC1EbeCLpxP0vcTOzeobwfvgS?=
 =?us-ascii?Q?kywyrnOgyFuB5lObEtB69Ct93i10UA2eyqDLLMu9QuRFXl4A/VlfCVcGJEpM?=
 =?us-ascii?Q?Sew+7t2TEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54aaa0b9-f502-4d08-1b3c-08deb0535616
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:21:50.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXkYZIMUWTrGovZQaxR/OcuiIcn0/w25VeEK/Y5HyuX2ufA37SHH0wqfa0LbHhKam/Q5OjbybZ3nW6YrU/pTKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7014

On Tue, May 12, 2026 at 05:47:11PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 06:09:24PM -0400, Frank Li wrote:
> > Add deprecated property 'port' and 'display-timings' for i.MX5 SoCs (over
> > 15 years) to fix below CHECK_DTBS warnings:
> >   arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
>
> Instead of documenting the deprecated properties, could this
> device/devicetree be converted to non-deprecated properties?

Change dts will cause break back compatiblity. This is too old chips and
I have not information panel's detail information.

Frank

>
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../display/imx/fsl,imx-parallel-display.yaml         | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
> > index bbcfe7e2958b7..b0c5869771fae 100644
> > --- a/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
> > @@ -42,6 +42,17 @@ properties:
> >      unevaluatedProperties: false
> >      description: output port connected to a panel
> >
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    unevaluatedProperties: false
> > +    deprecated: true
> > +    description: input port connected to the IPU display interface, see port@0
> > +
> > +  display-timings:
> > +    $ref: /schemas/display/panel/display-timings.yaml#
> > +    unevaluatedProperties: false
> > +    deprecated: true
> > +
> >  required:
> >    - compatible
> >
> > --
> > 2.43.0
> >


