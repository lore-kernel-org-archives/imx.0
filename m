Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1F229402
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460557; cv=none; b=qnUElYnidvEeMblSMNkvqSoDunFaQpl9J0bDcQTXGls1ZS9g9Xi8Xi9xpEx2GwP2TXvu38XaYnJFqBoMCLjp3H8eW/EQ93bkgVU4JpEE/b045sV4hMHtoCMk+j0kM+ToHMo8/iPJ9WtWbfhTuWow6Q3ibmFRsLPreYM2x4sy4Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460557; c=relaxed/simple;
	bh=c7RuVoU1X+GqJbSlqUoZ/JUtLpp2/yrXlG7mBaDXkdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C33CPmXnuoSgK2hwb6Ztc7d19DNc0xavDs282uTmIma/jkAzByDEwdamZ9fPWe+e8T6MyA47EgGii/33x3KKKmipXA9zjdK9ounoCzOmRO7NgoxCviykF2VCgDw3BvGV21qEJvu6ghFJ5iOHKYJatiJMIZlg70NBZwPPCbivdWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dg8YdzT2; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dg8YdzT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hDOXS
	cFcU0Sau6VzH8T3ZGln0E1JuqZRxY9ENQWOuu0=; b=dg8YdzT2lhNDpjva/t1c8
	I6K+RlfmPKIjN9eJ7OFZC/eFug3WFMYixxRzEImd6dmL9d4O590z+zwbaWpC9vfQ
	UTUBimK+HU2rEZ/G95ooywltDYMlxe00u+WQMfJeNAovCnC6vqyyW/eCYaQgxkKr
	/PjT6qCSWPnfCEI/cDxAkM=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S3;
	Wed, 04 Sep 2024 22:34:46 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC changes for 6.12
Date: Wed,  4 Sep 2024 22:34:35 +0800
Message-Id: <20240904143439.211552-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWkKrc_ZF
	y3X3W8Jr4UGF1UA3WUKw10qr4Utr48JFy8Zryktw42vr1xJr1UA34ktr4xXw1UWa1SyrW5
	Ar4DJw1Yyw15GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAghQZWbYQht0KQAAsF

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.12

for you to fetch changes up to 1ec2362084a013df4d78cbfd3228e8c254a67cac:

  ARM: imx: Annotate imx7d_enet_init() as __init (2024-09-01 15:36:35 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.12:

- One cleanup from Fabio Estevam to remove Ethernet refclock setting
  from i.MX6SX machine code
- One change from Nathan Chancellor that annotates imx7d_enet_init() as
  __init to clears up a section mismatch seen with the recent LLVM

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: mach-imx: imx6sx: Remove Ethernet refclock setting

Nathan Chancellor (1):
      ARM: imx: Annotate imx7d_enet_init() as __init

 arch/arm/mach-imx/mach-imx6sx.c | 22 ----------------------
 arch/arm/mach-imx/mach-imx7d.c  |  2 +-
 2 files changed, 1 insertion(+), 23 deletions(-)

