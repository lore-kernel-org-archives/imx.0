Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2C16DEB5
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130253; cv=none; b=NP824s14O9RAT2tYXVMyn2PVEGTq0rtREVONDRCHEGCjmfTRAWdCjMgfu22eHgiGx+f52qm73M1gg6LEWxrvYYL1hs/g03+tYGCuIHSGurOZfQhajjDQpLm6e90l8m50PiAc5qAkNMnw/qkyfvTcrlZy/R25sC81ijwl8TrfmAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130253; c=relaxed/simple;
	bh=vGcatcbsSuXPFzJR3D9welFSsng16vRjIJUPoyCUcOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcXM3E9QU3B9SjUC/qaKmlw1lp3Z5VYvA6/J9XvuvO6lXufKtn+V9oe458JIdzG22u+G9og1Ny5E0gDogM75lwV7VAGSIn5cb9pw/nZsgncS+HBQHKxFPQ8axn74UtKzyka0XF9gYpaEKN+cui+zr80SUYhGf7vPORmgMJK+ALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HX0loK6k; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HX0loK6k"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso628235e9.0
        for <imx@lists.linux.dev>; Wed, 20 Nov 2024 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130249; x=1732735049; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jr7qqPzbHAkagf9kWZH8AFBjV0Ls4zMfwt5LoWCWDEI=;
        b=HX0loK6kGlwZzYFHSG793fpJRU/1H0a1woNkO8wxaj2acyfwnrysrJn43x+hkha/oK
         K+XylxSXn3JOAS2phTeL7zVZX+MF+0eg8dwPGkvTXPSsyatvxdrXLS7LCzZu7gt89FtE
         0jPhdYdx0uAHZThEMHAkLCy7Ew4oMLxuk0SSsod+YH5mLWl4ZM7vqUun4i87FQGHq442
         Ss4B+0GJmh+rMxH/Dva5qvAwZMGeJHRpnzJ5btCbpMzMIKv40hE+r3HVwwirtv5nKyb3
         9fgvjXqV+Un7lAsZ1Dp8YHXxiUJ/pDSAEMpxymMfmPcINrMD7saAsYvTc1Hvkg5zsKi0
         TvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130249; x=1732735049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jr7qqPzbHAkagf9kWZH8AFBjV0Ls4zMfwt5LoWCWDEI=;
        b=SdmuV+uuFqFTZarBXwy94oma4zjBLIF5Kq+jbX1aj/7R8wUzMtnhc4/11LW1AnWZYr
         GHmvS2g3yC1GxHuLr9pz2sfLOH9BLUj6+2KQvQZfUs6ntQH9UzQrT33UNtaXz9egXDwt
         2y2YnsynrCqbH2dMAqEd07ol98F0ZydqGI5Sub4GNeUHi+kRdAsdCVilL02s4DshVl2P
         230rTT8RGUe7JxogYJyf4AReRstJHkVIUMT1upyWCQZ527cQ6+7wBCBea8u+fqm75Wtp
         4nxwOxWNKK7nO3rqXkF38GNT9Kxi6IktoWFPuRFrswE/qn3kllELLCyjpfe6OxJRYNzX
         8EmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXc0zT9eChtmBi+27fIm6JWCXsYsuYaUf+4LXx8I06RFl2ZrHuIjL/wuTbd0WlBUL9Rdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI02Qvj3+2uzCnnxqM9NjbNUOAQFK5LPkzkjE9ieL2q5kLDuZG
	dXSd1dpmaWcadxa5fn7IxRsYqifSjBxJWmnGyhWAUYr8vIjMS1uebGkcDb9Pn/g=
X-Google-Smtp-Source: AGHT+IHvFo9WlmxcMV8IjdperLMhQZjV3VgLzVSA3y+8HnawYzK6+2xS69U+wMdnZmgdTzRDcgK+WQ==
X-Received: by 2002:a05:600c:1f11:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-4334f0154b9mr36081565e9.23.1732130249071;
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:28 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/4] media: i2c: imx290: Add support for imx462
Date: Wed, 20 Nov 2024 19:17:02 +0000
Message-Id: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK41PmcC/32NSQ7CMBAEvxLNGaN4cBY48Q+Ug5eBzCGLxihKF
 PnvOHkAp1a11NU7RBKmCI9iB6GFI09jBrwU4Hs7fkhxyAxYotFaGzVQYKt4WPFeHmFqVK4O2qN
 xTeMqyMtZ6M3raX11mXuO30m282TRR/vft2hVKl/dWouEpmnrp9g4OxLZZr76aYAupfQDVR3xf
 LwAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1

imx462 is the successor to imx290 (and imx327 before that), and only
requires a few very minor register tweaks.

Whilst at it I also fixed the todo over imx327 and imx290 having very
slightly different maximum analog gains (29.4dB vs 30.0dB) and added
that to the variant structure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Added patch 2 to correct register 0x3011 to 0x00 on imx290.
- Corrected title for dtbindings patch to remove duplicated "media"
- Picked up tags.
- Link to v1: https://lore.kernel.org/r/20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com

---
Dave Stevenson (4):
      media: i2c: imx290: Limit analogue gain according to module
      media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
      media: dt-bindings: sony,imx290: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462

 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  2 +
 drivers/media/i2c/imx290.c                         | 81 ++++++++++++++++++++--
 2 files changed, 76 insertions(+), 7 deletions(-)
---
base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
change-id: 20241114-media-imx290-imx462-b6d1c24b77b5

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

