Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0981A285
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667371; cv=none; b=KYREMDVHNVKePUmchfRNW0v7yH/b04GTbP8eqGa5wl2AXDC/+bXjU26TnnrhNNc3h8Xe/hbEyEaMxxDFHZxAnU0iJcPQjI87V0M3YJAnz7TCQei1ilO1Juz7xwRLK4ivlnFW1HinFf4lfxQESBfVDB4jLOl9rbph0OFSM821ZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667371; c=relaxed/simple;
	bh=i0X8e/yGdKsmn7X2rh4oVkde7JIZGAI919kdToTsHkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2pXkJ0SR1SSdErPUBn43LbTqn8Osk5lBmElIFBIWqTu5xt2iu0NGKGiWXgPk6+S1Ujp5kSXCFyfHoamo+TF8O9lmlfQrjmcZ9TalO8wF124PyByoiEtmCfIrUpVT1aHeQtcTp3iCOI7nOs8+YQVF9n9qUMhitXeWMVGtOW0UX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmT43DrF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmT43DrF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477632d9326so14795035e9.1
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 15:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667368; x=1766272168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9yoT0f7ot31AnsAa6tAG2J9yqkpoDFMArAPTB0wTZw=;
        b=AmT43DrFAII3qHLsFmNKY1WstgzMNgA25pxdQgOiu9a/x4qcLJ++b7++HltRyGWx4M
         ae8NaMH3LxdtYUwan1xiGSjxPjWp2RGg8cqZFEMhqaenH/bB/ViDPE9+fA09N360bO12
         sM0+Aul1yC1YPhzKlPO88/3PD1PjMOkfIwshmbIYxQDWr3WOlyq0OOYAWVooYssDUZq1
         rpXKAJgVOpwLIq5OYpzAtNeU36zKOXAhpoi0ym0PlM1CPAmuldxnowfxviiHeE4S7l/w
         EbSYEv18Or3kO+n6KocICaC7FsmpGqctoJJ62tXyNHPOz5vrGdCuNKS41qeMVZHEzydx
         nrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667368; x=1766272168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9yoT0f7ot31AnsAa6tAG2J9yqkpoDFMArAPTB0wTZw=;
        b=gULLEoWxcTueK9kxsnCU3HXsOglCDHsJPgiWW7OKrGOD+GX5VfLi7SILMr/UoHPXto
         rzPm5YB12KzkMC/QeNT+Kiedei7Bapg/nLD8WPcGS3yVVJ/sAAgG1GEkb2ARhpXz2jba
         ZSy7d6VSYfmKMp52N7DcQs+lJAOkzAjdkUfJnQ6xGGHhtoU+taq1GpanysNj+moqGj4F
         XnH0eTJDPmrXxCKI7iUyObT5yCNP0KPXPKu/01GuwDmpMaZndkZGA2qT5ZLuNR81Mxgv
         K0RdWhjpMgOQsTpp2DpyE0FZh0m9CvE+jR15CC3kMCkxmTwB75Mgk9EtF1eg+gr4NXIY
         vFhw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oNEcj7pdOouZtWhFWGlNeFFiFifQIGMLLbKpcRQ8P9s2mzYlOAxls2D7EX+QcyN7GYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNZQJE9+XHj711YuXcuz9y7sJy69bJHhKlIZS2PqROBqAS8kIy
	3lPP0w2I3CFLNWYbxyp5cgACQ2bCAHbmz53m3rzoZHQ9wPq/g5w89Eib
X-Gm-Gg: AY/fxX4PiAWU0ZOHQhzLNfzFPhHoa16uJl0t2jtRqxRBTijuPCjMnmBWD1DZSSujZz3
	urO4dmBmheKPeJNqfvCmm4GipwQWU1O4O9VjE/2Xv2D5D8mjmZ5doWptaDdIE8QLOYrAbwZtZob
	MY4nzC2X4y+fuXsHQVLz161l9eQuO/4INgidPvuvoOZ5tRf+REGMOfMoVwPI7Pp2HTdoVrQrEDx
	X5Fch3Fl3EK+s/06IjKm6kwh3f600QLXMrlv+gJMAvMjEVH3Yr6f6uEeWK6J+/eGSFErj1LOAkk
	vL8MtUegIuQEZyA5XxOhY7P0bKsu13dQE5SOUaZSpYqygpTV8gpcM06Io+qHtK7bFGZPR94Ce8o
	Ve+bG6Z6grS2yCvkimkdeDhgSIECh1XIihhr0BqBYCh2NROmkq+4mmCUCd1xER3iN2yNVbpgiK+
	o3s0ZQZ1VRBcnhzqVWIiFty9ClJFIyO41FgH+rrU91jHtTHjidgXUyiL6yoz+ItoQaVj+KJEjEX
	I7CdMAyEz/GE9IJ3JGQCXyUTw==
X-Google-Smtp-Source: AGHT+IGpEJxMWXJK0Z6xfBN3FbA9kMxSjh6i9r8YNRiqMHyGuLBmu3GkO2YQXNG94dpdEIrd70iVbg==
X-Received: by 2002:a05:600c:4f89:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-47a8f8d22b4mr78828565e9.16.1765667367837;
        Sat, 13 Dec 2025 15:09:27 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:26 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 00:09:00 +0100
Message-ID: <20251213230909.16810-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aligns the VAR-SOM-MX8MP device tree with the actual
hardware populated on the System-on-Module, and separates SOM-specific
descriptions from carrier-board-specific ones.

The first three patches move the USDHC2 interface, the PCA9534 GPIO
expander, and the UART2 debug console out of the SOM dtsi, as these
components are not present on the VAR-SOM-MX8MP module itself and are
instead routed on the Symphony carrier board. Their descriptions are
therefore provided in the carrier board DTS, keeping the SOM device
tree limited to on-module hardware.

The remaining patches add support for peripherals that are populated
on the SOM and commonly used across designs, including WiFi/Bluetooth
connectivity, the WM8904 audio codec, and the ADS7846 touchscreen
controller.

Overall, this series ensures a clear separation between SOM and carrier
board responsibilities in the device tree, avoids describing
non-existent hardware on the module, and enables key on-module
features.

v2:
 - Move deleted nodes from SOM dts to Symphony carrier board

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
  arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
    carrier
  arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 332 +++++++++++-------
 2 files changed, 356 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3

