Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E162837D
	for <imx@lists.linux.dev>; Tue,  9 Jul 2024 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720488387; cv=none; b=rgF4RGOaFX1jt0S90NfpWABK1xD/Uq/b58//CDnaF12djGcummdRBRSISuGf2wjrXulA0Uwrc/M0pi/TcvoUd0nYOTbF5+d1r4YN6rUG4jhzuSOWgt2YkkMpSEPjakyYNnGpZ+ai/020YO8MEv541oQyxGfpCy90+7IyJltv9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720488387; c=relaxed/simple;
	bh=aCelitde5WSfD7OWo7F+CE4VhDTsTYIIExGV4KA6QKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQbonFya1C7JEkt0Qeh6dRhBnDRcRxPwDx/lDONGD2kn0CPL+XPZx+9xrhrIU1euBB69lvR1oDXjcJhVusI+1BfpETrCS8TepBzKcvfHQIWjhDJl15nTd9wOS1QrtgkV+1bm3nOHnFzH6dn7+hhdF4MSWqBztp/RCnl9BTgTrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k1wWxPJC; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k1wWxPJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=AEUWH
	4plKaCEPOBgp5vOEnmyE7XmaClMjVAFu1RppSc=; b=k1wWxPJCurQKWZYYVd6OH
	3yZpNxdu66frPNIWM2zGeZGQJD+QOqI3Ms9LzLvuCq43VSHfv9TuUiXtk3n1dumE
	5SEs/fDEwjLU0MJXtxZxOAZ8Vnh4JTKapdaQgrG/IlnioDA0zKrASzeVSbJxmNmA
	RE2fCKqYPU2FRrMQ3Tp0WU=
Received: from localhost.localdomain (unknown [117.62.10.72])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHrSWZkYxmRP93AA--.24850S2;
	Tue, 09 Jul 2024 09:25:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 5/5] i.MX defconfig change for 6.11
Date: Tue,  9 Jul 2024 09:25:34 +0800
Message-Id: <20240709012534.3106441-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgCHrSWZkYxmRP93AA--.24850S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr4UXr1kCrykCw47Cr1rZwb_yoW8JF1kpF
	W3urnxGr48JFWrGr47XF9F9a4rAwsrJr15Jr1UJw1rXry7A34UXr1Ut34xWFWUtr92gFW8
	tF18GF1DKr1UJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq0PhUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRoXZWZv-fa7AAAAsY

From: Shawn Guo <shawnguo@kernel.org>

Changes for v2:
- Drop the commit that enables RAM block device for arm64 defconfig


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.11

for you to fetch changes up to 465830ad25346aa7945e8e0ac5b8ca7d53217043:

  arm64: defconfig: Enable the IWLWIFI driver (2024-07-09 09:18:05 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.11:

- Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
  imx_v6_v7_defconfig
- Enable IWLWIFI driver support in arm64 defconfig

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for TQMa7x/MBa7x

Dmitry Baryshkov (1):
      ARM: imx_v6_v7_defconfig: enable DRM_SII902X and DRM_DISPLAY_CONNECTOR

Fabio Estevam (1):
      arm64: defconfig: Enable the IWLWIFI driver

 arch/arm/configs/imx_v6_v7_defconfig | 7 +++++++
 arch/arm64/configs/defconfig         | 3 +++
 2 files changed, 10 insertions(+)

