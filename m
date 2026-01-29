Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4E352C52
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708142; cv=fail; b=qaawrG1+vNEXZiHaNGUrKiaCY8weMfLhvikKt4WX9JNu/DkYiRBPO1ZWhYQpkdS/Up9CgfdUaeT42AxyEIuAwMcI031MqmnttTXkfJ/AI4LyAs4+d0EI2717bXbRyJFmJLk3Tm07+q1UC1k4LkC516SfT+n1rgHDLGYZjP0M2c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708142; c=relaxed/simple;
	bh=73Xi9CLOwIk0LNIpUjLlo25h8l+S9SQZOXZMu91+JNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L6sJVKMS0FlbUIS50xx8Znf0G1ffx3gWMXOu8LJKKFbrOmc3+hVn3UVe/tzcQGl8O2RnXYrKKTxjoT5WgYSq8rxSSGyJVMOfNqYZ2akMZzWlF8e9KpXeb2Pk22lLt6jA0zBmm/wICfKdave3LP/6wrgozl+fbQVuua/MX7ZergQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gAFH0Jtt; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gAFH0Jtt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTtuulqumtDioGDDdmXeKgZa19hKYo4d84oH8A16xXP/S5WvEUJh36Rw1EpLQo9BfdiDy46n6uIwCKVYNrkyrydIxz+oQ8RI9hWGsS0t0VCDahjwLS1bMbY5x2YUukHiV0s+Wpvk8bB3QIMKhEAaRN+jvzqghoyLgn6/KdFvTYFEJk3MZvMlRsY/eU6neyWJch4fCq/wbeUAfvIzv4k3lhzCfYmNQ2pdMEXU8T9DuG6AdO9tkc2s8p07PeRAa6bpgI0J1SZIXaU7PJ6l0G6/RsTCbI2MN6Sx9NkwHil6fXvbUYOglzBsv8A54Z97oM2rW37wP5Y9u+KHmrF3C9ZUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5Hm2P2seoKA8wmQPDkHCTmKz8nYwjx1uw96UYZXBg8=;
 b=Wl56oeXTv+uCfxXEMzF30SeAa5ZVlrFUuHYZr6EEOmHcFjA/htBr7d95NPb6+AR7bD/PiMTe8JN2h50hXtiF2tfcV9Y7osUY9k9x9bmlxCyVrj9I7993OkHJpbAY+H6a/n20pvEhyHph+tQZxVZhf0gWTPSUl8i/nbwHX6c69b0mRAQb//rnoGqlFHXQlLN1TlX3Qp3n5QOGW+hIpkjBnNTQBuvE/PEgWDbOdGFii8IFtBys867buOvquwc0CZAmQ8SSXrVVfqoZLfCzxMpsKTalTvEm01tYk9CBmdIW2j0/ylFKm/NAvOzjcRLTRVZylZ8smvRF+2lkbA0J9qMtyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5Hm2P2seoKA8wmQPDkHCTmKz8nYwjx1uw96UYZXBg8=;
 b=gAFH0JttQ3NgOXx02WQKFcCIPjDl2DCUWfcfQoXD950fyi+6pkSN0jWNCysv62cvzpDxaRNQEE9VXRVOi7nRbG8Y4RaJbdsl28u0u9qSkQpPl8ZOfEqZhN5ytQaFf+bF9SQ2AxSB9c9O0kOWiUAva3hszhmxJa4Y4+4HgL2PM7xGnMEkEXO3AoKrgkUFV8n90bGKF0E7Uh/+cEH3efZZDErI9Kxf2DiZ5JfrFkPGLfC/TzVPi3MPsAoPuYYvhEaKIv44lBg6WkLkqILz0Sb1ZLAWm3t1Lo4akk5t3MSFzpLVUuUmsgD6XZDl1U91a06w+QdLlbUzIqz4fCk3koXXug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10783.eurprd04.prod.outlook.com (2603:10a6:800:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 17:35:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:35:32 +0000
Date: Thu, 29 Jan 2026 12:35:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/4] arm64: dts: imx93: Add imx93w.dtsi for i.MX93
 Wireless SiP
