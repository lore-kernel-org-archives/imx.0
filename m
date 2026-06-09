Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F62E091E
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995886; cv=none; b=poEb0DgevUh9BzQlFQ3jkxU7SftXKFaHU/vsyy/yW04sBXWsk7BMfxOUJPOPucNYnw53iEnpWnEKRHWAYL2PmmjfLhsyug3XsJFFE8frRf8VCjy0AP4jbPCfvrqCY94VPi6yqij+leWvHc2GG/iaYzxQWzMBG1wXkgHlp+UHnG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995886; c=relaxed/simple;
	bh=d1cjHfpAeYd6BC9II5qFWZZxeG8uLiJgrbWkl1vQv+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/vgLS3enI+Rq0N6qA/8XfpNt72YOK4Tdbw0ozyEdVa/NfFKh86xQLBd8extrQh/ZOdcmvVYPLcHOIQ8a+7SH1Dv/2r8EXUgWITDzdR6UKlEwAfCZKSUoB/gkXNXDq1t5ycETWXpTqPAZGATxj1TBHr77URKvUZBx6U7VtamiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXLD1Ix7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXLD1Ix7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so3672275f8f.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995882; x=1781600682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=lXLD1Ix7sLQcReOwqLZc0B73ICjQ0ThtIClv3XAK/YGHCPYcCPmmEFwNlMSlBi+tuo
         Rq+0fTXgh2Bpr1WVk37T/PxqAViG6RH00Hrxqk5XJcjQJt5aIkR42n6adBb9un51AStN
         MYFjlSxI7ymbF9EsCxUWw+u+X/4lj6Ozl6bRLElzIzs+fn3s48ni+1lnx+UsVDiQ4n2V
         qJqpg1EKfXQRlwMyM1z9dY6jUfdw/mCAcM0EavPgjgYsL099x1cl4/Kqv8luO3A03V6a
         0yUuNeXCpLIalhL8fcgmWqk7W73LYPZCHInCFY4mcivPlJmljrhVFa/aO5yWmuB6O7fO
         gylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995882; x=1781600682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=DpfyT3I2fEwjRRriIoxAr3uPMAKN1HWRh6RGGKTeZRPjfLp1DoPkXvO3i4QMJodH2Y
         VBKvoHSi69/eDo+sdn9ASao/FUOQ1uj79uORQXkqnDcga6/CwreDLsPvQMBtWriPU0GG
         1IJzEuA6lRX8TpFjBYsUCLJRdKIE0pjcoZ0wP261cpZy3qOfmy9Io/fHVN9maGn9R7dX
         cyYo2MhoW3h9rmWpEs+3rXiu2/uRcfmKRp+kjvOqqyvR8TrhTVh296RnNRXPpBJDgbSI
         L1cXa3Jxl+ySdJDDAVjRc7YCrp0iiaEshYcLLcHtD2r0YxbcRxZh7NWDa04hkw5S2skH
         yi4A==
X-Forwarded-Encrypted: i=1; AFNElJ/yyKxkzlI34ZG4hAY7+Mk2IGS4/y/bbkpOCRx9QSi/q1vijvCOomPxEcdfxtkwGxWilfo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzck8nN7eH+G3MK76/TKAfZ16+BEWLFR2Dm9P6WnZ1JxniYgsEh
	4Ja1S1a36EL9QtNfRE3L/upyDunUaufRhZSrBUDT4jLWxNrwmZJSXqzC
X-Gm-Gg: Acq92OFN6oThD8XJoZHH67e8wuI3XfshBR/hDUyFIrg6PxllQNMpySG3vWzfHWHq5xR
	Ln2Xf2UQlLUr/Q6oLVWPt26C6mV+wh8g/92ZaMduaM13uD/kYX/yahYAheQZbp6vduvMSe199eg
	QK9bGWeO4+Ip18DV7zi9NuM1K8rIRNEn3KfqlRxx5HpLa2WrIEDqkQVyTP/it2Ba9De2EK58gD1
	uKLQSEYTw0xlbpF0V2gUKH9e2Am1D/qwAOu2iXuuDXdEbRaGu5uPCdRCfA3gZkyvAsVwgSN9wcx
	5d563v9Vw7tVk4h9XAhL7RGQ8ZXjMFHaiCLtb9/Qjzjn2wwbVmTX6PBk4leG7Fz2kAHK11Ntzjb
	yujzagfo5/DbKSlHtScuTzCfoodGxW1OYjLqw5q9JmDSGIEqXsagW+00md8KW6xKEEyuBy2heN8
	hHMbjFCZ4asD+4qF2zelACyZl+H0Dt5rQUyCUS9vzub2UmaK5wp34Tzp0hnJRXbZw0mQIvSwbg3
	qNDVjivbukjGRdl2FEL5SrnTLAy6c7cJ2ueYXrKKOi8g+F+
X-Received: by 2002:a05:6000:504:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-460304eb5d4mr22923693f8f.2.1780995882262;
        Tue, 09 Jun 2026 02:04:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:04:35 +0200
Message-ID: <cover.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

