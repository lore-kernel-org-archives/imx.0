Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FD201276
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527600; cv=none; b=LEffhoXLSIug3ZHSuelK+FJSFyMardGw9pWprniFx1ykYjEiv9Vqt+dAKaLN71X5WAjMk2EGAt3Ftx9B/CfT69fLHOuVHwiDytXdxvCc/04LK9Ho7L5iEwfz59GlAMWGADXo3k343JJZrlRzPCk9XXUu9XZcU736C5BlVw3v0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527600; c=relaxed/simple;
	bh=fZyjE9zHWKAp6KH2H57u9MkeLSHGkrs8DtfPsCk0w5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VfkKJURKhDOw7O0/JZ2xWtjLIQYgdSLK53As+k/+su3mYzk/+UfZYQ/x9W7pYRyjcICl4G6/Day6pUqfAqcoM8ipNr6Cz38EonZXS5syRdUReFEQb/BaEe8qFaqZgfB3OkSTKobGS2GPbGb9LbQFyb/5fGDzXjTpJiu5hpHfsLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia/fWeRg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia/fWeRg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-382171fe8b1so23196f8f.1
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527597; x=1732132397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ8QMGzCMpCaQwAwEg2/P5qPEfEiY64c9xCdF+siaoo=;
        b=ia/fWeRgxp8MKMTOukuLDTvcGL0lhYSxSf2bSny65xtPYeWBFprCzxfEJv0v67qTBU
         bRsyeWWOfZTbujmpSISwERq2Co69vZkcwvVD1WKdgSK0GwyJyB82hzlyO186e6BVh6sz
         mnPHEz83obeKNhs2yIiufHKD8npy0s3lws/SzGY35N2hJLNg/NHy1EtWxjbhrqulVPEf
         9SW6LsCJongRRhdSW0wau3pbN/P1blk1jsFLdd5Ba/A7O4wvvFNmJTdBfJqLmRo3e+rX
         KHIbdvxVM9YZxVYTGtNwFqUb4T4G4akp/ld23FQQbKF2yi0+l0tqwRVi0d4vt88H6tEU
         BQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527597; x=1732132397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ8QMGzCMpCaQwAwEg2/P5qPEfEiY64c9xCdF+siaoo=;
        b=pmnbawGE5NLgxlKgJocAvZI7DSc3UhVOp+Wn8YKO1vdEOBu9OY9Och0QnWnPhyVJ0e
         rO+br5yKfER1PfC8NYvXEPyt5j1Sys5RIVsUUw2tubZT3w4BnALDmpWbKEztTUOHPGmW
         rRnnimnfnDSl5eVrMMHIKrPucopcrfdZrmJVhXaPciaYm6Kd/svJLfI84qyWzNN1p/oi
         +qLIiPErlST5bd7Yl8DrOC7GZDSMJAqLtExSCqSo6lNLzkQlvWPgfoNKJrBYxUGuUSr0
         53LRQzk54+kcXFmUSIOzpTaKEdx+zrvypjtOl9JnL+di2xwY0hw4ihRGZO39hlFzt2ZI
         r4mw==
X-Forwarded-Encrypted: i=1; AJvYcCUpLoUKh7/ktobMUftGJfcv3o4zXxhYa/KSmDKnaDY6/GXJUYmJAJWn9lzdCxprI8/GDNQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4DAo4W9IGi4OVPwsl8hZGDdgC7gzWV1FoYMsOJGF1kNCnmfcR
	Ifowd54+V85NG6ol9IP7W7rOIeEG71CUjaogYOEw3/x8+7NONo8Y
X-Google-Smtp-Source: AGHT+IEJ+OgyDhiObJDLSUqfKPbscxIsWPEYCybVM9JHR8F0mDVuDPh5t34siJcnZuIWqoUEsXJC1w==
X-Received: by 2002:a5d:64e7:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-38214064d0amr634681f8f.22.1731527597046;
        Wed, 13 Nov 2024 11:53:17 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:15 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] add sof support on imx95
Date: Wed, 13 Nov 2024 14:52:35 -0500
Message-Id: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

---
Changes in v2:
- Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
- "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
- Removed extra empty spaces from DTS as suggested by Frank
- Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
placed inside / is kept the same for readability
- Ordered driver header files includes alphabetically as suggested by Frank
- Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
driver as an offset to the start of the SRAM region.
- Added new binding with properties required by all NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).
- Various driver adjustments made to accomodate the DT changes + some bug fixing related
to the mboxes not being requested/free'd on resume/suspend.
- Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
other way around.
- Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (5):
  ASoC: dt-bindings: add common binding for NXP CPUs
  ASoC: dt-bindings: add binding for imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |   4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     |  44 ++
 .../bindings/sound/fsl,sof-cpu.yaml           |  35 ++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  74 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 401 ++++++++++++++++++
 8 files changed, 569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1

