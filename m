Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D230FC12;
	Thu, 23 Jul 2026 02:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774465; cv=none; b=LBWDMNSYwAXa06GNkoQk1tQ6cxQAkglPGL12MqvrNLK0DhDgLUW+D1/OS9g8QYW9ccI1fFJf0ssexR+NZGiydvI4y8Qy1PRMxxsmpxcdw6whppKeMXFwGXx6PZiqj118Io/iRIt5xVN6N8qDWQdML5DGFi2aiSDawk/s17GSwsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774465; c=relaxed/simple;
	bh=X6f4lNHqW9zXwOdfJxnv2FjZNk0+9qi37SmtjTS/IR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rr+M1nzxQWkggdQ1/nB7lUxLX1d2MDgTxBzoAMfzG+9K8A+Kg1R8BXijEZXUAsk/TcK0F1A4+kKaVjdO/7JLTeOKpEb+sIBqlBJY7/aQ8pPQeeVjq3+gKOPrS5xmfjxTzYbU5qPmiY4Cz9+N37fLVzbfA6ORZY/IkPwJ2TjOAvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6HKJJcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6HKJJcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2821F000E9;
	Thu, 23 Jul 2026 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774463;
	bh=s7InTUwj8VWWRngQhLix6q6jEY4+4i5MXfIQ9FII1i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q6HKJJcZYq+5hRcrgdefJ+ZFy39tm4yo8Re7alGVnEfmMc46zwbGe3GKpurk3Qhn1
	 Yjt8un17E6Fpkzt0SfdWQKURSR25wsRS0lxsr8BHmZILJbZ1P53+2j3CzivA0eqycd
	 BmsxtW7DF17DVv5MyglQudivGBnX487CgbD07jnEDbbNPq/n5OgPQK+lXZJiRPFpmg
	 twC38PCRWHrge3EvKEdMU+TKnTCJUTIhoVbBK2u9VXlaWnlkff/7ppE2qPX2Bka/hO
	 jZYg+DYJqjpC4HPh29v4A2XNNd2ufHOrJHHoLfJN84+98lpQEhVoOhoKKV/F0x48jU
	 FXRD1ouXXWW+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723022313.1905051-4-shengjiu.wang@oss.nxp.com>
References: <20260723022313.1905051-1-shengjiu.wang@oss.nxp.com>
 <20260723022313.1905051-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:41:02 +0000
Message-Id: <20260723024103.6B2821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Mapping a dynamically allocated per-substream structure to a g=
lobally shared CPU DAI pointer reintroduces concurrent stream data races an=
d causes a Use-After-Free (UAF) vulnerability.
--

--- Patch [3]: [PATCH v2 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params int=
o pair/context struct ---
commit 00cf71a6ea96804fe20d59cf4d7658270bb9bebf
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct

This patch moves the dma_params fields into struct fsl_asrc_pair so each
concurrent stream pair owns its own copy. It removes the per-DAI probe
callbacks and assigns the per-pair DMA parameters to the CPU DAI during
startup.

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 38f2b7c63133a..64d66420e7ada 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
[ ... ]
> @@ -390,6 +390,20 @@ static int fsl_asrc_dma_startup(struct snd_soc_compo=
nent *component,
> =20
>  	runtime->private_data =3D pair;
> =20
> +	/*
> +	 * Point the cpu DAI dma_data at the per-pair params so that
> +	 * concurrent hw_params calls on different pairs each write to
> +	 * their own struct and do not race on addr/maxburst.  Use the
> +	 * per-direction setters so that a concurrent open of the other
> +	 * direction on the same DAI does not NULL out its pointer.
> +	 */
> +	if (tx)
> +		snd_soc_dai_dma_data_set_playback(snd_soc_rtd_to_cpu(rtd, 0),
> +						  &pair->dma_params);
> +	else
> +		snd_soc_dai_dma_data_set_capture(snd_soc_rtd_to_cpu(rtd, 0),
> +						 &pair->dma_params);

[Severity: Critical]
Does setting the shared CPU DAI dma_data to a per-substream allocated
structure reintroduce data races and create a use-after-free regression?

Since snd_soc_dai is a singleton per component, concurrent streams might
overwrite this single pointer. If we have two concurrent streams mapping to
ASRC, stream 2 could overwrite the shared CPU DAI playback_dma_data to
point to its own pair2.

If stream 2 then closes or fails in startup, pair2 is freed:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_shutdown() {
    ...
    kfree(pair);
    ...
}

The shared CPU DAI pointer is never nullified, leaving it dangling. If
stream 1 subsequently calls hw_params(), it would fetch this dangling
pointer:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_hw_params() {
    ...
    dma_params_fe =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0),
                                             substream);
    dma_params_fe->addr =3D asrc->paddr + asrc->get_fifo_addr(!dir, index);
    dma_params_fe->maxburst =3D dma_params_be->maxburst;
    ...
}

Could this lead to cross-stream corruption or a use-after-free vulnerability
by writing to and reading from the freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723022313.1905=
051-1-shengjiu.wang@oss.nxp.com?part=3D3
