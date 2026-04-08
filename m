Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9E36C9D0
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632432; cv=fail; b=FKDKcb+Y4BBY1NsExxDbPZFzJGljMU7WOoNZvShWh59kb9fNopIC6wpKU4PCGZWn3/oZC/3Heen4a9OFCvFzBOHTzTaFALF2AI1llaZ+dkfDLc/QA0mB+Y1s2l1HcX3rDg06fbZ33Q8uWL0gbOVTSIeTvPqPkCBTNLO2wVVSqmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632432; c=relaxed/simple;
	bh=MNz7bo0VTUDtPcaQTL6xirISPUgLpNopEfZ2NBEpXJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ffKVp1nwT8xfS8eYCSiAHhAJwZTTF1sfwBkbLEdKRj1GAqZeY8lyHAR1dGOm5rCPJvG3k4axI9R/4kXpwdkpWXmlv/y/4OmhptmPMENYn7ROCvZVtY+B4jSdlV1E/deDsAmZUAp29vO6zs9NPgva/IIyy4Qx848gHU4xCWfrbYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hAGmHubW; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hAGmHubW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL7PQkMCXNH3OmZvQHVCvbMLWxv36GGf9KKMs0khLNERH5xJcZk62lr1T80oZuyQCOJr9vl0H4pTGrKy418v4bi6xc+WvJTGX5Sqw9MAAZ3SL/+QN+g8FtK12VPHKi3DcGZVGkcxgzE6GORbQh4omUIp1WqUUAyJEcSVvkjT2RD68suw65tvkiGKhclb9JNZUIgPLQplN3lydWKTIDi0i5Ck4FtWbCwaVrdB6deXuoEnb/GOUQylKjJF2W2frmmGHSOSJ6VWW29D5lmRn6XBF5EP0Tr9FPiZtSO1zBg8t/Xog4ZpgfVB8ldQJPFwUvZ5680hd5Ad7sblNt/khXS0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N22oa+uNA+rFhCLBQzTXiXYB8eFloPUHjHiLTp9MHyo=;
 b=Z66efunPuUbbFTZkorudREThSSNitnlKi010fVuTx+R1LpvSZaDk2Q4D9e9avaKCfWMuz41e+qO0sxtvGIov8aHyG4QPp7B7KZlPMJiXyA9qc9AWorYQ4uIrMULG79Zt2+u3FR1haMvd63J7QcF6qmPohpuxla/chhHau+H02ZwIaZ/2R2gnj6t0nFh8v7qpUxj1itbEY2bOsF/irQQBYHoT6W6pdi5oxU2/Xu66vKY2W2CKxCAALBjZHf5h2gvC2H/DAMC5RNL4CWNZAgmZbmVPRbEODL2We+MRE6YNAUOKs9PT02a03wFdzdLNO+PmlvKLXa6/jHUyppQoUFRZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N22oa+uNA+rFhCLBQzTXiXYB8eFloPUHjHiLTp9MHyo=;
 b=hAGmHubWT802vll+DfHfnwmn+XIkBKux0dwogU4COjU4g5B1VvXcCgr57No5dLQ1PIq+NAylg7cZWSXUY8XDfhtOkx1Bl1m/6CYnAUbniDwuiwDUHZ/1Gpf3NDr+cdD/3Lkk9OfhXC0vVCqW1uOWcYHXgEaUiJ+gMy7YK2g1ibgtNhhIZPPVUP89vFF+nrvz6wEDeA7BdJBoVsAV+daHpm47lCZhrgfwJrZxqNKll58vWFSuXotYnzpfRN5/SF89LuzSouxmNa7Eair7vOM+LcqZ4JhlDj97mOASBa884WrZJhd2MAC8XyOUnCS9sfSXAxSLXVbH4rODNfILgA92wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU0PR04MB9670.eurprd04.prod.outlook.com (2603:10a6:10:31e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 07:13:43 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 07:13:42 +0000
Date: Wed, 8 Apr 2026 10:13:37 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ying Liu <victor.liu@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <wowfuuvnhnm6fjuynow4uvle7idvuyf77hct46gxakjre63y2z@xlmau2vl3lwb>
References: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
 <20260407-dcss-hdmi-upstreaming-v21-3-4681070ab82f@oss.nxp.com>
 <20260408-large-marigold-pheasant-bef65f@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-large-marigold-pheasant-bef65f@quoll>
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU0PR04MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9af27a-b653-4673-bd92-08de953e5d8a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 g6lMvJyYf5GEzL0iAyIqcNiD5Gq8a0R5fSZTTQSq+HDKzbds5P4E21gYqftc+cPWavHOO0lRSaDRVJmfQ+qWqiWPL+1qdI2FEzRqJS0ZBWYke3WQ6jxFeHRmUhNrgiX6jJGK/gn8gGFnvEHoupVh58izikPLKdtCVZ8DKjoOOdpzXb/4KA3JdIatNJlKeQEGyFtjDuTWVCwTIYB2A7p14oXua+JR19v1PFx66RBGXsWvjvOt5lMjfHywbkyPsJdlZ9D2hhy+URBNSG1ppPYsHbmnwOHIrdl8Kg4lcOfZN0NO8NNLeDxLdNkVGjtyNyYoW+SQ4evnfnvb7/cUlW2SEj+l9Wbu+yVb80iK1Kk0Fwn4igJ/LJdNNsYB3IMwYSzzlxjtJZGoxeApsPhIYzchGKX2bMB4kCQoS2EtKwSeh7522bt7T9rgMNuqlkG1VrBirPlpAaADxA2i8KEznTZYa+S9AN6WSXWlwuHluB9yZa8YkHbCM4Pt4PBIiFJbKhfq73bnpCjm28asqDNhUvWW36RekbvORtvpm8r/f5oC45y3faR4R5nSioF9oJHyZePI/ll34hBmH9heCmmgP7kKO3yAx+wpjrRPsACS5/XRU+2vnLDo4VIxdLUCLML3d/mHvHXZlXIWKnvIDN+Ap+aDJfLeFKCaaMb5Z/7cW5QeMQBUNCnvR96mm4zp7NbAkU8F
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?j0Lds1AfS5BO+JzWX8RSxOK4PBTgf5cGa3S+jytEoc6EOQR6AQ2XhSHVp6Ni?=
 =?us-ascii?Q?3Aixpa8N/CutjbkUkhV+cJ9xN43HGRj4D+c2VV4QRcdwHcDZ6onp8MrqklSf?=
 =?us-ascii?Q?2LifHkWNPBMmkCIH5NjjgQ2SIN+khxep7gfiY0Fgj1fhtXT8ZGiwatHI6Y11?=
 =?us-ascii?Q?WuDDN9Y8XhFbHkynCoi0TlArO7R2rMjGnumfhq3u9M6hfN5ksc6mCMbZDams?=
 =?us-ascii?Q?xonBN1ONxbWtySXAlvb0NaLaEJbv0tnZojbCDxTmI68RREeRD3W7itld2cj6?=
 =?us-ascii?Q?jHJM2YKbLSAH/WuYPRFiXbRrZWWKRdxOB8FO2ZMhnvRUpGvNmIHaNeNIXFJA?=
 =?us-ascii?Q?WtUq+HuoxrQPun0B+KohfWCoakmtQzT9kWcZS0SQB+dcu1rwmSltdaUGFLwn?=
 =?us-ascii?Q?vQUWLJQ7wI3R+W/yVXwtCVdOOFdiDONC6yttHirvOmPFkilk98dBaFE3wpiE?=
 =?us-ascii?Q?K5AuRaM4A/m45ImXz1zrUMA+90y28526E1LTLWvEIsArtr5TLMUjZdbb7HYH?=
 =?us-ascii?Q?koEKyFSjQE3GZO9bLWuTmhwe814kSKExMoL4ddGrFpGtoJiYEeCTMRkI7537?=
 =?us-ascii?Q?p1dh3ijLkRXRHyIcOqR+hrPlNLCaeUXwVkXsehpckdnxhYIyrkUofgF71aJG?=
 =?us-ascii?Q?CWIcgGGpFYFdjJkIyzmTLO5me7dhkdehc1c17bTk1b9oVT2dyz5oDx3XbeZ3?=
 =?us-ascii?Q?/G/lfz5iHGZxDlqugm0foVl21M1F7VdQkYjYhbzKzUC8ynyslBG5c51Lh1KZ?=
 =?us-ascii?Q?Nor1/HGarRgL5zyQWJ4JN806ogC0yZrl+Ms909MaJpSDZNmGUWPIjhCre6Nu?=
 =?us-ascii?Q?SbzrRQtMEjSuZ9zWJ8zt1akaWCPlA4g8lif+jxmAUZlP6x6zMEBU4ZWOtlKL?=
 =?us-ascii?Q?4iKeFNwKPKHg4rHhH5UDWVDyyeh2kqQ/GsQjL2Mz/KixByZWvxBff3R5TKYj?=
 =?us-ascii?Q?8Xm/x727GlEgT81QiPD8/lJFwfQacqKXuZMF7RA4JcHqEfkQD0Oru5YypS8Q?=
 =?us-ascii?Q?IWWeI1yDlCngjvJXoars2uy3JojD/Cs7o/2iTE41qUuQtvdut0SUz3olpRUH?=
 =?us-ascii?Q?GYmGwXxd/t6iNzDMDiQVI7FNaWxO5X7kdfU2hDLLUPC3ap3L1n7KcOFgUPFu?=
 =?us-ascii?Q?zoFSCx5VecAA7zD5jwYVMv3Ej8RkONiThu1Empoboq+UAZO1Pv9jxjxUEX/T?=
 =?us-ascii?Q?G/dh51pGsUxsyjsZIe32jbogkQszB3TMZrGe6PREhB6xuWpMTfSabSasNpGn?=
 =?us-ascii?Q?AIi86TtJLbazgHp/eeRCUVwQ8UQO5mA/kB+o5L1bg1Oq7ujOyl9KKvfBBjf0?=
 =?us-ascii?Q?HA1ZuH1whUmSn/YHSvhiq4OMZzWN+Ji17i4fl177zBInYZAkyHDcmR52RQku?=
 =?us-ascii?Q?CIzZ0YrRNX2WC2TDRESiEW/XGPJVrQA3t/BWuXB2SshGcUzhfzQOMfXVtKAi?=
 =?us-ascii?Q?NAgZZScL8ivcLeextAQGzeYMD+8CoJwV1SzkB37ly8PWTsuDyrTqX43NUzyL?=
 =?us-ascii?Q?7KSemQ4eThCcp2ZiMMtBWwBlv1jkF2e1P06aCZfGD5Wu2su8mchIKLAQ0V27?=
 =?us-ascii?Q?LHJAMJtc4joEJj/KA9/jt7ZxOXcTIxURWlXTb4zg10DPa6m1enzQexH/NJqy?=
 =?us-ascii?Q?u3AT71LFxa/Tu/CKZ3CKWKg0HVZrNrqyVT6gq7HgRFxDE2RrRe2iPisiuVqL?=
 =?us-ascii?Q?yHtZe2dW1MO9Meq6t0IwylWA35Hnbfu+GM2BxGzGotOfgNvnyhfOE37d11Jq?=
 =?us-ascii?Q?E+V622w21VHaU5ovh2giF0qXiwpTK0k=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9af27a-b653-4673-bd92-08de953e5d8a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:13:42.6062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xc+1m7WIfSOBELIpW60/NjVvAQ+eQluCwvdS0/GsMzJKmPQzU/R0+rsttsoxgZsJcPbDZ8N+ZRzjFJmfyPz14Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9670

On Wed, Apr 08, 2026 at 08:42:09AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 02:31:27PM +0000, Laurentiu Palcu wrote:
> > From: Sandor Yu <Sandor.yu@nxp.com>
> > 
> > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 131 +++++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > new file mode 100644
> > index 0000000000000..77e16ee9d855d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cadence MHDP8501 DP/HDMI bridge
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandor.yu@nxp.com>
> > +
> > +description:
> > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-mhdp8501
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: MHDP8501 DP/HDMI APB clock.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description:
> > +      phandle to the DP/HDMI PHY
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Hotplug cable plugin.
> > +      - description: Hotplug cable plugout.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: plug_in
> > +      - const: plug_out
> > +
> > +  cdns,bridge-type:
> 
> Drop property. Graph defines what is connected on the other side. And if
> this is for different devices then compatible tells what bridge is that.

Initially, Sandor did use the remote compatible to decide the bridge
type but he assumed the remote is always the connector. However, as
Dmitry pointed out [1], this is not reliable as we can have another bridge
in-between this one and the connector.

[1] https://lore.kernel.org/all/dpj333mzr5azqhrgw3cxd7x5kiwxms4iomwy74uqfhr2zu4ocr@36rkth27d2jc/

-- 
Thanks,
Laurentiu
