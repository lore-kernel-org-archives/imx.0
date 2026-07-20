Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B325383983
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563223; cv=none; b=huSwhLk/18TNfrUBSjkla01kw5dNZVpM5Y0Bi6uaFsZUgB1t0rX/Aa4Zz0WU980/V0YvxmNgT7PSxIbWEG85Bu684tC821FHs1UmpDpHxY7t5p5tuaEf8iMHk6qAVcmRvgfO3EYYtmZQ8fLaKWBbaKOatuqIBMGou1H1mbFgReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563223; c=relaxed/simple;
	bh=EsSQroHh481bu2cEKzRSpxZ6PzAFmcLUfnJ/ybNxzdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jk9d+uCJvFJiLTo8fQMsXnqyaoXtFDaWopRTaoz5ym35PzOym93DdSFTMQOJ+7Jzze4N83Pkul+sxLA/ZJh2yAK2xFPSj3STXbjDcXW9cq4clKhnZ9hoowtzZSnCQnEBcVgwg3huI6CeXJVkC4OQL/uY2wpvLwHYJIqVH6ShOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAq+Qpxt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAq+Qpxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2561F00A3A;
	Mon, 20 Jul 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563222;
	bh=4LlIpLHzPCnxK1ITIZgjXOXeMb70YEarXXhHjS20X7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAq+QpxtYaFDOr4ryR+MRNSzY7HcYB1s63Kw9QI47Sx5xekr9a0l6JI6wBSmsLZSG
	 e4uYwH7m8N/T6t7kiY341kRnaeFZ9rJK30eZ9QGtuX/QLq5nCnXczELM45iRAFn8Fs
	 PQvy9A0Nj3CraKtBkY2vEzDf5dL/SodKOckX4N1IoMwKrbEvdtnNd0zj0TCxTXV1oT
	 jXq0NhsCvDbcMXwi9152R4PSQv117feCzYuzpkz1z1SCu/NEeoGYcyAkDTrgCaZJaj
	 AICazzkGUZQfDz6kRptebqbD0H9Vpu55AqmbffgY5PIYE0rwixcPu0yVdtVLabiFTV
	 QEd45yFUTAYeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: imx@lists.linux.dev, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 16:00:21 +0000
Message-Id: <20260720160021.8D2561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled return value of drm_connector_init() leading to potentia=
l kernel oops on allocation failure.
--

--- Patch [6]: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple=
 helpers ---
commit c3e48910730cab2ede63c55569b1ea2f386b9c60
Author: Diogo Silva <diogompaissilva@gmail.com>

drm/virtio: remove dependency on DRM simple helpers

This commit removes the deprecated DRM simple KMS helper dependency
by open-coding drm_simple_encoder_init() into drm_encoder_init()
and correctly checking the return value to prevent silent failures.

> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/v=
irtio/virtgpu_display.c
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c

[ ... ]

> @@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_devic=
e *vgdev, int index)
>  	if (vgdev->has_edid)
>  		drm_connector_attach_edid_property(connector);

[Severity: High]
This is a pre-existing issue, but looking at the context just
above these lines in vgdev_output_init(), the return value of
drm_connector_init() is ignored.

Since this patch corrects missing error handling for drm_encoder_init(),
would it make sense to also catch errors from drm_connector_init() in this
same function?

If drm_connector_init() fails (such as from resource exhaustion), the
connector structure is left uninitialized. Calling drm_connector_helper_add=
()
and drm_connector_attach_edid_property() subsequently will dereference this
uninitialized state, which can lead to a crash.

> -	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
> +	ret =3D drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret)
> +		return ret;
> +
>  	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-drm_simple=
_encoder_init-v2-0-5020b630668a@gmail.com?part=3D6
