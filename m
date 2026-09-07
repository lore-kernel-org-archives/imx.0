Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0AE48C40B
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781304; cv=none; b=idU8uFQ1goxDd74tJSUeUV7skrsa4yzdjwDsi47/KkkVq1NnVDBJ6ANGs4Cfl232R4gUR5AnYZJgfHzIBNvzDGF2yrmFaTAzpfka8nLeUjtYr0h3+HY2UtWCyvz2eeL+tsKgd51hJPpG5+fvA5ftGbyPTakQklITx4S2u0O9wJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781304; c=relaxed/simple;
	bh=zZDECq2bmY7+ZdpePaPahcwPBF0z8nZz5LFse5CLo8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/wtJpS1muw+7sytCnrfyFWnINn5N3JNJ4VG0A4zQCd4+5Q6WnYO3Iw3maD/V+fD+TQzTI8paaXggjdgyQgzECI4OCrTS+nH6BTIhzf5wDHB0pS7JRrV5seiRC+nAZe8xHaly3HCf7FWXAtXAsY0jTMNE+bO5rEuFXTwDFvtAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZomrMQb/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZomrMQb/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso43957355e9.0
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=ZomrMQb/DIa5QcuM60DXjmd1nyMIlZROZEXoRVRPs5pqHiC8BxzLtDSeANBUs2wqyn
         JCDjCa8JdXV4yV1gOWfaljzbJ6igZCquUqUiLHClmWFLLBQaPCSg6QTpue9HfXVYnadw
         PwHpkW3HeDJOnWekvkCJStQkzMmy7cDuwjfBc308AD4hMLsK0xvzPa04TJs8mxUqWOVc
         aEno4p/JpbcVqXxoHnksPlFEBsqHSC+FcDG6i2lBD94yXxtkH04uMRDfxj1YOaYuRVL5
         ZTiVDE9IUbAjNdK2NmR3iihc+Nx0z9G11qa3gESnFPgn+jxR49xV2OMNb41kTZN0rRnz
         N3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781300; x=1789386100;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=tQlqCqHfBti+TSRa+wz5GLF8Rm+ePX3H44cbYjv0m7HX/4SYrx/rrjtAd6PzxuantY
         pOGqn6kRxZB+2+CdrT75Mnbv/0Gbknbq45QcBxX/9rMR35mSL2iuEzVyXbFS4DJJKbFt
         dhNUo8GFZ2xaodyRnvO163kPA28ahBaWfg6kw+NAmbrZVF6ckXsGcsBXhpIvdAzeKpsk
         i6eAKaLIeHl+iWWkUxZ7vh1q7SY10zX1KwKORNNHSHDxZrrCAwkWvbhcNNOVmzyQ/vrQ
         ktOxxMnvLekVZUjrMXnVqjzklolOcmcEDFPvawDVqQquc1SecMm18SGUzC0yrRR2VWmk
         W6Hg==
X-Gm-Message-State: AFuF++kCrjS4Ata1tmr4Psgqp/Gm8bfKECvGBlKky/sxO5+HBEfNE8yj
	zdEda8QOR9zAnPSUcTHFl73NPgJMNIqL1XuKheLCgbDTtnxaqL33n110
X-Gm-Gg: AYBFou2tP9KJaJ3yLPr6W6asJQPs2XJ52CQQZh0VSYA/Vdou9PlBiuAK5KoK5bi0KQ0
	SGa2jRXXM1443UozaG7F2T+O+jU0CTJSaqRT+kXSp9EACiKeQWl4HfASsQpvUXFYgY6LNQ3/RDs
	k03RkizjWIsj2uUbTDD/bOsAgmPuTVci3WHj9HjIxhpjbjd4sSD+qfBIYY+L6HP+GgrNHW/QkgB
	KLW5b4HLvJngi1c4+WdKgSEqxSqgJP8sqohXZH5MLt7XoDVUOpAT9J5E3D5clqh5+FTq2pVpG1C
	FpT8hYiRdinNKYeTxPVKqPUc2i5YdkK8IcPDnZ+7hFu/aLjI2EWIpuB5AeOIaUMMf2B4oSuSNUu
	EDOXNaN3zV8CMyeoWJ7+58RID42aWHxyrXNizfo4PZDZOlPWgWZfa8f1dD0Okum3v2tjRRZvDRj
	0FLj2JlMGW+b/XXijGM9dCMM4KCw1FWSF3fVC8mFhNS0Pqz6oUt/HWUirrbMVevI3/Sc1sAr4MS
	x5Dl5UhnuhsXskDUxqPpWebX8BuUqYRaDB97GeANeJ5K+lsVom9lwLykzFYdto=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr202658655e9.10.1788781296694;
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Date: Mon, 07 Sep 2026 13:41:29 +0200
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOminmoC/x2NQQqEMAwAvyI5G6h1EfUr4iG0cTewTSUFUcS/b
 9njMDBzQ2ETLjA3NxgfUiRrha5tIHxI34wSK4N3fnCT6/Fgi6Io6RzTjpoVAyU2wlzNl66CxhQ
 vDNPwclsMvht7qLXdeJPzf1rW5/kBxWHdJXkAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Plus
SoM. The overlays cover audio configuration, a display adapter, and DSI
displays.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for selected carrier board and accessory
combinations.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  28 +++++
 .../freescale/imx8mp-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 ++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 ++++++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 5 files changed, 409 insertions(+)
---
base-commit: 26835cf70bbb6207214af55495ea8bed9ea96775
change-id: 20260903-verdin-imx8mp-non-camera-overlays-ready-c9640fdc2183

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

