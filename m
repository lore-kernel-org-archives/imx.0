Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804002FA0F1
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942780; cv=none; b=kJIsp/+YTgKxR/HQvFx7woVeyN9wDpdyDJ/eso4nx3zMxNajw+mzGOLe+MFnr95y99I4azZ7Evpu0ulEFsNa49a/9tik4d6E5s5iMxs7eWOPC3lV2IguHQqEvg8l/rfH8GpG40BFq5rTr1dZ5LT3+j/Msn9gXuRslt/eD0lgKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942780; c=relaxed/simple;
	bh=LlUyXshhWjK3wH/3uwjTDM9wHR3qiToIjJCjrFcUftE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/X2HJ2O0EBvaFH7Qv0upVmJfkigaHvJJ5WEmryGo8Y1RuVTeOGoxbbF4wSGjumJl/C0FV80FZE0o3Kgb58JEDcg/jzEOU4gwnaytmqvpcNheZeVTDRWmaKbW6NKf/1NqsWmDomVLf9XrvgNFSwkPYVRv5qILwAMF2/XeeC8Oyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PtxAczia; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PtxAczia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=MDubKcjXFcDZmhFsHhoftPWfhxVchnljhnPCB4Gn9VQ=;
	b=PtxAcziaU5LbwAPcmAxPQ191Ku0eU5VcghYyJr8yh569dX5ahSKf1cu7LO6MZ0
	tX5yQGCwwekl8zJpbnEPN6OicqCeh9PqfzG1yYMKVZT82PkfHXXl+MxoLqAroXgm
	P15WJQd8qCctKiAXrsXQZH2UisxEEm0SKfzKC67iLL9PE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S2;
	Mon, 15 Sep 2025 21:25:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] i.MX DT bindings changes for 6.18
Date: Mon, 15 Sep 2025 21:25:28 +0800
Message-ID: <20250915132535.253859-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnjyTaE8ho5MiXBA--.47709S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1UZr1UtFWDWr1UtF13Jwb_yoW8uFyxpF
	sxKF93GrykJF17Jr43tr1kCr1rXw18AF13GF45Xw18Aa90vF1jqF1rKwn5Zry7Gry2qr13
	ZF1jkr4DK34UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfGYdUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhxIrWjIE9wDHwAA38

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.18

for you to fetch changes up to f001225088b8736f55dd28a4616cdf1b1bdcdd2e:

  dt-bindings: arm: fsl: add TQMa91xx SOM series (2025-09-11 15:37:58 +0800)

----------------------------------------------------------------
i.MX DT bindings changes for 6.18:

- New board compatibles: TQMa91xx SOM, Ultratronik Ultra-MACH SBC,
  SolidRun i.MX8MP SoM, i.MX8ULP EVK9, TQMLS1012AL, i.MX91 11x11 EVK,
  EDM-G-IMX8M-PLUS SOM
- Update imx95-scmi firmware bindings to allow linux,code for protocol@81
- Add i.MX53 compatible for fsl,imx-iomuxc-gpr bindings
- Update fsl,imx7ulp-smc1 bindings to allow clocks and clock-names

----------------------------------------------------------------
Alexander Stein (2):
      dt-bindings: firmware: imx95-scmi: Allow linux,code for protocol@81
      dt-bindings: arm: fsl: add TQMa91xx SOM series

Fabio Estevam (1):
      dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53

Frank Li (1):
      dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and clock-names

Goran Rađenović (1):
      dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC

Josua Mayer (1):
      dt-bindings: arm: fsl: Add bindings for SolidRun i.MX8MP SoM and boards

Laurentiu Mihalcea (1):
      dt-bindings: arm: fsl: add i.MX8ULP EVK9 board

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQMLS1012AL

Pengfei Li (1):
      dt-bindings: arm: fsl: add i.MX91 11x11 evk board

Ray Chang (1):
      dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  8 ++++
 Documentation/devicetree/bindings/arm/fsl.yaml     | 50 ++++++++++++++++++++++
 .../bindings/firmware/nxp,imx95-scmi.yaml          | 10 ++++-
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       |  1 +
 4 files changed, 67 insertions(+), 2 deletions(-)

