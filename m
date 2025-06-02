Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613B4A0F
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870389; cv=none; b=Od7s4yk46uLp6e98PKnoelhit5TPam33Vybh7ey8jsN808NxnuqFfo/kE02DWEOUwnZMRxu4HBEJcBaN8hGZXzTAnzqwLmea0+mZS1YvHDCJHDYdNZ/UtUwq8kFq6Jz+GsbOCRqeA1x7JRUN/zrqgxpTmEIVu19lDIRZdwRvuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870389; c=relaxed/simple;
	bh=UxGEKXZqr/JaIi0rMXu3vg+WUXFZEFThlv9I/oaHoDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4MHk6BkH044AauMoGcOXiFv1Z4/+7dy33Vjm5GtC21D29Zqyvjx/Idh0XOjuZJ6JAHn3p0hQwXvdhUGe0nlFn/Iz1Voviv5ojNZtkqXOO4HRhygRWFalxmWzErlV8fa3NeOh1Qr9n40NfIp9chgrinK6GvxM49cu4v6pTFYNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flMP+CmN; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flMP+CmN"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3115a6db4d6so3297818a91.2
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870387; x=1749475187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2pWQ8XYInPzY7yzvFzb84/7Ia0EnVFU8WNL68zGHlw=;
        b=flMP+CmN+Ihh7HLNfhOKeFVoSjJUT/++RFVCw1+hisYXZU8X0oStOPCsobMbqz0qcj
         0NVDLtrVWpqlvsYJwIOrcc9sS//78U4apwDktdwowsMiGP8g3EPRrp1CJifCC/U48SUq
         DuV5N7kDdmVtaAoBWjFiC2DE/p6xBn/Tovi38d+vSYq0Su1WDGdw+JN054o4jZqf/C2O
         IKgoeDrpEbwPc+ZGDiggwUvLRRxrAHbmV22wvKygcBSyMLfGjXFbLRQyFWgm7OwKRY3T
         mWscnTWJOZsaQ4gmCrbc+U8JfnQ5NVd5XPM9hvV73O8ofUuU0PYaZNgRBwmk1os/GW9Y
         kKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870387; x=1749475187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2pWQ8XYInPzY7yzvFzb84/7Ia0EnVFU8WNL68zGHlw=;
        b=qhTVtNegNlaUmXPmOxQ6IUlhT/LMZICkrDRd7FtqvvvsuRDmjHj2GLPh15IqdBsw+e
         AKukaUmBfCXVD3U+Ph4OZ7DpB0YVE7EQlEXwDUigudh9ND8JQcivsuHM23WWNLkrtyGW
         pTilT0bIvfpt8+Bq/Qvx2RWgrXl6+oEYEF+nprXUPX8zd1n8SYVHkI9Sz9vd6ZbZTSLj
         bMK+ekJjyLFo8lDFZBnae7za46qyHdH+UOlK1MH5T8kwMwlYBdXqGiyeyRqcTgb+seTX
         q8KmZO87of2dz8Dexz0ZzNZ1f6CEGMpt98JipXHbIRI/Cx4XBnIdRILFdfUUqKhfU1vo
         NfGA==
X-Forwarded-Encrypted: i=1; AJvYcCUmo35M9lxksUzXoFlzo2hf6ORq+gNp/5h7QTM0Kxq5tHohcLBZcDhuSI3Yzq8yPwvGde0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpusmxp61E3W+UGlyrZARoSu+Pmo/Ta9h5gJqZWUMWrh+rrpEZ
	8qhSnEXK8/Eq5UQ2WXvLRG5MBVnflA1exTX5h6mxnl3HZ3SzKXU2al+5
X-Gm-Gg: ASbGncs/RbUZbe/hLYvkyB4av2K560Y3wVHsitn8vJdH41IijtiYGxOvKfjrNaXSM9o
	fzRdAdaumSJ9g9RucFM5thG0OJ83bRpwLARREpeznMl+DnaINijCoXe41zWFESoNqLYKip+/hC4
	MfMFL9pvmpfCi13Pe4YTmv0T+Ly833utZQ43SSG+0uFyWJ7+IJJz2uPhgsUCZznGBPe0+yLiQ4J
	fTiBBFpnGj6RS3TC8vtuvb7sN62ZlcfVDDdGxO0UtjzW4pTYGnZkDvvfT0unzrL/Ngi+OdPbtzT
	fysVEb4lSrOu57Y+vpmFyYUrY1U0pfvaYNm/zVZZXxys9Fxu+7szamXtVCwH/b0zk0Bmrm1wLQ=
	=
X-Google-Smtp-Source: AGHT+IFDyEzGFaym1wpwRqsblj24xGVKJRt91HFE7nLSINnTFLOY+Zcd+cdYuE1FMCys07O3cnvoUw==
X-Received: by 2002:a17:90b:4a0d:b0:312:1d2d:18d9 with SMTP id 98e67ed59e1d1-3127c6a9969mr11777603a91.5.1748870386764;
        Mon, 02 Jun 2025 06:19:46 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:45 -0700 (PDT)
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
Subject: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon,  2 Jun 2025 10:19:02 -0300
Message-Id: <20250602131906.25751-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series depends on Ulf's patches that are currently under review,
"pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
this series is not going to work.

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This patch series implement a new function, dev_pm_genpd_is_on(), which
returns the power status of a given power domain (M core power domains
IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
powered on, the driver will attach to it.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [2] and from a reported regression [3].

[1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
[2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v4:
- dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
- imx_rproc.c updated to use the generic power domains instead of the
  SCU API call, which depends on Ulf's patch series.

v3:
- https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/

v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  pmdomain: core: introduce dev_pm_genpd_is_on
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: detect and attach to pre-booted remote cores

 drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
 include/linux/pm_domain.h      |  6 ++++++
 3 files changed, 59 insertions(+), 7 deletions(-)

-- 
2.39.5

