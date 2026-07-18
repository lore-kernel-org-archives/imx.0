Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC231619C
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784383937; cv=fail; b=Sm6ZJcwjaQ75wmAj88buHJPV1KJZgGTNp13SXrDjJlwhmqFPUsJMfXOeD8R/ki8RKTox3JXLHMaK9NvWpFr9Xk7WPsyaiH84x2HWeCgEiU5eoljrc0Tc5ZuldZ6RSpd60cjS2hqd/qz9Z6wRzWrPOlW/ziYPsXZf+m5Q43aExJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784383937; c=relaxed/simple;
	bh=Q0C8RET6W827ivlEt9fMhIJwDGb8+hqTxkGc3lgAfmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QpYhT6zbLMpvE/W/5MNfdjI8PNlQ88aOVYNxlBXGJtNLQZdvBlsyUlWLoCV5nIPyWxr9gtnma2BIk4/6fRVHnSwfZuBPmUefqGPd5DSj4OxB3bm9bi+0OW1R3+vJQcwImEWnVUzmvByqsAopA3Htmj2cWfgv1kifg8zt+M+r3dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A1fs4kkL; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A1fs4kkL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9rcm/B1PT74p/FZiSsemRlnKpZA3JwSpPs2vjJsablQijuxlj5KNe2WqDZ0XUC8VZbPPPr0hWFGmLKwsc3ryWHWLdXVnAwpgpBPW98I2TupImAVEiLpsOnIObZDt2o/HuYI5WysrSsV+5eagGsepBx7I5Jzu2lYwTwKmkvg/Dre/OR5OjcK6YcgUQquAbMTGt7AMU3cor/8qE1lPIqLC9CuRrv38oC6m0cUXh4GwCXVuoE5NPrVq88eG1JJYVdHpngaZlK6vnno64loiNbGGDs918mF6KiS+dEXGA0OhKKRg+JEDkyjPwNSG/kC4Z0ZWUwg4jz2wHM287Nc2XqbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuZmFugEv+zGNxWAFTMZa4usugbGMf34TNX74gYl0rQ=;
 b=sUS9QM3w5JP0vwCLAFQGfQONWxwEL4f4GcDrx2e+9k12UIIfd48lhfkHpHK0XVVCq+tE+GfZSwFpTQSvg7QwCewqMPSYxYo0QSioTDHh9DAHZv8UpNoGE9xq+1O9yO9ej3W9OhwyvJorwhjfq6mpDmTJpu5I4gN5TPM4gADF1/xJGDqzs+jP6NTvktWm62jTod2IxpSAiSbhrYo87NisWQqpHiJjaKsqiDhJ98AR+eAaNQ3sOL9g0btvtz4maqw9zD1ffe+o2NtRQhYwBiSNVW4LC+Y2AtjXDTaL3lfbvWm6Qyea+AL6gG7QA7rndUUjMtBOjMplMJk1+/sy4Sx5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuZmFugEv+zGNxWAFTMZa4usugbGMf34TNX74gYl0rQ=;
 b=A1fs4kkL8loC6bfcttmIIopo2S9QPOeCNKGm+rfzKeoQD9OLFD/kODhzDb1IYTohnZIAyZIIiTTSGdYGrnW7ZtWucuI1CdXRlu6UaHpWGVPO7vdg4OSfZJ4I+kcOCvAd3xchs4JVg4DrFJJbs1AFJyXtSFytSoK2x1Z8Ip6V3s0MIQZX6bcvW4cG0WF0Z5okoIu0ErsuFQrSRrAlpfhdkZbCJQfmShm5PvbT7HfAJLjH/+MOAJA6paAWO919RW4cey8C9OvE+pvO6jMktpugPH+SiRLXLfEAWRMh//hChFc6+TUPxu5/ht/SFYDiX5BRRMhD5w3eZQyQD5arFAyZAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIYPR04MB12598.eurprd04.prod.outlook.com (2603:10a6:290:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 14:12:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Sat, 18 Jul 2026
 14:12:12 +0000
Date: Sat, 18 Jul 2026 10:12:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18
 as child node
