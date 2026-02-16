Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC72367CF
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245882; cv=none; b=fA20AS2vENAZg8onYWIFiisLkH14dqBJeLMRWxOkwEOu5TtiFNg6QNefLXvxCQM4W/amzn0NVlBz/eaodEdnpzfzzuIiXz9fgh8qR46+JDHCg7GGmNOCZ25ifo0+Segg8hT7SrpJIzptRzAOvK714Wc7XYc9s69+jdO4cOg8DYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245882; c=relaxed/simple;
	bh=AWx8EX0DAwkFni+yaMu0i1aqJ3u2o0VX8Xvk1C+VP60=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FeICWFL0uf1/EQLfiHV+hFq+RzcwRF3dHFRWaEcmu85RNIClKhrI3btZZQ70zuLcy5MI5lVuGZGtAKwWgQTS4cLhoej1dNmZDg8cOh67rFSJzUKhlZ4HMssgWLlXbokX/RIxt6SEBzY1A7mrkGKkrezb/m9U+IZkE22jiY79RZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-Fj; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] drm/imx: ipuv3-plane: support underlay plane
Date: Mon, 16 Feb 2026 13:44:29 +0100
Message-Id: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0Rk2kC/x3MQQqEMAxA0atI1gZqlYJeZZhFbaIGtEqKooh3t
 7h8i/9vSKzCCbriBuVDkqwxoyoLCJOPI6NQNlhjnbGVQ9IFZTlxj8Q6+wu32UfGxpnQh5aoDh5
 yvCkPcn7j3/95Xnh548hoAAAA
X-Change-ID: 20260216-drm-imx-underlay-plane-460cbc9dd3ca
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The IPUv3 overlay plane may be placed over or under the primary plane.
This series allows user space tools to properly detect that the overlay
plane may be used as an underlay.

The first patch removes the assumption that the primary plane has the
default zpos 0 and the overlay plane has zpos 1. This allows changing
the zpos more freely.

The second patch changes the default zpos of the planes. The primary
plane always has the fixed zpos 1, which allows the overlay plane with
zpos 0 to 2 to be placed relative to this fixed primary plane.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Michael Tretter (2):
      drm/imx: ipuv3-plane: decouple zpos from plane type
      drm/imx: ipuv3-plane: support underlay plane

 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
---
base-commit: 20e0c197802c545db220157fafd567a10f2b7672
change-id: 20260216-drm-imx-underlay-plane-460cbc9dd3ca

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

