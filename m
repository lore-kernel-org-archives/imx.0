Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE79480DD3
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492379; cv=none; b=jyk6Mry8aL0fH03LEHldZuwhLx+/FXPLk4cWR/GLJWRwDOMD5UhxdFSTllBor8RXq0rB3otEP9+0w/9kXKSVtbioOKI+S5WEbKhaldAmhQs9ms0VTkzgHNP+4TMIbs4U6wsnGUuWAvskFMR6ALy4YyJB6eqltIO0Kf1MP47VFIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492379; c=relaxed/simple;
	bh=/cmWhljEJtFekc9xS145GwukYyOiz9c+Ja54CHAULoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv1v02jRY4o6IPLusn7B5gTICpi6xrAt9yELOFKqAD0BWddIGC5XxPmekGE822MGTHlNMaEIuMuUfwcIFnl6QlQzk6gx7STNunEGvoqjMyLxHiW095NfPh94WqEkT+MhwQXeXAT+P+Ff9vyhrqm6T4xsk/IYAOYoIf4IIiekpPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBR11Zb1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBR11Zb1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so16586535e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492375; x=1781097175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=LBR11Zb1AjkL63wHx8wEnsljY1uF8LJKz6JZEe7NgnQR+j90sRkXTGnY3dsV0zs+p/
         uPpyes+CxMXQxvxMgotrybiebgstWdbKUeMgnnz8Thu+tBQHktPTf/41/0HoEJS0NVW7
         r6DW3rH5lUn40IyOjj1JzZX4aWoMreaSeKmHq1sAoHRVPEIKZxp54vHwV75rV066Q679
         fiFHydf4LqYwFVHb62y9fi1jQUR8toGXQEfNyl2DtWWKEx2cxphJwBOGDtrhlAQRRkne
         CFLRRI+uXC9t14smJN00vTSFXYu0zIa9JrkbcKGWLoDT/x9AEXdOGkuQ3gMwa+emGHyp
         8ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492375; x=1781097175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Dy/GQpes6t3Dr4yJzGcSgwwK8OeTYqUiZJxbHyAXsg=;
        b=pmWlOGepYg2HVVN74VsPvdXQuFnU2T+xmcsv0ZT9Qg1cd4cSMEGLlRc/QPiMTscL/N
         NL0Q8SEnIyjx0G6Xzp3iopMIq6IooHIa906FuLcfiitsFyEoQAfymufgDifnP+pu/JOi
         wNF8fy+1OXQuXUlkmGPViR5z6pYNTEKdUaqRcv8eMrsn9kngaNURR2UCuRHNSv2IFOLJ
         mCSAiauNfDhJuO/e/sGu0IN6LpYmtp3XhooCxVI7OretznkJkiLj9LXNbwH3cm9htRNz
         rVagB5+jxUQd7TZTLn+V2xyOfxBvlrmwwXue9hcxUuHU59RJC5KY2FYMdsdsXDar49nJ
         UT+w==
X-Forwarded-Encrypted: i=1; AFNElJ+Sb657562FPICeaSz2ZyeAgZr44hX61iRJFgHdbGj0s3o7646SbU+DGwXQvuiqvMjnVg8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmt+8Cv7tXeVvct9I1C8tnBhdyjca9qe5u39ePJL4znMJpqhSx
	SuukP3cmp1kH+7ZA5qIB9AiZiBt3GcLAy9kTlJQyg0RmCBj11SxOaXrm4N8t/w==
X-Gm-Gg: Acq92OE3/F1YXqPVq/eCqDmBFHnOGGeI0id9tORqmObaVOBMyZrn+my2wCo4vBe8/YT
	IofjR5R0dz+ZI9H0Gcn6oLghbr/T1w0zj+6sqqrq8B+YSzj9yk9sW1fXbVI3YwhWiXQVQ1H2Omp
	s7qxEb2tkVwzNsZtLWT8d7cMouyFM4pxY4n8xMAP13u31stQq7kbONCbBnjsemLH8UAmizivr+8
	kEdYopUjOYzakDkqaBv2GD10UWVm6hht8rCOXNOn+6iNMJxFHvgqOEYXPBHrsoS95wrMwspVjYw
	QEkZ9+9pABuDh+isopr1E/d+Lt29yfHTAShnz+PHyFh6+Ll6S/OoJ1KlE8/+7/soz7xsBMigMKj
	Hw/IdN9mhGhHo+JEiDdda9pDj2aUsKDg19z/oxinZq46gZQLz3xdmRtUQhpu/Qt0yOGCxmYuDtj
	ApLes5ec8lT3VaTbdqxkEGsERuAJ7y4XuZCZ6eKwN1tphQLAbjBjK3LTE+MUuucSJW0ibaYNxrB
	0E8zCYPV2T36Q4slQdXv1z2DmxCmj+n8UGdSKV3c/RKML0W
X-Received: by 2002:a05:600c:8184:b0:490:7227:100 with SMTP id 5b1f17b1804b1-490b5fe9544mr53737595e9.18.1780492374970;
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:54 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 01/12] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 15:12:39 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Back, Home and Menu keys connected through the GPIO expander on
the Symphony carrier board.

Also enable the SNVS power key.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 291f65e36865..25f707012f62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -13,6 +13,31 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	gpio-leds {
 		compatible = "gpio-leds";
 
@@ -72,6 +97,10 @@ usb3-sata-sel-hog {
 	};
 };
 
+&snvs_pwrkey {
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

