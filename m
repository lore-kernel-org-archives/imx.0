Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD34F393B
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488426; cv=none; b=G51VqCa2bPfeZVJp6z8S2lv5yneLHRtLJuimS8dkrpxaXzTLlwtf/bZSQDXfpz07V5Nd0nt0poq4FeLY37Ed1wQpnWgJcPtyswhNTBzNhKxymM8h4Q0J2uxfS8xE4DXirNia8iBqf4kEcFGM2fD1dEZ/taax78o1pxS213kXSfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488426; c=relaxed/simple;
	bh=JAOMxI61QC8KPKmV82fMgcEzMe1b7vaB9yj/4Lg5yhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+l+k47lne8Pe8/+z1OdiY3tANx4+RoRsBS9mfT+0H2/77EvuDjzNRq8ol0dwOxaUlj96J/d3wwX3TQRMJnYR0RG9rQM9WeHb21wWsCR7RtdK84K9Hqmz5abGJCwf8h66nE2AbmvZwxPDWynnTBrmIH4vUAvmdSLyamtZfZPrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ds24BeHZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ds24BeHZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so58799705e9.2
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488420; x=1792093220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=ds24BeHZZjaqCGczvFXrG2hNpBz32uH5BlMpAsvAMI70FqGkn3fF1i0tpdpot0c3gL
         eHccpjmyMi1pifHNIMpwW9SLvN8NUUPHYAXqNEQ8g26v1KVVNv/xVyKMBhgOderD1JOE
         y4h9xspj41r5nXJ6u5XXwWV1tzNGSuqdOAfvn5c4MgwhDtbxltAeQPWJhCNx8tKYp9/L
         NK16/h951gabfOPBS7eElgWCOXJAptnR+PPbalfykrfl9AfWKpEDKCOO+4CQDDVXw0VA
         qdg+Q4dKCji4rBgBPjEFFhCA2WM1yoDq3fWIRz7ilBEDFcYs4UvErgyLFVnYwpqpMlNe
         7EbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488420; x=1792093220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=b9TOw01JjTrnYqc9lg9irruCndg7hVFvdzAYg/6Th+m5Rcjc3Q84ghsdpmmNli3PP7
         TGdAbr88vahyBp1QbbyBz4XnvgWz5HYcvC0yDgUSg/sPnjGzOXbYvdQjYOxAxdKOLNHe
         zRpO9can6f33JP/G0aKUs7HpA4Evk7NH4/NfYnIFc2T0DRluVjuHlbIl4XswdseE/FAV
         QmAZEYpThYZjZ4ugxF5JTZJ2xKRNcrlPR27aXxnSVfZZmTxiBSpxnW5YIxRmciClHz3g
         cnfmsppqnqCMriP8uJiMlIU3XDQLTiYglrMJNtq3h/rM1abPHmmnmAOXnjLrhms0Qo16
         T71w==
X-Forwarded-Encrypted: i=1; AKwUvBz9AHxnYswamjsP8Qy35l4tMMhPyjlB0+4Ms4iN8AS9ECSDUqAT9iKaVXW4b0mEoPX5gb0=@lists.linux.dev
X-Gm-Message-State: AFuF++kHOOPhLtuTLLINfTr67/4v1GKBJeTjXdzYph1t8yjFDt4xAez9
	yKWrF3bbR35Fvbb05YghleWQbvWxf2Ulz8LtUg6IBtJeYWA6ixFzG/dx
X-Gm-Gg: AYBFou3b3Mc1/059xcLgIveAhDraLvNwQPvI07zFuCE28+Vvc/sJ1rHwT9E4/1hPsmk
	DM/StfyuX7Sr5z/gcp11yG/XkM4t+2glG3CqoFHMTstVsDvwzXpTzRuZXZ8/e1gn3crio0U0X7P
	WEki5G7Cc8H1SC/oJEyGr2vgov9CR13N2ES/jg1n0NgtcwZeG3PPn/lB66AMmbs9e5RUOS/oamZ
	uaC909mvy3w7VkiQhVgI8tnJJNAXNZAnDzOAZGxosy+D0sk02umAVdBMsQx0VVVWWkIj8iSifDj
	wZzAo/WGnlbmcdSIfk5xxfka75sXu4zyPed/j/emh9Xnl/S3xQKPedSzvEyugcE4npdULHk54dN
	dfoMgIw59WR5yXHk4KObuGPf0rVjKOK6V4oUglvt0Ra2VscfA9apxVSm6YANreuX2kio3aY+tXw
	7kH4TafmyYpICEOqFEw8fPQkEzcmL3I1JyZompWZ9XLJ2tw0Jh/UnamC8YBlwVoqpghjeUHYBEn
	wXCC9ERoBQ9DdgOCow9l6j/cBX9v0onvwCXjcmAe6KLhtsdu57N+bxbjXxkYo5nmhCokr7H1uaM
	kJe3VMzq9kuoRNkz3mu060JicyKWSSv4tg==
X-Received: by 2002:a05:600c:609a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18031130emr114964675e9.12.1791488419663;
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
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
	netdev@vger.kernel.org
Subject: [PATCH v5 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Thu,  8 Oct 2026 21:37:43 +0200
Message-ID: <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
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

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Put fsl,imx6ulz before the fsl,imx6ull fallback in the new Variscite
   entries. Leave the existing EVK and BSH compatible order unchanged.

v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ca6778b8777f..d75a08cc11cf 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -945,6 +945,50 @@ properties:
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
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
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
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3

