Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E532ED39
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352377; cv=none; b=oZ+3E3jwI+uUqGwPOuyS+YeL3FW4a4/pH/X1B6hYQtwex4vmeqnj6bpfTWoX0Ib9Pwy2LId1NKkjelE5D43oOBl/yXWbwERXoM1EmyxMgkv5XsaA58yJd3Wob8hU4E//9/E4cUEHIfhyfFdd1xg9LMr+9c7fO86heg7XjN+GI6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352377; c=relaxed/simple;
	bh=HNjAg2xdRxewqWz3EXUwC/PrDpEvfT/uT/eZPObjn+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5RqjQwDh/g/3nUfUBdtX9lF3bBn5c2cPAw1h8syh2WRWY26KfC0pnLIe8D2ip3TqU5k5g6solh24/oxbMkbU0RmJ4Lkz2Zx8a2Fng1FUjMdvTw4L8759VHGSQra+OL4NRIyEY5ERCehBGn8E6shnOJMKLyzCT+ZpVY0LjcAip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOvUVsA3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOvUVsA3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3562e858da5so1466999a91.2
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352376; x=1772957176; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=YOvUVsA3hwqrQmXMljvBGA0tC/1KEB2JW+NwZDwQpedItHRDAwVRWm1l7dCjj6cgpW
         qY4fY6OJ9UWz6cfGKoR3JsvNw3Klk6xP9T5719nQAyKQnEahATOty6N3BujWwsZ6BQNl
         hIIur7eiGuBOnXZMv9OizLRskLhMzsErfwYsqidQZzzyBpuopVGcK6aihs/Oyj/PWqRQ
         VpztjaXsmSTtG+ASiWUw1tZgqHKhtJ9CzHkImrlwVBi7H1QkZbqTw41up/EQ/tYHveHF
         toive5d/VMagn4I8ACDFBsR8j055NQKUw+PRcmkLptn75BZ5Dv4DnxklbQay5asZgqPr
         2Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352376; x=1772957176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=Axg2cpnscAagR35Jw9Ha1xZnGMJKSKlIBWjOnB/2HxCwQVtz4yg1kwGuHBE5J1HOJX
         kqVMu2vHmBpM4DDdxk9z0KbWN7mMSWluDf9aXFafc6ZgITldPojwbimNB35FsIuKzm5G
         0Rit0e4KnArQrF1uaHa4iUCk/+byqAPPRcNCgi9ylRsSgVHf/yYG7x1Rkacv8eHR6xAn
         GagPZ6Z4aYvCTzaQH2XgK0pMjwBmCipA8fwr6aLrzYnn9B3F8Wi0zh4KWBtppqpR69VN
         B2FKCNbXhuDg8LLEdp0E21CDh1BEEvOVxMpUB7hZ3a7Saz0S9Ce1L2GAN08YetKH+tAk
         hojg==
X-Forwarded-Encrypted: i=1; AJvYcCWokqgUtX4lPSsvETOhdQzqYXkdank9ndPSLIs5kZ+ckFUNAeKtaV+FuqcyYdYrbnWPsSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcW/gCnYgdkbjFjKywWMKv2r6dQR9h45CfSspdWYR3HZwdfgLl
	q5ZT9eJ+gbH+QJWO1R+GqrUY4xQUclz+dPgQDNWGu+hIupPVdyp7MvR8
X-Gm-Gg: ATEYQzxAIZoMl8PQH1GHXuF3xMVyi8spoB/5/6CXFaP6PSrx8TxngILSkwtK6NeNo29
	JptCgHRGD7mtEkbFxmHzWRcQhRN1R0n8vg8VIVmdJxOzreiJmshmYSPpZMaDRgcfRL4YMQx1Ub3
	OOzvC//i2J6QMXed8nAuognbfySTi6aCfUVI9C3ss/S3fsqWWt1rgP1XyiGz9ePMZzmole5KC/l
	zE2WdxpXNNFa6Vhn9Uz1sArv4/FROS6KmHARxWZeExE/AnAZWP+5JUtDuo6Yrk61tttf35R2LHs
	V/rfqRnSfn+/yiFS7uYUbgfkBECBKwF+Nf1IyaV3q++kaANukLmAcWBKnwbuQZcqsgmahZNHNUL
	0BoHu2IbPc6M4md3JwoP9WwbQCwafojYZGFGDxCxx8D6Aw2tNbc2CP6Mn0GrpSryAqmW1PG6lRQ
	KuvctPE7ISpzgjFaKSks7ZaDN9JeBO5glNPNqFg9slyvFGz12fB6LkeCGrF9UJ5zrokMQsNfhVV
	mVVADjufOYe31LmvEspCPhgK/BBCHUbs2zCYySN4CfW14RzxM+x61QJIvu4tMEr+AaRVtR12PLt
X-Received: by 2002:a17:90b:3f87:b0:359:8014:d5fb with SMTP id 98e67ed59e1d1-3598014d645mr3245982a91.0.1772352375853;
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:20 +1000
Subject: [PATCH v3 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3210;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HNjAg2xdRxewqWz3EXUwC/PrDpEvfT/uT/eZPObjn+w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6dvf2pd1qHRvMz1xi4v/i9vSkzeL088WKxRn2z4p
 TMz/bl2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpP6jD8FdFdfO5hUsaOKw+lrt6UzfgXfjtO7nf3noRZrzrm8ISFFzAy3LpZs+4
 O53ye+6smZzlZH57lNf3Lovuq18IcX523mefVyQgA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ----------------------
 .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..ca71e3660f62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+properties:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+patternProperties:
+  '^dai-tdm-slot-[rt]x-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Slot mask for active TDM slots. Optional. Drivers may
+      specify .xlate_tdm_slot_mask() to generate a slot mask dynamically. If
+      neither this property nor a driver-specific function are specified, the
+      default snd_soc_xlate_tdm_slot_mask() function will be used to generate
+      a mask. The first element of the array is slot 0 (LSB). Any nonzero
+      value will be treated as 1.
+
+additionalProperties: true

-- 
2.53.0