Message-ID: <aXuaW5Wb9YuV68Dh@lizhi-Precision-Tower-5810>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
 <20260129084249.3079432-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129084249.3079432-4-sherry.sun@nxp.com>
X-ClientProxiedBy: PH8PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10783:EE_
X-MS-Office365-Filtering-Correlation-Id: d969ccd4-14a9-44c1-e82c-08de5f5ccd8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?1c+Q7dsvxLcMPI7pYZ06op4vT/veX3NwCgd2AYqpUlJXC+yhE3MTOYXaSdjO?=
 =?us-ascii?Q?jspKhyhaFIsFzN1i4y5GHFgxcdhQRRfJs+5RwOHY7L7uybDbTFCWTfdaIZkP?=
 =?us-ascii?Q?Jmw2mtrjVKgO5Jam/7rSohSrvwvoqJaRDgFWA8r93jTbPfkNHOHVXZNWDH4F?=
 =?us-ascii?Q?9DRpAgtZ62vdN8blAmdc6ZoAj7ZLfXpx7SIpyWjqChQmcfbGkBqIZksYvQQ6?=
 =?us-ascii?Q?COSv5waKJCCSC1xGYvI1wEVy5oB/B//sWTYamSxltzzSTAP6opy4jchkBnZr?=
 =?us-ascii?Q?6LlLcIhD7sIFn7sQIBk4ZBLy1yfucWxRiTcGYQL1Fx2ZrPVRGPwXfHIGxnxF?=
 =?us-ascii?Q?bA3QN+SsZ2zTg9Lr/kvrxp+79fYKg4uu7J1AONN53Shec+GOqjfRFLiUnNFW?=
 =?us-ascii?Q?2PaU3evNB9dInvXrVJj7qTGK/A/4xwHwt81lVg4S1+VMcSblDjJaE6so91cI?=
 =?us-ascii?Q?F98APXDcRdfCXJePiFvczfKYOq2Xz1o8CF+n+z0A33PUnzF2Ch2t+ig5GPgg?=
 =?us-ascii?Q?DnNW0B278byTE97sSmeIBmOXXCquz29hinlgrru9B5QR0ijMfnLmN42cx8sS?=
 =?us-ascii?Q?G60YDyATnlvZg+xxdmsRuN1k7u8si/oyheQ6g5OQ7uExErg0fE573L54gvW4?=
 =?us-ascii?Q?d/+MCM0lPpx43hc7kOq/g5HkFoKC5W40vcnKWSlyh9Dy1iExr8rWoBLrviCy?=
 =?us-ascii?Q?TGwgkv388IZJJ7sndQHdZWN0NYrTubkReD4pExwSefr+aCnFfL5VUdRLoknk?=
 =?us-ascii?Q?36iLtaYNMOwyWJFXor5TXB24xpaVnldIdAsHE1hfceqn8euxHkpGs84GiNtq?=
 =?us-ascii?Q?/TMZ3oDwWKu9iKV7Yg9jxur7meRVhoHTwaOjvY3O2noBts/HPwHM3XIOTvHZ?=
 =?us-ascii?Q?bZ32BUkmAo2PQpvOz6mrUGi1IFamDyjVsyMm3Q5uMA5AdcVqytNG+IACwFqf?=
 =?us-ascii?Q?fo1yYjGZBu8zWiIbDwKZ8Q5fsdLoATa9rQ8zasOYKZySht676V0qxXjrOW9A?=
 =?us-ascii?Q?u3XoTwN0BRFUAPfBuBt6uNRjn1K33/FHpFJ+nMrURexo6GAKqVEAMMR6m/Km?=
 =?us-ascii?Q?TB8Sajwqa6BAEMRUNFzmULVDatAx34bDBPmI/U9hi7qZFeMin/Hggd4gBpxE?=
 =?us-ascii?Q?ld/9N67j5azgYLXEN/I6x5rMt7QJUN7db9fzTYtIu3WI8atrQghJxkfAtPi6?=
 =?us-ascii?Q?7F34KUoHCW3jyMXlLNlA6qmomsnR/bSgzF/evSq7Xxt16Rr7WSCpS3ue6IE+?=
 =?us-ascii?Q?j/pItN7JuM3ciVvkxgiq1cRK9WOwnmUDXWhhdq9gzD642l3AXSBbhljdeSTo?=
 =?us-ascii?Q?LoRrgUkb/6BauGfr6iRv5yUpjGa9C+mg2PVF/Uf+wnUORyxsGWtPj+VqTpcl?=
 =?us-ascii?Q?wxWBh8406o8SPtxVyaTJN3ZrqG+CJCx8mjjlLnwt/oRbEkW8oiZ8pazjYUVr?=
 =?us-ascii?Q?e3SOjvMP2MIBQPIjVXz0P0waj96b8cj/2a0WEPAAs2DNGY2Msot9SFDXyuzf?=
 =?us-ascii?Q?l6DjMSUsqy6ISY5YcbW0hRyi/zzGjYgVTsILhhfSV5s4Kdv1og1qT3e4UuhO?=
 =?us-ascii?Q?tC+g4AsbdAMTLlkaIoPLAl9Tdg2bz3evMsrfw6AwdT5nUImYxBnr1TiDyMwN?=
 =?us-ascii?Q?5wuWQ3sAJmatOH4VqEnOKhY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3OQBYGKosdvyge1hK6qtGRQ7cN7cG975Q+wW9SBRTnO+bLGO8xLHjJzKms/z?=
 =?us-ascii?Q?CRnaTEXwqHq0d8nRiIdMlIT1w6f/5DyJubdqA3ZFyGlsiazmOU5p52jjkaIz?=
 =?us-ascii?Q?xm7yW0jF5YSSrXyZhckCMi8AdNKoTHVX8n2/JgEobG4pGe2c6hyQr0o/QDSz?=
 =?us-ascii?Q?pQGDVzTqqG1IWWW7Ydbb8L+PJFD1QmEOUc4KqHRZyMXk/7mOH/OwEDhYfEvf?=
 =?us-ascii?Q?seJRd7ziybp3mv1fRQO2uuGrGMTPuVppYaO4FK8vDaVaB5ewVAkQzEWS+e5f?=
 =?us-ascii?Q?EmmhsAb0hDYjQZG46Q8rp7tEuEWqxJ848RA6gfI/p7NIQ6EEC3KgeChFiOz8?=
 =?us-ascii?Q?DIxXcjR6Iy08qZKw77DM6jjlZsO+BraK3c5tcDJ0m/yl6pHikuLS2q6OmEKx?=
 =?us-ascii?Q?dVvAu6Tp72wjT+Bzdo8OrB3LtDvGOh/61Vybg7IP2uSjp8qUMc3MKHNWXLVk?=
 =?us-ascii?Q?WJReoOGL9V4co4ahq/tmFoytIcqCdghTnnGYWT0dBkJtYXlbab9/W+oFU2ov?=
 =?us-ascii?Q?MA5e/03CtGowhtcmvF5/ExH4wSpcfjPUE27n8FUYkYWGdfhtBk4D98J3SqtC?=
 =?us-ascii?Q?Jj27GlydSmrd3Aw1ynR5awCvMxIxcFQJWmKZKL5fuPq7MHKXk4qQ1oB2vbk1?=
 =?us-ascii?Q?czMVV9YwriyWWbNQsh+J7JTu7JeXIs1KEOk1egzeLtRV00eU9TmLTmX8HW4V?=
 =?us-ascii?Q?92wKaeOun8KC0Cw40CHnX0bHShyyIaIILbRllnBEhRA1DHn1eA7axVC9M1oh?=
 =?us-ascii?Q?Hxdh/C95ffl97mJcWi2m5tzBCTxh2EAfmQ20tPwNakD8G4jZ52bCBimmiS+P?=
 =?us-ascii?Q?9HU5opEnJLMcSr8XTgzX1o7oZYJungyk3gzraGaiKileOZWqM59b6Y/C69gO?=
 =?us-ascii?Q?b7xq9tLAMh7j4l6laeMG8Ry81DVpkaGV/0MZc0fOlcNPjyPkpxRDbCJPr2sb?=
 =?us-ascii?Q?jaqFhl7X6vnpw4QwViLV4/ahjIrHVFdNx5Hy0+bvaIie2Aku03c3ETQQ1RiY?=
 =?us-ascii?Q?O/nmBVuExUtJ+MJPbrbQ5VpbOXANaDJ3wOHVPb9kY0C9q59+vTvMMaU0aH0a?=
 =?us-ascii?Q?SxEibWCZSElUPTpPFsMLgvH6M0daDhuhm8eeaS/hgqlSncFnUPPDNvXAdegl?=
 =?us-ascii?Q?l5gUz0elVaQ3ujcy3WapnP3f1j0myCBHEGoHOKk03k7CB1o8WPA1wQFwxmpg?=
 =?us-ascii?Q?HNJpYPsghtXK8IYNBEMNV0PfUlDuGKJmjqvMSDmFa7vjqXaRO3jwFUTvwmwm?=
 =?us-ascii?Q?s5j/g3juScE7ehxRSiPSoIMuUhTQgAsgpwHf8IA+0LB1ccutcDSi/dISu0q5?=
 =?us-ascii?Q?/Sa2jrW1Mo9mx4XIKn38saA689vQFWb94uCtqQR/Gfml1a3Wi0io4vaWBxev?=
 =?us-ascii?Q?ghBxLL5W3nzZaL7YRo7JSYIbcq2V2w+TRzs+KqII0Biq5eCX1Z1CozU9f/KL?=
 =?us-ascii?Q?933Tegooroy0NmHngr8cU8RQ65eN6guyhGvgkQRt4FMmLacobKENVWeicjJX?=
 =?us-ascii?Q?/Q/ijEArPzm2Gl+xeGi5TJMuKxxkFVCRLP+wpeJfgdc6nes/fZEX2Gn4B953?=
 =?us-ascii?Q?h359PtL+ZlBqCqvCAxGsaF/AUqpJo3gHNI5rdJy2dQ3b6FfAl0N2guzfwvLF?=
 =?us-ascii?Q?PP6JTdZjsp1vp1L5+XYSjR2syl9WbhTTSf4IZWNdH1moTAiEIeCkccHwiUFM?=
 =?us-ascii?Q?RMZd2T4oeaqxzSsSZNWKDQSl47ya7/WYYb3vzjKX+KOSocWtqY6F/mxBNMLl?=
 =?us-ascii?Q?+YzkO0DSBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d969ccd4-14a9-44c1-e82c-08de5f5ccd8c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:35:32.4790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 070OHjU5hTh6KW7kgCcj5MWS2NhartbzmegEbBQ9TeMzF2UWweOGbWP6bL7AsWoRlO/qSJ53akcSNqir5ktPsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10783

On Thu, Jan 29, 2026 at 04:42:48PM +0800, Sherry Sun wrote:
> Introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP, which
> integrates the i.MX93 application processor with the NXP IW610 WLCSP
> (Wi-Fi + Bluetooth LE + 802.15.4) connectivity device.
>
> The new imx93w.dtsi is based on imx93.dtsi and adds the pieces required
> for the internal connection between i.MX93 and IW610 inside the SiP.
> This includes USDHC3 which is used as the host interface to the IW610
> and the required GPIO settings(e.g. WL_RST, WL_REG_ON, etc.).
>
> These nodes reflect internal SiP wiring and are not board specific, so
> they are placed in a dedicated imx93w.dtsi file that can be reused by
> multiple boards adopting the i.MX93 Wireless SiP.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx93w.dtsi | 102 ++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93w.dtsi b/arch/arm64/boot/dts/freescale/imx93w.dtsi
> new file mode 100644
> index 000000000000..30da79685fec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w.dtsi
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx93.dtsi"
> +
> +/ {
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
> +		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +};
> --
> 2.37.1
>
