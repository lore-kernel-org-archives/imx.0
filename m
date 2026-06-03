Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A146AF32
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497452; cv=none; b=nDkYbu9MxY4yh0Mq2I0OtB8IeXWqX/TZpF0KA8diLltx3nP/wxxCxKk2EKl3IGsgba4Bqhby2DFV11Fd/5VDBd9M8a50x2x2JZxryfStEG/u7oK98LbsQHrF0U6gUzdTIAHeBa2CeYIVo0phGeNSVwW8s21V9MJVPLk5JQnX5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497452; c=relaxed/simple;
	bh=9xTuhM3rXQsKDiaRmFu8cpOscVPQZRyOPkfxie7Kp6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQKKj9eyUq1AvUe29gQx/nRMMpW2f14NuAXHXVb04fLDlhPzdrx+Y1B0qS028MCKL+WwUpHs0Jllzfj/69prBnnfeB/8U3MIW8dyROM1qax4hoAoeGSHduOVOEaGUJrfxHyoFcGBGybrTjzVVABXSJpbOW/dTYaWg855T10KIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSi+31K4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSi+31K4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso116933945e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497448; x=1781102248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=BSi+31K4VUMo9lNIlOfhqVYfFdTU0q/W7HhVu+H7VtcqqKXuQbWvBzGREVZyCmT5+z
         tRx+AgWiQlVuw/k8Z9QjdVYLrAq7eOO4c645jho7SVDJ9DIfbNfAO6bFvxlzPCGTuWDE
         sWmo3EE0Tax7CzHxvhnDuvm7KdT4hfWZnRP1YXni7LfSgf7l2CUT627MKOlCtqlfRKgz
         QPy0gd426zsUDsI4kaC3GQvk1kzcjUZtARiv5IPp8qviHsHxQ/QcbKRT39Fn0U/9QEnq
         zgvm2c8FPf03Ekf5Cjb+kB8rtiUmH7k85lYq2av4Lwp1ArhQZQTGLsMhosh9cUt/KHbA
         5OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497448; x=1781102248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNJJ9kwWhZqeENPGzU0YRnOooYzBFcKz0B9dMRj627o=;
        b=N9bikX5PyZJGbLhohy2gKOLqDAsjEn1opn9gMQEMZ3+dYg0aXqzf4Qs/1J8e6yyprc
         KvC7gWOEi7KkTEersZkLBOVD+JrGCUZ1S7JgXCgymz600cCkli1u/FtXiNyP85RQHpet
         9mHe2qH5tBBLNahsgvsW7tyqgWeAakRSGuNBr6PttMOb7PC9A3En8w7AX1o6kLqaS1xe
         VypSaJfYF68zsEF/9glZPlOzpbZO0fBPJ+H+7WQNZQ3lg+bADDxjUCZUWxk0tvu/xVWC
         dG2HAxHBcPGaPTTo6QshLEWxlO6BnU2d3rlTms2KXHHxJ5JwWbVjTsOj8S9khjJUFG1r
         C5Pg==
X-Forwarded-Encrypted: i=1; AFNElJ/8s/OnauxjI/Ut1D5OV76jFIZ6aUdF19E2YDySfYx7G34LJnGNEJqUIBbcQZbObaPVl0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwLZB0NaT0+RD8caiQbWhQkPH4rSKvKD5JNRvYsA+TYHQfi1+q
	1aLVG+6nuM/batxhk7CeGlBVOa+lIrD1UbxaNYOyVz185S0txmzNXuGn
X-Gm-Gg: Acq92OHxE3lCJBJfGkzuyer22LhgT81TqMZtQd9jZnkG6QqHrJtrcgbEqWFadMevArp
	LnAlB8tRkEtq0mvvMzguJykkmGW5FPKS32l46TjTKGckvlWW/0ywDPyGs1154MRRH7mjEQOateW
	ERq3FDpVPJdfOENLF0qpreypMdJaUSlh+pavRphPp4Cu23vXeT5tp1Vxa3d9Jh/CCnDGHAb9Kya
	ToC2RdOGTWic4OIzeNNCelcMXgqctetKN8F+ZsbdDoVBl4EP4RWFmLiZxVZgwb2L7AFOKU3PTxs
	Fz1Q2TdEV57sqEToUFjWWSPnPjEZ4ZUPR2N6lkc/Yl/rzCVixgYVLV0qKoy5Dr9UbqusULMQjOV
	jc1h1CEygnNtetntyqnAEFjgfYjxhTXOfQNrzSXuJbgyS4vkRfL/3RQOKYeeaY18Z4iNHTG1oMr
	fLc17975YJaHJj7BhqxJAv4Agtggom85OeEUUnZ8VfVAIdPJp+XqNCoZkdbk8DvqJfysBkLVgLn
	8fTtvS16Rg9fAcfd5k33lvCHkUr1S9y7JPrXFs1kF5YO4GR
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr58453575e9.10.1780497447770;
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:27 -0700 (PDT)
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
Subject: [PATCH v3 01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
Date: Wed,  3 Jun 2026 16:37:08 +0200
Message-ID: <2a02e17dd1cf516332e2f86e733620d58b9a73b9.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
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
v2->v3:
 - 

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

