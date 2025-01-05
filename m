Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDFE144304
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070734; cv=none; b=h2TpqFFuAk3hB3jkf0AqHXnqkPw2LiIGzWj0YUKCKkGY/m1wepR4RsDpk/IDpg1dc1jxuDefP2N7sH37WNysRjX4YlOmYgP5E98iChEDrO6IR4Leom8/PByTsmBMuEjdR2UAIKvvK1HnGKgtzjHM4BWQLfdf3zDTHI+CIPNGtuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070734; c=relaxed/simple;
	bh=zCsB99Kol/SqL+CCZCUnDvI/M+vNIrE+qLCy82bMk2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N8BeFbxQ1+tLgD7R/ZKr29M7EKBT6SCKCybmFCZOqFJVXQcDFHL0W8Iskm6dL6t/s09oY3bYJkRBooB+ZKKW8pa84DHQNMf1tg85YNDlOvzJ7lvODdsPbBnCNDjSJXQDmf6Ay7sRTv8iTTU+NFBIRVCNcuQcqY5/VZj3ld0uS+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fLxZ+zBg; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fLxZ+zBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CRzs+
	lBteckHuBiMPASLvCpYpP9+LhqXWoobnD31UvA=; b=fLxZ+zBgWI8P5hD4HoLHb
	L5eywEIW7d9KwzWNkGKdUwNJB0icGlTyO9CA0RMDZSenBydCrZJCMrjfhqlRzKZj
	KqAbOgYeho959U8FNi6cM+8+vUTHchg8VF7kFyqvlaYORy/ACHNTUKUz/HVK+e7j
	Z4EmkgBf41TRNUJc/Qoil0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S2;
	Sun, 05 Jan 2025 17:51:43 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.14
Date: Sun,  5 Jan 2025 17:51:34 +0800
Message-Id: <20250105095139.714590-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWDJwc_CF
	y8Xa4UJryUJF17Ja45Cr10vryjyF47Jr97AF18KrWUJr47Jr15JF18Xr4xXr1DXr1UJF1D
	Jr1UXr18Ar4UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbc4S5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAjLZWd6TKsXngAAsR

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.14

for you to fetch changes up to 0b4dc35529f87d99fca91b259d50f54613bf9ec0:

  soc: imx: Add SoC device register for i.MX9 (2024-12-09 20:31:39 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.14:

- Add a SoC driver for i.MX9 (Alice Guo)

----------------------------------------------------------------
alice.guo (1):
      soc: imx: Add SoC device register for i.MX9

 drivers/soc/imx/Makefile   |   2 +-
 drivers/soc/imx/soc-imx9.c | 128 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/imx/soc-imx9.c

