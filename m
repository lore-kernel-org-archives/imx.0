Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866B442390
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789945; cv=none; b=beKU+K9wQRJZTR5AIGRWQzNkiz1xwcYnjoYKbMGr2QfMgsbbwG+O5T9H1PLk++G7uzd06z6LgizfKbwMC8NyDz813S9bqTo10UWMCBF47Lk70GqWm8PU1BELlPmO2pzu1dw2c1C8hXeQoDSfsA+AxhTU13YeiraY/GrRg6U/bQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789945; c=relaxed/simple;
	bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t0B05nt0ug6iXMUPMtUsfLcKYNkG9NXSzCNYrxZBWjMfS5422Xte58nNGJ0KhfUD6uVMEtrOWbvPlRv1TLsTgTCY9Fy6LyyK2R8qAPauvrQIrYFgf9IuyqaFEFNe9CJDg0sj6Emb0k8y7fl4GZDK2jpRLx02Iwq/IwYhx84STDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ah38cCz4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ah38cCz4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a020e65269so8879595e9.2
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789942; x=1792394742; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=ah38cCz4soZYaQCBlHK0a3i8i6fMEpMGNH5GybbA3D5cZ9/2drdfBX6M4r0Rul5/Bj
         2Qt86yfKo3iBjRGnIHVvZaC9Qaf5lT8NlPPgMqz1w9dJD/M7rXzPNusAYSxuE3fWGoer
         pwsJHjiQTAO+UsgdkF3NMw22dLYs5FhiOOolXUpAsJD7mMkb2Jp2C2Ix+Cxe45y0Rhml
         a44XXWYbfaeOkStlkNuowmkfzgNLF16cj62f7maobSw2crC2IOLqU9noUSpGgazvdWU+
         fCP+ec7BcGTndBNWrD4BkVPSy/Owl1l3FKY/OI9WRvKPO+QhNcAr9tv7AbIT/H8V+fKC
         nkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789942; x=1792394742;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=ffAReFOTz3S35i3PPqv14edBFPMNkmHpKeCZqxlIIM4zvC7qiMh/Fi/74wL/n7QCR0
         zxr9hrJnqIm3/NIKVSYlt/xp6+U+rkupHfChJqkFTpfuRW3Hym1aBQImhtBbBtp/7PQf
         tqXV8WHDOf/0Q71+TijaLv43h/9jYIlDhlarTftGPq0n252mnGwRqT1qeETl7iTiXx25
         kAuDT4g/2i1H3OyxIqzgugVz28Tb8QvWHKiuvNY62QRZWzxcAko+dsR1lz/ldQ05DvEa
         HjLMSL1zTAsbxt/85tkg9WGeWW4ZnGbucvkgcMoxuLFar/GqQQJ2OvygZtT84J0/fw/3
         06fw==
X-Forwarded-Encrypted: i=1; AKwUvBwOJfmnfpnYAgvnnNz8KEcIUT+jYqVVk7TSzmWq+lbjpyDzeRdJuC4WpHCcxvEyaOGuO/k=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRk2YKHyTUtM+jRdJJUdfQH79EUscv1fnK+pvWo8cxc9GXn6l3
	RfEBQwmOiLIfB+S4pv0QyI1Hjl3SMtAgTlW5qUsD7YT4t4UiwgrUub+Z
X-Gm-Gg: AYBFou1szhl9Oi+SzWW2aKaTjM/WYOrdS4Yb4Y6h9BBrP6gEtbw4m1Uyz9sz8/J+Cyn
	m4tgVj/U6uhmyF7UFECGO1sZlg0p/tPex8kJBc73JfReTsrabU5ZKLbXF6/2MAFP8Wp8+KnzU/p
	nP5oQQhX1wapZXjgFlYGs6AKyvGiKpMmYMySWiZw4eYx1DzCPqtDQmEYQB6B/jhSyYqtwjY1ChT
	7runMwxeZaW9r/+0aQzyd9Y7YKMbBULEXYj1eWDyLhHcENrXBhm9CD1GsK449EBI4DKgpD9mgbF
	exaQodv04DJwOmMu5JU/sh5jLnwZVIaaP11szKCwEY9fI6SR/SDxEwCFX+0AGUn+NkGI8rZtQCg
	GYlcTu6x9Sez6kJBjQVxnJcMRPEDRBkjPtLM7zmCQeOCg3ChnyIB1seT7/0GAVADWhbRDD1dN2H
	yBSDLaYKw91jnue7GJ5MiVRwAmtNshnu/8WOwyMgSZUbmp8amJdNJA+TC4EMDjeUd4foP5NfERT
	74Bt7yfL5iwWQ2hYPxsk+PdpfI1c+D9mR2Vt3vBG1uN3vNH8onvuk3ftwtx48+x
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr158677175e9.14.1791789941611;
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add VGA support for Apalis iMX6
Date: Mon, 12 Oct 2026 04:25:22 -0300
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKLzGoC/x3MTQqAIBBA4avErBtII/u5SrQYa6oBs1CQILp70
 vJbvPdA5CAcYSgeCJwkyukzVFnAvJPfGGXJBl1pU/W6w6SQLnISUY7bIHuyjjFthM3cWjK2brq
 VIfdX4FXu/z1O7/sBKq18SGsAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1908;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
 b=6Na6Gpe9E1PvitnwV+dpCDK0x8whlxg3tt6LUG+45ePWH6KHyR7uTPCZpXJvoHbTKeZQq5b6z
 YhrD1XfpN2gDC54bNXQKOrMjPmqjFju0acH+K48bnab3b0Eu3MBtE5u
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add a new compatible for the bridge in the simple-bridge
  binding. This is necessary because the existing dumb-vga-dac compatible
  doesn't describe a data-enable signal polarity.

- simple-bridge: Add the VGA bridge match-table entry and timings
  struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
      drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
 4 files changed, 111 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

