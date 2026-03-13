Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB0A3AE1B5
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416023; cv=none; b=dTX8yBv1KwOlcdSfJw6wpoieo1qTLkSrqy9z72g184HwatRZZWtjjNDc5uWtZuVoRiNXt9i+P0svEXF93Waj+daOWB/WZl/QWYxjHfkxqC8SxM6tlmNMWSW0U7v+uiwn16aiu8ZPjR70seuvp/qnNryHrfj1b7DP06/SmcJwsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416023; c=relaxed/simple;
	bh=XnHuZnTUEeQK5Y31dfsA28NCa/bdjm5OsuCh5Czs9og=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BfbMZJ2l5l6h0WsfmyMK/aoPTzLDHihjQsL1JT8FBmF722FYyCDS/dMDn0804dcIv6BxHVDXi0Fh0lqNfuX64FM9h/AmQNeUY049Il5XbjORPY+CIg8/Dq6LKWI9bjVOST0F3fcfA8wPfroJAxRMDfY65AUUiqSDtrQylFAZegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14W5-0001sU-Dh; Fri, 13 Mar 2026 16:33:33 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14W2-0006Mm-34;
	Fri, 13 Mar 2026 16:33:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14W2-00000000El6-3cWe;
	Fri, 13 Mar 2026 16:33:30 +0100
Message-ID: <7b2aa2c742f41e376ffe8865e3a2cd9c53843574.camel@pengutronix.de>
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
Date: Fri, 13 Mar 2026 16:33:30 +0100
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
