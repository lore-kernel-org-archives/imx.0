Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5D37D114
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068374; cv=none; b=P9uGmMFzLV7km+M+Wxm9rHBedMZXv3QLcpsgdvSOXUHWwPoHEBKXunuuxglXfH9KXTp+7T+ba78z31TvB4lLx56vcPsDHVJHHiaPoYXJD9nMmQDGPxtl3X1KJnKRczogL/Eaa+XIEZCB+0qdSfrBJ0i5ROm5ccerLtUyXwIe4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068374; c=relaxed/simple;
	bh=AbM2+PdwzaPJmfFBoOmafSUHXuSAXw6gY/hyZryufoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqASokoQJzbK0VOoWdzo4MfjN9m3xf9A1shfmvMhmEyGHM5zkM0mLzOCo81dW0d+9OWgP13bMfrq1ndqSs/EWLXl8JHoFRx1WwTmz5tyJERj9BZxQZSanqjApdhxhoW+MKx9/rHjEMxUlnzhty/KTHmZQ/bca5A0NeEQwb8WvZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjOMCCmj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjOMCCmj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493be1b9682so2340795e9.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068367; x=1783673167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=ZjOMCCmj2LtXhta5uIWReHlnOYaJjvxm8Bt6LimtUIkNCX4R+08uzrVwp8Lbv833Kv
         E/FJLxZ7q7VRy3QBEZ9oeXD8t1U9mUo7mfBaSjITdppEzlW2spYmQRgA1ma+BGQpSXPv
         tVhSDELhz3bfebM/CAmhTuDoYy+lOvalbGclXJ1P+dI1q/F9B9aZ1wd6Iou6+6YztmUA
         TJ9ufDpLm4UhrU1UKOSYrNAA/8MCI7oKXT1Z/ovaXJ5jxL/HQDm+zW25Oob1aT0iatTM
         DzNq3VJMGXAjrSuwablZvqQYc3SMf1u748mFKJk4jWeeMIT+ML7n1c4zo3gbQgV2yRZ0
         dTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068367; x=1783673167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=ic39X7U/49AqERqr4TIVlzc6OT+UXu73eVUIndg+ehZRJ/ZrVGoXrkouSBBC+bd6Ys
         k067oWPmIXobAABNAUNroOl8Uu0BQpALpOAhexT2B8glPTQ9hh72fesT2SBlG3NXrO/S
         BoK+yNPh+NtR7TfCvvJ4DehZoWUUiVu9w/sH3mYlbmoeSADSVwX7RiwzefFvhQe+8lj0
         VGcaWXg8BlSxAoo8St1iKX8fRCgrcle0f7Ul08/3gd+x0R6WkYtjFrUV/9BzI4lchPX7
         HlcVR0ZMJmNX7O/OenPMI21IT7B1VduBbwQj74DS5dHqps/0FYYDvlUv6nZrY2b370tD
         lYuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tXEBu4T0rl4qV5lifeShV/xp/9vnBZrjCLy0omCED0y037b9ZUfkQJsGo3bs4mNHCTCI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjPKoEwKE+bFLTtDRFR+X8cPwT8D1MqXvhSRe69hlqO8afFi2p
	Z3csbIwDTd1MWn1iNvjOzTK0XirOPXIE6lJEx1CBrc3YVTMSoOKxrkrv
X-Gm-Gg: AfdE7cmnMCKkMM+gkUUATlQFfUjYgweN+Btnh5Xe+gHvjrCrl49rJuVDsoRjSg700fG
	WhUuKgUH2XtEp2bPlTTMb2R2N9av2IFHpLvCKWxPWW4tu7BF+APRXxcByhnl+c9cr84d9ILilUN
	WtHJLT6Xx0JvCZxvsboeVnacnKGpk8OokGMuVc9BnnaPC8jeBHMgVh3Do8mB02XnkbhvCEaFmzz
	XcIuDpIMemHcTXYnGEt+RWEgcx9SwIr3eEl8ELKz77qAWYlQdoP5Am1870bfKs+i7hPYRjMw0iR
	bWaQrvYpAez4aZWJrkV6odbkrdAPtiZ3n6fo09ZIJnypGnN600wRvHDinoCVHUrvvYBjdOcs+5J
	/W2yx+n90nIS+lxd8NETzXSmPxIokl7n7GnOAt7G0R9JUZhWQw2XLnxCsoYh1z/ckOGqzcblOo7
	V/NgvRLcACvlC3lofqWj51Dt0r38nC4f+iBBjB0THxNE3NHZbVwjF2wUKGNzrsiA6mRtaZuS/gb
	4FPD4ScewzZqNWNeqGxRaGkIw==
X-Received: by 2002:a05:600c:34d6:b0:493:c6ed:a044 with SMTP id 5b1f17b1804b1-493c6eda218mr71854355e9.34.1783068366968;
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Fri,  3 Jul 2026 10:45:47 +0200
Message-ID: <cover.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MN VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

As the i.MX8MN device tree hierarchy closely mirrors the i.MX8MM one,
this series applies the same alignment already accepted for the i.MX8MM
platform, ensuring a consistent hardware description across both
families.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move SD card support to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mn-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
  arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
  arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mn-var-som-symphony: Enable I2C4
  arm64: dts: imx8mn-var-som-symphony: add wakeup sources
  arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mn-var-som-symphony: enable PWM1
  arm64: dts: imx8mn-var-som-symphony: Disable internal RTC

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 364 ++++++++++--------
 6 files changed, 446 insertions(+), 157 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3

