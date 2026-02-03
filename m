Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2B1A00F0
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770083466; cv=fail; b=DiJIDW67XU6hR6BhDsuUo3qXq916unesWUCM+DpXivNDKfATbLfR6/uSO7xRf2CFPclae9nR2oQTS4eTYYD01TmrBzKBdHvEaee20xoJqIAL4/qMeQhx+EiZ/U2HZiRXztp4rrnIKR3BT6xxZEEW1p6PsWSuufkZevY5d4LUvsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770083466; c=relaxed/simple;
	bh=imfLIlXhzapiYvAp+fcKom2XTUJlihWSagXjMnuqCMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fZSIMMvHSqzvcKk1CUkKBcEJkAVUYdFmDMOQwCRvLaJTBMbQAFzZuZ1NSyjCNXeGMaU7uQZjo4fT3Hy/ASr6T+A3q07nn3nb4UI34XY0Idl2aJn2WUqgf25hDfiH3SMkFxUA7RbmpUjM3hSgC1T5R1lVPHcme0ZMgvwQVcrwwCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tao1Lce9; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tao1Lce9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbHppx6Isc1Zd60794kASXO3okyJbzqlY4YS5RHz2mjo9H074WpQO9OPm6iIi63SXfuukSmlDrdfuLBGQpCZLKSL1c5DDLjxtmVNtBseWY+GNfq67diOkD66pCSIJyym9zVSpR7p8QkLx9rjKZaRWGIisScdzbITE74RpgvsWaGjgg+TA8bQb5nfXeLrCCZ2F6SxHhFxMr1mwHZk362QlDMMILQRx4/hlnOTEqjTz+3KkC0HN/ySSPorA8epWnJwG6RQGySWorzdWU6Eky36DflWJMloCUJEoup9FQdu6MnwQMY/rHMZGrfxF6ugg9vjPzBDL+/xqopSF8Q4/ZZopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i71PXuWHJx9H5ZEiiFAQtK4cjMHvGGv7qZVPFty6hhw=;
 b=FKNX2H2OGcUY5/itJs+7WeYJWAFslJU8Z/qGma6yoz//87rApY+bRd4fypjBFB5nYbc7UqUetQo3ojdLGFVsrdL6v7xxhgW3m1YuE7PnVK9N2b1j8TdaUuGcnl5NAAuiBXZ25ceiv6EEfLMK6pYaaFH2lGzgvMv6bCFVPYG6dSPSNsrHlg06Ik/um8qvT+x2hd7DY+kBTeN994tt265NZtiMy51p3HyhXJbbQft2LtGaVXu4ITwtW+7fxaXxLtjUQ+f4RU15SDPlQBMw9ucZU7GVHuPgJIF7574tn00uqZohCbOcLP9WOejS6/dUuT5SmGnMQIJ0dY6PYK3mzV4Qwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i71PXuWHJx9H5ZEiiFAQtK4cjMHvGGv7qZVPFty6hhw=;
 b=Tao1Lce9vlF1/1WpWAu2skf9/AMjwm0dwxll+iSlJ9TSTWjI6Y/mCI1KSe0fdWNq/a8+7C+cBc2qsRESKk2rw061krh1rOOLIxZjFf+0/jmq3PfMZ1MEkaNfl3futgOh4cWVef2gthajcCBuqAX9ODTccH3gQDLTzy64ChqPZ1T3Ewi6eWqz00ZoEkVcKNOkBMqWlpGGjm+/aR3EXZxm/XX6ZnjKDAfQ1S0rwL4g1uI18bDgm6v5krRACXcI21DvF/A40GwW5Mj3VHlbR850edJ9e2qV3FlTXzRubfI1Zj+xi7sbkbF3VXpOXF8o0J40XBlIO+RZWXi3nak/h2CRKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 01:51:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 01:51:00 +0000
Date: Tue, 3 Feb 2026 09:52:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] ARM: dts: imx7ulp: remove #clock-cells from
 clock-controller@40410000
