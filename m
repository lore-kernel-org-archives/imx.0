Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798C621FF46
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211120; cv=none; b=pZ84Ptlq7e9ukVWscBc8F4MOXaT924HWYn5LLvHDEN3kynD4inaDwKPHna3xQLHxsSxm3BfQkRgOycggdES8Jhc1WPJL7EZw8dmfKp6+PaVaf3F2KU/BJCghAEnWYCE4T8nY/UZq88/i6smTcfN0jh4Ez0oeCPTyAXa7vp2lFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211120; c=relaxed/simple;
	bh=yCkiAdtOCF9iCkdkXTKRzrhbw0DYQlsHaTH+AYSbQek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uO7SvbEi5RtmiBFH5uLOUYhkwNFmbcG8z82jBAg1ys9tGqP9DatuCRvhFCX0hoiljnzDWvBOaHW/tNq03uYyRZhu/HDVph/9S/ebh2w1UpV6aXK2DAInWl83+0PCx/tj8gEB2xwlmgOqsZ9B7Wn3WEUedCXazZWI6VoHMox0zkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dhqY/iw4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dhqY/iw4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so47786545e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211116; x=1747815916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=dhqY/iw4HfIupOCRZ3hDhvo+mag1bvCqQZb9sx2/xb/QsY22ntqbrfJAz2/dNTJkLf
         Cntbd+PNgRP4g0IsHhhoulJiOBJ8klaMk/Ij5uzb2RR8pP8z7J8a6p7bSHvR/JFlqht4
         UH7GFZn7Yv+vsPzZE7fKXvD6O5+NBPkB7CT4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211116; x=1747815916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=V/3Y3Wbm2cJ+W8UsfqVJdAE1yhdlCTq8Z9iLuxSQ0ha2NGCtAdCJ+tgghtxV/M5upn
         EJns1F1T99b/4UU/vk0eFAiwOeXgQzalt/J8tj3NNM7tjH8uqWUCR3s43H90eQGUdEAb
         dxQfTdEEZbfNEgk6BxQe8ieKTsK/vlh9bcDzFkXixKLYnD91uvKVsMtgKZGqzBR04+OZ
         ZsGFPDh7ILMbr3AGdDfAxsWBw1xX3sOq5S23bAoMX5pmaRDb70JB5jfZz9VP9KNZkCfI
         1sokyG4k/RBL38AFdDtfvrvgZLI5i4eI7mq69YorScWYyYWOg4fEKZsg1pZKpSAsWFrO
         tLQw==
X-Forwarded-Encrypted: i=1; AJvYcCUeTtSoU5HWDQOfn9YJcwOxFFrX7tk+AI8x+9tygbZH8cHfcIAukoCkIXWWvKe++3pUcvM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMBQUCsIKsR45MTi61yTcJOnHk3WMAGEXvJ1LDrjtUnnG3jFF
	vyha31EUHnxVkHDfyxqWaef0elEusf3dJw1kZQwZ+5CPDOE9Rt7SdY/ZzkvJQs0=
X-Gm-Gg: ASbGncttN2lb0mI3S/cf9+4tWaEI2/sksV/dYyIA+qLGp2yehm9FrcYvlrBK24ouM3D
	Q5DruxJfMaLYO4qAdpMON3rvpw5bu84k7SKEICdQYoHmNX6BT4h9hT8zl576JNKchCRiAV70bvn
	rgZi185dejYsZ28GcCBjNIUxKRIDwZ2uI2b+Op2JN8C1UBelZqkaid4fuSHUiPX8G1gbW4uMVPv
	EyZqBvV+ba4smDpjRZB6Ya3U/03GcGnWWMdQeaK3aW8fmMWqrPY8kE0JGPj7vCAJnAY5V4tNeMx
	Q9xQvYLPrB6BMXaLBGibEDQBfRCpwRQMQGcrhkC6eA+dr9ON2lu0dWoJ60Fs2XzUQMQl+v85fty
	Vn6yQSpOEVWpr3zHa9QDOpeFzPdGCvJhh1g2Hl/4kEYY=
X-Google-Smtp-Source: AGHT+IFtHHcd+lejXopr8LfFGaQVmOfL/UNHCcWzihISzr8hDJtjbOrZphMkMM72/aDayUzTnZnf0A==
X-Received: by 2002:a05:600c:609a:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442f1dd31f4mr24755195e9.0.1747211115603;
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH 3/9] arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend
Date: Wed, 14 May 2025 10:24:57 +0200
Message-ID: <20250514082507.1983849-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Allow the wifi to be enabled during suspend. Use case is needed in most
of the devices deployed in the field

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 0d343ffdb7f9..a983072fb835 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -277,6 +277,8 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	keep-power-in-suspend;
+
 	status = "okay";
 
 	brcmf: bcrmf@1 {
-- 
2.43.0