Message-ID: <aluJtbYeS_tnLKSn@lizhi-Precision-Tower-5810>
References: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
 <178432353778.2692844.15138095566024676604.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178432353778.2692844.15138095566024676604.robh@kernel.org>
X-ClientProxiedBy: SA1P222CA0179.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIYPR04MB12598:EE_
X-MS-Office365-Filtering-Correlation-Id: b93e8745-2cbd-4a90-aebb-08dee4d68ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EY1Bexmdvr2X9RvTDNpZ3i9KOWGdL9R+ip0wRsfsgY5jIcippI5eBHiA/8I2EhxdkMtP3TY03Q5QjBP5JSbD9FzJSA5W+qQAAU7ydAXw/lo3gJNblMXlViBAN97Rsxis1rAiC4Zhqq4otc8lhZLXtnIzS2Iiyu4pa4EeCoJ+HnMIxtjNqudmODfgPAVhRhwhafK8mVpRneD5LsEa7JomJwiBp0yJasfaD+YcWoGZGc2I0SpnFVtLcDmsZrngIJnJj5oc4siodLVamyx12PJKPZGReq0kKW9RfCw9oXn/Q2umzL29hsBV401OUitOWpOtPoi3N9ZTrl4MAxELOxB865buDuKra7uPNIey8vogQTMf8+BYsXEziUhVoPsJnvFq6qFDgbsgqkfQeUEAo4rrwJ9npQ6mHITAqP4HXdQaCBQsUHOcWsSJjYBHGjeYun2vjGXb9XH3swMVOW3cnE0HuFHUDk4TGNIdvUspJiqNd4LUAv3uX7opVvwNdtDdBZ56uoeEsLlRGQUv1WTXcQLstkiUjUeLFqmzCqDYBnE/QkHg1qpOgYNPPwVxv5GZqwAmuIyv8ZwPc4hgf1aIYV0Tt2dMKGfXmHV1DjaZpc3VikSjX3bmBdAuj8eai8AwwSL9wRxsdtH1kxLnPTpIff8r4f2ZbzCc87IjG6SmhNII0ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F030Y6eltatMfgjUWk0KK8eBkKnVgmVkBCSq47t+BAckGKiowpBHhzwzCZ5V?=
 =?us-ascii?Q?bUZ/cVmeGkVwuUaFvQf0E3IOzPjgq/Bzv652UKR5mRKO8GueI5nqHhDNmNVI?=
 =?us-ascii?Q?/yW5w6S8mkzoc7NNyqEkMg+BCMgJ+escBfffLfEO8a78DhK077CY1da7opwr?=
 =?us-ascii?Q?Yctp7fsOZQWNGc4fNrtuHkZ2rMRu3e39eiib9NsJVaCP4+LK855X+WmJHL48?=
 =?us-ascii?Q?f/K/aS8hf6ZVZwVaXJ559eD1gqw6syLYNNWJqb2+N0w5R7Hdl5gRfywlw3G/?=
 =?us-ascii?Q?FneAB6OnfIoBmJvTl+K4xq9D6QdI3zNJtEzSrhd9v8InX/GrWPOVbpskvHiB?=
 =?us-ascii?Q?uYGZDZxX40kL+qrWjWN0/h0PSiuiNLZC25NGhuBEsqc9tcH1Ul/8bove1q4i?=
 =?us-ascii?Q?KIHyx9GwZEz35In44cYIKEbnwLCY2lPFAadmR96c3Q4tVL7A4sUQEu3EW8JU?=
 =?us-ascii?Q?DcBY+PStat1hBlLvrjrFHi5O8OkDu5fDqFeYw7kZNrpBUsMTxncTlo4RgtC0?=
 =?us-ascii?Q?gAoinkAjEY/hlpI0WGbaRRZixgg+7eCQwgUerRODIFAYBALmv8+I5QPbKAG/?=
 =?us-ascii?Q?kg20WU/5o5Ob31EvCNtSRFQ8cxzpRmmvT+tLxAbqV22H0Vm5N7hFrmXW0V5R?=
 =?us-ascii?Q?yUDBlGUeS4nqVpgH7ez1WCQJXWhINBzeQFbTRL+BGQk311PgiD9fPxdo5tvh?=
 =?us-ascii?Q?kcvktGzgB2J+39XRukNT4NrobPMFN3yyoEBwOJQUDoquIj2EcwHMEW1sxhHx?=
 =?us-ascii?Q?igZbIaxPZr/ANXgyrDz373Rrcwf3DE35wZXOWdmemly1QRRsIdxw6QBQHQxN?=
 =?us-ascii?Q?njGXCk8Fi45vbqyxuqc10y3bzdpZmImbbiYzqOr4bNg8WXrHr4CEgsK0+CC6?=
 =?us-ascii?Q?GQySV1AweIFfq4uFMnT53fZZ4X5WcV6SFkuWpaecaoSRKC0MNfYjtHUcdRLO?=
 =?us-ascii?Q?aa6qcVhNeKSDACsTGZE3XvElda273mSdpsN8mWkxBJouutatFvjtkG2ioWa3?=
 =?us-ascii?Q?1anhlCiswUG0Aac1hDvL9JF6WDqBr6Lm37ptxIUMxLqS4uMWdbJ1ynGHQI3g?=
 =?us-ascii?Q?fqzg+YUWTfwHE7LY9hxL5P5gZ8XhaREik/7oCneqW3ljq5+TY7CH7u8HNR2Z?=
 =?us-ascii?Q?GUMQYoO+kOBQzyrr9/aWjl9MkfGMYXd148wH/XxDktTF8HjTPnD6KEEx+Cou?=
 =?us-ascii?Q?gj+fjDXHwzdRX9e7ohr+9ejuiI83wVmar9fq48okX0cvYr75WfnWD/KWDoKy?=
 =?us-ascii?Q?9zs7PqQPZUGdM7/CaYiGhw3a4sMrOog3aLK9M4I4Me8n1VprfyF9cO6lgSaz?=
 =?us-ascii?Q?+KxDLpOzHCG+acZIXwXuLzv2gXiOoUOOWFaY8SDq2rg3TqvwbRiMdSib4y3c?=
 =?us-ascii?Q?AzGHvc0geTQeOwaY9zECU6y6Rn7BH1P1umOglAeyF5ISlG8uKt7+fvowezZd?=
 =?us-ascii?Q?zJ63UFWp6kHlNWpNal7pv8cMqb2tJLAXKtxzGGwbRQqoxxm39MrDeD25EuMf?=
 =?us-ascii?Q?uZ4oFoJTAJ364Vim9btjhbQ0tLxhjDKp0DRm6gOoUhULbMTFhnn7B17TfTsr?=
 =?us-ascii?Q?Lf5LPtlPQpJEUzR3pKANUcbHaKCc8ltl4aj3Li9Wbr+KmZBggWf0RFNuGeSd?=
 =?us-ascii?Q?S42wSOECpVnuDXj8dfyVIKnyoly3zHJfzpKClf+xM5foO2d/1cz8PCoqXecX?=
 =?us-ascii?Q?YOppv049npSmdzjBXWlwU0F76vYMJt/An7MNd4ahKdTEp2FlYLtjWYOS6plS?=
 =?us-ascii?Q?hF+hlANqNs2Xhto8HrDICcBOoZt7KfxHuWyIcrpLDlNfBc1r6yo4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93e8745-2cbd-4a90-aebb-08dee4d68ffd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 14:12:12.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLroOjzNRHkz4j1Qq69HeVvJj4rJThe6E9BsNgtMXh8Irb7HyMGUOOIF16gVL+HnzskZLHLCbPwKyO5iyN0vwfwq2ZpLBQDDHdLrPMWVrgjoCLlce4190RVGt8e9outN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12598

On Fri, Jul 17, 2026 at 04:25:37PM -0500, Rob Herring (Arm) wrote:
>
> On Fri, 17 Jul 2026 16:15:17 -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
> > register. Allow the LVDS Display Bridge(LDB) child node under
> > imx-iomuxc-gpr.
> >
> > Fix below CHECK_DTBS warnings:
> >   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v2
> > - remove status = "disabled" at example
> > ---
> >  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml  | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:

I forget it is posted with other binding patch. please forget this one.
I will repost with whole serial.

Frank

>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): bridge@18:reg: [[24, 4]] is too short
> 	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.example.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260717201519.844259-1-Frank.Li@oss.nxp.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
