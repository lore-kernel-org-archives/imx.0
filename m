Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01732ED4D
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352401; cv=none; b=UwOZcsxjI3FhGvS5f/ce1VaVsXzKmrY3aw65Vfk58lGWtMU8muu53g6gMqruh2lcD+NXXX9MIJGPN9QvZacPmMfd5vnzzgwWxqsne+tzQgXg5SW0fvfWDtFSLqqnYr9deAFmWbipsDQ+++gVCc/2zfMam/sbGu1rtpmptI8WfWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352401; c=relaxed/simple;
	bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5o3bMaGLpwAdd2+YAFmkQr/iNhtJMt4pumS7li/Tm8fptOvnG833vd2DUbxRnGgHQ1aZhDEtLKCDml6KjjNwBMx3JI83ZWNwML/GxrcvczeIIVcfOzg7bnwZYCUkUdwPsr5kI6aFMPpAVB0OhnKQz8g9oMuxGasqKPDciuf3hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5mydJg/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5mydJg/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3562e858da5so1467069a91.2
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352400; x=1772957200; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=G5mydJg/M5hEacYUwDj+pslnMZ1XJUGnqH4SrTuv6a2KyktJvT+8Dz5K4ZH+DzkDPc
         OnbXUIqvmugGKZIBjM/Wny0NG/O3MfS5eyMADvAHjp0s/6s+IMWJuje9gEne++ViQfdn
         FZJeRsFVLYgjjdw3IshIPKwTfHeUxqJN73xDFmQQcS+10HgzjaJ0z2Up0Sfx9BZJhHZO
         IiB804pAXr8sUK3t1UgwEVFSSxMAzKec+8RsAmEUrxNknUd/aQZXB0Yyf11f55XA8w3v
         p758Obn9MHh+nEsZY5eX75gvPrh2RRqF3u1JxJhnP3CMISnAlZL5AHK0vv0rNFMce1eu
         xaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352400; x=1772957200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=a9VzYVPl+dWOsn4xviAQEXDAAEylmttCeScGmbXdlLu4Ax5jQXQae/rbAIDJbmkc3f
         n7pspnz22pseYZDmbrQRhTGXPPGVfZr+bdgYTYqEAINo0yuQEe2H8FAJx3PW9M7mkCDH
         AGXkDjNViZ9fpOochzDuq/1RvTsBRZiwnGBD5i5qjIGD/NPtAs1kAqaTXssV9mM9UUps
         HJvd5HYxzE5mERUowc3gvncEtEu4P5zk2LYZv3bqhBj6eD9Ds9SbrXOBH9uyyg2DMIwN
         YSHhCHEv/txzuz9NRNQGKlHuLGX+1JGx4Yqx251WOIapb05N1yQqCZLp1pC0KyyM4mw3
         Gk8g==
X-Forwarded-Encrypted: i=1; AJvYcCVCJD+TDTQfk6LujzhztD2PV3Rk1HkX95L/JhFtQG4FTdhwLRT3r5roz96p1xbcFV0Rh9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNxmjLL92xONnw+Y+8ddRX/8LQtx+3ur2KAwkHJouSdoeySOxK
	tnBsudaky1czcqL2DNzpcqwSxq9qJM+uRRXPDTqxqFth6Ux6NOP3cO7A
X-Gm-Gg: ATEYQzx8/fNbYalWWMxTtZ6uWWaSKBh0LshP/gEtEoQKZXVv5mN+G9+RP4/xcaPDV6I
	5VL5bcxF7jBV+Zx+FDad4wmxoC50mlglUghkkgLBrymac+TUhqz52DKh/C6EHmMDa6lmVb/xmVC
	NSsNnLgaNe/Y9NwZpLv8zsJ7sUFYhNQlwruuQ37SQjKVbLEncOTYKj9q++EkJ0D8Ss49+T9ek3/
	mGCWGd9WVxiSkTmDeFJspcm5TCV/MNVPcEX25iEcr9RJ2aHBfXNePMy5qS+hKrRnFBfonTqPGQg
	6wOOrgXPFJ49uex2pwxKwduvT25EaxmQH7luFJw9KMMG1Ee3xgEkHg/8RswFIsFwkfILRS+7DHk
	tE0MXGBUkAI96ISyD0/wKlxpqF6WKfovslYQ7DCtf2HcNw2Ra7bthB3+cYja7V6Xt0fD3IU2k40
	VXpA3bgdlQgZr2kzmoXsaM13ugSulUQYGRZL4YKSJVUtbyIF62Ce3KNylHsiETwPdZp2JOOvQAM
	QSVQOtWEwUsE1GpbnZBFIWV/CjnujQJxV2bPz5+PwKExfkeQZDRntpCPU0jryWjPUf5lkgOM67N
X-Received: by 2002:a17:90a:fd97:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-35965cd1066mr4480685a91.28.1772352399832;
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:23 +1000
Subject: [PATCH v3 4/7] ASoC: soc-dai: define possible idle TDM slot modes
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-4-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fXyj+ot16S9/zirdpppzcc2LDlnapn6bXO1G+Hz
 6y9z3LmXMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJ+gx/GJO9N22/us5k96pFR4/V7C08c4w3xVVcFidZcP8zCcfjNIZGQ6lTXT
 u+PN3rYrwtOxN968V75nySMXRV/eSfPhus8QJ+iwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.53.0

