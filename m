Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926221324B
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342689; cv=none; b=NcHQKqp/cnFlPXRX+kGQonv6LFjtCTrp4/br0Iw2z8Yf4kP3xyCnV2btNqVkZrtaAo1STwvTjd+ExrGtqoyb/MZt2uAeeaEJCbXsTb6oqklVp1s5BjIGH8DmD9Pmmz1ImFpkuF5w4C8l7IomT4zj+JOVqo3clO+iEIuhKWgRTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342689; c=relaxed/simple;
	bh=VuUdpkHlmMFr7mbOhennh+/tErc6Jkpp5XmmJqVRPSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3j0rb3/iznb5E16Qd2XJAoPHXBNm7J07oVBAchYX+78QRgu72rYsjYOfStkvoy6IFgafgHXIn3PqO7px1giGgIFZoFVJADgIAQn5X2Hp5wsMsoglsvaihaQKqLuGmhcWyUwCVOOgQN60Z/4A7zo7en57Tp2Z+2KDLm5fBjrqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErLridn3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErLridn3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39129017bbbso708377f8f.1
        for <imx@lists.linux.dev>; Fri, 07 Mar 2025 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342686; x=1741947486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3zujwTDTSnOftF9d4bbs2FCsfJL0He6fFCsD1C9TNw=;
        b=ErLridn3ANAJmRJJoEe9v1YGtVDWDEmCLcLN9IGg56+3NbQ4kARZbNIPFJugNa3GjG
         hGThjklJvts6TzNlU7K7pYYOjc82/apJfLX1SHTJjjmiNe6kwzWU662kx4y7LVghgJbY
         uJflBDi6CW9mY1RVgwhm2JxchMLXCZ38NCxlEA0bK5KmIUrQTRIO0VLO2Y+9JqseQD5V
         lZsPeN1U0Rofx+YG/m1yvRnQI1bXZMUuEeUA6TjkFaqj6l2/d0mHTo2zh9IZLYAZPc0q
         dCdHgOCIotV5kntK2r8GY/t3LCvm5KTf0VCfxIRRCwHgGZtOxXi10TKSHFWT+Afl03P9
         r9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342686; x=1741947486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3zujwTDTSnOftF9d4bbs2FCsfJL0He6fFCsD1C9TNw=;
        b=o1mNkDrhyX7kRFgGeh4+Dkn6NfUc1ZvU1OoFJsfVbC8J8wjHkBEQbXr4bWDMS5I1gL
         3JW9oqcNqgW/AYDUrhi6jOVg2I028j6PWMtXclQYVMPz5MwyGcEAiV2NtXFsOeSm9QuQ
         Ken9BWSavGzzelYWUCwbWzFM/ETQ684/6p0eT6sCmyBfNTS4bsvm+qXX3TgRCVpzIfeO
         1HE1kVQ1T9ctaeiRERMIrxkTX2L2cmEgCULH/ckcD9J4oo0NPfi2GjzJzDodtLY4bRCf
         toI5fucKkn+OBlBkXN/k/q7LGix8zng3Y+sgyOzs5InfFTZzysdTXKeNDFdUvezVvj+3
         3rDg==
X-Forwarded-Encrypted: i=1; AJvYcCXQkUdMqEbYWG74CYQJbvYQgtjFgRgTTPpnJ7DMnJPDNkrZYHKAZuZcgpBr3cdUyc4RnhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWKjlsgnlkiMQDQwzSjjzSUCHbNxdOLzRKzT5gLvqgkIzjsxQ1
	F4ho6vbPDGLRCWsK0+qAkSs61bCVICKOZ5dfW/yhTRYQ0ujC88JE
X-Gm-Gg: ASbGncvk4+BHCvVieGXdYkRqZc4JdGv0vTq9BMEKjy6oSEzUBkp3Rw+52jLHKTDbk3g
	NSylWOXNeU9hWPyVJWKiHW3I5T8Y3tqYjxO4rcXxPJZ8KI1FztTPBdjBqq58ZesczrwrADhDFzN
	OaRwlld/DEHs/ZV7H1+Toe/UZ36RaEPhRRmWEheJIjpdWn96Q0ZAi3dmHirC/lN8drjxqaVlcuW
	Ey3n8eD3k4g/B4WA1vIBIK71UwjJIyHtElzjmNR92o3EoD5btUhDyeul8o01HPQ1uu+NTvIInV2
	f73s7p22gdxvDa9b4JtOJKqDq8PyAOlpIcsPPJzavr5zH2apT8EfyK5eCRgiGmsByrr1S6lvizP
	FiAnI2Nig3pvXrWF3uRl2nTQ=
X-Google-Smtp-Source: AGHT+IGm5hWJ5tWDkJ/PuMrlbEjX8ZelRicivEZmMFKj0WGovJlJZMjjCvPcqwJRfFTKZqrD3ik87A==
X-Received: by 2002:a5d:5f89:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39132d671b9mr1522906f8f.1.1741342686055;
        Fri, 07 Mar 2025 02:18:06 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:05 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Fri,  7 Mar 2025 11:17:47 +0100
Message-ID: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

The STMPE811 touchscreen controller is no longer disabled by default.
The STMPE811 is self contained within the SoM, therefore, disabling it
is not the correct default behavior.

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-1-ernest.vanhoecke@toradex.com/

Ernest Van Hoecke (2):
  ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
  ARM: dts: apalis/colibri-imx6: Add support for v1.2

 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
 14 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

-- 
2.43.0

