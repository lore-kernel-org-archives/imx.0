Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7820330
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942781; cv=none; b=jzRHoURVrQspIoHJu2yGxjqi+lzJtMIFTsZOKHxNKRzZYm8kOVEQ9ZAuvUFIzaf8lJ+RYCG2ib/M4L5t5Bq29wlZ/SJPsuLzhk/23rxwbR53sHXqIN3VjcOSG2CuHhXffmA9rIlO7b0nlj24SgbqhJiWncy5TcPrc7+CcHlHSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942781; c=relaxed/simple;
	bh=9gWw9tyT8O6qVpCACpO7+QWbmBBtMx+BEE21Amb4hug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDOdhWh9uu1K7TASqVgEmV20Q8AxpsFUnSf9aNnehyRZHg4cWQyrFp+q982XOEeBxc9uYGadR5PYWAsMpo6vX5e4ESguVBqf/d+u8/utSxwLWZ6HjgFAxV++SMEeJNC6rXGjqqufpY4R1Z+HUc0YGr8mOJlB5Vt+PHLFaVWCaj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oO/hVWnI; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oO/hVWnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RS
	ZSUZzz67f8nXzkxgI75wygo74ieW0HfCiXHJnTBJo=; b=oO/hVWnIJORk4vrZBD
	HnL5vzktDx94LyiwgCW/GlzHXTaSRBu3cuFDE35ITkTHUoh/1xylfxURxxgQXPje
	aRaAgoMEkiT6zL1ic9Bm2vw2RXpxOLkrLGPR47L1837WLBuQbjpfztmSl6rCqwnm
	kwK26uNf7MePMcowcN6VQjmEQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S5;
	Mon, 15 Sep 2025 21:25:50 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] i.MX defconfig change for 6.18
Date: Mon, 15 Sep 2025 21:25:31 +0800
Message-ID: <20250915132535.253859-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915132535.253859-1-shawnguo2@yeah.net>
References: <20250915132535.253859-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnjyTaE8ho5MiXBA--.47709S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7Gr1kKr4fuF47Zw4DXFb_yoWfKrc_GF
	y7J3WkJr1UAryUGw1UZanrAr4UKw1UJ348Jr1FqF4fWr13tw1UJ3W8XF4rWF1kX3WjgryD
	Cr4DAwn0yr1UGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0WUDPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNx5IrWjIE94DbAAA3O

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.18

for you to fetch changes up to 8b3ce9541129c93958271cc6f6963742f1db0fe7:

  arm64: defconfig: Enable Marvell WiFi-Ex USB driver (2025-09-11 09:12:54 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.18:

- Enable i.MX91 pinctrl driver and Marvell WiFi-Ex USB driver in arm64
  defconfig

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable Marvell WiFi-Ex USB driver

Joy Zou (1):
      arm64: defconfig: enable i.MX91 pinctrl

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

