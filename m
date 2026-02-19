Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5919E992
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500790; cv=none; b=Zzaq4/sDdRGClQQ4ZUFMwqt/YOWiyM8vQyy+lyg/o+YATCUxaBMgvDJgc7SWIz/P5PAE13l6G3v3D+19JHCV8UEKx60nMiScrVeQ6taOSHKeKtR6vznzmuLSwc3CWIbNym8ZmtYYQbk7vt1/aXL/gzJDJKy/5GTnh0s1T3mg+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500790; c=relaxed/simple;
	bh=Vu7BBrvvjs15JAyV3gEB5F1mIMdhP1AyJAkkLjeTOq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=USlLpLazsdyl++fXdnUMw5jsRgBzilxXGhxip3Kny3+96FCFZq8cn8mdztgd1ueVmBv86gDFcLJJLc5zb8OJbyQKM5SM9SieXOSz78q9F1zmsJAbs51puKQCBzGhhpLMuILnxDBnedgo+v+2iJkHzol57xaeuMO2nMDzClaDahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-DF; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/2] drm/imx: ipuv3-plane: support underlay plane
Date: Thu, 19 Feb 2026 12:32:56 +0100
Message-Id: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOj0lmkC/4WNQQqDMBBFryKz7pQktUK76j3ERcyMOqBREhVFv
 HtTL9Dle/DfPyByEI7wzg4IvEqU0ScwtwxcZ33LKJQYjDKFMrpACgPKsOHiiUNvd5x66xnzQrn
 avYgezkIaT4Eb2a5wWSXuJM5j2K+fVf/s3+SqUaEhV5NuKOfm+ZnYt8scRi/bnRiq8zy/6fhSE
 8EAAAA=
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
Changes in v2:
- Simplify check for primary plane
- Rephrase commit message of Patch 2
- Link to v1: https://patch.msgid.link/20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de

---
Michael Tretter (2):
      drm/imx: ipuv3-plane: decouple zpos from plane type
      drm/imx: ipuv3-plane: support underlay plane

 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)
---
base-commit: 20e0c197802c545db220157fafd567a10f2b7672
change-id: 20260216-drm-imx-underlay-plane-460cbc9dd3ca

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

