Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF82848A8
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765710351; cv=none; b=b63zGVGcsFvEqpRV2n9j3piV73owEUJWGjX0EMW3hB60s/xXlOua08cg2gKcQEH4vjoAv86JzDvC/9VA7VTJou619l1e5J2Z2azQYMrsNxU2NQVBZsyDRS/FRGCNTdgy742jcrBZAMTHdZBurAyXXZ00/k0V8AZCWcO8AJ+Mifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765710351; c=relaxed/simple;
	bh=3w0jWvbK+rTHWt5ZzaeVvtNMSp8xGYHosN/3BMwLrAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzAt+WwDjN3aB2I1HQ8V9TSY4TdvmfbARflZmd7+L551USDwCBtW8lwn2ud3JfKc2oWQDIHpmne51m69vSMu1g+YTOqksDvZhBEagqPTOJTsjQRZ2WFYekyo3gCXAOgu+S+adCQj5efbyug/htTSykHtmVaphiXLOULqdNuJ7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flEaiNpr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flEaiNpr"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305882so696798f8f.0
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710348; x=1766315148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhdeJ/LLR6L2VR6ptJ7b8rQmhPTTZ/qiN+icdGZwFSY=;
        b=flEaiNprs0silXPsO3ebzdXtdC+JajFZVeRJM+gBXcDS2eNF2+C8I4Iqf7xbVs8DuR
         nahNvNqT3zPJsoymNEyH6TOiPFrOXoccVqgOqcvnR86GxgIRSqJpuC0nO6PDo9Ut5YzC
         I81Ych0uX7wbOfVxIm+Ofbt5OrFHSvYPGaAgP/HJWtJPYvC5QK7/FeHULBdzbAqPxTr0
         Z0etLRWp6bfEfpdUvNSVk7UzpilqW1s2WD3wVp59owa9e0bemeLcQ+AlVyhrZl68SAwz
         QqlE+MVUadSlX9AXZ4ILQNQ6IT47AZnwgyrHINn0GFJuejSbqm2Ot8K8nPgKAeEDQWxa
         d7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710348; x=1766315148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhdeJ/LLR6L2VR6ptJ7b8rQmhPTTZ/qiN+icdGZwFSY=;
        b=YyEHd92LsuC4Z7vWTYZKOd/50HyqYLFsGBM5V+aiJxd4MU8/iLFcgUAFiB3vy+y+JO
         xT5dSqsW442fnDYnYeD17UqKR5jY4MabEYtYFK9LNSoO6XC+T51RrE2SHGbFHSDfORX5
         TMSzRVh/0sHmTqiEXSuX3Bx2uhRwR84Vh9+6HpGQkII/q/iymV2k53fDrpAkzJ4cyrEB
         7Ei0PqJ32567AnHdpY1cwZTtRwkimVgv29zmJ+GFhtX7s9mrbWpH45iqcP1X1pw9OVWM
         q0uuGohK0EpY2+ZrvV+ctY9sp29VjaBnqlRc0yKd9ocM1gYSvYabcHi1H0Ne+aOKFbP/
         yxaw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBs6iPHkV+wzrLDnrRO6UPexX9uECLIhAChUroEYYoR6IWn/SGIFUJXqHprkE3EkNGhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvGaaxjvUD4zaPNsN6zmfuMqMQdD9zgfo77CbySXM0h8HgDQoV
	ie4FYlS8gwvPWl/iTeyl/1E6DjPuzNDoW4Jd9agsEnG82B4/PYU3UnZ6
X-Gm-Gg: AY/fxX6KwmayWJWpKCqWxjgQOAguW2C060PoVJmdbLF3Dq8q5XLDBQkffZ4bUiWINPb
	jM7unGh/64pJV1/qDNe8I0ShmHtfqiOZFhXksqlaqmTuX22J06RBa2fzL63jr3Zup0xQZ0/1ygw
	rlKU9LO7Hj/8kXSr413F30nDWIspyKfDAbVwMTxa+uGJFPW3vEbDnJkNtVe3Dn+CMF6G61r17NQ
	5rrv6g8cGbMvhlcI1i6kxGbM+rudZf+uYKdoi28ccdEKWu6NI+C2vtg6gCi2gQ9S37K4fnv2jUr
	sXp0gzjHPJOesd0Dj7PYyYeqKCUHnYTSD01HUpi8VvIbQj2b4DKYkE6FJKXUJl8gY3kJ9B0GI90
	c6WwbvsSboYvGTjdQDb29LGG0+k1LF1L00F3+CkStJP/w1CGua+Z5UfCdks5J6cg8YxVFBqAuuF
	zeVLViaiNSb18zNuu947+ANxlrVpQxbiP9qXshTeaUaskyzY+IBOq55CLjHC55RhDwUjevGI0On
	B6n/TXK7Ld+8ek=
X-Google-Smtp-Source: AGHT+IFTnNafx/D6K29dLM2hhJp5B/QbGCDyXRNcOaZQ8W5V4WHYPBO/c41/tJWjVv0ztKQKXFtfFw==
X-Received: by 2002:a05:6000:2f83:b0:42b:3e60:18e9 with SMTP id ffacd0b85a97d-42fb44d4426mr7867198f8f.10.1765710347568;
        Sun, 14 Dec 2025 03:05:47 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:47 -0800 (PST)
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
Subject: [PATCH v3 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 12:05:23 +0100
Message-ID: <20251214110531.9475-1-stefano.r@variscite.com>
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
  arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 331 +++++++++++-------
 2 files changed, 355 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3

