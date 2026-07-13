Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736631DD97
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955214; cv=none; b=TjV3x8mRqd/L534T7piOx2HLwKz+w+gvMAPWVSoSu1YT9kY//5NMZMVRSevTK7aWmk1f991Vhosnvl8w4po5HYU07REXSTe36Qebvx386lQiv2ry5mwW7M6K9aujVDs+NeaQND04uDm2TgwjsJdW7qXThPOvYrZ2YaYAyB/KUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955214; c=relaxed/simple;
	bh=ZezuEM413hS1NPQM3ReCINFc8m8MlFvhuKOknbM4Vjk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r1oQFlVGNRE/8/zmH4bB/3i2taWxtl74T3b+3a3KnQiLMR42N8AwypWD9JsXB/y9+ZlAjTpykt2yLUBZ5BxxZNyIxGSanB/R2m7vCy097zAc3WWJFwMpbjsfU57jhiBdGUdBdQaD/NIVdlMiDV+O8n82IyqPUN6N+K41rU3jX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtKAbKZF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtKAbKZF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1110463f8f.3
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955212; x=1784560012; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9S1PRlH/iqWvGeBsKfAMCNUYuSclIYuofwpciyu1Yoo=;
        b=mtKAbKZF+mdMYnsXXMQMeY/2vKlonhPaSKQnS8jLgKfQoElFAve5gc8bXlqDK4fTcO
         1hz0TFgYwvLU9PL7NyTTi8n0Z8ZgwO4DmjxbEQyGyiDBBQgN/sJ1m1JjBUDmZLPK4A+u
         At/HWkojXMwHhcooGTclwJwq9+uzQZace50j3AKM1yo8sZe65YUzJdOyD01OBRGTcdjy
         +xNT69IGSYk1kUs2EVIqaHTTKPhI0PVY9s4EyLgBf7ONOF6zRmzf1RYFaIz3GOHU+x0s
         4ODb2kX5L1uh6TvF9ejgxRk+q5j/J1FNNQw6zqPiB1yc2YT9X7Rtyp1Bu5jRZ70NmnI0
         fseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955212; x=1784560012;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9S1PRlH/iqWvGeBsKfAMCNUYuSclIYuofwpciyu1Yoo=;
        b=EZbRbkfHar/izYd7A5u7ScTG0yD+vcG/4wl4xZLUugWXfB+IieyXWaz3E4MUlN4I7z
         Scco+gI5uup3UNlUPMCypDsXNszsJJE+YoYoKS1yccVH+22IgGmMfz1wOhr2q/7aUso0
         gHuhqupUnkVuwIuFKtyhNheljss/OD4iKiM4zkPsu4hl/rNcVIddBOpQfjVvWqJnPLMX
         IKPes8nWZXpODHr4+BnceksJLCK3Jut5dVHtUaudjfYdkZ34LWGrAjpkC5bRB2Fr1od6
         u++MX9iS39MA/6ehK2YxMAJznI6R6bv9b7zZ8hhYxYWIio+FkoaohsJt1H7aGGKQj6cv
         sLcw==
X-Forwarded-Encrypted: i=1; AHgh+RohhuSJs6hsx67/cgyNagCdfzicT2Ti6hAvyx/5vo+sn0CuEUMahzVb/MBBGJL4cHY6Xzg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtwIkIu2UM3qus5PNuzdu7eN8OOKX0ljfyBDiYzICHHOAmW5cX
	fcu6R5DvDNuSf/lCZsSlH1LBwsfeoI4yqEKyVRQcX6UiPfnfHof6r7CO
X-Gm-Gg: AfdE7clWLtJ9R16oewrqoggM+o9CYnSjRNeFEWUQzO1zvyxSVvdzE6Z0DwjlokwAngX
	lG1wqrdFQNUIov+/ragnMIvRb3eG/T3+wW+fFMOTRh3sMXUKE/yNjsw+BBHwmukHMobjQp3zqmb
	xXDK6ZVoLdaGKP8oM0nOjsZO1WYTIwW9oieEl5a2Pyb2tb7eiK7moHF/4DTjJ+BnRGgOaouKId1
	zbWmfd6bYntyqEALLczUeUcH4gUamS4l7ai+vkZXaKMNHFSX06WwPkRcIJBm70zAzMnifqsFzsf
	1IOnhJvolEvec03EPNCt6clUVr9OGg4MeE1cGxhXY5xwLSVc+W86/isp5GEbt4HEBFTfux1sm0j
	iivHuxrTZVZ5lkxN7v+FDC2DLjxG2KsOnskewiD1C5f80Jc1YToWs/5rK3ucanbSt7N0/WeMHW7
	Fw1sOySe2WqiCKhqnTZZzWS+dW5y5j8wfGht45Ds3lC/wcM7KLt0eCr8k2BtFfsNfVaCHfjt9CW
	Y6/wS/jr97gg+EN
X-Received: by 2002:a05:6000:400c:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-47f2dcd71f2mr11505336f8f.37.1783955211246;
        Mon, 13 Jul 2026 08:06:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/8] arm64: dts: freescale: Add Verdin iMX8M Mini overlays
Date: Mon, 13 Jul 2026 17:06:21 +0200
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3+VGoC/x3MQQqAIBBA0avErBtQC42uEi1Kp5qFFhoShHdPW
 r7F/y8kikwJxuaFSJkTn6FCtg3YYwk7IbtqUEJpYYTBLDFTdByQ/TN4j+5ez4RLp7TstdXK9lD
 jK9LGzz+e5lI+RpD16mgAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Mini
SoM. The overlays cover audio configuration, display adapters, DSI
displays, OV5640 CSI camera modules, and Cortex-M4F integration.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
  Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators
- Cortex-M4F remoteproc support

Cortex-M4F support is split between the SoM description and an optional
UART_4 overlay. The SoM dtsi describes the remote processor and RPMsg
reserved-memory regions, while the overlay reserves Verdin UART_4 for
Cortex-M4F firmware use.

The Makefile entries build the standalone overlays as DTBOs, add
ready-to-use composed DTBs for selected carrier board and accessory
combinations, and add representative composed DTBs for build-time
coverage.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (8):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

 arch/arm64/boot/dts/freescale/Makefile             |  41 +++++++
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |  88 ++++++++++++++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++
 .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   |  78 +++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   |  18 +++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |  14 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  33 ++++++
 11 files changed, 665 insertions(+)
---
base-commit: 10e06b5bd4be88cc89375227c31467734f6658de
change-id: 20260707-v1-verdin-imx8mm-dtbos-a326146c62c4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

