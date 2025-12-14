Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57D1E5B68
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749182; cv=none; b=ESw1z0lYV2dPIW95HbeYC2hOiMHLTdettTtp7/vwB4fTYbKzTTCmbaXSqGkplD+6HXlEjkll3EAR1LxWApyrvQyxl8ePhsxRBI3NMCtlG8VnGRAu49MfLwZ/aCG7/sdOoq4mOrkqG8+JvOqblrEH14Hb9bZMlLJbsopTc7GXipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749182; c=relaxed/simple;
	bh=RMxNctEsO6J70ux8k7C+hUjHqJidoRMFtC9l0gH4pEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnohXqrpqxsL8eEkbzBCKeFibkODP2HHwj0qS7psZ9aFkTK+iqcDOyUswU5P5aFFkwaYTnw1CgkI62/9cQVMglYGpHl9CgqH8yAB8CKVgpnAwz6p/21LpdOW4QjjrZMP5MBZW5p5p9Ab9K9Ysth7zrxPSU1lIQrX1Po7dvV7qUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3rS8NJw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3rS8NJw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso24699015e9.3
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749179; x=1766353979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRhxsDSnBcu0kxb3BQ79sAL2tYyaxkbiHw7liK1hHM4=;
        b=g3rS8NJwEwa9EXjK14X2dWnIqp7R4I0ueuAIciRnu86iysP58ZXTT4bMMtH3tzWsXy
         p983TmLImyQik9P/52AVAjMJ+OxTZWFTpMA4EJ2C8HKe47XyxcQBrd7gZKdyK8TcmuR4
         /iKLtG85QIcIyxilVhdC8Ul/F0p9MaBYKjtNnkdjiHZb4uvNDl6pwdK2gAUYzoZhvezl
         VLJc31dCq7qHkJOjjLjmd5Z3s0ryi+39COGE459YQFu78FJDNg1fMKERgO6/x9m0AUDs
         gJ50NIi4TDsIORDwSKiaGoYdBuBZiUoWLfbXnh04dsoKV8K7W9esGq8szQQONFdfN17u
         4QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749179; x=1766353979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRhxsDSnBcu0kxb3BQ79sAL2tYyaxkbiHw7liK1hHM4=;
        b=El5CiOX+YE/6jIRnfi/pyZQTxj2TPzCmTzYPnRD1Mzb4ZgcLNH6UYi84ReNPr70rz/
         V8p55LZT/fUTMnoZGcF8bekRYgoM5JCE2PIZNYecW2OCkEo/LJE7qidimi1b3fLuqtPN
         y/Rc/LdxLoNTI+nRQcS/zKEWmdIiO1KEa6L6nuLkR+w7XLfowI+QEN0O2mLZgz9AN3Y6
         c6UExlZ4wvVnQ9RQ/cObN0T3FmP0V+wwxKKZlv1lvxRU8FmNSsq8Y0BHUwFK5+I8zrYz
         ktwnIZUVmB7TP9WSebb+Xu6YorZFd7CwJq5GuesPI/WEtska4q4uhmZNY3mu3O0PnESf
         FrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNv3BCngWRRu60ksRJichR6QbuU8hBIQMMOcwY3CJfxE92BUlt0Rd95Foad2yEEdUEAu0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6fHHu9g7vmblTCww+rM0XsqRfhso8P3fzg2Dg0q4vBsohEfHX
	Q/c6KE2PdkCscaQTwuxztJkYx+MPWoUBWReAdoyim8QseWVL2nV0RMTm
X-Gm-Gg: AY/fxX5tura1IMH7tucuN7z5yIOtnx0p9AdXM+C3av3983AljQbXPjeNG1LJF3VCvN3
	Q8YYtNfdzMw1LB8FIR3KVODW7AG9UE+m4dTSW3O7N4IovmhpiPU7VeeumH+HY6osennSUWXM4Uu
	9x2ZOnjbL3bLe3NOkOiRViLCgOhejonyusYu/UjtNW8ArEwRXvxa75ifSYHxuGfowRvwykWYE2/
	XiL02/aIAbIj52LknZMjLKB72P4BLRStfeiwdqtkew7H0xbQuzBqSRYtqx+v8hoNSJaMkHZUkza
	rNhHv2FYu7AHgH/KXD60Q9p2yhGzktEpByAjnqh7qO9/L/IHrU0rTW+9lu3RyCGmQhDszcE1k2h
	1kLemmeA8auJH3t3YyeqMio4Rr1N7gRhkXeS+VkrvBBIJmjeoE/p4F/PE6qXDFohS9M9+uhrq02
	UkTJADtBcdv0BX2LvighPp+CGC5xZQid/iTGCNHa2Q5/k6dO2omXLl5cff+1fV6sh3U1WsHwCYW
	sg+UBH/QT12/W8=
X-Google-Smtp-Source: AGHT+IGVF+JuPVqrMiFOoXCrZyreYbmCiKRs6E7j6+fCdSvfmBW907Gqxw2wCR/3a2VIVjaT/n59HQ==
X-Received: by 2002:a05:600c:45c9:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47a8f90c516mr92963995e9.27.1765749179466;
        Sun, 14 Dec 2025 13:52:59 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:52:59 -0800 (PST)
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
Subject: [PATCH v4 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 22:52:47 +0100
Message-ID: <20251214215256.5812-1-stefano.r@variscite.com>
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

v4:
 - Change touchscreen label and compatible string to "ti,tsc2046" to
   better match hardware revision
v3:
 - Remove unnecessary status property
v2:
 - Move deleted nodes from SOM dts to Symphony carrier board

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
  arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
    carrier
  arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 331 +++++++++++-------
 2 files changed, 355 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3

