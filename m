Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D941C30F
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133647; cv=none; b=suGNANbbE6EqvLrc+QxUqHHrcro08q4stTBdA7YXJKaydxnVzW0otqmQlIiu2RpHhGRyaF/Rtnd5KokrHLGcQqgulDtuRqbk+mClltPo01UJrMG1sDOv4G0Du5mEkW7BQNepfIP1dwOrRqAtMHuDzZJcq7W5Xit595czHzkQ4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133647; c=relaxed/simple;
	bh=eC1/k7DqW6hIUmJPKXuG+Z7nCfpB5iHXjqobLEUQhw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cm/xeoSOJMQV2uxpHv5kTLAad83/IudncEkVN+8YvD0uWOuuuYxXEUD7LhIgB/REdLNwTFIxTFDf2F61wy+PK44pmEyfVkY32yCU1VSnEhLYbJD3ZMt8wHz8NP0xvLYjdHdrRB8zI6HiwtmAMhFEESaCrP6mHDItS2WJizjt7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZEJEmMM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZEJEmMM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so13996495e9.1
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133642; x=1784738442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=TZEJEmMMzrTd8IBY8QB7cC8TFozBNsWO6i3+ICJ8VCL15nu1fryBhazwqi7VmYOscq
         JmKafhvxrJT+87b7oP92tATRdqjZOeJkudClajTZMReWKD1F8PpdJquOfxT9q+Z0RYvo
         X6m7CumZz6qSML8deVIPD2ydOdgMYcA9PZFrA1Y2/757uu0/SzWeMnigHA0gPkagCudw
         Cb8kM1XXoYOsDgU9unue1Vqd9rbzmOhjoFrVVrzWhKkqVRuTMmqk4QzP91zjo6NV72pI
         30MBZ3f8FbNY0kR7fF4F0GXME1VNsO85as6obbHFke0QaX+zK7IcX0IlfCndthRvdrGj
         IKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133642; x=1784738442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W28MgOlBEIrBDEwzq9cApro4f/MG3ayuQJC7ubK1/ik=;
        b=eyX4jrQzSRFPsngt9va6/BCGh30FVnjqGQipbWuLQR/0/LkIaIhxj4Tx0eUTd0Gkyp
         gsmemEGqk3m7r+wE7LpF75XOjcKVn5XIVk2dV88cdI0SC3kDWi3gMkXVTfA7jXm8hVZ/
         muoHVpOfDWgSn3LI1MmzKgLPfaPv9NPqqE6a3rAeA4cKdsZgiaLlzKOvV6Ahbc3eWgnx
         WL7i48Aew5Vrg2FXc8O9TUFsxtFACc3Fsb4w+8m359Hxt/HVK91iH/nXAGa+4m+8iosE
         kroGiBfAYrmDPACH4U/AsnPErVKzNHnpv8wWi+ibBR5VSNfwIo0/0/iCExt5FQ7sFnD1
         49eA==
X-Forwarded-Encrypted: i=1; AHgh+RplsYlL2MaOv1pDuwfzuhmg4jhIryKOcTea7nR9l3zo4YeY7BfEQKrasyyVBHc6CsJBuh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU93fJOfkx5oYqa7QnWZBP5RBruei4ZR4bbU/EbCJZUIQ6Ipf8
	jUBweF/B4kDSbOs3edJUKJ4gdtRjOek4ZubsQVueJdX7XllDtGnjxEcy
X-Gm-Gg: AfdE7clnbJqa5SuXcgTezFgsAbv1YKrQEtR124qTe6+jaNpQNdN8MnZYVmWhUBE8FSB
	y3RIcoTsqLBDmfJehtUyVFgzI3tyRKhm5lYfjxBo6/HNnvQBBOEpNCaROmO59kmcj4UDsHtkwah
	yD7iqgvNUCxp6KQMld5ptJs5YsQhWTMfWpG+BH7dwRj8KbhV3zf5fXlVIsd7Knf8gCjYDj/2H6n
	m9ePfGdNARN5rkLNoy37+fJM5CXKP/GI4FeSYlsVhrAV4IqtEgz7v3o11Y+PKLTRTGIwNL1tVEL
	Ih1XlTw40aYF0QgFO6ak5nKDgDQXP6ov5ZTyWypkJ3slXbW5kxrJ+O3UA3szBS2etkRgtiW056U
	8BUexi2kZLnPzEECmuHcn13iwShvIvCJl2obXLQEzRnJk9rQ2a9bKJdrrlKoOt70sB7mrZig4PU
	dlXd4XwRzDQ2+iA2T1hqk+XGkfx1Mj7AOyZDWTz7gSuPeRp6AbdykRuJV39w==
X-Received: by 2002:a05:600c:6285:b0:495:3f64:26bf with SMTP id 5b1f17b1804b1-49540cdf249mr1832915e9.4.1784133641846;
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:41 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Wed, 15 Jul 2026 18:40:34 +0200
Message-ID: <cover.1784133402.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - Fix led typo
 - Moved reset-gpios in pciea_port0
 - Removed wrong captouch pinctrl gpio

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl
 - Fix ptn5150 interrupt
 - Fix ecspi1 cs gpio

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 490 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 4 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: c758aa296e6effc94c30449cc7e4773f0ae02914
prerequisite-patch-id: 31784fa7a3ee5c178b2f1ffa97c1dd7c1d3d898a
prerequisite-patch-id: 5810f43cde9c24ee318d680c1852b3ded18f3aa0
prerequisite-patch-id: 012c9c8ba4e290532a1b7f8642274b7c5f252e03
prerequisite-patch-id: a57d576be42d5061bba453f0d5960132be55a1ff
prerequisite-patch-id: e34a75fb6f7e01455dd5ca734dacad66b12de06c
prerequisite-patch-id: cc7abadd0354d14bad0cac1fbacda14ab9d4e02b
prerequisite-patch-id: c0276686c0247cb2385c56b96cbfd6de5128415c
prerequisite-patch-id: 100c47538870af63194b407fae06183fee85fc09
prerequisite-patch-id: 3a3b3e40f5fba785857091dda909d22bfc5e2d0e
-- 
2.47.3

