Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344D202F80
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732734386; cv=none; b=pfmM6xhBUOXP3yRo+7P4c17Np2m3x3jhkSVZ0NVsK/b8YR7it6ubZv+qsoS9+M9+HND6IhR7GLTi1ohlPgsgKy9UCnI+ON6AiJzeZG+MB/0bWPcMsbsk1QHN0TZ0TzOQ5y+ImPzfxO3xyUcheqbOvXIyeY2jfEvgGoTpUdCobsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732734386; c=relaxed/simple;
	bh=7ec7IU/QOhQpuUrj/Jhjkr9X93j0m/1X/OiosCdCTNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kY63PtLlKug1XK0pcIWawIsPQnOXucQMWGkcoLRrnKVvr4oqlB7AeXCK2UdNSpbeWtq5M+6Q3Jh1+gsCcTSXIUt75JzcbPUfTEE2/Lmd+7dRulOzB5weogsfsL+ZN+g2RcigUSBDxcEtqx9wVZECu+idassewY9wG4wdImLO+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKuuA40U; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKuuA40U"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so116102b3a.2
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734382; x=1733339182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iRGowmY09x6NtLH9Lb1/0sWvfPDP0DN1AXCvHkKcIk=;
        b=BKuuA40U3oe5VKKabIny0fI+hR67Tk6lHZdnC+oZ2OLm+6lzRPCxAMKjWGa/9cbLTK
         58+v/AcRt4P8hyzCW/C4RsbwBeid14XI+0GoYvHwOaXraWyt12p6RtBoiq9WPbJS5yUS
         +20hxlkaACYmIhOL0TinrfuctdIu2Zr7EC80r5EeDYTaM4iiHKM0e9jZS7EnDI2tNEMv
         6X9dKYq9noA98d1biSfYPMOCym2KRzGPJrl+RM7Zc8IHIxIHpzN9O3yga23WWs4K5zZn
         gUD+y/7VvgPxicZLZZe3XGZYK4Rmca6GN+XZHTBVDf/AT346KHFQSZIax/V9y0MfQS2S
         Ombw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734382; x=1733339182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iRGowmY09x6NtLH9Lb1/0sWvfPDP0DN1AXCvHkKcIk=;
        b=vBnrKthlo3afPXeylqkGr7wbLl6EHwhTVs5Z5DNyhumm/lzRFBd4iKRYY76asg6dfP
         D/HQukrEOl75GWwYEaKJxNFZ4ADMNC2KweDVtHV6mUCPHInJajHL6hBVrktmF4dCBcsP
         WhGbQVrhW2IExrywIiA0D/OLbh3rJgGZEH4g94jZZEIOqo+dPhK0qH+SGW5IOsfVXpn6
         O5uT0aQh4MuwpEOnrbx/9Wwwq+YNQwqCzFOSySBt1izOabmSP8MkIrgs1WQkyTcoZc8m
         rzhpvmSPGBE1BmJ2lugGtg4sWEhV5mWKbf4uY/waPomxlHmtTtY8oVlXLX761Gp1l5d1
         dRmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUroE1KCQ5wKH4WOfRlZVFi8JLUkQSIuEGUjBABUZ3ijQ4wBw70hUgLM26UE5HFJ6mAuh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEWZxQiGln8vvtsKw9TIuyzMGJnOmL/WG8sYBChTNH5o/NvQp/
	t9Ixnw5rZywm85xMle3IDajhyYD0+i0/SgMij2CtlLD1LWPYvC4J
X-Gm-Gg: ASbGncv1bmk0qBjgqpLlZUGXftXYN9fJPdsIURLBEu544ZJWlTSWQhB9eEjBThWyZZY
	gOGtaxoHVUStfH7SYbsrS2Me7NSEiavbfzRu9MXmtvKN8+Y1aiVmhr41JpoYubf/J51YyrvpC/a
	jVpnKVfq4eYVxfidIWT843JYRs1kASVVqICxqF5kkUQafVRNqBvjOAhLp24KVAj1RTpQ+Usp4/E
	qMndk9mMqKp9w/j/zMJDYFnk4BTyyl/1qtb8aomTEIedbZdYY7xNjx7/Y3eGDs=
X-Google-Smtp-Source: AGHT+IHRWI7ciDiEU560CDl4hwoigQDwlqav9MEDJA2PtR7FPWVN5aMtjqTpiIgHPEe1PoP0+IF+Yg==
X-Received: by 2002:a05:6a00:1492:b0:71e:59d2:9c99 with SMTP id d2e1a72fcca58-7252ff9f26emr5723057b3a.4.1732734381744;
        Wed, 27 Nov 2024 11:06:21 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4986:34c:3f75:d990])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554fd6sm10550036b3a.139.2024.11.27.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:06:21 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux@armlinux.org.uk,
	s.hauer@pengutronix.de,
	linus.walleij@linaro.org,
	esben@geanix.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux@roeck-us.net,
	arnd@arndb.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Date: Wed, 27 Nov 2024 16:06:05 -0300
Message-Id: <20241127190605.1367157-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
the CONFIG_PINCTRL option is no longer implicitly selected, causing
several i.MX SoC pinctrl drivers no longer getting selected by default.

This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
i.MX SoCs.

Fix it by selecting CONFIG_PINCTRL as before.

This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
pinctrl"), but it is the less invasive fix for the boot regressions.

The attempt to build Layerscape without pinctrl can still be explored
later as suggested by Arnd:

"Overall, my best advice here is still to not change the way
i.MX pinctrl works at all, but just fix Layerscape to not depend
on i.MX. The reason for the 'select' here is clearly that the
i.MX machines would fail to boot without pinctrl, and changing
that because of Layerscape seems backwards."

Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.

 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index e4fe059cd861..dc47b2312127 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -6,6 +6,7 @@ menuconfig ARCH_MXC
 	select CLKSRC_IMX_GPT
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB
+	select PINCTRL
 	select PM_OPP if PM
 	select SOC_BUS
 	select SRAM
-- 
2.34.1

