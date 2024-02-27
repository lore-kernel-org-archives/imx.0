Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD814F961
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071500; cv=none; b=K1JHGRgLgX5ZMU2EswbG1Qp8LUHwnAsTRqoaUiZk4O0+EgU69mgP3o+hxjZSez0+ErF7fSwIqT4sutmDtu0oIULF6/gtLiAMM/nKujGb3tr73jSEJjwuLAGwp2mDhMTLTHKMohw423h4MSv5i8covklPw2OKy65s2PO2kKBKLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071500; c=relaxed/simple;
	bh=F7sfpiSGcDO8hdP41H1GuO7gilXG9HPvCrlGgK7UDk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKi3P97Mua87RgHI4eIDc4S140usWLorXvZUncG/H9cCHiDJo2GLr2imAG0JCIBp9oS+54eMeOKXEW7lnMB/eFC9gWkGTV3lazi2TNUcq7Ndf6apaZe8up9/qh1fW0F7XD+MoAnQVpOeErHaPwcZntbn+GO22/QVflDdaaOmFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1JVcZ6P; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1JVcZ6P"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68f51c5f9baso27366046d6.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071498; x=1709676298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esEHp5IAk1LAFDu21p5+aFW04wAykxOmP5opQf8qNeE=;
        b=Z1JVcZ6PYLQrIYgzX8naK8S0EAYq+dSFHptkotuv+WZS9JXmTzdLCXeGVWIHsM9ruy
         q1BlfF44bptMhZ0gDo0XMzoCx2HkbUSs/hNjiiHRh8TRacNpyynnTn9BaSUtrlfdGAUB
         L/pGjpR4MwdGorx6dNs3kQhaTy0GkKQ+TYLDnWBhZluAmN69gtaOVEvVF+1dRQhkFcs3
         OOfhS/zrafKp0AnFR/+IzZh/tkVyAAeM3GgMDb1bEXuVj4uQ/fftEYrZf0ENIAGnlR81
         DQxKONG+IX9EMnFI+ojK/PE8P8P7Vq72BX4ooUO02FrFTWa9MFF0rwifTeZOkgBn8D6l
         myrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071498; x=1709676298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esEHp5IAk1LAFDu21p5+aFW04wAykxOmP5opQf8qNeE=;
        b=LATtFY/R128cmVmQzLNtt7Lbm6he8xYhwOVRhcbRCCiGpIOuYCVV02Yxy2MoibFpwB
         5pqYfzFsPLF84sc8y8C6g4aiRadISLhMRVsPQeOTUcaWLX5qX1zQlUjX0VZeGAE2V2Dm
         +9hidml4A/enntEIDlQ0hSqgpSlj/JVou0ba2/Pqb84v6SbOtBaiN6wos74LL61SGFEy
         kcK9ujMIiHMS2Rr1+4dfPQUq64N2OFtsXfjldzO8BZXjcTOY3oCcON0nH+ncS6/QwDi3
         gGhr1SHlCvjF2CN5wHa4WRwPTJ/ZCxaixsjdlu+LRI81YGFP+FCHH9HxxKiWcvnWKbnn
         P0uw==
X-Forwarded-Encrypted: i=1; AJvYcCV1KxCvCNovU2XpYoAwgOAsQ1oiwh04O6IhtasJsfUbR30zsPyuAnjwYzcZZB4IK+aZNkf6/fldaX6ANAIqnzBPeRws
X-Gm-Message-State: AOJu0YyXs/GGg3ZWvfFuctH79EakCT2VgLyLfv/9Bc3fqp/MJn/DMOOp
	Cd2F9wmjBDlnH4FSORoOusuaPADub/e6hegjN10gXPGCQfYmVOO3
X-Google-Smtp-Source: AGHT+IGn5PgBGXXbtL2C99AFGADyDEM2sFQipHcdN8gdgBqVvbj3IceMPZ+eiCvp0jaeqsS+XJ6VjQ==
X-Received: by 2002:ad4:5ceb:0:b0:68e:e9d2:3e3 with SMTP id iv11-20020ad45ceb000000b0068ee9d203e3mr4169150qvb.46.1709071497829;
        Tue, 27 Feb 2024 14:04:57 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9ee3:b2ab:6ca:180d])
        by smtp.gmail.com with ESMTPSA id c12-20020a0ce14c000000b0068fc55bcf6asm4569556qvl.119.2024.02.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:04:57 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 0/6] soc: imx8mp: Finish support for HDMI
Date: Tue, 27 Feb 2024 16:04:34 -0600
Message-ID: <20240227220444.77566-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M Plus has an HDMI controller, which depends on several
other systems.  The Parallel Video Interface (PVI) and the
HDMI-TX are already in the Linux-Next staging area 20240209, but
the HDMI PHY driver and several device trees updates are still needed.

This series is adapted from multiple series from Lucas Stach with
edits and suggestions from feedback from various attempts, but it
since it's difficult to use and test them independently,
I merged them into on unified series.  The version history is a
bit ambiguous since different components were submitted at different
times and had different amount of attempts.

The previous attempt I did used the wrong starting point for the PHY,
so this update includes a newer starting point with tags from that version
and fixes from various people's feedback.  I hope I caught them all, but
I apologize if I missed something. Any tags from the previous attempt I
made were intentionally dropped, because of the significant change,
but I kept tags from the newer version I grabbed from patchwork.

Because several items from the last attempt were merged, this
series is only focussed on adding the HDMI PHY driver, and enabling
the power domain, irqsteer interrupt controller, and HDMI pipeline
in the device tree. The version numbers are a bit strange since
these all got pulled from various attempts with different versions,
but I wanted to push them together as a series to complete the pending
work.

This series restarted at V4 based on the version of the PHY driver and
the other drivers and power-domain changes have been applied already.

V7:  Patch 5/7 marks the PVI driver disabled by default to prevent
     EPROBE_DEFER errors.

     No other changes to other patches in the series

V6:  Make the PHY driver depend on COMMON_CLK to fix build errors
     Make LCDIF3 disabled by default since it depends on hardware.

V5 primarily updates feedback from the PHY driver itself, but a small
   adjustment was made to the register size in the device tree.
Adam Ford (1):
  arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module


Adam Ford (1):
  arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module

Lucas Stach (5):
  dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
  phy: freescale: add Samsung HDMI PHY
  arm64: dts: imx8mp: add HDMI power-domains
  arm64: dts: imx8mp: add HDMI irqsteer
  arm64: dts: imx8mp: add HDMI display pipeline

 .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |  62 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 147 ++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/phy/freescale/Kconfig                 |   6 +
 drivers/phy/freescale/Makefile                |   1 +
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 720 ++++++++++++++++++
 6 files changed, 937 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
 create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

-- 
2.43.0

