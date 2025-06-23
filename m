Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E291B4242
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701422; cv=none; b=mCIKCN2u2wmRpgwpXAmKUDSGfGFFlorQa3xIS1R2D8sA0388FRQlmdARGXHqciyZGSAZTHdbroQLr0eH3+rsEYpZ6E1dBzlahMhMnHa1rX7ghT3IpDce21cMrAp3VxwcPZhDgIElm0Iw0fmVXRWd1Gjf/3Uj37T7BWPdvP4kzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701422; c=relaxed/simple;
	bh=A7K+LcWLXdSMh6wKmlW7+130w6CceY6pTYjB9LGpL2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vky2H3AhJxYaFy/nL5ZUDkDjyp0RpU86eZ+3b9Nm/0JnIleDF0/R7rBmUua3IE+7BLMA1A683AnAMUguDYAKQUn530GwBGLd4Ny2//WcRVVCQshvVGr7RuB5HrWnlO2KoE0GX4yts+gpCq6k8lkyjThy1bqoG0z93RlDfhl/nb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw5ylEJH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw5ylEJH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso5794384a12.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701419; x=1751306219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=Iw5ylEJH7cZKBwiYbRdu7liZvWxUMsu4/AXSklcfBw6GYNRgVfFWQuPLzYiJVGJHlJ
         OzGMu+Ygwu6ut8MQ7E8hMEJ6bK74ipRMKeSg+HYEnAUz5Jtejos6wbHXmeYYLJvoTXnj
         Ces2AZZ1EqtV4OMmc2GpIAkigpPItoZIezn9kEnq682OdlRY8mG1IoEJ6cQw9IqhjLK8
         JrVvQ7iWOzu3ncL8/M5YeLQbAvB59XTmz59aquflbmCA8ddeImvoNb9QYkRCZqePF6hs
         mJ4m9LIBpuSri+KaICBWLb0XlaKZeNaIYncJhlFpWKwcOqQNBCfCozhYdOZDIRAeu6PB
         /TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701419; x=1751306219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=EzPgih2kB0rAfaKG2SBxrxcWrjdLq6ifmkSAGn1hat1aDhDqeJBlGGBl/II55N+7CW
         pY5Z3xtx9CTqHAG6lAhjTDczxGfDO+Af1UIWe3hpdUjenemHow/Qd7ou0sLq025TYblm
         553CZ9TDX/2Q3ROG2Rr17iY3YGi++/3iDVY/RdgrsMMWe0indqge+sWYSG+vEtLmjQbe
         8QHwt9eXE4i+OGocoyf9GAJpapt7DlHuap3tsjQnZivk4SUELfZx7vWFNL21PXBWDBN+
         3IYf/skUHRvYz9C1vq8V03ghX05BBvzI+zfJtEeHkzUQeviaOlKLAfOhXezxOkxk6jds
         bLVg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6US3I+ZPekbD2ha0XFypCy7czWATPm6M9YTSS0j8NulWsH4mBCKXt+SwPyHB1RtKPic=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDDMFgut5rSbEgUT1qWxwKiflHsoBAxDEoJQEfTfQpmL2Rposv
	JK/x1KsmYBi05Y03NT8Mg79Mq3YJrvejd7VnpUhWYTmz6aIMAlBq/4YH
X-Gm-Gg: ASbGnctRXG/DKHMoQnqVrF4hdu5yBqwY7osLZzW2pHw/60XoEmEm5/ECIf/U3rsDwPc
	t8jtPSyMfHmrHozsx1GNxl7XAT9nD3RATh42/UQXelCIhSCthvZFYioySlUPFzbhUvPGvpdBbq/
	1VgPLKnJrovd1VBRh2d7TGDdhfW1bUf4ISE46ctewX5vQlOojsKBAsSwcEaZu90vMV3Av2t5reI
	gZ1ihxd2aAUoCU5rJEWUUiX8qrYBEgMaUAnhBtlbDDsXpJSBeNj1w3+CkEyrz26A9Ea4YF6jJzC
	qC0PmJb5Y6tbdXdBv0eFF5L22anLCTB3OiTr3W3qdjlEt6ZTX/BpTDbTS9F6xcZh0g==
X-Google-Smtp-Source: AGHT+IFHYGJzGKcHxHbMeasOLjpLtoHx3VNYxm2w5V3zB7PXBaWircwkfG+MxrjaKvR+fMF9gFZEZw==
X-Received: by 2002:a05:6402:350f:b0:607:f082:583a with SMTP id 4fb4d7f45d1cf-60a1d187fa0mr11731886a12.27.1750701418968;
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
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
Subject: [PATCH v4 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:49 +0200
Message-ID: <20250623175654.844281-1-goran.radni@gmail.com>
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

No functional changes otherwise. Patch series is based on feedback from Frank Li and Krzysztof Kozlowski.

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
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 908 ++++++++++++++++++
 4 files changed, 911 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.43.0

