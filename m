Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D427F754
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309820; cv=none; b=pqcHgsLJWQWaNJlnz6wIIKf+WeAxLvMDXAp07OMb4QrOD4tJOMXhPhnE5fZXQdEcgpTV7wBx2Ua0Y4ZH1PXzIZ7S/dPKWSw79pz+AI61TI/hN8ILj3WJ1oh4eWKq5nOgXfPzKzjtTS29jo+xurL6ZpW2j2vBBJGy32gtpS0HkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309820; c=relaxed/simple;
	bh=mjOv/Tov/J+hpGHcb49MekTvZZfF0eTnGqqMKw/v44k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uxh3gHv45aT7ZBltb+mrxVhy+4+QUVFQqFYQi8oQ/4Ln+9kUSVp0vXC2xyAC1xSdCeRlCaojCHSaSidEkpyOIgumSKtWm0ct66q7zLW8W8hhugcsdHRgyitabZLXKfpeCS1IK6U2XjOvunZ+1cDs5LRdKPHCKp+ePjd3uLR0epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JILIf3HG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JILIf3HG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso38753085ad.2
        for <imx@lists.linux.dev>; Sun, 21 Dec 2025 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309818; x=1766914618; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=JILIf3HG9q3AySuh2FZVvcOlI/mwypRuF193SiL2MvKr7skXPdtXA3xciHHRlIEmnY
         TRdU3mAbmAbFPEVYo8p3aBUgNQLvy1DtIGQEIB7PgoPgWlkVvv2w9e/ghJMFjrkl6jTc
         LTy+Q+vy5UIu2G9BVz9gOkL5qe/s4XWOtEDp3ygIWu5/d8LN/iuxlYJn1D3uBmsD6xL1
         x8naPbRJb0s/O4GYJdhYNWf5bmER/ATP8KJXwbsOEPROgFajk/5d+xvW625Vf+TtyeHW
         6LfEF/gxGnOy9UQTJGnFm0NrItemjyqdL298w0fz9QwqZEgDRv1gPR1gz/AgFD8LAZRT
         XoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309818; x=1766914618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=CGNiQP3oCGGnlaxEXcIHsQzselnzuk3ajoZgLuv21K7pEvjBPj18XYN51zPzyy9IKx
         zpS9UfpxTDvX8FDRk1P/h8jYo7iPSkqBMOBCW8sRFKV63CVcZL+j9kT1qp+ivh+SZFSj
         bdt2ewdhgxUW8D0tt6WOYVogHalGAQB5YL1doPSLNlG4S6xD1H4xVQpQWBu5lpx24bVy
         T34qJDffBuLmxQb4T8D2n0pDBS2oij0R3nCHSkKx6BPagKLzWuKQl3e6xA6IFaKkL0w/
         BddPgH+l8ehAPzmx/n9JEkjEbjaokOlhCW0FWtq2exkZC3OQ2mBWRocKl92Y2mbxP2gc
         ZaKw==
X-Forwarded-Encrypted: i=1; AJvYcCWCjhjXXcxrJ1cdvPb9nXAQddiK7v5jH42pgcQWN0bvtEEqyeETVRifmH8h6vAvlxraNe0=@lists.linux.dev
X-Gm-Message-State: AOJu0YztMRkvMbaYOeGxYRagSqQxERXb7aQryZc+h6gAiieqgfZzoDH1
	zz1KYsTwkLVeeNerOT4g2+314fpPbOLD/cxDeAjKREC2g5POzVwVYIsO
X-Gm-Gg: AY/fxX5ypRd3lOU2R2eXcHLlA5F6pOjvXIEmhbI8l/ciblkTYY720vtg0oWLv8D5MS7
	CEFiL7UHrPevunMGIZgmSv7B1zwRdZR+TZqgD6KnestfJQU8/MJdsLE8ZTgIP90xdMMgAWu9Vju
	/KB2jxS+JECSigLQdOeva8fEjX/eArQj6t2NRhuyhj6DbyzfYD7ypo+IffDFDbFkTMmmqyEMQSF
	RHrw4UNyz2Y06/cKUONqAp377QbfPBtQsPAEHxRdqKnr0I0Vy1WY91LsToYU87hrb+2qehmyVKw
	fKSitI4QzjoJtOIfHVRpCh8gwbfJpGyro8fiurpaRq3f+ITi6PWL9peD1sbOfrcMYEOWbB+gi4j
	RKnTrf8iuX76ZVGqPuqKg/EzXXdOfvJ4Q/wYtUHLpWGRq+ZujhbWjifDGZtskSF6NNuMFaAaX3a
	tjfC637qE8yETa5KUMk4Y6jbAy8da/f+vt3NxjuQJ8XoHSkaL+m6IJVcKGVOlGz378w0fCueWn7
	iXpeNmQTiZxYgECTPR0L9QUrenkK2bcQKwPRXrRU20aHndWKE+daP+OnvrGMmL5+dJjafGl/LnF
	Zg1TzlkVuUb8xru49Ji8R7YI+1XHgQazEPKAHUqICZNAgEuDoFA=
X-Google-Smtp-Source: AGHT+IE9k5fjbxVuGHt35PQ2dBtJxutYciuw15r6xi7up9QtKT9LAT9dU495uEoMz6Mf8cwTHCKz/A==
X-Received: by 2002:a17:902:ce89:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a2f222add8mr78300875ad.1.1766309817611;
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:00 +1000
Subject: [PATCH v2 4/7] ASoC: soc-dai: define possible idle TDM slot modes
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-4-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mjOv/Tov/J+hpGHcb49MekTvZZfF0eTnGqqMKw/v44k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yc/yutKemkwZXlY9yK/5pRenn0/JK9vi3E23PHj9
 rFvd3P6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFPdF8bw3z/6pznLMVbdZTsX729YcvnxuSJLKz6mWU9vrzHWEMiYUMrwP0GFtep
 N5r9rKW8nhSZYHJ+mwbvD2srqxs45k654uU/+ywIA
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
2.52.0

