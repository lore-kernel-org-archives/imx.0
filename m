Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500203054EB
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392291; cv=none; b=b/t78euo9RqorfpFKfb1uIX9YuFo55hNjfRaijBstoT/lHoneZix9brQNtXji8UF7cF2nVRLZ1L0pB3+/dJe3RaEwkN8zFkaOIwOAAu4UqxxVxr0uMnwsP1wHr0s55a6R07fH05oE++Q3PxFiGLkqiABoD0hV04N31a4tqfjoFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392291; c=relaxed/simple;
	bh=M4rN2wgG1cklaxP8Xe45wDB+gC/3zcKZg8QCp2C+dN4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NyjUycSDeyr/YIRzmbnUC3ZfPYYayskKB87Zef0uk+4zYABVNSo67DFe7ckMUoG3Fde/ofs6NYEJiyj0W2sj+PdZ7/b1Y6V993p4hzWyU4vE7c+9CoZntBfMSak5K4V/otHShGnzArYAXsXKvQuB3cM+NIc75NbaNb61QfD7Tjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fja5p0lm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fja5p0lm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so21323905e9.3
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392284; x=1773997084; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2itlYxryxighjPrEcU7jThIOdut7hYtrYJKXW7qdI6c=;
        b=Fja5p0lmZnyqvNunwxrH7kamVvlcblBcS89twrjNcidNIOYPMgbYjHRif7Zz4uXtq/
         kjWOkIuRr6uCkT+bLkmiq/4uZjw76FsC+0WEbE+SO99ZaLZQWBYpw70G6Fje31vhS1u0
         el9af1NX7TVpoCjpH29gykykqZQeFHeJwyWBgeJ9vLm0SLW1BdmWT0/jPnXDT7P+4Oor
         QIHI7OqDqEhFVVK9B/V0ysfC1vuVMWzg+yFdeOSlw8N0i0zL9YiINvw+VoKkaS4IPCW4
         Hxou+4xfYYxJaqjxhvwNow2EUp624Jac8MwgMcvbdP7vhDKV933Yc6uIBPGFS+Rgbpx6
         LgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392284; x=1773997084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2itlYxryxighjPrEcU7jThIOdut7hYtrYJKXW7qdI6c=;
        b=f8KhKodn+DZGvaMhq3aCuLopkHdSVGM5n/J6vDFyZZylQkxSOkXJC4vz6W6jEx8dTL
         ZWU+wi8pUFRhGTUHPEp4JOTAmO7uJ74P/Q+eFpdBjU14gN+kn+Y9HxY0J1QrSy+kUS6H
         Ar8AQxePaq9DQU4BThlXmvBvmV23hqSc831ksHoKAnuS82O22kqaLjUutfL9T7eUy5Wa
         4qDyJyV3NKjzZaAt7meIA9mWjc7iTacn3VC4Oegpf8SmBE15oOMsnV0+d279r/3a6+kW
         vmuz8znQbM0GR989fED1VC5RBKGpDhPkZQEMfLagiEMVks9myyif2E8wkykEupCaDjZw
         hRCg==
X-Forwarded-Encrypted: i=1; AJvYcCUvAT+woTbtsiR6SDdWyEJRt9vEsquvJOI/Gl+0YXT4c9Z7x8svrTy+/0HqWtJrVbV8QVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJmvI9nmBq5MDHrdhCufvb0EQ0aGsrjCafQTnxlemjG7F4/ImJ
	e//Jpv2mDGuDXB/zkDKO8gXIg4149I4VHeGWWGomszUEFV6/is8w1Epr
X-Gm-Gg: ATEYQzzXHQgFguALbKsJY3KLWFpNhNkq0K/tEg7DyfEMgriwL4s04srntslpPZ310Mo
	faz3+dNiBXtoWf+O0rt7nh+HiP6BB2oGHNTkNlrdtvJeqJzeht7dVJCBl8uqaGLXdfl7ioLalWr
	j3u+svU4VUgDIEJgO3UGUP+gtTy7nrulxyE/L+SPZTJxUQ66D88rrxm+A0W6AoKfkn9/RqlvgZC
	Y4lJd8t2Xh/W6pGZxOp/wOSMVM118xksj2jtU7dn1KDc1vS66arnhIkiCjrgCwSfLOu7sb3usTe
	TI8BboTkFfvPz/yTM10C24UsgWaGOD/wgkLIMw+jjh8iVgKznicOr3K6R3JEpVjoBMHz+OrOV/M
	armuo9FTqsZdVVNaZ3bPRWTw4ZFHf66Vi2KAYckXShbnFvDMDa4Jn8DU3c/topBW5tO6BR4IcB4
	gC9mWCctwziOy/QnlIer2NcqyAL+Cg8GbmhgwmoUQc3si6E3Li6mVUnCI7k634rpWUFXxefB9X0
	HQEvP0SugfZ8QMGuG1o0gKpvMw=
X-Received: by 2002:a05:600c:45d5:b0:485:4535:73d with SMTP id 5b1f17b1804b1-485566cfb8amr37509835e9.2.1773392283369;
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Fri, 13 Mar 2026 09:57:41 +0100
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXRs2kC/5WNQQ6CMBAAv0J6dk0pqYgn/mE4LO1WNkohLTYYw
 t+t/MDjzGFmE5ECUxS3YhOBEkeefAZ1KoQZ0D8I2GYWSqqLrKSGRMGyBx7XRsN7jksgHMEF9E9
 4MfQYCXpdY9/URmtTilyaAzlej8u9yzxwXKbwOaap/Nn/+qkECVdVObRSWXJNm3NoaT2baRTdv
 u9fA5NI6NgAAAA=
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
base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

