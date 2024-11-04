Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419174C81
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710882; cv=none; b=p43acEbWboZTCQ4tIa28d3POmCuy2RvuEeACL3pSN8qvLPNPyL+yWYcIiDXR5v5eWrLb5DOLV1xekao7PdkiDAs8yOFZjFbJnraj6eWGFmRSSClBrtjWiQFWlUq9gk+l81TkB3yPVIVwrI3gdqOgL0UdTfr6fT2LpYy3cUV+H34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710882; c=relaxed/simple;
	bh=TIwaCV90E0dYwJQtuESnJH+EQuk3RGMc4yJGVe0mNOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IgzHIj3tM/ZNLqL+B6Si8bZEEHEi/sBIPQxeJp+EorO+NEgC1Dl8L0jmcNNbNsnC77yODlhpP8mfTKRlJoVtDxzgbVFoEl2kXe4XmiJgJ4bNBPT9sp/61RlX2RpTvdNnJkROqCpiFEtitXIo7RTE4baZUjtPskjShBnSpjRXv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eLM8If5E; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eLM8If5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XcJwa
	whZqRXPK0DRxITSYDPbNUWw2cWbdM0jDz0Es4I=; b=eLM8If5EJ/YNb5Puu9fgB
	kTFUC1l9Wys78gSJaByD8OUdPVrTO/9gkGSUaLdYHXB2TllLif78zRsCGp25A3m4
	fFW3YE+8PqAd1s3rm8ztUYm7Uh0m2EUcj/ySXNiLxcV1syN80y1+eWXIdlsuavqP
	IuqGtBtBOTlEur+yx9wwHU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S2;
	Mon, 04 Nov 2024 17:01:00 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers changes for 6.13
Date: Mon,  4 Nov 2024 17:00:50 +0800
Message-Id: <20241104090055.1881860-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWkXFb_Ca
	y7Xa48Gw4UGF15Ja4UGFyxZr9rKr4xGr18X3WUtrW5Jr47Ar1UJF1Yqr48Xr1DXF1rGF1D
	Cr1UJr18AryUGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8x-PUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAyNZWcoXw6YrQAAsL

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.13

for you to fetch changes up to 22b03a4e957e462b380a982759ccf0f6554735d3:

  soc: imx8m: Use devm_* to simplify probe failure handling (2024-10-18 11:13:53 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.13:

- A series from Marek Vasut to probe soc-imx8m as platform driver,
  so that it works properly with 'driver_async_probe' kernel parameter.

----------------------------------------------------------------
Marek Vasut (3):
      soc: imx8m: Probe the SoC driver as platform driver
      soc: imx8m: Remove global soc_uid
      soc: imx8m: Use devm_* to simplify probe failure handling

 drivers/soc/imx/soc-imx8m.c | 174 +++++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 73 deletions(-)

