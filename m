Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5C2868AB
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330237; cv=none; b=m0SsjkwfkFSBCAlOFdMbpKC9ajvbXzRTpixyirV/Oe+OTJql5L7lrQzcv0Eq0IbQscyxvXymKggOq8xZWR/P0KeQGwRFxfb/nfGJN+xi2EEM3bjsyF3zNsGNSTwx3r9nl7taUlqV6duSAHuFs4RxADNOpzubd+HOXHfrvbkED5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330237; c=relaxed/simple;
	bh=iUE7wgNOMrhuGoeVMSXNQvm1SnDRxzVTjBLiEo8fGhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f629iDyDisBc2SyVGWKZ190svoDJNC0wUVV4LRe0Nc//XDpnGNd3/ItaMaBJTPsNn9f3Q5O5vgZbk77ICfCXtSzd30zxEYWyhpjCf+gfRUYovsbIvSPZl4IHcTjN4TNsG4VSJLHx61sQdklzRcG9IvQphcPlpeqcu/LaokHFCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvhthX65; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvhthX65"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so4686865e9.1
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330234; x=1788935034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=fvhthX65q/gpMmpS0/Xg3HPtLTTdeCPAgUErDdtQ3nf5yzdzuS0Knu1KACBGfaKHcR
         YhY8PXuoAJIBWgZTz0A+LAR3fVBhC3wJxewHIDibxI3wNYVs/Ac5zvRmgIN0irNQIWFa
         Gsly3LLnCR8arkJpGqGn4u7ck3urV8a6+TY50Z5xsjTZRRlO1Oc3u4xZsVKVz4sPM8Yg
         qdClLC9HHezhoK29egIpz00+jmSZ4THGFbCEvIzXqgHSSJEQwx8chXu9HMHR8lRSh7oy
         VLEQrcLtECkrVHd4IfuGlNR6v9qDwI/qUVQTREuzNp/qjc/clM3lPBGI4OZg6RhgiGlw
         uzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330234; x=1788935034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=kXT0o6Kjzai1xllYwVWfZK10QdtW0wxDTYinbuzR6/Fv+qIwIdj41qKm+4qXlJXQF2
         tVH3cDhDiPGbegQPFF9TJdguly5pCeU7AyWjzKYZIf+LmxnKwGR3jRD/rMTX/EkqHdkl
         L5DPM98b3qyjJCiZMc6maEMN9y5lYbcfgzCERUhRv6Ow3ktVc3Upny6qc6bHr+37vL8A
         jc0RSo+emNSb9y8ADC6Yp34PhfEt8GGW5ZBxEcjEOIK2SQbkdzzPhJDfgxsm1yOQ54Qq
         TcMJHp/MvRqpQloY+6yDwlnFShxbDvF5yC/20MTuHnDLxsyWTfdhYEnc2xivUm+UZkIZ
         hALg==
X-Forwarded-Encrypted: i=1; AHgh+RqEZXAtC0bAQJbGB6BchcoTawPYqAB8BOAa5rbDEEIO4okXW8sv7hEhK1pmsmGQo8Y5ODw=@lists.linux.dev
X-Gm-Message-State: AFuF++kAUukekVc8fR51gml6O1CxBU4WmWF/GVrbXLVfhNpXQl9d2qTm
	ht6gNMdj4vC0Zmb9yWbywgfvwbxCMN5CEf5WP4bkqqfEv7dJ6akorJVX
X-Gm-Gg: AR+sD12ekdGJE/Zpuyovp6wYTp/QvQkXn1uEpaBJAt/iZy9Zb8HRSTUKzFYC4uAKiFq
	DuQW7sAfRzjDpJwrbiAGUqHCE0zLJfoFv5ZkESUEsuFg6vkJFMr7VptRa1nIxZnXZ6+NyS+09wx
	iBPdIMQirYPnYrr+ruhscv2+Y+DPcFaK43JZ4+2HJqMRyYb/lC7Q8DXuVgBDRbubV5CVrdM8wYl
	OVT6qtGdrbLwUzWe+2EDJ7wUZ178ITinAjivh2Grno9C71BZ33oBEfYJ14I358KsgYX3Ilz7tsH
	PyMkLaaRBFYmaUdG1NdysRiesOTlL+otX4dm7zt3sh9L0lzbjFY/LDv5hc8puu1xdSOrJ66wDro
	GoE2f5UAYLpBw3DNrRbxOf/HWbbKW9CEjvNeuHOLv41QII8q1C0rrJ+Lnj2aGl9XkjrjFRMIGG4
	VsVmpA+/Mj5/Eh5lgEulDBlWByJPteCTawy8Hdx7UmUk9fe0d7J/zfYlY3f3P+M2K3NEVBD/GkT
	0ww
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecemr12186495e9.5.1788330234183;
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:53 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH 0/2] gpio: mmio: read the line direction from pinctrl on chips without direction registers
Date: Wed,  2 Sep 2026 08:23:50 +0200
Message-ID: <20260902062352.3600368-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this is the series that replaces the gpiolib guard patch [1], along the
lines Bartosz suggested there: instead of teaching gpiod_get_direction()
to stay quiet when a chip has no get_direction(), give gpio-mmio one that
asks the pinctrl backend, and teach the pin controller to answer.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. This patch makes
it parameter aware for PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that say where those bits live (Vybrid:
OBE bit 1, IBE bit 0), and keeps the raw register as the fallback for
everything else, because the debugfs dump still relies on it. Converting
the driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 installs the get_direction() callback in gpio-mmio for the
"pinctrl backend, no direction registers" combination, mirroring how the
direction setters are already forwarded.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next: the 21
boot-time backtraces are gone, and /sys/kernel/debug/gpio now shows the
pad's real direction for every requested line (the hogs, the SD card
detect input, the USB VBUS regulator output). Pads with no pinctrl
configuration in the device tree cannot be queried and report -ENOTSUPP;
those pads cannot change direction through this chip either, as the
existing direction setters return -EINVAL for them, so nothing that
worked before is affected.

Patch 2 needs patch 1 to give correct answers: with the raw register
coming back, the direction would be read from the wrong bits. Taking
both through one tree, with an ack from the other side, avoids that
window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: get the direction from pinctrl when there are no direction
    registers

 drivers/gpio/gpio-mmio.c                  | 27 ++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 4 files changed, 63 insertions(+)

-- 
2.54.0

