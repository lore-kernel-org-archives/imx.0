Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E7F3DEAFE
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449994; cv=none; b=lWuShgalnyv1KI1J84aAaQCT7uFQon57dkAdF/0OetdbTwnf6Sdc9QBUFv4Q/AWGwVs84smcK4VZaxSU9SJnJK8ghcsqkW/qZ2evhZiy3NiUEJdneyol/3vMS+Zyfs61GrxIIrzTlFMMARRP7O7/Q21M0aG/08R+QiXAt6kcOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449994; c=relaxed/simple;
	bh=kHxBFXyBEQwW+JA+T/tUhZ9lPaGuYJ0BEWTAZcwodGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kfnkhFlRup5jezivQ8n2p8CM7l9lepo1u/KNUi6R/YFr0anyCAtCYSJq+QZI3hV5RaXkG6KlAS/engvknINpALFS5AOYBS5ML/aybr7wd5iwVt8jfxSnmpvm1NmBKRrU4XKHl+MALr//aRoooNzma5cBcWQzUCYYaK0Ms7HO2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV+qT050; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV+qT050"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b88b7ca76so861272f8f.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449991; x=1775054791; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIJ6bt/DVjHXVsX2+SKn88jbhDMD1b3roo62WEZzt0Y=;
        b=nV+qT050JtKX8oszwHj7pd/VxVY4/bdzoWCBE5y+fTVegbuLS+nrSUmA7fDm8AnUq8
         V/RrInTTUrg2wZZ82Sy7U2T4/pnaMgMei/BaUmajCbqNVFfs/WJDte1DApsEWTYpQzwi
         +L1buZtqvMDx6bUJ3LyKlvICziDDgEJ8TaIvQ44z2Gbgov/lunCRV9u4lt2aOVPO16Z2
         Yqn23+e2eIL2slWU39wDCsk5GVi2RuIBZZ3nCsQxBBPjI33JNQ2rSJ0TRjMw8BZEboy3
         +jD2itCBSXWl/A97ixr4BUMDJ0vFd1Es1ggEV6RMG0Le/z6XfI7rhNmGNkHrFHCYk4OQ
         U9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449991; x=1775054791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIJ6bt/DVjHXVsX2+SKn88jbhDMD1b3roo62WEZzt0Y=;
        b=lR7uoSqSBDn8kKPgXZWw4fFJUuPD6MI3tfrPiwcredcjcx830ndlMTDNbjbJFgiYZq
         VVBILwqfUYMRj2RIG7yOQm2EkAgvpPrknhu5q/ymG8gxPCgOiXxnzauDdD4xHiD/DGFw
         xQSKo2Ce7k2KajO7MOKbPFyMy+KkBxu0hE0L/qZUMAsMAzvxdZOBnTkE2d6cKa8XRCLd
         a6u+R8dA5GnYkOzPwBaHtYFvgdlCnYYDkt6ALrlX1iyLlFatMg2+SKQ2BltA0X8TPCKW
         QT77B9nH7wtNfUsg9LWWnRQRY83vbJrJ8X/wDwJoIbxC0irI0sxzqCNW5A3utvVHhE/Y
         awpg==
X-Forwarded-Encrypted: i=1; AJvYcCVeIIYUHoqwEge3K+Gjlyus94N9XoBeEygoj7ogTmXh160F0mhUgU+vFdPUEcr7DBiXlKw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy601hj+UZVcB4EdynnUmwCh53eafF6ZnLaXlNfjkfjU+yFWZuM
	NTBklD44Ilk17gCF8PB6FaLm9y9PhNJVM3usqEMxUPlaV5910EyFWqwj
X-Gm-Gg: ATEYQzz5uX3M4JtxWAQs2oxAQFvXC7mSYAaXmDGcOj0rNh8IxXCkiuLvYg7S/vxHqaY
	WTGGG08Kj73GQJHwtqjEhSs2CTUTn+WisA77HC7E2ikZGEJqODBJcth59YvlUaYsTsyRiL6x8wl
	0cx7j1i8DMXmgrfOJk23L/J+B0V1TIc5gJjz5GCOvbXOrJkPidRxr8JpU0ekMvqSi00Q0HuJSS2
	J5HftjoJ31f+NyatcN7dmtziApiGYvE3Ckm78SKuudR7KNtRdsj1pX5gu2ke9Cgm1GCk2CMxPAP
	Pi8Bi5TtxGlbdMuxQmWM0T/WUnO8HaYzpcVAWDEcYAIn3E2lX0Z8ggsHx6WwZtVQlK7og2m6c/U
	ncpYyOhQlwl7royPRJZwuW2C49susXII8vL2+LQkoQ6foHU8R8ZnW0Ojyt5DyKclAZiS19sYhue
	PXKrh/jA+aw14nX65sq6/emUmT3i9iY8PCLEfRTuuzYYGzswMFBKSqs7zbn0gBKO28U/k+IJpKX
	vRh3uDV1QRVDaY3c3NkgBRDPMk=
X-Received: by 2002:a05:6000:2385:b0:43b:4396:674f with SMTP id ffacd0b85a97d-43b88a0d0b0mr5635919f8f.55.1774449991153;
        Wed, 25 Mar 2026 07:46:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v3 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Wed, 25 Mar 2026 15:46:01 +0100
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACn1w2kC/5XNSw6CMBSF4a2Yjr2mFMvDkfswDvq4yI1SSIsNh
 rB3CyPjSIf/GXxnZgE9YWCn3cw8RgrUuxT5fsdMq9wNgWxqJrgoeM4lRPSWHFA31RKeQxg9qg4
 ar9wdHgRaBQQtS6Xr0khpMpakwWND0/ZyuaZuKYy9f22nMVvX//yYAYdK5I2yXFhs6nPilMXpY
 PqOrQ9RfKhZ/psqkqrtsao0lqaov9RlWd4L7OILLgEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

This patch series adds support for the Toradex Verdin i.MX95 SoM and its
currently available carrier boards: the Verdin Development Board, and
the Dahlia, Ivy, Mallow and Yavia carrier boards.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
interface, one LVDS interface (one or two channels), and some optional
addons: TPM 2.0, and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
---
Changes in v3:
- Rebased
- Link to v2: https://lore.kernel.org/r/20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com

Changes in v2:
- Fixed imx95-verdin.dtsi, imx95-verdin-dahlia.dtsi and imx95-verdin-ivy.dtsi node order

Link to v1: https://lore.kernel.org/r/20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com

---
Ernest Van Hoecke (6):
      dt-bindings: arm: fsl: add Verdin iMX95
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 20 files changed, 2947 insertions(+)
---
base-commit: b4c2be6e5620c5054299aaf63e89412f08ab60d8
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