Message-ID: <aYFU5w1LpxoUiQH/@shlinux89>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
 <20260202-imx31_dts_warning-v1-8-434dd2643c3b@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-imx31_dts_warning-v1-8-434dd2643c3b@nxp.com>
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e93b972-4824-4b08-2d0f-08de62c6ae78
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mbRouJGH6kxaL494pRCwxTxubWrur+oeCGEWMNZLsAL3llnNv4b9PhGOEWOx?=
 =?us-ascii?Q?jBbnaSHbISXsXk7sLnZB9ejzMR8GHJ6xEWp/0XUVRflcXLCxBOS63QHMt1R7?=
 =?us-ascii?Q?r3xyqosxZK+N+2ooY5W3QEMiUw6hl2DRqM2B/ah6xVosPJASbYHCB5filvfF?=
 =?us-ascii?Q?kkyanavQwgrzjiuHRXQbUnYc/5uWAETZRUr5AyxtkwAAYFIoHB8N/qCABWCn?=
 =?us-ascii?Q?M9+nCiEmRP0UoqF8Dv8uA0zq6RydMgJzf3WAksF3Jt1+ogFiwkA5Ah/Dc7oX?=
 =?us-ascii?Q?QVBey5WeTa3JrtaFP4wi/au88Y+MCorjBVG1xEdrK9cyMwV/HEXxgEO/x6zC?=
 =?us-ascii?Q?5g7b3KEGMN2Kc8FJesxV0eFCVlv1UfxfVEhvwFpHQTDa/CwxVKGixYFmBzf0?=
 =?us-ascii?Q?YsKQEG1/yIJp7dZBS8bK0RGAbwu9XiZJt73w48LsOLz17TrJ9uh5Qs/IizUV?=
 =?us-ascii?Q?R5ZT/C/41oOY5uzOvCCYdYDIf8HEn1jpSlRP2c7N+xbwzhzA3M9vrM/aCLwH?=
 =?us-ascii?Q?lKEX+XXy5aEOXbIBPVol+mDN3pMt3WbuHG5lkxGh+BK6D//88fxfGECL3ax5?=
 =?us-ascii?Q?yVf2qu6qiQ9mVjB36lj6JsjxnWdCyVE6ZJ7KXBILW0mwckqQBWRGMt99HYmj?=
 =?us-ascii?Q?CEk3ej1fyu6o/WMjscNybg5Nxxfqw3znwx/VvVYOPtlYTOcHsA2/2kUFjac+?=
 =?us-ascii?Q?h6Wg53Zc8z68vARcPejTP+to8Axix3jczhYbqgkD4r/ztXSTXaF3QykFz8GN?=
 =?us-ascii?Q?lsNEbEYjGMZ1mQhm6Mdy+T1PTaRo7EQdYw88rY8OidJCcHGmdF9dKq0YwHh7?=
 =?us-ascii?Q?EHsKxgCNt40jWgDruF7jtBnAEQbUWTs3rR1Za91HHaLPmyWAWvBsmp95aefo?=
 =?us-ascii?Q?XFdQ4NgOmrPT5VSqsu1tDxb2thQXQDDxc0y1vPQY0ZAzCl3jz5yomE3u2Ze4?=
 =?us-ascii?Q?C7rG9vrMIUryXk+cyTKJ8EbS1+WX/uKQXHbV6GJKDjqgIUbWLLrKhehHJQ/5?=
 =?us-ascii?Q?fFtfvtgdiKUjE2B2BcgusZtxulpxGJ9IE+MT3TRblSoWQ6sNJyyd13yEm3tB?=
 =?us-ascii?Q?9gxsSY4ByrZjqDG+fhm5Ev5t/ulXG60+mPRarLmFXntl/PXCHQO+QPCzaTS8?=
 =?us-ascii?Q?KiolY7MLE/KiaKWNOc8cZf+YriEeYFH3uHHNoI116kpye2qUa4cFR3vPFD+/?=
 =?us-ascii?Q?wJ9NKv5Sg7dumkqlj5Kot+d1uo/jKtM+uH/7OwhGrAYi0hQrnLy64l90e7nY?=
 =?us-ascii?Q?LLqcRQZBqOujQfYsy3ad6wfPDjeB5lckexvkKc1EswsudfWiR8sn0a60yB5d?=
 =?us-ascii?Q?7EowJveZFBokJdZVHil+XaLgLmDKvCNG1lzTAa6T/27nTkpDF4tTRIQ0NGRa?=
 =?us-ascii?Q?BGdRc+ngfdppEe5KZG2pC8HGrc4JF3C/OLpnvEPxqtzjMsznFj6x4MTSkv3l?=
 =?us-ascii?Q?lFOmiygwhGkrmTVS9aZZyyxjO9TZSJ6Iqb4qF0ITXsLjTQIGH/ZnRkIPn+7T?=
 =?us-ascii?Q?Xb1yZPfvpO72YIepyQQP5kZAja8V96LDbtE0RqLx6zb5abZvVzHcsIBpw7XX?=
 =?us-ascii?Q?h+598bpUa/TN1aX2eO67IFU14QNny4rf9NrVUPhH3gbULMPMHH0Z5+J5soK7?=
 =?us-ascii?Q?gnX19PtcH6svf0jZ4+JhIgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZoE6mDpGJBVfEUqZovZE9QmLKcslgm0o2RD+3vcyhL2fAmK2nSo/HFE5D0UD?=
 =?us-ascii?Q?rz42F4ZVUYhldtGEdf1BDluKBvFArU/7EZVJQvQXPTgZDNdimWhfnXT5joVO?=
 =?us-ascii?Q?CSn9DSoGBqaEQiOynZtS+8U+E7Q53+z4R/2AVBq2+DUsWDzL74GuRpx5LONz?=
 =?us-ascii?Q?pbOL0r5S1l4MUgZR0kvCNrBC7FKktSV2Oak44TLbyemTnWzQGbrvlcb04fvZ?=
 =?us-ascii?Q?6JZumhvurNzcSc90SAxZhmZgvVSRcBOMhAxKuWTDu38pZUSeu0JQExaKtR+E?=
 =?us-ascii?Q?4AmDBaVTXWvhPYzqVhq2oleCtczfpTlash/eEiQ8e4c6O0k3vBMvxF7cBOR8?=
 =?us-ascii?Q?1mqrWKGRUAkab+AwLRdKwBfWmKz9D/02XDurZVaQC4BTRVHlzrhN1ugOHdcJ?=
 =?us-ascii?Q?ZxIlHytVK04ds+FOYoUWHnr5qLIhudt/m0RRlYAY8vhHqfkGa69j0NDomCgS?=
 =?us-ascii?Q?gfbBbQ84QYDNnzjp0VdOvwBJ72ICxa60s33ABsoYkIjvo1HtJ79Uwg5ZkQKs?=
 =?us-ascii?Q?9Dz4QOmnEl6DztD06LnednZfxLWvSCy4x91sGJw72TLuepvntl6P0N1zFRRX?=
 =?us-ascii?Q?azMARDzJb1XBkkWuHBxQxy/UzBHsv+1H4yQtF7b5LzawkNE67+XvAu265wzf?=
 =?us-ascii?Q?wFGakDSWQ3TQfWv2gD0qlfW2ls9x1FNI8TTir002msdVg7KSnNL+vqRLbZzW?=
 =?us-ascii?Q?2h6h6a+j8vHHOZ2bKSYNF/PXXUOJTm2mUuX5Kd0QyQbvh5zZ1jQzu0+J/8qe?=
 =?us-ascii?Q?hBxnW9xcaItl1v5mPlOvgN4CGGFjgP+y4eh9WHAs0YQSUNblFGThxk4ExPPl?=
 =?us-ascii?Q?ma0zqTdyC7k1HM/iqBPaXKBpdzvv8sdwxnHsp6ZAT7/UtyxMvSOGLifPejYq?=
 =?us-ascii?Q?+woKFf+uqSjjZ6+Oy4s+S3aUQn+c4bf21rOGW6XSDjyg0ELd0QmarKXfuuD4?=
 =?us-ascii?Q?o1ZCzHktz3zoqHsvD7PN038P1Y8IvlZwtJNesGtVYQBjFOsEQpST/eTA3MaI?=
 =?us-ascii?Q?sfo/rAsYddSvZ52oN/qcS72b/fD5eTBgg988GT2sjW+IwiAIow7ZlVRSq7ol?=
 =?us-ascii?Q?JoPkmIjXFNni2kPgqpAq676VOCLn4g6mT3B7AZ/NtNXrahekMFfdlguBtpAM?=
 =?us-ascii?Q?CJBmezi959Q13QdMGN943uyJJ6y8lHEL7zAPWTKrvMcAzT3IKKZoEwZjMFT6?=
 =?us-ascii?Q?8lu9NkpOpLhMqwKJAhduOQ64X2Wt9NkSQk9pzE2mW64XHeo7BaIg9a07zpXh?=
 =?us-ascii?Q?nbKd/Zwt6qDOBFZa/PlN97adWm/aaoN44YG/CQv0RT3S8ptbCITykEuh8TjJ?=
 =?us-ascii?Q?8DfkpAp0GaixaG0rpwbxd1NNZaBCL0/AcV6YOcmPDXmNX0uKN08lRcsrZPJR?=
 =?us-ascii?Q?bbIe+GFn64RIz0pBup0rTsRywIkNgdUemCWZk4ALzIH+mdshvVJDt8ALl57I?=
 =?us-ascii?Q?JIOnFF49OnXbsyggptqbaqLuCUxf4POIymlnhUOnTISXYBu+C1AOnRhAy+d2?=
 =?us-ascii?Q?UutS0tVdgaimC5cQuRWOr+9ICLXyr3mAAx4YgZK6YKhbJ19tr+uNY8iIZoLf?=
 =?us-ascii?Q?dYpgTIDG/tAp3WtBBjzqC+w5aBmTH9rqjYP8SOTBxjzPYEMD9i125iNktyRb?=
 =?us-ascii?Q?vZe7A8wWLSkLZnVAUzw5R03Np6s5z+aaco3OIOtPZMCjDx4QfwRdRVql/FO1?=
 =?us-ascii?Q?wmBl0vneyCSAX+fjAGrEZXyPgOpzrLbiVyQsNEkox4KrLoo0mnYL4NkAdChE?=
 =?us-ascii?Q?umOBQWxeEQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e93b972-4824-4b08-2d0f-08de62c6ae78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:51:00.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxjXskys3dFpw5zCspn8mQJGuju4XkLwyOy+wEcZepwS5IGfuHhvR/zOpSWM2p+860hOz3b5ut6wnfwNcNQRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722

On Mon, Feb 02, 2026 at 02:43:25PM -0500, Frank Li wrote:
>According to the fsl,imx7ulp-pm.yaml binding, clock-controller@40410000 is
>not a clock provider. Remove the #clock-cells property to fix the following
>CHECK_DTBS warning:
>  clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>
>---
> arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
>index 880b9a4f32b0846a773dbf9ad30715c84ac2fda6..6d8853d36d930aabb98fb57f49d6153ca6597561 100644
>--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
>+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
>@@ -291,7 +291,6 @@ pcc2: clock-controller@403f0000 {
> 		smc1: clock-controller@40410000 {
> 			compatible = "fsl,imx7ulp-smc1";
> 			reg = <0x40410000 0x1000>;
>-			#clock-cells = <1>;

Need to fix binding, this is a clock controller and needs #clock-cells to work
properly.

There is a driver for this compatible:
drivers/clk/imx/clk-imx7ulp.c

Regards,
Peng

> 			clocks = <&scg1 IMX7ULP_CLK_CORE_DIV>,
> 				 <&scg1 IMX7ULP_CLK_HSRUN_CORE_DIV>;
> 			clock-names = "divcore", "hsrun_divcore";
>
>-- 
>2.34.1
>
