Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9987D206F32
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397599; cv=none; b=gZdg4nIGfSEfqXJ8NBkekb6n97NX+eWZl7IKWGyF3SOkFmEeBxiy6kUHE5T4IESGgSD5KMV3xHRnxhZGa3j8E9MAZkCGnlKOj1r+NE3aoN5PodA1Th0Gjg494RpvJR0OwOO5ttpGYInGQB4r4cSQaQ7iSSA4thNlOCrmZkxSQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397599; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsUx1QHLjlXIwGGPz7qyDZgRTi2ECa6fS70VM7UpbFjp/8dZMIdDyqe44jilLqmc0Ty4V1E8XwFYxDfzIwKZIZguXG/Je18oy6169pEi+NKu4vU9mh8mmg2rtiH2HuYx/0pU5TxlZyS2ecT0SRGyil1rvoNw0UfXbgjqfdxnlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aBGl6GLP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aBGl6GLP"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de84e4005so981261e87.0
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397596; x=1734002396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=aBGl6GLPs6xGeEjQ0sRAQcwpqCvZuvlWMyFoWSLuIlvlBdI33k/FR8QL1FOKk8hDJf
         Up5FBqTrtJLtt3UKMhX267+49Vd31o1y5qPFmOZRJpfbw4SwX7IdpY+cl+ZIn6VH2CE4
         gU2OJYFkL/Zv1SbjXQX3Hp4syrkFTZ9XHQc+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397596; x=1734002396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=tpBPYxs+vhjwHwqn5cei4ALNZrGfZ/3Wna+nacrt0mYXR6YNFnuOnmVLHvYpPDaEoK
         +gOEt9xQr2mkzMzaXxvRTd+ICsnsXrDY7j8rF3ikkSiFD57Bg+igpYt9bvWq7YTDyh/X
         4pJAA5EAahKERiUYzlm7k3490sk/vOKxcJZb/Z8YfdMW4CopKDCpmfNSfhosuVDMn15h
         qbhFitHh0aBOATuGmPugGYmW/S9Q+cXFQfAVZL9RhL07BIiY3/g/zF1nr78AvV7YmPm1
         S3L0Iu8HmIY4ymReI2lL9aHWN26pY2KfIVZve/GDeUJMwCZbTiONc/zYXsH8u23KztrL
         bipg==
X-Forwarded-Encrypted: i=1; AJvYcCWmf7BGesWOlwDYduA6Mx+m1FsA46feNYw9AVOnuhb+ZicBPN/88wMZL5a/HqrEOZfLVVI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywst1kCINWbbNmPOvAlY0+LwcmMUbTNHPKIlKn0nKqKEBOKXlG3
	heCb1EUafVKUFeFj5W5UcFPXQr0/2JHxfCB+HybJwt86XrGrAEg/nggWoOeowsQ=
X-Gm-Gg: ASbGncvpTBrPGUyAIKTc2NeIwf7Vlro5Jr2BiotS2tBsvI3RYQkaWTG6QJi1gaz39v5
	N85M9iUjgYHGW6XnM5JOrcp4KfauS9jfYhs4ugrfvJu2tYTh1+GTwkuq5PjApPijxn97cQZq+Ua
	A0v33ammdyHbtSXnhNI2ER/1Poo8RLtXkV4Iz5Ixp4l6YW8BdjeaToGi9K897pYffv0HNS4c8No
	p4JPWpB2R2iRMhNbVEVH78w7oEc+yZJh0TiCg4SuuhWkP2kmIALqS1R0XICkdDDAKg/b1pqxvUq
	ZhpyDPgXMFzZNGjIMwM/shlWaq8zJp1ka7KoySdygVM8Wg==
X-Google-Smtp-Source: AGHT+IEtuduGBZsALDR63XXUfmp8mk6Ffl1qQAFy8dFjE8C6ALJJ5nV+WsPlwDq8/o6BI50yiETcjA==
X-Received: by 2002:a05:6512:3ba3:b0:53e:284a:70e9 with SMTP id 2adb3069b0e04-53e284a712dmr306591e87.57.1733397595775;
        Thu, 05 Dec 2024 03:19:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 09/20] arm64: dts: imx8mq: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:44 +0100
Message-ID: <20241205111939.1796244-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

