Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F403D6484
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448832; cv=none; b=bYrQbzTv4oDdONI8B4K7Ly/z2vB95K6mn5HY739s7u3jEOPw9y0LoyCzutF2qmvb9Ri1E1PLGQjAJTFRzY7IP+eSDbRZc8kYXFrw2Vh63YUllfP9WDCOBxmujr9dGfHEHL77pSComQN0IgL0VLQlorGvZ6l7JW4OumpBqELW3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448832; c=relaxed/simple;
	bh=2dMtwqfr2ZGbuWNME1mjoFf1yb2LMAL7HBAwNxavaO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAZWQ22/TaASLuFUEBW3NE0cSNPFZpS3IYTb1DRSqF5oJc28RYZPw9tvaGIHW1/C63E0S+5xXz9SrjlZRUcMrqqFQDNg1hr/VrW68paWYbZSNdyPql8YTMzW+m7pz0DYoSenAcWQjiM9YPu+LFhC8yQZcXGzAqCo+yL6yNvTFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpM5/xZL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpM5/xZL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso40302925e9.3
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448828; x=1780053628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=UpM5/xZLoPPox3qfe4c9QTDyuQr4nFd/WYHLJRk0OGru8VGl29I20Hqik6B4nSyA4D
         okvnGEbGn4C7qLcMfM0YS9hT+LiY/wbk0UM84jQ2V1baBOVCgL1Mn6tCol2v93sCuFgo
         6qRHSd8XAzq2+irD9XfKtc2sbhCInnJ5SG6yOkSRnp7cjJzAd6k/cIu+WFGCeYreXk7Y
         eHdh9aBFjCMvQ2t1O2qDiOabEtpnSd8c3qDsnlUXLwxKLqmZi3F9QF+vK8SvDc+ZsQ1O
         8wpBAUGkVf0t7grTth2dNAytmrIZqcX8L+F6iFZCJx80F458bGcEH7DXo5Hel6+3K08e
         qvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448828; x=1780053628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwywBvEJpsm1f+bVDJtLQZjSntFIsWCaI5FtaThXLqY=;
        b=MEAsJ3rS6kWL0IYPT6xGtAIIXvm+3BvoxYCB24hka59ySODKLK1UCOPnif47Lxm+ug
         B923E7q/yQ3FXebQiaoiwUxTRruDL0N+L7dSeevZSmGgFDKLL4PujBLIw9jDnCSQa9Az
         08SGmr20PGwwDbVZrvxouBTsCn1PfzwtwOqO3TXJpgtFodEHfncDmMFsIgz4qRy4da2v
         0/FrzbDcz4gx2hYsX/AXH5kN1p9etTDS4papyjbjyD88THfqw/olPpDKnv2WXdOGr5dt
         3b4pFUVS+dZmL2HnzwOWitj4Ya/u5yCivgxHWNeK1wCGw8XxzfyUzmfVf67k8ttsav0M
         6wkw==
X-Forwarded-Encrypted: i=1; AFNElJ8Su7AO9uRFGWUyUJmBHi2HLRmIfTsEPjtwGwnMUrpc/P4bs0BNWvwbGsfidH6PRDywFXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDhYTPZS+bEHXyAT2NydHImmBL6/MHrqJdtp+dTc8mHHFBu6n4
	yaxWYmlor3abxRWsaGvDi6UxgzD476ZtHPN7vszCPkKhBekNAfG0I2EJ
X-Gm-Gg: Acq92OFfNcpygG+6gjZ+RuH7O8loA0ryjX1VFoohqRrqrCre6zwJAgDsB/P+kwu3bfb
	u9bFOMmOW3LrfxX95LA6u3hgmbLG9nI2YXgKv0P8JbgiUiomKH7XTwvbAvdh9midN+gxQvjclCo
	L3p8zERgUR9bxmnCCl2sToDqJhAyshrmifuTdxvAT2Gh2hq8rPwzueXwsyYwxZ+TH0aTNXZ7qf7
	wcFpxxx9JJpUxIVZmitXJeB7lFetBhd8CKHiRxcJjO8GiqLH/6RU026GfTq9mSJ36scRk+4v6nc
	7cLgh+opcTUhEUhKp+lzdzZ7TGCh6acjQ4fdfZUWvTIA4UXIh1NqMC318vL9lI0/FttR8JNDpqy
	AqVYd31kYZIg9ntYCH7am+rdsfcu4u1MfW/uV6K2mRJAw2l+hwmnCK/CyM07wnn6z8kvp+6Fhjf
	ykjjhWr+EQSXIfoxUIFShoIaiC6HunG0jGjjrQ8q5xwim4ShSN1wuoUggJS3zo
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr37709105e9.24.1779448828096;
        Fri, 22 May 2026 04:20:28 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri, 22 May 2026 04:18:44 -0700
Message-ID: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

Laurentiu Mihalcea (5):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
  arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  8 +++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  7 ++
 drivers/remoteproc/imx_rproc.c                |  7 +-
 drivers/remoteproc/imx_rproc.h                | 19 ++++++
 8 files changed, 113 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0

