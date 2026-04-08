Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE3D3D3D06
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670042; cv=none; b=B0LjXHRAURkNHZ1EYHUWFgVpqaFGBJ0webSQY3x/Pmkz7J3phZB+F0LXzdx+HopF/YcvIwgjWVGtZIC/+c29rYnnLK139joBTmCRc5j8vj6+yA1gW8+V2TOgAnDjFJdp19dcWJKI38/rOcDT+n4piQae4DuevYjjQjyZ7QSY/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670042; c=relaxed/simple;
	bh=0qsG/us2WVwXLTbDE9ON6cQRer4EhyAiATQsPRj6xis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIL6KMB3Q+RLfLwWqoq1tnpD+YfuOMCGc9k/tNjln4fxWyoM1RdRqq80D6aRIkR6iIPw6dWc9bPz0bdgd9cfMrn95am3zSC+DFUqrzjXJ1Go3JX6qmvpWcIxnabbS7eCSwgRIsjiD6e9DGf+PK7b4vD3ebGYBQ0dkhuBGZMdSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+vZmvpP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+vZmvpP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so940955e9.1
        for <imx@lists.linux.dev>; Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670039; x=1776274839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=c+vZmvpPDJ/lCMikmYWmx96+ixnWtX2ZocvCKzYV+/HwIBp3AGj4HfxAcuPJpWDoAa
         +mV3mrjL83Oc1sEfP1E/c02cqEZmj9xoZ+oMHaD9BLgzl5eNZxHe3PZzl3NHT1CNmRNa
         XTibEkNut8Vqom8Gg+H1IeE3kkmZx+n+E+phW3gKWH+cF+i0KDDZjwcgWA4ADncYPHTr
         bhH+ptnlcWaxvezhL3gQtEajau/ujBXdQOqHXIneA+atwnVrmu711jz1dj3HYrumnRpJ
         EbBrtTumDa05mPU+NRVfBbbGrvk3VYDXMreYU9Vk4uRY7kOm1nV8bfmVtc/nt82gFv+b
         yOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670039; x=1776274839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=IJXQO1XjqABfuTC4UyyX6MohqnSgcEWJN5VJxDNphdQ+L4QC6z4I0mGU1WoEHwHJOF
         th859q9j93o7oEQ93gsxjqNFp39G1ctOUfKVyEpqnSKhvOZi8G/KClCVzX7TIb/114NM
         wMI6dTdVUrqotoiCKwUcTNDqlJ1DnDjF2IhPK5rH5gYB2gDYx/baHRNaFP5lUDzkvgPs
         aP2i4Inghoye2xzSXWvBJR5JPy5tFYabD6yq+m8BV9wQTieEPPLyJ5JMymGyzoIi+qB3
         Ke9CpAnyPrQQgjOM3laHGU3JTfyMZCHqL9TtIHywawQNU1pb33LqYYTyaUhFfw6AfFNF
         23Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVbMyMf9fordi11JbRzSFPISPzzVtDcdDZSgTBeEJhPAFOSiXHtSRWu1w6BM5ZzWzSCLbo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZVpnspiCdR5KZpUdnQJJ0SfpMpOR12/UASgRBqgNBiFEZoauP
	SO17IkQdylhAIxNpsXx+bUPI27XR8sH11exrq8rL6ZXP9mMAalQJ+Ijs
X-Gm-Gg: AeBDieuxdPieHxdkEGOKk2SdncYfaJDW8A7Kn4VJb+pMWESdhjv/m0vLgbHcVw7Jaix
	/9+3IjEZ/yq1kDzPQTDZtQzyr7eiGLBPF4niTFQhlQVH+vfapZCa5eAUJW1UwZnPGVPByQfVr1P
	IuKBxBidOlVVMqD8HByxpSk+NUNA6+FJAWIMGOgGxrGG3DrM0YYWNgUpg5+nAIaigfRz8F9PdF8
	0aBAgRD3ZHF+Gi+D7ZG+sTKNJ/S6Lp5gLrutQisDyXcdDUGlbhx9bVNDnH4PVJkgM1+GN8SS9Ap
	4iG5R6sq3n1LDqVPRvo8wiZD6fvrjyx6u+eGFxDMLLA7amC/QtzD82bft18FLY9Png5RtA2VRj4
	Hmy7j+dTN7hI2JgO36QzwR5u3kf5HAzb4+dNNg6cYvbidQKNEagT+qQwiE26kEeFTBNNLT3+4bc
	R+TqxA+WRNUXeqy8YYqzHJ+RKFn12dspnkkenrEPH0ZvlW7sUxo+vS0I/yyQ5sw6l27rWZtIVSx
	vJ9lD6m5XBpaIfGSBjN50J+fuwoGGY6mkE1prBawJ4YNxlA
X-Received: by 2002:a05:600c:1884:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488a2aca44emr139853645e9.12.1775670039126;
        Wed, 08 Apr 2026 10:40:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:38 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX91 and Symphony board
Date: Wed,  8 Apr 2026 19:39:43 +0200
Message-ID: <cover.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX91 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
  arm64: dts: imx91-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-som-symphony.dts  | 527 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-som.dtsi     | 456 +++++++++++++++
 4 files changed, 990 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi


base-commit: 52bd553667e68b91ae6bb686ebddb66e539c7798
prerequisite-patch-id: 6aed59e9105465c7ff1c01475972351600be1526
-- 
2.47.3

