Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2070.outbound.protection.outlook.com [40.107.247.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34221A3142
	for <imx@lists.linux.dev>; Mon, 19 May 2025 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685914; cv=fail; b=LtHJ/U7C8b+jXjA731HJMOSmVXr01lJ7PwL3ROQ5x1q4b79pH6TBDXnmM15cX6vSHggg9G2RwNDbHIRoV+Bx4T4mnpQ2Hp4IjRGmK1DNVR/MeV9TC6cTdTkBaupb2/aaUrllzTlbASQU8JET35cKbDlc1hysvK+HqKzZxdp4Iuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685914; c=relaxed/simple;
	bh=CC1sXrZ8Oo1SO7kNAokdNlRDPLLlPw+HzP1VYqI1kuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JMW2SWQze+KjEHATCPuqRtsSxrwbsVLBWQQIERIiWsFTPMps+YJ6oAThQRO+xYZ9vw/K6ZyzCu8FGpHizwi2aM6EnZkSQmUinZBxe5EKNKeq1O2YbiIeuP0wuDrjU82aWCwwXb47fN3JEN/AtrZIAcn8PJhxa6W9CpTl8zedx0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jRfRnum4; arc=fail smtp.client-ip=40.107.247.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jRfRnum4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGMiJXsnLNBsPVOCSc2sf/ySVvNFOyWo6uxj8I+pLnSZhnfNUEk25ajSRJ0Vvw0WVxER4/1rP6sbhzXnDCsqGyAAoGF5RDhoWXlEdbyIQi49bQubxfspZ976FvqK98oZHlzyDVHMjiw2iszjqqFtu2vMv/Ogrdpdu6QKIKvX2GFl0f5u/yVuJwzR5W3n3szPwEbrpEiGPEMOtEBeq0IZYBrfm2vO17Rr6143LBCQtZ+EYqb4pcCt2tsPor1+nrdGvnPcwZjKlsp1IRTIzfjcxdgKa57CN+CtzseZ6xq8kykEu3dkkNkHH9UiEtmr1AJpv6tFYT+dpoo6631rLj8SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nU2lwmqmoD2inr9G3Hf+VMPgXUvGcUcBUtQfqmheN0=;
 b=oaG7uLnBt69GVyPKBDxWhyNNZ4SSdcGkz/caxZGo4VdL5MHf/aLEs8UaBDGOomNih9LaZ1oUT6ghVE3EvdG8EwybiCmtA7ZlwUIJqbtBKwZRYBzGNwqdrO+Kg5ZO1HBIotOccBejy7nH1hjNsbwJph1S7NK7vDWN/EU/fupNMzNu9wQ6PZn4oOoXsoxj5L6kbYScr6bKWIn/lhffe3Ba3hOnVStAVvSwU7TtMpva7iMSJPeLQsKGxwYag4eCqxbB5p87J5lHUCTPpIQputp4CsMGu4NWDonNqUAI//7rEp+eLEq7lAjlsnUQqiH8YXClAqu5cx3Y89cDcyL4mB7WuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nU2lwmqmoD2inr9G3Hf+VMPgXUvGcUcBUtQfqmheN0=;
 b=jRfRnum4kW5qmeIPNt983QSy9yFw6gbXlIj1sob8JnvQAHXKNefJxPy3YsPZMkr3Ksnp5jP4mQi1nxF9rkfd4PVnnDmzv4jb3n0GOnJZ7oLDqw6o5NkQ8H8BQQtg4sQglYHsnreK5o1HQiJVDY7NhgxV9VdJiQuy5UPIEpV7vCaZT0joJJwiapznS19sypFvvREnCbBwAipwc/bCdmo897IWjCq4uxmhXICiKcrdS9Gr6s8Yus0DC88YxMNGZzh4baM7bWjbs5JympVZY41WyyOnG+89HLPDURd4A+IbtBtB9CW6r34o9MAQL9yqp6VrR+Sm40yp8SF1SlNV880Iyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 20:18:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:18:29 +0000
Date: Mon, 19 May 2025 16:18:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	swboyd@chromium.org, heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 4/4] extcon: ptn5150: Support USB role switch via
 connector fwnode
