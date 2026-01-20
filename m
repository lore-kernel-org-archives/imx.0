Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB1423AB88
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768872001; cv=none; b=trS+eXdCxdgEG8FyQcVSeTbCyx6EBJjGe4oXeOz8NcO2mT1nC6dp76tEEEbdzxk2bC1UZzVzc9bNVGpAjszZ4pZiBqhXyWsECpk6tEgewugQ0+UG+k1N2Vyldb1GpK2jUnaMoIRpuhzhGSt6O0GvA6Wr4rSCMVCw1bkj2jGWYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768872001; c=relaxed/simple;
	bh=47uWSf1Jz45G/ldq8F0F9XR519UGHIONuyWklj8sPSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGxMz3SDBzBCu/u7MX7javZCTN/6N7wcfvKWRMDC5NfwDjKIbb6MKsxo32CQVGKlqUSji/MTMagA28AiaK/OCSeaPXvyoGZu8xEfJyH73jFtShVNaSO9UTWDmcpFdGeoBtK7mVCt9HMBWIacSEwfZoD0pbmmQt4SOrzU0qHjIj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=E+7EYX5L; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="E+7EYX5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vU
	YCmm7bxQSQh4lEwFnqu0YDtSfIfUIIpR6xtUikt9E=; b=E+7EYX5L2jcZYYboGr
	yq4Wptk9e1lmiyp9Nt9ZfmRIZJeyrBwDWZp9b3DscB+jVLUP9JnKPjIApEOxbLJR
	o8fcl/MsTUxvoL+Aec7ggquensOvsqKBU1DslC7IETQ9WlNqrCZEwAS0zllN2Sbk
	Vz/nJemRBf06e/z1tcW2yVW2c=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S2;
	Tue, 20 Jan 2026 09:12:28 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers changes for 6.20
Date: Tue, 20 Jan 2026 09:12:14 +0800
Message-ID: <20260120011221.4387-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3_+V71m5pGbEbAg--.16504S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4Dury3GF13WF4UJwb_yoW8Xr47pF
	4fGr9xCr1kGrW3Jr1fJr4UAF1Yqws5CrW5J3yxJa48Xr1UCF1DJr12yw48XryDtryxGw43
	KF17Wr1DKF1rtrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnfHUUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR7KMGlu1n6LTwAA3u

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.20

for you to fetch changes up to f6ef3d9ff81240e9bcc030f2da132eb0f8a761d7:

  soc: imx8m: Fix error handling for clk_prepare_enable() (2026-01-18 10:33:42 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.20:

- A few changes from Peng Fan adding dump syslog support for i.MX
  System Manager firmware driver, cleaning up soc-imx9 driver, fixing
  error handling for soc-imx8m driver

----------------------------------------------------------------
Peng Fan (6):
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: imx: sm-misc: Dump syslog info
      soc: imx: Use device-managed APIs for i.MX9
      soc: imx: Use dev_err_probe() for i.MX9
      soc: imx: Spport i.MX9[4,52]
      soc: imx8m: Fix error handling for clk_prepare_enable()

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
 drivers/firmware/imx/sm-misc.c                     | 37 +++++++++-
 drivers/soc/imx/soc-imx8m.c                        |  6 +-
 drivers/soc/imx/soc-imx9.c                         | 46 +++++-------
 include/linux/scmi_imx_protocol.h                  |  2 +
 5 files changed, 142 insertions(+), 32 deletions(-)

