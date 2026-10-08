Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC93D093E
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488420; cv=none; b=ECMfrvDP1J5I4dXLrvpEer2XTskr9MrbkM3AnKYrajv2A6bR6knvaMWC2gwTsOXMZFWVq10pIV33n0h2V4tmvrl88RbgQxyXAETZlZQN3vfnqpXTymRd1UwwHUKMAUKR6KYHisFJiP6gotAkm9L3h5dX+OJS88WjYhyQRezXXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488420; c=relaxed/simple;
	bh=XjUNeeMRC2ts5MdmKtrm3eVb5N5Z36fM2sJ8EfZSQaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvpNCxNe4PV+IvngrRSvX/GcO+QoVGtmcdvRhZ1+4QJokZ6uiIXvhbmMHJrHa8GeC8Umrvx0ZiEOOCK/Tl85mzWuvZc7Oaiglby359C6ISt0K5Z51WoxbYamuFeIMaJbWJ9i/7MhI9efc63nVvZbmzI1zj0aBVdpMnK7h0DuB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+hSZA0W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+hSZA0W"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso58241985e9.3
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488416; x=1792093216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=J+hSZA0Wt7jE1Z7U3qLrdFtA9BHYjCVkDTe48/68AV4a/ecY+12gCVt3Rd2T7er+Yq
         xtHFyUQFfsf9wlKUIkSOooGe3CYn1qnv5eYed7OWvMT5lVsWHkRyv7mt+qmsxu497O5X
         jgg5lXmKvakBsWoHCsASmtw8FdDPAgBt2nQ8SSefvywbR5/mkC60XMtmWwo1dCY1rurt
         ieFjm/HIOpZg3013ozOmOjwcdu4QUx+pKcN/0bOCNf2k/jRMvsMaX9vsH7FYJRa2bWYh
         /nqFqbmKGiHwdeVKAndQOVv6+ab+BDLrbIO0YlSvhowFOytbga7PdeTGBb9l4Oq8blo2
         l6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488416; x=1792093216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=0byuv9cccnW2lPXoYFp5b/v+WsdC14kvIObalNJIFxZvfjL6zPj0mXbm9nF9cgZRpe
         mXKno7fsNaHWSnK+NyKWbhPECg9XcZ/J1LSHi7Rb9Ei79sM4+o7BE/13NGAdp8dKXVRD
         +AllH4DU2QsKWzABy7oE0IzE/lk4TPJCuXZbKLqu7qMr5sil30Op4oFJ38Bmm0QwHRUO
         X41br7e74vjacU1Ezh3XHFNflqFDNFO+mJXgJZL1HCCU+ZGPMWYY3LLTCq4g7CUnmZvB
         F+7cMSgol/zcKQbfJyQZgNqE4x7u1JuAqFep8tZvoMyJ/oVU+Y2aR8qwsD/oXnjbJo+o
         PX4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVb/dJ2RYNuJB7hJueOy24fs7+2+V7iygFTKmZIZb6TTJTPsQ9W85P3/jmT73+Pnt2kXk=@lists.linux.dev
X-Gm-Message-State: AFuF++llNvsGlrmRK3CFlmJ43Fc0TNLK/DDjELzKySH8s+ixjgP3F4xT
	o+CKtzkxAG1zukf6gFT9KuhJ0UXNJv/HTUxUlPEEvOytuJSDrR9y8YqV
X-Gm-Gg: AYBFou0bPa8/a4hBQ5kaEq4eCk1euhRE5M/evKOIvi3Ms5jhVZ8M9if7osfsPSz2MPK
	n0zji7MPkUEN5QyNnoeHwmnLSjxXuPLH5/LhSrShcH1joDB5Dxm4fcsoU77kO06dgWEGuQOF7nM
	1HpK410vABdwOdz0awixRAVoQMbP/O860sqwJXmLXtJtYPOWY9tNxdYizEz3MUz5ec1v8wrQFIR
	dcKtkmNqYvqaroEx91O/vfBTMz0zaD4YjFcOET4ItEwC8hhF6TO6wuRt9ufWsggzvaMYd5jGjKr
	YmpDF6A+U/OA8Cpa0sSnXh28K2DRyL3iRo4hJi3frMrJnQeb3qjZcJV5OVZ5sX96gytzbG2J0fj
	It86kTcA0gjAssQRo8dKkERKkYPle3kLBWRUMM4jhpM9hUXbtZT6TJw86eAT1O5muLgpAgidsBx
	waIuDlIPVu5kS4UkDrRLA5nyvhsZRNlwrHZrLksySySk3gLdF2fQ48ZJl23dBMol/oHNsCbodk+
	UcAkccPlvEvd7uuLs2wSqq+D8VFT1lWm0ZO5RNG+YCa4yZD9kdqZeMvl9AOQKAL5fJSNfPGV7sA
	IJsPpKszcS+i50T+6XQlnQ==
X-Received: by 2002:a05:600c:8b09:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a180682d24mr123505435e9.34.1791488415898;
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Thu,  8 Oct 2026 21:37:41 +0200
Message-ID: <4ea26fb755799e279e195b3f8b8669c394a7f7b1.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..f044f6fce51f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -689,9 +689,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3

