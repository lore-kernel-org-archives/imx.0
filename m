Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDF21FF27
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905191; cv=none; b=I6TLVSc6XUJRjpAyJtQmAPg8IulSfhwGHa5Z5bMp6+zhcQY1KtEaMJIOLfHpcZ5c/DuIWsBTUsmAan1bKHVj3c/8IZSfskFxMD+B2AflmOpH7MzNoftOcZgeNzh/2QEA0RPGLrdsfmPIw3z1WfrbPiTfNR2dg7TJ7Qo+DeK2gNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905191; c=relaxed/simple;
	bh=7RciCMLdB/EjIizO99C1aUwFW6lsuJzA7tbC0O2NF28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxHYfZsFVUgSdEi+k1p2rnZ5sCnAkN9OVkG7kA/MJaakTK6A5Zlc79GXck8mbzVuEtJWJtYU0jy5RtGCDZMIzufahbhIPFKL9AYkOhX86rlwwzhvAupWlDav8kIEHqaJMPYE5WtTmc+H3iPQV+R4Mx7aHswlI+1e/TwZXGgkaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPiD73yH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPiD73yH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b77673fd78so115623f8f.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905188; x=1754509988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1tDMbTuCN3Y0uldNJTdwwCiPIYOQ819zTdnVjVwO+c=;
        b=EPiD73yHREOmbr0ngJHfG/9qG604WyLXUp9WpKp2C0ryLOcJ3ZPxi4M0AGEOK9GS7r
         rhTIyYVhV21Mh9wkq8clJqRK3AQ7578ffdcq2WapJXaiuBQSqHxFK0mVRs1pQGXGQxwU
         888vHfJy4o9u5NCHzLOPu2llBzgqFj2mbKLAI4kuUT6I3olrn1yaTS5P1jZDS5s/YFcD
         L4g6FwGZuc2QLTgGel7wtxV1wVYV/3w7n737JOjZLUUDR70a2Cr3D2yoPsts6XMGwJs7
         Kk8i6yKoXgR/jYqer1eYd5fw1bB3MKQbHmWM6N00/XReEuCNl/Db84O8O9MCxsym2ojD
         S4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905188; x=1754509988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1tDMbTuCN3Y0uldNJTdwwCiPIYOQ819zTdnVjVwO+c=;
        b=wVfjRJ2BCa0+FFz1XYUJPuz6MB9NkWWDkqhmwNeuhKGm20uIyGzuAgGHxHl+PT8qGK
         oCWl195PRADnRq7BN17VmSy+Xn3zqPHbhkPYjQatpvhmpUJzGjQOZCHymUbWUwVqddXB
         i2RS5PT+CO+F2zcwqdiFBN3mbi07Rz/xsIKmOuaXKZOvyd7WhsrIopInvvSE+YopU2VW
         4WeiNVAGBlpU5OHDMigD9ELDEXNTWsZGtpkHzZO/JLMs07tS0GqiY1ITvWVPNwO++gzM
         xCw9YV1sfL4e1xdBGAF4HKCMpFlDvm2S73jTbaPkkcNjKLdKMeIvNQ0+thI0YL5z9JWQ
         IiYA==
X-Forwarded-Encrypted: i=1; AJvYcCUIGV1YSdpWixQltJ/8EJ0HZbNlgcxqkYtxU2kNLFL6enN9SEu/fMaJUYuM+4Zqn2edcXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0/KSTr+PuJvJloRUjS9dOjFa7Hx0p+Rg1cATSJm5KD4OhJulZ
	rijwsN+fs+myi/CBupvmzp1M7FS74ddaD5pNKIdBSO0WqU2JFmKmQ9NIcWbpxo0VDO4=
X-Gm-Gg: ASbGncsp1wl1ThPTRP5NxjlHWvOgspye78c5GtxTW75GZVEKBD2CDvVVPVbhGhpW/zA
	AQUVkn5hLGoyQa/M6vk/rRp2I92Md/ktOeXlxbFAD05czZHS/5CP9ai4DHAh2HFOF4s4sJpxbcy
	2zGpLGFNkOEdfhKyk3g+IhQR4uV6nIJV2LciZG0quIMHxeYW2xDz1/gNkMpLAWwpt0UTpW4OKSI
	Hy8JwDK8M+2xxelqc+3shmS0/lomuvtcuCoioaVS52xQaTL6Hfwk+pq+lihre4oQsH3bSv9ujIw
	wNZ8Q0nJP9BTHTGXPvKQqW/DOESs1uvPcwYNNuyM05nPGpFJS4CnsmFcr+MQh1kERWvC4kWdLa2
	yaAE+0ttG9Skvy9TIqf2uesmgDyk3Qadp2BIuNAqIenBsUL7e
X-Google-Smtp-Source: AGHT+IGRYElrDpNrl4+NOhTLGZelVLohbX8W6yyY1T9P0SsEBWFP5ZTfZfawxMYWXsxXjtUKCFrSbg==
X-Received: by 2002:a05:6000:25c6:b0:3b7:8984:5134 with SMTP id ffacd0b85a97d-3b794fc0fb7mr3760889f8f.16.1753905187980;
        Wed, 30 Jul 2025 12:53:07 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:07 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) description
Date: Wed, 30 Jul 2025 21:50:18 +0200
Message-ID: <20250730195022.449894-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g2 has 7 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Describe them in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 3e775d030e37..12ce02525ae1 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -566,5 +566,61 @@ stm6: timer@40224000 {
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

