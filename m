Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076423C5833
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870066; cv=none; b=ES7/FqDDR62R3xDIQb1GW+HnKt7QSItyqxumzwqsdtuFcOBdgyrhVJ3R6/OzEzVoOyHJrOwgtqG36+cTZ/ySRRAOjZD25oCX5HpSdO1KtR1uZVq+iklYVtGDPwFthr8JDN7RCku7cBEqh8614zeBoi0KQWymg2q58+Wio/IiKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870066; c=relaxed/simple;
	bh=vwAxzOlUPI+Z9xgQ5oVMp/LaI/8upX7ZL6k7ABW4RNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Po6zoqg+ac5XrD9VIhL9vZIqE6btVuco7JUV6KmR2+cOgr50i0ExRR4BtJqI1oU1FmmPv/YSYlF7jYyFLuNdfYJA7I35qTK/11rrMeCkX9cD2K9wL5h1mTiYpoJESU4z3Uyl5dguaurwpYUhQiidscvoLCpoBnHs1pNTwX/KIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcOmWdzZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcOmWdzZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so40361535e9.3
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870063; x=1791474863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=QcOmWdzZJzvfCqwI2cdtMEmNuRDZ/4P+GjQew+vv9+xppFUhyqcMXmE9MLYlakLuos
         miyzZPCc2+3wEipYkprDSSD1H3tmNTZtsibrFa8yDtE0Z5n3GpRpF9ZqEp/Jp4SjYBiB
         fZgSN0B1w5G04mvxJCUUdDSBCKq8z0iwCHlX/TiDqspQ3M5J+9AUZIhfeVfoRKZ7bQjc
         zGXaCRlkJlLK9ISiwaXpLQDWC5HGhTK9q3kXXm5TO+xkk6CY5iMu3SOjqlG7Ve7zY+oS
         gFveVpGtOFfyYOqDs7ET7aLa7vzyabg7GjNhXGjYbhGGplCUReGZyGnQ3igdcS4N/CjP
         2lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870063; x=1791474863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=E8x4j7n9yzeqf4lGywNAmWc8bljJCPER+UBeqYKqTPZ9pYDajXz6ARsPnbWFFY3ku1
         IseWWLz8o1E3tceo5xu/7CIC5TO1sBcipt8P0Wpn3bhUTCo8eETWRLJRMl3RIx1+Fl1K
         ga0m5pRTjbFv1JKSlaNATRte/XvtIvQiRmNldlTJuj9ChY+SphQenoc3lGu940drt858
         GxH192CcRb0oOa6t2bz0ZmtJVw9kadttwTvrg89ox41EswEMCAjw+PmBHMxlrQOelwtG
         9sLQ1Tyw7aqSfk0dAqkuRhrznWgl6roZM8gCVZJJNF7rdy2l9S+vj17AmoOqnHF8ZmJx
         PuzA==
X-Forwarded-Encrypted: i=1; AKwUvBx0WOOb1x9s3JbQhesUFWbFbARfOQrK+3ZOxT3G9lTMWILU5DfikREXX34pyGg0Xknwois=@lists.linux.dev
X-Gm-Message-State: AFuF++niI8oBjqOhXEmjTeUY8Fxavy5RE/cTFIEFYV0SlOG2gk6HSLkQ
	B9oqiL3bZzcY6HH2Dapy60rJftFEQVUezBHqck8IFzqL8aSueoytryg9
X-Gm-Gg: AYBFou0QxthKtsd6j/t5nbHQK9TcmEm6gwBJAcLIyv/gY1Hk/WWdHqbVbZ01orIplem
	JIahMw3LaUGiZBnhi1hdKQihFnEAsTY1vVrBOxY7EPsQDsrEP4YojEZMhsQVYNlXLb3bLCw4Zcy
	wJDOF8RS75yeWVp89K7OYDrA/vAwCFGZok/2F+bzE5D6YfztoYtkawWTwimEJ1Riz+0IVXBLYJF
	Z2WqnIy1ndzD51Lb+M1Z26v6aKOL6F2vrS8Es1akgxaHt7goH8XTusiwkguj9spOnpuHPPefR5/
	wXdup6T/JyRTiik/VWNJfogIhRVkvOMATlk+VKR7f4AhoOcRfFsFBgDj9Fbby+MB+dMsLXHCQWu
	rZWqHrSSMdAXge6+PTwRTlH30Dim4FNF6NdbQuFFFmTwMsDOXl8RN8d3jK++Rl84U/eeoj6aynR
	DCbKtWdzdDvzzeAaGcm9ywgnej9ye6MjhoWtBvEN/Gln/jFRkUyoQ0EKXvKj3AjEkTx0O4JXay9
	QhDpxIrqrnBdWK9CdG4hcFTG11JYZrm+DYNPb+B2hpKb5ve0Rlu+ZWWspPuCtz+be8TWc8p3xAZ
X-Received: by 2002:a05:600c:4e4b:b0:4a0:263b:1f77 with SMTP id 5b1f17b1804b1-4a0276a1f28mr643585e9.8.1790870062454;
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Thu,  1 Oct 2026 12:52:50 -0300
Message-ID: <20261001155412.3177428-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover HDMI, parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- HDMI Displays
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Leonardo Costa (7):
  ARM: dts: imx6q-apalis: Add HDMI Overlay
  ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1"
    LVDS
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
  ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile            | 87 +++++++++++++++++++
 .../imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++
 .../dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 ++++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 86 ------------------
 12 files changed, 349 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

