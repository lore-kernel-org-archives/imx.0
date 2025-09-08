Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE0A55
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757364665; cv=fail; b=TVcxcV+5VHLzLjdNROllm/xz0NNFMAkk1x/A0QLcG2u86Sw/TjHe8PEPH+Fs19zx30h55puPUFrmil0U30G8Pd/aMJ/fSjrrFy8BpeFgkplc3zcYCDX4N2e1arnmgp7C8n5eHD4FMFmXMn/ogybz77czbg9ZGzikKLgNHC4mNfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757364665; c=relaxed/simple;
	bh=Vsx1iXYfyGV0vUeAS1b5AUM9SnFWiRlWGOnb1jozojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KTL7iVtYI4zuo7sQmK+N8b+GBOVw5TJw3mU8965bO0YU1IyVRiESqTjkT1NAWGIBNiysIorWWshhyXUh/CxtfILzHvDx5L6QMR700WB4KZ00TiZl40HE6DP/pEzh0iXgSt0Kgcu93msmlY4Q6qw7LMKsTCiLyWfBE7hJLsJYKVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gWZHAQpc; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gWZHAQpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBT/YOpNDKe6X35KeRsNwt6aUDFaqZJihSeEcYEg9Ad9bJx74pjiKfoz4Hvlrui8KJ5+NETImgbwb2nNQeu8D73qQmfVZTfD2ltWE9HTQSUMS7mk3ds2YfLC8ycBT/khSKbBX14CSGk5H10jcestJcS7GMTnn/L7vRv4WTSdqcidIxJgSkI3W3P0D19ndsjNHgJd2YCMyrQ3Jdawz6qRRqyZM5N/dA5l2o1JOB7JuQTpa/mITF9y5KCDTtiiu4EQ52UEXzubM/ZNNxuo9iluxk55RkOiXxmVyMy2/PAq2y2e1Fwy7xal2buCuuqu2ng2o9Vf4Jl9yRab6r5okZTMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PxLaRcAA7jPUePUjVcZHRz4rg+8XMJvOpwBOdZI7ZE=;
 b=enmwej5QUCEPq6cMbJrXCaxKgLkxRSrYruQ5yS0vmsjbIs4OM+x1XjG9r/JvUwD46b4BsC63Kn/AZpyle3IYyj5QPf4JrMnV3C1031jJkAXErqgHoSarX7a0olZOIi6pO7NWlflWCDC8+YrBVV16047OrsMljuXRgAJdzoisDqONfKHwBcttu+oEvz/T/BYD8lY+JKMYA5k3H6v+qmBNhnRTSu6M6sPl4owiQ0I8MjaiPwTJ3V/IPd5astlqqTwvnUZhtrlv7Pf5Rh1Qfo4/0Uz8Qyg0arMvaJ4B/jXqJWTL4ma6zRWz2PyDzLO7JCgYq6OoFLBuPyEClOQ2YxPQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PxLaRcAA7jPUePUjVcZHRz4rg+8XMJvOpwBOdZI7ZE=;
 b=gWZHAQpcIEmMGNkhwPA3yQRum7X8J1nYOvZfztprCz8DpJOE8yu/7WX1wY8SEraZ/qnT1trRH8Rlz8jPtnh8zUgMvkPzGmYNcZ/ZJZ95m1CbEzEMg6EgpKUjto0Wvy4THXdKHfVMXpm7sqf/lxtZtKrBH69SB2TPfmHDlOw4dcJPMkeowoPc8AW9rZztr0aqc9cr6FiKM5nkJ1UcLzw13nOQH+yodLhwI7DF5kPEk5XvUBmWu5vA6Wx1KGzydJOY8tD+gU1gChAM+FvbbyMaKR0WuZItp7tyBUPplmMjvtpD2rSXJhHyk+kfx6pEiABqPVYrSXfFlzwS0h/tqa0faw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 8 Sep
 2025 20:50:59 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 20:50:58 +0000
