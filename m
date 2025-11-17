Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8732C943
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382882; cv=none; b=FOhJsNiGiolwWQ+CwGRMLRQiz0iMmjuXbVbIQcZ1mEF/bAzj7RrHVc1VEH2jWJ32gNtBDYS34QEqaCn7+YQ2+I/skYn6kk6u6u4P1o1gnFaZajFBYcPP2YytZIT/jwGVFri6PRiOQClq9aPpFQO+N5Z4F9I9VccSlk9wft3xshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382882; c=relaxed/simple;
	bh=VS/nBQnf4uQUduPccd0qUnNmWQ65DpTT5x0xj4MjBuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rn8ZDIPSph4W8k7f/zsNggnbK+TuMENYDIk0oa4kAI2nO1jv7bQ6Kd9S6XDXE3NMc5OF5Hw0JxfKzSQrSoRBYPet7Yl05gadGtaVZGfPYC8mo8PYZw93dK1QAPRjkxeQganzuw6/l7I/e2pi9g3xu+S8Tals4iysLhZZe8wj7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K6GXJqVm; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K6GXJqVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MN
	YAu/5xfoUe1Cd1Dk6SgiXruma2zPCXXBEcXxRe+VA=; b=K6GXJqVmPJ+itrIt00
	QIH+G/A1nkcI98HHFunoPjZGdnPJh12iqG8SaPxREHEjfMc0KIZgq57WQ8UXeVs/
	ghBHGAxBsxxTvfJqr84xljuqaZ4yFjA1QpWiIwRo++UNVo+/p6Gq7J4DCR7MpuJ8
	0HWXNxlUOEMHcvxPm0EAcDQnM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S2;
	Mon, 17 Nov 2025 20:34:22 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers update for 6.19
Date: Mon, 17 Nov 2025 20:33:47 +0800
Message-ID: <20251117123358.2009662-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw43Aw1UZw4kZr1fJFb_yoW8GFykpF
	43JFWayw48GF4fXryfJw4UuF13Xwn5GrWYkF47Aa1kZF45Awn7Jr1Dtw48XFW8Jry8JF43
	KF17JF1kGF1UCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-Ef5UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBG6IGkbFlETowAA36

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.19

for you to fetch changes up to 97a07dd2b559d149598cd49574ce50614752211a:

  firmware: imx: scu: Use devm_mutex_init (2025-10-27 14:43:48 +0800)

----------------------------------------------------------------
i.MX drivers update for 6.19:

- A series from Peng Fan to to improve i.MX SCU firmware drivers

----------------------------------------------------------------
Peng Fan (8):
      firmware: imx: scu-irq: fix OF node leak in
      firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_enable_general_irq_channel()
      firmware: imx: scu-irq: Init workqueue before request mbox channel
      firmware: imx: scu-irq: Set mu_resource_id before get handle
      firmware: imx: scu-irq: Remove unused export of imx_scu_enable_general_irq_channel
      firmware: imx: scu: Update error code
      firmware: imx: scu: Suppress bind attrs
      firmware: imx: scu: Use devm_mutex_init

 drivers/firmware/imx/imx-scu-irq.c | 32 +++++++++++++++++---------------
 drivers/firmware/imx/imx-scu.c     | 11 +++++++----
 2 files changed, 24 insertions(+), 19 deletions(-)

