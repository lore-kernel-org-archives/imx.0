Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120A1F2B8D
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290743; cv=none; b=UrupRL945spDvD1n3n/+LjKXrYaGSG6kgo1kKLbYzHLmE23uZc3f3otQunDKMq51y7dJmeW/kxI0LI7oHkMoxbFEzpwMV2M89I2KxmHjBnyWpX1bzek+Q9RdAKb9lf6v3gJMb+4XYDFVD5uCG5aKSI0PqI6l5TMTijcG1wFqkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290743; c=relaxed/simple;
	bh=En/md4F1d/ATpA7RFhW6jaD9rtbHH8ZUfcSZl3WkTSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eq5GKxxBu6obfNzsuvUpoaLNp0Rg6RBAgzCET3gflIYcpCGqk+7fPJrMeqW8uNPdyITaGbXWzu+HCp9F/2bCryhs1p4+tCpk7OR+syJFxjRQ9xO41v2sHJoF3IFqO3mEcgUV4lCaA984gJSRcj/bM9Vxthat+t3FwaNnmTUNlrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KLuku6X9; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KLuku6X9"
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id A4E592272A;
	Fri, 17 Jul 2026 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290738;
	bh=EFuCLGYMCnbLRMYIZ0CTwCE+ic9FazVUGAB/i7iYseA=; h=From:To:Subject;
	b=KLuku6X91PrAs0AOGADuKz5arzfCbtAJqY5ng9vV0eawIWYzYGb3JlG482A5xiNMq
	 b6dq/rqrNa0J0i60ifq1FN/uk50KAQ0mK5tL3/5kQxfpFqmCtkfFVa7XeZ4rrY3clH
	 GR4+CaOY2p4OKugbynGzNcgEYbQClsWRoUcbxvMlV/faqkVEbBWgpgPc9IWq2baY9C
	 IEJbL8elGkMNbCyRLJROMUC6UMdY47othoDhkUWLOB/mBU4uTPwFwibjplp2/vxOrN
	 oki7t6a9U2w/renqrbI4QRBsd2zFD+u/JO9mR+n9E9VEpfHsrVw5RUZWg01gbDdS83
	 UawJFAodslSVA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] drm: mxsfb: Support LCDIF interface pixel format
Date: Fri, 17 Jul 2026 14:18:42 +0200
Message-ID: <20260717121847.488148-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The LCDIF data bus format describes how color component bits are assigned
to the physical LCD_DATA pins. This is a property of the LCDIF-to-display
wiring and can differ from the input format advertised by the downstream
panel or bridge.

Such a distinction is required when a narrower LCDIF bus is connected to
a wider display interface. For example, an 18-bit or 16-bit LCDIF bus can
drive a 24-bit display by wiring the available color bits to the
appropriate display inputs. Configuring LCDIF from the display's 24-bit
format in this case selects the wrong LCD_DATABUS_WIDTH mode, changing the
color-bit assignment on the LCD_DATA pins and resulting in incorrect
colors.

Add the optional interface-pix-fmt property to the LCDIF binding and make
the mxsfb driver use it in preference to the format reported by the
downstream display. When the property is absent, the existing behavior is
preserved.

This follows the approach already used by the i.MX IPUv3 parallel display
driver in drivers/gpu/drm/imx/ipuv3/parallel-display.c.

Set the interface format for the Colibri iMX6ULL and Colibri iMX7 boards,
which route an 18-bit LCD interface.

Francesco Dolcini (4):
  dt-bindings: lcdif: Add interface pixel format
  drm: mxsfb: Allow optional LCDIF interface format override
  ARM: dts: imx6ull-colibri: Set LCDIF format
  ARM: dts: imx7-colibri: Set LCDIF format

 .../devicetree/bindings/display/fsl,lcdif.yaml   |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi   |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi      |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 16 ++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                |  8 ++++++++
 6 files changed, 35 insertions(+)

-- 
2.47.3

