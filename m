Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBEE32ED27
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352393; cv=none; b=qBLhthgZabEJEpPHGYeFA+AQd49MNSTXg1nVDgqAeKaTVamkfhMtiLkAhPAV7NXyURwFPUO3rq3shdGcgehEBoV0fsLFHrjye/ttOYBXi1G4aN9ZDiCg7mkGFagXePrkDUgjF+2DpibQhE/dbpFSexBMUk2stp+/AAYkqmZ1SJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352393; c=relaxed/simple;
	bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnM3vzrjWKv+Cc6YPzSb68ljOelRo0Zym6KxT+S6MAlMo7PHtBlHDxDxrrmi2geuy6vShUaWMv5ls+4GRFPJXE6key7rkK94m1h554jvp40sAo0ZfRVvYKSaXN7xaCdwrRVhg8ED4y46mmrHQN5lBpdKgDbilOAx939JpXPV1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfdJbame; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfdJbame"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-359866a1d02so291027a91.0
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352392; x=1772957192; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=kfdJbameUfqfOjMPhygU9OusuYpuBtB5WKcOIWLeeBmD88cOEUAXvbcVgoPyvsC8mm
         0XIkpPsqZxs3eu5lwxo3ZEYekP0NdRhGX6WAYYwcNRzEf+fDNrSHAJrXNBQxGzw+YyYF
         wyHmigjw5H92E2jgBZg8YhrqliRGSCkf8qz6LvaV4npkiuTiRfsHF54+4ERqxDk63XWE
         XcmD61UlhljF3IbTBBgn/dKSPeEvsL+NUj/yYH2vBv7jYrOHsUCbQlvhw3r9XADFpU3A
         5f9niHi/gixnvcNtvqBQtY2IbxlKHlm4L6PX0E0x8aGUBOda9qum4lX7/CV24npPc0Q2
         8Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352392; x=1772957192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=TP53VvmIU/qp9Tpu/8oTlf1Hlh+BL3MU2GaC/q/AVna3t+RhCCCTsh4gPxj/+vaB7A
         U70zbC58XCpOexDnl0IzT0gSsgbgF5HTDQzeVLayGNZjbLPfHsXvG4tSkDOstD6sWLlN
         yznSqN3o1FYBPs4I0whZojxkTR4V2lXG6z5fi3IRxzvKnpUG6HpwPe5nYZorO9fBhYMX
         7sTlxrYdN0wCYmRIqmX49FRlnCdgeQ6gCtC52BEVSTJX0/WAZtgFfCUzvO+HUBLJ7McR
         yo0yK8JsWgaJwS18kp0RdzvJ8G6evyiPVX5yOCGhZjNk7OJmbZUewfNagcXWkTklVrgO
         HvGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs8tEoDH5ZIOiLipyjyU2Ryu2JupG46+6fHC8IH3LJGdznae9wemDJivSubqYzC83gb2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzpQqyfYntvM8BJQ+hXRxgVJWfz4h3q3QX/BHOe99NHP787GBK
	jDCoiGkyUgGf3voPsHrhKsS7JXpQmX1rokCpHJebZioiQgM7LVjUesAZ
X-Gm-Gg: ATEYQzwu+1qvmTHEbHpZSMdeKdRnDVYRuiEeDa8gHkAfgSImh7LQozIH6TYMsjDK2ow
	8RbD19O7Nueydyy4Mprz6HC7fvtDcjtwLo6Z8Jxt/eoFHeZri5EfgjqHFFFYjaQuIRWTGVaKTKM
	AhYXEcoJt6rNHNsXUbzFn8J5BYY8GluDCUzx8Zf0vQtwMfJ43GFNz8XtagffqBqo+6oGkukvKbX
	+omFABkKsv3VLwP8JsSutTfsU2pjsUsNohfPNOXLPIHVopgyu3f3+IJ1kMivoqPQTDIFCTXUoHj
	ko1jYT7FFP33yU0S7/LEs7n61l6HmhOwSodXmbTIqb+JNoh0UrF4KXHBNEfTyI3stTefFRIAzOm
	rwPPEY0xFH2oU6sozA3NZNidEcteqkkoog5Exg3UQbGOCaSpqj2PbBJVU3fR4lyyJRfCd5JP1FW
	4/m7Bp1b6NtQthRy7mLQBd7f4Gq6sFOc58uB5SBGcUiAKtuXM+bZv9LMMKzc9ln+Dhv5TrJVlxq
	8FsrstBHvRzCWLCJeEzxyrALahsGYGSc+GKooQ4B+yaEUF5mzi760sa++M+hWcnp1RKmcJpnQ+o
X-Received: by 2002:a17:90b:578e:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35965cccb83mr6714723a91.19.1772352392000;
        Sun, 01 Mar 2026 00:06:32 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:31 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:22 +1000
Subject: [PATCH v3 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fH1CYvWfDi6+VdS/ptHsxy/zZ9/q/rWu7bdB9du
 c1wrz6BrWMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV96cxMvRPZA5hNnB6kNker/euf6nWnZJG5XMz9l95IXBFaqHH4QUM/13ivlz
 XP+vO+XRlp0D1vO8fDn37U1wXWD5Z6kr+pOTQSCYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add properties to describe TDM slot idle behaviour. These properties can
be used to describe how a DAI is supposed to behave when not active.

For example, Apple Silicon laptops split a single I2S bus between two
physical lines which are combined at an OR gate in front of the
receiving port. One codec on each line is expected to transmit zeroes
during the active TDM slots of the opposite line, or we will have corrupted
data at the receiver.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index ca71e3660f62..457a899e8872 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,6 +20,20 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property.
+
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -30,4 +44,9 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
+  '^dai-tdm-slot-[rt]x-idle-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Idle slot mask. Optional. A bit being set to 1 indicates
+      that the corresponding TDM slot is inactive/idle.
+
 additionalProperties: true

-- 
2.53.0

