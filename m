Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724E11B5831
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930166; cv=none; b=fyKWXYmcdTrOSVyCjZNExhkrgm6mYJehHuhB5fVc5yIzlxJlyJHdsA2B8tRckiUhrSfx4gxa/TkdE+oMNfROcyeOhfRafZXI9z5w5udnrh/cfWBD1gX1VW6EC5nxA4S9PWMIakBeHW9jS4PSlXYLRcBqjDIQ/RBNJ70N3QPectI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930166; c=relaxed/simple;
	bh=l8NixztgWIE6hURcWOGsdtTyc1XZk7T3NapyOLeBVPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uP8JJoziE03+yVuu6dQDjR4KwBPxiVQs3bPwnmBHn4Gh4h42YbyDxG7rcUUSsPLr6yoGoqIHxAW6vHjnCrsnqYs+47rrRVTIUYP1lHrh7u6DV6VC9lu9I9sF3fGOADyeeAR4XsBmQLeCi9FbR9Sdz36RwLqB07VBhnmBFFPS3fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eLebawGA; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eLebawGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xse5U
	t/8KgzCgju3bJR074D18X2uH0iR3vw8nvx5xdk=; b=eLebawGAHosxhB2jaZuBU
	V2JC4/GKs0P23EeoVAlrUUguh9m2RylUqezH0O5sBPXRzxZOgKCJBA54/OOt62+N
	3nd3si6FBYnr3P83b/kemwj6H4BoZ8wIHrrTlifZdKBBKrIeNofFK6cmgNgkOtGl
	kQk6watj013fCTxwzR5/JQ=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S6;
	Tue, 02 Jul 2024 22:22:14 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.11
Date: Tue,  2 Jul 2024 22:21:53 +0800
Message-Id: <20240702142153.413061-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702142153.413061-1-shawnguo2@yeah.net>
References: <20240702142153.413061-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S6
X-Coremail-Antispam: 1Uf129KBjvJXoWrZry7Zr4DAFyrurW7KrykKrg_yoW8JF15pF
	13CwnrGr48JrWrGr42qF9F9FWrAwn7Jr4DJw1UJ34rWry7Z34UZr1DJ34xXFWUtr97GFW8
	J3WrGF1DKr1UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jniSdUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERYQZWZv-d8qowAAsQ

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.11

for you to fetch changes up to 3898bc187cde9ea6918d1a8a9c8e0b4f611674fd:

  arm64: defconfig: Enable the IWLWIFI driver (2024-06-27 18:38:49 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.11:

- Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
  imx_v6_v7_defconfig
- Enable RAM block device and IWLWIFI driver support in arm64 defconfig

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for TQMa7x/MBa7x

Dmitry Baryshkov (1):
      ARM: imx_v6_v7_defconfig: enable DRM_SII902X and DRM_DISPLAY_CONNECTOR

Fabio Estevam (2):
      arm64: defconfig: Enable RAM block device support
      arm64: defconfig: Enable the IWLWIFI driver

 arch/arm/configs/imx_v6_v7_defconfig | 7 +++++++
 arch/arm64/configs/defconfig         | 5 +++++
 2 files changed, 12 insertions(+)

