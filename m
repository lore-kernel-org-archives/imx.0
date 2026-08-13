Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83536195D;
	Thu, 13 Aug 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604986; cv=none; b=J+1elLYZUERf95o/SL80bNsYxoqcb5/GQ+k8/j10VXd7anvLdHhDaWtB5vsXsisiIX4Ps6YLu5ah9vNH5/LKNAu3NG9EQvspWPZxKePQKToLAaRYMo7pTKSMnbvOz3LZhl04BrMot1druBsKVL8T5U/iXPipSZEJ9JJEFBNAPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604986; c=relaxed/simple;
	bh=4K6lxjltMyTiqZvaHKpanfCHhba+lXimEr3f3Hba3cc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=plHZMP+/v/9xBuf27687epWIjSNOyDMAifghUddxVwZ/5T+C5o4m+SWbhlkd4z31brhR6u71EqY5bi0UWcBFSQ9/qk8r1hj8Q/N8d5qydXyUWuEMY1JsnffQ3QSgOBSc2tqDthbXPKVPCyAhfQcnJAp1eMAaOpeuw0LVR1M7Xpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk1zCRFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk1zCRFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22CF1F000E9;
	Thu, 13 Aug 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604985;
	bh=dFKoEMwl4/6hHOXDztVHBZ/r8kjGb3vBgyctCmWKV2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sk1zCRFIbugs7s9tQ/Zbbj1ptv1hRqPH59Yhojee5qQns7/X5RGA9ssAyOC+DmzQa
	 fdjl5usEXGdB/bZH8zLdQbcx+R1Shz2WnYj0B7bJ6UwA3q+qNyBB0bHFKapN5GKA1Q
	 h+KpMpqniXKk3JJz2dQESfT6Jl8HZSkd7tfFH59CwCO3sbblHJ04dvErNdtyYgmpJm
	 8I0ns/kPr8GYewKWAWrBIPt4kIg4uOH9E1vD/+pYJ1+MxRZ5B4iX1T3xt5chfsMx4w
	 a27eNQLnadgYpHwIX5m9Q+SKQIJCQ2/SJ1QZjH539QNr4wnq3zcC0dRxaGs5ARFl6b
	 By3RHQpP5zYiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260813070020.719810-4-shengjiu.wang@oss.nxp.com>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 07:09:44 +0000
Message-Id: <20260813070944.C22CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The dynamically allocated `pair` is freed on stream shutdown w=
ithout clearing the shared CPU DAI's `dma_data` pointer, leaving a dangling=
 pointer that leads to a Use-After-Free on concurrent streams.
- [High] The patch fails to resolve concurrent stream corruption because it=
 assigns the per-pair `dma_params` to a shared CPU DAI, meaning concurrent =
streams overwrite each other's DMA parameters pointer.
--

--- Patch [3]: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params int=
o pair/context struct ---
commit 6f9d240bd6e939329ded07360e8ef36835e62929
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct
   =20
The shared dma_params_tx/rx fields in struct fsl_asrc were a single
instance written by every concurrent fsl_asrc_dma_hw_params() call.
With multiple DAIs registered (one per pair/context), parallel stream
open+hw_params races would corrupt addr and maxburst for all active
streams.

Fix by moving dma_params into struct fsl_asrc_pair so each pair owns
its own copy. Initialise them in fsl_asrc_dma_startup() where
the pair is allocated, which makes the per-DAI probe callbacks in
fsl_asrc.c and fsl_easrc.c redundant; remove those as well.

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d07..15f2dccc35840 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -392,6 +392,20 @@ static int fsl_asrc_dma_startup(struct snd_soc_compo=
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
> +

[Severity: High]
Does this actually resolve the concurrent stream corruption?

If the driver registers only a single CPU DAI, won't multiple streams openi=
ng
in the same direction all assign their per-pair `dma_params` to the same sh=
ared
CPU DAI pointer?

The last stream to open would overwrite the pointer. When concurrent streams
then call fsl_asrc_dma_hw_params(), wouldn't they all fetch this same
overwritten pointer and write their DMA configurations into a single shared
struct, continuing to corrupt the data?

[Severity: Critical]
Can this also lead to a Use-After-Free when streams are closed?

If Stream A opens and sets the shared CPU DAI pointer to its dynamically
allocated `pair->dma_params`, and then Stream B opens concurrently and
overwrites the shared pointer with its own `pair->dma_params`:

If Stream B then closes and frees its `pair` struct via kfree() in
fsl_asrc_dma_shutdown(), the pointer in the shared CPU DAI is left dangling.

If Stream A then proceeds to fsl_asrc_dma_hw_params() and calls
snd_soc_dai_get_dma_data(), won't it fetch the dangling pointer and write
`addr` and `maxburst` into freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813070020.7198=
10-1-shengjiu.wang@oss.nxp.com?part=3D3
