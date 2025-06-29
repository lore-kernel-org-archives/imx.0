Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE942367D1
	for <imx@lists.linux.dev>; Sun, 29 Jun 2025 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217932; cv=none; b=G2uGmrJslalflMoJBXcPREpFcqRhED1NevzfTATvbjtEFz5rFASHG67W7awc11ilyo6BvwleR5+Xvz6wAOb3IFe4MGKj8nSinzVJtImqYpJFIE8o9HF8Q3uacuJBH5iQUUwft4d6bRTfuPiDHnQYvf3Kv3/V2YgoqoWFY5nDJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217932; c=relaxed/simple;
	bh=5rPmU/1SFz7cRlhPi0gScXLXvzdOq4gVjt4wXadKySc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xv2268/Y9YulFtQCZIMLBfHEanvXlIKg7sxT3GbOotcQ0YsDMllzI9AKDPdKRh/T2uEAAjC5kj4pjHPKwlQnlTdCJqM4K4WxoXLWsi3S/M3dPXoKNlT3cEr32vMGCeQXm8KjjAbe1HjqgwXz1ZBCgyPkXdlol+CTIxG59ng2Ioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huFOQcpS; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huFOQcpS"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a6f3f88613so15981381cf.1
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217930; x=1751822730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KVaoc+bz5kdiOIdV934yo3sW+d4Kfk0i0tXAE4l4cI=;
        b=huFOQcpSgnhOuNgA4H0qRuVNjulA2d9p92tD4B/u+kGslGg8pBrpn2MzLgfGBjRR/r
         p7TdtWsvzbejKeWLxIDCefxWiHsyk1fK5R2fO/ac4mdSc033/XdNFd3Kvxp7YQkEo4xf
         YyXgRDaCz4WMWCHY4Dhz1P9Rt5IuAE05zcLTo4ybnZ6635x36AfWMVbywyoA1QN4nPWd
         BWLdwbYUYTkuRVrNVSNr2sXbK7vYbA99PICT4jPuEHWFUyRAGw8L790W+KpQQ/DM5aYc
         PbcCjJHJ5744z7oS/jF5pFDA7FbQjiNNHgQZlG09atZvDqWsNhYFuVo5L/Yep0G1h/AQ
         rJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217930; x=1751822730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KVaoc+bz5kdiOIdV934yo3sW+d4Kfk0i0tXAE4l4cI=;
        b=fGDT2PI1PJpthkfzX3vxQLdEmVGDvHwuTruKJmGayvgpXyDiTaf3XBopkET7aQkmtp
         7G6UhZJ3IDD/Jfx5xX0p4CEMwQZrs6EU60gBvemjKdCH0p76BQl4KnwuRq1ZAzuIE+j2
         2Tkga3svf40Qp52T1vJM+YaJxdm+IER0Yno7eKzUq7hcs+DGFmwBCQEvXsWRNsSHNvto
         ru0XEjLgYX0vzxRvpNGW/pUjWDsRGUq7a+dlsAiOMs2falDns9ZC5aFe4VqSyATf/ARb
         4t4DQOKYNxGnSvABA/hrUcdUpWTRH7yMAvDdOLcxM2C4VACN9wJrAmPKjJDPgdZsbYFh
         1K8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLrPEfC+D8e/FjH52vLgbj1h6CT4YsNc0pYLULiiCmdfbg45Ler0gwZUpJTyDlBN3tzls=@lists.linux.dev
X-Gm-Message-State: AOJu0YywOYs7/kox64NusbQkzdMTiWG7QV4wLFi993meyOAb46hb8EUj
	ALhdSkHoJb6I7zONNjqv+UTik0ylZATuDxqY35bgCkvYlrpYNnWZL4CT
X-Gm-Gg: ASbGnct7vsL95GQMS8W+sTjV6t7kHrFsg3aWH7AaQRSP1D6ddaB4WEzVkP+jgGykAU4
	nXZwAh8WxD3mKxXH3r5m0GhRvBxLhqePtWQKyqUp/gAmSYZ7hHoIStMTGAETdPqmFMzRuxac3cE
	6tpaVJJwoUJIgp9Q/F8YXI+t+PDeIi6wY/qZWPNXak250vIRrw2AQ+vFh1IQ61GBrp9o0QVZ1CI
	QSyBFuLk4XslOhk/UNw7wD+4uafuJeYu3+nHf8LWvzOLHhMAhv4mfot7zJuUBgvCZ8mXuJzJl4G
	aS6nl9ST2B55Wg2ZgC0QbxUgnbhmyBTfTeei3cqrv6KV6enn0uWJaW/8N3k+CgH6jPw6ysoc2Wr
	lDGU=
X-Google-Smtp-Source: AGHT+IFFmSN+6Z++Qnb0w4wGv3WuFmOt+5FDFNfdU9u77RVcSCRV0E1frKS5TTT/Syii07URDiN3bA==
X-Received: by 2002:a05:622a:5292:b0:4a4:3606:cbec with SMTP id d75a77b69052e-4a7fca98a3fmr150607401cf.8.1751217930043;
        Sun, 29 Jun 2025 10:25:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:29 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Sun, 29 Jun 2025 14:25:09 -0300
Message-Id: <20250629172512.14857-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series depends on Ulf's patches that are currently under
review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
Without them, this series is not going to work.

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This patch series implement a new function, dev_pm_genpd_is_on(), which
returns the power status of a given power domain (M core power domains
IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
already powered on, the driver will attach to it.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [2] and from a reported regression [3].

[1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
[2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v7:
- Added Peng reviewed-by.
v6:
- https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
v5:
- https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
v4:
- https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
v3:
- https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  pmdomain: core: introduce dev_pm_genpd_is_on()
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: detect and attach to pre-booted remote cores

 drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
 include/linux/pm_domain.h      |  6 +++++
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.39.5

