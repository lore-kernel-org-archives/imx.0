Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86431439339
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129573; cv=fail; b=F7UqqxH9ol6DELXiBzWtggqUfrlPJYhDznlg5swm753IFg9NQay3pd1nXEPT03xQCXl2PeJQw7OKyn9Y6ik/b1I/nLnheI/fOIBtgIBeddNGRyRAJKufwKmmiWUvNzzHqygrGJvEsBoz7ZpRBsWW2Mk6ONgXzGLOBhxGSj38/AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129573; c=relaxed/simple;
	bh=HWFRTQ6b9XCntO2P30rZW6b3ZiEU22FEmiOxRtDuuNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r+zkGe0k3rDx3e5g1AFTQzVKXUq2uFXoimGegySLjXS+4s5AYLMpH+3frvrttWdoP7rW9O6sXfQoYQEBgt/+Za97Pg/+ynaE37kp5UxwHZBaxupx5ARwqOLiy+3RKh16u/15or1XIb1e6NASIFKEvrlQaQ0Ekr4CQ0gMSHA/l/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jvBAXlar; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jvBAXlar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRmuGPnkXM2GgA6zgeS27/EZXlQQH5M0psoznZt58yj71cGksWtwiDX5DYvi/WaWx86KM9rivqPpPSQjudyCYwVewv3VeQ19AB5Afc/aGI1EY/GUsrUVl8f2El24BUAng6dJyN6MtQ39S2Qoh8HHAkrMxKQX0ZTwO1qMvlS5DpPk9h0J3HYvqfzQIgL4VI8kf47/MD5O7hdCytAW0YPlj5ILwqZNThPhYsz55kc9GcrbJS5Wz0gm+A5SlX9ifPRcZQnK43SldH/kVa35J+PsBthsZuEkh7P/FDvbavJf9BtmUCl7BTnF2+HrvhzpTTtsrR367BM8aHAS5Nh3KlGxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqI5uW4cx9/TF96a52erQQiXyZValyE4aN7Lv2nDcWg=;
 b=DWlB8BFc/ihJnb555mPUM6GtZafkugbsnCTNGrU7MwdAEqboahVS3QDyW1d5O5Gy+96FiLqdC8mPxL+5E3lL6X7UiU0Evf0Aoy5BDq6fT7CLSRRLBM4tb43mXKtn5+INk7lAZR3na5NMwlcRp+q5aselSTMhEK9BcZjcCNf8AzPGB11G3WplNbr6SCYW8YbUl4xqQzpzfGjrRo/NsIBj87cXzsbsUh8Nuaspl3XPTfIl1Lr0m7kQBbUYgPvyi7FyImW14sasdMPq1/GzQOJMT9+hnH/WfG4N3uxqm9h+f7WFHsI+7Ui+SBRB2GRTCowRAWoSHGX4jgup/n+BLQj10w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqI5uW4cx9/TF96a52erQQiXyZValyE4aN7Lv2nDcWg=;
 b=jvBAXlarp8umznifowSndSFaK6IcqZh5z8lTAz8glO6FNWwoP7MVhskU3jcCpTh3nmNfwtCb73TDq6F82u9yTjTFVKOZiv+qR0mt0LO5VNjJ+rncnnXu5M0RIE4n7WHF/aIkWFdoq00e0FPJuJNX3BMfNMFUmDIVR/nzkNz0izfnmX9UeuYQ+IjphoMRW6fdWVaz+pFNqbz52FQ3yoF4DhCnBG5DcXOBektE4nRu67h9YJRN6dn3XXzWabdpjFitSnevNcwOtTW8gA6E4mwt8zGTk5z6famUPnzVytBugc5fAlvzFyWaf4d0I6c5npSTEjzK2YZM0IedGUyULPqkjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6931.eurprd04.prod.outlook.com (2603:10a6:208:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 15:32:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:32:49 +0000
Date: Wed, 15 Jul 2026 10:32:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v6 6/6] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <aleoGO5hBWCl6ZgE@SMW015318>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
X-ClientProxiedBy: SA9PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:806:6e::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 886ffcfd-e5e2-4eb7-9c0c-08dee28653b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	fs2WRmPW3X94q2pD8QgYyEsnne6AlK5ATq0aIfwiXmBFXTW5tI7BV/Ef0cYSObCZOtslXiEZdMWVM96RcNF3z6cFYJAhHinLmU62CAEwovvcHZSddYe9+waWvmpJyXn5i2iSH+hyLJTNLUC8kvSl/4kUwy1Y5HgsuRj8wJAuyTAu89DhuZ5ZbCrNUO4UjxQ0VlSJmK7h92aDXpoBA+0V3yMpAUKbHiazKvJs4pa7eKKQ1orLONHe9YRwNCs/fvYY+IbcWECzupwBkIW34qFGJ2lMwWmCmSOyl9ADOjyeNXy4kpbaJgjPdERxk296lGLis0xToKV0UQegQApMJvXvBnkFK8NyWOTEIvwc+uOrsDknklRWdNYI95xP8BD51/rao9xJzdCPTLiH5WlYNjAaR0ZOy0z00+1qaBGl6qDrH8vS+h+pY+B83hRtZX55bjexFmJKtgWpvafPefs9hMZMrbim6EeqEf/KKmbGue6l4s0qqjEkjoU3ImeRCsoXjYYQOTA9RIFJmD4HOE4kxMsCwLoJwpsdGGh91ySUCordHU98/D4T+yrRZm4+jbh5SFcPaLKUAFMyDNmgnTxt/YVZ+/p782gJnT815r6TxjIgJfa2zZduxn8pxVIFUj/QT2788A0rMCT5N9SDZc8eLkEfLcZtOHi2R1CLfWgAMbCx1Hs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T3QqPIK7VBRGw4WHOo/PLB21mvNMw3Oaor6oWmAoulCESqETjfrL+gSEswbq?=
 =?us-ascii?Q?b/yD9pHEqawX6CO2vOsHvHBP//bCxS0Um6/l9jQ5OjUbhbSMxnZ+BRvmVdQy?=
 =?us-ascii?Q?7gbvUFLdhQvSN8rLngPidgvmgrune1O6Hp55WhdPIPK/5PX29T1oE+kZIG0q?=
 =?us-ascii?Q?sZarT/BR8tOaRCOT2Pfq4KBUj+CqXhaLotYpJktghkdftABp/rTQTycSZyaA?=
 =?us-ascii?Q?LYnNM8e0feBZaA19xOGqNAbspUwY0AqbE4dwAqXHBliDS2x91SyiyP1NplNI?=
 =?us-ascii?Q?PJLW8nqSgQdV1Jhm4dWNxs7qObZMw3GeFRGLXmbATB/aVILvm4c7FXyp3QBm?=
 =?us-ascii?Q?YpwpM5alaLtKgBg94kKJ9yyJ27OC+vLIAx0qe5zF9wS+ngODJbdiuPyilFGG?=
 =?us-ascii?Q?jpgyGIhsxh6QSTq4qtOiNJ9mVR59YKDOg7tytd7Vn7mIPplUxNyJTj0TsjH6?=
 =?us-ascii?Q?RTpPrw9/pCCNmAxlS7rYQELbtsGfd8SKaauC8x6vmgElSz/+SCNS1PE0mx/2?=
 =?us-ascii?Q?DC89eFXcOZL2aRpPZfdhzpqBt/KAnYDYSFmogDgfiZ4JbPra+u7qawrX4y/6?=
 =?us-ascii?Q?LjTuOHRCNDv4onmnpgpYGC7169DDgGCC774UmnBlv8KsU8F/uWbGHYAECbVe?=
 =?us-ascii?Q?k8JtVxAjyRURpved3KBz+wW6UWU/Cs9siJJJ9SpBpNpkh6Goco9n+rmvGUUZ?=
 =?us-ascii?Q?myvs8FqAsQhMXCZ27ieivpHyNKHVrHB6JsFA0GG6voRcDOKjiVUXzHC92WG7?=
 =?us-ascii?Q?tfBxPSfNqJ+kZkRE/oOHD82/5IPSruTzy9N4H154XkpWH9IPFHe+ZJLmyJS8?=
 =?us-ascii?Q?EvYEeqFa+A9bLfEFV/t7kxS3uJmjN5UAwvgNdB8GyuaH3W9RLbSBF1W34g9d?=
 =?us-ascii?Q?1FmbCOHaB3FcyQZfaWujsLAjvDj+VvmL2EdzenH3xDaxXm8Ts7Fd4H6oAUab?=
 =?us-ascii?Q?aHxNpnB9N1ofad+J+4a+5oDMvCW/TXx7cJE47Bg04NACjxo8tRSYMUZBEBzB?=
 =?us-ascii?Q?WTVUOedUZoYooiQzAwu+5M8FjN8owHgnhgNafZRKRavWe4SN9dXwGNclQUVi?=
 =?us-ascii?Q?hVF3ngSFwgUOYxPTLa/XE81+5ZJg5Q5fB8E2nZ2Qk5K/lvxdD9HrVO6KJvK5?=
 =?us-ascii?Q?XMz+h4a03ruQC6Wf6ynoYjugKWyV3A3DYXf/K03lgjU5OvkiuNNvDaNLJgGO?=
 =?us-ascii?Q?i4QXeHNdHjCeno/VNwVUlJ0nEUtMK5fOGSzwY315mMkZMe7Wq9N3HYyZmgWA?=
 =?us-ascii?Q?JiVSQBLRZfeIuxd2N2Vvt6ay5SE9AifGH+knd95RvyoiPxA0fGclMIXDyrPa?=
 =?us-ascii?Q?15yaj49fT6a5qBnaPd18G5Tid+6BJR9g274rZZGl4kORyw46DpyHicKWBCzT?=
 =?us-ascii?Q?9I007mp5K5SqYXsQhaEMRXOTfSQMPm8Lj4cguG0/IeiY2Aj0br432PQ+v3Ci?=
 =?us-ascii?Q?zInmUXBjDgFfBBSQvH0ESPgRjNFctuDelXxZNpZ9/pxWtEwTUN2VaieXjnmd?=
 =?us-ascii?Q?FTeYFRJBAlwiGDYhXyZ2cm+NzbKyVyXPwG4nvRjQKYKWhjlDaNbS5/8j7Iot?=
 =?us-ascii?Q?wL2mtarh9o4ftZW7qCAOVC1kyECgTpmstOIHYAWzvtS28qd1H4RK+e6fhhv+?=
 =?us-ascii?Q?1b165luovTxvbd2u6l7Vll0QZ/kFeijENQ9c7A5FehYQPtAi7NI1QA+CSihj?=
 =?us-ascii?Q?csUwQwz91Pa8hG4YAhJZ3LvPpQVSiK53B0AoZJFyDAusFTAiSVz31BYI1GTl?=
 =?us-ascii?Q?svlYUSx2kIObzvrI0+uhcfbTpbkjYafWlSO5gFGFkdq5EVti8iPC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886ffcfd-e5e2-4eb7-9c0c-08dee28653b6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:32:49.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrNNcn6f4otDxFKUxSRswLLnobx+p3qrj2QlVzqKzMT+halhE69Q9bd7p2DsM5O1ahGxBxnz7Sabf5rY6zWhX+gm1wYCykTDaSjS0c1pX57oUxzwwZ6Vm5s1UDec8S4r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6931

On Wed, Jul 15, 2026 at 07:34:01PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> never powered off at runtime. With the introduction of runtime PM support,
> the power domain will be powered off if the device is runtime suspended,
> which breaks USB wakeup functionality.
>
> To preserve wakeup functionality, mark the PHY power domain as runtime
> always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v6:
>  - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
>    if the flag is true
> Changes in v5:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index f0bdfa75d586..2398bda50eb8 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
> @@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
>
>  struct imx8mq_usb_phy_drvdata {
>  	const struct phy_ops *ops;
> +	bool need_genpd_rpm_on;
>  };
>
>  static void tca_blk_orientation_set(struct tca_blk *tca,
> @@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
>
>  static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
>  	.ops = &imx8mp_usb_phy_ops,
> +	.need_genpd_rpm_on = true,
>  };
>
>  static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
> @@ -739,6 +742,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (!phy_data)
>  		return -EINVAL;
>
> +	if (phy_data->need_genpd_rpm_on) {
> +		ret = dev_pm_genpd_rpm_always_on(dev, true);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to set genpd rpm always on\n");
> +	}
> +

need set false at driver remove?

Frank

>  	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>
> --
> 2.34.1
>
>
