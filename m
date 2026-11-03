Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687784;
	b=j2MImO15TPJVV/kFb+JXc0bipJ+HIIDh2jGD9bYhgym5nC81mBNztc/Yh416k9vOY5zc
	 2gZDlmRHY5wb0TayE1n3HD+qoTu7amll/TcIUNuiErPd4nHls+rilgPjrCbdLqE86kBlb
	 d5LDy/pCN7FmBjz8Al7PBxfyVqRU5wrayaQJ+Kqxlew1CNMTG9X9jQRS+vRG7HTuOKIv1
	 GtUlFzRslUy8OhCIMsIaNraWMC9TxMA/vw6gbm1ZdSYnAEx7UY60+MGgIuvrDWt/8dzuk
	 jninxysr4yrFxXE50A/mFf/9KivbXl3x6j+X+5E9laBYF3nzfXfQ/GuR25Q+1u9YOEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687784;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F+ZRkrgikRW1/CvG+6jZPeYXRBmMOp8E5R+kuubVWS8=;
	b=ZWewrk9pxMicvjcrKqg6a7/kWLPQ49SNMnpdjH0n63Bm+m4ApxMVLPsf5mKQMdNgi9uK
	 CZt0oUMccnYNbzTfxtgB2qtfvc2DgftJRSNBX9cW/g9nwraflA5Hd2Z+bYFe83M6y580E
	 2lVf07B0GAqsbaVeSKfTxYWcwB02VpohaVPpQmzwGfzngUsAVuKzWFokpf4xWaj+RJO9s
	 0iYFAgxc9eEQPt6MaIc46pco9iqEBHt+9cqyT2m7SUTc0ajgMo1lHX+XTW+JKEAOeVG8t
	 519y507tUkXN+ZDMFfcqIEoqP1DRDzHs3zhL6IxwS76DyyqXKQ1cakC/QxKOeABWXmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXGc4yo4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B326F606A324;
	Tue,  3 Nov 2026 06:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXGc4yo4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFA91F000C1;
	Tue,  3 Nov 2026 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687783;
	bh=F+ZRkrgikRW1/CvG+6jZPeYXRBmMOp8E5R+kuubVWS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXGc4yo4BS99J9WnKqTDnw+GC2L3D4WzXOWnGMUFW+8YMNk28Azzic24HOl9UlThA
	 6xBZDgkw918ofguX6/w+fY0bH7cwj8DTOVFGVFbsk7DTnxQs2rLVz8Vo/8lna/euNA
	 CmhGXbydRF+chkTSMFSpyecrh9clBxPrg80e7wNm3N8ErH5CMq5yCpU0e6l9PI9X3u
	 oGfPcgHphz3+0lFtOFvWXGS2bvxyLnjrzWxitT+aMzN1ctatESdxL/98ow23wqHjIi
	 N6RLrk0f1t7fbpfj11EXppFrMBSNGJfbyESc6pzFoum+QV32XrluF9ZVtmuAEO0qLF
	 8vzVmN+5PDcpA==
Message-ID: <sashiko-outbox-194645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/16] drm/imx: dc: Add PRG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-imx8-dc-prefetch-v9-8-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
 <20261103-imx8-dc-prefetch-v9-8-3b985e7636e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:36:22 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/imx: dc-prg: unclocked MMIO and RPM underflow in dc_prg_config=
ure()
--

commit d1c395ad8b2bd23da43b9ddd3c832ab32084d33e
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Add PRG support

This commit adds a platform driver for the Display Prefetch Resolve Gasket
(PRG), which sits between a Display Prefetch Resolve Channel (DPRC) and a
FetchUnit as part of the prefetch engine.

> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-=
prg.c
> new file mode 100644
> index 0000000000000..b80ce5e641173
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
> @@ -0,0 +1,317 @@

[ ... ]

> +void dc_prg_enable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
> +}
> +
> +void dc_prg_disable(struct dc_prg *prg)
> +{
> +	regmap_write(prg->reg, PRG_CTRL, BYPASS);
> +
> +	pm_runtime_put(prg->dev);
> +}

[ ... ]

> +void dc_prg_configure(struct dc_prg *prg,
> +		      unsigned int width, unsigned int height,
> +		      unsigned int stride, unsigned int bits_per_pixel,
> +		      dma_addr_t baddr, bool start)
> +{
> +	struct device *dev =3D prg->dev;
> +	unsigned int burst_size;
> +	u32 val;
> +	int ret;
> +
> +	if (start) {
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> +			return;
> +		}
> +	}

[Severity: High]
As reported by Sashiko on v8 [1], in drivers/gpu/drm/imx/dc/dc-prg.c, what
happens if pm_runtime_resume_and_get() fails in dc_prg_configure() when sta=
rt
is true?

Because dc_prg_configure() returns void, the error is not propagated to the
caller and the PRG device remains runtime-suspended with its clocks disabled
in dc_prg_runtime_resume().

Callers that proceed after dc_prg_configure() will then call dc_prg_enable(=
),
dc_prg_reg_update(), or dc_prg_shadow_enable(), performing MMIO writes to
PRG_CTRL and PRG_REG_UPDATE while the PRG clocks are off. Subsequent updates
with start set to false will also write to the PRG registers without clocks
enabled.

Furthermore, when the plane or CRTC is later disabled, dc_prg_disable() will
write to PRG_CTRL while unclocked and call pm_runtime_put(prg->dev),
underflowing the runtime PM usage counter on prg->dev.

Should dc_prg_configure() return an error code, or track the runtime PM act=
ive
state so subsequent register accesses and pm_runtime_put() are skipped when
resume fails?

[1] https://lore.kernel.org/r/20261030-imx8-dc-prefetch-v8-7-c4f81afd4533@n=
xp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-imx8-dc-pr=
efetch-v9-0-3b985e7636e2@nxp.com?part=3D8
