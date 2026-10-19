Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345504CA789
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405232; cv=none; b=jWCZF2r0kw0C3Yf7Lgvpgur8672LNHLuIM+mKzzQRsC4la3XQkEHThVaEYplqcSfesB3SAX64y9Z7y/GMZr7JZY1QjDLZpVU9JkplxIVEdeM0fL6gp+kVoIfU/KuIP+bZD2bfnezXz3OvvrJ9O03tcp4mKe2lnnIOrcmLT7IQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405232; c=relaxed/simple;
	bh=Wtjo2nq6SBTIM531bE9hkp4uSTiLMC+4CM/B7PGT41I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jXBsYxUrWzyBj2shKB2mRjSoLGpxLchFwPZZggx3+l7lonz4krYBFq1l/mlY0guSMFGjuH4hjF4pSFGyP5dBOK3xhm2MxJQGBaqFfkpmzIvA1nIDqXRfntJapgz56TBS7xG2BDAvRQADKE/QXPkEQAqrQSTFq6VLF5QotR/XYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glW3jj0W; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glW3jj0W"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo5067548eec.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405229; x=1793010029; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=glW3jj0W7M8+Hc7HIns+vOMu0LGMeRPe9r4yf7fXkX6kBKObl/9+UUJf8wIGPvPc7e
         MIvZskfkwsGVmiLmy0aXKHuBc2BtLDFlVYRmCVsPvLVSXJSLZ0qD/ekqhPRPuGI6x/+w
         QyEYWnCrguECzNjUe7asNuWkOR9JhcAXEc8oRQkpM50jGvY2Df3LT7eNe2seitT7lH89
         WtRQQQDFFPPbGpTdRyMCGuPDq5PCYlwl4Ydv1cPEpPGMeawieuyyWCaxJcLQEjzMZ1x1
         YCsJQfR/aq5nqiivPqXHpxtc2dtrvlNk8pts1xcO8ns7nlXxi5TQFpxiLf6buwTJNX0u
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405229; x=1793010029;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=jzVNbeFsI8k0CYTl95Fshj8vNftpZDamA8aBmkUKGkrtDGqIDE0Gu4mOSIL6+rwdGW
         h8Uq2OTiWpiIadfqhlFqWkUhUPc64T7vqdZ7UhCswdYMo35Fwaqg1Oji509fWGszEZqi
         h0+AgqvavmPPmVbdzs1ngVEuIavwv0pMxwmsNO/XWidvE9VKZarDqG5P/HK35p+KYKvu
         ZjvSl6ImnlA62xF3fVSjiFtU/X8sTiSyzY43If/ra+0LWGSGDtgEGdqZ481yen7q4Rje
         cWAfhAL4JBviZf9a+Rd4Ut21B9BhXcFw/lODwPzgoUxx4+TyqWb9fDIovDS14dK6qfTw
         3E4w==
X-Forwarded-Encrypted: i=1; AKwUvBwEMx2fKUgUy/y3l1++bwlajetefod/T66u8wrbkBWfECZE/69n5gCLH0ess/RaIjJyzsg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLR1EORKD7v5QG5WCyZFA+bapKfxiRHQ9f7+qSB92sFdVldmFjJ
	6wVR3TibmA+e+V5DG788cGqHf1ISWQvi7fFba9wUd0fGYdzN5E2uD4Kh
X-Gm-Gg: AYBFou1SGeWNMoQlYlr4FqbkJPWv4OS3suJc2VkoklaxvBY+Ocxw7Pblyy03wXf6/g4
	BzQ11JoW2Z31Wz8C9hV5gYKrESQFDKwtCSwh/tiSzULP4zPg5wCOBEnGrXi2cs7FuLSyU4+XzV8
	pQIKvWK8pVNliMSrRQ7SReHRP0RYjBucrj0XG13RgAM3RUXhv6+YF7XZ9VZlAtn4fNWbVDGAve2
	GpM8ObT95FKtuuVvtl6e7WL6mBhPbDpJiQzxy1ZLAeqsWuCalnqv5U7qZBNdgCoVJsn21pUNhoF
	wSGfhD3Fohh0N4K+/fzH8a5HXA/gPXG2FxZ9lcfXKdHHBDB8Amu/zisu+AIfVvlSwOhtY0EZDxe
	cmC/yvfB//NDCSs9ny6UhPNdzk3ghQGaQXcqyjKQBuH4o9MU4qNpGfyRrb4gJ54WMu1G/dJUM3r
	hBT9ZG64YaMD7qWvQJTSTTVJhRgt8TmNjKwgDbNHSL/cZyh37oOW6DbD+iHcCfe2edJe9CMKp8h
	38=
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr9940511c88.30.1792405228916;
        Mon, 19 Oct 2026 03:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/3] Add VGA support for Apalis iMX6
Date: Mon, 19 Oct 2026 07:17:13 -0300
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnu1WoC/x3MQQqAIBBA0avErBswMYWuEi2mmmygLBREiO6et
 HyL/x9IHIUTDM0DkbMkuUKFbhtYdgqeUdZq0ErbTnUGs0a66ZCEchaLHGg+GLMnNL3aeuccGWe
 h9nfkTcr/Hqf3/QBiOi3/awAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2441;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Wtjo2nq6SBTIM531bE9hkp4uSTiLMC+4CM/B7PGT41I=;
 b=K/92ccUEyeN+TkExSsHIzTIooOpzahjw6HNCnpCaTctauVPX9ywt82Fnmfxdz7h43b7N6JoQ8
 agNgWXrR1O0Bd2/w7lhY8SXJ79VsHXNsansU0VxIDNA3yLiaBD/A/Tz
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add the existing data-enable-active property from
  video-interfaces.yaml to the simple-bridge binding. The property is
  read from the bridge's input endpoint. This allows a dumb-vga-dac to
  specify a data-enable signal polarity.

- simple-bridge: Read the data-enable-active property and fill out the
  bridge's input bus flags accordingly. The property is ignored if the
  bridge already has its own timings struct defined, to not interfere
  with its existing settings.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Changes in v2:
  - Introduce the data-enable-active property.
  - Describe the VGA bridge on the Apalis iMX6 as a dumb-vga-dac using
    the data-enable-active property to specify the DE signal polarity,
    instead of using a dedicated compatible.
  - Link to v1: https://lore.kernel.org/all/as-heYw7PKLPm3yH@SMW015318/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add data-enable-active to dumb-vga-dac
      drm/bridge: simple-bridge: Support data-enable-active endpoint property
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++-
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 21 +++++-
 4 files changed, 148 insertions(+), 2 deletions(-)
---
base-commit: f33c2a109da4a527ed3103acb649a88e88cf368c
change-id: 20261014-v2-apalis-imx6-enable-vga-450f5777a476

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

