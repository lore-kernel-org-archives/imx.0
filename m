Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3696402B92
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540108; cv=none; b=augLJ/ACxXD8Nd2NSwHgPPK+lnWGYwys2PHxnImjOK378Z/qnKo4E9Vvz6sSYNMCExCG/LbZV6jbhohh5Epe8ul1cqu3LW+zSPABk2zA44BClbZ1xhu07kdXXO8h51zxbwpl1KQI7qw6bQLbs91B42d//Y5+qP2IAc6Ng0JXMlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540108; c=relaxed/simple;
	bh=/ZmT/DBJHUb+IDvYI73kBBbncazb+maXp9T5kj0cSLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IeGlz3atAacajHWM0fXql66zSCPpk5jOPCLFjCl6MjiD1s14+eeUeu9S3DOKLV247w5NyiGA3dGK/qqEXjT9cogF11NLdJIgu0/iYb3mpf6QCjiAo7ZSEdQZ/cmC1mHqrGHjtQm09NqhrmS0MqgKt4H0Cz8d67dMhlEQ7Z0uShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1qN4wTR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1qN4wTR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48541edecf9so13825455e9.1
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540105; x=1775144905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=N1qN4wTRVRsOnSNTK9B9PBkpHHhV4FXG5BS+L+TKXSeT8TyW3KyV+/hus6CzoBBTly
         GADH25xC9QjJUbwBPOOJphhTT86cyC08jrZD9oR/Sh8f+dDsBGJ36lPOFE6CYAjnSARH
         ENtXRDGr7S8F4gHOVAp1/JlXqUgB++wgLDOinchaPtteOPAsj2wB/prXFO2ZXBde9o02
         kymtvPahs+LF+5poGvBfLfDbPwLO98my/ODpl+TFtoRKDadBq1ekKnUbyyOw4makCgcD
         5pwxXXHE82tidC6cqMOq5ZkOKpe6w6BOQSFhFxCwEYyL23xOZn4zG1bHFoJvMMdJSVOZ
         RmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540105; x=1775144905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=N/bwCTPwETTEhjV1D+Vff+M8a/3nFlK2vnynGiAluHEMPKbg+jThBoBTHizJuFZqwE
         /7B31QtR0k21Am7rAYBC1zCZ7ymwdBsllaoCKdv4CHC9j/QmPmuUJwz0sbxT7LV+FSFT
         cLXYQ4DzLLrpso9By9XSqRI+ILSMT3abFv8fPqC0VaZgbvupXRkbOnFLjhflXI+TVfxa
         XUv3u8nf1LtcsVey9WNnFsRrj2+X+v9j1r7ORPZY5uRJotfiWftRT4dihJnKqqD4z/05
         SrsMundo2F6kOM5r91cICdJA3U6RnntPNxz47KpMHwZ9l82wTFM7m+I8xMt9PWDBKFr7
         GJmg==
X-Forwarded-Encrypted: i=1; AJvYcCUY+3LhRljeAMUli22TeDARxGJTqSVpARAI6b9AmUVjSBNrh6aWqpAjSlLPGCmHgBV555w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCidoRal85kXjQVe/iuoL0qNnChOS+NP1QT1n8k2oXqlB6lHVJ
	NzJ/sHH0BfSG0iCnQLUmHsSp1bYESXWmGYF/ixcAfy00w85FUJERbPJf
X-Gm-Gg: ATEYQzwsXi6Jq4h7afQkm8Qwp7ss58be5auGTFv4bPPSQ3wQ/hXeOBV7DlUhacuvVGs
	8VE7oIwnQs5dGrOb4hV11MgbCI6+JhtU5FN49KNZqte6YTLqox0LkhSoS3OnZOV3Znid1fuL6W1
	L2WPX0IAp4ynhprQnuEYXmhCLH4MkOF/Wtjagxolnbr9KMByylTI2WpEViU337SNc4IL0MqRBIe
	KBGQqqbU9y8BgY2wAQecrbJhShV6LBdJB8PrPq12kw4PCEctnad4TKKl1WIvep7Cf3xsrlYF6/x
	fBrmZZXurwh/RyiIKmz/kDZnGu5rNny06Z861mkgaywl6djT54vKACBoH7EVXUXmmQFw8aCg+T4
	cxPyI7H1kuWiqH0hJrYfBpUMwo0aI1TmCXUnkKpwG3SU+8KIZMz3S7KDk8h2w9IDnB2OKmTZCYo
	mnDQ+6oP6xtXawoT1xLymv4Q3CpTWeiVbSUnMQPOkIFJOVwFDTjUNp78yMziVP3lm+K+nGOeY8d
	nWyVx9CZ2IQLSp0/8bY6FeAts8Tsy8Xe/Rz7Q==
X-Received: by 2002:a05:600c:8489:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-48715fc3925mr119005735e9.4.1774540104995;
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Thu, 26 Mar 2026 16:47:16 +0100
Message-ID: <cover.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 462 +++++++++++++
 4 files changed, 1123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3

