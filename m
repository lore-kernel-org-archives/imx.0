Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB941B7E3
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708918982; cv=none; b=Eddk0a69typYtQr3lNcP08FzgwjwDY0Zw0kfYjZDPqkRI1sUzSiserzDkB/px47BMpTeCNsxfooWTGvaqwnweo8B8i7gViDaAqnxGCJujR8XxVbb1o74+2FJ0JcH0sHaj5/gnEUoSNv8yVomOHAjd5JqGKBmyZ0J5poi59AVqFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708918982; c=relaxed/simple;
	bh=IydK765VnJPgohzjARVij8qk8zUJhq2kb7T2lmqQenw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YjQC5YpOMeWpW7N37Ly3FpXlM4oIku35LZaBLBSJ1xCHsAm8wCkcCAmzRST+vbipro0sE1rccuILOazkO72TyTN1zZvRKK/Rl2J6NJwXVBenTTS0ETl4QdWSe4shSiccXvU8zC9Az2xcQKN/E+9dMcVFLRoF90oY7Nsn4JH20D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WCHeIwUB; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WCHeIwUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cqF81
	qDD4N3PeSvI3Q4uAzxaYk9df0aRoAWAWMBdASo=; b=WCHeIwUBQv+Y8qZ6uEos/
	MlrHfoCvnRnHZVhjR5muNsuH7Llxi7k95mElPkmj3y1ONqCtfrIaR2oXgiRZ3l70
	8+Lf7QYHxGPkzEG/quFRP/SGwNum6cSnD2k+ZHX7ViqSKpMBemrdnrwlyqpvKa28
	rNNQ6T430/4ThB2j0DMHUA=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S2;
	Mon, 26 Feb 2024 11:42:31 +0800 (CST)
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
Subject: [GIT PULL 1/5] i.MX SoC changes for 6.9
Date: Mon, 26 Feb 2024 11:41:42 +0800
Message-Id: <20240226034147.233993-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrKry8Ww4rur43uw1fXrb_yoWfCrb_CF
	yUXa18JrWUXr1Yy345KF1rZr17tw17Jr1UGr9FgFW7Ar1xJF4DJr1kJrWFvr1DXF1fAryU
	Jr4UJw1rJF12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU84lk7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAiQZV6Nnjbw4QAAsP

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.9

for you to fetch changes up to 0d04e84db74d94732821ec515365109d12a9491c:

  ARM: imx: Remove usage of the deprecated ida_simple_xx() API (2024-02-05 17:23:28 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.9:

- Remove usage of the deprecated ida_simple_xx() API from MMDC code.

----------------------------------------------------------------
Christophe JAILLET (1):
      ARM: imx: Remove usage of the deprecated ida_simple_xx() API

 arch/arm/mach-imx/mmdc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

