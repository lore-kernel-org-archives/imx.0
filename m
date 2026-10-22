Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=r2KMqoZ4tTh52QzBllFuk/GqLWzr7o6102PDLEFAe7xXO0+jDrG7zeZjpskSj3BCDe9s
	 a41WZ74hYoQilgJte8UZYiYkxuVgTWrv4gMDOYmJS7mmqEepRpos/kSKXPmb5wVWC7lIz
	 Bb2iXiqVf4ztl20lCHicoW/yPlXs4YA3fP5ejoeZ4g7p83XmfK7LO3GMwswVheXJqq14X
	 DebuLxr9YnlK1AhwPleUic5it24omkJgiolHRoadJqZrCi2QqtZji3qFIn2RTxv9Clo/A
	 W5OZoSH6agfXBLkMJFmXu+9hRUJNnFmXAsKi4gVtfTzTvVY25/LTzVZwKqs4L4R9HzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=HKC2fj9zVgpaGw4iTK1iVUOTaiiKqNcP5pryYD6IIROXWE0nQi9MyBgE6h3G3ag9YCEh
	 5Zl8+5Z/IPkAbxtK4dBGiBkleTOPa5YJTF1+lrLs7A7j2+RjCyBo2WK1shIwhfBvNJA3H
	 DKjUtBxTnb5q79JmCis5+uYj0NL9/nGVNXzoIkIzB/aF8cRizRFf6OyskHN0wXN9dZKDZ
	 Uj+6guQm9OvE5CK3ktMHPjz5wtvfugkNLpYbF+vikgMHrzvainfyEnC/FT2cg51hnUmNC
	 94y+qq40otNk1U/eOyf5LRCF+1nBfOVuQSyfMalIYyVmoblYxCWd30OszYHB1lHRVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=mYh0ZZur;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A146D606A31F
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A146D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=mYh0ZZur
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1756261f8f.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=mYh0ZZur3fmGaOrsA4pi+D2yHIa7LrRmo3DSthCyeAsVT5Qx1m5mtPXCZu1Qq5FJOy
         Ght+ave8tWyQ0SZAuQQXkvHE2/mf26nmP/RXR4c+0lz/itBpEtnFSZ0X80X4kpPhmFEN
         euirMF7t9FQhtApFuBmXgIxmjF2HaDxr+2z20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=izhOAelU71C8lemXS+nRODy7t9fJkq9IItjLg7SrRZJzsd8D7PNjVKCM2BrKKgILZ4
         NDeg48RzsCLfsZS365LRHMHMpFyEbVItYcwx/CO9DhewtaOQWN1s9zZv64xDg4BOB1ej
         tr7fApl2zuwjrtfRkKanX8JUpXUMKZ8x6T+qwGQJu187Kp1n4Q4l6bVyjJgKiPgCNVzJ
         zGQximd12rwPhItS7xmMOWZp/4PeCJzOiGQBul31gZ8vKU2smZI17oHJezIVPQltc8XV
         GWdhFB2jmBKYSjj8cgUHpwYSjDsf5QzgbWXR/ExaKbP29p1dbUcDmz6i2wXcMMgibXgz
         XHjA==
X-Forwarded-Encrypted: i=1; AKwUvBzJNcWxfdI6WG2kWjPOcVtOfzu1txdF3f6ta7uq81TT0n++NGDV4OYN91h0LUudZTqCCoc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIiutAGpuXek6wy3aZiBWsX5rhx7MI6qJRBbQklYoXZ8gnqsy5I
	jFFqYoQTJDMEZkTpfXhjnkBQT7V4dSw8BNnw814n9D0ljtWVQ/IdvOOvAcwzZdlOnfo=
X-Gm-Gg: AYBFou1cSvMlEIbl6EYdlQT/hMgs1z/KhG7f15N4VRea7jUTkNYyAe+1gfZj5+m5K1g
	aKMefJxKvgs8wGRoPP5rmsKO+PUVAt3+SnYaScNW3aG+zy5MisR0o3Yh1+pmrTr0EtRoLqx4XJv
	hf5/90vMqBld4+kCWSnIpYUvPWvHgQKJxOscZKRJJOJPvUlTJOrfUE2O1esumO9zOPVrBDrL+vA
	YuH0PiMtmr6VNgESmIbwx+BC/bb+N16wWDDTCZo1gvLy65GSTCPgaRGB9WplLNgUhbQ5Jo1bogj
	kDtD7Bg2HcEbgKWN2ATM4Zz/6jpRxL12gquDwVdSGMhGcn8IsWC9wrktHPj5UE0eI9gk/EuOsFs
	uMWgX/srbrltPkecWbr450D1WYH3z/L19nFWr2EgV85htkmI3opdj6gz/axVq9SyszfqEIcqM9s
	zy38uYpUvZnLp5ppxtx/iJA4YA74X+KEw8jhdjlRftN0Hl7oYwG3+Fzjxa/nnBbIt1LME1FEFzb
	ORmKOVulOYy563tNGjtAS5BdOaDw+9IqrzIiaWtXY/nSHzB5Yot1/jA4nxcuCSicwoSCJaa
X-Received: by 2002:a05:6000:2612:b0:48e:7fb:aed3 with SMTP id ffacd0b85a97d-48e264a5a5bmr11406983f8f.17.1792677776798;
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Thu, 22 Oct 2026 17:02:41 +0300
Message-ID: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

