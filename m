Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD6265CC2
	for <imx@lists.linux.dev>; Thu, 21 May 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374716; cv=none; b=Wz8tccDOCJ56y36IVwziNYRlHQFyNnwanIGGHnbLch6tN5Kn62WiIHw3IJjGMH7isjT8qRorotX20T1aAt2aSAH1M6le6A+WgdYr+tGEVCD45SussA+JDXoqD+qmdKdIlMuOE39ZGPC4DoUf6U7eTWLtgb/khfoZqh14TeKPpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374716; c=relaxed/simple;
	bh=5WzCzpQAfauvNBfuz2h93m3dBjmIB6B+A5Dq0d2HspY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SyDC/tJj5fuxIZ6AVbvkJdFrpTjlCHYmsoow/5G2s13lE648h2P70lB7FoNpS1+c4XPkn8lct0WQffS0oVZW8Kxt05h7KtCu5lvH4p1y+l3ip7VyXldo7tDIzzvXhWMsfg57hKIqCCwv5s+gt4y5+cBPlihIgi8lmDydrw/avSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOvjVSZU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOvjVSZU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bd80b3aa13so40118055ad.0
        for <imx@lists.linux.dev>; Thu, 21 May 2026 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374713; x=1779979513; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWXyA/icX3UC/cu3pkBD8KPyWdonFkYMhFuMrf7NsXM=;
        b=BOvjVSZU3pvQaGpitAxMgb1UWH7ZytZNu3u4t8G8AUF8hB9t1ls2wrNnZ8ylr0+fJS
         PmVdrEpGw8gmY/PU5ExYy5lld4FYQ1ZudcHOxuAG+m4cZVmG581JqenCu31sHo6yYF1V
         xLlVdkO6h9zhoFWitGCNjUSaM/5T3qgb84knnjvihYp1+4clJZfPTX88TvOcZsD3J+Ki
         3fe6wuCilAXy18vtcr8SItLZF3f+3jZ4w40lTcCUi07LHX6D2G1p/HCqK7ggza8OIymO
         /5rQHeWo1IgR1fRn29dMLBdV/5nKZqO8cnEnk+qY3kL8WPBgpWFseyviHzbi43J3KHnN
         HEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374713; x=1779979513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWXyA/icX3UC/cu3pkBD8KPyWdonFkYMhFuMrf7NsXM=;
        b=O2q5fqfctzt0tWWyY4+s2f8XEzdGsYr2RwFO+/NfhYxZz0vpPPcpZIAgTlAEcgzUtg
         pFirXDQ9T9utjSJtSH/CjwD9J3TnscnBdG4nzLbHsaEbzVXMpzJ0EF0ibTCLutHmuGkz
         IiHoZI1czdbylcqlHksyOwGMZhPMP0LA0LsaADSC3nE6rgmZml0B02bNpaQBRsxu7hFd
         tnUYlMj+pCDWaQBTorC/DQekJfSztfVs85lvoqHKA7hSzQNkhQxkrjvBXehfYpZ5Ip/6
         Q3HwiqbeJJUfrFcJH7QvSP2D++KYTLaTpYUdWCbdL4HpNhEaHAGORVr/++1Ak2ot1x06
         xZWg==
X-Forwarded-Encrypted: i=1; AFNElJ/VMB5XaYWR6Pii2BEoifk5aw5ahkwUBY/u5OX+jTUXoPGdacGUbrFeTvxLQI7a/axcaVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjR+A4/pTih/03XkGpq2S10VKATas2mMdLQO01Fd8CreEAIQPD
	/K+T6mMH8uJQIqTrHDNLe95wVwkww6BhZk6OqwIq4//0iOvQIVoEQeuh
X-Gm-Gg: Acq92OFSigNZgjJ5SZO0CyibmQXULmpkTTuxiQyv8nwv8l6VbfAzm2QqiBcL9Taz1Rb
	8Y1MiY3Ei+qJA9kT7TNsFIV+QJybi3ecEgqth8zhPtLGrPNbEeQGzoLTK2jhcf/IkJD6e1uYRoj
	cGPaY9wkOeNnKZmwN8zsWXINgVtWMQRG5mL31RhfrAXXYFy+JcKeTjSiLSLiL4K37vozY2Ae2Pu
	aXLoQaNaP2MZWoXQiqq0wswkLk7PACc/TvXvmzG2uwyPxyoSx6y9ioHD65um9NVRKBYdz2Y7ivm
	Icoly66elch3Mcrq2o/RIA6eJHuxeRDAi7r+IxEmmdUfflRsZoG6sUu34cO9QpkfPfuW3jXpFZB
	FUmi4snutfAJ48B6AOSAsCGt/FBOM3nVLiEzwX6fgYMpm/iMx5yJUBWnVBcYAoxP33QkTnPZJCF
	D/du7cuCkO3zL+A6MxgOUgrhTBfLDc6Q==
