Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAD23535F
	for <imx@lists.linux.dev>; Fri, 30 May 2025 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621279; cv=none; b=EKCZjuP2w+xXe5mMk5YG1wm9bSarsS4BOLoBBNsX+RZFoNeSBim4MZylBFRvekbQOa24HeK3RMOH7O9pQHgy7LsCyLo3quPGtIguMwx0kNwo8SXu2GHcIZZ2CxukYnhaIRM3fhqWtc0QRaghnHlquRt7IV8myw93NW8hKOJLhog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621279; c=relaxed/simple;
	bh=sKyyp9KsoPPae0scG2TJa4HQa9SfU2SZ+xFe9IFIWMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EitnE6/t8eMys7lDETKQA7SaxHPdtn0+x0GzaY4SYQDhw7GWokNkJIq3bE/hbu6Lmc+q1EjssWL1UOdOqkTjJk431O2Vn4daCV7S5OO3/nS1quC/l06hzDV2vNr9EO6T8YcGx6jJbXDgXedDwXeEWWxW+52hDVdNO3hJdQJPpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gixyiE0n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gixyiE0n"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442f9043f56so13775285e9.0
        for <imx@lists.linux.dev>; Fri, 30 May 2025 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621276; x=1749226076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=gixyiE0n3DVrSfCGrOh7zx4PWqgzdDyODgG0JlzSTbKwQBpt280iOWq1OtbhBX7zof
         YUxJj957syHYCVWi0crNtapWg1LrwYgIMbw1jT7t0ec5awyCHGLM5mjvxL6SXgqIwZRi
         Pgzk1SW+IxXLkQMBr9Z45IMxGaIJKAlNN2hCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621276; x=1749226076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=S0b77NF767IDvw7PdJkirWwEd1tb5vLnbqzNwoTuChmNMLds0eXnkm9DZd3gVme+MC
         e/EFZIta6d2Km4Zgn6fl31e1oLFBynwxWW6ZaT7XT62UOqFNPtJ6IcCcNLJJONtpjVk3
         f7DHidEpaN49cU8NPeFkdco6udtu1L/s48zEr+Th71C7OBWn65/8jf5ibJ2bLAz9pqSG
         33bMSyDkWVpXppkTke2/X/vhj1HKqRHfWUtxv+FhYwIgkUJMv6b/gTXzM1YIlaeINgmz
         go3cGJyEEjWQS9S3K01E20oP1+pqSLRDvDBHOUIKlY8jKkYoNNhiYEMGo52n5tYmdNLz
         TH3g==
X-Forwarded-Encrypted: i=1; AJvYcCUOI9RsC+r+Vq/WVcmoSRIhWPXvKuNFXzejnsYSubH3xPri4p6dEnoXM7jttCIGpigo4Vw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HO2sHJmRBWeJOAsCB1A/5u6w04eyPVpvEBN5uZ3A9aj5QTAP
	FrLXtBQmJgE1N73LrKS/M2ZPM6fcpyINmhxkTmVPHHP1yJ9JTBqcjOa68z0TNPs10XE=
X-Gm-Gg: ASbGncu+Vyc/UEQ5O6Nghztgqu5AllqeLJjzU34sv6QeV7n67x9MvQFNOmPTqnYiC9S
	4ogUMDQNPrZPjWPEArmGbh9MHSCRD8osMIarlj6XN6eFYHdsHIfeeQOm8aXf46P21p6UlfPu/EF
	TVjnQgzVUsKT5XB0+x3WFjWMfmXkCxJcgWuqcvFrD2LrKeEGxuyNl9HrPfPm4oQICDbppfy+kQj
	QxE7qvg6fryq7BOOtnj+o71Os4EyT4g+G9+VCiVGu/p65yplOCQJ3yvdqebW3eNI77pHq1iqfr3
	9BHJDGEVFUJG5lwYBGRVr3L9PMEn4KH5LqXL9G3opjuLAi90rL+jAxocmRJ26yFDOgCZslef1yp
	8va/76G9UYuTX1Ui5MjftB4YKjP1AfNdinC3vDRmH
X-Google-Smtp-Source: AGHT+IF/FFTEstI8VczI8bSd8uyPZIXtdnlGAyynzNnJaNGF3uvbYAuD6vs/4UH6m6kIb/231ZEJww==
X-Received: by 2002:a05:600c:8207:b0:450:d586:25ad with SMTP id 5b1f17b1804b1-450d6543cf3mr43891965e9.15.1748621275772;
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 30 May 2025 18:07:33 +0200
Message-ID: <20250530160748.2476088-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

