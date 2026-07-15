Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328043A816
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133648; cv=none; b=EnxP4X2KY6iooGSE2KXhtjfGK8/yIjAreSQ2QRoC3w0seSXd/5zBB/IjycyNNMH+i8L/viiuMb5Hlq7B7MisfxFbwcYhUvynoEULKjWs296wOYoysK3WNdGkKtE7N0vnKzuFo4u7TsZSRmTr/HG0n1h/jUs9X7AkH2Y7nRp7ioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133648; c=relaxed/simple;
	bh=OPJAoc4WyN475VflFl2jsg6qSTLZxhDv6kZ/OJaUgj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqDPspq9v3DCz8QGS39TKuX87PcUOW2veNRjlF6scU4znaMn2LSBW/O9rJVtO7iksuHbLmaGthQ0NpcU6yloUKyCRsSmfMKihaBcuEzPKL5U0o6Cf84GzTzz3lpzD4/l7KyiBTGeiqefrkU3lgZ6UPnLFOZkTMzzMe3NUOr1Zak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeWU1Egp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeWU1Egp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-476d8e647e9so5369759f8f.0
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133643; x=1784738443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=oeWU1EgpYnSlW7lulDxF905TNwqFj138kuSsYYE1cptvZLEo6X4dFIhk+BHXeskDeU
         O8dPVIz3jsRXCm0q6TyW5LKsKsUviFWIi7mMsMqw31cRvIZB2RU0y77a7JI4C7LlTsNL
         9H8/iwSI1FnFIAfhW/xp/3jjBvzM4V8cV4iuwejIk1VcY3AbxbVQLpJPF5RDMXXL93/1
         1NZeRbf1npmmnwd06ovdyBo/eHvoWic6izlWXE0DR3MelHRZ8SHtCD6hAvA9ta6twYqc
         +ki1BOOVBHTBT6HCsWKDIo6O2k5eCtNT/ODgq1OFx3u5ru897jkN8mRgi/GMh695IUGn
         MQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133643; x=1784738443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=SIn9DdeeMnDaqPSR/V4whP2n/aOeYOMQarbrkKYmC59nxSYh/ybgX589NSU1x7dnGl
         vrcFbAaJbm+OU/R74G7XaZd+YnlTBMEzhSIm8IK82bP9J/V2OC3RZ6Ng9NkH5+Jy6Rdn
         /Pl4eHS/JPRDcTQPAdmYg4qts+IyXwkPRPrMM6CMnNp5thkxieM52AtHQNiOokKRieiN
         tEWWaU6zpWhW+PMrG2PBn5mxoJS8o98XKcN3LBAnki0UtdIT7MssiO3sZ0XKqGyHfH0O
         v6IWR57gKuxdJNH3bXSvF23b15O8O61ofuQyTFarWcP842JPuWIyzUaRyvGwtZpf75Ki
         I6qg==
X-Forwarded-Encrypted: i=1; AHgh+Rqux5OD1pXNv8qBc8z5L48NP+HeyC8MILUwTL3MDClxnYQox+71pKoZ0O3Bw3aA6jKC698=@lists.linux.dev
X-Gm-Message-State: AOJu0YywcgsQ/CPar+pzmva3AYAnVZnxvctzgmNxGOnYcmNaCVJ0F6/J
	ukUze3mNrpC1PV6gnXpPkzyGroGfUtEXbtiLnRCluQr3AIXErbiO2wfQ
X-Gm-Gg: AfdE7ckTEfBadHXzIITjsFKLsKhTrR6l1mi2w9Zp2SVZ3chqYx37yyjlgmbvQRm1SUM
	yP3RBO5XLehUXIZvzx4WHIK12PODKGt3Mw0J4q+0Y1f0HpREK5ZNPhw8mjT5wseJtCEtcF29jFy
	QYAbLdWQBNQHkb0vvGTcTsEaVlpUYwT2fShJEzRborhmJXQvvS0TQIX4dwptu8+mjH48FSE50tL
	AdSPFLzELVwnzG1T3tIu0KgO6q4iI2uk+vVJ6u3z5r83ddV0q4onCPKMtHZJ3hgU1eFhFPBgqWK
	9M96xtsyxJL4jvvnU9qGQtVruClhsOmQh/SMn9734oySVb/Q4AwkwIN+KxByQBvS8cvsv/nvgUA
	IztNqIGg+G1ZRmY+LDK4rsG47b87bQrY2M8shvjvE3wirkbvOyfuCzPcd+TX/FOYzxFPmI0TR3y
	bKwcSrJ7vFysE4BgJ6FIqGYJGInwhVa8p7344ZzMjcG+TRnliZ/ApV1lle0g==
X-Received: by 2002:a05:6000:41e3:b0:47d:fc33:df0d with SMTP id ffacd0b85a97d-47f488c1dc9mr9593088f8f.58.1784133643146;
        Wed, 15 Jul 2026 09:40:43 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:42 -0700 (PDT)
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
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 18:40:35 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784133402.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784133402.git.stefano.r@variscite.com>
References: <cover.1784133402.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

