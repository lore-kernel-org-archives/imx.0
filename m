Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C453B34B
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695086; cv=none; b=cJwFjk+Fi7rbkhJCquzaQVEWXJ2szBY3xLnGp0MSEOtW8mKQ+8dv/O+HZZDjVLFnJ9JreCqhzj2iC2LcYoEMgTrEeCApGXfIBx9B9nhTTkqjmg/mt2RhE3WnADcnWNb/V8LfRtRpD+101oUTTaw2izptUg2ICQGNCoTmz/IzrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695086; c=relaxed/simple;
	bh=G6XcWLt9W/5WDaZoUK2UZH2AziJLt/KqfJMUg1KtHrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuZo3jTjFLtyvUhYMCdbjnnRIYA6JsEWRgng8NhSoVo1ss+OIh5BBUsMwJz8cYZcSAi4FF9/abgpuvzenXXEI5e2cP833cTvQ/L3T2FjUjsOThtSucFHwV3rdasqca2kNlnbIdMuf/ozOXg2F71fhkEm5oEwo+QYd6OlkkUT0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL7/UY0B; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL7/UY0B"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so19958765e9.1
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695070; x=1791299870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=GL7/UY0BrQTGS/vrrNMmIQWDX9r+9KcJSlXooJkiwyQVmNfgUekiDD9sAFj0kPk8pr
         +49DuV/Q/kt+dZGfQPqpXEejpQ0TUMtGqVRx5tyojr4XgZYmn6/bcOtR4FLxXOt1keRz
         aWLKXhuRr5te8c//8v4Gml0boAMWYRac4Rkp3paM8R+algEMenNa8Hqw8f/N1hlihxqR
         HD9WIxKf2W/p8xoxq3JDLqZA0Yp/vUu/JzmObqEkS1AJs4/3g9r0opZkdWvKuHWP5fzf
         Vl2+D4odhYrTOwvn4lDwijQ0Ecctipkn07536FeIJtCiOBV2gmTjTG+Ppxy81FGxrtXe
         dQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695070; x=1791299870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=e/jC9G2oqaJzted6VOwqU0+TFFCv+rX8MqFqtEyghqfLtjZ0XM4QfxyxbhIo77qAGZ
         crbnJNTfulWT7GgxcrduAFtUXT9zXFLCplNmtF701gPnz7Lra70Pkwd+tDMj0YjSGdAb
         4vxS2NL6OPLba7Vb4Pj64QXvHnRrthIAcK5cle3+XEHD6DgzVz92roEQy30vRCvUdvHt
         +Nvn5tbLlL1P+wS/9AXLd4dZsJwvICvejWt+aXGYbziKkjB+ltESLMitLwUHPUo5VUAD
         25Y5Bl8RR12zJuPpA21sNpuLrB34sra0LCZ+72oNvYTFZHuXKxvCCs42HyNmITCnyKGa
         K2SA==
X-Forwarded-Encrypted: i=1; AKwUvBxovMdz6KWic29d37004VhwvzxeB10VaU0KnprajTpUBcEYF716CxAKxG7jFpap4/dsSXo=@lists.linux.dev
X-Gm-Message-State: AFuF++ko3V5O+iAqgvJ55Qtut10s/YGl431G02Puu6VTOQ4HkyAcdaJw
	LGKKsyl/ei1+aRXyDJmnzOOEEboRPIDDMn+BVzMSodS1unPM1N4/Zs/H
X-Gm-Gg: AYBFou37F7LufnXACBRZjUjDBX+Ld+df/XY6ATnZVDWfi7mZ7Gena9dAIZdohOFfNNP
	W7mz/4viwqr7rSFYFZFSajCSKZNWc3ajmid8i2Dmb7HK1FKSt40RJNJkZOfbtgt8H+8R9l9oj3K
	G8Wx+VEEuUlqSbG9qWaBKMyZ8kEFEvYvHs3Hz7NBOPiDuKEpD/e/MO1LuMxgrMH1UTRdyGlQc8i
	zDgZvJpO5Bo/FTvQSoYUi/pnFjhCjyVLvVdZEHxKKP5f3RuYfRQ3KSMwrY6AlulU7M9EvnbzLYo
	Fcv0WTntXNrSQso27uopNCGRgVg7hRj0ogx8EFcAAo/nHfVtYk+E1kCZ8ZamYFXRNzclH+cjBTm
	g7Anjs9GtbYUKfv2rNuwQwRFSaHo73wT7bIQfk04yqxhkWpmPYtTC8368WcNpyRmtmztcrx5Ndn
	RblPL/dASdloRB8G1VUFi3f7pjshNyFC64vhm+b+UAVgJu4GBdWzBoXQD9AgNfe7P3EJGlHe1Pb
	EehdXLIAXPaVmcRExu3cal6wFMFhzko/HxpG3ArcX2namWxHcMiHLwL6Zt+2CHiiYwNQU4MQBEi
	NcZL559tQPQurHcBKuNE8MI63JTp7I11
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr215836965e9.10.1790695069866;
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Tue, 29 Sep 2026 17:17:30 +0200
Message-ID: <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 9b1224091e01..42d12624c1db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -944,6 +944,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3
