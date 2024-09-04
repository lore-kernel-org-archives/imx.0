Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56011D014A
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460562; cv=none; b=s4pn66yzc4CuJB4vzfE6bAKApkmoxQaFSRQEQlvCO1jH00QsrfAHyS8HEPzXk35ggCCIx7mW03YsWg2Rv9W693hz4YZQnEON69vJBOsuaWKv153Wl9/9DfsUZrkl+Kv6E7dPD9lociLmfXnkjO3IaZzwwx/n7s4ECl7i2Vm6tco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460562; c=relaxed/simple;
	bh=1zdJAs/Kk2s4heEfVt6+7Pk4A7x+yyR4CnoueKYfI4I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GEbWFm9fEcVIATKwDzjYu/QBFsdG1nesJYNgmeNISnMlhrh2GH/WrCNoy1Me/HbtNZUZIvM1AFynT978VZhNVsYtjzMd+WJqvAOsC/gvukSt/C1g5ordeNssb0HJJhhu4h4ZBzCSq9GBWkZM4/+v5Oh6hgrcGQp+6k/2IUdPakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CPIvN9ER; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CPIvN9ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9Shld
	YABk7P9h7k+h/BdEml5vDW3mZPuaLgYSHkG1LQ=; b=CPIvN9ERusO+2WE0TU33B
	o5nPJ2QVSDsf2AO1OPc/u5q5FolKP5KRDQhdeSn+nC1ZgekjQ2Ssm/6LGZooYX4E
	u3jE6JomgTufOuZynI/csqnCXOu3NG1YvTVDwWo37ckycKDI/EiaGhh+ZQw+l0ik
	vDdy5lLzmx4UWeCXHj0hV0=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S2;
	Wed, 04 Sep 2024 22:34:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers changes for 6.12
Date: Wed,  4 Sep 2024 22:34:34 +0800
Message-Id: <20240904143439.211552-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWDZFg_CF
	9aqF1DWr4UWw18J3WjqF18ZryUKw1UGryxXr18trW3Jr17Jr15Jw4vqrWSvr1UWa1akrWk
	Ar4DJr1kJr18JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Ta0PUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQxQZWbYQmJWcgABsT

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.12

for you to fetch changes up to 2ea2113b3dacf9cf616488f875f32584dad53ff8:

  bus: imx-weim: change to use devm_clk_get_enabled() helper (2024-09-01 17:06:33 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.12:

- A couple of imx-weim bus driver changes from Wu Bo to support compile
  test and use devm_clk_get_enabled() helper to clean up code a bit

----------------------------------------------------------------
Wu Bo (2):
      bus: imx-weim: support compile test
      bus: imx-weim: change to use devm_clk_get_enabled() helper

 drivers/bus/Kconfig    |  2 +-
 drivers/bus/imx-weim.c | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

