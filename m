Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC22FE060
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300556; cv=fail; b=peI0aXLjYUVna68ZNbP02zEfG/6GjTaJBvQyamwZX1GwANwrqJsY3XM2HApH33X075hRdUhxqrd1CH+17m4/0YBOpTMcLoovDW+mFpiUlT8/bCPmSjsQDVcnf+QUl62JO2/pVKDLCoStJxvOK967i6OHrbAaO/m60qLvRGbpvWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300556; c=relaxed/simple;
	bh=aDKPmQhaN4PdxsZkVzG+Dov4QJzxYmxPoJ1r8z/C56w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iCanfHdNserkfODsw6UqZUpADoHZuW3c9M6WmnycAt+6dZTwTJtPzMMhOx4n5l7Z985WcLeFJqLhlVlDdC5orQMXjtJf/mA9fldyj29yeXCgL8YtVwrpdW4yG982ygbJ/fy6t01NRGlUkrkSWU2y/F2omnP7Nw8vjASm6UpJf2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wPB8fHLC; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wPB8fHLC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/ZJdF926lJ1j978yvDb3c7MGWtfR5W4iCPlIk8Re4vqpN+MOZVyAH6fjC99VYcBgKegsqjYyHJ7y3oClzD/KLJSHh3auu3VyqvTxBAJhyI3cJJKhAXsFw3/Qo5nTbu/GA60Kbc/3jU41LmbiJdIekAIBPr6T6cVG4q6uEumcEJBSBL0aKzUoLgpK/CNVYYeE1ZfU9OtA+8mHaVkLq6AaJmxCqIwm8zCWMStxgzphw34itPVg2+lecoUrStv22Zx8KdyV1hn4ppD6bjldIKjwZZJApvrIBwP5BGozo/Vr2dyR9C9CMkkoPha9u+BlOw+ZP3/3r85Vw3zYlNh6Evq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/t2Y0fFYadHf+1aEqYDbSOcm9qWh0SUm65urm7yUFI=;
 b=YS5cMEETieIekFYLhd/534AnuALWeOd/HcrTZU+2xo+W73l9S1bFC386YURYKimEO6RnGHNm5I/KVtA4JMmAvhEzsb2LO3AVkC5StueVTt5UXpSjxpwypmir9/9Y2mnfhjKGiyzQwKoc/OIA7HSi9CDBsSn7h1AQ92NJx7CuK9pjqO32PB0xPF5a+KULLX5E+zxY1mSKFIUOe15Wk05icnrtszoyTtOPABH87u81bZaM2iAIP/GuoCRJJlP/ezQRKoEEWAQfZjut7Or0wGWhyCyCxsAP0+7ueM1hqy9tKRyYCtkefC2IoNOgjt6Y1Ipw9eGwlzBDqTBiBPbysLBCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/t2Y0fFYadHf+1aEqYDbSOcm9qWh0SUm65urm7yUFI=;
 b=wPB8fHLCAbdVSfhgN3xXiAHcz96RwYaBdsngipOAuv7P9WO5iguX3XWe7Ae+h3wNsV4QDbyeZtE0TQLLWlwmIYBhATEbXlULW/D0tlD76ODcXgEggwgD0ej9I07QLWRiWw7QU6DyZIjMyc3WiDKH3TsYgGe1UT35tpLue2h1VJi7uFAveI2vzkLeP5+piiaPqYEjdyDCZbbys8mWjClLRRbRonRCmXrUJt62n/SjPPwBHJn7RapjqiGEU/NRDo0URK6FuprMha1AHHWNNG1/7fMxZ1v+gMj4UMbo2eReaWBpz+N0+C9yrV1TQy6EDO0DuhPFRL1QSpm9uBe5YMeQXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AM9PR04MB8748.eurprd04.prod.outlook.com (2603:10a6:20b:409::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:35:46 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 14:35:46 +0000
Date: Mon, 27 Apr 2026 17:35:41 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v22 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Message-ID: <f6rf5d6nhglkwendf5yvaklfn2ovlwkqstsz7vvl5zefibtiun@wic7bchohmwv>
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-5-30a28f89298d@oss.nxp.com>
 <DI3YF5Y2B3GZ.25AP4NKQAXH36@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI3YF5Y2B3GZ.25AP4NKQAXH36@bootlin.com>
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AM9PR04MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 0469b009-8117-4c92-8994-08dea46a448c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U7pSl498n9vewhkBDnCQWXP99rqaTFNmBT4/1EOQzPGrVZrkCPXaUnqojkQdI4/Awx6PWuE0RVduorxh/w5AfaX3fdi0ZTsuOWTCWa/nWL3HAV9YEYStYqUdXgJijLB+bF3/AGA90aO1ztfqh4b4x/9rFYO42I9eXsxAHLXwvDtqaMZ5vMhuIFtZeZUWI7EJlO86dNRkZ8JGmMzEFDie4tCLrYFsb+8covKe7vkd72xZgrBoQmXaUPOhab4fk/k34OqjAq+utfVeflpZp5GakyEH1+9Yxw8EV6qHx5lCW19hQIvRZ4QinloEcwyJosuNMCLiJepUbDhDQtXe9/u8cTmR1cMBxqtA6Gx+z9lCd6OMUflMDgHbc7jSZZr/3DHhtMxKRTGQeCZ+FE6as9NZx3V8ceCxj+ZJS+CjLIdf3pnwMmq1zUwKg4zlKpCN9alqQs7KQN+MjxJggn5+q98Tu2FrZLSpJnmmKmy936727Xmht6QfIiaTFLMmRQ6uShlSoFWWJSKDrPzDKxTXJqa5nJoU9mm1/57DIjsqBuorHNr7gNGUE6F8StHr9xNCOjMuy9QLbOvOB3aNaA4B51MXGCtEnGTaM2UV3wTnNJl2AQueMCFj0ROThLOs16u54oWhOLvi4ddDbOu9r2mOTnjpd0hQq8egSTPlOfVUDyawRyMmZcx4kYxk8tFS2ojtqRq2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/wD+Oc/H8/8GMFmYyaHAta9wa3ca7Aj1HKxiV+24uPcYWbzRopHL+Lw9osV?=
 =?us-ascii?Q?MRCaYtssEUWdUSQT+WmT5+LZhoWwpGljp4j6Glbc7Y/Lbq0KK9yMPXu2lqUJ?=
 =?us-ascii?Q?b4lenX++JWAirgJAHJxgSbUA4rqV2qT9AN7l7G56ckjcchlaP//wRjWO03Xt?=
 =?us-ascii?Q?UhMzPl5fFly3YV0zbvcQg35vxMI67bZixpYbxjDyucDp9fn7fC85pT8BLjVv?=
 =?us-ascii?Q?8lSbGHmPA6IDa8PiukuMTIW7bsH9HSqhhwWHQa+nBzn6odIjwqgGds8VFaYd?=
 =?us-ascii?Q?00ZSOD94zwzeWXGt2wLDaak8mTnIuJ+Doom6XE2T7zNRvmNfob/uYtoiag9E?=
 =?us-ascii?Q?QPPv2gWeaxiUAeur/otYMXfV39U+Xj9sjHw7pmkqkMJ6fxLGOHedD+GOZPlK?=
 =?us-ascii?Q?ITTXutVCeSLFEwBv2lLkTbxNPfM9Ih+jBhbf5azW2mKma+dLAyJyFJBoGf9w?=
 =?us-ascii?Q?6wIFtzAytKVK4vY3QXBLjt6wknzU7ByJsj8LC7Mc+Xq4H4zKJYIQvvtmAd/N?=
 =?us-ascii?Q?l4naC8nI2lNrBDnW8eFVz2dRFnzdDL0uZlJoQ7SanFtOkQn3Wjv1LkoeoLXm?=
 =?us-ascii?Q?RNiqfsbMMRogDchrgBnvNrwd9NB6AiRZtxPCmVB6ocaxJMm+80Ih4Z1z9nDV?=
 =?us-ascii?Q?s67rVanwZYRA/Zdz73wv9gGbGatmxtXivFfYbMp4qHhFC6HRVT3apj9tWgd2?=
 =?us-ascii?Q?iAno/F3kUDMPaqa8XSOSXXV5PtCgLJqqpJ+m+/HBTnTs3ptAwPaeqKs/Zmj+?=
 =?us-ascii?Q?EZM9TxU8Q3sjUtixWfCxSs1N/bEsh+1LLsesbq6cljL+/zT7QzsHEzK76XKJ?=
 =?us-ascii?Q?MvqCrZKuiuuIbuAbu8tovwCJ6PbEXf+rAgwujjKiVy37Jh64svtjOvG9nvcB?=
 =?us-ascii?Q?mcHTB4V9DMrg667UOzjdJUHBuBvY/ufFdlqqn6JYQJYJ7MhHwK7brEs7kQ3I?=
 =?us-ascii?Q?2wCQ0rkrbI7JS2Ozc7rpp8cdG1uGZsi15Q4+1z0317amVAkxL+XbytkjmVBf?=
 =?us-ascii?Q?jN/rTbGu+3SDal4Sn9teiFX+vIhQV81lC/PYNy0UNGHNHVde+R5vcUq6GMaJ?=
 =?us-ascii?Q?ZlOWwdvdOvzae5HcBJ3Nq0UKD1H/305IZ7N6JPyRYBETeqf5FAgUTQ83Ek6g?=
 =?us-ascii?Q?qzeSkHpZ7YbhPdDfYecKiLtqysu60fWJR/WWmNOiykdcxulpW6AY/fAKd8tM?=
 =?us-ascii?Q?jquYLN84KaTxF+cSJ9OewYgXvhXAV15IKARE8ogQAQCOz992DwkQ38U1ptzP?=
 =?us-ascii?Q?WFzhb5uX+sJ5U0PZclw8M3LTw/mMvwCN/j/xHlLqvqvc7YiakwnsflTlhSgL?=
 =?us-ascii?Q?0WJY/C9pGUppOCFLCMN4zmguPRdAwlQZvFjhXmO5o88ehzTlIzet3FRXfEBn?=
 =?us-ascii?Q?ir4hD21wCwOYQDqNtOnV5NKKm9zykvTaNA9NlMQ6bWMx/yedLLVeTiBkm4A2?=
 =?us-ascii?Q?1sLLNrSiJxBg/ZoDMMEEppgVQm5Ki2SWtxf5ACfwtgp8CTEfL2twxKVGGpf7?=
 =?us-ascii?Q?COn8njTdR4pf2g122hRu1pMcGH8fOziAy79EZPQcl0kEx/1qYjtdGE76x0w0?=
 =?us-ascii?Q?AnlyOyXWBcH2MMOjBecwQNneWH57UOx4xs6cePm6hNVyg0DcSRocjleqBx/P?=
 =?us-ascii?Q?yJDgUHHVwrSBu4ULccGN7/QEjZUkP9bEopfrFc557OiIIiGnstPXi1vXp8g2?=
 =?us-ascii?Q?GiErZ+7tGz+fRO2uSlsPpXS7L8NZsxJeU9HJJIKpkfEqatn1sHJBD/tFYBQZ?=
 =?us-ascii?Q?qL4KTqI3I3E8NcF/MfEclh3Swh6ifr0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0469b009-8117-4c92-8994-08dea46a448c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:35:45.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaXpX9XrCYhDwYooJSvVZioqqENYZIM0W2FWrbHlHKsD0gYXie29habmwPqCUcKiiFlGUDhNsXgL9ep7jdnpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8748

Hi Luca,

On Mon, Apr 27, 2026 at 02:59:47PM +0200, Luca Ceresoli wrote:
> Hello Laurentiu,
> 
> On Fri Apr 24, 2026 at 1:07 PM CEST, Laurentiu Palcu wrote:
> > From: Sandor Yu <Sandor.yu@nxp.com>
> >
> > Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 80 ++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> > new file mode 100644
> > index 0000000000000..a24435139b8b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> > +
> > +maintainers:
> > +  - Sandor Yu <sandor.yu@nxp.com>
> 
> Based on what you said in the cover, I guess this line will have to be
> changed. Are you willing to maintain this binding?

Yes, I'll update it in the next iteration.

> 
> > +description:
> > +  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 bridge,
> > +  sharing the same MMIO region as the parent bridge node.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mq-hdptx-phy
> > +
> > +  clocks:
> > +    items:
> > +      - description: PHY reference clock.
> > +      - description: APB clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: apb
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    display-bridge@32c00000 {
> > +        compatible = "fsl,imx8mq-mhdp8501";
> > +        reg = <0x32c00000 0x100000>;
> > +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "plug_in", "plug_out";
> > +        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> > +        phys = <&dp_phy>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> 
> The ports are not mentioned in the properties. I'm not a DT maintainer, but
> I think they should, e.g. to mention which port is the input and which is
> the output.
> 
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                endpoint {
> > +                    remote-endpoint = <&dcss_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    data-lanes = <2 1 0 3>;
> 
> Having a remote-endpoint property would be nice here, to make the example
> more complete.

The ports and the remote endpoints are documented in the bridge binding...

However, I believe I screwed this example up by adding the entire bridge node,
instead of just a simple:

mhdp {
    phy {
        compatible = "fsl,imx8mq-hdptx-phy";
        #phy-cells = <0>;
        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
        clock-names = "ref", "apb";
    };
};

I'll simplify the example in the next iteration.

-- 
Thanks,
Laurentiu
