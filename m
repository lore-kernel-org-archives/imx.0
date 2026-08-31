Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD24078CC
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180649; cv=none; b=HR9nczTq3a2GYTUOmBex7bZByN4npxm+GVGgEP6kiBI+lHd+8rfIfG3UCJCsmI1qZAl8r+dtR57auyWabwIgm2/mQdLV8bbn2SFwRFYt4Tu/bLdqjnt6Ki0BivgCP8wU4sAb0AHAMkkLT4wluQxBYH/RKlGJxD3p/dy6Di14TtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180649; c=relaxed/simple;
	bh=7ZfnDv/XtekNv1yVLAJXU7rSq3e0UdmAHM7woI/rUoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TuRNZvw4u3A0gKx1VZWRthwbQQedLqShSi9fXx+Ng14GzJmcIgZqLtV2Tnl4MA96a6Xl8ePbDS3qGRevSrFm5CNS5PEv0BxWJhNNwCg0PQEBg4XVnfoSJdhgaWCjuwel064OnjZJfNUbv+j+p6VpMsJCW7biX1rNzZU1omiWS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGSU+me7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGSU+me7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso48049795e9.2
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180642; x=1788785442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=QGSU+me7Pec+II3pxQMicvNQTVd7CmajM6lr2ES6ucCyWQ+Ozn1G3FjvR0zF2mLXV9
         ObiVAsa64rYACHC1XRBM65Q8hptQaGo4KSGuN3ihriNB92uRmqT53IpyHGiUCE8naFVS
         jyZXGA1GoIf4OIsVpFmiTjVERie15r+qaAfn8xWlXr+8qAIYJ+Dvi5JBSer91sfM497B
         ujvAKvPhyG8Guzo31KwehYg84mpY7JiL4ws/IfH8SPg2kK9cgiuEQLNttOBozu75NR+1
         OjCsgPJ+R5rTslm+F77tpVnU3RsrVOTz0OxrGPduCh0NXkmUsAJksIgy/IjW+r5N5MKR
         1gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180642; x=1788785442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=RUaVK3O1j7vhvS3CHnpd4dZFErWF4evA33lwneqZazLQjPzSb5tiv4Z3gNkEokJVaf
         +jdD/jKR5OkwLGFrxpzZdpdek+HrC2D9pAg98rledVbzIWSMo9NEEc6OwGwt5kjAKaUp
         rLYaDAyCgBUPS3LnCrqa0PWYuql4RBXe88sAzCOEVo/lrOq2GM9ePC50F7IUXfEZkE9Z
         ApFdTP9cNvID03jG681PtLzUFmvnttrFwqEqaYZ9+vxFmJBuvp9AqkfZP+tEetDY4pRa
         Eg03JEgeIXAR6LWxE/cVOSdTuTJi3DLw65iO8lrl5uTUD24pFVz4yj/QqlGGMi6tEE9d
         c9bg==
X-Forwarded-Encrypted: i=1; AHgh+RqJR6b/SDCC0MR8/YATpVGHIvUNbbKpy9Jr9kOVoPvW3bGDXL/zl/MqPhvzwL7aMQg9Xno=@lists.linux.dev
X-Gm-Message-State: AFuF++l+LebaHDgvX08TsepBFdcE2JGWZPIwg4EfTple/TaqqtRK+9S1
	SDQB+TNUD2Oupv+qrcsVLS1B8OllHmMc5AGbg66d3Sp55KSstSnnR2fA
X-Gm-Gg: AR+sD1041bORLlqVe4N0SUDjxsbIYO3P3WQKPUblUIBpR6mbAFANVQ+1caRSveICHUW
	2lg9Ual1/vSz5blYO0fXBlyp2g3eN2x36yn4mINPrzVh0/XtDi0CCAMGyhYojG3unGRyvHhaIyx
	JNenMtgEFSFSd1IyRa4zqV4Oap2PoEHQ8f+E6H4W19aCkDDCVHarKJ+qjWQcMfQQmglHRG6DAHE
	6yO1CxW3xPiXhnI6ZtR78yMxczYsNgSmZH4MIuN46dBUkZiN7FbqI4xdFYR/gZeIueuXO/lJtBk
	KBeHYZWI9NNcXLbqxTAvRq+45dRR+svSBZOzFldZVTt21CuMbtAmURY9V4qHO8/mlyZ0rvl9F0k
	Z45HAXliGpBDPB2mg30YntEI/UxV7taVfJnbPtlDHH7WbrghfD7ekk8CgleQaPYmqEb5X49X0Lg
	8JrwQDIIizjCiC4CzR3FSUFKi3C8eCgDX2Jt7xCZjpqD1uN/l9lXg/MmGbNjspEjS5IJDJOdfAb
	KgDfuVRvW2K8CmaS3qPJlAGuA==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr452067475e9.5.1788180641698;
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v7 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 31 Aug 2026 14:50:22 +0200
Message-ID: <cover.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi
 - Spacing cleanup

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  23 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  56 ++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  23 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 +++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  24 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  24 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 +++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     | 102 ++++
 .../dts/nxp/imx/imx7d-var-som-wm8904.dtsi     | 118 ++++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 533 ++++++++++++++++++
 15 files changed, 1469 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

