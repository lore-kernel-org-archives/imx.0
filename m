Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB927F195
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272724; cv=none; b=rML18uCxy5MZ2dRQrlRWfn5cab6Ld5mCnnVF0kYkBYAPr/9fSl2CzbA7jN2p3RGdXOj0iIedkoW4jJnBjhqS+9RYw9Jp+23Ec1w/VCrUVPTjm6R3ahJC/BKsLxi23FEIo08rCjSISvuR/YPnrIbKn0ZaEJSGW0SaHmC5bdWRca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272724; c=relaxed/simple;
	bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKu0jcGtcEsJ/S5rj877xp6pcEaTUJ+H72+zfGKZXg2zvVV1pbouyvwOwcc5u5QwuGHpmZPKSIaEbKlZMu8T9GUSCxNGLEvyWStrQdaVJYXaZNkQjuY+e6nNzQFtPyjNxSjESwnuNV5521MoLVsRfrea/eVQe1bAuyZkcSgaxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eujVIAhR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eujVIAhR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340e525487eso4294298a91.3
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272722; x=1765877522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=eujVIAhRNxE+mXpJWEqzgqUIEtzfcJ7O4LvCBNVlfX04YmJ7aSi+RnKWqDaXfgF2TW
         D49MYNhdVyNsgb6C4mVWY1rgsPtUO355rJOttAoHOGiu0zpw6V/OGkwSpYeWF+oLn+LW
         qU45TLJSw3PDHMjMThM+k1S3kDeDZUzj53CPR+DmyYPtjEGloQpdgzLlngkIk1lpT2sJ
         ZPdbQZ058r4LQasgcsw1ZO5Ec/R1rRYrA7R/I/kSBFKnDvGrm2xgZvsCNEwyMi+blZfj
         gvrjIg5Ezsj/PhMaPf70hcoGh3TZq8FLq6BH+X1CdaE9+kgWm1JXqjy6UPkkXGa17HoL
         aIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272722; x=1765877522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=bYBVxRRddVNlyh+AsjBtFdEWU08wEXFgpzf+gJCpkrI/sFk1AgXSd4ewF7bosAbqSW
         7twtHGd6Kq29K3Yd1wHHNdBTAB/fjrkf+OSxX3OqkqBtqD7WN5cGfL//ABwL7JaEYybO
         CBx4TiQ/bFdPL3lhSB0dv7zYPBxy5Djwo3KAIsHTIBJVSswPVmokC4NHNZ0BwC4R6MRs
         gJBRCfJeI48g5tNO5eSbm8iim8IG3mCrHnQXWskGHYYA49zVf1uz1sSRqJwv5EpT5WZb
         lLK9zPr2YKigIXk7gDRpA4rEXtK2Am8B7o2cPt0gI0QlKVugCQ7hbxOxnUMqsAN9e4qD
         IGHA==
X-Forwarded-Encrypted: i=1; AJvYcCVQqBfLEIryOl+6lIF/+/smM3fVmDe+lI3h5QPbSp1SG03dvp/rQrMq+rHobyVYOICzlBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyzDK1CcXMxwbZzcErof9MNjQjal3GlQVvDiLdGoE2CPpY8bAH
	b8du7nMm5XcxTqusYRK44MDzlzMsU10szcQyHfpLzpmRNIudgub9lusI
X-Gm-Gg: ASbGncsuSPUGMoEK74GTTdKpJigoueh1Yo531+CG/OwXycTVgaRDLDViD5NVjqWztFe
	Emhpju7F/8abjVTFHx9sMnHByQu9I6Ppt+s3mEH4ODGEa4lTp6rd53sGL3/D8t1GC1sJCJLppaJ
	CPsXlT/bTjNDK5XI8ZaBoE45USACxj7QFFnA6xjE4fOGk87hAzVC77Ynoik7z8ieJi5onnTQvch
	7HOrIUWL7ft2KLmVLqBVNFrbUR96WinZI8UAkeE06wCnw900UqFC2QbEtfvNWMBdnIz22hoyjkE
	2QpVKkUua5GAeQwMrqWG8mFjxUL9/+TndpIFbw2/w/bVTkqqtTvjefncs69NjgU9Z870P4E7O9u
	J7p12GV1Gcq2HYiKtyyjCFOvNhrv7roYcdwYSV3SYkdqgeKOWm/9Joy+1o2Z+VI7V3OGsIANZwS
	sJuiKB+b+oJxHvvGZyXpFKjSCpAu3MqQlR6UgO1TA77MGMS7L9v5Uk1qkgJEtM2k5719/8TCKX7
	ohNC0h/yJBdXzg0xzgOxYb2NOpArDNtqTADN7JS08qjU9XPkA5zp8mQTw18SGS1i5ShBLS+tB9L
	1Tu+vpFgk4b2ihPoZAwhyFNGab41WlEjcQENzexeeFtutN28zvo=
X-Google-Smtp-Source: AGHT+IEwaeD0b9uHojQWY3Zj92Hr/X5acaNl0q97VcOUGKTdKrWTewUu7dv7EFYi+rSt77tp7bmfqQ==
X-Received: by 2002:a17:90b:3e4c:b0:349:3fe6:ab97 with SMTP id 98e67ed59e1d1-349a25c00dfmr7898399a91.22.1765272721737;
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:17 +1000
Subject: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Llv+1kaVUxfcu0Lyr9iOuUFcssFQvk35ZxHPLV9
 3RbufdWx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKon2zD8L7p27p9KpcGMFdc2Tp/u92VGWJiRQcaf/Nf1cy5fVDnAEMHw32uK5pn
 yTx4z157KdWEontG08r7oaZNUBtm2Xccmfp7+gwcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers.

Imagine for example two codecs sharing a bus. When one codec is
transmitting, the other must ensure that it is holding its side
to 0, or data from the transmitting codec will be corrupted. We
can trust the "idle" codec to simply do this itself, however
this is undefined behaviour. Some devices may leave the line
floating, others still may pull the line high. We need a way to
control this behaviour.

Thus, we define five possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, and HIZ (floating).

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..a5784ef8e3f7 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,19 @@ struct snd_compr_stream;
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
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0

