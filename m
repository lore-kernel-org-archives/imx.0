Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5A2BE62E
	for <imx@lists.linux.dev>; Sun, 10 Aug 2025 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863820; cv=none; b=ERnAkXu6T7vCKMlaZcd5VWX4GxBQrv+Cje80+JmXmlAYrrJMmhewd9rZngMQ+nDz84gEMnrpMBTG6+hC0IXy0is63+wgyoTt64bD6WsyxyALn53uBQKYmAnla06Cqih9VxMmwX2ZMdsYzEI/G6kCiT2CyI5Bh/IRzmh8q04WPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863820; c=relaxed/simple;
	bh=G68wyTteo9VmNABQsUfjg4kswoq72FPmt818iSFyXn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpEfsYLBqVTVQlZnNcJqnZdm7ms/W2caEDm9VDH0ffBWymjVckf59QmKTz+Q7LYNHU6i+cjZHyLbkj1Nm8I9Evs0irDitEFBY/JZmF7e37KHOuLsUs03tuX/5UEfKV7WO75CwwGMd4uv2XRY21i9SK5+uHwavXuO0AwEQ9f17xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so3300317a91.3
        for <imx@lists.linux.dev>; Sun, 10 Aug 2025 15:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863815; x=1755468615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3krEn/9cYqN/fDovrUoLGh2cVwyrKoWU5FC2Hs4k76k=;
        b=NXc3X0RXHULKXr2tMfR6owuYQcHt3XQWHUPfeo6VjoJKlDDz0I6xFADlLLuyB3q+oR
         hrkiOeMNLqpyugmfBPaW8NKg39zC+YN6HFKOc1v7ckjFgBuzu1Qfv5NdZ/coF4MfnSax
         WBn5BRiN4enDBI71NmUh7m2Q16QP0NxmPBJW0v1cmuJ1dPOubFn/BWUrPZrs/lSEIlFu
         dZ+9eKbraYIL9No/+Bef/DuGBfALj+X3di8g2iwIzS85Kb0kTWM+BafeRuHAByNl2JLN
         6S3oFfUFpul6cgjRiQFoele7yj5MiqBff9mR0sMD/D7t89W/hyIYCjfR0PK0cYNytani
         hvow==
X-Forwarded-Encrypted: i=1; AJvYcCV2QqSVBuy1s1dBpki/3nes1x4G3nvvkNTMQG4rKKm9y4Rs6XYu3V8xdGKaMYFH85xCx6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmgBDOHRTZFJ2K3KSY2PWNAw17h3ihVbc4g7ea6niNhXxQVklD
	wKmXfGCqV//bUxeap1EKfaibse9fclnJoYLpojdinAkSMt9EuSFRfCy6Ob/YuqfxBos=
X-Gm-Gg: ASbGncu+9t1QN+uSH6VOhziuimgJai4lHSu/BmAnDngf7o3NtLrpwDMme3/jGuYcOI3
	d9GNovVM55eWQt8ZevdxBuDe2NYjPcTy0Y88AIXwEr8DXU81NFnyW2UYWFykjZmuLmJtEoRGRCa
	AskFmpDoCBeNBuCEnl32mujst4zJQ64xvrrHo/akFCGv2OnWvRXIlUG4wz9lzWtZPgtTfbSNm7Q
	FWMVL19PXw2my9RIze7WK0pOUov0DH/JIcUWrQGx8gNGEYY/oKI8Y68xGApPa8RHbLpOds1iqrt
	ELBKh53khLjfb3M4kdT3PRQpv8RDQV2bksXmB5A4QxeBfHQZey/g6glumjV2PKaBlJFFaQWJcmr
	EXS/oPCmf6akjr+AZUMLUIj4tLvL+RSauoDCBDNuGV/YqMumyx9Z1mpvrudDBVGUQnV8=
