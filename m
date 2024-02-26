Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C281B7E1
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708918981; cv=none; b=CNt6lQrvayifVK3Ce+e/DAHfzztQ0TWZjZKd2pB/CVwDe9lUfPQjAEo2+eCQMExEvxaSJW5nG94vu84n1+WKFmi5fQNdwPMTpdRimX3Qy6+pP4mKq76wF5jM2UYGTRJCMregqB80i54Wfone5jkLlT1lmPdSAdkZNanHfPYglW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708918981; c=relaxed/simple;
	bh=9EKzz7T7V456t5dY+Nm739BdNO9gLl1iOHX0hbJirnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VGobVvPT+PG6SCMV/0a6ZJfszNdY110+jZtCiTsShuO5nyG1k3RCz9EUHv1/mxpN8gKvvJz8yQPWhJcOTLHrC3csHequMouO9hxrJljvrVHnP1yCH26Ui22PNnc6cWL6h/kEUJFE4CS5CH1mJ/ENnZ2wW57pDxFMOaCnqLsmuh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lyZfPst5; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lyZfPst5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=znav7
	z5Pz9k7TXnIDi7pxyWtYj0admOeRx1PN1ls78k=; b=lyZfPst5thvAC2+cfQd1b
	BsHGmCHOYeSfEw8aynENDWk6wztO7YJ2n2xM+hPomQktTiaKW85hYVMpfMEeLaIt
	ABlE0YrD+1Ka9e6bJYh+8PR2NndAI1UKijBdc/YW5rd08YfFr+wnYrLiJLiWyX7K
	RoJCbYOWabTTeA4auL06Wo=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S3;
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
Subject: [GIT PULL 2/5] i.MX dt-bindings for 6.9
Date: Mon, 26 Feb 2024 11:41:43 +0800
Message-Id: <20240226034147.233993-2-shawnguo2@yeah.net>
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
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DCFWkGr1xtFW8Xw1DWrg_yoW8WFW8pF
	sxGF93GryvqFy7JwnxZ3WDCr4rXr1UAF17JFZxJr10y3W5Ar1jqr1rKwn5ur9rJry7Wr4a
	yF18Cr1vk3WUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlq2NUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAiQZV6Nnjbw4QABsO

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.9

for you to fetch changes up to 65524e1453109c2f94b361274154154fa2120c85:

  dt-bindings: arm: add UNI-T UTi260B (2024-02-25 21:57:10 +0800)

----------------------------------------------------------------
i.MX dt-bindings for 6.9:

- New compatibles for boards: TQMa8Xx, Sielaff i.MX6 Solo, Toradex Apalis
  imx6q-eval-v1.2, VAR-SOM-MX93, phyBOARD-Segin-i.MX93, UNI-T UTi260B.
- Add vendor prefix for UNI-T.

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: arm: add TQMa8Xx boards

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Sielaff i.MX6 Solo board

Hiago De Franco (1):
      dt-bindings: arm: fsl: Add toradex,apalis_imx6q-eval-v1.2 board

Hugo Villeneuve (1):
      dt-bindings: arm: fsl: remove redundant company name

Joao Paulo Goncalves (1):
      dt-bindings: arm: fsl: add imx8qm apalis eval v1.2 carrier board

Mathieu Othacehe (2):
      dt-bindings: arm: fsl: Add VAR-SOM-MX93 with Symphony
      dt-bindings: arm: fsl: Add phyBOARD-Segin-i.MX93

Sebastian Reichel (2):
      dt-bindings: vendor-prefixes: add UNI-T
      dt-bindings: arm: add UNI-T UTi260B

 Documentation/devicetree/bindings/arm/fsl.yaml     | 41 +++++++++++++++++++---
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 2 files changed, 39 insertions(+), 4 deletions(-)

