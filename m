Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA721ABB1
	for <imx@lists.linux.dev>; Thu, 29 May 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507533; cv=none; b=LH4UdpVRmqhxUnIP8V7ff9ExlXvU7f83QZW7pl9i/moP3wh63BCqnJEQiT2XZBKU+PS38dxdE5TGjFuIS0f++sbBuan1bnm0FhY4SS+NhXmlZb2HTtFhJUsDfCYmdJrrYU/bK8j4rZbRLlv1vutIUoJmd4w4z2opedQgPKvWVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507533; c=relaxed/simple;
	bh=4ITvAOY5SZnpMgKLoIBNZ/Af1z/Tno1JfKRlDjhk/AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwoZqp+rUfoV3F65hFjRyz8YUDUrrlO4X3E08QabGzkBWeU8jZbWo+muC9QhXPt0Y+J2QWfl5sCMd7Qa8u1f3P7MK+APjFRK6LVIKJcdcFAiX1lK7pCGJZIFVHruls0KMT3fOnzrS+HVQX57rQVPnRaqe/nXErXFR44FZM0ntSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=i7jan0mZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i7jan0mZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1b94382b8so107043566b.0
        for <imx@lists.linux.dev>; Thu, 29 May 2025 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507530; x=1749112330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=i7jan0mZ5tQfH7+hdPpgj8TYmEjoCK3u1V0TLipFS3B2wROaZ1q40sEOqZ58pcscew
         +MC6yneUP6ACuAoRrYx7mghL3UUJIBaLnfhssqM9kU7Xc8TCyO5yRC8Dm4xbVM1Edcv/
         w9veONVB1Rz2Nv/Vzpz36Lpcxdz77RrBDU97w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507530; x=1749112330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=rdg+N0FRdchG3c6udMN12XwEVes52duWn/7clEaPrPqaxal9Kk+VdN5ToACB97npD1
         W0sgtoemEmaBz7oOdZczZZoVyKfWYB1em3QqDVEIAHtHqdOhYHX3dieLpWUdvJ81c/87
         j+HpwvenysMGOuuMcZlhjjRqratsWn/WkFVpXJZF9Jqm/gGXWcFMN5hZ1aN4RDb4Cu6A
         EcradWQxe4K1BmMzytKzzPJunjefWwpcdHD9ouydKXoOS+8OnXyi7kVQjwEWONksOETg
         pkLpU7d6QeNcDSed9URXUScp40PjgXOxmKRJykGrVmK1fDB9l83TYzq6Upt9gz+HzxwA
         CSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx9Jprj+2ItNPqvw+BPM2k3AxWue3mLpo26MNNPz9sNZJk1r8mGQvZd60EzGO2Z0Tcq0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzF4artPl9OrmV171AGI4hvtcqJFP98M5VVpBgGbxv4K+0GGtra
	HwLNqus+lNSgkrhGFxUOLBdukD08MUSRiz2XytNpjW6NEUZ6lO/t8grkwFV1uL6rpGw=
X-Gm-Gg: ASbGnctHV23R+xVW6XrJCjOPIYkvyTRYfJi+uyHeeta+MklZwTtkRiHKtf0suU68PvY
	QwDVlvv4VpkQxM9ZeEkBFJ+7vVjUxeDOcdELw56vY6o3KdzlRYPzSkrFFoOXHMPbK04TzgSfWXh
	8Y/X90CvKnKoT9DistkyZuW1qMx+DcnfmX2xJ5ssKMOEFQt76SMf7jN4w+YRb1Xj4MWtqFJSqDN
	2viVmlH1MlUHQNfJppsn8bYVUJPnxTlliRZNCipVpl67tARkI2z+/8ytqaxSFslGu4KgtFDosyR
	/AumEYmJrwfuF69S3ktNPrY9+O36XlZGHuSrhwO5RKaYB+ytGbbcCtWe4fjU9krco80YnOi0vfp
	eUnTJEOit8SEPDZyvvp3d+ymghGY=
X-Google-Smtp-Source: AGHT+IFdikkmzQilN7TiGR565IDIriKeCOFiTpijPBoqeaSwXu+CGLn9Jz9Qio+NdGj3viXD7/eBzw==
X-Received: by 2002:a17:907:6d11:b0:ad8:8ac5:c75e with SMTP id a640c23a62f3a-adadf2a2945mr112016566b.60.1748507529623;
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
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
Subject: [PATCH v3 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 10:31:05 +0200
Message-ID: <20250529083201.2286915-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

