Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F283368B5
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628452; cv=none; b=u+F24I8tHKsR3iHIxAugreuqE8u5roDd3A1ei+CM+Tx8c2EpYfYS+Ng61BAUvfOcg2KQyZQbNcoQ1YJxnLIRmS0trssF3DqbDVPLkcudT5OttQJ9zR4Wp3lvSxzlG9bz4IPlNeOVWzjCiP+Ll1OhelhIdcM9/alqr1KI/Km/UlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628452; c=relaxed/simple;
	bh=tVJB/5QV1ClMp/xbJ+PLWJPyv5EQ41vZXbE/F9ItU+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fNP742wPPB8GTwPvDMd2pXSFQJQXC/nhWUrrIdQaQT8uk+6EMI540NbML3Xf+PO2ayrRyxRpD49Zev+1epVpwY/MLQt0xHFdLtcW14FZeYCMmSBh4menM2nZZuqv4mt1EozeiAHR4TO/srFdCR1NCXkwCRx0ARGFHdGkYP0WK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbnO2lur; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbnO2lur"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35994d84c6dso1191127a91.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628451; x=1773233251; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=un236t70aK9C+LYKfl6LV8hfmsluRaGW5mOoPgkCRvY=;
        b=ZbnO2lurflv1+98bqXD7ArFkEEOr9kotMRtKqRa5r8P7B2RVSyH+oVj3ksTHWmnV0R
         AhvbOk5bF4TbLO/4dU5+FKNvuBrPR52RmCcPGcxmgrR3Atf6h+pzUtIgjFgrb4Wax8Mb
         NUim4AIQWLJa0hkHw+3Kd/YWdivYraJNt8qs+P0y5CXZimp1ltMAsa4mtRGXSJu/bbNg
         lroV6acjEY0X64x0B86Qo+5ICTjULHJiTb4Cu1QiLiPzh4WJWKmvyByLZ/YgNx3I2Yhm
         NV2qPS+1FAaVa9VLPRWxlLku3Rf8lrk8kbDEriWrg6GJj7s8BNfBrSrGc7sDN+oZyQCQ
         UE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628451; x=1773233251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un236t70aK9C+LYKfl6LV8hfmsluRaGW5mOoPgkCRvY=;
        b=WtnMTpTUIN0SGD1UaYbr2QxA44nNqENab8eSZRMoZYNoXNoAK1eNjGBCU2mBkWQTkN
         dTuTpsgV8w5tvNiItHWydAD7ZI4u5vi5J6RcIptGzMuqoUF9Dpd1FCtg/bVAR3MEqZaZ
         29jVlOIsyWJYt5Up8/G622HysxubRBqhqtH+ClMpewBqUBtsCunXpbkBQodrbk+w7fFH
         +ODW0GancM/PnrrJkK4XRsuwDB71RsaPhNiZyqfN8dqyNYDgaqaC5XDNjEmNp8yq8C5C
         DhoZ9jIYSZjkWClWUrWrtRhbaLYAzglG+cUVyRfv7fGlZxwZ5PAkwgBCvlRmI1UjYeys
         uf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwZCgjtYVfR7ddXhAR+J1lvjWtKydU4SzaDIHBbOD1SqF8epzrMfLDVQXPUYKKG8K+/vk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYRSy16fhCPSTyzgblrEMz2n4oRqF0fzPn5KSTFefep8o32oJi
	3tf6CcXP4p9ynC0Zrn1s7nf7us1YFutuCJq3BtlgRnj+cIl9TRMsbpZB
X-Gm-Gg: ATEYQzwZn/Je3QRRH2RdSXET8gsiSuPX/5Od4KPo3uMPrlYFjWB8HOCOgkvKOSQLUPe
	B6St7vTuqG1qKSd45IMShdN7g2wTLtWJHYlDaOLC94VvT6W0xKMRRGbPi5boGHi9LXJ4J5JJjtl
	79hd7qCPkOio9Wt5o0vTwKjJ6Xcpe2dnLCswk6EwH5e4uMnCl94ktM3A+aibs6PSj07IsJ1hLfS
	eDSlTp7nvbamk38PRcM5i0Lv5zYD4hi8qzNZYxv22M8rDaCEy8x/fsmBTokD6iewkmH7j7+1EWV
	uLip7vxEiCsRPKbzkomlveRb+JJhFZ6Z8/qSvEhBku0DjwCSokj6PaqsQilqtN80qGyEo+r6Duq
	dTdkLPscdtgSfoPYXgh+WphWLy6lin+EQoczoXmu37sCUoOIYuzAB9Stqu6gJpHsmtiIN2dC7E4
	IaSUH7ZNuNvc5oExrSMwDSJfmrx1+lHgG/6eHf
X-Received: by 2002:a17:90b:4fd0:b0:359:8055:df63 with SMTP id 98e67ed59e1d1-359a6893bb2mr1883589a91.0.1772628450743;
        Wed, 04 Mar 2026 04:47:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:c48d:9c04:d04e:c13a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0625sm5000450a91.13.2026.03.04.04.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:47:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/3] spi: nxp: Use reinit_completion() for repeated
 operations
Date: Wed, 04 Mar 2026 20:47:18 +0800
Message-Id: <20260304-spi-nxp-v2-0-cd7d7726a27e@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYpqGkC/2XMSw7CIBSF4a00dyyG0ijoyH2YDnjctjexQMCQm
 oa9i506/E9Ovh0yJsIM926HhIUyBd9CnDqwi/YzMnKtQXBx5QMfWI7E/BaZk9zcpFZu4graOya
 caDuk59h6ofwO6XPApf+t/0bpWc+MVBfJnRHK4mNeNb3ONqww1lq/7ovEcZ4AAAA=
X-Change-ID: 20260303-spi-nxp-d70b97a8df08
To: Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772628443; l=793;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=tVJB/5QV1ClMp/xbJ+PLWJPyv5EQ41vZXbE/F9ItU+4=;
 b=eADYv+bdcOtbSTN4igmdAr7rsRR1fF5UYei4LYGy6xymPEqT3Ih91iSIHCF6FeSYm7KuayXW0
 8Ajv53wMpBjDTpH7CInKfK4vP6zdRN1n24GmfREnYwaLgyReQG+Vhy+
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Frank's comments.
- Fix for spi-nxp-fspi.c and spi-fsl-qspi.c suggested by Bough. 
- Link to v1: https://lore.kernel.org/r/20260303-spi-nxp-v1-1-b78570db28ce@gmail.com

---
Felix Gu (3):
      spi: nxp-xspi: Use reinit_completion() for repeated operations
      spi: nxp-fspi: Use reinit_completion() for repeated operations
      spi: fsl-qspi: Use reinit_completion() for repeated operations

 drivers/spi/spi-fsl-qspi.c | 3 ++-
 drivers/spi/spi-nxp-fspi.c | 3 ++-
 drivers/spi/spi-nxp-xspi.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-spi-nxp-d70b97a8df08

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

