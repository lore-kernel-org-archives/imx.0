Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9B834D3A9
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450579; cv=fail; b=XrxoUP27Ft6dPk/vbKYJq/wQuA2WuwhJ4EcxWGLowNHhEg5CGk5kqibHrK723Xjwyd3VhxMeaq4EuShQNIQJrcZaFsKRPn/PdXTJCxjcpeASwdXLmvdY8QUN8C0cATulFEsLhQ8PQrh61QQMxQ/mOWdkN7lD8Qg1bDd7RelGXns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450579; c=relaxed/simple;
	bh=jUBFWHF7bYxGxXR2lz52hGMuYWwR3cu16P4oXfrkXWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CGXins/Xk/2XkFSgiovsWg5zLP+w/z1FwW46ptWZiCqImRbupmU+V5GVX+P4I9zcBggCDqrym+BaMkNRdgBqKYD+V6HA2L6Ak+vaRS7II/lNxpysNJ/e6jVnA5b065e1UPXrZ359pbnTZL5pL4oKwKmG0n5gprDTGnm76xlYql0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QKrwWin5; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QKrwWin5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9LZavTacX+DDHbDlhAx2Uo6iWicJaZrPse/eIZrXLgQQbjDfe/mit6TifthRMJGaa2FXSs0TeJzCWlXiGWXnrAbc3Oa4au/KqIN7Eb7HFLhpTnW4EDR/fuPbaAI2boNEoj7px1FsywHJNg2DwdJ5WNtdGQtyUsQQyZEyCrzSZTOifO9PbiWWLIkp1dzJnE1jloBXRK2jzS+kob9XjpDObbErDPqS+yegniypZs14QRzaWzT6djFpP2nsmAwb93lQkH7lTJSa2cTvz65REckPtp+g+gJP0L0NcG4yGxCGFFnu938Q7zRblOqvdGP+ocCzcIMhNqlUgOjLc/J6TmL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaRDQuedxh9OE8DfbPPcyRfa09dJODbN9hyMbouyq48=;
 b=j6UG4MjofLvkeQm8nt/EQe+T98sad3sDMfZStObEse8Z944UqO2XD6XFN1FXkpGzsBjZcgAPGQ9pmbk1Xjf7z1Q2Lu03rTJ4+lj/s+BfKThyfI9nmwREG7SEB9ztDXsi7OAGggEd91e5YqNvlojSHE0vbVaitk84qObMzrmdPKmtWDB7M3m5d/uCCOeb1iNKE3YQKa6QIUKBCBDFYlKmICygJALVlU5Zc0jdh3Qr/b7UhHxWQn0O9Uuz8IsQrKNLt2LgYjeOz0ljYCHzlXoSbrpiNeorbEDgwTrYFfVv9ttHWiNs4oy5T/tmQTnmtWlDYMldbm2AxfwmHGjEhO/Usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaRDQuedxh9OE8DfbPPcyRfa09dJODbN9hyMbouyq48=;
 b=QKrwWin5XJ7eK5mS9eGkKeGDyNfQoY5kNLkJcjznGh8TQt6MxOELtUkpC40QVAJHIKR+T3U+HFKD/CmbwHDMjph+ochmONIMI5VFhpxk/Hl9x0j5Wf9gI+lbWvNkmHwKLdiUY0IJDJGzucHnnt+yPScV42yTW+MtkPl90ocgFANzU1nI/x5gbuFvh0LWtRGohD3UE87wNny2s9KhWp8Qx7Pk3JqHY+0oAd4hpAgYEPVQrXFDsHUoYxv8LyFsXTjoDx6bxACJP+auk7eioQUvWUkmIDHt3d+ArBRBs9ZHmzIIC2+J1CzgK04XBNasgVuebO01DRjvWUAHqc0ZU07F1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB11259.eurprd04.prod.outlook.com (2603:10a6:10:5dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:02:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 18:02:53 +0000
Date: Mon, 26 Jan 2026 13:02:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Message-ID: <aXesRQmY22FTVZmu@lizhi-Precision-Tower-5810>
References: <20260126-scu-v1-1-b9d31da12860@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-scu-v1-1-b9d31da12860@nxp.com>
X-ClientProxiedBy: PH8P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB11259:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a7034c-c750-4a47-dc57-08de5d052080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?St32zHMfiMyt4x1SDrL5J1BIyxHkfnq/VNCfQhdOpJTxq3Cdt74YfeJ45EPT?=
 =?us-ascii?Q?xk49r3sBDZ7VgqK3gk4Ni0ZOr4XkOwpNU379ZM3PzrQbgQ7JpasT+qVjnhOq?=
 =?us-ascii?Q?3HBBbAfpn532S54boiRPAjAiHQiqT1X0CtTiZBpKr6QSrDOo4R+QJJzOwN3w?=
 =?us-ascii?Q?8ogRBcVYRSOuxxzzsqxgbqqvit4ROwdhsHnrCDK5wkbN6WazM8iuL9+4/ttZ?=
 =?us-ascii?Q?GWJZiloyMVAFcAhRt2noZ88KG5j8y9ypFbsh4/5zxoheZxdE48PJNUo53Efs?=
 =?us-ascii?Q?GFvu90Kz+GiRgxLvHIBqm9WKB7EyaRl1H1KMwL0jSssoKNjJ8cIp/LWIQikF?=
 =?us-ascii?Q?yMPnuSkQVhDp5uQ5gY+kC/UXVpyUaFYnu8hcitsOOuBz9p+psIXf1Uzu1wWJ?=
 =?us-ascii?Q?GDSlPjCRqSiTkMhs9vNVQE1dV16TA3F8vPndFzfmHoaaJS2aXsvvIclSdJVx?=
 =?us-ascii?Q?Pe8iXuxe9Nt8noBhYpr2TrJSp46+PxFIFccADpuy/pnuOIhRtfN1EEmlNnGx?=
 =?us-ascii?Q?/kuv8eUBkrkuRbNp5Ml7fpX+36DVWCdzBQUU+uSkCh9TKoj22Lxt4Tq4cq6V?=
 =?us-ascii?Q?ovg4n8W4Wguy5uMALAcCVVQhTmttMMH09A8EWkV+JF0kg0xkxnLyaoCy3LYx?=
 =?us-ascii?Q?IJeYDgm4GDWBTm/HPHaMyVvtUcv4MNLMxwjkdgg3DQDtUMNk/KDhiDh7fXee?=
 =?us-ascii?Q?uFq0pcCpdYfqCGjxniyk3LK6lQaJTyyEXoRA5b1w27mva2DSrASj/GumHHgK?=
 =?us-ascii?Q?kYM0RPkHJlqRRyAdgxZweX3jjxzCrB+V+22BeRcbYtWwlu2CnCXebg+tOmMi?=
 =?us-ascii?Q?S4sWryTiiVZxx4Gz9f4JNvM07YUnNUER0NM1VyT71dRyqDlIlV3ttJ0T4NNE?=
 =?us-ascii?Q?d2Iuf7JQ6uBErau7nI5Ina2SUb3aYk50j8+x++oY1nniFLbYsPSbiPWiFyrc?=
 =?us-ascii?Q?AqPWjZM4VNip3SMy7qv7nZBBspc3PB97RrKmKzN+Mx0DTK0V5pGKLFFG3/jX?=
 =?us-ascii?Q?vtVJ+sd4vyfz9Jey97qIfC++AcYk/XBTjbVItZAUf7iw8ccTYZLNepAMjqHY?=
 =?us-ascii?Q?/tiIDysg4emcgK6MOBXCmz2rKTvzKgiKdi5Qhl2ptyBj+p0NupA3xJ/zrBD6?=
 =?us-ascii?Q?OKqd0zHAxduLrnQBTQm4sMuUaLnvXWnJamViwjORhx93/JtfxjnQUyvdNkuP?=
 =?us-ascii?Q?nKs05EVlQW9conFvxt0SpEb18W4grjufrZPm0meiqUxTJ57Mzvl/Egwsk1Pp?=
 =?us-ascii?Q?eb7j8mdq0lbIfoJZ2kE8y5M62N0oxU2zSjP/JinmHRTlyC994CtT7eAWN0+n?=
 =?us-ascii?Q?RDFCxsbknaX85TbHV0M9Uz/F0fs7pI5GRcq03jf66+Wh+Z16CHHlwCSvhbOC?=
 =?us-ascii?Q?L1ESeeDPRznH87BSG+3zWkIHLuHiqEvVgeUfAqNBm3eJudYh5e56SVKdKl6y?=
 =?us-ascii?Q?KqsWuIFGOQ3zOQRfb+OPXQ7lLdiBDmpy2yKmL23a+UqxWnGK1HzJA+fgH8lS?=
 =?us-ascii?Q?uiqzx26xdfhmD7yrzMDcVK0ymI1Qxxb+QnzpvaDZoTNBJvAlDkLGzLBhaOi0?=
 =?us-ascii?Q?VFjUZM2zzCa1VmyXKIPxbkT9eW2MrQO+OEJJaMcZMvtWv63VI4d69IGcO8pi?=
 =?us-ascii?Q?ArxrHffGMKGy6mm4Or0Sk6E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlEdN34TTXlzJlzxqsgBFNfX9DXFByRFMrlmzUFLq9w9RfIH3DAXIBWho1Bd?=
 =?us-ascii?Q?WWFw1Vk82n5cn4ZhlMY2nAVS+OmhyeaoYKwTPzWaBKqMRg9zzyK+KNlKzXi7?=
 =?us-ascii?Q?85Nlm/k0eHH979cVm+QzhB6qa+91U9uZRtpm2mwhU2ZCVzHotv50Y+sdNrdS?=
 =?us-ascii?Q?XYSzF6RzdWLGSQetgzda7rduK+M/8sTLywFaYY1yTSKLkRPWk1TywdU0s3QS?=
 =?us-ascii?Q?mu2kR2WKDp3VJDabIKY3MuyqYblcIN1dV5Po0szDlTcefu3K8F7ng5XJC/77?=
 =?us-ascii?Q?Frc5YAw1xsKzetCebaT7KUeG2uH/JisXwTOv2wmJjQCpJaTauffylkYywAQL?=
 =?us-ascii?Q?AKeUm0AKkLx2//ssNzfWfnegFEEWI2HE2gfCLgGRhDkfrc7wWLEWH3BpoDYJ?=
 =?us-ascii?Q?wglSYzVo86vRoXyBgHpZ8MpQR94PNYCJMhWBIkdlrfDp712jLTCYWy3P9wn4?=
 =?us-ascii?Q?xljAzjtKT4fY/sq0KGGO9tFnkY7nky1JOPs1haksBiWQFFVsGgFp8pnhVckt?=
 =?us-ascii?Q?BEqvAPbNntbkXTXEGop+nWqvkl+rNRNIzRvscBCbEm8WekcISu4fgQiJ35eB?=
 =?us-ascii?Q?1/vCBuy7+JtL/ewcaHwazp8kRkWek8rIaCCRI0pjCIydGO5FdEkSL1P0vIhG?=
 =?us-ascii?Q?wWh9AFU0rstTiqp73db4LFHz8eS9Tn5846iLuN9jqrVh50sUtnDNif2qAelE?=
 =?us-ascii?Q?JLxe7QhTVnWSiNrUr9jOnb/dz4vDumhgRQ+/4bSOC9+BsCOL1hpU/nAHdSoa?=
 =?us-ascii?Q?M6CPIC+//OwE4q2TWn4sGSJvB14UAuayHAO6zOB3otPAKHcg3aSCzWKfxNaf?=
 =?us-ascii?Q?IAlT35nPW/0Lh3pJ+CDEXJe6l2OTNtMlSM36ZDfS1obKRggxAKoO8o8e08+C?=
 =?us-ascii?Q?D/diDa6fIKh7MgsKI1fdzYJdxF0AaWFDYNHZhctLGKCdR55+C0CviHpMG+kf?=
 =?us-ascii?Q?D32dzVYFELMZIeGycywSP9FJPzyBotHYf9jUID47LuJU70c7Q/3BrLCbHTIJ?=
 =?us-ascii?Q?az/t6tPBZzsFzcXhpGMTPVFD6ooe8D0wnRmrtCrSjuTE5NddQ5VbuHzS+Qzz?=
 =?us-ascii?Q?+rvk+mjtCeUwAMW0uDQmeVAQyvFW1dvJisbfnoH0CprnTRvzBwb80JQ5ILyB?=
 =?us-ascii?Q?CI4qYzrnlXyUI4UEIOSVEnilZf3DZfWOHsLfG7NO8r2qtBTX8kPcONLa4w0K?=
 =?us-ascii?Q?Wg6X+lpAD04tgSsxbIHlWDK+5uckx3uMjRq+5/Yp4X7/V30hBW6oOlzIDtQ4?=
 =?us-ascii?Q?7eKOb/N3a+g1Ks/zUGhX87iHtoDBiKI/+UkwZK6A3qDs3HOcIZU0m93vCJ7s?=
 =?us-ascii?Q?f63ThsFExbu3/OLDy82N8++pbQL5IVG3c+HYaiS64XgJFffVCP/6BQprnLIE?=
 =?us-ascii?Q?bMLahgtepMcQkbPkpeFZb4Z22/ncIQkRYvoSfrWNk3V15JhyeilnzhRP+1ME?=
 =?us-ascii?Q?YyiKD6c9QzW2Onq9TjiDFwt6WjvoQLMY5d8xoeBeu8wnvAiSJSr0xGrgXs7E?=
 =?us-ascii?Q?yqW1yognvUS+jwC44waTYHdutv3lN/BBeZSrj286G26O2A9LTa+JX51Aw8lo?=
 =?us-ascii?Q?0Ny1P1g5m+vfU5hJI9rytSvq3v0wj7+LpURtlbYlfcibjYd9i6gh50/19n4t?=
 =?us-ascii?Q?uflE22ccIq/bw4XnPn5X48XxosNUAN/GpAg/22BsUuWyDwrKQki/7ZS6R4Xx?=
 =?us-ascii?Q?ULMNNSmFsZhcrBu5M//nqzgF+jfMv7D0UguhtUK3ZqI6jWss?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a7034c-c750-4a47-dc57-08de5d052080
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:02:53.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5k5Lk5NGfvPghuTbtWhQUPuXoz/4kVaqkw3+7OP0pm19wqwqQb6SIE6zG5IPFV/C6P9zDVuVjHNetzBXqRU6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB11259

On Mon, Jan 26, 2026 at 11:47:02AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The SCU MU driver has long supported the simple and efficient single-TX and

Does you means "long" is "already"

Frank
> single-RX channel layout. The older multi-channel MU configurations
> (tx0..tx3 and rx0..rx3) are less efficient in practice and not needed.
>
> Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
> binding schema. The driver continues to support them for backward
> compatibility in case firmware publishes the legacy properties.
>
> The example section is updated accordingly to demonstrate the recommended
> layout.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> index f9ba18f06369215691c69cdc1538b53dfd369f37..307f1c6278532ace94db92e6e8b68312eb4c8a4f 100644
> --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> @@ -76,7 +76,8 @@ properties:
>            - description: TX0 MU channel
>            - description: RX0 MU channel
>            - description: optional MU channel for general interrupt
> -      - items:
> +      - deprecated: true
> +        items:
>            - description: TX0 MU channel
>            - description: TX1 MU channel
>            - description: TX2 MU channel
> @@ -85,7 +86,8 @@ properties:
>            - description: RX1 MU channel
>            - description: RX2 MU channel
>            - description: RX3 MU channel
> -      - items:
> +      - deprecated: true
> +        items:
>            - description: TX0 MU channel
>            - description: TX1 MU channel
>            - description: TX2 MU channel
> @@ -105,7 +107,8 @@ properties:
>            - const: tx0
>            - const: rx0
>            - const: gip3
> -      - items:
> +      - deprecated: true
> +        items:
>            - const: tx0
>            - const: tx1
>            - const: tx2
> @@ -114,7 +117,8 @@ properties:
>            - const: rx1
>            - const: rx2
>            - const: rx3
> -      - items:
> +      - deprecated: true
> +        items:
>            - const: tx0
>            - const: tx1
>            - const: tx2
> @@ -167,11 +171,9 @@ examples:
>      firmware {
>          system-controller {
>              compatible = "fsl,imx-scu";
> -            mbox-names = "tx0", "tx1", "tx2", "tx3",
> -                         "rx0", "rx1", "rx2", "rx3",
> -                         "gip3";
> -            mboxes = <&lsio_mu1 0 0 &lsio_mu1 0 1 &lsio_mu1 0 2 &lsio_mu1 0 3
> -                      &lsio_mu1 1 0 &lsio_mu1 1 1 &lsio_mu1 1 2 &lsio_mu1 1 3
> +            mbox-names = "tx0", "rx0", "gip3";
> +            mboxes = <&lsio_mu1 0 0
> +                      &lsio_mu1 1 0
>                        &lsio_mu1 3 3>;
>
>              clock-controller {
>
> ---
> base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> change-id: 20260126-scu-c93d45e319f2
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
