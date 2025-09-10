Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7196322528
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512765; cv=none; b=nAfoJE0X2HjQkm+5GZAehVewy4Z9HKXteiPZfURfqKPyVDkKlx6i+dgtemFObgWBTmXlWVgHolE7seH6aKpwlLi4lRKyPsR7+Ic0QxD0aLPjSRuZY18MzY3dxMCkTQRfG5syaZ8MgLzW+RldVxC6N6wMSddTAQfaVsnExnsezSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512765; c=relaxed/simple;
	bh=6DM9dMZAtcwlDKvhQvsmdFJDn+355Evyd4COdeLDukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGEtNwCTRttRS7gpI8ZXCBsoNpTL0uHxFM/bwSO72+jWqyrlYveTH+1L/Ml4r7p37NmhgddaWVhwaZt1N02SbUnDYsdqE/g9a86cmiE1FwQC9HUh6ftAaPgREsMlItJbKiIVLathUMyvYoy8rrV1205M2buh3DeS38CG10q1Qco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=m+MSpzvJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="m+MSpzvJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b079c13240eso45147466b.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512762; x=1758117562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=m+MSpzvJQA/SDCQf2y9SK2upcbwzEJmrRbsGyOW24b6oEJguG0GDicWbYu8uMOFR2z
         1xfxrlsGf9rxyT3GQggEH95OB/J75ieJiWU4+4ClqRNJZFtrtuQTTPpDaf1plnrydym+
         dph6sbJKwn9YpLqTeUWbySvGOQFhikWmmtMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512762; x=1758117562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=t4VwEbJGD0J1vQ1MZZbGZzjWYLjNJfH3iqfSsAjkmOuFaSmfzAdsoQnr4X+DR4EcUd
         gaoyaEm7r8jRUsrN7UaDBpHcrXEpmlBKRg9rMqNIZD9ooC1+uzPu1TdMmCH3gur/Q5H5
         kLIoqUMBo1YGvSlPwqPI8Yorv8HhqZwQpikf8cKirbFR/IRgYIMPAqkGLGn/qPWLM4k3
         +NAg7jnJstID6DoY7ApLlyEUgSwoIxT80p+HPQFaCOMe5kyYkkO0Nz1SgrZF44yS6xaM
         E50JtypJlor5F0Q/U4J8rURDqzNKmPbcsq6rNoe0B166pTNJZQj/G8LPlsL0q0rGs7L4
         s0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWjKzzgMMk7yoAzyNa7eB1+hZoxx1IwETM/1jPYW4agGyInx1NbauYS1cJJ78wBbc7M6o8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9+ilzKehGmGVR7my2WFvwJf3N/IKUYgQ6EiUaqfmN7hoDquvv
	w7AWlGlQvwWjSr9rhKif8sKcXaYnZ2Irj/quBFlYwouLGou75W2bdEw4YoRARrqx5iY=
X-Gm-Gg: ASbGnctR056r/x1/Fy/p9GcSGtliRinfFWMdLPMnmWv43jbJ/HYK684jQMyi3G0qsvP
	Vt3JvdEytZLxfojg3292K85gTnTmfVZDdU4dSp7xCZ2NFM+Mv8sMKAL6/3G05qbIDKW0cfNZ76N
	u/lYOnMCoK697HNU6658g4r+tzCJ1PI11bhImPU1gon5qEBqcLxyYf6avgL4xEel2wKy6Lxx1N4
	HhPoXYAXh4pSfIiupm2ZCpO9TfaEBRLk2IrevaNrv3vQB3xByDIhUpzHCcpqpc1WRf03BQJOoW0
	guI0UDGZtNlWM2ziwK09iZUJC9kpAlmB+ZpVct1+ag/J6p4LxZd/7jWR9sqzZj0qAiiJ73SKLmz
	9gxUIsI1egYS6siFBVu/BpJy/cAZ+4+jiKEEaz51O3LzUzDclR9uTfl/E7QzzqMtWYmpawPQb9B
	w58D75T+fKJ9FEYTcdWVQz8jsYQ0rBP+uDt9wz6sbDRHOOMptN98AptbUHwHpM68zE
X-Google-Smtp-Source: AGHT+IEwFKbwXQOp9vR5RWBfca+LwdgNqWC2NlCsLiPo9Z3IGD4hXe/SLsqdKeNLsPpGK5bn7AW6lQ==
X-Received: by 2002:a17:907:d91:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b04b167b9f2mr1190384166b.47.1757512761817;
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Wed, 10 Sep 2025 15:58:36 +0200
Message-ID: <20250910135916.3939502-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0

