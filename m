Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47E284669
	for <imx@lists.linux.dev>; Wed, 28 May 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434397; cv=none; b=kZbdGjn176KuE2ER8o+lO0V+af/ukALbGllsIAtgQWUAxF0DnC4Wjabw3EmMMzo0WU54uj3jBLbNqa0yxG5s19w+AT8+vPjrTNy1ZMmoL2SlDzWcecXAr9orccp9jVr0cz+JYPZFlZh3aTLrMXfo+jDQ4Ft7dA4jKnXf/+u/f+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434397; c=relaxed/simple;
	bh=rl1DYff208utY7B4albm0ztL9bncdC6Wfr37/QGcCvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ie8zRUx/Q31PUvDZBjNWAUw6/GHsBlo2WjmqkCQYiP8GFJ0HQdB8vNlNWorMaRVy34ghk5bOPdHYRDqgYjNDrsd4E31UNXwEw5MPlXBL9RbCtYCgXEvzfczEMrwcnIsMRwr9rk1upvxsAIO5yfdTerB53KdINU9QNq5Nh1KBuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pIoB3WJf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pIoB3WJf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6021b8b2c5fso8501217a12.2
        for <imx@lists.linux.dev>; Wed, 28 May 2025 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434394; x=1749039194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=pIoB3WJfgkp0sdJzhMw+jr8KtyF8f5HsH0YnsjwmG4AE1k5FOqGKRcfGJocaEIg8kP
         R9vLILuF2SCqAfKWYYEvEj8Fgo9viobxshi++DTqd7TXsrKSup3DlHQ3LzoDwGNIIsR7
         G2h1+HASHA11UA0KD5vD4101MYBPQZRh/1z1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434394; x=1749039194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=sjfWe/q4SR4eCgH4JxzivqgB04IA0hAyYpC9Z2LhSX1EH+8hgKfKy1YUYENrA1MZhb
         x4CHrczdz54QpFx9DaBSlr4XC8Sbg7vRb4WjeJ7uWbiWl4MRgtmGGMj8nUXtQUMpcwA1
         0IXNirVfxtLX3Em0x1UkE42zxw3ny3f7GPy75u+GhzgdFOZLcn9604FRbcLxezW8ACvP
         4kjgs1TIDK05Jxed2kJIM2ejcyUgxUgHENEOQXhC8XOX35oo5SHhl2165MtG0idpcXXQ
         knQS3XqcvwvZu2dfQrCjwEUnRcH7OO7/3Ll0r4IE2AUu2dEdYBgX6tq4usGSLPKdSmHv
         RX1A==
X-Forwarded-Encrypted: i=1; AJvYcCXnwQJtDDBcnuUm33GPYvl6ALbJ5g23JgKLI2eM+jYnLR9bhCAfNmSpX2vHYU4Wf9bS7hk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKyBw3QfpTzDj+ZhtG0lNDYQ9+4909QkoalTIyRIwUSaf9xGb9
	vHZitLn959g3vLJlQhneyp814xVXYH4niORSS19CpMp9acrvqef/eOJEX4kBvBsh2Z4=
X-Gm-Gg: ASbGncu51V0AgqQIcFS5hqzdqhwt21iC7MfxTB2duJqGEFzSjshDb4lGvKBD9mUDrpt
	NYQe3q1lA4II9/RjMrH/dfLC+HAr59rnIN+bM32pSjO/IF+A6HB8yK/CVnx/dce7SipsGW2uLUS
	p589sM6BBpnXCcEHwtHY+B5fnKTxBiH4u+stl5xXimHl6pPajzuWsGKby/AkOc4aS62p1BxKOev
	jsk1B38ikjqBrgD3+WIfBr7qT8diHmb4WrSNN00BSiZPt9XY6+gHrh2sn/NgxXxNIjPLRSUgjwz
	oQlqvZqTMf+24YKVVWQQAT7DAAAb8yuH83ARlYPwQs/H6lub90Tb8BIMjWQkD/tLkIy5K9XQJYQ
	FhX6oWn6HbW31
X-Google-Smtp-Source: AGHT+IGX/l3aYv50yZQiAwumavns5Baq8oSOepnjn19OavmavGdcIsWU1pqdCC9aSgoKvq+TMQezmg==
X-Received: by 2002:a17:906:f58b:b0:ad5:557b:c369 with SMTP id a640c23a62f3a-ad85b1c2be8mr1532953166b.33.1748434394098;
        Wed, 28 May 2025 05:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:13 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 28 May 2025 14:11:39 +0200
Message-ID: <20250528121306.1464830-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

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

