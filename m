Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB641B7E2
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708918982; cv=none; b=gBY2Tt75NFpS1Hk2MnzPd9BMhv6MASRJdabwG3eXSY3uCUcBxDX7NrUIuL+6Gwoge5Vo8HxN9giUKGraptgB+Rm8iU1o1gjox0hPjFtYW5N2jtdFBQu1W8ZGziRm8Cr+0XV5D2ZDndAK03em5Aev7lF03DIsT6Dlh2IrC6Hh/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708918982; c=relaxed/simple;
	bh=4hERVO8WQzkAFDpdtPoiKnAwhqZWJEeG+rg8joCqOMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C0Ozac5P/dG4RsyGUVresHz8/BGV0zTD4dKmgPWQ0Z3ziTCQKH7vHva/LcldG9jnDlAFnJJLdBRL3ohXJBuZ9vUCB3AXhRFYN0bA1izZeoPgWHlvVEUpQZEPkJS3WQI/8y4d8l8GXZ8eF0l1pl2htXlK8Vk25TxlAULH4x2vGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Py64c8fi; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Py64c8fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WCVo5
	MuHl/wvlVWvwzWYEKtaMEK03ZJXtafReRrrmC0=; b=Py64c8fixS5Yq8WYIsJNQ
	g3Kb/Ox954oGeJSj3XIlNMzply37EVWxBrpUDYHNyYVMSgirwa4kpiwqlUTArxys
	BVB22cAKVNuZ2l9sp/OnMK6SQUFROlQsOArzABMMGBOWhFWglgOmMTrfHksSNPyV
	ZCZAOrR+EwkFi8MHubypB4=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S6;
	Mon, 26 Feb 2024 11:42:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig for 6.9
Date: Mon, 26 Feb 2024 11:41:46 +0800
Message-Id: <20240226034147.233993-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
References: <20240226034147.233993-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrKry8Ww4rur43uw1fXrb_yoWkuwb_AF
	y7G3WDWrWUurWxG3Wa93WfJrWUK3WxJ34UJr1UtrZxWw42qr1UJ3y8XFWrWr18X3W5Gr9F
	yrWDA3WDAr4jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU09ID5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQiQZVsVCUT1-QAAsz

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.9

for you to fetch changes up to f1a9ff95971a879572f56bbc8b1e1ca0b1a812b8:

  arm64: defconfig: enable i.MX8MP ldb bridge (2024-02-06 18:34:58 +0800)

----------------------------------------------------------------
i.MX defconfig for 6.9:

- Enable VF610 GPIO driver for both arm64 and i.MX ARM defconfig.
- Enable i.MX8MP LDB bridge and i.MX8QXP support drivers in arm64
  defconfig.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable i.MX8QXP device drivers

Martin Kaiser (2):
      ARM: imx_v6_v7_defconfig: enable the vf610 gpio driver
      arm64: defconfig: enable the vf610 gpio driver

Yannic Moog (1):
      arm64: defconfig: enable i.MX8MP ldb bridge

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 8 ++++++++
 2 files changed, 9 insertions(+)

