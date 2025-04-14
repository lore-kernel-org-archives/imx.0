Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C44293B4D
	for <imx@lists.linux.dev>; Mon, 14 Apr 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634344; cv=none; b=NgCymupOindlolQdPyscjD/zNOejTt8aa221joOZSFEgLB4haZQTZqzU23tuF4gMk3AsuMy0zepVWEomCb8w8AJTAkBAQuwCIycetMNZTvRl08F4uAT1ZyVaUUhRZeKokyZJT5TLVZQYiTumIipyd9YaVtBqIfOqIdr/wctqWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634344; c=relaxed/simple;
	bh=kvMu4gA44GD4PLpfwrFjPcEJiIQVrG9ys8g4QNyS468=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyRDuRZPtlS+B8q+23lIGyY3nNQ0KfH0hJ1gXNCXyQ+91XsJgPzaBqaGZpLab8j8t5vvvY1qz/Y+XRgphxgaXrhgzb7Eywn2b8sFvYc47/Zl84ZtFMwtaGeoDVOY8OrRfeetwIdR5XN13N1vE1hA7dDWyaeFcbmPpjM73TJ4no0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHYMuryO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHYMuryO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913b539aabso2489760f8f.2
        for <imx@lists.linux.dev>; Mon, 14 Apr 2025 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744634341; x=1745239141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=KHYMuryOxrZDvSc/QKFqcOy+XkTc4padAVyjLSU4AKxx4QchyGSpdjELl9Nhw6C4FX
         glMcLWcoNS3YuJeejA8bFo2PWMnGWqQTCODDzu6aw407UmKo8tPMJy3djrobkxBOznfG
         /SCyiGL24DHIK+bMn8RCzOLh+H7iD6QR4l6IUS0D8z1L3ar5ThCv1qqZWn58V7Rx6800
         8ergBBcQP/+C5fl3t969ACenbvYZ7TIt16iRv3aR/h8kvPzmvRk5Ue24bEVbsRU2baWz
         Jd7Eh1+zXWyHo++KQI6I81IdLZB4j3VeV/j+yhp3akQueGk3SzWPelVZFLhueko0KE1K
         oNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634341; x=1745239141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=utPJNFpP9dG57BIeERNhCsPwsoNp85VSjdE988pulRrXq/A2KjfQ6Hy63K6tQtjogR
         zi+8e5gp4Cvlzq+pU0AoY0t6afEka73BGX8MEuJ4DUtz8cFr0sZ/jpVfDPkLLEG2ayKE
         YQ7VMkq0ST5q6tefAag0sYPeeVoCSzsYYyA/2FSiylBbswopemVCGLTnFOx7MRzbUWA1
         6bhYnY/PyYqTcGu8eind/lj8jGjwWpfjSR9hVYMEV0+TLEpR4TYt5+uuWUEuNjxvquDE
         lWcl6p0BLm0Nr1iRQEq12xMyulwUL19TmQ+xoGK5K0HTcpvHZEed+6DfiYK+CfHxyxMh
         yqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmErFaKhmJse8+sV/NxhqrmUsuoIHj5nu0xLFrNFo3Ej1PLxcX6HbFjWQo4YcW5N4ezeA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWlEHIPqFszqzEpk4jjS/HbE87gTErsNo1FKfbDRNcIB1mUpy/
	WunS6hLeFCaCqjeK6OFmxTxNeN+IVCRbJ6zfpDZeUM/lRRZiVjQA
X-Gm-Gg: ASbGncsaTGYXc2tk2tfsga1N3jwLBzGqGGWinVQgI3MfPmT9pjU/h27tVbQa1Vye4+i
	B3cqr71BDjUpInDHGniXg97SQSGoM1AKffcDzfQ8zyX1/yRfsqhQMocCaRBqoIOrNIiKVCIC0fG
	BhrON/MUfZaUW5/ZSEZcKcLVumCvADog4G9jUzPC/CA3BRP1p2UkRK+7Z3eTX/BNIhoKDkW62LT
	Lr8lwpbzGGgH59x+XLrAwutCTqUs9nzlGYHRR6o9X6/ejb/CXFS0j31PM8WiTzLhfJ+iEbbhSES
	CFTmLBNcDAL2t/w/f4//PIUYrwul2/MEhBw0
X-Google-Smtp-Source: AGHT+IGxy9csrrrck37dUxkD2h6nTaQdmDSXqt3VTHDGwVn+NyfGt2ybLDJfHlnEm9onkikV9dtWOQ==
X-Received: by 2002:a5d:648a:0:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-39ea52149d7mr9849917f8f.28.1744634340629;
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:68a4:1b76:fda:f9fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm10703259f8f.25.2025.04.14.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ivitro@gmail.com
Subject: [PATCH v2 0/2] Add support for Toradex SMARC i.MX8MP
Date: Mon, 14 Apr 2025 13:38:25 +0100
Message-Id: <20250414123827.428339-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds support for the new Toradex SMARC i.MX8MP
System-on-Module (SoM) and its Development carrier board.

More information on the SoM and carrier board can be found here:
https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
https://www.toradex.com/products/carrier-board/smarc-development-board-kit

Changes in v2:
 - Move the Makefile rule to the proper place. (Daniel Baluta)
 - Remove the dsp_reserved node, it is already disabled in imx8mp.dtsi
 - Add Acked-by from Conor Dooley

Vitor Soares (2):
  dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
  arm64: dts: freescale: add Toradex SMARC iMX8MP

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1284 +++++++++++++++++
 4 files changed, 1588 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi

-- 
2.34.1

