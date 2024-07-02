Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD78815B13B
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930167; cv=none; b=BQ0n0Q+9HTWGwkb49TCXreeFXVpZQyU6j5UDvWV8K7JOjtMbvvNP8VC9LnwJ6LAVDXZi4Fk8OLQU5KwrjkqBsJMGPa1zZbNqtI0bdj2RnnHOiveaYd4NBhauT7eUyCbo00RcJwinMa899wnT3epl4ZZ71WPJ24xBlVz6kPsmlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930167; c=relaxed/simple;
	bh=0X5CZodU8o5IhrUb41RQ0XsLkLzK6IgEQHNj60d7DHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FMZxpLdcXyEVQ2SAyt+DjCg2fiIDuIxkWLByPnAnrHfJR7EqpABEXZzOYGVtIfNKBZ3vYIdMA/xGYW3GWQy7u3pkc25IR+8AM4hLOR8Ssv+yWoY2dTNzvOTn5RAR24hnlNzTzd+Gcfb8IedCs3p9OGCAke3w5Yh8HtdmAEOsXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EUNwOHyU; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EUNwOHyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fJGOS
	gdVp0Hn/2898k6m+f1wBA96bh0G9Zwp20Yi6ho=; b=EUNwOHyUIBEi1i5xCFb8P
	zw5QUIUlxIrtQg2OXZvHashbCj8xYAhyCNBuvYsTh4yslzF/28pFNc62p8vbxrxl
	i/nIzpj65VZmy4n6OEqk5BpmVJk5/4YWNfKXvzj+1xaEpd94x626OHZtn9SLstVW
	jMludpC3PXldNrDD4zVjcM=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S2;
	Tue, 02 Jul 2024 22:22:12 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX SoC change for 6.11
Date: Tue,  2 Jul 2024 22:21:49 +0800
Message-Id: <20240702142153.413061-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7Zr4DAFyrurW7KrykKrg_yoWfXwc_Ga
	4xJa18Jr4UJFyUAw15WrykAF1UtF1UJFy7Jw1Dtr4UJwnrtw1UA3sxXr4UXw1qq3WxGryD
	Ar4UJr1UCw15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBQQZWZqrzOkwAAAsR

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.11

for you to fetch changes up to e2106e6ad20e495ce59e552748330d2749070ee6:

  arm64: layerscape: remove redundant EDAC_SUPPORT selection (2024-06-03 09:58:30 +0800)

----------------------------------------------------------------
i.MX SoC change for 6.11:

- Remove redundant EDAC_SUPPORT selection from ARCH_LAYERSCAPE

----------------------------------------------------------------
Baruch Siach (1):
      arm64: layerscape: remove redundant EDAC_SUPPORT selection

 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

