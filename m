Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBFB28B7E2
	for <imx@lists.linux.dev>; Wed,  7 May 2025 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633711; cv=none; b=dYLtvo0hPaa8FHUQbrElgrJ6aDhCxoV6if4uW/y/hEm44V8PrR+RWAGcSH0LoesIqSUFByXIDKEHcO0YFnccxOaf24WULJlF3KfAndQbFjLRWicwDKfz/L7W/WpJmHTjsn0IMYyt7YcoIw3iT4sfh0k7EUpraFII2KvchgsQxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633711; c=relaxed/simple;
	bh=rrN21HlGP0Ki2awKpcTuqZWM5E98/Tgd/DrojYNhTmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FYvgmf9ynJbOLBEV2tzmcwE2M1etdDWaTUKBDzJ+lwzSaoY5XdFrUz4g1KUT3pdExyLrD0GBLH8QUAEPuJ53348dV6f1kp+WJtxhs9gUVy0l+VCXzxpk3sCJ6YSDxxODI5oGkfaTxIf3Pr7/f+yml1bnxHYNNXH5gqGbfzR2O2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHeTMGiJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHeTMGiJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso131596a91.0
        for <imx@lists.linux.dev>; Wed, 07 May 2025 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633709; x=1747238509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcz+l8Co0SDC/cHtMO2vcFW8EyYc7hvrzUdAF6/dLuY=;
        b=QHeTMGiJ9OV0uLqHK7QoYnGNKKw5mmO+j/c6Qj7koaRH8fxbaDfFkMVukXTTppp0sR
         /SkMr25NMU9yGWMNcj6tnVfCngyoL5DhSAsve4E9WS7ekz+IMwwJaT9D4HolKjOQ328J
         7zz/xHiMjo+AE752/qyVeHRH4117v4rjuJTZMV0GOtzaAanzv032xh/2LuP7eNFGgxms
         LqaP4HHg3atEFwH48EKzmy64ZKJ3VRcELgSUY/wGR3gkxgLwJyVawesEpz3kk1ES4xpt
         t7iwAf2CoohxIprs0jrweXq1M9P+nGpW+c8RRpkRmsxHfaUCvXWAwjHbLjbN5aAt5GQA
         AAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633709; x=1747238509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcz+l8Co0SDC/cHtMO2vcFW8EyYc7hvrzUdAF6/dLuY=;
        b=a9LVg71LcEskvIKd7pcXYZms1gIEh3287GFUJ7c3d1PynDE4Guu/NTRDZ1PYkxe6qo
         hExGmGr46Dcy1OnSNS/88+4bEEJmoMddqQsEou1U/JsWe8LbP1pZ4F1Fc0QtvA639foN
         nZb0QcW/cNhUaYdqffCSZIMdhRtDOKNNqVUFMDWRDZbG3oU9dAyYnGWePGWkfpCJpWmm
         +Qm0UBwHi8VH95S8HxxMawZjq7AydykLfmxIVjzClt0EXjl4+z6auVhrOk9pRzzhAcUb
         xQ3mHX4AWqgOvRNV2elJth0ClZHpOhUIGcy7zOCx/MAA7SEezzUQVMMdZTmAkuTSgT4w
         gc/w==
X-Forwarded-Encrypted: i=1; AJvYcCVH8DCQXCAJFA4lyL6655wouYqfJK1FGd7MTN8fAZ4l//Y8KEKiudUvvFxeHdCS2D2WqGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrKaabHoyclBAdzqUnhV9Qd6rLoHvpFqm2OzYjpphLoJ9odH0r
	J1izhRIpPTQBp1EoMJyvFoCmPoM3smbFQnndme6IRJnzmyHrihGi
X-Gm-Gg: ASbGncuB3JOtmAvZhfTV+bAFz64D2ulK6Qw7L0IJHBaWkFgV/PZtAnd9wCx18hZE7wm
	qmdyKbV5Rxj+C0MZFC8Z0pcznnp/lVKi66b58IVvt8jMKetstCRWIZgSoyPC8RezvpI2D2XK8aq
	Q+PB5lu7RtF7MRjDu7uzx3DoLD5Ty59JWzRAx16U7+J84wOBZ7sBfSzuJcpBJwpG5ow0BqPabRT
	/FmTEb4Zx6mKDQMqL8ruF5XVvZ09APFYbt9CKgMxRWwszl5MWdjaw3263LItL8LJ2+jgWWZWeGq
	b3HIPI2yOyao12yEZDynIWSi4PNhnddlz4gHnzwW5PcAbkz45L6YHAAzM5eW1d0=
X-Google-Smtp-Source: AGHT+IHtf5ETBNi0g7KPKcGrpppl4GxmbE0GaRV9AigEcRMrHyTDtjao1tx6BacGw5smVf9EeZkAGg==
X-Received: by 2002:a17:90b:278e:b0:309:fd87:820e with SMTP id 98e67ed59e1d1-30aac1f04edmr5636711a91.26.1746633708633;
        Wed, 07 May 2025 09:01:48 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:47 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Wed,  7 May 2025 13:00:53 -0300
Message-Id: <20250507160056.11876-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This series of patches implement an API call to the SCU which will
return the power mode of a given resource (M core in this case) and if
it is already powered on, the driver will attach to it. This SCU API was
already being used inside pmdomain/imx/scu-pd.c driver, therefore it has
been moved to firmware/imx/misc.c so it can be accessed by imx_rproc
driver.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [1] and from a reported regression [2].

[1] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[2] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v2:
- Order of commits changed, now "firmware: imx: move get power mode
  function from scu-pd.c to misc.c" comes at first.
- Updated commit description of "remoteproc: imx_rproc: skip clock
  enable when M-core is managed by the SCU" as suggested by Peng.
- Removed "imx_rproc_is_on" function and dropped unnecessary include as
  suggested by Peng.
- Email corrected: peng.fan@oss.nxp.com -> peng.fan@nxp.com

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  firmware: imx: move get power mode function from scu-pd.c to misc.c
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 drivers/remoteproc/imx_rproc.c        | 17 ++++++++--
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 4 files changed, 77 insertions(+), 24 deletions(-)

-- 
2.39.5

