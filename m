Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E493F822B
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533088; cv=fail; b=RxjfvFfEYV44NkCAXiAZ+n7Fl628xv6I//mT+X4AuvLveRYm6fdnGzI68dbJZ0ysH96zIonIvZbAmN8u2yfQunvuCPpN4eMCHhd+QI+b4wLxNC1YfYZ06F+qJ2ytaa4lWL+9PkgntUQsBiqoXXOJz4Kt+hXtrBl+1ndelzNXhPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533088; c=relaxed/simple;
	bh=ZkRThGIK4Y3q+5LUIN97CKeVLiajSurgOq82+K0bBXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bpCGB+P8MuHJRVTToPTRiOuFsTuvRreaSofIxkDrb+iNsdUuIGGdq5dgxyOniY6mfHChpjjyOo2RtIsX6p1vhhs9BNydJCB8uk0ET7pP9L9JdaLvo8iqGobNWObLyH3TGFOyypdJKQk0Y9s3oDVOkOc9zp+poeba92E3kdXDPpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MwsV+udB; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MwsV+udB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNTLk11cKA49IOYj3EkpO8m+WK8fPpdRRijvtutxmbTAnjPwdWnjEsmE6HtPNStf0IaPKaa51tar9hYYKyILlrOz0QRj7yc3bKcGyuB+MENzfTefjgPTwfW5VrIOcNsEsWM0UcJzkXyP2sLUCTzgf/9bh44YWXD0ozNjv1bWAs6dWfmtN4i/W4wY2jJK9Xutff6Bcwj8d+uszN+2V5crPmo6/gpY6KveSr8DTmDiIQxT1E7Z0ueDr9uparYsT+/Lnn0CJUKbmQYmzCejnsBiX3UlYm9S1rFUkHCf2b6yM/PLnu/ZE3ONYI1Un+TIsi8b/YfoejMN7iI/ji8cc+oAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkWRM3/xLQlJT+KavofwIRQrvd5blzD4CRIJgr1KegE=;
 b=aqmef1LA8Zomn0l8a13bS2MQ5MBwNlzsTDDd2P7P1BAhGrxjCGv5I9syxkLlnEXrDeZgL+xUsC9KYrA3+ILuxH0bDS+U0a+8phfJav9HjXmRiW5ElbsGYJr/orvAdqzv8jcNGkJh0RrqckVetRKAge3XUf3a4TqbNtaJYt7LuZD4Dna5Incam74mEj1YtmggGbNGFEGP7izwm6oWq5u4WBAUzhcuCAB1mqhAihK+EcGLnJXQVV0SEpKoAjs0bhOuLtDRpKeREriGbJ1zeix2Df8YlFo9mLrCC+ws63gIMuKrfzQQv2xtSSwwWlsiKczh3Hdo9/TKocG0pMKVsBCBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkWRM3/xLQlJT+KavofwIRQrvd5blzD4CRIJgr1KegE=;
 b=MwsV+udBXEkbiGq0S4cf24Cy8rRxiAREGPY4tGzUucrJEM076VB/w7yv4GCBhFIFGtXiG5X8qQm0FiIamiSDmSJloDrOp52fI+VDhbODnq4QQVaxr/NhDNwyqMAy5Yx9uVHad97uocaRVAbBF304V1o2VXLQLyGGVgrHPgbFprVe80r1UHctAogHUu9Xlw4JxkqgEmaotWdm+rxhfjBEJaCyZA/RlPe0l2kVZCXnNNWZEuqtUQYuGmNgYf02fss162a0l+vhfPRQjMu2LKA49id7AO9+l3MH+L3FkjWfdzmvWibFc3RRB8WHQX/ohSM4k8MckIFTJGPCER+yLJuAPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 14:18:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:18:03 +0000
Date: Mon, 15 Jun 2026 09:17:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin
 locks
Message-ID: <ajAJj_aBiohUztXi@SMW015318>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
 <20260615093824.115751-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615093824.115751-9-phucduc.bui@gmail.com>
