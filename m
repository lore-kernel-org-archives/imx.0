Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8CA2BEC3F
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998688; cv=none; b=mEMjfrpZwUTHxOeT0Bb7VllMY4J3FdCqWCNGdbj20pwyOl3A71QvovQnqFhIr6sQ/i77/XQBJ5dDFZKlP4tzIeLfp0nrMxAtq10UU7KyHNXa2y86cTb7/XEJd7zSKczDVwpdgrPzhmLPHkpd0Jzgg9LWU/w2jHWHSR0CLOc3Huk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998688; c=relaxed/simple;
	bh=NLJUcKx8SEyu9XZkzQXY0DpeIK9z2Ebxv6qBFZ7vicA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bn5kgkG0AYq0JhIfBbApoThNMBwGTtJFdrrUIMcVRRR5nXrLH1CeqVdJTaW5pZ3v07rJWH6g/2oXMQwyeVu/G40BaLEKnyzC1/7lQI7Ol8YJGOgVrl3kWoRUsHhkz2CxmIvbEhvl/r+569y/VBl05Js0uiBq7P3CMzoU98a7T/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYXQWK2i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYXQWK2i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b3637b90so45667565e9.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998685; x=1781603485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=LYXQWK2i4jbKl5ya/rCw+nVUOzN39rVwCt4H+sJDi+eNMjxWA/WDe6dE4Ggw/oXyVO
         W/qo+ag0wZhUEAu+iUe5vIvS4tBRX35+CK34jUZRdw5PWqvdHetLi0LTsKHvT/Yz6WDK
         hvjhpiBznWXxxJZT+5fPVaJb5M0Dy/lHTjUOtYLUONxA4eaqbIcTZohFtUi9X3KjmGbe
         njUpV5i2x+ENpccq2rrpjvz+6hXmMFcgzwZfR8k1ZJ4kgRYZK4P7xOMOzCRR4fYmCyiN
         s1pZqodQBfICSGYJev5E3VvgDSeUwQuqhgU3/0Tl0DHs+DVw7uQTdXK2kxyeh/gz13DS
         ICkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998685; x=1781603485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73q9o/RbMs9HsVClZc0TR5gGHz7oJNAXFjfet/bYLwE=;
        b=MD3DO+/Vwf7d37kL8BG8uhkmSeSbYHFOuBkzRA20/nFiINe2B7EdAbY53vulbCDU+t
         iIUWtYO0hSzr17jRyvITWS5LuijVCQdMi7jrYcv94WELw+mVoU3qTeON3i/+bybng6Jr
         40ZINf5IndsAuTTXog0xfKc5bA6s4JbmApYkOhLN0JOf17q6njfZ7Qr/x4tPTiwnMxYC
         jJ0Kd4CVRvUbZVaj4j0A6GsJxzDcT8w65tQeCdJrDei5rYthpknyC7ESAtErJUHWr0SJ
         9bAC2i+InmjbquHJpKaPH/KGA/VMTytu0lX/kt6NAoiLSBnvozY1lmFn2tJYznxf/fIx
         Esbw==
X-Forwarded-Encrypted: i=1; AFNElJ+0JDiSLnSVu2AkrfZUCvIHmn5hLb67R4aCVs1iLZYtWOZSKckrglCDVmKwoYqb6sDiH8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqdg9OikVtwPxB9KoAo6R0CHj+uJ/rNfF1LRwJCf11YPY1vf4b
	2BOuh7P8R/OjWgqhAHgJ0y/FBz/FBzo5FXY5rv7a9V03qmVqPH2r0kVq
X-Gm-Gg: Acq92OETvalGlGVAIcCHdFQNpS36iQCDDret2nCHWfoz8tM1VtG4oBIgBFxS5x6z5yQ
	NOJYGEA2+98Rj0XsBmcqYRAblCkVb7FzaSw41f2UlZOZsIWr+YfzjAJpBj+Hg/WYNy5JDQLptNx
	zW6e2nJTvOXKSWrTuwII8qtd0vMu7HTEhzW9jTuWD2Tyc4sJmp0H1JqutxRYWAZ5uJPhAWaxOj1
	A4tvAhFW4qGbjA1x/66bzEyKX1D76oF+pLySJDjiz4MfaScRxCoWYf4YzyldcLowwKh0n1F8LnR
	0kESivJGSu2hKF+GSbAee3dLnAOh79Hr7iulGhraII+zjfngCd1VHy5h9OQkOcnl2O+v1v0ekkj
	cJ9bN8duxNB7ASrOf6YLI7lh9pk8lxWFHiOQI6EuumOu6oOOO5nnW2q9VBzBf3Pjr6tDexF7se5
	AElY5ScawQtEexmmqE7s15FvJE9Blk8dnrjUN/UYhLB4Ugr99/JCxBQNviAPgo8ZUuu40sTHQGC
	7SqFnjY4eVmlz0qzAsdXZnOhDj7xHyjtPRp3PHOBGBcgZzyVSehYC/jww==
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr350748455e9.7.1780998685051;
        Tue, 09 Jun 2026 02:51:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm471043955e9.15.2026.06.09.02.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:51:24 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:51:17 +0200
Message-ID: <cover.1780998600.git.stefano.r@variscite.com>
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

v4->v5:
 - Fix nodes order

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

