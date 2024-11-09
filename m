Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD413D899
	for <imx@lists.linux.dev>; Sat,  9 Nov 2024 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156284; cv=none; b=HAJ/nkJdEePwc0GCiqNfMWL7y15xLpc5qP+vgk5PxD6edsu8V1WQsZkMesa2L4+/+zy9raW0lLpFfuHq/XZ4Klao/epMM4aMCdPvyvphl62HddSLwd50mNHCCi7bBlSMZiKU3fBBTOJ1UaXkEwG6937wkKBO9ecrEmbk1KEgHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156284; c=relaxed/simple;
	bh=AViyC/+sdOhddIa9xjAO4k6SS339kVhh4BSc9RyXqEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MGKtUjIQe545oe68W7L8ee5qtyyat6sD5M/9kHu2cm1U/9ycTu/h36AfEtWU56UbRmfCKgQtKPbTAekuaAQk8Le4u7jFa0I5RvfgjsesSIEXjHG8AyAvVs6MyyQuYD7tIev3viKjCb7limONfWO7ZqWjKwqcJBe/LbiRjd71ANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDiTcuq2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDiTcuq2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so4381861a12.2
        for <imx@lists.linux.dev>; Sat, 09 Nov 2024 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156281; x=1731761081; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnvmniB3LeK8KeMuMSmkjZysB0f8NngS3V/dJUbHuv8=;
        b=XDiTcuq2DTS91+EF32z2GyitO68upJaLJRxfvIUIPFfc8GScfdjZh4q9j7nUma1Il5
         NAcDcShsTooify/NmryTkOXtiR2y6LEkJOMwjD/RAXQ6TgoWqXYhLJn3SjhcUfoQ2LqV
         HUmlNWHZMiwcs89XKzANtKnfOH33zgk/hRCVV8V5PCJj/z6ES6zHlj6icskS4cyoBpRb
         y0VyN/bJfX6/hMwYv8WEMcK70hju1qI2E5BHnqYd3a4IDHTgq1ne9bFH8wRZ8tvHr17Q
         1tPiUuNFtjsGs4MGzFSc7mzq+BVSlCVX6E2M2HjIHa53ZsYJk8rXSHCm6ndtriGCmUj7
         XRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156281; x=1731761081;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnvmniB3LeK8KeMuMSmkjZysB0f8NngS3V/dJUbHuv8=;
        b=LsTsyTBwf92Oz66jhjjRjSt20eMSdWH0eEIljiWBLq4/wqU/PT8+Vnn8gniMpxPjmX
         jX7Kkxi75T6z4DHutDADEEjEOv9exibvHIYXs0NuqfvHRy9tto7/3f1ZmDAPUSjDFGOo
         /xReNpk5hAQ6mhLrOzwxGwya4hQu5gjAiwLFN6fuTqwLoR2YyTaJCOcWtAzuppQdCGYY
         9yMWHEyUt93Uvebqxbs5Vs9t4OU8OgESY/eHphCpRAS4FtU0mOWaEGctYsEJYtcvBa8y
         bM1TQfXRhnIlMp54+saQZrK1RuRK4cGtf7VgJoS8/M+5tTlEQkCKf9TMD5V+AVjXvyHm
         5XKg==
X-Forwarded-Encrypted: i=1; AJvYcCWVe1Ub7a0XhUheieywLXkP6QUCbOTvhGTHlHdbnpGwwfAmb/iWPc2G8SuV/ZtMr+hKWME=@lists.linux.dev
X-Gm-Message-State: AOJu0YykQzHPH77qErll8hqKQkCiBlDCYPQf4pE0WXy0fiinu4tEN09e
	gdPia+ZvbA55NYUKaM6h2eejDCLK/r+BB+UAjgA/mu9G9deRt0wC
X-Google-Smtp-Source: AGHT+IEIGCuxXrmbH3JmjmIhypDxiqT7VZZMvZ/3txPu0Ud1UAxyBs1Rg9CLp2YCTFkbDWAYDWeRnw==
X-Received: by 2002:a05:6402:40ce:b0:5cf:1122:88bc with SMTP id 4fb4d7f45d1cf-5cf11228de0mr4137881a12.20.1731156280475;
        Sat, 09 Nov 2024 04:44:40 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:39 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 0/4] power: supply: max17042: cleanup and more features
Date: Sat, 09 Nov 2024 15:44:32 +0300
Message-Id: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBZL2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3SQT3dzECkNzAxMjXUtjA7O0ZHPTxLTEVCWgjoKi1LTMCrBp0bG
 1tQDfK1uyXQAAAA==
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=1826;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=AViyC/+sdOhddIa9xjAO4k6SS339kVhh4BSc9RyXqEo=;
 b=90pggLnOjDwy8XmUHTXmK3BpQlR4sHc6LVU9DiIpq7VL088R8yBC5A5aftKbu82FSxx1GYGTA
 X/vuKAzVUFHAIDmfWW6YeaEl/dP8pdBpT3O5BkRrjvSkaf7a3lu1vLO
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Maxim max17042 driver cleanup, and shared-irq feature.

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Dzmitry Sankouski (4):
      dt-bindings: power: supply: max17042: add share-irq node
      power: supply: max17042: implement dts shared-irq
      power: supply: max17042: use microvolts for voltage comparison
      power: supply: max17042: rename maxim,rsns-microohm property

 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 13 +++++++++----
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts                     |  2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi                     |  2 +-
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi                    |  2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts                |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  |  4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           |  4 ++--
 drivers/power/supply/max17042_battery.c                            |  9 +++------
 include/linux/power/max17042_battery.h                             |  1 +
 13 files changed, 32 insertions(+), 29 deletions(-)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

