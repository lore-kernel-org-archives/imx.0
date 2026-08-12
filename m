Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1644D693
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541409; cv=none; b=Njh27wnFslMpbWk4jaHlIdmi6seshaYj8k2y87CXh8jfuLheyNwm4/fEQz+xuH8l4Zl97LM7q8nSm2MkK3FRawVIRx0tlS0LlGJJHRaHhhK3IvQ4YAx/O1hczEDaUhyFDUdUfeq1k/Pb0UuzIqptRchSXIqZXdcnm/3nqnsT5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541409; c=relaxed/simple;
	bh=Yst2QohBMPjiT0AbQy1GQCryFEO1Jkib4al4mVhPHyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aB5nkx0JxAN+6HDZHwtFZEsE04Yi/BhtC0CnVhxH6UyY7JXjhBWl4AEERLJWBn21XBIpMDHtMzLF5KhZeq3T+K2gio8Otgxxcl9ZYAjog8JxV3+Mh/wc6g/PwzSEPanx/ca6qSpfMlVfdcwxvmaoWz+KQddeTWUEWXrBk89T46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=R/pObcSj; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="R/pObcSj"
Received: from francesco-nb.. (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id 909141F901;
	Wed, 12 Aug 2026 15:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786541400;
	bh=o4ci6Yt4x+qcC68j9ptpwtaBjmWSWxJExDyogI+F3sk=; h=From:To:Subject;
	b=R/pObcSjdtF+gPpYc8T2GhMhHAyNHI9T8vnlapHvBBJHcBFxdkB6Y6qqmtWYMe3/K
	 fSC1RzFIcbhFFAPizk9CzuBGCjQUZPKDu+Sw0QIbRo49ZBxWUHJlbbItCL98eEDyhx
	 vNrnFBZdZui7a2JjQivqYMMJ13/djFeT4bWsDv9q7lQWyArsHgFjE0xIefLCMHaj7s
	 mDd4Icj3xK6jlS10wlp5UaTJG1lewGka+Hs30AJLY2HPWybpHzBcN2vgjbkYxmK55V
	 R1wC9HLw+fsAxAzlASy5qtgQSIOSoKgc30+tSAADSmRhWmi2zGk5omOXyiSFkPYFR+
	 8ZgGu0ZeNMAqA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] drm: mxsfb: Support LCDIF interface bus width
Date: Wed, 12 Aug 2026 15:29:48 +0200
Message-ID: <20260812132954.148571-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The width of the physical LCDIF output bus can differ from the input bus
format advertised by the downstream panel or bridge.

Such a distinction is required when the LCDIF bus width does not match the
width of the downstream display interface. For example, an 18-bit or
16-bit LCDIF bus can drive a 24-bit display by wiring the available color
bits to the appropriate display inputs. Configuring LCDIF solely from the
display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
mode, changing the color-bit assignment on the LCD_DATA pins and resulting
in incorrect colors.

Use the common OF graph endpoint bus-width property to describe the width
of the physical LCDIF output bus. Make the mxsfb driver derive the
corresponding media bus format from this property and use it in preference
to the format reported by the downstream display. When the property is
absent, the existing behavior is preserved.

Set the endpoint bus width for the Colibri iMX6ULL and Colibri iMX7 boards,
which route an 18-bit LCD interface.

v3: use video-interfaces.yaml
v2: https://lore.kernel.org/all/20260723093813.180089-1-francesco@dolcini.it/
 - use the common bus-width property instead of the legacy interface-pix-fmt
v1: https://lore.kernel.org/all/20260717121847.488148-1-francesco@dolcini.it/

Francesco Dolcini (4):
  dt-bindings: lcdif: Add endpoint bus-width property
  drm: mxsfb: Add optional DPI output bus-width configuration
  ARM: dts: imx6ull-colibri: Set LCDIF bus-width
  ARM: dts: imx7-colibri: Set LCDIF bus-width

 .../bindings/display/fsl,lcdif.yaml           |  9 +++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 24 +++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 12 ++++++++++
 6 files changed, 49 insertions(+)

-- 
2.47.3

