Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969620D4FF
	for <imx@lists.linux.dev>; Sun, 10 Aug 2025 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863812; cv=none; b=i/V9kwojqJrcETSAHuOTt1qYazRv3M4arRSHzIvUYxEIX4VodE59eWeTSmTKeR5OpqrFj77uCl0s+RT03NcsPgXvSQUJvhYY1Ef5pF1zGtf5Cad4Wgx46UhdKGBGHVbQ6/OYTMrumgV3owvU/pn4ZhCMh/R/GvkK46JKhnNKVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863812; c=relaxed/simple;
	bh=N8fBcBXmtwQEhSoTEhd14xL4MKGzTEpsEM4hoyFwqe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NMjOfnzov0Ytrh5g51GbWIDZBetifL7cHKzMyq2u5BNYyVyu4fcLuLKzObt1Tvp3ZRB4yrvSUsg40rNiog505pUTAzOGtDKIzolEpti2X37oAbWemLTx6Bqh2OhPuCpi7amkOkoa0KAxQovRRFn9a40tCv8RKjvl9Qr1bQwWI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-321a5d6d301so452242a91.3
        for <imx@lists.linux.dev>; Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863810; x=1755468610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTvufXihPkQWxsCzNlViO5S18/a/xN0mVbfR50DxXrg=;
        b=dFSX6CZmj4uwGjAOr6R4SpGjIpaseVtyRUr4l/9CKxarx/V9jXQjyMfX5EU1qfYWF2
         uA7jLceVBnOgBvwAxAipre3U7TJqpPw4xponB6uyearQxpIv7zYRLr7KeNPdPwX//OPA
         x4w4y0sbxKcgoSGRd23z5dhWtIjXud9aaAlWhxYGvY07ON0JTHXduH7YBKLBNEWrjm0k
         fCtUFiGbZSUZwm9xjWdf1eKIXvWxbCcNKLD44X2WQ3YD07uuNSL6zGFDzWEU5YFAL0Rf
         J4YTJodFefEPBDJHZhnezRQBzufDhhfSVPb8U+/4lmtBWQkRujOAwxa4sRmg/P7Yq7pY
         ceng==
X-Forwarded-Encrypted: i=1; AJvYcCV+uemNVy5Uf1uA3xrrMP2sZx+Tm//9Py40Nf87PK6LmvXBtGP5GKDJ6oeKefKTUe1wpZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYa8pv6Q5+7nqIi2hMbnQZr5jjCvnt7knKc3s11KoUbx/a8hti
	aAZnRkHL9iF/5odrddO3yM+H4DU/6jKQJzECqU1ztR6wkEkMnPBgryry
X-Gm-Gg: ASbGncu2IgxEYknPPoqAXyi4e+oDu/RwL3C15JQrleN4yXJUeNv64lK7XCdCT6aHSoD
	PQlBORjlpoIIMer3NFgSpav5OGEufxsvHYzGCnHF0jFxC3hXU2eAVGV3mPYj8Z6pbQgB3a9nLwE
	j7U5ISwZOAmobnSp0MUdLHQnYMedN7bG7JUHb3iusL1a9mQ1XMEkzZaOAdBrkY6fPtklrVt5rMv
	N+Re1jG1gbY3i/qBdnyRRyxkQ7IaDbgwbYHH2rBlFOHu56ySMsjk8iIG3jZDN7jSKdpnVvHrgZz
	O8EdeDcbpkLWZIFEQ8qMXPY+XYp+K6el6q0VMxsj7KhEUn04T+9JpAEoh4RP9inmMf4DHJYsWVv
	as/qs5ao9+tZkAOleIxTgmw6TMQiYLtSiQRXLHsXOMcBB/3s2reu8KJTeUYi+aEr7GMI=
X-Google-Smtp-Source: AGHT+IFazFKcYUWG6jSvxekQQq+aNyqACCfmdDeYCyWCL/tzLKLiOHWFEewxmiV48lSL8BmFoshC3Q==
X-Received: by 2002:a17:90b:4f47:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-321838a61fdmr17485662a91.0.1754863809549;
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] media: Add Sony IMX585 image sensor support
Date: Sun, 10 Aug 2025 23:09:17 +0100
Message-Id: <20250810220921.14307-1-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This is v2 of the IMX585 series. It adds ClearHDR controls, fixes mono
format handling, and ensures HCG can’t be enabled while HDR is active.

Changes in v2:
  - Move to V4L2 active State API.
  - Shift the I2C registers read/write to v4l2-cci.
  - Remove IR Filter switch support.
  - Various log/trace noise trimmed or moved to debug print.
  - Lock/ignore HCG when HDR is enabled; mark control inactive.
  - Using compatible string for mono sensor.
  - dt-bindings: drop redundant maxItems/minItems/names,
    add "sony,imx585-mono", fix quoted string lint.

Features
==========
  * 4-lane or 2-lane MIPI-CSI-2 up to 2079 Mbps/lane
  * 4 K @ 60 fps 12-bit linear, 4 K @ 30 fps 16-bit Clear-HDR,
    4 K @ 30 fps 12-bit gradient compression Clear-HDR
    1080p binning mode, mono hardware variant, HCG support.
  * New Sensor Dependent V4L2 controls for
    HDR blending, grad-compression, HCG enable and Enable ClearHDR.
  * Blacklevel adjustments through V4L2_CID_BRIGHTNESS.
  * Multi Camera synchronization mode support.

Testing
==========
  - Platform: Raspberry Pi 5, 4 lanes
  - Formats: Y12/Y16 (mono), SRGGB12/SRGGB16 (color)
  - Verified HDR on/off toggling updates ranges (exposure/gain/HMAX/VMAX)
  - HCG is inactive and ignored when HDR=1; active in normal mode

Series layout
=============
  1. **dt-bindings: media: Add Sony IMX585 CMOS image sensor**
  2. **media: uapi: Add custom IMX585 control IDs**
  3. **media: i2c: imx585: Add Sony IMX585 image-sensor driver**
  4. **media: docs: Add userspace-API guide for the IMX585 driver**

Link to v1: https://lore.kernel.org/linux-media/20250702063836.3984-1-will@willwhang.com/

Thanks for reviewing!

Signed-off-by: Will Whang <will@willwhang.com>

Will Whang (4):
  dt-bindings: media: Add Sony IMX585 CMOS image sensor
  media: uapi: Add custom IMX585 control IDs
  media: i2c: imx585: Add Sony IMX585 image-sensor driver
  media: docs: Add userspace-API guide for the IMX585 driver

 .../bindings/media/i2c/sony,imx585.yaml       |  116 ++
 .../userspace-api/media/drivers/imx585.rst    |  122 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx585.c                    | 1768 +++++++++++++++++
 include/uapi/linux/imx585.h                   |   20 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2052 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
 create mode 100644 drivers/media/i2c/imx585.c
 create mode 100644 include/uapi/linux/imx585.h

-- 
2.39.5

