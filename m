Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93890263F4F
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833811; cv=none; b=ofUeOk6i/1dbsaj/Z0unWSTPAGdsstzLaG37I8y4848puDaN8wlQLTekLt4Nkj7+sxLHQ4m89Zhclw/3mOA7/AB79DiH1gaZdOCis8PSnrfpm1nJxBkFqkDJuw2Fd1BHJSXUnJZifZJQJygsVrthgO0hF+axVybMYnxM09AtU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833811; c=relaxed/simple;
	bh=C3XAo9qh2gj1Wbuwolnf2JOAUQZCs6fKOeKZA1fqa6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YKcoRHQtLkOQ0CPtjRXSnhisGZVnPwHqKR1rHwN0Ocddq+R6IzsPxcDl46o+eXD14ZXQD/9y6DvfD+Cw0l+bRO18ierBVVaKasejmFxu+rlU+cukTVBFpp4uXJG/IW0lxAu3bTr5WEWqV7gXcAYnrnrI07Ut/lffYxekvHv+Fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bzsj99oQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bzsj99oQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso32357615e9.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833808; x=1743438608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RR/33HkyWRVzBTpKjMr4gmsX71tawz+FueWvMxXm7FQ=;
        b=Bzsj99oQFcNHd5ELnBot3kcm1L2pQGgkptsLtHA5sisAISSH6g0f05+IeHWNLaE/zJ
         5+zJem4Y1sUguoP8LybvDQ0WPZjgji+m5pETinxn+hVEW2QrTEghJPz2A1gF/pYyk5ce
         qctk7RLOrFIRcL8x/BQr7bLplJjH7IW7JOzWFikGxqZR/CObZwlfnqF8u5SzpiwGD0E3
         +JnXSxnoV47NwBjUQFUnJFlXxUYkXJhxUMhJSQsqy60qkNwa+cooA7SSpQKnA+/XdtiX
         l+hwJ5x4gDDrdEOGcjVflvJpfF/DGeGL8uZIKeOqaLDLDELfeuwytgtEWshLx76zMP4Y
         TxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833808; x=1743438608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR/33HkyWRVzBTpKjMr4gmsX71tawz+FueWvMxXm7FQ=;
        b=CZtAOELjoI27OQkM2/zdm9F3lfN8dSUJB9qqIRFWW9KxCX0QqXJXwMxghBLyB8mlk4
         1yCoob4+qvfventRj6uGdFXmWhecZhR5rF+MRB6mwg8ZnGPIF7bNjxdcQpwkshfDNLTd
         aU3FaDZQG+29Eqvf9hF/4G+6Sbg93eqr5HE3ihFuDewWbyncJ5EQ+L2LPx/4pclw0cXt
         aegjThkNVwsrFYzELhT54NuvCECsDIdKVu/djkoqDv2mL7mgwwRAC8EbrR6tBtgkOQo1
         ACTMYu7L8vO3rqOtOck669NLpIPKsa/HvjrTl34eHSEAKqx2Knfk7ZZ+fJW/uWMcMHgy
         f3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6eGkli9Z8SAj0TX16UMUppvNpKhLtHmmDfCSl4aYIJEhvDMkPXt3fGMHsDgi2LJZo1fg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxfipAO3ZMQpi7zNHAwzaRAnZBEcshhi13Y0Z+MOmJMqECwHM9
	0O1bsFGHb/zXyIKbbTvFyJpsZ8TRSAZtvRzoh+BpW4xbQTqWKsZ+
X-Gm-Gg: ASbGncsSpUtB9sRiWh6a+df1b0RjWTXOIatpgtEP4m4wb57KhxGEVF3aGV7SAAJn+z5
	iLgQ4uab9cSbG2k5kt8+T4pspqHwnB0kQwkQIZhbnEhO5su211CtUjc8wydv9Xs5nVSyAAn7VZ7
	8lMNLr2mt2kVqmUvtyHHrif1Q2aNP2mknRJP+n2nDYoCVTE3PYhG92TfGIQPrwyqHD7qjWSqRmp
	98WH2HLg70eJvHHBt2/sDber1Mn1aTzYtOG9D/6tOdcI0rGSBaf4p6gXmuSuJWY5SW47/aIk1qs
	7MD8WRI/VBpl1BEmsFSJ5zAY+8Lor6KjFzqofqF13gA1WBiYA7x/INjW06iE35/QEXL83Km3Zaz
	Tgr86icg=
X-Google-Smtp-Source: AGHT+IEo9FRh6+xI/yyeaQ866fq+Tvmef9RLHhF10hpOmSRuuMOdP7oXv8eQi8BJzr1/UzfTyIuU2w==
X-Received: by 2002:a5d:6da5:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3997f958f34mr10877702f8f.46.1742833807619;
        Mon, 24 Mar 2025 09:30:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:07 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:51 -0400
Message-Id: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   8 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 +++++++++++++++
 6 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

