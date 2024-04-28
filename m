Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFCF6A348
	for <imx@lists.linux.dev>; Sun, 28 Apr 2024 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306400; cv=none; b=AZYuT2wu6s6dyZR79Uokw1cavmAs6wd3G33mO3AIzEUOcShDZt83kdEOhn1T46vIWzXvUVJyS1OTOsqC3Va1SOHXZG/q6dM7H05MCFGeYyJmMP6dsrY/8WW1PIK7E5q5Xg/AVIwDLusQxdpBJtzsAOMnvrOq6rSdfxDql4+gtlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306400; c=relaxed/simple;
	bh=YSPUm9E9Q7xKL7VRK1Xg04OMT4ubx/Pnq/sQkODBZ/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ESUm3HOpsPJWoBzr3GDr/89iJE71OTXqshlG7PAWNlSppD+025YC5vyaOWQuTUPKjG8pHzOeT+owp+MWd5wbi8H1TlamzS+TacL0j93740dV54sPKlgyjfktRIiXB0xZwlaaQtHLQl/a1yf/TUZkieTS6K7nlOVHx5RB2ItzK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=N2BWyN+c; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="N2BWyN+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FcsXD
	qrJPA6A/VZQFSKJ5uTbwhlGz8l67jd2Ww1Iqf8=; b=N2BWyN+c2WIDXTj0uARRy
	ljOus6MEmxK7sxaAxbqZAiiHuFGhlg8veWS3eC5zQaeBME/me+lG/YP0JCxkL4Ad
	tQn+0MYb/Jf7IpKp5yO1coyacRHMKrMqTKTzjT7mlCEYqK14j0XYqPLFrly+PG4j
	dcrdb3LSxMVslOk8I/kxYw=
Received: from localhost.localdomain (unknown [114.216.210.46])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v19HPS5mcJTNAw--.22534S6;
	Sun, 28 Apr 2024 20:12:58 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig changes for 6.10
Date: Sun, 28 Apr 2024 20:12:47 +0800
Message-Id: <20240428121247.10370-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
References: <20240428121247.10370-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrAD3v19HPS5mcJTNAw--.22534S6
X-Coremail-Antispam: 1Uf129KBjvJXoWrZryrKr47KrW3ZrW8GF45ZFb_yoW8Jr48pF
	9xCrnxJr48JFyUXrWUZryv9F48JwsrArnxXr1DJw1fArW7Z34UArnrKryxWryUJ3srGr40
	yr18KF1DKr1UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn_-PUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQrOZVszXcuKDAAAsU

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.10

for you to fetch changes up to da8fc156d76c3b4b4a49ef65cf6b5cd1767ff17e:

  ARM: imx_v6_v7_defconfig: Update ONBOARD_USB_HUB to ONBOAD_USB_DEV (2024-04-22 12:54:08 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.10:

- Enable DW HDMI bridge driver for i.MX8M Plus SoC in arm64 defconfig
- Enable ONBOAD_USB_DEV driver in imx_v6_v7_defconfig to support USB2514
  Hub found on imx6qdl-udoo board

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module

Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Select CONFIG_USB_ONBOARD_HUB
      ARM: imx_v6_v7_defconfig: Update ONBOARD_USB_HUB to ONBOAD_USB_DEV

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 1 +
 2 files changed, 2 insertions(+)

