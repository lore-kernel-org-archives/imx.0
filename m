Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4862248CD6E
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637468; cv=none; b=IgxLpUp1JuX8B4e78MCrVu6J7JymnAPAsgB36DigZ+5117PJuWTYPOxyyHFhE3P+qhkJM9PxGQ5v4GJ7sT/cZvQ0KSQl6PPIzywU5lbOXnkpJ5AqIwJKvbGaCH2BJvrpl/Zv4JFXmVTKssBNAQVgSfM7+D7xypC/dxfcCr+4F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637468; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EuxX2IaTDXpNrsLRmqA2gRliThiRLAk13TsiKxVzzV/WIfXjYXJFZFjqrSgLrGVoYR64741BFYNGY4pAMFoBNrj17rkatwfJNSHWs52tASTKgRtGDJSbhP8w5ZFCPTBlro7UXP0hEFq8LXRn0G2SO/IL9zdSGwJ2RegEsmPn/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqmJtamI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqmJtamI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso1702475e9.1
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637464; x=1787242264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=UqmJtamIdfYqr9GEu+nnqJAPg18A13Z3DkLEA244fCDfZeOnfFSMQm9ewMkCayOrC9
         k/NcpeQRE2V2GLt6Dyl07SnIrMO9XQDFC6bhe9cQ5szwGTpv9VauHXhpRJPSX5tO0iaV
         Ll9erRR6FGPiFYg/jm9qDfZ6vGR10W+Z2GPKXI4k/tHzxm1IrwnhawbV9j8xmMuTsiMi
         KMTxWl9YU4eoxVZwZo0ApWclJW98qBdTlO910ipb1jJFiKrNsjW4jEagObC8/+4keVoU
         qotjjJ5+CS3a89o81bNL5QI7RkuTtPt40A0P2M9IbAVgGvLpe1rGDN5aL1oTCwdC0bXA
         ye/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637464; x=1787242264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=LT4DRUXqLnYem8jVusiCQjuqCt0kOn6lVwkLeDcg/76CqC2rsHumz12o27IRbY7szB
         hOkEE9fX8dbZHf/Hud6tJigDiWpmhmV8AWrMY6KyT5wpNMnqOI7FVRxSHKVsbOR59/CZ
         FkE3uUCBN3UPEYcnB0UnIX/yM/3PVk6c+f6lp+rk823Ly0rA8H3LweCrfwjHIjjgBBQ6
         5xOodnz20yunPQx1n8RLZYk3cZKorxWmrFLD9fDMYhX3Pito0b+BG5+xd2BScfQwQr7H
         a0TEfga0THrvXseddlFE52KGd9JGpkwYrOyLVHOszpihkpZsTeS08nsWKBPoyF49jmhP
         saYg==
X-Forwarded-Encrypted: i=1; AHgh+RpY12XuHAy7Pg6Rl+2l0USHI0GnZcTnZ+e1Wd9MG+XXNT9fNTBfMF1JqwMczCIFuR4lxdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJcgpW05FFY+QCHT/0Fb3dMaJwmtAiWcsrdGGf/cjoY7Al+G+
	STFCtPHTSdSiqRXjDNCcRvjblKQ9WI0Ra8d/2o+t3PvR+zgY2zQMLJdC
X-Gm-Gg: AR+sD13ghT5Bs0GrxpU9KIckRzn5+E3t2s4+JTKN2pde0igb5/8pOvfgZ67PLWFmvVy
	NurTLgzpFpJKXKkELC6oN449CfY3vLN0WsBNnz+w7HrFSoZIJl4XBFOVU0apjZQKFR5ntFDjMzI
	rgZ6Oca7Utd2dZVvSH2G59wOjLTbUNyzeTDOkoPJGeDvLn4r1gl7NGQW8mEw4tPxsKZx1Yvxw9i
	ArL827nWnvgRdaKTAum864DTwFXyfc8paYSAgtUOjnePtNkkTm+ByB6BfLmu1vwjDphS6lGaLRJ
	JpQi12v8XGlSk4SBufcOuIDzXVy8+uuXLPYo9LVvzVVu6uAC8ZPaqBfZS6b0VmITeJHS8E7h/D2
	2L68gMFoKshWNeCaECpwCNNBj/ClDORPiYfjXvlwKdue5us4nNxSQrVC+oNd8w+UF1tKSgimKy5
	RjBguWGKa7Rvz1Lu+Y6gLMqsqmMjmqPCsrGIFhDb28fQYzDRX3U7AJxI8YNlOXCox25A==
X-Received: by 2002:a05:600c:3b88:b0:499:7aa8:bd09 with SMTP id 5b1f17b1804b1-499821880edmr89033725e9.4.1786637464204;
        Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 18:10:58 +0200
Message-ID: <20260813161101.2274327-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0

