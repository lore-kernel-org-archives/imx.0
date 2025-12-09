Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4982DE703
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272703; cv=none; b=CM8SUdHNFtw9NS7guPUZ4TOfb19jB5I+EZvi/2+U3R8a0CNsDrZrQ4q0kEdg9Xu+tzbvXYgCdzw8B2k/cKYkrkLzLFjqE5VxkDKiHKN8gyb5m5l8gFNBHH5uCy9tuo/pb6aTeQRoUQNXZExaIyx8jDqcglErybbic1HRN5h3MW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272703; c=relaxed/simple;
	bh=jnORVtQ7uwoxce9j3Ho2s0Rrsem8arYyTUJQLMiHu/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMkU3RPyhwHlwwHYU5pno0QgDXmOoM58dEDeBwhvHY7B1xEZzwGgtYXtJFZI4yAwAMAy8zY7kMlUfGkwccQeovhN5NcUiHN0h1+sLLS8Gba3MynrtPcccWoPGtRVJt8EJiOYMCYZt5zRi6cPR9mEhcTae2eYFXrnJcoSO8gOrdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EApG1cRk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EApG1cRk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34372216275so5470564a91.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272699; x=1765877499; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/uimxPOVZnzKfBrHV18SDw/9y+UsMeBXkZvH5M2DDo=;
        b=EApG1cRkuo3e5YtJhEzBopA/W4hos0EyjXK1TBuVuLeuoAfR5VcqzPKFzpSoflBidl
         FjFdR9woJbASCSj0vnvJhZtWUYlNWz1eqC1IvHPuqNtQNbr/bSUTNWTnTpdtnRa969qZ
         OA6ajLN9BRzFLjWJIC8IL5ttZcGWrYPJxQR1ULhc8/XQQ1DDpcrnrjpJ7wPivliSIep4
         4ygZJkmRSzb0MzrSiB0E8dgHLu4JZvbsCCdhm8GwOVoJReGqrvS1HUoCzeYpoOJQlJL7
         BLY/WMdDHKj3g2NHZ5WbhuwMuaWqSith6HzPbRZ7wEiUKFwRe7xTrZa5huZE2BxdTVBs
         X8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272699; x=1765877499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/uimxPOVZnzKfBrHV18SDw/9y+UsMeBXkZvH5M2DDo=;
        b=JB4Ak+RekJw7y3eQE8TD5DmZUmVmbjoz2t6PFD3zBTYCDoaMy5Tj336nxNmFNGg2Wt
         jlRqobz0x1bS3sOBME4E2ypQUiRDR9C+LCSmfiIjvahNBw7X1rA3OS/oLLZigq7pEAIy
         yTvrgZpM8KbRVAzHR8bQG11FkYAXsUtlfSvtJtkePRkGHomOgg1RZwIsFRTSLnbZJ8qU
         zdLg8ARxE/t5sWlA1fMSPUIY2CqBuABNSm9znXm8L9jCtaGoFI9wARHxzfqLR9GrvG+a
         t+1/xlsoN1N4W+PunQTRU5uIqVrXPlOJQcciNVW4OD+a+NMzZ0d41f4J3mNMKdlNAF7d
         Bz1A==
X-Forwarded-Encrypted: i=1; AJvYcCX3cLBbvmNv/OnmpIBuAQn4hzOsmxBIdLdjX+n0eaNXubbybnmtHEXR8IUdMPl6iqrsf90=@lists.linux.dev
X-Gm-Message-State: AOJu0YzinfRCimtWAL2hm8TPabh8b0X63Jw7lpPJYcOGPMN7Q1KS28iH
	9tDlJO+mmv74wZ8SXjre1B4g7298EsftvYXdlScyEZafzmh5k08ZBACs
X-Gm-Gg: ASbGncvYrKHAuwtfUGP3D2S8m/UBOfIwy4O/n1AFDB11sZ1Hi8sf88nWMl8ptm1NF8r
	wHd/RyoXcHmBr1VmfhbewsnfTd5Df/32xzAx1s47Uot4GRCqA3yJ/rezqAMhp449idt4mQuH1IN
	PEAJHb9ZHiReAH2VZs496JKX7hjlX9zCWDtaIiVgFVvSPXGszxYDJxh6hzsRcve8cqDGAuPGbY5
	9N/xDH5LHGlWyF64W/MzG+wkeOUU0iPr9QE0q/os7pAVEjKNIpqOrTkexA+HHPkhIcFvFITyeA6
	OyeiA9HXC7XcaYMp+3RePa1LiJYYdGDq6scCFnz2NWKuXLUBo+j5eK3rLDamkCzRwMkDMTqtTaS
	N73k4/B1UDq3Y/IFVy+wa2b4Wmx8aJ+FEENM14T9hZvrjBy0PhFiSse7kBNFuy4P6+JrPyyDnJc
	f1xD4yUxkb+89jixqOgFbvRU6aQRcQdySCWQ3mZ/KkcEpRzdaLykDXyF7GybjT2dq7VAxQ0VUs5
	dwUx38V6GzwzpOTsvYepExmjU0EfmIp6CIFilKGh16yTXf8vMGk2AMU3JEIlcmojtoSUQvss9G1
	Y5nWhMhw1i94sKVaCSVcFtttK7vTLwS1EU6VnOugw7LIG2xTzUdjHaOQ1jf8Gg==
X-Google-Smtp-Source: AGHT+IHEi2mCBtg0iCmcmf1gH4uYiFRGoKIeFa7PXJa21FQTMXXvhgplPXzOltuWl1u4iFR2Sxk4JA==
X-Received: by 2002:a17:90b:554b:b0:32d:dc3e:5575 with SMTP id 98e67ed59e1d1-349a24cb7f3mr7136131a91.5.1765272698893;
        Tue, 09 Dec 2025 01:31:38 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:38 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:14 +1000
Subject: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3318;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=jnORVtQ7uwoxce9j3Ho2s0Rrsem8arYyTUJQLMiHu/E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7LYrpxfsZcrSnJ+7Q6bp+oLO14/uMazNz1yzc370
 77GbUmN7ZjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEx1whpGhndnbxZPurXd8IHCzimiC5Y+WdvpG2i34hrX7NZu/+B4cS6GvyJca+L
 KH6gmqgcn75+y/fuBnXNuqSw9F1fS7j3x7C12R0YA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ---------------------
 .../bindings/sound/tdm-slot.yaml         | 34 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 29 deletions(-)

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
index 000000000000..b67844e1dfd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,34 @@
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
+definitions:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+  dai-tdm-slot-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Transmit direction slot mask. Optional. Drivers may specify an
+      .xlate_tdm_slot_mask() to generate a slot mask dynamically. If neither
+      this property nor a driver-specific function are specified, the default
+      snd_soc_xlate_tdm_slot_mask() function will be used to generate a mask.
+      The first element of the array is slot 0 (LSB). Any nonzero value will be
+      treated as 1.
+
+  dai-tdm-slot-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Receive direction slot mask. Optional. Identical to TX mask.

-- 
2.52.0

