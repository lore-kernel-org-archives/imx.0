Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE6330B502
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270819; cv=none; b=B43hOO+hegRo/bwPRCZKjayg3MhNfMQsCfYuN6W9n0gbvK+iasZHnzrYEYHmhHjThP5q1A8J8W47TRtqxxaoYr+14WDEgpFdphlI4y18v4NeW+hv+XXk2JvTN6FiGwg0XJwCMoCJVbcbO9EMCcWXUMuJWkHXjUTEtZTn4BzsJiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270819; c=relaxed/simple;
	bh=SKzLAqQcxFKBzRQoVih2LKJhZnhNvUtw7I9jZ5DBlmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xz5gIiOoQGTgn3pKsiRoUdNtP/AM9klkmP8sSqHDXxWiq15awMSZNx6xQg7giCIlDPitZ75xQKNvvdLd8URBDtpOf6C78jwumGnCSiC1dVZkqjS5l9kcBgS+t7amXUxhxBKroyxvdAoqITWMpuiGVQZE7iORwZfWB3SwIF5OcZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKNtjURZ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKNtjURZ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso2071051eec.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270817; x=1781875617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=tKNtjURZE70i0HZa2IaVTkT4HVdn2rDFkI6s6fQ0M6gW4dmpwSUNZGpiXJ+Mh10350
         c8IMokSPuqa+e/qVLD+6rvtmTcwdHFHDiUCmi1ozpp8ocDvFYElGBSR0CWipu9Ub6ouH
         h+Z+VgCO1b4aFk+htRwWeonEN3CBrcdnOqjGVYt7C7V5SzAjzluNyJOgLBLpgLcKPROp
         nq/PVkrGNTn82b7AfD7j3cXSTbm7Z4yd5B5QXxDWOKRy4Vajfu3YNHbCkcaeqL0PSTTK
         SydqSCRUj3e00t82DmmYvY2gZPtLBWXw8bb3HZK8o/1I8UktKG1raXcemmLI9yc6Hm9i
         xwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270817; x=1781875617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=E5zVuvMqf072F8YwcHISMvp2ycTV59EfrtSVP9XRAUCS8vvlXoq3nhypMHKiN1d5xK
         Mm3Gfc9Bt1HNLm1TB61fyu8x6pqLucGl0OWLW3tck09eRod3LD4vrqSxm477t1o8TZqS
         XvDwhKw3SozOU4jAq9Rs519vQiR5wOfMsgSqOAEmgDr9vYX80MXyOTRZh94FlALFudjK
         ev6O2BkycDK2OvTZh9EWz7bm0tXVch50S47eoWA9+oeJR7KUwF6Jj8wg+E2FNxirPoA7
         6xCN79aSeKWHd69ly7zqDq1oHG49NLiYwwi5fAhEVs0oyZbT0igr/V4K72mJqW+i0EEM
         nGvA==
X-Forwarded-Encrypted: i=1; AFNElJ98ELjcPx5fbJVQEUKTJJ+JK/jXBnF6K1EOIBHXCbzPD+ieN20iUTYqjPQa8OWh0LYAWAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2sIcd27Qq1e1zCdh0aQ/Oa3qAJoKJR17mX8BTGfLDku8s31hZ
	st5V5gWBoDcPXX3UgRp6SH4MSP/reKxDxWiFSHVUZuuYWaUzs/Bz/iBf
X-Gm-Gg: Acq92OG6oU4pcfKyc13+l9tg2iYEpX1oEQ2e2bxeG5+lLBUhFwQifcwxOSyHIKHwkBr
	lj/twmX+rTr4DVBV8NolNPvCTkv3enCvwu7T1ewiaZs2xdnJb6F9uEOhKOYHgU5ZuIXu/c09V6B
	xQjHOvd1TYrlAFD17X0nuQL3r0Q0WJvwR5fntnonFthwrm1nuDTBGpAI7C1wrdpmlQfHFC6Wupv
	A2tIZ+geaIQsz8t3dge6rSwiQiPgWsEd9mc9CnCUuG/rKpxtdZFh4SIxZS7lL9t6luG3Bi/qxvq
	pkeLBmWGLtlN8PBHYt3QsgMswFPDdD+fVBjGon9mUD7d8pGwvrySna/8GK7Ar1hT/jjgZhpsPFt
	GCYlO1SYMxHnUJlHSIUWZpnkLi0gPAdDndyCFZPBDdi/I+r8yq9ictKgrJ2XACQgQjzJJbFYxZG
	C74uTKi29c+1klBqZ60tVs1cYfHKtsYsZmeLIo4qkvKvsC549ef+ZowpnJvg==
X-Received: by 2002:a05:7300:8b84:b0:2d9:ad46:4a92 with SMTP id 5a478bee46e88-3081ff8525bmr1726924eec.13.1781270817309;
        Fri, 12 Jun 2026 06:26:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:26:56 -0700 (PDT)
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
Subject: [PATCH 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Fri, 12 Jun 2026 20:26:28 +0700
Message-ID: <20260612132639.78086-1-phucduc.bui@gmail.com>
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

This series converts mutex & spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

I have compile-tested all affected files except `mpc5200_dma` and 
`mpc5200_psc_ac97`, as I have not yet found the correct configuration 
needed to enable those drivers.

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

