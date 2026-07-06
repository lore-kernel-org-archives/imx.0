Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21A3BC664
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330497; cv=none; b=sf6T+jTwI04oPFCupdh1XcjjskZ/UgxCUy3zgmhhJSilzh8a8lhNXYkoi9c5MvfPcJ9qwMzp9Jn9wOS/SUpEm9hR/FJOLF0G//6eLEtjG8076R7ZryOislT3EoXCmAmcY4IzYhpuJmWYOIMt8HX2KidbrrgcTToeNUODVZw2Qgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330497; c=relaxed/simple;
	bh=WJ1pUGz3H29NVfnQag+oI3UwtJ1ZnApc7NcU8yMmEaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZoGGuokbjV9L5UDQ2vmjXG75DbWVFmAuBByxzgxqB0rZ0G9wnNOz3llafEAatb6rqXPlHVT9tVUav+a/k9SkloS/s3c6fVGu9wvBZvobMvjQJWor2hIe8+uonTYmonMdmwmMhoIQOJoZ3SQ1cgPBWWeL553mFJjZwWrUXXHabPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d71LKdq1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d71LKdq1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493d3135e9bso9335345e9.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330491; x=1783935291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=d71LKdq15tr3cR+L9H7KxLycmEJpNEnxLwoXi1gDFebOHc84si2hPoJl/P2ElqzqwU
         ke1IvsIJWp1NtfxBw8r1o3RtliEgk9t3unqqJQfMu3xNEbgBOPe8qVKWpobgKgjHeQP+
         jQIZfZ2B6ia1lZNOMR8aWY2DFB0iryilT/K49HhA4YqXTkQb72o6i1Mu3529ngPA/c1r
         k3a+hdYp9E8U0Uwg5wVR3zxHt97ydV5V0LGrFDszS5oNVaRlsxG+vKKWggWDdl6bd1Nd
         ZojpMjelBOdjCP2ZD/PU0uK3OfNdiHMeo0Vfx17Au+FZQRt5dEkvvtzWyjFFlguvaNXo
         rD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330491; x=1783935291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi3SZ++kAacHg+EPWvcKqDFoMdY5BW+h9pJVrkd2Sc8=;
        b=j5PSHLtpxwTMgC+3140cI9BbE0q5mlWxBNs+IXrDrHONfoztIMcW2wDeZoY8xZMeUn
         Iak6GWMGeL9RLWGPQtPvFkB0jwv64paMzsYKDPzhBgiFhoG9J4eMlMhGxCKspu9IwcZn
         bJSxrx2FDETCuhr7fRcDJ/gH1E1HN7AOe+jcWd3i+NL64Tc5qFkXjysX5I2Yd8ddsUa+
         leHmOQqS0LascfEiZTVxkj/MxuH1+XGauQ/t0VFfgmoAQJlnaPgMnQJ+b4zVoQRy0XF6
         Qs5hBCYN9WXlJyGlCUrGYDcRSi6SipC3FDvADmeLss/EfK519Z1jRXK0dfVnN5ZHCg2I
         hydg==
X-Forwarded-Encrypted: i=1; AHgh+RqFYSdsFB0juSUnhW75O/WG+0cUUx7SrIGGDTur4yuN9vSThIR01ETwrLU0Az81vxLaFxw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv42pbEqR1ReIGkH26AELbA7XF+CLzw3vdCYMNxso4bL5GSJep
	WNLEp4PPwfwIW/B31USXTeg8xX82hrKRKlyp2mzJ+eX21dDtnem2lox4
X-Gm-Gg: AfdE7ckmI/EcbFiyG4JijB9ncPvf4rHoMlvJ/3hMcBgw9tpO4RHtsHYW5yrY+VmwDV2
	miI1JjhUgwkPvijOQTf9dfOmjO+fkcepesLH2sbw2qIz3TJdUoBCHw8Jv7PnSK1hsoCcv+ieJ85
	OZ2NCaI0yU65YCxOpHSuLYEen7aGcT1Qw6Z5vPBSODZjHu0Y31Lru2Wi+EOOyDGzWVuDyFtJrDd
	9aGMIIeHVfVWFGVtjHYsZVWy8DbpPYdrFw2zP+Ns2WaBHo01qIjtI5b6yKRMu77g+xgTePIL5PJ
	5SpmyKEd5AeDPfQZEkPwV/cRRn2myZvnvAT7xFqAb+QPQ7Nr/xyXFeKr/KiHkPTkf2SVTclmf7n
	HitUq0wqu6Ryxvg9zwozQ6seJugQIWu7yGW8tSx/urgVW/N5e6/bNz3cziGLSnpAebxWOr9NVui
	9CXACNb/DZ+tTNIz6Z0fTHbDij1dZNfZkWOHRfkm0pCcoysCdz5TMo9l865QCsQ8oQqdtpfjgij
	i64zP36VlC5F2Wz0/o7ArXt4g==
X-Received: by 2002:a05:600c:820d:b0:493:a573:179b with SMTP id 5b1f17b1804b1-493d11f5b70mr109796225e9.30.1783330490591;
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:50 -0700 (PDT)
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
Subject: [PATCH v2 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Mon,  6 Jul 2026 11:34:30 +0200
Message-ID: <cover.1783330236.git.stefano.r@variscite.com>
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

v1->v2:
 - Update all the carrier boards and not only the symphony
 - Fixed commit message for eth
 - Fixed I3C to I2C3 in codec commit message

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier
    boards
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
 .../boot/dts/freescale/imx8mn-rve-gateway.dts |  48 ++-
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  19 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  46 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 366 ++++++++++--------
 7 files changed, 500 insertions(+), 161 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3

