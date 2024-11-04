Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045D513B791
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710888; cv=none; b=CZPMb/mzt/QEXj0aHzEP220LL8mwK3eWw2+8Uu1HEwbC4uOY5D/Vc8uXvxP87UziLs2heqF6tYn+DixeU8Cz/wAiPT8LB9iu1XvXvboofiMUxTdFEr99Y5t8UiWfRReGloK2XLwvIAH+2iu3XRkWbIJssGjZNVs8peWUCPDXB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710888; c=relaxed/simple;
	bh=r2MhxC/RYOvZw8OIZCSWqckp6Z1WPCLvCDZ2A76c8rI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fIn/Aimfrdj22z1oRt2YdsdwOD8AjPDh8R/u36s23gZW7UdDcmfKcL+zMsyoQg0kgv3XMliLCqyrbVFpjbmTMtAJNdL0ToeMxO52d0OUTsv+J06jCyZ1Yh+5lB1wV/guylLqGeMB8x4GTKqOPCXdoc+Btgcls6YkO7duTX0SW8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lLx1PfYI; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lLx1PfYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4BIpb
	+v3eh6pvQ7d5fboR2TzVrjCAnUYmOKQ46yHwEA=; b=lLx1PfYIlqNfRm4AwVm1d
	agbBfEUkshIQIk1F347NR+Bps5my5C1pvJsinjiSP62eIP90MgyH/OmD01YlR9Ve
	ZdaPeePIWfaiNKMaS+CiHqY41ZRVz347U4yt9LXoojlSTkfBH+PnNJfyTuVHwRqs
	UkckpzRXr5E8ZKj6mLUS5w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S3;
	Mon, 04 Nov 2024 17:01:01 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC changes for 6.13
Date: Mon,  4 Nov 2024 17:00:51 +0800
Message-Id: <20241104090055.1881860-2-shawnguo2@yeah.net>
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
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWfXrc_Xa
	47J3W8Jr1UCr1jy3WxGr4UXFn2qr17Gry7Zw1ktF47Jr17tw1Utr1DJrW7Xw1UXF18ArWD
	Ar47Jw1DAr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xgA7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgeNZWcocJlogwAAsg

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.13

for you to fetch changes up to 2f76989999a7434e95fabf7d9d9f9449f746c827:

  ARM: imx: Switch to new sys-off handler API (2024-10-22 09:25:30 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.13:

- A change from Andrew Davis to convert i.MX6 PM code to use new
  sys-off API

----------------------------------------------------------------
Andrew Davis (1):
      ARM: imx: Switch to new sys-off handler API

 arch/arm/mach-imx/pm-imx6.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