X-Received: by 2002:a17:903:37cd:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2bea30a8697mr30793125ad.11.1779374712767;
        Thu, 21 May 2026 07:45:12 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:12 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Subject: [PATCH v2 0/2] spi: enable the SpacemiT K3 SoC QSPI
Date: Thu, 21 May 2026 22:44:44 +0800
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQqDMBAFf0X23AdxrRL9ldJD1dUuhSQmIgHx3
 xt66HFgmDkpSVRJNFQnRTk0qXcF+FbR9H65VaBzYWLDnWm5xqdB0MlD94wtBcXBWHyEk7zjb1n
 bj/29ZjPblkorRFk0/z6P53V9AWk2ROR3AAAA
X-Change-ID: 20260521-k3-pico-itx-qspi-v2-for-next-20260521-889b94120d85
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=5WzCzpQAfauvNBfuz2h93m3dBjmIB6B+A5Dq0d2HspY=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxptfRkZxF1rnjUhQ8FwCZSHP6DrxrqQCYuh3
 peGvWJVYuKJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8abQAKCRDN9pw2gLgN
 2AmeD/9sN6/gePDDOupWgz5WRXZXq2IH9LVJ3VYVv0qO6fQoGTRp/dXRlj+B0jlX8Mbc+we9Ii2
 f+XRROGfSiHjakxGUqSu/F6DpWRMkd28p28GN21cycRHdxeOTLOt76FG6xFNK4SQMFPHLbFa8M2
 80mgRd55xaK6M8sUeH9kOsHwp/xMWctxVaTMK1EHHDUnk+jJzIx2jXF4E353f2ZaebwhpXFJTjo
 IgGw0Ab7qplYN53/QIp6GrY8UG7yOWOGVCCLsYWZI4TZ6mPTGXSuF43wo/alHvZVD9ys0EA5oMS
 AN8f05AyVPtduTYxub51ooGB7er0I77C8rVUP324npcoZV80p55+hmAEMdCAjL5TLcw3HiwuyXL
 6hh+sERko1zGUVUs56yDEWjk8TTT0y2GLnWQUrDKBQc4h5zya5Ii1b9JIno3Z/oGZrTBm51IylW
 yGuVUIa4OhWWEYggVqvQmatXOrHC2ZUfDn38/zC4ZrDPR1iodsL6nBfVZwHqqGr9t8E5X6gbUrI
 fzh5vdU1vJ+S35Bkc/ZXR+zMUq7Ko3+kD+h0mX6C2+E3pFtsbrjHRX0HGhyuko1ECVxOJx1wf0N
 2SWk3UTaxyaoLm/+nDreQq3B84C24n1yGV+vPCnXhB3ggTqcCBgtlKwumHxcGMslxLQM1imOe/8
 GeUeRkkJ6T+M0xA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add the SpacemiT K3 QSPI compatible and enable SPI NOR flash on the
K3 Pico-ITX board.

K3 and K1 use the same QSPI controller, so the K3 devicetree uses
"spacemit,k1-qspi" as fallback.

With this, patch 2/3 in v1 is dropped.

This series is based on the for-next branch of:
  https://github.com/spacemit-com/linux

This series is available here:
  https://github.com/imguoguo/linux/tree/k3-pico-itx-qspi-v2

Version 2 addresses review comments on v1:
  - Use "spacemit,k1-qspi" as fallback for the K3 QSPI compatible.
  - Drop v1 patch 2, "spi: fsl-qspi: add SpacemiT K3 support".
  - Reordered Signed-off-by trailers.

Here is version 1:
  https://lore.kernel.org/r/20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Zhengyu He (2):
      spi: dt-bindings: fsl-qspi: support SpacemiT K3
      riscv: dts: spacemit: add QSPI support for K3 Pico-ITX

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  |  3 ++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 58 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 21 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 17 +++++++
 4 files changed, 99 insertions(+)
---
base-commit: 6edd9a0d32e1ef81133b8cb5b3bb3157a44da4d1
change-id: 20260521-k3-pico-itx-qspi-v2-for-next-20260521-889b94120d85

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>

