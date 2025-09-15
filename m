Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C028CF6A
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966040; cv=none; b=istVoxT7hbkWM9LDGiiKH/1y//WDJFHhnMEalEBGRYl5vvpEDue4G7blzlYN5yM6bzmi+YL4jVLX8W2NuXuK7GPPTaa2RwA4M57Z4fQV+V2h2ydZTeGB4G/vmmPf4CGSa2mA/XO/7KbY2Ze0PaYLMQv+P1ExhNwO1fAh8ydBkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966040; c=relaxed/simple;
	bh=jH9/bubhcWhRpYTPmVEynThTP5AYOEziuVsPlmZV1kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtnzjcfUpuR4FJaLXyIx4oZ6HTGsdWHmRIaQ2AUqtKucmRRBXgxmdHfosO9EKaoSRcazhHZWFGH6gZEQLoR8MATYvfXod8+KV4UhCYZ6ee1cNkcQKqDNNkNxXQuJ/TskLSbrc1Fl4+BgmD1mfuEoCN9sjKdHjVq0MWcS/H2UeLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aNZYbuTw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aNZYbuTw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so41156615e9.0
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966037; x=1758570837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYpBInbhYba1I5IFzkBXif3pXoZfr9uL09LB08J1+iU=;
        b=aNZYbuTwd7p3EQl29bp++lclnFXRSRRxn9nb9pgNsOyAZ//05NFOoUPET5ACO2OYzD
         gLACkn5bWfuYawINspBKf6Yhu+XfhkNmLpFna15L++8KLnxj6DAouYkh7kWFYxCNZl0Q
         k7EbwfkbwHhcXK8M3M4duChCQWGDAlbCh950w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966037; x=1758570837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYpBInbhYba1I5IFzkBXif3pXoZfr9uL09LB08J1+iU=;
        b=SQczxoWJOytsqa22vRA9L8XHbm1ioTbRsbof8CFVRbc1Pva+G/oou0VGuy3gVAlt4H
         p9iBxB9/G85jhm7Sh7BIs7WL67H+5m9jEjG+gDkvDpY1ss/WOvaNSjxS8jvvKcVYbE45
         Sqp73Mj0eHdirqtIMm5KqXNKuiLyVt1f9e49mTDc3L4CGq5RjUSj8uGnGsu/1toslRUM
         nRfX0UltHMmDaBxPpi5jnbLV+8eoEP1twiPnQ1AcrMm0tE8hRXrRd0p6LO2wlXWQKwTR
         /BCWbXZuheKgd/sJ2uiYlY9pSeOb8AaouBVlVKTqxnbuRHlVinjpG/Yx5gQQplsY55ag
         lbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVbJeggbqf9uQKzTeY67OjSa0ilyrJwMSEe8/TDuZDfA8UDI2IOG4UmzRK4Vl9KQY7+0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKWajao8uINzHHlBn6CjP2jzLMxRbkKgqEn58jxA3Hdj1HK8VZ
	RvNPUWF6/sO6ZRH1xXtKB/PF3ekAFsSHlr1ruIkgYvTS5ra5LosYO72TwTAFb/QaGMw=
X-Gm-Gg: ASbGnct9YW8zNArqSyl0LB2ZTqSamOGiOWF1ndGhvQ5S0iBqSkCtGyzR2pN0LwCRfzI
	efn+SLfFkdLRhx7QFeEo+4MfpzxJcU62TMYoWiqnlA+gjHUf+mHhfxC+/DQV7K+nlQBQplQgQ1v
	wueOeZkg3qTfaVhdsmT0HYaym0rO+CMZZSAM0FO3FQCv9NALN+nybLcqrXfFOdvRQ5adWOl1Vfb
	+emoWZid5cSEEk+qWb6NKp9hkOr8fFMg8PhpACQJL3e0VnHPdWUXy+5rKcgLZkjqZn8fzSMd7QX
	ffYJV9V++4lj+jMYS5zgitqwSOKP/suAbbMHLo8Q5m1zDf8gLPtoLd4YCXIpmyjL8mKIjg3z7cA
	F2RUKzbsOQsp2pQv1NkwgbOS9P47/ASM7UnK/cuescV/DdSTuJTuxYrER/Z++nik=
X-Google-Smtp-Source: AGHT+IGia0IZ0pDiz5Yw5I2pPYwxxrez1ql7kM6HUI8y8toQ7q5lIloMT59fhRpk+Z7OXMtwBgr0pQ==
X-Received: by 2002:a05:600c:c8d:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45f24060698mr116466355e9.6.1757966036748;
        Mon, 15 Sep 2025 12:53:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Mon, 15 Sep 2025 21:53:06 +0200
Message-ID: <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the touchscreen-glitch-threshold-ns property. Unlike the
generic description in touchscreen.yaml, this controller maps the
provided value to one of four discrete thresholds internally.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..6214d8be5a99 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,18 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Unlike the generic property defined in touchscreen.yaml, this
+      controller does not allow arbitrary values. Internally the value is
+      converted to IPG clock cycles and mapped to one of four discrete
+      thresholds exposed by the TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0

