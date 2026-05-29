Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F06363095
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049476; cv=none; b=t3MGO2PqvjxRr150HYjR3VPUbLartzoyIygg/s/VeLzAnwfpYUV2tQKD6ch2GopoNS2fMHFmbEgGa5aynnf421xq03r5zWcdiUYBJIXPeQbrx+RuUPYLmRiU3zMAT42Wv37g8HJt6rkzeL+qzTQVd4MCliDymMNhWrc1rUQkN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049476; c=relaxed/simple;
	bh=BW953TXROZllcLsU9kioZBcWhT7vnUD+jaqbWRSA2Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjSzOnqk3U92KppaJPg6Pb7X/R4MPWfr+es2cZLhW0wJwaYIkwumLmt1TUxJscAHj7al8jfpJvAYo9daFemQgEshvVC6ycCtCpUOTJ3RJqh0mqkjC8dSWW1GU6c5ghdQNBiWR/KSEDqbCWxFpz76KEs3S28g2Kd7q3UoHdg2I9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8Zz6/LE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8Zz6/LE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49048e043e5so59631985e9.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=i8Zz6/LESOZfZGdSEAOz0cB7eSBM53JrDpxuMfru77EIXfHg+V7ZYlBrJe3M28e66K
         0S3kNcvkf/s6uFWFY719T4dcplkukMzCHXqsGDMlz0t+nlN7Gl0vIGOBFKT1UfdKDbLj
         y/44i+zxCfOHDP6IwpImqkvqb0esvJXhQ3oZzAFevDuvEK888cRVRnRaFiE8LO7lvvbl
         tVq737j+IYnr4SIJlDcDdVBQcwDfTXNSOF8QXjGW7zx51clMk/1YoAcoBmpnCLLgn29e
         uNqORuDr275wlyqocisz7TeTVS9nGbxyb0h1pc0IRMg6iA/MHb1Rnhu+sxW+8rHzD0Yl
         LpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=R6ykv6O59p75Y7GNJwLZftnNzXPtkAzeU28vGA+TUS5KFVQehqyDflVAfvwOOQMaA9
         wc7AxGaEHmKe+lr0MHytIauSJriYakCZwypM/HzdOlcmXgGLUj8vw41aMiF0NNf6f9PE
         V0y3dHhEUCmafEuJwaqxOBA9jHj9cvpiFr7Dm4FuqJYXZL+e4cGv+REb0Mq24l7PBMBj
         /i1pGZ3AonNXfE4MHhSdQmJT6tJm+6Z3cZtjY30F52LHJHm9lfvgMf1GyK691hpENwcH
         Ja0P8bOOP8n69KxjaKhSyWh1YfHLG/gEW7z6hsDPvFBurcf8TpWCO1481N45rPblzzgz
         8e3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KwxH05n/BdHcI52KY8A4imQit1xsYGWg7YIAVhOfgso6lOuMsiEPs7jqTPUevicQ1KqY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgED3ws3MfHLk5uyNPIFeegWEq6IVhSHpoMmbMQikhxMlSEHe8
	Ut59qgXQTzawGvucTis4cJ06q7UoHaTmmC/oUq1J7Ih5B6vA0ab0Io9L
X-Gm-Gg: Acq92OGy9ofmpWOq7IRJ4UTXlnZIe7jchDZ7TfvlYpgE2p2eE8xBrLdwV3/z58FANKl
	816nP8JRgO2KfTr/ywFOgd4RS/L+e5WGL9+TOpX/3zJC1XC80GqZTv5I5OmjkcCfsansNROAXU+
	EvtYPnpYxsig/V7QK7Ziq7ncp3l9pFWV7zdfX1/xSrJWlXRFlvweLBP7OcsX226gvVCoX/CE4oX
	ZPfH2hQYbnjSmTpBqQt98vDByOZq4baKfs18CBYyKRwy6+XZYFMPouB4V78+68JbFaASKA+VpMH
	8HI92Ay286u7QLSECIASlLHGfsc6mVHwABLjIzBpFfvOrxQdgPIu376qLtlv4t2/pkMs1L7JT9B
	f3uneNazowqt8dgY8LzbgVSilYgmqkEf5ODjDqnjxh6DklO3sECwhssGMgX3bnG+3HeuEKnOFN9
	II99JkaSjDvBzSXACNO5Iomgzrw4Az3FFlXoqd3ymxzLi354ydCgGl7Rpsieo3fFlGrv0YEvs0P
	IhXU76IMCsD7dnyIyVomAjwHJAa4yYWyn7/331aUF9GoHI=
X-Received: by 2002:a05:600c:c168:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-4909c07267dmr44399965e9.5.1780049471356;
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:10:48 +0200
Message-ID: <040ad9104a8a628e3b2c18cb296a0d63d31b533c.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable signal is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and configure the TPM enable line as a GPIO
hog.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..ea996a36b022 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

