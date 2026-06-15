Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16C3FB06B
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533040; cv=fail; b=IqMfjEzPS7JY7Pis8P0QP0OwmbLUyDYSrqBOvAkTXIMSGDQwbmjDWpihuTJeI9+YE0I/2gTti4+d+kghk9gN/PwocpzPENdkkG1z006Zmq3kONp7l3nfpZuPLeOvDVP3djeB1Vd2n8e/myMODx233xxNt7k5M0G7U6lo1bvCcc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533040; c=relaxed/simple;
	bh=PsgbHd4jERJTpvL1wyk3gZE5HVskCT9ACZyGsEWsBS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T+i/IF6WY4twQwWwS+8krt53rYL3bPbYHvxxtnQLTAlt06WmYss/PEB7OtGScrIRi95fdLrmz6s7nnFmkRHV1yGo6vZ6NUg2LMPJx/0GIZP+OP/qma/GYfxymfEvw2GG8PkesIWDKSM8H73AgWzFI1lc+0Tt1NOPGPuDJ6K/j28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VhRSH0Io; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VhRSH0Io"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibJV+C//rCtqjRBdNiY3D91cSuVSsZJz70slGW6DiGcNfBh8GkPyvtlGp3dY7dF+jhg4YLeXfvK8BPAYIAO+VmIPDpe0czvQRERonzqCayoNUsholZQ/U/TaLJvK3DwcNtVbap+PpD8/kiQNPBOs5shBJDLfayGdXxe2/11PV9WrNbzuioC62coDfwp8jqzR8ubdEgT7EmWOUnFVcCEOLrotb8Nj0/yzLcu/qhPWaOWY1bwaTYQQeL4b773UG2NF2DuGAYFxPZGgh9+6ZRp0deIsg3vhnt4kfp/tM1APXwkGy0hXgNUwoCfPSsCLpPmaC08UT5qAyklaP/y/9Cjkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRRFUVpqxC0PlclmGHFDxzrY3vSzlDGQ0ONOUrm9RDQ=;
 b=sRLTXHzRqIHNdkUFkFowQ+YaqClkaKOjRLMRsDgvG4lqAJARXsVJcj2ECynEWnXn5zlGlXLcBnuQH3CMuGJeJeIMMz2giZ10TzHkd1OryGwzIRfHCVPfqH2bGqrlT8EYTai5nxBeFvSGAAjwPGy+CfJv1WynDDTh6lisAGq5fHG/h8eYCfF7rRBETWmQoZhibfbRs3jeES9WW5mt1yDGrVRFmcFIpPCFH3VcVeJrHElOUqMrPylmndO5addHNIeoB2TYPqo39M5R/d2Z33YOTfKH7N6CDtJT1NIJDnijJQhUBFLNqvmphvMcIxTt+EJ4DDs6DZ2DIgE/L5qQP5uvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRRFUVpqxC0PlclmGHFDxzrY3vSzlDGQ0ONOUrm9RDQ=;
 b=VhRSH0IoslN+r/rJMVIbA96GO8Oinn4UdP5iKf9jfDAgppGFO2dgLhPJ9WQh20jQr7LLPyucen7u3bggT2sHD1u/mFSXLTmD+CidOpW2+YNBIbj+JAZ9B5yOKAPp8gY6xLAU8r8kMR3kYpvHli9cpaTYeoMcpL+v79x6KdZC6AHDUiCiwAWpLhxDbDWG1cChI6nczyY5TBIAo8mZn/yWxpQ7YCGiCIKERg3EoZrQtS7a2ygLaSBVKW9vTm/j3vfpztH2k5b1ziv/cNVpy1yMoxjvtNq/tJnRato/59ISxBhzWyXzErMFowtHoTQRRNYhIfSD7ZckMuZP3S/JZ1iMEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 14:17:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:17:16 +0000
