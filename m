Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494A3DA7CE
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516365; cv=none; b=Z6JdB8krA9rLC989g4EolOdByGd2zlVjWHUc8Xb797BHO153+AC7T9I0HIq+nutKBpgUIh+LIPmDXtTFHlXtFTnfYDcPGO/9jbXMMHf8K3S4AgQ3c4LtJqH5eDIJDmr+/pHg5Hsq32bMFXFTMKjZeFeqg4+cyKhOynbfsOKJq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516365; c=relaxed/simple;
	bh=bSrLQmcCJB7fAevtWnTYtSpgVj3mkq7+M4acVTFsHO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVp9zoZ/iw8te0dmW0Y6wo95w6LV0DYIy0w6hG/mwxoB8l3Av1aJuCvNQ/KrO+wzD0K7jBHX8UnTNewUajwPWhtTZY0UYEgpabuNM5l36eQos8TTfsa0Y89Dom5bcPgX8oYVRMFxWHaNqSPNx2fga1qSUCVKmecHeEng3UDD6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrFUbq5D; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrFUbq5D"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2159322a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516363; x=1782121163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=XrFUbq5DgIONkP/tJoJJ92MfhfDbyV0sTQPQi34q25ztKbiTW6NQ/BD1vI/5nuWpLv
         1DLznhiiO2XXHzrIWvybYo69UISovgaXDk5zlY6Qq0YuCTPWG2HUsuXWhxf8diDOjC6X
         UgH8gvvpa0Jyo+w7nWTU184RdMFhWcpxBFi5wOz9suQygCiKfUeOTqP68upAAPwoMthS
         y7pyuDOEIILG5Qk55S0rVo5YVsWNHv36qAYNU35C1oedygWQKOqbbaLH9EdjxwtczhWf
         loj3jSxozcFZgAkP3lQk0aI0DpBRIvK01NTD/K1Bo6wt9glU5VD7c/1c7rx6SoZt40ug
         A34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516363; x=1782121163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=iUq8kgEFQ2irCYkJFIcuaPWhA7C66tdGdprnpBtvjcrRCejB1+qslAinAbCRiGdN2S
         Nigg20micgHp91KI+/3DZPAIIryTrGrEoY5qg4H2asbUveDm46yWYqdOFSuTgzFUKDlm
         pQPboJSpkEF9lGKs/1yaUTXO2GPgQ6vYePY1zMkHShFoLvVZaDf75HrBWd3BpQwQO88r
         bwWtgG03yPJSiU30OaaIRIVdbrFXKRJXk8HIskQyrnc3qAqvV+WC8dVoIMbwTXe8so5V
         U5lFNQGU+sKsuwnRRysNBxQ1cxoEGVV9oGxYbApzlamwEIGyyOWMXntuPM6sHE0Z7bVQ
         YOVA==
X-Forwarded-Encrypted: i=1; AFNElJ8CgWFkx0odDBf1s6ck49iRsByTo3XX9Vxds0BZExJn5LDqw2Xnx3u03TSmDsfxtaIIdKo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgT6hcD+uA7SxiWa4imz+jsUke86DFfACMSP7F8ubwTgaDuHDG
	bsYMcNwKP9ZPfbKyNYvb/dORDgzavw4VctSJvc1MoUBCmxVGTcBF2V+D
X-Gm-Gg: Acq92OFuRjsIr9CjAGDlw53Gb2WD8O2RvLkum0R9LKSFporcfGkoywCU/J+4Sc4ZLf7
	P1C3RM58PLuCk3LHpkdOktZvE0C2STd1nJBN7CzV1E8g4b3LZoxKZacz5vDUgLa/47zufY62XhA
	F3NPHCSS9j6Qw9aoVgwbcMlj8kTE+YEvIdMe+HBUrlKTWBJkwu0FGHYb/imW+I5sXPqxz2aT3Z6
	tTFsVS7SRqJnbWFDoBsqMr8NYxD5tG/oVCJTniE50Hq9/J5iRFARAvVF7h4ysPf26qzyVjv2071
	zWFzGj7i0uxnqNRfTwlvQcb8WkG3y5ZmSuYnI0AX3ZMxXo6GTvi3QxoI2FS6yu1GfidBgfXoqqx
	8a9T2lBpauKtaqg5OnjXqZNWJG/zmL+ztQ0IEQycGr/Mx3nmNr9McnKSi6Elajq/W2cs8CgFO8S
	gwFBgQrXO8rU7WKEV03+xfK2Egb6Dhl/UnmlU0kQdN3TIk00dHyWdQsyTSi1a3NMVNoE+V
X-Received: by 2002:a17:90b:3e8e:b0:369:74b3:a103 with SMTP id 98e67ed59e1d1-379edacfef0mr11864728a91.8.1781516362913;
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Mon, 15 Jun 2026 16:38:13 +0700
Message-ID: <20260615093824.115751-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Compile tested only.

Changes in v2:
 - mpc5200_psc_ac97: Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).
 - Added compile testing for mpc5200_dma and mpc5200_psc_ac97,
   which were not compile-tested in v1.

Best regards,
Phuc


bui duc phuc (11):
  ASoC: fsl_asrc: Use guard() for spin locks
  ASoC: fsl_audmix: Use guard() for spin locks
  ASoC: fsl_easrc: Use guard() for spin locks
  ASoC: fsl_esai: Use guard() for spin locks
  ASoC: fsl_spdif: Use guard() for spin locks
  ASoC: fsl_ssi: Use guard() for mutex locks
  ASoC: fsl_xcvr: Use guard() for spin locks
  ASoC: imx-audio-rpmsg: Use guard() for spin locks
  ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
  ASoC: fsl: mpc5200_dma: Use guard() for spin locks
  ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

 sound/soc/fsl/fsl_asrc.c         | 10 +----
 sound/soc/fsl/fsl_audmix.c       | 11 ++---
 sound/soc/fsl/fsl_easrc.c        | 36 +++++------------
 sound/soc/fsl/fsl_esai.c         | 16 +++-----
 sound/soc/fsl/fsl_spdif.c        |  8 +---
 sound/soc/fsl/fsl_ssi.c          | 13 ++----
 sound/soc/fsl/fsl_xcvr.c         | 29 ++++++--------
 sound/soc/fsl/imx-audio-rpmsg.c  | 25 ++++++------
 sound/soc/fsl/imx-pcm-rpmsg.c    | 69 ++++++++++++++------------------
 sound/soc/fsl/mpc5200_dma.c      | 56 +++++++++++++-------------
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 ++++++----------
 11 files changed, 121 insertions(+), 186 deletions(-)

-- 
2.43.0

