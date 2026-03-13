Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A43AE1B4
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416129; cv=none; b=Xt0eWvkAcTemep0Fcz5I759XexHhhaVlPJmVeSpKwvln9qeJJrKHMV1Asxf1PXEUmNzuQTGgkM5mrvio5l8vQ18E7B8j16sn2OS99cdhbTDyRaouMQ6N8d76Ur1jWhiPwDwqmGLg5fYfMOh41p1FAUBi4GiUMNPrGo3vcUGSX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416129; c=relaxed/simple;
	bh=K6KG1x7DxkR1WlKEcebJDyBZXyYIGZ6cVEJVg4exywE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KR5vWIJP5b5Tyh/oAiSAz9DoMuKoTpzox65mFqc5ZGaPzTmvAkpL485p49Gqh/STyV6+djl24GcX5+6J6jyt+i/QANRYQp/xsSEWmFnp/XDmh+m6dYrWOg9wnZuofbI9ZOK9bE6Sg8eiWmZ4NUuswDrZBToYLCx+3gvxjdX4wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-0002MH-Ua; Fri, 13 Mar 2026 16:35:20 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-0006RT-0u;
	Fri, 13 Mar 2026 16:35:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-00000000Ep8-0oQK;
	Fri, 13 Mar 2026 16:35:20 +0100
Message-ID: <3d65ce5f3f6217e68ce6be3bb75ae722ba9bc151.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm/imx: ipuv3-plane: support underlay plane
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 13 Mar 2026 16:35:20 +0100
In-Reply-To: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
References: 
	<20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
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

On Do, 2026-02-19 at 12:32 +0100, Michael Tretter wrote:
> The IPUv3 overlay plane may be placed over or under the primary plane.
> This series allows user space tools to properly detect that the overlay
> plane may be used as an underlay.
>=20
> The first patch removes the assumption that the primary plane has the
> default zpos 0 and the overlay plane has zpos 1. This allows changing
> the zpos more freely.
>=20
> The second patch changes the default zpos of the planes. The primary
> plane always has the fixed zpos 1, which allows the overlay plane with
> zpos 0 to 2 to be placed relative to this fixed primary plane.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Applied to drm-misc-next, thanks!

[1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
      commit: a872e90e3668f9f8d0bc9c2fae3c328835b98bf0
[2/2] drm/imx: ipuv3-plane: support underlay plane
      commit: ecbcceea4767dc11881986cb41a9962cac6f6c39

regards
Philipp
