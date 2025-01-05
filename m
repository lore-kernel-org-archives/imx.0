Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A854F4642D
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070737; cv=none; b=Q5S1F12zCE4QMCFGUn/AdZHxRq9+Ae3WoYIvYhvWClSPWTW+1DFkmkjqgxk0arVIKvY7TLatvy22+kn0nT6iTztFURJQ/jTEYk55mEWzTW/TFlhFH/x5G0N6it+bcvtP9f0LZM0p20a5vIcmEX4Wo86E2EF7H8IjTmXtWvJXfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070737; c=relaxed/simple;
	bh=/Sh5KOE59Aui8PfGjqhIZobjeZ/zYvSj9HOW+x5WOFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYD60OWIUI39bZimKS0ywYBWMyg3HLlrqOvQCXE8ZEeSjmAzyKR650809wnax5nDiR/UKbES8mhcXfUuquYc27jZKFjkkDX0zzBp6WBrUjs9LqcGL0RW6foClPpwPtmtZqEuF3CPMggA33xuTUl86/MEE+NkcwrqTVJDmtaG83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=p+4mRzd3; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="p+4mRzd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LsIb6
	OZ4T07vFbCXdxpznnWsqzl75iiZFjf5L5ekvZg=; b=p+4mRzd3s/Fm8HKUSzUuK
	99kyU1m3r5gYrDTwEBnqhBbpmsA5px5fvSxKj+qC6ebdGV1AolJh0TSXfjnBVNiM
	A7o2MrNfeIdMtQkyhJ7uDt59VfvxFhlXr15zrNeg+ACcUcwI9IlKEkFx4gHbn73O
	O/Zhnmsvi+cyeRGzXL3wfU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S6;
	Sun, 05 Jan 2025 17:51:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.14
Date: Sun,  5 Jan 2025 17:51:38 +0800
Message-Id: <20250105095139.714590-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWkJrX_AF
	y7Ga4DGrn8CrWUGF15Xwn7Gr4UKF1UX3WUJr1UtrW3Xr1aq3W5Aw18XrWfXr1UX3W8Gr1D
	ArZ8Aw1DAr1UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8TGQDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxnLZWd6UukIDwAAsd

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.14

for you to fetch changes up to 2b21c2306a9006e401c1ee3c694ecd327de4dc16:

  arm64: defconfig: Enable ITE IT6263 driver (2024-12-09 19:51:03 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.14:

- Enable JC42 temperature sensor driver support in imx_v6_v7_defconfig
  (Alexander Stein)
- Enable ITE IT6263 LVDS to HDMI converter driver support in arm64
  defconfig (Liu Ying)

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Liu Ying (1):
      arm64: defconfig: Enable ITE IT6263 driver

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 1 +
 2 files changed, 2 insertions(+)

