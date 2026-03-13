Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1883B3BE8
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416081; cv=none; b=PtgsQEy5f3ob78HGsMEzdahTVa+k9JDAKhwh4BHRy3wJfPMf2MsNL7RGGIcGlqlmKLeTASW+pNAzVteasOfHOzGhW+eYq3ttA7ddKkt0JoomnHyiGZnYtLaOv3KAKObkvGnY1wMfzu5eRgefhmzd2gkGlVxB8VWzhDGm1JhVPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416081; c=relaxed/simple;
	bh=9bvBheqdeJ2ipb8ko8HOYY80bRoF3r4VQrqwGWQ9n98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U3EBeUCzocHNb+OjnlMI4CoBSws7yCCeUnApMY1x4Y9X4oj+2MlLPZ9JOiNK+SmTR0caxb50/lFDqTYkars1yDB4cUsccTTIYt4fx5WSJZ4Uo/VRSFMNPbcSt2Uq/52s2jNB771JkpV1zB/C5MF0tFfRT37W0RD/kOryaErAmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14X0-00029Y-A2; Fri, 13 Mar 2026 16:34:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Wz-0006RK-15;
	Fri, 13 Mar 2026 16:34:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Wz-00000000En3-12Wn;
	Fri, 13 Mar 2026 16:34:29 +0100
Message-ID: <62df7303bfb508e00d02b14ddbe4f4d70349ad95.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for
 DRM_IMX_PARALLEL_DISPLAY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@ginzinger.com>,
 	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Fri, 13 Mar 2026 16:34:29 +0100
In-Reply-To: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
References: 
	<20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
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

On Mi, 2026-01-21 at 11:26 +0100, Martin Kepplinger-Novakovic wrote:
> When I build for an old imx53 platform I see the same as the test robot
> saw before:
>=20
> arm-buildroot-linux-gnueabihf-ld: drivers/gpu/drm/imx/ipuv3/parallel-disp=
lay.o: in function `imx_pd_bind':
> parallel-display.c:(.text+0xb8): undefined reference to `drm_bridge_conne=
ctor_init'
>=20
> Selecting DRM_DISPLAY_HELPER for DRM_IMX_PARALLEL_DISPLAY fixes the build=
.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512241721.jZgcwRfr-lkp@i=
ntel.com/
>=20
> Signed-off-by: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@g=
inzinger.com>

Applied to drm-misc-next, thanks!

[1/1] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for DRM_IMX_PARALLE=
L_DISPLAY
      commit: 02df94d98ff837074788ce921edf67707dbad404

regards
Philipp
