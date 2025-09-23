Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DADA25B2FA
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638280; cv=none; b=O9k8G52ewPt6aPaEiHDzA9FpjiHeyOKKPwskXXonZQj9pNMD6PyYXpheJgfLcXq2GeAmAyYqL4uBe5C6xzgdXpWn8xWdXX8C28zfUtprqLjhf2enOqpEbUXW3yfp5gzZkpCwAKavh7+TiOQj3VpSqJixjGT82mQfM4GW+oEXQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638280; c=relaxed/simple;
	bh=IAi/8O8/rULM+WO/P3gj9Rt/deukKZIeTgVaOnY7B+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0hkIOID/aRcBAG9ELKGPfQHpQnCkkR/5UhgSHdXfRsDXToFQCUq1PDKriO5fLEMGOIRgbE0zS6vgQn5oUzXAgo8BC1ayTi4XrM36Z0i6xX0qmZkIW0vdR1kSfgsyrjr7EthEFxr2eFnFOIwNdf82rmOk+yvS0jqhwnPOMsax5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iQEf5Ueg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iQEf5Ueg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e168f0a75so307482466b.0
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638276; x=1759243076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=iQEf5UegMB+uUSg5cNWiONaSWn2qSneJtc8R1ijMzpzrEMLXqjGAzU/UTtKJnbaVdd
         vevkBaoLCCr3GitfHmhd6rClTZ8uW3YooD/SQclzWAfsh7OQQlUpl2zPxL9nK34olHGw
         +cAnp6RhxbVGlWTtiFqRiYnL8CTt00sjcbbm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638276; x=1759243076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=SPC3+F+XqxwLNolO+JeEwNFNhaSkA+8GkGZLnxmBRhHmGWzazkR8xZqypUYEewHExm
         53QPTG+3sTIaq1FIESHk4xL5eV8X0qqzzia0NA9lFB+SMSougnNAGKEDsQPbxhis0Mil
         cdObUq4FpVmNokS6Yk1xbtNc18XgKF72kfHkGA+A1zlcxE2Gjp3km8g0QIbstLT3m70t
         OF+q+5rZV5tL6JdBAY89iPgBIUo//ahNas5XwSyNyz2p00ikPPeW2nstLu5O3k0Z8iCM
         BLPR7uB1igBpxTTew8othDFrBK32lk8uHvfwzFwe/FYJnzjwQK2V/MaCtoP46GOBccOT
         HkNg==
X-Forwarded-Encrypted: i=1; AJvYcCUpKaX+OFt74TJI0rv/PIbUUaqGbNM/3kS+I5H5+zoGHAyxaj6ci8cmTbFQ3oiJfifEAEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEGEtZzrEuspCRMwm2rlLv0bbBBy2wMuCDp1oYwd1irLCElN3U
	n/RS09Xhj6MoBhxrmppJDCwXbltqLH2alvp18HBnfPH2TWpDwlg+K4Y0Ii0suEM1OJA=
X-Gm-Gg: ASbGncunJlFr38q2KzhLTZwwbl7cHvbcnL/FEPKoCU0DSwMmvFntLmZWcakMVDryOqE
	bt9slroVqKVgwu0mByAjFoobIzyA7qONItQiY5qovw6rCiR9lisl5TQ5I9lf73AmqjncyfV21Dk
	LctLH69IcmuY9SjzQh5d5Zr4jAIdKNaFi8CHTukaZTUQQUp5JqO4Aj8II775POM7X9glNQKpiu3
	coNYXBCiUdSmEECJNv4+elEVo1VFZXiq8d4XdWpv8qR8i3Lcoe+WA50GtLQh5Xr5cYSej5pW+uR
	rBpNdD+6XHJ+So+RAc0MHWlx8vVukBQmDyVGH0mTKuOerghvw2IcAAytDM+40z7cWWJX+FpHmH9
	p3FaCcNdlPAGgUk4dPLkTU1lIgZ/zog8+3/6++3EpuzhNRZQI0l0fMP1uV5p13lhsagI5jTn2rJ
	jkBamt3o4RV2wHzoGJu007PL1mfitfuGEulJ41fpwf3IKE017DYXZh0i3i20WR3jWi
X-Google-Smtp-Source: AGHT+IGDPnG7HtZZOzHzDzOnTvQCbphPIOssxaWdLijuYXdOKqbHAb1gXG6TbG+I7cy+yOigXJi2Ww==
X-Received: by 2002:a17:906:f58a:b0:b2a:dc08:5914 with SMTP id a640c23a62f3a-b302ad3922bmr273199066b.45.1758638275808;
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Tue, 23 Sep 2025 16:37:35 +0200
Message-ID: <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the debounce-delay-us property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Rename the property to debounce-delay-us.
- Update the commit message

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..a99280aefcbe 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  debounce-delay-us:
+    description: |
+      Minimum duration in microseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
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