X-ClientProxiedBy: SN7P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: be84e48d-f724-4a7d-c13f-08decae8e929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FuekI6wgy9HMQcKr8HSaFp0xiATrs+s68kK+5m8aj8gBBmpytV96/UPTqy1QBMRvLzDgiZYJ/Jh1nmnZbpW+dy6XwgZ9+/QMJpfwC2Dk3G4LP4Vubs2fb4K5MizNZx+nH+DXEahN2VNg6LV560giMKnEvwlCx+6oguUwuZ5zq2zzyGp69Zx9nRYbEd15qBfxcPSwB2o01bJc2/UzhBUbXTLZ4dhqNf9TUXarwHkE4XOTXgNY58/HVbknXlmfssoQx5ClI8s8x5Kf8z2HARv0QIbxOB661Z5k8uHOzSJl2ochGopIVzr8f4j7bPED3VGlCdN270ci72Sthe0UDucOMQhqTeUMhhx4zSMOptQNmO28jNwQvmQTZEq/Qaf+Z7R/qrubNTVULyKwx6bB9SPqU9x0ar14pNsmXyO4oQPF9r1O946pWNVEI00ao2J02pYD/TuGs+GCku+vYEsf/9CqH1pQQecbiG25Aq5w/OM749J58recEKk5qjNTdErbIVBcFcqLNCk14kx9vx+rLTxmiPj5L7S1nhLLxbRMosgCiDs6EsI6uknmFTR0wSYE+SNqZsh25WnyHWRO1ugiknpgQGqbclhIzvPn0I7B3Bh51U8IbaoHKamsIONbyCqeQOLkm4WPJKHBPHYaBjCLaJ6/xiUV53PwU+NfO6+gF41TZtKAfH8zyO1dyQQq+84TjWeb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XdNa4zqnMIHXd8QQvXDfHWAh9oj+n1Sapcwqk3cbPvlArLSBf8QdbitnL4Uw?=
 =?us-ascii?Q?sdofcUVfQgctRs4xnTs0cONzIlab4kxFo0zNRP6tlZgNO+RAxuhbgRdcwe1F?=
 =?us-ascii?Q?HrVeZ6eHS6/RwE6swqMF2D5TwbXFgVaVQeAqXDyxe3vhmkgbyRqJAma38bPj?=
 =?us-ascii?Q?aPy809Uc5zO3GfDG7MREgyOjDw7rJoL/xS0RSbRjs+2yMicXjKq6SFv4RsnR?=
 =?us-ascii?Q?nagGFdgHHZQPKCCWhZhB/U/ilxcp1usuEwO61gPgcNtwkRMgcFer3/CTsYBW?=
 =?us-ascii?Q?OSV5+YnlBOMnBs/h03GB5LsgghENjDgSvMGs3rDI29Ujx9oDiFsEv5dglsaq?=
 =?us-ascii?Q?CkOuN6sV/Uz/sDpyJLN4GZ5EwRJN+JAaOrpWdf7a11AnT5xz67ADPYuYhe3a?=
 =?us-ascii?Q?As+Y+BmtLd0qccsDPxcEToJ0oj81JkV1Z5vWPK9FIhP4BXyDpmmIe2Fteak6?=
 =?us-ascii?Q?0SLL6ujgYCyuWtx893ZyIRGk0tbLES0fuHSbsYjvwGtCHJm1enGPyHQzYy2v?=
 =?us-ascii?Q?PLWSXVbnk3b22APb7Hihav5RRmxGWgq8f0NZI0pa65N8s6gnkWWztjXYKXzj?=
 =?us-ascii?Q?n2flY9d5a3OdXzOnEoaFoxvhcYdjpNQ8VI0+v3VEH0CScZ298J8xJ2o0si+F?=
 =?us-ascii?Q?47XD8fwigpJ1tUdSm+CUyLKxHNkkQkkMzSg5EAspgi+2UxiTlk2jow2MDRtX?=
 =?us-ascii?Q?/S0gz4DT6ko6r+Nslh3XcWEMSPMiMftW0wC2zcNk4bpgJHTxb4nLalnL2PVu?=
 =?us-ascii?Q?BjD1CSJM/oqm4T59zTQv86ugLVQwiMfnWhSXp+iFyjSpT3HJInzqDk7wkHLN?=
 =?us-ascii?Q?vgg1UeHFnZdtLB5RiuJngb0eZsZXIQgu+2VaJuEFJUoAL9ChvV7UYVx+Gs99?=
 =?us-ascii?Q?xWhNYyy/jP+PtX/iLXf4uwVklEI1fxjoy5CVFkJpys+1+pCPAXl3GW+r7Bfz?=
 =?us-ascii?Q?R8/QwIgMCUs/OKMNEf7ZzGCZGqsQwDgYkylOGacjOfSkFADEbnj0csHI1jd8?=
 =?us-ascii?Q?uoegvG7rs7SaBSu9e/+EHXd+NH8yP9yLnRMPoPbfGzD8wgUZQF4rx+D3ryoD?=
 =?us-ascii?Q?v03jR9W5EwfFMxB1g+FvpzlAo02uYLEMpqJHi6gb4a07N+iV/swXlaiWl5Vp?=
 =?us-ascii?Q?+8Xpa8xevz8q+ext3LKBOUrqvZv93TH4iLaJBSOJDK3QGkC1L+iZVTb4qgHG?=
 =?us-ascii?Q?eyTSHMd55KT87wS0NGG5+AN5mP2yipdlD6myj+Lrdc9ZIYDiXIc6+Jbt9vRH?=
 =?us-ascii?Q?KuIK4Srlvxa9W+INYwCf7cmbSm4Rgq3g73jhQqcGDNSKtzJB25/XmE4zrUb3?=
 =?us-ascii?Q?OFQNAH3F1NI9HXMu3ICNdjBZvGkKWJxG43e5V9zzQtY7fkqf7hZHOqy6wWo+?=
 =?us-ascii?Q?ImDZGwRRz5aM0+8fB1V1cv9yULN0nx388vVlTjr9bEtyEvFjuJJGHTY/ejfJ?=
 =?us-ascii?Q?040S01GvMlHTHbBwpA3Qzqybl6/hodi6yWpmCIG+ZNfHYugcFfjZxAFlOFjC?=
 =?us-ascii?Q?/g1e/IplhzdfIxwOcVhIbfdzSAtJDm+GpbtiBufkpU29O1SCkifWFaM1kbUI?=
 =?us-ascii?Q?kOzymZ7kYjbI+VbTMja5V+aaQSFZ+aggh0D2Ynd0PeeI3UGSEKjdEECsPzEq?=
 =?us-ascii?Q?OoR93KMZX9drAxdEfkGYGwbIYSztXrp7mdIDXKyk1ACl0WzgqJdqU980G/bP?=
 =?us-ascii?Q?qckeE8yK7HTyAljNUEG/261OK7roDd+WFocQMSr9zk7ofauN/hhThvOR9DLm?=
 =?us-ascii?Q?zqjb+BKUNQ4iB3Dh4A5x3d1bREMTUatbfIDOj2lZ3ppzndPrWM/9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be84e48d-f724-4a7d-c13f-08decae8e929
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:18:02.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X25GeZsm6On50TRDvPvRYEcueiA+AZPZNWszbJCwfr3bgcKotd05wBSRnNe2I+kw8ijkbIhdv5VaegJiwoB93gvZ+HQQeqGXzmu3BAp399ywI2Igj4DG8Z6uhdPatPE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

