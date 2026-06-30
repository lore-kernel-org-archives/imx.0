Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8D3E9C06
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812824; cv=none; b=Q7j8ufMhfGfd7Vs69dTBTyuNW/cqcBgqM9yoGmGKpoMNINwHAR8eFMmi9mw7pVMSp8VNsBbVelp9POy8iXgMqr8gU+YNEjKXdUOhpfdoQ82gzEutiiH5Xb6J8wPkmO38X+DAFFuUNMIpN8R4D5tToxLPXEVEKyMwaMn3PPHW9kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812824; c=relaxed/simple;
	bh=LsjrC7hDGVCOoXjAMQ6g5qbajMV2gM1v+LBhCbwDs8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2apfAv4shTDb5+WjW+VsZbUta2WNET8K369AWW7TFyTUbDDCvHrPk4ThHPM+FOBb4QWKFq7v8WErEycUVHyuZulBpY0Oqth4Es942/0ZAbr6gvfTKFGO4rMZLQSvmrTGTlJ3E5JEOqQ0UEwuFapSEtUyFJWS6Pg8tuszc+6Ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEEkvpre; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEEkvpre"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472a14c9965so1960577f8f.1
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812821; x=1783417621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=WEEkvprek+ziDOeGOzVffhiyMQGfgHgbCq4tJO7CsnFerZf/0F6nLySSGnbeBdn+JN
         smlvIySTmrUszs7zuubMYuA8YkmhQQH7ZMgRPjyth8Fx20Q5sGyzrA4vNuC2cPVaDcaS
         ufP3yGPx4Fu7xxXIUTo5w+mXdGBptgvmfsqFTjRoGzY5bhTXut2t6onXg8yFf1PmjsPI
         PGud7SBmEMpHSS961252+I16zDP3Kwr+jA0/AxmK5Ojnjb5XRVr0Pzzf6LJKUbhbX9K8
         omMkhaqIKntSU47IXdy9SbcfiKFwP3n5glkPM3ge6Lyr3u5KP8fv2ezwbqcqfSlbGGmY
         xmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812821; x=1783417621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=Gqz9xYbL7xFptXF49iLGUZjEVEWXkGBJOvOzj+vPTXyOSJrbsMl5fbcUBCHapP4x9s
         gPeXvaQU+sOQLgfSiOgw3DyfyJAUCa+TU+p43rEZcwbnxFHaDGdxN4VKchVoUw4uJigA
         j8j0STnwsQCpPO4+AHcv5Io14z1LUJ7RRyQ0JF4R8mK2SGObkuCBePFuBH79jpAl0Jfx
         sjRxYUaG1r2v2D2/MG4kMvxZBq0NrVOVDA19qFKvlu1WKLpQoMaWEd8nd1gYeJ2I4qtH
         T12K+/MSmGmGf8kfZwg05ozrZN8exyeuUtzq/2+wSGaa86XzdSbURKv6JnKfJI9MYOFP
         NCpg==
X-Forwarded-Encrypted: i=1; AFNElJ9u7oRu6mYo2EMoQvKn3Gto27ILsPAABrx+BQ9KOJxl5Nl0hykNsWFCL5yIJMMaW2524Ak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1nJh1puZRRSDe9JGwWFqRj5j/y7fqJ929FNkEYWOKtmLM9nbF
	brbsMJuPdojnBFM+EEAsiK6znC30xWkbCTx0tGzUX9FSZxiHQYbgXPK5
X-Gm-Gg: AfdE7cmUnC6BcOrVuJPm0n9KaNuMi+lFIXCBdyLcHz27zkEOhn8KvUjMKfZ7B1+gP5p
	sjQ6f7c1PynAG9tGaesaveirffniGs08JiVBaBA1+C7Rj3TGmT9w2OEJgF+74ibXToB4ca64QhP
	KtMNsSRQ3BzBKx7BaGPYuZmG7G4mVzbZYdcTsQEgUjQL+IgtCMUHNpytr49en++NfwhsHuNyS7B
	JQ39aj8EfmsG0IbWiciLf0k6vtqHsjzDYy8tPlpW6y7n9vzhnlEwY10xwmSnKe+r96jXI+8lhC1
	LKDlW0FuyGqVg288/p03SX9uJeO5+jX5wHMyEd1bgFUfaggmt9kCEDG5V00pTna3KnyzmySFVJh
	i3zhy2ecJjdR2IcJQkBer6eJtaOXIyP7961YqAvuhN0qRyYNHoDaNQtYSa05R8FpRc4A4W3uhpM
	2jS74HccX7ZyMY3ZoTIIpMe1IXfiMWtT9ggZvuHpr+t0Rg09U0kjTOWiX+vclj3ZdtoGj0r/xXO
	jSGzCoyVhyuqB0mC+pQGuRo3g==
X-Received: by 2002:a05:600c:a086:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b8146e9bmr42929345e9.0.1782812821044;
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:00 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 30 Jun 2026 11:46:53 +0200
Message-ID: <cover.1782812572.git.stefano.r@variscite.com>
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: 6d1a5ede11552f559ac02b31af03bfaa67f1e91f
-- 
2.47.3

