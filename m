Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997D283C89
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762961; cv=none; b=LeJ3zSoi0p8tIyMGxbhEh7+A5cfiqb/E/Y/9qIKHdebkod4F9BaGypEyY1+yPpuKAJAJz1JOeH5Eu2Lw+QtPhSv3fQ74pd0Bi+Ni9nkfPFyRx6PUvmY034Eei0s+cowIoCsZ41TsGf09z2ElAjJiZ3JXG8hBwcmokqfEk8cZPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762961; c=relaxed/simple;
	bh=0x1mh1CUV2l+e+f/ZCeKWLagQRBONAQXNtZB1coOUYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nIYBogCi4egb/EJRfXehYE9+lAIzyJsf5aNj851JMGhYHv4rQP419MhnBpTTfGoznXVPFf6VJfKpxrmYhFz70BGpe5R9u/3cG21+X24Lao9sry0UvsoPBuw2Kaz8KvFOQEQswyVOqKDs+hpK+P1u7csdE/dOHqYj/c7YVv8NJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1up096-00073K-Sg; Thu, 21 Aug 2025 09:55:40 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10" variant
Date: Thu, 21 Aug 2025 09:55:27 +0200
Message-Id: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/QpmgC/x2NywrDIBAAfyXsuQsqNY/+SslBzNpsS1TUSCDk3
 ys5DXOZOSFTYsrw6k5IVDlz8E3kowO7Gv8h5KU5KKG0GJXE2qMcsITIFnk7xi1i/oWKS8n43Uv
 Y7YpSsG+YyE3OmEFr+YQWjIkcH/fsPV/XH3upHv58AAAA
X-Change-ID: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 10" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Steffen Trumtrar (5):
      dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      drm/panel: simple: add JuTouch JT101TM023
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 10" panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt101tm023.dts        | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++
 6 files changed, 120 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

