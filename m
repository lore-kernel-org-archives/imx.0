Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB522D3207
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970525; cv=none; b=tJIKjSAhUSRRO7Z6oOSTGV0hXUqlcvUBqxWF9CMJv/d8sGPV32k3cU7HP9XA8IamZD/t/u/E8dy0RKgB0nnBo4VlTgD58lickOZl1UoaCXvVtwONvDqwqhv/9uWL8IX3OyLxPpaF5DeFpxKdUO/8ed6LIHL0N03qdBd3SRtvrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970525; c=relaxed/simple;
	bh=7oA1q4nPReiJ1yN6yWyAlvE+1mr1Nyp3mcVVwjusBc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBUbr12xRX0A9PKrhAXpMRQJA76ym62XTOd8Cno5keJHfI+DjOslAWn9+6nEstXzWlOdbCzD8gytqVPmL09meYTNnfxMd5kOAPigWKfLpGH1ubCcabur34m7HJufYq1Uoi6esR+fo9yRZ1Ku3796C3yvn/hr6OHRFLBHdhmihjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZPLgEam; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZPLgEam"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so627207f8f.2
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970521; x=1754575321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5FfmuyODRKtH+CNEYfoGxU1JBfNxadHgUzuk0z3tnM=;
        b=iZPLgEamRykQctKPP43ltbOTs9WDrpXm8uABcYI3tWQ7T8KA/qo4auxt31EUf8L5IJ
         rz00ZimFTpaHbjiUSivsFNAJ0lRYk74xsChuEjNrDcsZiCpspf5ogeQB5hhPnk4ZTLnU
         uNKAnCskvFHPPiC8Ra/hM6RFApZSVwD7nwV5Na+EhyrlzTaVRAl8/zCGZkDsAzGpuyF8
         ezbkj9Euu/zKYGwSvdQvOQr1ZQgQ5krwk3Cu3W66Qx/ZCI6ppIcs79lHHI/k7iwAa0Du
         SQbNrgpHywEpTLvYF8ZKh21qZOSb3NpizFwvhI+iIjgdO8oz8CNnxxngdhvuhs8ncUlB
         orCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970521; x=1754575321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5FfmuyODRKtH+CNEYfoGxU1JBfNxadHgUzuk0z3tnM=;
        b=D3FfZ+wJks5Gzs9OjqF8GG6EpHBhE4NrTFvCRZqgBaA+djQ+KbeXLayRqanxtD3KWx
         dROipw4tOfil0pZAzwsu77r5PkjmWUNamlygK1W0q0sGX+X9+psBaSvctyzQiwk4jqbf
         H1TweFrmoT4GS0wmSPG6XVdtpqTHQH7Pc4DxM5gVB4kUXc3TuGda7PkspYRLLcSwDvM1
         KL0WMpM5UMDWRIqcIGzR80eJKH7NpZJ2j9qafn1n51Ac4+bIUPzCMrQJFSUVc0grTpsa
         E1w1mM4j6Ry4na0iOATKuHZZTs1nkH9PRlDcOQxQsRUeNrTy5RBPhf0GeuTMdBj5OuJb
         3KwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXroOEjYJKt5w19P/tNzFm8S/XOAqSuWc22xRuJxcN8xJ7/oZuY/qnBh7s5jmQDVOQt4ck=@lists.linux.dev
X-Gm-Message-State: AOJu0YykP3OcIceo1Bc4H+huqU4HU3O6/nHSg81nnJMyropB8aNdHbhX
	Fk53nY8Qj38jZw3QVn/qEMQUK/fmEwWjPv0NPID8FUrFq/FBgmBxWgh4Y9FL7RZy184=
X-Gm-Gg: ASbGncuKylfFlIJ00Bv0t1QcjZQfEjCiI7XJVDNiZSnKDhTDU80WGuBnCuLlc7oI6b9
	ZCYkXYJngXtnZLWSuSQCXFrHdIvfnok57KHPNlDNv/ssYrUMcK6IXqUjGbg84A7/4zrtThCS7t9
	Sltn3s6j69wh55VsjuqXE82DekYWQCd3le3ss2dA+KHZIKwmnBAskL6erAJq1JQiA70wd+2tNfJ
	92XLqqZpA2wsk/L4D0VZPOtA2Cm8GA4iXu6isk9Z7/rsI23FFpNGoLEca+wOIYx9Kl/UjNpSh8t
	h7HwnZ4VNIrMHfgWQyMVq7PaoDet9ynTTEZDEAIUyzCX1kuHE0VGfWQan2M+JkCIUld/z3oGuKL
	v4MAj+WpNVWc16UCyvWzj8Vuu3JWLiZLA1xu1kmpkjY6xenEJ
X-Google-Smtp-Source: AGHT+IFSB2g77P+JOGuXRChMmlAYoDUnakc0mUqILF6lDO5fOlHpcKD5KjoKBSFMkHDfsG7jcpdOQQ==
X-Received: by 2002:a05:6000:240e:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b794fe9320mr5813370f8f.34.1753970521109;
        Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 4/8] arm64: dts: s32g399a-rdb3: Enable the STM timers
Date: Thu, 31 Jul 2025 16:01:37 +0200
Message-ID: <20250731140146.62960-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform has 8 CPUs, and the Linux STM timer driver is
instantiated per CPU.  Enable 8 STM timers that can be used as
replacements for the ARM architected timers.  The remaining STM timers
are not useful to the Linux kernel and provide no benefit, so they are
left disabled.

Enable STM0 to STM6 and STM8 on the s32g399a-rdb3 platform.

STM7 is skipped, as it differs slightly from the others and requires
an additional property to be properly handled by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 .../boot/dts/freescale/s32g399a-rdb3.dts      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 802f543cae4a..467e0c105c3f 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,38 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
+&stm4 {
+	status = "okay";
+};
+
+&stm5 {
+	status = "okay";
+};
+
+&stm6 {
+	status = "okay";
+};
+
+&stm8 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0

