Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085C149C6F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768871756; cv=none; b=Jow5ZkrWPRyxK4iu1dgjNqEEBjvY3hubuEraoWGw8NwYeP2dadXtrf6PN+ScKBjs+wbr7rnHXVgrTwJaghO6pRR4XjnA27IzGwj4BiJgaMlvzaguFFhvNFwb4zZ464MaEN2Hwa+KLou/uDJNxkLh+X4glQvbxlL3Sy5Lv0q68/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768871756; c=relaxed/simple;
	bh=o0oXBCVV2SpJMJnoQ4BpRli8whR8Nit+hZ8j9Qxj0FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvmZlJ11GcJgh0MQE2CroxacmB3g278CmaJtGU/ZQMF5M8YUzQiPD9Xz6vFmC8oMudP3OHLCUBr7H5IRcBuvpmQN3VudSU2473O84pHsViGj19ia++iRD5Up4G+B5aVL5VyBDwoIzlSipy8uz6QjCgqY3QDsEpXpYqhtxIstPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SXL722zH; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SXL722zH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KD
	icVZ7+7t9v0RuKAuweKQSHOQ5r+Rlc3JjduC17lDo=; b=SXL722zHwRlSZiWMH5
	oxfgAyFZfsLtXiBL1w8K5b3D3nSZs8DMipqBQJNsajN+qjBUho1SZy4iJ6CPTNeM
	PDVq+oc5F4mH5ZDSu2eeZq+wH8qCsqqY2+g90qwrDLFFd7OLbjh5uTWzmKn72Ugu
	eEZrlTcKGB3DH8lXrOoV9flKw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S6;
	Tue, 20 Jan 2026 09:12:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig changes for 6.20
Date: Tue, 20 Jan 2026 09:12:18 +0800
Message-ID: <20260120011221.4387-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3_+V71m5pGbEbAg--.16504S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4rZr48KryfXr47Jwb_yoW8Wr1UpF
	4akrnxtr48WFyrtrWUJFWv9r4xtFnrAr1fXrWUtw1rArsrua4UA3WDKryfXFWUJr9rKr4U
	Ary8KF1DtF1DJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5YFAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwDLMWlu1oBbjgAA3J

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.20

for you to fetch changes up to 42832d01c6114cf503a01983ff4e2512dad926fe:

  ARM: imx_v4_v5_defconfig: update for v6.19-rc1 (2026-01-17 13:59:36 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.20:

- A couple of changes from Alexander Stein and Andreas Kemnade to enable
  SND_SOC_FSL_ASOC_CARD and REGULATOR_FP9931 in imx_v6_v7_defconfig
- A change from Dmitry Baryshkov to enable DA9052 and MC13XXX in
  multi_v7_defconfig
- A change from Josua Mayer to refresh imx_v4_v5_defconfig by removing
  stale options and adding missing ones

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: Configure CONFIG_SND_SOC_FSL_ASOC_CARD as module

Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

Dmitry Baryshkov (1):
      ARM: multi_v7_defconfig: enable DA9052 and MC13XXX

Josua Mayer (1):
      ARM: imx_v4_v5_defconfig: update for v6.19-rc1

 arch/arm/configs/imx_v4_v5_defconfig | 12 ++----------
 arch/arm/configs/imx_v6_v7_defconfig |  3 ++-
 arch/arm/configs/multi_v7_defconfig  |  4 ++++
 3 files changed, 8 insertions(+), 11 deletions(-)

