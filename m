Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2080.outbound.protection.outlook.com [40.107.103.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F316E891
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719867874; cv=fail; b=CsLzGJCxELW6HEkmXk+9QGmQmLshsBYmEAFri0lx2xFbBtGgoZTAn0LR/3FiWq0DO3Y6iCnNy/evkfDxXzq16kY/Ec/oX9L+mQjsUmZyRVcHzsXmUzmfzYq15wOes+rGy2k+gLu7HAAGxrnzmsTpdlmVcjd9K41Ee3aJGwuyRnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719867874; c=relaxed/simple;
	bh=Vd5JPz9i/PO6RaYUgqiDhrbxLrTmaN+qRK9oofCLl9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qUn1B5qnjHLo5xMq0LnvNJFNFMpyS4Exv4gpdISR6sWFq/qOt611uKDbJWiHG9aPbT235BvxcpyGBVEqVrL19YZdSON+r4gcStY+inPhLdzx9+fEu/lxJSNxX5xp6avn3do8V7qkxLE3LUHETbe1Qv+gQcG5ESDeFdh/f2Q6PrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=VknnhasV; arc=fail smtp.client-ip=40.107.103.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VknnhasV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDgIIwVApj3S1f3E6E8L2EYkFdwBUxm5ZhRoSYhmNJzcgdZmiumvwRy1OPwNtOzdS2SJqRmAFwFqQ//5vckgZAPilMEUhdFURcBC6aTIMnZsmg6+5QsmUSkTbiTrhoJLoTL2gIvMxZzrOAxDlBdQTHIZInbPL7qWyl+G6qZee3v2vmGk7H3yj1jm16669qTSOitaQUpmUTq29cFYGJGgGjBoD2DVgAY021xZNITcNScCjwct/ofJ/UotMt2JRGlt06jy5xHz4Sz8VS56JHPf8EAP94FEdF2GtEosaiHdXB9uXN0f3L3E0U4PUJZklxiYuHqiKKLPlLInIjogDLyBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rops7zJu8Kj19Sc2TGslLBLJLX0SOeKnYEjxWCDjCC8=;
 b=QhKAkF5p5xYu+XoZzxQ/lVoS3JIqE2bCi3+8nPcwOGEV68p+EZEcw8kcuu7OTb9k7sLhWIp0QQ/OXD4ChKNlgT99vnCKxGpRg4/pcDBltD6SEP32JzjXP+O9PTvF79XgATXCVrxJ+vAbnNx+LGjSbVvTAqDDGCmzrzFGxUs2LTqD6Pu2oobYJ0LfP7mEPSbAdei+uuri8NHQFEbjiYtJEcz72/3rUfo9woykr/q+1JZtaXKrY6lyYljeRXHyScu6tT7P12kVWxGPznfDTTgljFKuFd2eWKqnCzLYtgKLuYyzt0uviO08oBKVxbTWf/GOogGyQu4r4YYk0+F2SGEkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rops7zJu8Kj19Sc2TGslLBLJLX0SOeKnYEjxWCDjCC8=;
 b=VknnhasViY8AigkF492B1dvQZIllpRioYGp/9wQqZw2D8QEvS9fbbcsR3wlwoZI8bJSG42PO7y2xetN4qm/3xq4qapo3le9VH2sQM9O3qElwDIo/6kUzWeimitOzjfACmRfaNgOeNwGeXliN73CKqvhrDdt+bbmURfYu2fn0DAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7008.eurprd04.prod.outlook.com (2603:10a6:803:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 21:04:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 21:04:29 +0000
Date: Mon, 1 Jul 2024 17:04:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Remove 'snps,rx-sched-sp'
Message-ID: <ZoMZ1QTNyTNmh7p/@lizhi-Precision-Tower-5810>
References: <20240701205458.164053-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701205458.164053-1-festevam@gmail.com>
X-ClientProxiedBy: BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc15588-d068-45ce-8b46-08dc9a11658f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TO7XyomVszEl4bNKRZcmOZupXXAU2IoGCij4PIzHjcItBqc+DCrVsx4W2603?=
 =?us-ascii?Q?HfVoRviXdHNoRTijlEvLsvA4X7OaRVt4EFO9ndXxJVTo7BikqlaLrf2P8xXp?=
 =?us-ascii?Q?L0r8iGwtZ5o0ZUb9dPj6QgOMkm3NSw9113UsuQ9lEYupk5pcwRq8CKgNTlu9?=
 =?us-ascii?Q?kFCwbuj2k1YOJ+6DIUD3uqRNhzduiUbNZE/0KvsICqPEtuPHaKqWo937kg6D?=
 =?us-ascii?Q?iilfh1i1sNpBoGjZIXRmJTKPUAIw7h2mKb0+p2gGqR0LIAoRU9fmqtUd1WE1?=
 =?us-ascii?Q?itdcGdqNiVk7UqgPwr/JKbHoLfOgXvqjmdWRvWr6lhYl3Xf+jwMlGpIdI2Z2?=
 =?us-ascii?Q?0N2MDu0ptoQbFKUeXza/1zg9LafyMLuXQMlxoYzLekw2j/EpyiesFcv8NMvz?=
 =?us-ascii?Q?82IhPasakH2WuGQCGCSR+bDA7eqfnpa1NHvdWs0RHOxeIY8pLK9L+gI8U99r?=
 =?us-ascii?Q?WzQ6X+iJ3xw+s2f3xjVzANJGrgBBYk95C+TrGmMbcyRA7hwfGoVTJkhwxl5K?=
 =?us-ascii?Q?Q8BtTSK2F0c52IB0Tzu7KLj92MhmesOGvv9wt3MC+JGBpMLjcdnq3BJrjp3b?=
 =?us-ascii?Q?K3quQ9wbSRJRR+E+NB86h1Dpn8+HInaoxS0IAI0RD7y5IkKhBrOnBxbZmO0P?=
 =?us-ascii?Q?iBVK/6vXbWc8fO+kqwvTmt3dwjVE9eMM4uvDYdmTtpsOCZ+pAsv4BWU+212i?=
 =?us-ascii?Q?GFIKKAihvsoA+8iTZTcF5FZwc0wq4MPqDqLIZYIedbYRPUYH5PnXl3Z9wz3r?=
 =?us-ascii?Q?qheZqs4rjYl5PjzURRynP9hiRTlBosdankC/Gd+3xo3zS6lNg+gdWLWrnuKt?=
 =?us-ascii?Q?UnXpyPF7TRolugyyJMRBaMPbNLvgWzqJsxTaCNHQ4SX+5YV6IyBt+mxyKH3O?=
 =?us-ascii?Q?6ptYO7Kw4D/W2gI4kuKFq5Wn1p6AGyzn8dXgwBob6k4gdtuQHEz/vbWfGMYO?=
 =?us-ascii?Q?UMxyO6PGrN24qE7iEqMEpxmG9KKEZ75YDus4Osx6YBHFt3qTmOjwytIqhVHU?=
 =?us-ascii?Q?2B7BmwDqpTftV/po636MQc7Mv6A/viBtmHu9ov5nKg8ppoYjHr/MoDWSCqRB?=
 =?us-ascii?Q?dOhYiV4Dn6Ja7iEJsPglkXtq3+3P/or8KgX1YEuUwwsd9u6mnkdUq3IqdkVr?=
 =?us-ascii?Q?qw2AFvLWEJ/LNpmL/eftmp8r0nwNiAryeOJD5Rk/FKBVc8iKjP5ie5eUsxKU?=
 =?us-ascii?Q?BZFkoB3pHmPNiRISA+mkTNRT/VCwxwewwCJbWIhkwlFL7i9Ma9mJ9mocDOH2?=
 =?us-ascii?Q?31rTRmmD8V4WmRMcpG7HO+xrLBaIbMnZyoUYQX7XkS4Jq34JqfAZdm6k1GB9?=
 =?us-ascii?Q?fwYbU67FWDXjJpu5W9Eq0ebElfeT2UsKcsWvef3UKbnDKZtJ4Bpe4faZb1aT?=
 =?us-ascii?Q?rpim+sg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M5gXD7ZDzKXTKx7/XSPHqXQK/gtCgIwy4m7VLKeCRkiramLvWrOetDJoOpLF?=
 =?us-ascii?Q?ktmkM2zFAFie0ZO+1s0GveE6DpLl/lhBosqhcrGks88WQfLId3byf1HUMTIM?=
 =?us-ascii?Q?hiUx05NLUiG+aENk9Vt3cVLv8lVZTDQPh8EvlI0k0wz0+a5J/M0Q7zk1X4Aa?=
 =?us-ascii?Q?Q93GW4AJqjj3aV148PnKriQRuHwdOzbHFDPTEpAA4ybKsXEjtb2a4uS4fpBX?=
 =?us-ascii?Q?gegpwtZdqBYCx2V8Whid5biVJci9WOkxseE4B2mKS4aNJycS7qIwMcacu3p/?=
 =?us-ascii?Q?kDbLbjxfzkQ/X2fatMhiozoembxjctgg9KBAmW8vcp3G94ElroxNfDiiMUOD?=
 =?us-ascii?Q?G7Gp+GmqkUTGNIgEU6QMwVmzedi5YiHcOItbiXGmxJX6+v+QNRRHRE6j3CD6?=
 =?us-ascii?Q?SgOw+yG98A+sPIMhfW8NzRL+DOAqT5s8Qf4QXNiHcwsxO4Bmdpci5CqwTA7O?=
 =?us-ascii?Q?WdL/V7SAX5yKH5hlZabNUYfvmMide1qHxkgatDDqFn50AggtL6zcBxgjk6pV?=
 =?us-ascii?Q?O51iMe1jgFDUXMku4eNCFuG5DNonysFsBzJ8fLYImEz39qRwu9bV+A8nBsJF?=
 =?us-ascii?Q?TIekExQQ0YT0P7q+IOWz59gePcMv8uMPqRqpKakIrLPW1iWpUEyIeyZJtcXG?=
 =?us-ascii?Q?4hq07uWmUJUQS9z2QA0+jpYxJd4kF6bqlttzGBl+BLkeEpL8UythpAaK1qC9?=
 =?us-ascii?Q?WMvrp4rkknwRd5hYPgqcPhu44MHo1/jBtIBprensezqj2gxZyzqjNa4SFlUF?=
 =?us-ascii?Q?kin2aPAmxWoXRfjMwQv2ToReBaOtl1LkLQIlp13DFzy1D2ANgJVCc4lnXzGl?=
 =?us-ascii?Q?FCeBT8N2w4aByP/AKa4A1TJ0D/9xytGWW0k+MkX2D3Y5JMlRqZIY36yV60NS?=
 =?us-ascii?Q?mVktUDGTvY2iWyE+tR5USOPAglugHbFf8LvOn/epx+QXkf3bIUpiF2S2lHGl?=
 =?us-ascii?Q?DLit30be0WQHEqBeL0kduKwycSQ4vzoOimRQWlmyaspbMFaY7+r5OBesTXvp?=
 =?us-ascii?Q?ozvK9YTmuAQj5v0K+MKAzbmoB7M/3CyAEaqyLRgwxXFRSKTRbsXd6a5LZFqk?=
 =?us-ascii?Q?8U4ZNEzI48Pv95olvfMmMalmauYlUwVVLtghZP3DAlrztGnY19pOX7aQBR3s?=
 =?us-ascii?Q?VuT4InfNBhhzdS2ebrnmwnjH0mc+QQvNaY+hhhVu9qiBGRjcgrvPmcIta3XY?=
 =?us-ascii?Q?IgO50YmXEhxjtWelCJmkc62ZJ13HH9R3ZANLTISFvkX7lhSuhEYrBXw3IG2R?=
 =?us-ascii?Q?ySK4CQv00/TiJOlihWuawHw4vSbAOmmLErsJbebeTTPPoLJ9RQvBRyAmjVJy?=
 =?us-ascii?Q?TBe8JKOPJpsoQXLqUU29D4HcPISzHoGOsktYVcQ0hCzRboNtK7bpIajd/1K0?=
 =?us-ascii?Q?PxDzW8+s3ClyJ75VFSqc/la3DmkuKKTtM/wGKTXs31p2v6SVowDyWmIHBphQ?=
 =?us-ascii?Q?jLq0j5HlVLVaGXNnwEE/SAs/zKOWRn4VnL64Zgk2ryByIgxVoTGbxlysZ9ov?=
 =?us-ascii?Q?a1LKDiPAnNzNbqRn037xPKMnJ1WgSTg6zSmCSqO71UIRmpMXfdnY7iAveLl5?=
 =?us-ascii?Q?CuksLCOnKKh5+LSi+KU74E5t+U1Gw3v50+FZWZ/t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc15588-d068-45ce-8b46-08dc9a11658f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 21:04:29.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDgrnRK8FVLtl+e2fJVMiiF7m57DErdOVGfT9d11yxpwAUkAmvzXD7YVtGz5fRLtOrpwo56A2ZfmvYPnIqpGew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008

On Mon, Jul 01, 2024 at 05:54:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to nxp,dwmac-imx.yaml, 'snps,rx-sched-sp' is not a valid
> property.
> 
> Remove it from the imx8mp board devicetree files to avoid
> dt-schema warnings:
> 
> ... 'snps,tx-sched-sp' does not match any of the regexes
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

No sure why Krzysztof NACK a similar patch

https://lore.kernel.org/imx/cc7aba44-e111-4cb3-b842-f7fedda24113@kernel.org/#t

Frank

>  arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 2 --
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts         | 1 -
>  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi     | 2 --
>  3 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> index 8be251b69378..15f7ab58db36 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
> @@ -71,7 +71,6 @@ ethphy0: ethernet-phy@3 {
>  
>  	mtl_rx_setup: rx-queues-config {
>  		snps,rx-queues-to-use = <5>;
> -		snps,rx-sched-sp;
>  
>  		queue0 {
>  			snps,dcb-algorithm;
> @@ -106,7 +105,6 @@ queue4 {
>  
>  	mtl_tx_setup: tx-queues-config {
>  		snps,tx-queues-to-use = <5>;
> -		snps,tx-sched-sp;
>  
>  		queue0 {
>  			snps,dcb-algorithm;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index c2c708c492c0..35e0ed23bbdb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -294,7 +294,6 @@ ethphy0: ethernet-phy@1 {
>  
>  	mtl_tx_setup: tx-queues-config {
>  		snps,tx-queues-to-use = <5>;
> -		snps,tx-sched-sp;
>  
>  		queue0 {
>  			snps,dcb-algorithm;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> index c96e74684e03..d23a3942174d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -241,7 +241,6 @@ ethphy0: ethernet-phy@7 {
>  
>  	mtl_rx_setup: rx-queues-config {
>  		snps,rx-queues-to-use = <5>;
> -		snps,rx-sched-sp;
>  
>  		queue0 {
>  			snps,dcb-algorithm;
> @@ -276,7 +275,6 @@ queue4 {
>  
>  	mtl_tx_setup: tx-queues-config {
>  		snps,tx-queues-to-use = <5>;
> -		snps,tx-sched-sp;
>  
>  		queue0 {
>  			snps,dcb-algorithm;
> -- 
> 2.34.1
> 
