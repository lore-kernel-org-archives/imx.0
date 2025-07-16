Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4427991E
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680897; cv=none; b=gr24prdR0S339659uiu55vqU6jq75wAmUUdlCntbP5lNMO52q6IOkpztq1BTB6/aS1kdreary3pXaER/62Jg0LELcGADFte5w46e9aXlImVEcP8RIBpouotTyomgmotI4IKPx40EjkFTDxTTrgz/COfPTmSdBSAgl7i/ESYOveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680897; c=relaxed/simple;
	bh=GOkZ+kxSzALlySorLSCA6cXsPChjBJFPrqHDc+rhD6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hb42WwkF1cy2i+Ot8/QHD8HK8pHoy8dz0osxRnm6QgKw9aXPAflGJO0NQ4KfQfpoxTdsS8zHVfy0axJkqnoXuCr7Yq99+vO1rs9ExJph2snSLFMQGGMni9rCYYfrRq9zwGLiU44pgscR4IFRDnpPsC616MejY4akNfDo37fkAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PidJ265s; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PidJ265s"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3a604b43bso809066b.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680893; x=1753285693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKjVbstUaXUkfpWGZfi4yqhbObtoazSimLO3Mc4PdaA=;
        b=PidJ265szJi1dy4ur2At+aQEHETk6Ftr3vZrUQYNj9qDwV5i4zzByZw5hlpwVH0ojn
         IYmXkpfyl/0PUaVk1Si0v/9Pl7c/6dMaGSspRgBP29qasnzX/HIcTtPBYvyoYTe3abxN
         PnIg2iPix8aexMQDuKZ+M7Mgkg/tlTnp0FjZw2wnOv4wPcycglenbqpMNAr9y8mR4n3R
         RLM0OfyJC04WkqaQJERHvMtbCmp/xDwuEC5JQJqHBunHk7PsstW5iS02XYFWyuPmDuDh
         HrQ86wPy1uwFgYd4kgKsxO6U+svxfge134RomiT48QMoZhKf+TLsjEt44cfdM2PZ/gnt
         NsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680893; x=1753285693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKjVbstUaXUkfpWGZfi4yqhbObtoazSimLO3Mc4PdaA=;
        b=CV/cTY152SfodwetL/ZMtYPPYP6KyHGLWyH8prTuW8lkOGP4QqNp6UaLfFJHdehI9/
         eWhB21h7Hfq/uasaA1zdxGduglPn6TgYzo7tSmaPESHPJf36mb/C3AmjDPIZogUljUUc
         P4A4lrcQGgwZkrkM9W7f24k24GTySNkirqnGa0zojXeKmu8lZjOu4SEQOpDsm087KuBX
         xX/uP0f9gLVJ2MYnbkikZFckbom4y/lXrXzZvDKn5EqPEIDOLsm+Ij6P9ku2EW5BqcKL
         U3Ng11bDY/GGs3hfnBg2BAA7rhkssd0/aTHdhClDU3sKmPouItwtLgQtjhmBR2/vTYoS
         qV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiwbWYNQthWsSqWGWbLNUSK79onJ5fF101SyG+m/PiZ9iO+oI2UyO7pNCVLQW1kXtxc9I=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq6cs3KYsyK+zN2pFHEKHWYwF4NbWWUpiEQqc8AAY36RzURLe4
	GlrRPiFeBRZGuTUIVl/7vLRz3rZDVLHxfbr2XMrR1Q5Okuzga0Dfn+k0
X-Gm-Gg: ASbGncs10Lr5xEx0XoZuoqnqNGKI/DxQ60cVuFUvxB43lSIi3L3NQH2sQyBM1PsjSPb
	qW0q8tc3zAu1A7eIlcz+nLEXXD7EDeMLjrLdzBIqUaX9OJ35t7L9omyVakFu588kypB1b2Mw3+B
	Rj+uUm3SnyVvGc+oI9uOS6c+pF7y4mwkIJAy0lF7PL4pCo56eyewGu2oj1Wy/0ONdOry4N6QhNU
	ZbPlpo7HMhBV2C690VIlSoSj6C1e4H3LmWWn876HLbp8sQXHX+w1CShICs0mSI/3L1lbdfmyuV2
	r13zl58EVxPSjQDeS2UmYWic84+fEOHr0f2xdwlKoTK7E1QAGyJYLVgD6az2OjzoxyU82ETn1zl
	fjeETNmOn3QTEi522Bdn4bTHgSg==