On Mon, Jun 15, 2026 at 04:38:21PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for spin locks.
> Merely code refactoring, and no behavior change.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/fsl/imx-audio-rpmsg.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
> index 38aafb8954c7..b55dfbdb4502 100644
> --- a/sound/soc/fsl/imx-audio-rpmsg.c
> +++ b/sound/soc/fsl/imx-audio-rpmsg.c
> @@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
>  	struct rpmsg_info *info;
>  	struct rpmsg_msg *msg;
> -	unsigned long flags;
>
>  	if (!rpmsg->rpmsg_pdev)
>  		return 0;
> @@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
>  		/* TYPE C is notification from M core */
>  		switch (r_msg->header.cmd) {
>  		case TX_PERIOD_DONE:
> -			spin_lock_irqsave(&info->lock[TX], flags);
> -			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
> -			msg->r_msg.param.buffer_tail =
> -						r_msg->param.buffer_tail;
> -			msg->r_msg.param.buffer_tail %= info->num_period[TX];
> -			spin_unlock_irqrestore(&info->lock[TX], flags);
> +			scoped_guard(spinlock_irqsave, &info->lock[TX]) {
> +				msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
> +				msg->r_msg.param.buffer_tail =
> +							r_msg->param.buffer_tail;
> +				msg->r_msg.param.buffer_tail %= info->num_period[TX];
> +			}
>  			info->callback[TX](info->callback_param[TX]);
>  			break;
>  		case RX_PERIOD_DONE:
> -			spin_lock_irqsave(&info->lock[RX], flags);
> -			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
> -			msg->r_msg.param.buffer_tail =
> -						r_msg->param.buffer_tail;
> -			msg->r_msg.param.buffer_tail %= info->num_period[1];
> -			spin_unlock_irqrestore(&info->lock[RX], flags);
> +			scoped_guard(spinlock_irqsave, &info->lock[RX]) {
> +				msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
> +				msg->r_msg.param.buffer_tail =
> +							r_msg->param.buffer_tail;
> +				msg->r_msg.param.buffer_tail %= info->num_period[1];
> +			}
>  			info->callback[RX](info->callback_param[RX]);
>  			break;
>  		default:
> --
> 2.43.0
>
>
