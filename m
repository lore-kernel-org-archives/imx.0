Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B109135A5C
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991145; cv=none; b=NErVSu08+we7FDf2KYk328F0q8oYQtF2Hx74clMf7r3fmKjLOPx+0+Az2siDLKFedQjPV/GtOjTzwojb48S8f9ge4nmwdkmfveghcgCOUzyoxiN6V/F9RxVUUb/2FixAD54t1wqoE/nroSBiyWq5Pp6vCV+WC6TvQ99i8keYmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991145; c=relaxed/simple;
	bh=TtompIHgbeY/OA3WXAshQm3+E9k8UAMGdrcANzV0VD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LeNRka4+D/pisGjpIn50ajGLPOpZasPIRtnZQRNsOJ97s6XAcwDZAAZ/LaqwGdQZqOq5nVykmzlsiRXc7ueLeSigYTSQMigsVnchW9jglWFuyNexPWPeTCvUSyll8GSe1/bl1L/NpapQe3cqossLL1JKA/76KKcsFoiQNukYir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnTtZ/lQ; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnTtZ/lQ"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso216422239f.0
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991137; x=1709595937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWIbvre+rElW1Hi4Tns90pWqujeQfsqDKyIvXn+Wd7Y=;
        b=bnTtZ/lQb1K9azxzAh0VZbAcp+VvYuT2jPMQVLxfrYkoe0rERLiBtTxdy4Qefdo053
         jcVvwdNXE5XURfUsvVW3HF2x16Sp5lMRKi8dNp6YT6IilKh3strh819J5ZPT73SSlMqq
         uc5vP4brBSIlh2O5EBKHEpoMiqspGD9+uz3Ksh4KALXvl8AlFybtSnrBg+okaPLqAI1T
         ZmaBzg9nPqd8Mc6rgvQ1+LbzTt3TdAyv8rNoDM3XWcnNd97zVi3UCjRzuiB4YvuQZUdW
         5wHQxNISCTiWS0oxpl4zGTXqwQpx+FoWXUyrYameKX6hQuuVb7hsaivGerF61kAn8U84
         gr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991137; x=1709595937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWIbvre+rElW1Hi4Tns90pWqujeQfsqDKyIvXn+Wd7Y=;
        b=EBu1r7lX9StZpJq6G+qilcXhVZQongOO2emlkuvkz6XszTPE2l+ecaXKV1HZ7OPSvy
         MX2jZgPf6mVu1YVOhmqz0TMYpDxBjluSLFu4SpUOikcCCrMX09EynVHqSo36bW3shNlv
         iqUbTf1uQ7SFQXXmSOiUtiMXbr7MzeF9b5oRmRGbgvUhVqO+VevaQfQ9CgUI6kBgUd5b
         +SVMsfUJAHJLZ7il5xIIsYoN2FM35J2uvXQqmcdrKuYc/1ob2TqZrc/m0YcdhhBnNIEA
         B0WTbAVHKAwJEB26LoHXPQHRfLHT3wH7Cp1XPatQ7azTos5Ia0BIQ3QDRo+gDDUL5vM8
         gZeA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJs/TdtBk4wOUkK5qLfMKovgjGxTfbQHdFMI2xjQKwIhkKhFPjFdB5mox+LUCkuPfkXh9UUtpTFperrRQ00HDOgAk
X-Gm-Message-State: AOJu0Yz5o9LmZKiQldCK8UKs4z4JHBpAixzo359quoXIXA00EgpCmCvO
	TUhYNWVzAaiaQy7an3zQMFc6Wg1XQTYHlewl/G6D/COwolNdLunz8X+WD3zkWER+PQ==
X-Google-Smtp-Source: AGHT+IEFd1YNIU2pFTFYWayiyy5owHCUX8d2oFahEMWR2wOBYQt4gvySx+O01SGAjDhoU7jBjgwbnA==
X-Received: by 2002:a05:6602:1d01:b0:7c7:da5e:3a61 with SMTP id hh1-20020a0566021d0100b007c7da5e3a61mr2215880iob.9.1708991136677;
        Mon, 26 Feb 2024 15:45:36 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:36 -0800 (PST)
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
Subject: [PATCH V6 0/6] soc: imx8mp: Finish support for HDMI
Date: Mon, 26 Feb 2024 17:45:11 -0600
Message-ID: <20240226234532.80114-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Adam Ford <aford173@gmail.com>
Sat, Feb 17, 10:16 PM (9 days ago)
to linux-arm-kernel, linux-phy, aford, me, Vinod, Kishon, Rob, Krzysztof, Conor, Shawn, Sascha, Pengutronix, Fabio, NXP, Catalin, Will, Lucas, devicetree, linux-kernel

The i.MX8M Plus has an HDMI controller, which depends on several
other systems.  The Parallel Video Interface (PVI) and the
HDMI-TX are already in the Linux-Next staging area 20240209, but
the HDMI PHY driver and several device trees updates are still needed.

This series is adapted from multiple series from Lucas Stach with
edits and suggestions from feedback from various attemps, but it
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 146 ++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/phy/freescale/Kconfig                 |   6 +
 drivers/phy/freescale/Makefile                |   1 +
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 720 ++++++++++++++++++
 6 files changed, 936 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
 create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

-- 
2.43.0

