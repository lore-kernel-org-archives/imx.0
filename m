Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A11C266B5B
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388205; cv=none; b=cTM3nOsjaQn+3OYJNfi+Cscci2V/i2UmSVL//btgMJBE1GtTCcJSmTFozA/UfnDWHWxCBvAy8NLv11l+MjAUwajYO57WSaReZgsTMGGX8Y8FY0ugb9X7pO3WJlujbsermVpPd/bRz6ccjLzSEh6PLq0k6vxA8+JnLcmq75N+u0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388205; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGtEIVeYZEHmCCn3LSJxv40ZnUtpWSQI5UvMPHk+hTbfMtX5U0qo9/kHtSlDqGPG1J4qKykGbhkqvlDBiNhJR3HsnKn8c6KifDc6okleCuKSBuxjQaGaIzrv8P2gxEymClc69QETGHTi3UW71226+DdEr69fLUfEIrkYZwm51ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lDwxszZ4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lDwxszZ4"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1017961866b.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388202; x=1745993002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=lDwxszZ4MolHcz/N2rA/Ph3dDXCasGsGEmWjt5ME5HlzJPL+Aq5ZpZ3j7OJsFDXcZV
         S9uKs0AjcNOldS0FkZZ0Y3XbHQPCQaUT5YmNOGQ/SGSH8+UBqbQQLrxN5U5Gux0nQJ23
         AH+fD/Lr4eKmHJz6TgxSMOCC93ZH0gfLEFtg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388202; x=1745993002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=lg9NAO6I54nP+SsCj0eFxw59dyzyRptwtiCCGzSkfdtQvO2ZV4YDQgHD7iMx35T3YG
         Pt1kf+mjflm1c7vkxRRK3YOsaQuqZ9xViEr5jfCwUKIRORr7xED0WqDPDbwCIzKnp82Y
         nwwsWl5QpOEcek9/+OXlaDyG20QqssU44/fxsJGCSjg17/NT+m8xYQHjdKdEapQS9ld7
         0Xcy9pCwuf9gvIAdv4ZDpzZbAcnWZUvGQE9u+fHu1sDAtmhoUAFlzM28RKTQreHYQafr
         kTXiQKCAf7g3oi9nRTAsTOr4JIG5zMoMMFA4RG/5SgvTSzYOrAnL+vp49HtDNs+lMYdQ
         AUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJFWAV90P6RrSInOS4sitMXvLyQ1QmUdvg4igjPPbrvvjUmTIlxbkoHct4EIOapsJdmPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdS+jK05Wm4DyoKQPqdAwi7RLf1hdAj1kRKCBhLaLd1urbaMZf
	OuJMdMD9HsWrwYapwzyKaUlmadr99bMeM7tIIb4MLqsfqRg6RbiXsdrB/DiHXj0=
X-Gm-Gg: ASbGncvzrR+4ceaRD/IXAKPGJynMWXwkU2UAEp2JxE4+JUEXjTtQUHmODiTCyhlFOw3
	PW76SGYMexXZslFo6w57VEoqJEZdRgY9xnHOZUNTDjmH93co6nvkch7MeYOQ0jQQkyNTu+4VT7N
	7a5KIOfe3VfZAwv74W7q97mhPZCMJbN0+itpVTqyVRV+U/oyeVSJ+Wrck58TswlZcrTE9ZtLn8d
	SQm5BmyjQoUo//Ov1emBTDWc+Tzw5liKtZfWmKbhWYedAW/bZekCO8m5QuwLgm10+l/DQ5dcnIu
	7F+rnZwBYZ4JHx9B2YCBzQuWT0J4OZCLwhCW3ylWdEVsg4Ear4JjrSj5knhvGZWiIg73MmBgjQ6
	dvvQf
X-Google-Smtp-Source: AGHT+IEJ56spgVoRyAaSkes0KMlG9QsQfLguHD7mHBCsh2ck1d40hCG4yrSLmlQgHJPAAi1Y7j5Rmg==
X-Received: by 2002:a17:907:3f29:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb74b7f3ddmr1978951766b.29.1745388201594;
        Tue, 22 Apr 2025 23:03:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 16/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:33 +0200
Message-ID: <20250423060241.95521-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

