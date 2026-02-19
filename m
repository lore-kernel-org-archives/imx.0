Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC023BD06
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502018; cv=none; b=muengcsKm789zFU5hMAk351XfPB+RjMHifgKC4JI8OW5d1BiHCzbQ22FBUf9XYh+oAwW2eJZZDaidP5oh0ZUNsFTVDx1/F/xzFGsXk7qPXQWZIzYXAygoK87WaakBRudxYPSt4PqIOtHmsyO1ZoW7uINZLXYbigcelgsMMAkP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502018; c=relaxed/simple;
	bh=It1cnUeblMv4aKkW3gQRXN4R7v1k5BaYmbj4cuMduSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nXKu0bQ9s+7OYpyi1OphZyECiv4BMJHr1hJ5DHB/lfG4gbnu97RTjSRNvyIc3GKBzS7XUBBkvEEIlZQQ8BqxMd4prMyhPhVgmrpe8nqw53mCtKhYHJ+8VPi/zyZDfxTqfaJQu9GOXff9QqfjNxr7DEyeBJqWl82FPBvTD6ZI2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt2b4-0005JW-5a; Thu, 19 Feb 2026 12:53:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt2b1-001ZRU-2t;
	Thu, 19 Feb 2026 12:53:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt2ay-000000009AB-0bi3;
	Thu, 19 Feb 2026 12:53:24 +0100
Message-ID: <6ac45d8a3d212f9ef0ffd6f09e154900b5f1347d.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/imx: ipuv3-plane: support underlay plane
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Feb 2026 12:53:23 +0100
In-Reply-To: <20260219-drm-imx-underlay-plane-v2-2-26ef829c5483@pengutronix.de>
References: 
	<20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
	 <20260219-drm-imx-underlay-plane-v2-2-26ef829c5483@pengutronix.de>
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
>=20
> Set the zpos of the primary to an immutable position of 1 to have the
> possibility to place the other plane underneath it.
>=20
> Set the zpos of other planes (the overlay plane) to a mutable value
> between 0 (the lowest possible value of a zpos) and directly above the
> primary plane with the latter being the default.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