Message-ID: <aCuSDGakwTLk2cwF@lizhi-Precision-Tower-5810>
References: <20250509064526.3767729-1-xu.yang_2@nxp.com>
 <20250509064526.3767729-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509064526.3767729-4-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d81c06-60e8-4354-e3b9-08dd97125166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6c4THsP26zheGh3ZADxWoJZGKLns/ZTwisMK/YrmPEWkhieTsgcNI0YYtvu?=
 =?us-ascii?Q?9CEXEuglALomQdX6gJLC7IzCC69MNVl434mbhoLuvzCoFv+wbKl1MTyYcj6h?=
 =?us-ascii?Q?Ycs8NTcF2N9xFPwy3HnSoFz5rDSmrhD3LjpWOt2gcBrj7svSWeX+EcB/OJW2?=
 =?us-ascii?Q?7L0tR9zxb6L91FsxCiMCGv1ZEU1v5YONgM+WjFSsKGlxDjCSa/AwDi7yhTCB?=
 =?us-ascii?Q?Y2zM/BHGveNSExXMQ6kI4irgCxUQccFnp90M6scrKo6SAEer+u8/8onCN8uM?=
 =?us-ascii?Q?HMThIg8LMjoRcXEDDHPvP76Fbk/nXdMEXjeGUkB6wiusoHonjdoWc/wKRb6C?=
 =?us-ascii?Q?5hWV3c2eOb60fcOQbswZx4CzN46EIWsXrbvURCR/fe/gyo9xT7YusC0421se?=
 =?us-ascii?Q?5riUbGuHX+pO0d3Bh7R2uAk/yiAhSrGGK21thYsY39pyaKlxhbbrR/zBmJG+?=
 =?us-ascii?Q?R6VgbeyyfMUuKjRAfav4XOMRgmLc2vrJNybr3fW+3FLBH1DBR4OYjoqH4f8A?=
 =?us-ascii?Q?WlMZEb68qVa9dRiQMxLKPbWpXfSqA0bqI2dozuuzwtY8V6ONljB2OJq9Y538?=
 =?us-ascii?Q?cB36wV1yeFtDdwahsprFpcdnojNMuH6uCg9Ni04Gzcxi9eFd/GWMuhdQMpnO?=
 =?us-ascii?Q?sAI15cIi5BePV+XDBWOdL0fgaNJ5Pcmo7KK0ly8sGPpRgN/iuOYeBeFYLW1p?=
 =?us-ascii?Q?TIue61Rkh7JAvFY6ZpRt6pFfn/1DrRXPBCZj5BbL1RgMHHt8uZLNOnh0/chq?=
 =?us-ascii?Q?kW/wo1L7KnMLyQsVPc4iORKYnzojmankb396Bdravb8khZ0TLXx0TXckzCMw?=
 =?us-ascii?Q?O9jt/c077yElH91s4bFIEHWP9mZKsOwxhFJmG10evBVmORQxqft2IxvCq7xb?=
 =?us-ascii?Q?VT+9RsR+KPHHeJj2ICSX0V1j5g9uvTZZoCFA1vrnabgy1/S0+WyW6W7Ubqhv?=
 =?us-ascii?Q?s2/B7rudocct6Q9Jcy/g/lU+wLSbyz7YK7V6XV4kVjSkiKqPQwKcsvNtzV4o?=
 =?us-ascii?Q?B8X1uUbv8nkPSamD7xwz1mKy7ZW+RKFi1naKhcC/YP4wbuh6OK8tjQj3Lt4l?=
 =?us-ascii?Q?7ccY+9p+SpljFyzW3AcAuDbtWXB4PD8DpAfjCav98CajHelAMUHlcNeiR5f8?=
 =?us-ascii?Q?GCybWNyOQpf+++7gJqrBIv1ZNYMf+yTkqxsiDPzTeH6lTd3QEDJvXzemwgbb?=
 =?us-ascii?Q?rAAkPwldhtm75JmNbCDqTR3T/zwD3V2fGkml4PqP/zhVKuU+SHFQXWN8s/t2?=
 =?us-ascii?Q?/zdt3G4+gnUsX+LxSUW6OnrcW9DCEJ3BTseomC5sRXe5l9fu5G0DWCO71Wxo?=
 =?us-ascii?Q?M5hvpeEvS8wFBx33aa8tRviejicvg8H+eVh9rui2jsktEjVp/NYyXZrudz10?=
 =?us-ascii?Q?qjk4Rn8Kp7NNrFXPe1YkG8gDai/gYoxw8Ol6OP8WGo22ECL1fu8stqO0HTnf?=
 =?us-ascii?Q?f9OPBgtqefsh2q6eIFreW+0E7GKdP6IzmtGuw+1Nuuzxg5nvMPgGvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dKcCgIk1T3+uKXlHztt2oJgiKKXT65Gs/ZZ06fAfBD9AYIquEZZORQkU1JUp?=
 =?us-ascii?Q?DZPVIlEl/9h+RpJTkclT6xk9aOHM2ZHHA4n4Jr7J+hP9RGsrY4D7y+izf6ki?=
 =?us-ascii?Q?KyMzyxl3RsC8k6SM/E4n3MWABeplqpDPKnqVI/bTbjsztHfhy02nWS3az+18?=
 =?us-ascii?Q?FYBaGayUSF58elFNcBr1NEaeU7GPgaKSKRUE/feBVk3TUbTYo5nP0hctDtOR?=
 =?us-ascii?Q?enj4AM4OeRZLPkDiFp35IAjq4Na4yso5b7lw/xH3jl7IzmYHD8lCxCdenfOR?=
 =?us-ascii?Q?4xLthqxpnlce5yGSX2wu9TjleYlgZ73J8C5ETmgmCZ/5oeeyYnFYex0uACJ6?=
 =?us-ascii?Q?/QjxIS4ywf7I9HGrabEOy3R/v/0fW/Mpczo1MpWUWxneeB6WAJZ65OWboLyN?=
 =?us-ascii?Q?I4tmATHU3sGl8hgUd4jfLk83wHjxnmCkR8lPw39OOEPoWdtSV0GYG3+SP3mU?=
 =?us-ascii?Q?PRIo2MCtjh3UIxExKqdJ6jK23GtVMDNp4j7Fi7iOfXEwssqJYv/mF7U7g4lY?=
 =?us-ascii?Q?DmM7fmaHE4VlRQnjkV0f9AP/F3mjTEdlK3ojC8Ps1jZU2+L4jJhyY3+sl9c4?=
 =?us-ascii?Q?wyQEn6oT2YmDfkurBo3Nw4dxLkSGluw7K+bdf84Ku+pQiSalkinwBqqXk+ul?=
 =?us-ascii?Q?P56xooqdOS64u/Rnn2mUOmujE6Eim0RkPYcQDh398DVHqXj0JY0ZS6XceAnG?=
 =?us-ascii?Q?oyZbKNGx4xVAcfu1iQjKiGCGebU23c21K0FDI5MPZTSm1NzxZOIPuXtlYEBE?=
 =?us-ascii?Q?+zT1hreDl1CFeK5c9+h7latDQFaa+J8SSLJXorL7VjVlcIrsof2QmrqNg23i?=
 =?us-ascii?Q?z/q+ZWHr98qJTur7ELvkSS+uY1ebU1ARq1k2hosfP+cTyEPO3wVtATGbk9G7?=
 =?us-ascii?Q?rxkFjMvv+j9HKGqJTSpTk+UWD62PZMutQtB2j42hV60gVZoXS2n8+40xkcpA?=
 =?us-ascii?Q?SH5+cLZQQhRlzRowGqba7ivgWeINKespyk/UCjUMq41szxHmGG1982Tx4nZg?=
 =?us-ascii?Q?iAwrUNowb4UGC6wZDfHeobAGFqyBG638ugy6veDR1oyZbQLvDc8+K2kvxrwk?=
 =?us-ascii?Q?3l5JqIieme0coL+dlszTUImxoQY/2WpTGH3rB9fs4KAMPu/l1wZaSr2/g3xu?=
 =?us-ascii?Q?GctSHHysyVfSDPO8/CwDGj8Gx/7ygi5U6YOmR37yAG00sCdysBoWkoTEZhzP?=
 =?us-ascii?Q?LxBMBQv5vbZs/10muRKgEFdP3rpzQ6vcnfNEkGbvcZ8VgoX1FsmLJfJTw3df?=
 =?us-ascii?Q?D2yVj3IzAT9Ti5ny7vc9Yy7CDOgP+EbcBomsWIb+fWhlEl6nqn8iYTRO1XQ4?=
 =?us-ascii?Q?5XdYGECWZ4Ol7tfkFOjKKr9wSUG5gTAv6lSocDK/xVroRgNutMYtDgSZS4oM?=
 =?us-ascii?Q?c3mq54KU8dwCcPNgHslNjttQ1H2O0TPkwreuQh9+eIEvKZe78XTiGDIIBqTl?=
 =?us-ascii?Q?JLBru8NhOJTE06/kH6OhuIoe4zwf5GhN4T72OUBI+qxbiGvU1dEGz8215xOR?=
 =?us-ascii?Q?faq/HdjUOETA+G+asP8uIjgU/DeTU9YweFbXvn/D0ZgEYP4asX/GZvGmDIsq?=
 =?us-ascii?Q?z9Knu79PVOI6HW2sFP+vjw614DXpavkUQwhA4xm3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d81c06-60e8-4354-e3b9-08dd97125166
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:18:28.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzKjJDudZJYZhfDGWlG/bzCpotZ/cMVon2Xz/FMf7ITq5vtHI8XvKwSP7sk7hf6o90llq3dsmgyhlpB+MQgddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761

On Fri, May 09, 2025 at 02:45:26PM +0800, Xu Yang wrote:
> Since the PTN5150 is a Type-C chip, it's common to describe related
> properties under the connector node. To align with this, the port
> node will be located under the connector node in the future.
>
> To support this layout, retrieve the USB role switch using the
> connector's fwnode. For compatibility with existing device trees,
> keep the usb_role_switch_get() function.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v3:
>  - no changes
> Changes in v2:
>  - improve commit message
> ---
>  drivers/extcon/extcon-ptn5150.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index 768428d306ce..f33f80e103c2 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  	}
>
>  	info->role_sw = usb_role_switch_get(info->dev);
> +	if (!info->role_sw && connector)
> +		info->role_sw = fwnode_usb_role_switch_get(connector);
>  	if (IS_ERR(info->role_sw))
>  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
>  				     "failed to get role switch\n");
> --
> 2.34.1
>
