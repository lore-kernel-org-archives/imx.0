Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F73613B791
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710890; cv=none; b=YyO8CqHGcyiQ9stejq2fdDD6DII/0YMH8Uo7ZUgmEeZXimI5Pd7njfTnnVGNqKI8b5pZaSBFm9SG4tib1kyHOBygCim4P0yRkxn/bPY8D7XNSmc2+N6ig/qVhShSFfu4bGjmEfuqhz28GKbF3u9zq0IAC3zCKuXHuBAKsr2Lq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710890; c=relaxed/simple;
	bh=PjIi21dI7IqV97t2BSWH70bIxiticHqWnOYuq4P1Ndc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D29U3wZTdn1j/UwxdonxnjoqXIskXB5EdnHchsY+v9/j1btdloT2Lhd8eIfAJ/ShtLMgYkoizJCZ2OaKpFX6vfTzJYkn1066PWAsJYlcrfXPV3apMp8X07eZGOL57UHeOdg5SiS3GOpfpdL5WCqtOJA5SEOsUZvAmbQ+d43NFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Hy3jQy+V; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Hy3jQy+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aIFOG
	sqEil/CZqwfy0ewPkNvhV31ePBcClT4E1DSKDw=; b=Hy3jQy+VOTyMsA3Hcxfm1
	ORovaENGXHd3E7tV/etgx7o/z1bkCAqDQR6NW9MSJcFqYz8kEoJwWtJAobonHDlQ
	Py3jMR0d3mavafy5/y6LdzbHRwfgteBLrVJa8jOpJmn8kNXOgIbGUHAxvv+ICchU
	inT76/lNDp/LsnFwQixgds=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S7;
	Mon, 04 Nov 2024 17:01:03 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig changes for 6.13
Date: Mon,  4 Nov 2024 17:00:55 +0800
Message-Id: <20241104090055.1881860-6-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWfKwc_AF
	yxJ3WUGr4UJryDGF1xZ3WxZr4UKw17JFy5Zw1UtrW3uF1ayr1jy34UXrWfZr1DX3WkJrsr
	ArWDJw1DAr17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxGNZWcoYr+P7gAAsB

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.13

for you to fetch changes up to 0fd75ba1750318cd824713d43f2480159c2a54aa:

  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E (2024-11-04 15:15:57 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.13:

- Enable BD71828 regulator and NXPUART Bluetooth driver support in
  imx_v6_v7_defconfig (needed by Kobo Clara 2E device)

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