X-Google-Smtp-Source: AGHT+IHVycpFEKek2S7JEZFXfX7JB07ZOO+8JCByaPzFT/J+gWDvifbNtQBaW8W0P+dVEavhKLSSvw==
X-Received: by 2002:a17:90b:50ce:b0:321:7528:ab43 with SMTP id 98e67ed59e1d1-32183c482fbmr17371641a91.24.1754863814883;
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
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
Subject: [PATCH v2 4/4] media: docs: Add userspace-API guide for the IMX585 driver
Date: Sun, 10 Aug 2025 23:09:21 +0100
Message-Id: <20250810220921.14307-5-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new IMX585 V4L2 sub-device driver introduces several
driver-specific controls for configuring Clear-HDR blending,
gradation compression thresholds, and HCG enabling.  This patch adds
an rst document under Documentation/userspace-api/media/drivers/
that details each control, allowed values, and their effects.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |   1 +
 MAINTAINERS                                   |   1 +
 3 files changed, 124 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst

diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Documentation/userspace-api/media/drivers/imx585.rst
new file mode 100644
index 000000000..9f7c16f30
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/imx585.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Sony IMX585 driver
+==================
+
+The IMX585 image-sensor driver provides the following *driver-specific*
+V4L2 controls.  They are visible only when the IMX585 driver is loaded
+and sit in the sensor-private control class.
+
+HDR data blending
+-----------------
+
+``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
+    Lower/upper **thresholds** (0 – 4095) that decide which exposure is
+    chosen—or blended—for each pixel in Clear-HDR mode.
+
+``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
+    **Blending ratio** between the long-gain (LG) and
+    high-gain (HG) read-outs.
+
+    .. flat-table::
+       :stub-columns: 0
+       :widths: 1 5
+
+       * - ``0``
+         - HG ½, LG ½
+       * - ``1``
+         - HG ¾, LG ¼
+       * - ``2``     # duplicate ratio present in the datasheet
+         - HG ½, LG ½
+       * - ``3``
+         - HG ⅞, LG ⅛
+       * - ``4``
+         - HG 15⁄16, LG 1⁄16
+       * - ``5``     # second 50/50 entry as documented
+         - **2ⁿᵈ** HG ½, LG ½
+       * - ``6``
+         - HG 1⁄16, LG 15⁄16
+       * - ``7``
+         - HG ⅛, LG ⅞
+       * - ``8``
+         - HG ¼, LG ¾
+
+Gradation compression
+---------------------
+
+``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
+    17-bit **break-points** (0 – 0x1ffff) that shape the 16-bit
+    gradation-compression curve.
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
+    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
+    **Compression ratios** below the first break-point and between the
+    two break-points, respectively.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 4
+
+        * - ``0``
+          - 1 : 1
+        * - ``1``
+          - 1 : 2
+        * - ``2``
+          - 1 : 4   *(default for COMP_L)*
+        * - ``3``
+          - 1 : 8
+        * - ``4``
+          - 1 : 16
+        * - ``5``
+          - 1 : 32
+        * - ``6``
+          - 1 : 64  *(default for COMP_H)*
+        * - ``7``
+          - 1 : 128
+        * - ``8``
+          - 1 : 256
+        * - ``9``
+          - 1 : 512
+        * - ``10``
+          - 1 : 1024
+        * - ``11``
+          - 1 : 2048
+
+Gain settings
+-------------
+
+``V4L2_CID_IMX585_HDR_GAIN``  (menu)
+    **Additional gain** (in dB) applied to the high-gain path when
+    Clear-HDR is active.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 3
+
+        * - ``0``
+          - +0 dB
+        * - ``1``
+          - +6 dB
+        * - ``2``
+          - +12 dB *(default)*
+        * - ``3``
+          - +18 dB
+        * - ``4``
+          - +24 dB
+        * - ``5``
+          - +29.1 dB
+
+``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
+    Toggle **High-Conversion-Gain** mode.
+
+    *0 = LCG (default), 1 = HCG.*
+
+Notes
+-----
+
+* Controls are writable while streaming; changes take effect from the
+  next frame.
+* HDR-specific controls are hidden when HDR is disabled.
+* Inter-control dependencies are enforced by the driver.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b..87912acfb 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	imx585
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/MAINTAINERS b/MAINTAINERS
index 175f5236a..42e32b6ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	Documentation/userspace-api/media/drivers/imx585.rst
 F:	drivers/media/i2c/imx585.c
 F:	include/uapi/linux/imx585.h
 
-- 
2.39.5

