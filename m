Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3193F7E77
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945724; cv=none; b=lTTlJoGUlDAOzkLh8LfhbYxOH9o9/hHnlzBeeNGnERB02feYymptxw4IkjpXUdlQBYWObJ7UV4vTC6lZ8MRfZL6QWXnpLnM/lGH/K6aYWrM1IhJxsw2+Jbg6Un2KHQtDKtXiHrengOJ2iZpsq9L4k73T8TDmkYpt8PTtedkt4fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945724; c=relaxed/simple;
	bh=OKQ6ITiXJ1sq9W2uBiwEhtzGC+JhqD9k+TysxbOFCIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lu7SPNztTEpCKfJwZdXW+MIxb5V43ZYO6pdxdrlALXvBgKyWfomP98WFmHzvbO4xXdVxNWnqZXpwR2OVWTznTlV0lgiSJD9yRD04jWX/hk8g/vIakGX37JAnnbCs2ki/htQeX2rTztfD5Y0ZLgSLOArslEEISoarWQjG/94pYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0tBzppo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0tBzppo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so11546625e9.2
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945719; x=1774550519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu2Rc4rssQfTFJ5EZaq1oCgNnoY0eCc8f3U0nan/fr4=;
        b=K0tBzppobH36RA1+s36UFsmQ1KDbEClpr8kv0GpzIHTpef370RLL00s2yfSHszx9+B
         Rm4/Zr5cueCrIkfOsQadDQz1ngPArlHPGgLA+Nz6QPN32NDdtPKAsihEgCcxbD+uBbFO
         YuE/B6U1Jm/i+xlxz7vuJAM8wt+Gum8kzOPMtQraOegyyJUzCoB4c7FBW99qKIU9G9m8
         64NrsPwTz6rKwqC/AlljqiR+GemuskVqXXm1pZT1dJO/m+2Redw4zyTi7K8dv3dr+NBx
         fcip0mxLMvm+l6PvhJjgrl9vOGlxshXwfGJu1APu0nSGHy09TWFmbQ8JzKWIC+82VYfd
         5pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945719; x=1774550519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fu2Rc4rssQfTFJ5EZaq1oCgNnoY0eCc8f3U0nan/fr4=;
        b=tNGBaJ5STBbi9JAFma3n5Caco4h7L9Si8ae4VlqDgZsAGexxfBe8SAUCS1gLsJSpkx
         Wbutmajv3pEFZ3iZuNmKdAJYEsZd03ZzRJfji3lSuoDCZ2bu7O7FFXYt14FNcjhMyuVQ
         W9yVmWQeUYvVGMNX657TCozxTZxaYfYLmoTp5wBoNJzHKTjPsNsu/F+HfRMuSM8+Cdzh
         ujtQokbh9QV+H34BS3OrV/LOPdKwVp5c5h4jLMW02ulpFR2YkFtaOqA1ttzd8eBFkTuK
         QoZVGjyuBE7eW3yagdFFKqZxqWa1OqoG2kucGx/ncHldX3WcS96jnUX/doq8lxYyy9VI
         MQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDVtb5JebnkK6WSjcmO6URuF7CtPH9pNB7DIb+g3+q/sLNdceAbHO317zhZDf5J+zxjeQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK2k15oSLv6uqVeCnQz5nXqhT2LJ9F15Pkh/p2OF2ZWJeb4JQ2
	Y1AgJButWJN1RV0dWjD9i+oULmxN3hsbv0VLwcEDkRB7hiBuWAlMDXdw
X-Gm-Gg: ATEYQzzoMuaHUTsAMFCOQmpxynlq03ZMdS2spwzOyYlsobrjiv+VDR9YTSrD0Qdrdyj
	f5yrPgBheFqeh/IOw1q3P/xK6b7XWj90paGNg8XuG7xCVWVOpzBSgPT2jvkbE1HWdZHeAfR1EeG
	ydv7F0TCm0Vo9DnmN+BTZZ481uMpZJlR441O9UHj6L2TlV8cifcAAAHzTTdWzV32GaMK6O+9iRf
	qVK3093dDDEHfS1dV88ppbMsiDhycVXUg/lfoFFOi19krHGJz9P9L/gX6EtmnlknpvliG8a9JmC
	yb1apjLslhLRbAeENPrUAGnlGUBFxUOC3H9xIFTvLLi5M6Men7lLbyyL7OeCWYR75ahM7s/6/Yy
	s3EgxazEmG9N2A8qnTag/NO274NZZw2QChzaCeRBkC1aa8M70Suf43H7KE54NFIZfpuzKIO0PNr
	GiLxrkKOzHJNgA/xWzc7xvvzNgRZv3UPVTkGec45hlclIuoMjln7sWrUqrhfPAzKXpa54rGxgEg
	TveR9djJ6wWu2Qjv+/FKeKBKpv+DYFBP0EB9KY=
X-Received: by 2002:a05:600c:1da1:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-486fedc9c01mr2720365e9.12.1773945719265;
        Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Thu, 19 Mar 2026 19:40:29 +0100
Message-ID: <570b16455e37e7ce4d2556ed4e21d67ac3a27183.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 6da29845985f..6112e4392c59 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -153,6 +153,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

