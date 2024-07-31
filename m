Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A271A7F73
	for <imx@lists.linux.dev>; Wed, 31 Jul 2024 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431603; cv=none; b=sl0r0w8CUo14G5bcGjG3BoBkhvr7iIQwHBottoAqSmkuowwQ0m2t/l1U1ULJnQuPvgB/EhI0y3QQe2Y1q7ELHovtwio/hECky+IkelFzAe2qU/Qb8jahEADu4Qv78BDfQIs+hF8fJBrVKQz7R7jFyDwu04YzpFD0boy9lM71q44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431603; c=relaxed/simple;
	bh=dV9KdtfBSYpIAf4v8QDqlQQtQ0aBT6+oDvGxdIzO3rg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HipU382HfYubDn86sFLVcVBhjmJmbLCLJi9AEtGKqjZFASB4gkaHscu7Smc+yo238xWIQ44xVEHAJ5Xz5dUd4xHJfrTWCZ+RRN28GLZA5xNGJdCXna1UDIj9v0ZbLiYtSFSboEQ/lLcRVHfCSgUJul5l5gbEn6r2SFx3AyGfU8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sZ98I-0002IM-JL; Wed, 31 Jul 2024 15:12:46 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sZ98H-003XP9-50; Wed, 31 Jul 2024 15:12:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sZ98H-000AP7-0D;
	Wed, 31 Jul 2024 15:12:45 +0200
Message-ID: <e4cf5a6a2be51fe9c7fff54e30cf3bd6f1d3534e.camel@pengutronix.de>
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 31 Jul 2024 15:12:44 +0200
In-Reply-To: <uqsnphe2pm366xenpdvtsxvpkiewgmxoqyv2zvbgc3ewlx23mp@guesbce35jcm>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
	 <uqsnphe2pm366xenpdvtsxvpkiewgmxoqyv2zvbgc3ewlx23mp@guesbce35jcm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

Hi Dmitry,

On Sa, 2024-07-27 at 14:17 +0300, Dmitry Baryshkov wrote:
> On Sun, Jun 02, 2024 at 03:04:40PM GMT, Dmitry Baryshkov wrote:
> > The IPUv3 DRM i.MX driver contains several codepaths for different
> > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > panel and the legacy display-timings DT node on their own.
> >=20
> > Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> > upstream ever used these features), switch to panel-bridge driver,
> > removing the need to handle drm_panel codepaths separately and finally
> > switch to drm_bridge_connector, removing requirement for the downstream
> > bridges to create drm_connector on their own.
> >=20
> > This has been tested on the iMX53 with the DPI panel attached to LDB vi=
a
> > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > linked directly to LDB node and the display-timings node).
> >=20
> > To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
> >=20
> > [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.=
com/
> > [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a=
6c382b422@linaro.org/
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v3:
> > - Notice (soft) dependencies in the cover letter (Chris)
> > - Select DRM_BRIDGE instead of depending on it (Philipp)
> > - Dropped unused selection of DRM_PANEL (Philipp)
> > - Added missing include of <drm/bridge/imx.h> to parallel-display.c
> >   (Philipp)
> > - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d=
81c1d1c1026@linaro.org
> >=20
> > Changes in v2:
> > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e=
104f05caa51@linaro.org
>=20
> Just a gracious ping, this has been without maintainer's review for
> nearly two months.

I don't have any active i.MX6 projects right now, which increases
latency. I'll get around to reviewing the remaining changes and testing
on i.MX6 this week or next.

> Should we change ipu-v3 to the 'S: Odd Fixes' state?

Odd is on point, but fixes-only doesn't really fit.

regards
Philipp