Date: Mon, 15 Jun 2026 09:17:05 -0500
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
Subject: Re: [PATCH v2 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Message-ID: <ajAJYT_QWpcxYtGn@SMW015318>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
 <20260615093824.115751-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615093824.115751-6-phucduc.bui@gmail.com>
X-ClientProxiedBy: SN7P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: e3648f2d-ec45-483d-c43f-08decae8cd70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	lVlh7fLzbfCqAMe7/vjlt68BlgNnyB9q/iTFGE/jbsw0PLOjXkHfACixWZbD8DRtoSyVYqn/mgRsjq7tn3NLJCwZ7gZnO0l2x6j7f2gO8MZIcNenzmPSpivMKMNVykD3LzQtJNesen3eJhUV4eTVc5uMQT11E5l5+hKeUTxySlqqdbirke/4t8n664bfz5WwDjhEKWYrLdI289hyh6UEzvRWvkH0hIwTU9UQBJ4KoiO7lD7DLKLk09YuMx5nG0+5vu7bjojC9OZcSeuBp/XYiY9HGNQaEQNfItKDSu922XRcTVgC8RkIU0Y8G3VScyf3qAlTL+hJtioa+ElZKvY6qdMoiAcVel/fpDzp6GI0x1J/AZU2p6V1xMzpnq8ik1wssLAkChCgbY3Ow8kq6k2qKAG4yjKihXZH400nJVrtOjY7RJ/RwZnI4KLtUq1QeSh+oZljv45hLfg7+/0Yx5hEynhcDhgzjd8W0YtcoiAyA2NUKtOBMikwDFboyuYKztVKN7aJ1RcmJ+RHnmzodW9+CXdXKV/aliCIuRx0VFl7XokQ72tEBYeCNDeXeTah8DiLzhcl8v8Q7TPaTeCOeC1wH3PHkn2pwCkCuz40quPwqC2zZltIj35DtU/uwTPaXOwMAqk5i6X0NCi3+zFvSnIpe2s9JBLFhUyiAArpDgT0iLimJC0KXyozEXp2pogH8UNV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cG1FO5+qN4v+WIRe3gmIaMq+1lMNhHxjMORiDahpB9WiB15fF7/SLLP9ftXl?=
 =?us-ascii?Q?oKwwMf/kXmujCgKGQIr8Hjg5h/RmSuRotGGv5z5gL4Het3yIaZ4ksRixWiIn?=
 =?us-ascii?Q?2WyI0hh+gZaeDk1/Ddif+IRS9mjosFiLWQhnV+cJBEuyGcXvgJMcE8SYmngt?=
 =?us-ascii?Q?IO701WNNIKe6fogHBIf3pN5/bNSfS5z12fQUXklwjO50KsnOSk1i1F8hfHhF?=
 =?us-ascii?Q?tt4WxnjJD3rSP28rFO+q+G/5oa1rBs+quTPGofIgA0KCCmww6R0xClNwR0U4?=
 =?us-ascii?Q?Ey5Ow9twyfeZzUFU6J0X1p7YbaJNsZT/cMRyyU29C6rs8Wo3MwR01UeFAYoV?=
 =?us-ascii?Q?OfoYJOvANN+gaovx7ex1adi+axqq3Trqna6xPm/NAFWFefmnzt98nRW6f5Zo?=
 =?us-ascii?Q?JpAp+pV3toxlP4LQlclv7P/XSqQarbWbx5NvoLjB1waJeVwyXQpz0buZcqAd?=
 =?us-ascii?Q?NQtcjaYsSMILffoaZzK9pPJkriCtLyWzBTDUC3sf8Ft8YNoGFHY8tR0u2gU6?=
 =?us-ascii?Q?T3qpZWWC4QrKpdK8eMHdfX9+Dfo08ANcex8UnLxBcrdfZcqB38AT6Rl+yIX7?=
 =?us-ascii?Q?+HfqYGse6xwECiIrcs0gzuAIELrWxoG7Nw00QI3D7sQR/klN3E/YIUtHLAHy?=
 =?us-ascii?Q?tC4o2qkPbbkYb4ryGHO/23KMj7FDS08jjTibYiJ7i9C90XulGGppeXeMs17L?=
 =?us-ascii?Q?FC8N7xUjlSYpfyRI4Fg/rwJoVu6Q0uyxpz4F9wQAwaQylv/zvLOQf3HYFhBX?=
 =?us-ascii?Q?mPVLNTBnZbeZVF6BswCFI1GuAlF73uaUB+/nEBCjIRLlbfiBsaNdJFLAUSJz?=
 =?us-ascii?Q?wWXDWsUlJ1eLQlQ6lZwsVxDuTsRnsJRS+tS9tcy13vAVdNZySYTuUcPKznUc?=
 =?us-ascii?Q?KaYAy6r/U90WKKDbNxOBPonQwX9NEL9wyWSfijlclMySQGxn+Z6hJevXl9+D?=
 =?us-ascii?Q?GfUGE2nsslvsAMBL/3bICma278XDTwEFXXTAZF+eEMR/Fnw25FIP1LyMPVIx?=
 =?us-ascii?Q?ZjU3AsELJpNMaVW+QSbWoOWwmfX+LjRCOJeYYQvE8gD3wJ7CBKeHWFjTRENZ?=
 =?us-ascii?Q?5wZj/b6dP8gy6voOOrPeQDoCVanOuLFrMNBhmmctqROW42VFpK4maQRAW19j?=
 =?us-ascii?Q?1fEeBmeDQEDFdZCrdTQn3/2XmpqY2xtAr1FN6AGQ4G2yazhgSVWYhmxSOnz0?=
 =?us-ascii?Q?Yj2P3e7OM9N6kkCh00ZWuquB4uwMnQRYVOUrZUlHrySzn0gePg9iCSdUnhXZ?=
 =?us-ascii?Q?xB1UQ/S9f8R3rWS0dAQmSyoko9hRL1EZu1MTPMT7mvRsGEB0mtDwLrdkmWm9?=
 =?us-ascii?Q?ZGC63fhZ2v9VpTVXARl8wAxD5oZb1xBZrcuwR7nGrQt1LhFpLrrA+WUHXXAc?=
 =?us-ascii?Q?ciHZrpFiH9QBkxlqiGeZUBRDN5S0uqpUQz0uQD50MM1RB8LvPWzH+r+P5U/i?=
 =?us-ascii?Q?9b5QJ+JPhGyWJqwcdKZxCsSMuoBNFy/R+lkcX2O/kQs+Mp+8oJftA8ZEMzf5?=
 =?us-ascii?Q?9wPygpiumwV1rxGLm16oqranfsCbqkRXKQi1WJGyZxwdEVeIChHJMgX00yH9?=
 =?us-ascii?Q?fPunxHBNLFu2V4W6T5hSGQj0K6IRDYclBlzNFQ6Zku3dceV5KhQIFBzJZ8TI?=
 =?us-ascii?Q?GDLqs5StE2R9ZAdRiO2EniHNDGpCwxfQJzFl+gn5xEXOFZPF/fubALhuruRm?=
 =?us-ascii?Q?+ZL2hkMKs0xwnA/GqEUG0LPW1dL3bDPggNWmAkcUqsecJOei9hP0bl22R0Bo?=
 =?us-ascii?Q?sysXUcevN61KMvdOntEYJ98qDweG18ie4SnQERD4goRDOqKLZKQN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3648f2d-ec45-483d-c43f-08decae8cd70
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:17:16.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABIrDKt8GGbr7WYoLamSYoWjM83xnhW+LHrhwON5yJ/tDM4N8I634RnTAvcGVhOKSZKaPUH19LTiKff/7Ojrs3tVQfs+6HFPsUjNFy9ritZqx+SQUiWY/D5OHm7+VmXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

On Mon, Jun 15, 2026 at 04:38:18PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for spin locks.
> Merely code refactoring, and no behavior change.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/fsl/fsl_spdif.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 1b9be85b34c2..ad1206ed9882 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
>  	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
>  	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
> -	unsigned long flags;
>  	int ret = -EAGAIN;
>
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx = (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
>  		memcpy(&ucontrol->value.iec958.subcode[0],
>  				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
>  		ret = 0;
>  	}
> -	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
>
>  	return ret;
>  }
> @@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
>  	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
>  	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
> -	unsigned long flags;
>  	int ret = -EAGAIN;
>
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx = (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
>  		memcpy(&ucontrol->value.bytes.data[0],
>  				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
>  		ret = 0;
>  	}
> -	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
>
>  	return ret;
>  }
> --
> 2.43.0
>
>