X-Google-Smtp-Source: AGHT+IFex17gwksYmEfwRekLYMBaX4AofLHIu+ZY9di4Kvn6YVkKnhCVyoBbL95UX6lWR4Ue7UJ9Pg==
X-Received: by 2002:a17:907:d24:b0:ae2:9291:9226 with SMTP id a640c23a62f3a-ae9ce1e71b1mr337656766b.59.1752680892887;
        Wed, 16 Jul 2025 08:48:12 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:12 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Wed, 16 Jul 2025 17:48:03 +0200
Message-ID: <20250716154808.335138-1-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the Ultratronik i.MX8MP-based Ultra-MACH SBC.

The Ultra-MACH SBC is an industrial-grade single-board computer based on the NXP i.MX8M Plus SoC. This initial support includes:

- Updating the MAINTAINERS file to include the new board in the Ultratronik support section.
- Adding a compatible string entry for the board to `fsl.yaml` in device tree bindings.
- Introducing a new device tree source file `imx8mp-ultra-mach-sbc.dts` with basic hardware support.

This series is modeled after the support added for the STM32MP157C-based Ultra-FLY SBC and aims to follow the conventions used for other i.MX8MP boards in mainline..

Changes in v2:
  - Use `enum` with `const:` values in fsl.yaml to correctly represent multiple compatibles.
  - Updated SPI child node name to use the generic `nfc-transceiver` per DT naming conventions.
  - Renamed several peripheral nodes (`crypto@35`, `pmic@25`, etc.) to standard names.
  - Minor formatting cleanup and compliance fixes per review feedback.

Changes in v3:
- Added "ultratronik,imx8mp-ultra-mach-sbc" to the shared i.MX8MP enum block in `fsl.yaml` [1].
- Ensured the compatible entry is validated by the existing binding structure.
- Updated `imx8mp-ultra-mach-sbc.dts` to address review feedback from v2 [2], including:
  - Proper formatting and indentation fixes.
  - Cleaned up node ordering and property alignment.

Changes in v4:
  - Moved `status = "okay";` to the last property in the TPM node.
  - Fixed indentation of `cs-gpios` multi-line property in the ecspi2 node.
  - Removed an outdated comment.

Changes in v5:

  - Reordered and grouped pinctrl-names and pinctrl-0 at the top of nodes for consistency.
  - Removed redundant status = "okay"; from TPM and NFC nodes, as their parent nodes already enable them.
  - Inserted required newlines between properties and child nodes (e.g., in ports {} block).
  - Cleaned up minor formatting and property order issues in regulator and gpio-leds nodes.

No functional changes otherwise. Patch series is based on feedback from Frank Li, Krzysztof Kozlowski and Shawn Guo.

Thanks for the reviews!

Link to v2 DT binding discussion:
[1] https://lore.kernel.org/all/578ea477-c68c-4427-8013-550bf4f9c05b@kernel.org/#t

Link to v2 DTS review:
[2] https://lore.kernel.org/all/aEmh7VL7BHkXp5Fu@lizhi-Precision-Tower-5810/

The board is based on NXP's i.MX8MP SoC and includes eMMC, LPDDR4, USB-C, Ethernet, and HDMI.

Tested with:
- `make ARCH=arm64 dtbs_check` (passes)
- Boot tested on hardware

Best regards,  
Goran Rađenović


Goran Rađenović (3):
  MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
  dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
  arm64: dts: imx8mp: Add initial support for Ultratronik
    imx8mp-ultra-mach-sbc board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 907 ++++++++++++++++++
 4 files changed, 910 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0

