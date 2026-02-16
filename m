Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515024BBFD
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247932; cv=none; b=PN2Uf5T8nk+Q3lf9L2MggED0+bAW3xifqQ/d/ACP4c0OMDPDywgyrIxgquelYSm+xAUXh/Yhp+iQai4iLiKDXNyanYyV9hzZFLz26FFn80DQBLJbXfa5O3wF1bMFcskixBgofDhXYzcco/tNJZCSB1ePgQ7NKYypBbkpdwUsJec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247932; c=relaxed/simple;
	bh=2FOXY01qImF13CzucPq7HxKF0/p0kTtyasUSZGXU69E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CU+CAT2bFQI7xc9WFaVcifRSmrAMEoCx4cbml+12zsnqU7Y4LBwDD6ZwI9rGiy3ZD9cbJBOz5ezEuuZfWDxslgehifjlbzIj5utKz/D9IjcdXGyc7yx/Y8QWSaTqHXdU5uvIJCSFsS737yuXB8DiAaRCjJxhv+FGTMGSDFnJHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUs-000740-AH; Mon, 16 Feb 2026 14:18:42 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUq-0014Zg-10;
	Mon, 16 Feb 2026 14:18:41 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUr-00000000C1Z-2OoU;
	Mon, 16 Feb 2026 14:18:41 +0100
Message-ID: <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Feb 2026 14:18:41 +0100
In-Reply-To: <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
References: 
	<20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
	 <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Mo, 2026-02-16 at 13:44 +0100, Michael Tretter wrote:
> The IPUv3 overlay plane may be placed over or under the primary plane.
> Use an immutable position of 1 for the primary plane and a mutable
> position including 0 and 2 for the overlay plane, to allow placing the
> overlay plane over and under the primary plane.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/im=
x/ipuv3/ipuv3-plane.c
> index dfd036f3195e..ddad5ea92aad 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> @@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *d=
ev, struct ipu_soc *ipu,
>  {
>  	struct ipu_plane *ipu_plane;
>  	const uint64_t *modifiers =3D ipu_format_modifiers;
> -	unsigned int zpos =3D (type =3D=3D DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> +	unsigned int primary_zpos =3D 1;
>  	unsigned int format_count;
>  	const uint32_t *formats;
>  	int ret;
> @@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device =
*dev, struct ipu_soc *ipu,
>  	else
>  		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
> =20
> -	if (dp =3D=3D IPU_DP_FLOW_SYNC_BG || dp =3D=3D IPU_DP_FLOW_SYNC_FG)
> -		ret =3D drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
> -						     1);
> +	if ((dp =3D=3D IPU_DP_FLOW_SYNC_BG || dp =3D=3D IPU_DP_FLOW_SYNC_FG) &&

These checks is not necessary anymore. The only overlay plane is (dp =3D=3D
IPU_DP_FLOW_SYNC_FG).


regards
Philipp
