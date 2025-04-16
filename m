Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206920FAB4
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765324; cv=none; b=h8y6xp0dPp3UqxNwyrf9BjrnQB9bCb2WVP7336rh25sfpq2CuNgK5hlcWH9Vr7OR9zXfnopkJwTMoNWw4SiCPd66W+XIu7szEmPfBRm9j119D6rIPDhgClMOHrjhQzz8nPI7/+ZX6aZd2OAQ1ne+0qcCl2PsVeDbH+9cIp+4bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765324; c=relaxed/simple;
	bh=wrNk5hl91Nx0/hhcEKOiV1QTtEVWIAnPCPdBZO1w5UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiOEpk5hN0SlbW7O8jNy18U+WxzbbEfjqeJkjQli6YOjAHNW8/0TJfnMBdf0DyGFmlhNmsTYoQh2XvyPbGgChIRCMiViabjnQ5yZxFIIjCk69tNsznRjiL06sVfEt8ElcofV69YyTjA6SfkxHYKpYXRYuyUcOwP8Ce6rYxfFP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTIt6HfY; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTIt6HfY"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476964b2c1dso100890651cf.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765321; x=1745370121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=aTIt6HfYjF07zwPLKWyDWda5+DgyywzaQHRHH4P9b7NlmkDt7MpSlh6P+9Io+jE7N/
         AFDeLdJAWRFFsg0NEy1BkAGjC6YUZ9DBxKhgajOpXKyKGJMmYrgqEFDE0X6WRG5SG/3q
         8Fs965VQX+UETOt9/RBnsNut7txhZ4kSD4X5Kc0xWIOjUI4ZR07GwH/dLqZjPxZ7f99k
         mxGgYo7RDnKhuPdAXGJx8hr7Js4TJorXY87l4v0GmLtDnGJSTuXSbmxiukEUQ209qT9V
         wJ4hM1Pw4Ikf8fVY/0UrgrPJvpha+LJaMFJoJ4trGuM97KedEwH386Yf/UGi3T29b3gI
         m1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765321; x=1745370121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INCYZW3hzgKSK4AliiojJjATw3Q2KBub6aarsjSNZ2g=;
        b=nZbDnzmBGKBipj6vG9Ji3CjEa8pB0QCpghjcJKzGB22xKulzMr0DjNyiEaxg3YIS2M
         FB7iqrVaYe3ZP/lmkoCjoHIdpzj1zJ6ULjud5QHjCUkfp+SDKE39b//MXtKjMDFtOuXO
         bpYHh3kd66UxoWlsdooLI2wbXUqy1yQ7+qP0R2RZFZE8AtBnqyQZOVzZov4B35pQYp5N
         8KomOyMjZnnjB9GZoj87yv6eKu4ASSoHsHDmnkOdStDDwEX56LT7oB8HAqB1B6Kd3W5A
         make125/2NZ3zcYfeEi4eEWM6wG58hVcHFp/vuzRT7t6qk6Wx5oNnmEjyVcXAehZWygq
         jsDw==
X-Forwarded-Encrypted: i=1; AJvYcCUkg3Anvcmgg9ah0p2MC6nB8O/i9U7HXnZq+TIfGgJEer50vh+kSQlxefqB6biL9YyIPj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFKRLLHQcubJgS9M8UB0EOZ9ZVPRRNwVg2Grp5LH6a3Juc2EF7
	lVyu5VFbYp4AqKXwMAIUIktXOKgyysZ06jokFeGI+Z/yakhPp5jr
X-Gm-Gg: ASbGnctuQkq7OUbZNQLfck7EhrOCZ+uckKO/gmS46QDnwBgN6Ts/NB67x+kZBTdeSC2
	JYmYFyI7vQvnqPWD8TQL8tQuiS0/GaCcmNztBz1oFFVLlk7XYLBqDHIu1wu1mrUvLHNJs+b9qT9
	kaHkVLWOovS6NzYaEtzKpyB+LtCnAzPXhFjZ+SLINMNJRmpyYBfGIeVJkosK18qxfcpe3eg4jIL
	d/m2zPe8T2pvEABqWmd1PDsuxhPH4bisgKVWdLdiItt08wxagygyX5wLSiWfQZaXN2zU2lQ0uQH
	lwzJ3XNDGMuU7W5gr+I+AVDj8eWasTaVcptrOjVEa11oBeAAuJqdnDzvjTW5mbC1p2TllsvpIr5
	J29tSQjDsWUq8ykQ=
X-Google-Smtp-Source: AGHT+IGxhkCmvbvhdNDyJBr3gKgLsE1Y/iVTIpUOgdp7ylffmNMMo/b6PF6ouKPTqYWmOf1JNxqzBQ==
X-Received: by 2002:a05:622a:24b:b0:476:bb72:f429 with SMTP id d75a77b69052e-47ad3ac0f4fmr21814201cf.42.1744765321404;
        Tue, 15 Apr 2025 18:02:01 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 08/10] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:34 -0500
Message-ID: <20250416010141.1785841-8-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. Re-order node

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..c7a8f2a6fe90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -236,7 +236,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

