Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BE2D9EFF
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878857; cv=fail; b=KNJhEhNONKlfy9TL45Izg33S8NjHZcRgeja5tnPYE4Ok1DAkS5tQ9vzAfg6kYOujugSY4rSLt8wSgserPOiGvGmdh404wtKUSa8lbcKptJQwhg78k28ahJQL/xnQX1djYjF0mJylzHinlbLrZ32QAi4EW7W7jrPyAYQFnw9dqXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878857; c=relaxed/simple;
	bh=pOyTwDI+3DpIMndQYEcuD5DsYVslmnU4eDkt7V0j7hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W+zqP1w5kXIo1Ox27K+iY//Pevte/9LJFpJc7c5mtUpdBbt6g8VuX7JcrM4E7qbtYBFNtNr3GFpSIRAFXKMDpYXtRxVQznKCxhnD8X3fJpxnAM35jADOHSjsS+3u8OsTyRMXNiIb01BUwyqSblGxhfMY8suNM2xeeBd/Ai+wIzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dwYt4C1p; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dwYt4C1p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THsDmCYTRLgHKy4aouIDqW7bzmWI/E2NfKwBXkzBPuqK5V8gPpsB/u58bPQWNLpe6J/XCgzy4bqQb/mVyBACJryYJlTcaUCobzKlvQ0dyT2E9N00FmN+yyXMleOBkN+Zk+MqvS2alASFQWUXvsa2aTnQxEKUf6U192/6w6tipP8XgM8u73x406xl+GIEu19I2gTA/DXLXuu6ZJKlb8jjZRunkXWxpJhI4sAdN+ABcvkb7x1OyZF7os7X6rhfWXw2EQK0jOwY/U0OsS5303TSz4bSEdddNkuJ8KysVwBRJnP7o4Bz5+wZSm39Sapx/DfvBXOXxdBmYxyWsYBS5dJsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yav20qmzpeHHx75MlYOhiPBGRPjfQ1kbgKpmZEQP7g=;
 b=uBjTH15XB5L5YKp4gOl09sGGjKnH2ziJrkJG9Iu2Er8+2zTJgjjqzc8WRV/ZO8tC+zK8lOsKFc2b+K9wdWMQcH+MQOB6G8LjEn49bSHpf8IGP9flQrQA6ykrtm2IsRWd1xl1d93pzwO6shtuU7VRQ77iPcIPlq+HaShoFzJ4aHi8HKP/s9Pb1sIFkEBOYaMcXY3cqt7Og8rQdh6t4an3XhF+1L9m7//3WIcFFvHrY/1Zl2SzyX2HXhT7sSJqC0HNQ2dJHn/h57whCE9M3JoxkdZ3cY1D4rFzq2BKFxl1xTmPn9ZbVZYc7ackVVB6HEGI3v+nkWAxwerCZVvPZ1tSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yav20qmzpeHHx75MlYOhiPBGRPjfQ1kbgKpmZEQP7g=;
 b=dwYt4C1pNcCpr9HH+FVh5QH4llOGvkykCAlssOslHSmJKtJSAyB++cfddusj/8qPWXbBs+da+40cE5ihnFlA1KmqSXsODwwG1RNvOPZjgyPHNTOw4D9jZlBroFgp7L5RJIzI1DlhR8z0NtFjz/HKxeQi1/WaM1XeQKIgiI7INKtnWFDPsZ0cMKgfKZmkB+hfGFhf4gZZ/lme2yUL5TIrdbyUGmu9oIUrQkCuJXb/cTHOFlhWnzIMhtBimD+EJ7WA2tPRzWtDUvIm6kRxLk8jp4Lj0qP3VpbFfTZFNpxIWGVgGfKZ8FWxiUdVugHaq7YYWpjPyzHLNgj8EcsneE2WTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7211.eurprd04.prod.outlook.com (2603:10a6:102:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:20:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:20:52 +0000
Date: Fri, 19 Jun 2026 09:20:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: robby.cai@oss.nxp.com
Cc: p.zabel@pengutronix.de, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, krzk+dt@kernel.org, andrew.smirnov@gmail.com,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Subject: Re: [PATCH v3 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
Message-ID: <ajVQO0nbZdpn6xE1@SMW015318>
References: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:806:27::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 800d987a-2487-4333-909d-08dece0df7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xXQBLFQIs6USrKSwRjryvIbdfvZvQ54WgfobPS/U+q/bhguS9sbGXvS1Vv/WMmy2q5We4sAHo2n3xeX/SINvlUNov+yy+OHD/KuDE9OnRm/SA1Eop4YuEi9eJKLycIfA7zgahzCSFRyyOdcu10W7LQgbymy+0Is0iRfiowKFQQFwSpCcwO8is+uS3wSgpyeqRstgT9lcnCGixyfc2bP2wWHyQaw0t2kHx7fIXxddaa4fW4P9xPzRV7jkO9YFvB9uB4PPaEmek4PtEgXFVo2U6g/K9iz7nJccCio9kddC2pYjS66Eromc5TfToyTCKhwuYpKT8O3HgMwoywT3qsj6Q6pc/rY4X9jNI6V9kiocOp915bq/Ixd6dggW7gHo2CeeKE8pzT2h6sL7YXZTQVZfm+JtFRmbFg68W6dzG9kZWLR68UBuSRHtsIyEFoKGa3OrDIAn6mgEpczOVsA2QrIyU76C+0z5c5ke9eB2QQyyHBrnEtmdtnx8prmS2Lupp2RbampDZoLa/owb2HUoMC6d9lJNTN9bjsvoIfbRDv1JRc2L9b1uu+92KO9yIV3TDn3pB4+psvMP8ck1XJgSwLe+rCnkok34/qeX4QV/ZTX+vB4/aCs2dHXJK9xbXbdCUhoyJjsAEuaTlQmBcD1bf663rbSbU5DL86NIg6DiiI03Hck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZ99BPLwDF0xbGmZJ2ky+MM9LOdmT1Xr7DTZUaxqZWb8iFQ6gAY53uLmTzQZ?=
 =?us-ascii?Q?MIpyepbEX8ROjZhtzCrZJWxSkdEvIjQgi/mggcjW9f+svDOWzykYX8P//R6r?=
 =?us-ascii?Q?q691HCkKRnOCUrNa5ewCCpjyR82EmUF5JA+e27T4OIsxetJQezXsGYpKJsKd?=
 =?us-ascii?Q?s9lw3C897106NtOiKHe5K5Tbgx73DUzSCwbdmEK0UUckiv80OjjZLXVz4Crv?=
 =?us-ascii?Q?I0XIZ8Gk2OqB5IbyJU01rXSG25fhdje3Olc7GPZwj9cVGUBRJORPtbVHn6XF?=
 =?us-ascii?Q?uo8ccvNsNuQPKQzib8KXoZ7umGt07L27p23CuszWrZ0AeUOOz7gPiol0y+S+?=
 =?us-ascii?Q?0jKDip6nRdxZsG+w9tE9GeQ+nvTY0EOxugB6GUaGh4duk5p/cuEfZWFjswFY?=
 =?us-ascii?Q?3YOpRBYKKkKGUR/5VjrXEacen02hTypCD5Hmxfdvpo8LkUjpQLD8j5hVeCBD?=
 =?us-ascii?Q?Kd00ie14YqI/cfXMs6nNYEfWa3SmrELt4xic0tjmXDzT3IqvbwVGZAm4Rfbn?=
 =?us-ascii?Q?KWo9r/4eqqFIgfYFOQ7agIPLjXrhdL8/gOU1WEKK3yFHY++jwDi+OXRtyMMn?=
 =?us-ascii?Q?rtszSkHS/wRzw/+Zy+xK8k843hnczQjcbxf9pwri4ld7QfWk6iwu+KhpgW4L?=
 =?us-ascii?Q?BGN1Qrsm3ULrFzXbIYshQ6eoL4fcuxoeCz22t6vkgCJ3F2a08nOv5NIoFcZA?=
 =?us-ascii?Q?E498HXt/SW7zCgF/k9SmaVJVop6aDPShGD0Hc14iUeXfBy+Yu0ST3gRh/x8Q?=
 =?us-ascii?Q?C/xFCFszCimMeLbpLFyU6KfmLe2Vr4sAVsgRj65GLea9ZEWE2o35T9XKjJUk?=
 =?us-ascii?Q?LhWR01kEjcQWjDvBApBWzr2/GgIxrMplPGlXsHpZtSrqB2SP5kbTnHRZGw4a?=
 =?us-ascii?Q?GD2T3FMjAxiVCpz7TlSFmbp3Ou51ao/93FMXm/rDtC4EiALGu29xKAct7Avh?=
 =?us-ascii?Q?MFo5JmzoQLBUH0rNryY3vC9dGKoIVz684itIAeD5hLCdhOkj91nGAAlNl21h?=
 =?us-ascii?Q?xwjagkvFWxdXGzVu4uTc3C12zFLMApbUkXnAjqIUqbkHzbuvASFFy4uDX0yP?=
 =?us-ascii?Q?igv1J+nH/0ceNwujfdj4R+TX95nChxZ0VQHi9MwdGh3dm78ieUf1IrE6sOLc?=
 =?us-ascii?Q?t8FudkdwIcSfnNo8pMjbtJzxIQjRB6GQjBBq0l9WGqGmG+4gSVC3b6OUmOiL?=
 =?us-ascii?Q?Q2zwuKYKOKq0mCbsnMizxwA0nDEhkRwOKEik+LsgU8mDeFESF5hUndjQs1tV?=
 =?us-ascii?Q?Q4rpkUUHoFrVKXYIHaSKs5zW3hlUxSQP1poTaVYayGqV1cLttrykEwVG4uep?=
 =?us-ascii?Q?cmAzRarBsRaC5N5Q+4cGXuf0ACvnipYMt6En/OSSlE5fJFWFbuEJH8S69F0h?=
 =?us-ascii?Q?4dDltF+5AkOTBfPP+appsF8oGr5HxUrL21GY3qNan7vMhq6SA0tmp2Ak8S3z?=
 =?us-ascii?Q?+00sTY1p1yuVTYm7HboXlCe+YZ630QhblOXXAj9FeCwxmyJVZ1LJ7yfv6q49?=
 =?us-ascii?Q?WnxMFIgDly3okiKgIx2rdutzCiXrIovVvntrH/J4h5k7j07Gz8dpflOEkYa/?=
 =?us-ascii?Q?gAfUqkM0X6ktjBnrCUW3gClryfhA46TDEanVJK057OlZ9DD9wwdxFJLBvWBm?=
 =?us-ascii?Q?EL874wRNjCa94JPHPyzR/LQUfYLnJHCm58LbTc85WwBKVPmPWAuAuvURATV3?=
 =?us-ascii?Q?DkSPDQ6Hg9zWl3NPIut+ogsxdiIbAbh0AmSRDV3onJhigFVtkgd+5kDFc9qR?=
 =?us-ascii?Q?g8wK01puAPRuQc9LNN2f0EUG0I3a1mkwP0ujyuzteIAFMQs6wbH+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800d987a-2487-4333-909d-08dece0df7fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:20:52.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKq8Me7wt4+ue+wxULEsr/yFVtk/uLfMG07n+b5/iUJHA9zAay4kqkg1MtSNv7t9EastpVY9sueHiMUpC/KA9Eucly/C50J7CABpkpcWMPJHRjluxEcfmMSAY1msX0hO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7211

On Fri, Jun 19, 2026 at 03:31:15PM +0800, robby.cai@oss.nxp.com wrote:
> [You don't often get email from robby.cai@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Robby Cai <robby.cai@nxp.com>
>
> On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing.
> Writing '0' asserts reset and it remains asserted until explicitly
> deasserted by software.
>
> This driver previously treated the MIPI CSI reset signals as active-high,
> which led to incorrect reset assert/deassert sequencing. This issue was
> exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> release reset").
>
> Fix this by reflecting the correct reset polarity and ensuring proper
> reset handling.
>
> Fixes: c979dbf59987 ("reset: imx7: Add support for i.MX8MQ IP block variant")
> Cc: <stable@vger.kernel.org> # 6d79bb8fd2aa: media: imx8mq-mipi-csi2: Explicitly release reset
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Robby Cai <robby.cai@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
>
> Changes in v3:
>  - Add Cc tag as suggested by Philipp Zabel
>  - Add R-b tag from Philipp Zabel
>
> Link to v2: https://lore.kernel.org/imx/20260417080851.489303-1-robby.cai@nxp.com/
>
> Changes in v2:
>  - Drop the naming change in response to feedback from Krzysztof Kozlowski
>  - Refine the patch subject and commit message
>
> Link to v1: https://lore.kernel.org/imx/20260331101331.1405588-1-robby.cai@nxp.com/
>
> ---
>  drivers/reset/reset-imx7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> index dd01fe11c5cb..a3cb8244d76a 100644
> --- a/drivers/reset/reset-imx7.c
> +++ b/drivers/reset/reset-imx7.c
> @@ -236,6 +236,12 @@ static int imx8mq_reset_set(struct reset_controller_dev *rcdev,
>
>         case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
>         case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:
> +       case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET:
> +       case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET:
> +       case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET:
> +       case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET:
> +       case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET:
> +       case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET:
>         case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:
>         case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:
>         case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:
> --
> 2.50.1
>
>
