Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4D274FF5
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952022; cv=none; b=bTwqqdblbNU3rBthJdhxsO0pnh6Vrhg8Btg71zFF6Lrd62j2vUdYWrovrMUSYQfyDzqxnc7hxYQEbymlJ5DQLr1xtn2BTp07e8V4FaZ9Y99EjRmr2oxEUqYAzVPL3VisbhycpcXl7sTqtB7BeRpUYOnAag9zfl2kDJEqeF2pdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952022; c=relaxed/simple;
	bh=J7U5vr71PjnmpF0GEDJIKhM5IAVtjRlOUbsok/ewjhk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=meeUC3fiodxVjb3Kky9qRvTZzHCzr8yIIZzPybW1S/uoRve9ltzyvwW4PT8TFYESoEEXJlHqxaOJ5VGgBaw+PAiTkG78OhQojG01gkHH+zGSwXGkECZ5O7guXeUgJfgWtux1G1AfEKuvtyczUQDNobOWIgr4zTYxG5O1m49DLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALm-0008Fb-P4; Wed, 12 Nov 2025 13:53:26 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALl-0005O1-10;
	Wed, 12 Nov 2025 13:53:25 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALl-000000006wU-0wU3;
	Wed, 12 Nov 2025 13:53:25 +0100
Message-ID: <782dd8af786ff402fa8b334264f189be2919d7a7.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx/ipuv3: Fix dumb-buffer allocation for
 non-RGB formats
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, 	maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, 	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Wed, 12 Nov 2025 13:53:25 +0100
In-Reply-To: <20251104153832.189666-1-tzimmermann@suse.de>
References: <20251104153832.189666-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-11-04 at 16:38 +0100, Thomas Zimmermann wrote:
> Align pitch to multiples of 8 pixels for bpp values that do not map
> to RGB formats. The call to drm_driver_color_mode_format() fails with
> DRM_INVALID_FORMAT in these cases. Fall back to manually computing
> the pitch alignment from which drm_mode_size_dumb() can compute the
> correct pitch.
>=20
> Fixes userspace that allocates dumb buffers for YUV formats, where
> bpp equals 12. A common example is the IGT kms_getfb test.
>
> v2:
> - ignore width in calculation
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b1d0e470f881 ("drm/imx/ipuv3: Compute dumb-buffer sizes with drm_m=
ode_size_dumb()")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> This patch is based on Dmitry's fix for msm. [1] Please test.

Thank you,

[IGT] kms_getfb: finished subtest getfb2-accept-nv12, CRASH -> SUCCESS

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

> There could later be a helper to contain these aligmentment calculations
> in a single place.
>=20
> [1] https://lore.kernel.org/dri-devel/20251103-drm-msm-fix-nv12-v2-1-7510=
3b64576e@oss.qualcomm.com/
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/i=
mx/ipuv3/imx-drm-core.c
> index 465b5a6ad5bb..eddb471119c6 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> @@ -144,7 +144,6 @@ static int imx_drm_dumb_create(struct drm_file *file_=
priv,
>  			       struct drm_mode_create_dumb *args)
>  {
>  	u32 fourcc;
> -	const struct drm_format_info *info;
>  	u64 pitch_align;
>  	int ret;
> =20
> @@ -156,12 +155,15 @@ static int imx_drm_dumb_create(struct drm_file *fil=
e_priv,
>  	 * the allocated buffer.
>  	 */
>  	fourcc =3D drm_driver_color_mode_format(drm, args->bpp);
> -	if (fourcc =3D=3D DRM_FORMAT_INVALID)
> -		return -EINVAL;
> -	info =3D drm_format_info(fourcc);
> -	if (!info)
> -		return -EINVAL;
> -	pitch_align =3D drm_format_info_min_pitch(info, 0, SZ_8);
> +	if (fourcc !=3D DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info =3D drm_format_info(fourcc);
> +
> +		if (!info)
> +			return -EINVAL;
> +		pitch_align =3D drm_format_info_min_pitch(info, 0, 8);
> +	} else {
> +		pitch_align =3D DIV_ROUND_UP(args->bpp, SZ_8) * 8;
> +	}
>  	if (!pitch_align || pitch_align > U32_MAX)
>  		return -EINVAL;
>  	ret =3D drm_mode_size_dumb(drm, args, pitch_align, 0);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