Date: Mon, 8 Sep 2025 16:50:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6sll: Use 'dma-names'
Message-ID: <aL9BrJvhlwhwS3yL@lizhi-Precision-Tower-5810>
References: <20250908164431.67052-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908164431.67052-1-festevam@gmail.com>
X-ClientProxiedBy: PH8P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 756b7c78-d024-4d96-0952-08ddef1969ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G2zE5Lxnin7Dxh+WysdktndYDFgPX8axOeIgD15vUNIm4A8CnBN3T4RSbqU4?=
 =?us-ascii?Q?mxY7QYboXiFAyVPCZd0R66QYQEg+lGUCAXs9wDdWP6lEVEkbO22TTpCPd97I?=
 =?us-ascii?Q?NBPoLakoI+ym5ZVoYyjp2KSG9Pj0CDNaimHL/Ma3LpcSsRa7G/JQeQCNUCim?=
 =?us-ascii?Q?8rYBR2GPjjc4SunbOkHXdZAy8dGzL+DSdi/F1k/l/H2l/m8wCZ8V4tz+i7xL?=
 =?us-ascii?Q?fBJoiYGvSFSIz7x6P/lkP3JSlPq/DEGX65BGSocAj2WCZJg5sHuFF9Y3jhLb?=
 =?us-ascii?Q?/zaU1pMxRY+nDP7PY8dNbr5X4vrdyw8TNA+dNEmMnR7Q0Tec7q0IJB6ETD0V?=
 =?us-ascii?Q?6CZ2w3AK7qeqHvfQ9LfR1YHCRMgqR04vyaUXKIWwJvRwBhhPsyBRwym+RSpD?=
 =?us-ascii?Q?359vNE5xj9fLTmjkxr1quzoSdYWQHkjeRQ1xThltPdRWDRy7G1mLd68ep5Gf?=
 =?us-ascii?Q?6lgI9PQ0xG19kSx/pPj57NKJ7h53FY4IX4q/lN7arhWH20XdFukmX0VL1vx7?=
 =?us-ascii?Q?H6JjxaW1oah56nQs8m7An88DOrFAJ9aDd5lh4eVoByYFt4+dA3JtsTvRZoEU?=
 =?us-ascii?Q?b7Qj7VYtSQJXLexvt7I2YUmd063NxZl1r/55AooNrorLsyAY+ZIyTeYxKy0w?=
 =?us-ascii?Q?WC/rZWkH87W9kyYAi011z3bTUM8y0Vg2LrSjCSpg7Sb7onE8vaqXpKETIEfc?=
 =?us-ascii?Q?JNZrGeBXiY8i+yUDwO3uNpKYWY6T+nLoMm++B7ki/6S2fagI9Tun8N69uEsj?=
 =?us-ascii?Q?Fwrm/FUtH+FHqPq+LGSxHK3T6jI74ZIWnmXBv/6vYOaRDhccr8tQrXokkIf7?=
 =?us-ascii?Q?GgZCKJsCbHmtGj/fDJiia9tc0zmq6eY4F5CcbhZCQLZO1o1VOhhlEgj0pBCe?=
 =?us-ascii?Q?+NGUCxPsu1qbV1XfCD9Xx9aezx9P7WBwLfQqKcAxivoy57YFj7fAQEfpkxkm?=
 =?us-ascii?Q?rb3JHDcqVIZiJY0quAhcbs4+xW052nmlBXF9R+8bAA2XJYlGn2g4+53yTny0?=
 =?us-ascii?Q?9FGFD54zeaFH6EWacVblAiP6pWLQm7tU397S3AASnsDWlA+DctX4aPyY//Cn?=
 =?us-ascii?Q?wUXEdU5oud46/JBnxb0mH3y8WVj5qbm9ZtR9w+WujT+bjMRBdtGeRWOdjne9?=
 =?us-ascii?Q?vQKmtagiWZ64+3aIwe8UuUXmIn48vJIjyW13X1ljEWBZqJRnkOoQhmgnN1Ea?=
 =?us-ascii?Q?dapkS08FHxpXJS299sEFgeYBdKoWyPgPWY+WUCL2lYNpW4S2qcal+oDk2sYV?=
 =?us-ascii?Q?appIshPzxjc6t9WMsAtQbtqKHPXToqt2Y7NA5WJJHtxPg2qYNVrBHQfg4n5k?=
 =?us-ascii?Q?hHlnpSgN5+g0L2lhm+kneTrvxwIWeEWKC7KKBz9XbXi5jOLacQ3WRpRkV9Jp?=
 =?us-ascii?Q?xpP3eGVBCgOLqt+zqQaCtNRqAaOyZAE8a9OUQAlzzoQMm208fVIYKXX61fKx?=
 =?us-ascii?Q?GJjV7EDlEwTywF/9nZKzo1U1tiN6L6Mn32h9Of8mYgEWVtjJFncjpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oM3k3lIpSFdMlVlN1pcFJYxq7M/V7MNXQb4dvaw58UdgPaOCMYYzCU3AWEZa?=
 =?us-ascii?Q?2a0XmPjdo2j47sKCvKR8UK/PiFSWcsnVtM1eaVr01Qq5kl3gEEdX1AIJ+K+W?=
 =?us-ascii?Q?Awkz675K/w/ddFaLjbKjzc0CPooaXzepO6pyA0CiNg12YakCuROpWcOHYfyh?=
 =?us-ascii?Q?Jc1A8LF2my9I/5tFPtKp0S1DBGCtp3eIsL3I7NthBzbIF5Ax+OEBSjrEKOwN?=
 =?us-ascii?Q?p0dwdYo+NJ9oVrImgJ075tSCIydkaz2HX52+KJg5L3RhttpmTgvtAmA0C11o?=
 =?us-ascii?Q?vZGLjpb8VA6OMN32+Mnzi1aWP73iHastbkZaz/0BfJeThZIhxo5SmAtQuTiG?=
 =?us-ascii?Q?6DpxwmaGimuzvWmWImPODMFiNAMyeZnFNYFHaqL/6ptrDbLKUgrnY6fPKTRZ?=
 =?us-ascii?Q?WEpPv9dfJ7DDRFbo/y4eN4QAvW0RSG84ao7EhpGEmoBpMajGj6LPgXzEM55b?=
 =?us-ascii?Q?Q421DRNoYyYelBm9rzYyyl7NMIqpD1gE5y+9pwc3phTmEdz8aCPpJyHPMLjf?=
 =?us-ascii?Q?kOzFlpow0p00Q/RiKEtpDIy3IqLLNof58KrPvFyD8GdgjHwVk+y0w3GAb30X?=
 =?us-ascii?Q?FQL+xnnxZcZYb5iWsUTADhVkessaqW55vcggWpi9jFqatERjgfyM2VFVkcPJ?=
 =?us-ascii?Q?etxeDGCzplDaZSLmtpOC/agFq2ivFvdfRPiaINKopIXASnXeTgEGocKB0VyK?=
 =?us-ascii?Q?tKrASpm8hX60IzKLS8wlXXwugQfH595mGQpscyahD39qSsIZafEzqD5CJn8v?=
 =?us-ascii?Q?QrTWMLOdeQTXwnw0jzFY7PQjrACb2DiSB/DXxXhKTtvULVIdgvCF8ps3juuW?=
 =?us-ascii?Q?ifYET3aOo/p1kLr/QHccfD84mmWLf4Xoxrer77Xf+p3xnzohObL4Hp0gouk0?=
 =?us-ascii?Q?jAfxs4ZIsof33nZXmP+l6p/Ibi858+s78a6g54QPFQC5J3wfq3Salfr6oUTM?=
 =?us-ascii?Q?rEl6X/WAVa1Y7hu85TPxkhxckSwSS8xwvyhmbDjO0J+ZCmL/NolyDo6v+ouE?=
 =?us-ascii?Q?KohAAen80XWYPqoayHbNrL8ek/14vY4Saf+OCGEApMdpEzlJb4pMt+9SeWA9?=
 =?us-ascii?Q?mXbp9+Xw6fXGb7ObxNc4urOHHUgXT2iLwf7TgNrSuL9X8cZwhKiIUWdr4aB8?=
 =?us-ascii?Q?gQ7ig4Y24eDRMsTYapqIM+iV29LTH3GtTryUtMTgMmTYKa0N/Gj5t2/iFSrw?=
 =?us-ascii?Q?ZrmQigpT3RR0YDylDY1LdBaUxA5ogmfOunhbrnXmBedAfzg6TVdDMXCHeocN?=
 =?us-ascii?Q?OSIQmgIiZJVyyfWJ9Ib/uG+lrNJzXRvkJPRi/Tdqy6jlsofGNyHc/DwkJ8Te?=
 =?us-ascii?Q?a2b8fRlP4oN9vhErU2TC+co7p7simyWKVAF/2XAl33NsNrGLe/R8eDDOUJke?=
 =?us-ascii?Q?z3Hm8woOhVYbWikHs+XCnyweHBO5qi2pYVFZuHpt2YVeGeOHweTIrnnsJRUd?=
 =?us-ascii?Q?P2NQpDAXAduhqGeZhrvURYRetk7rGDjdX0eH8HqG0esFGVmc1ExtEIoBEe3O?=
 =?us-ascii?Q?npJ1ysBp/6f83lSTcyko8T8VvGMLYVqarxqsYBdO8AK+b/MRygkzfSJ3jrvZ?=
 =?us-ascii?Q?Qn/+G7u4wj8lVUoHNcNmwkWA9KzmD02Z1G+CdhN3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756b7c78-d024-4d96-0952-08ddef1969ac
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:50:58.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V+DBmnaxsFdbVzSYu0Ffwdg602BdVxw9di0nztYOqSi9U3oxXfVMQ74KwXHQWviQ9/tZ6Yn+s0Cjeb3JaKcRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298

On Mon, Sep 08, 2025 at 01:44:31PM -0300, Fabio Estevam wrote:
> 'dma-name' is not a valid property and causes the following dt-schema
> warning:
>
> dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
>
> Fix it by using 'dma-names' instead.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> index 8c5ca4f9b87f..704870e8c10c 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
> @@ -309,7 +309,7 @@ uart3: serial@2034000 {
>  					reg = <0x02034000 0x4000>;
>  					interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
>  					dmas = <&sdma 29 4 0>, <&sdma 30 4 0>;
> -					dma-name = "rx", "tx";
> +					dma-names = "rx", "tx";
>  					clocks = <&clks IMX6SLL_CLK_UART3_IPG>,
>  						 <&clks IMX6SLL_CLK_UART3_SERIAL>;
>  					clock-names = "ipg", "per";
> --
> 2.34.1
>
