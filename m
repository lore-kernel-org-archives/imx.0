Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996955;
	b=RdyKSD3ZwBo/SMLgDpTbdWzSCLENd7Bt3OkS0+TF+/w58GZ4Db4q7OoH83iCw5C9cOcR
	 jYX6O+LaQe/1DjnERnaaHi/42N9TMTRm3b5ZE6hryicCGEYhesz281X5wGz+LxdwKOBeP
	 XT2+sBQjQjDEJQbH2ctr3yY19mv2BwZfrpHvHloEMO1n6eHoiAEjFRZdkvMt0PKhoXwx2
	 P62MquwoY54bRvb5+rOtr6wXetziVAwApHE8BoW/3g8dDma3eoPL+QbBM0944S8PMj39U
	 wRgXflk8PY7wHcQHmnVC9He4wnZ5HYUdzvZ2ItPNVKVl0/wFD5ZLwAxLAz+SfGDKxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996955;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YOMchNC+2buANuBozSrkUwBOQU2t/b/GbFBJmnbqQx4=;
	b=RDC629M7m8cRh/m66vDzSt1nd7QHgHhBLLRxKOjskwVMD54uedsv+ixVR2E9vArePNzu
	 iaNCngck5H66IYWKTOF5qn/L+Kn//qoJq2WWOi8HuSnf/grXi1hgmeXL2KaSglMU8HG09
	 JhaXKVOHuC82fj4uAKNtH+SGwcz0oI15Bb3UqCpW181Llv7HJYWPGyvV2HqVaDPgj3Vl0
	 mP4StxiAWZRnMBn0oYLpDd0LT+XIvC3j8y5J49WcnveBTFsGbicr7qW5groTxdcAPLB44
	 +FHdZoRCX/G0/8sL5i1n1U0vYVb3XSeJGtX9l313x5+vlhhyo1/he2iIvz5bjwj7NQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hjp6HR7A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E8606A326;
	Fri,  6 Nov 2026 20:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hjp6HR7A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03561F0089F;
	Fri,  6 Nov 2026 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793996954;
	bh=YOMchNC+2buANuBozSrkUwBOQU2t/b/GbFBJmnbqQx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hjp6HR7Af6/US1GKGBKxLeA1+K2C8LvOWG9bmZFmO8IIe7Th4fISAQtqtqcYsbZzp
	 p+dOST+kkDPAlPwtqE86yE8O84o+KQ93BY2FcUH3vlT++KhfnhCprZOAfYOWeTZTbi
	 egWe8lb+OochVjUSRMAvak87GNjYWGTd76g2uAdM5lnHcCdi1W7/kE2sdZHn50qakW
	 l/t35t9zlxk0G0ceeCNCK5Y+/2bhcoD1dcz58tEmaIKH0lJhEIwmaUozEceLce3cQU
	 xI9CQsIvX+pPzeyAJ1Wqr+VtsjIk3pXMJUboTwiIiKLn63G1chHHWbQjZD3JmF+1rW
	 CQGQduWzPoFsQ==
Message-ID: <sashiko-outbox-202212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: fsl: asrc: Use dmaengine API instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261106-dma_sound_cleanup-v1-2-5eb8a7b81e87@nxp.com>
References: <20261106-dma_sound_cleanup-v1-0-5eb8a7b81e87@nxp.com>
 <20261106-dma_sound_cleanup-v1-2-5eb8a7b81e87@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 20:29:13 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] ASoC: fsl_asrc_dma: ERR_PTR dereference in
  fsl_asrc_dma_hw_params() [1]
--

commit 5ed216d0bcbc0b97f113bf28f5e8a475ae506081
Author: Frank Li <Frank.Li@nxp.com>

ASoC: fsl: asrc: Use dmaengine API instead of chan->device->dev

This commit replaces direct accesses to chan->device->dev with
dmaengine_get_dma_device() and dmaengine_get_provider_device() in the
Freescale ASRC DMA driver.

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..12c3f19a431a8 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -262,7 +262,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,
>  		pair->dma_data.priority =3D tmp_data->priority;
>  		dma_release_channel(tmp_chan);
> =20
> -		of_dma_node =3D pair->dma_chan[!dir]->device->dev->of_node;
> +		of_dma_node =3D dmaengine_get_provider_device(pair->dma_chan[!dir])->o=
f_node;
>  		pair->dma_chan[dir] =3D
>  			__dma_request_channel(&mask, filter, &pair->dma_data,
>  					      of_dma_node);

[Severity: Critical]
This problem wasn't introduced by this patch, but can tmp_chan->private
dereference an error pointer [1] just above this hunk?

asrc->get_dma_channel() returns an ERR_PTR from dma_request_chan() when
front-end DMA channel allocation fails, whereas fsl_asrc_dma_hw_params()
only checks for !tmp_chan before accessing tmp_chan->private:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_hw_params() {
	...
		tmp_chan =3D asrc->get_dma_channel(pair, dir);
		if (!tmp_chan) {
			dma_release_channel(pair->dma_chan[!dir]);
			pair->dma_chan[!dir] =3D NULL;
			return -EINVAL;
		}
		tmp_data =3D tmp_chan->private;
	...
}

Should this check IS_ERR_OR_NULL(tmp_chan) instead?

[1] https://sashiko.dev/#/bug/linux-564b9a37-0988-4e75-909c-eb977f811fd1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dma_sound_=
cleanup-v1-0-5eb8a7b81e87@nxp.com?part=3D2
