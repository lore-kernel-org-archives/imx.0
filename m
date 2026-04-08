Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716863D75D4
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670043; cv=none; b=ZjxVwV4IcXYjzleHK6V3vwndKQHQhjoy3d7OFspIwQThoZ4DO7rfNxqOLdW1VC7bbUfao/cU3+mNP1gABBtcSDcf1//YcuHeHxzf1ULVZt3hMSKxnAcJBnz9SqSgGgm5KKltGXhdiWs9clDNVkxwin1a9QRrd9OtbQe4PBCKyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670043; c=relaxed/simple;
	bh=Wwh1G0U3AYh1ns30yDeRh5FJciD3KtisCsCylnD9alc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g25KyXYogIGoGBG4IXcT2y1ZXV3WTD6ei7lqiyDUlWELfwwzCWSU5JdQe1mAScF0gK1yRXuYENd3hUfkcju9TDmsLBp8iIT7IaajW6Y1SBWXf2abxUBjLPUD0848qeFs37ANzffSmmbPF9WzGCty+T2nzVTSIZ91O1cGGD+dicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLMJH1iv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLMJH1iv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf7683a28so44460f8f.2
        for <imx@lists.linux.dev>; Wed, 08 Apr 2026 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670041; x=1776274841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=LLMJH1ivTQqSCD8wdmFRkhXpu207tgnexmQcLVhGNU5inIuvi/O1fPP54I7tY84Kfx
         TNZuAH+j4dycOWie25j7wxpK4KrAVAuphjMlnfSDDhWTD15nhJXy8PUm0VNMg07q0pgR
         wAhFVDdneP6DSdRivvU+D4dZ1g26O4kVhdCi3IbR0fqrYqiGQFameqGeopBVpVbm5DIn
         YZ+mffCHHXt4DELurpbG0YoaOwFhpBJbPPYDdeZ8tRtHFbrKXvtMW+K6mFItf4QOyyh0
         f0amO6RsylDPG2lArXsSUgl/l2ynCE7lc5O3HYwOb6w/ncQsX1y3teFlZDpptkL3BMf9
         y/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670041; x=1776274841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=QpAbpngvAkIFJYuH8c/eed0UWcd7lqITEEBkejN+A2nh/NEs5XtkYIhv7OI0/poKlU
         JsIOBbNzYrZ5Q02SgFBjtMDpCHi4Cue3e4k3jMlKXc6PiaMmFoTwypoIPPSPpOPnYTWK
         5UNSp1zqTYa0hiP940+3qP+4MY2NEL9FNMSCPgToYBnzM+deShUpSBl5hs1j7JR89XZl
         vuBnqW4IrqBqOJWGuPy/3XnUAOzKOaPK+Xy7ENkfsLS1QycaD20WB64XcU86hVL+XGEb
         lID57MdxzBfx1o1uAVw0k8wqI3UFeT1v/ViRezEcp5hjTydSjaM99yenRkz4Ow7JVXkb
         nDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWfsjD0wV4H5kpo/fP+3y/AxZ1f+I+12zpw8DHbVLBUglui9B4jky2rBynThlUhaAv7J4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEiwr6/cdFqsdhB3stbzH7NfnPQn0xcXDFkVyRv0SfZNZNs+y6
	QddYTyfE/PJu/OnddjitqBdiIZcLh+xMSQ/HguJH/w5phCKwIXTByzOw
X-Gm-Gg: AeBDievjtoXWwDYTb3yEey062EYT74zEhS6p5OBQJT29/Is4WwdpaZYmw7AURZWHV5w
	zoB86WXrmZEVlIsO6IykfiU34Us+o28joqII0Di/aSjn1osqIuWv3WDYEBa0rpUfNZ93jYGo2o5
	zOPikrHd82Jm6dLgAh/idN9sVNPIf24Oy9wsL07leEri/9+Qw2v5ZukrZHUnnWsuVbGRQfXq54a
	mIppdw6qZOhCS1hDf5PjoljmNb0kLQaIRU6R6Lz1UI6WTyZY78zbVOnr116TpiUVF0F5jwDoW2F
	bsqXFvm907wQ+27OVylF1vC5BtJDznrG80vc12+wDwxxDvD0NKZGSAJMKoFxnP7c+lJ/FGUowdm
	59v9ghY+a9Ht2suKcjxE+YpCAfQu8lTE2PDCAVBY5o0EsrJxRB2zIcwm6ZvrYjFiZHz36Aynt8Q
	qoNhvfluEG3OdYXvm/eEsSJcF3PyfgIwvxtNbQR+tcqnGd8TbVhnYtGuDP/NgTxbfYHPvm1Yj83
	UqHyNHhCx9jTSqo3iz4R88xJGPZ7wP2mbBnCQ==
X-Received: by 2002:a05:6000:1789:b0:43b:6356:7d00 with SMTP id ffacd0b85a97d-43d2927baf3mr31918164f8f.17.1775670040620;
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
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
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
Date: Wed,  8 Apr 2026 19:39:44 +0200
Message-ID: <86635091cd5db0ecb7f07c5ad9d6f735ec349485.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX91 SoM and Symphony
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b29362cb650f..3c31e5167348 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1614,6 +1614,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite VAR-SOM-MX91 based boards
+        items:
+          - const: variscite,var-som-mx91-symphony # Variscite VAR-SOM-MX91 on Symphony
+          - const: variscite,var-som-mx91 # Variscite VAR-SOM-MX91
+          - const: fsl,imx91
+
       - description: Variscite DART-MX93 based boards
         items:
           - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
-- 
2.47.3

