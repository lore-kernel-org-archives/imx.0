Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7585199EB2
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483848; cv=none; b=g0xHvd6l7nQ1Nxlapv0L0KNjYiQrbsdUf7lal57rqNPhNyMo+S4SjLKx+36bFP0NMyG1iN4IvSWVCkAQ6KKgwkDovNlO9H2xJBShBx/umDc3lIzC7DpYa0bvJiJseXT7UHK+Joa/ZwmXARzOsb6g77+DmAM+dFxhkxJS8OpitOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483848; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MezVyqIte63irNGznlnWmaROImHgQzZ8idnsb4Rfjt8q9Q1dJw22Vf6+7uGdRNIz92u6JEBd0mgw6IpfaR6EsHAvdQzbQfc1+MKxl8SE/ZVFf6AKnO9t2/bcQNrC0fyvgMqf/CClK8mZZSDvhkBUhJpr3f0ulFPDo/uLvAriW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ojWyhaWj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ojWyhaWj"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1363788766b.2
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483845; x=1736088645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=ojWyhaWjG4t3lK53p8zcD0k/GLCHeoUf755ZuSjbGqhCS11ZbvnHxGJWaseC4ZLaxD
         32PUnA4PlHzgELacXaTm7rt5vloOlQ1N+BAaUdT+qdTuRN4eE4y2sX41tTDOlewrcrgP
         NJkRx6cmU/+fhWAzLvN/lYIQamtrh58U8F2ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483845; x=1736088645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=PFMPkILZQHX34KmJru6fRxRDorYTowZs43ns8NQ/JVBNIzQj2ak5dJYkOVwRbNY+fL
         ntCinCDyse1FxbGpjIB4szws9kk8u6FiS3cMXfVFDoRv7UZb1k1E/ZoSaAGvrhLZh/rY
         HBH5/1+obHXZCgGV8W8jIxsSeALCS7QH8E66uotxYkHxS5gOrmTT0aYkyiA2HHfrEF8M
         Xrb+TWkuNkqf2jutDVAplqzAlwayHWJf6zJo0Dk5EOf7zqIwLcCRa3a/ZwHBD9+WgPqT
         /GnQg3rS/+Th7Ngy6zpGGZh1hRNHdkrZjfKmMiol5+mXov4MPoCV+xIJNzHosy4xVkSC
         Mhsw==
X-Forwarded-Encrypted: i=1; AJvYcCVHmmZqVMRW+yjRGTWib4rnzXfAm6J9NWmvzx3QM5eD7Zzu8VoS14tQP7QTWUJY0hZXHCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzSXXpMAynRg3J7iYMY4sVbEXWy4gDrKkKjz3XzlRlrSSK6uQU
	PkcAgpsVVelr7W03MWMHr/1IXdcBjbEwv+YXMtveYf1flja0JlGb00KkWriAoes=
X-Gm-Gg: ASbGncsY3RblvVKfIYHa8+Le3yGy8bR1aHS5CAYOz8NUNCiQrFqvEam2Ju5apdOIHvl
	OZKS/SJRnHicXZCHqrjF/AQ0ic9kCddFxeeJcPIAYxWCvsz/hUDkxsU4B8fH2XE82norJcGDvug
	IEeuY3l5EKep4FRBh/ywXSzrTeoZr4hxutUXKBb8ggrrtAAfw4uJmFeQDGEQJ8Ez5aJ//dkvIhi
	dTViUUAW3rnz7LC1ulZynurZz1HF3Q+W/j+g4ndOl4nRqw5h2RKg10vtEIgsfhf6sVgntQNtslI
	5q60bc21QpXomqoNhYWj5w==
X-Google-Smtp-Source: AGHT+IGIJCSLlNgA08GSB5oSqyndnsfBTf0pp87lM2OqXe192f2irVoeHNvImjIfNJtI9EF5Ka+UDw==
X-Received: by 2002:a17:907:6092:b0:aab:c35e:509b with SMTP id a640c23a62f3a-aac3378bee1mr2634088366b.55.1735483845025;
        Sun, 29 Dec 2024 06:50:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v8 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:32 +0100
Message-ID: <20241229145027.3984542-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

