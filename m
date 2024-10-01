Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1C1C3304
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786748; cv=none; b=N33eYwE6r4jJShx4NjSAQp4ueELyPslmy2rd175kMzTxROylCgbKtzg1uK/keq6M0CwUWfmDT5PbEfmfVnxJWhDWViv92nElhLuL+P2sukCbuT+pJkjIU9nHh9UM3jozCANjJpwqordGMHdbvXkUkBtF/KsIcrVqRrXCDzJ5RDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786748; c=relaxed/simple;
	bh=vIJP//LDwqp9d1ES2JWxaeW61nA8Y5L2wZyNrUb4Jxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENo9tjDLpaaCOUeTtWtmkeEjowE2Fg2zxN+4kzknMMoNLeseKApSSngK5Y6v156dpD1b5Y4GnWw3JNEbpdWKNH3iLZLqp5XWhiPRgmeCf+yk4Jd82t6b2DZSoxnHAAco275QDdaNZ1V9Dy/VLK8VLHbgcr/N4KIGeXSsrgh+6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTIChf6x; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTIChf6x"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e0d9b70455so3245965a91.3
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727786747; x=1728391547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lgFxHwlPgcqQWOe6Kh3f55RJmwv7Nk1Xd/rGvKcrl8=;
        b=lTIChf6xXkAh6MoldtFRlomN4ZVSqYWSkdp9wMu1cwzjT6zfLHXsMtx/ikn6LJMuOn
         fBHtbI0FYHcLAI4rvpPG3ztZHqiVHsoonzpJzNpBXWYVxKw6WARgF2oMS/kEilFejIIN
         Gbjr+bD1Yf6SkLVCrRl8JjAMQn/NIxdYYpG6gt94Ednro+AyccM22PgWNp0ZQtAVRTIA
         4xhMbEO4F/L9Tx+jQtcveY+L+922ZFct0BD7BcDJ4jR+/QNWlfHAscJcsbAYMbIO/zFu
         bFbuNJC2QTAV2awsyDhS0j8MeFijdjVGpaPc4NSQagtbbtZ5oiADYegISg8PREQ7XaFr
         SXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786747; x=1728391547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lgFxHwlPgcqQWOe6Kh3f55RJmwv7Nk1Xd/rGvKcrl8=;
        b=n/0c8sGi5Bg5llOXqJHIVt6PpFt7+eebsggVxLLKgN7I+CyJQ9N+Y3T9RIqyPWLuqX
         9Of3zg0z/00UxhQtdJ1ZXC1fY1obc8UqKoPXqy7xf3zr3rdekibCelhsnDiBLNh0T9nm
         A9khQDfFL6LwQrZkY6UH6wdRZXkCYh15cbnytxK+tW4aF+BNKeJyYbsHSURwhLTu7oTB
         7tYvWy3oEc+8B74JZkJZV33hBGW+7x9FcX523MEO3mqSLQhg1/t5wItbvOyukaPUJj3s
         +eMwuEjOYXJIHBEmJXmqGtS2u02/iKXAe+W5XoJitYLmGksWHbxuMFQPKXy3DPqJKUg/
         UhbA==
X-Forwarded-Encrypted: i=1; AJvYcCUVE+ZBj5zQE21B0VJZI9yh9sKfmyvQUobwX4Se+4FBgBI2K6UNhIHfjuDouvaSjco2nF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQbbJ+r35tFEVWtTb3zqMOwr5b1nwqMT1i4nYa9huQOWVKaO1I
	qk4kTUj61SSJLpE+emQPLC1RzbcXRv35PU5zAjkLeY2kFU/lxTRM
X-Google-Smtp-Source: AGHT+IGzSrL30VOUfoLyClRDdPoMyMLBNdWGQn7nW9CpSugHO/Cg/vDjbiv7uwVw9+a1echxGAVagQ==
X-Received: by 2002:a17:90a:ad98:b0:2d8:d098:4f31 with SMTP id 98e67ed59e1d1-2e0b8a20263mr17797001a91.17.1727786746876;
        Tue, 01 Oct 2024 05:45:46 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1704bdsm13629171a91.5.2024.10.01.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:45:46 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-verdin: Update tla2024 adc compatible
Date: Tue,  1 Oct 2024 09:45:04 -0300
Message-Id: <20241001124505.73857-3-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
References: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

With commit f1c9ce0ced2d ("iio: adc: ti-ads1015: Add TLA2024 support") a
new compatible was introduced for TLA2024 ADC. Update the device tree to
use the correct compatible for the Verdin-iMX8MM hardware.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fa395914191..49562ec7969b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -484,7 +484,7 @@ rtc_i2c: rtc@32 {
 	};
 
 	adc@49 {
-		compatible = "ti,ads1015";
+		compatible = "ti,tla2024";
 		reg = <0x49>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1

