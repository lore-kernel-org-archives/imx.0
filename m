Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86129238D54
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188962; cv=none; b=O41mwUb45GdrziulSoHVtl9IyeubDP2JHqUm1c26jYM21xZD140lZkoRDd9LkOZpqL2ukpk+TgEyLfHIdF6IplcZxoWdRU2fHpltarTg5WntVx5WYSTZQUB5Z1et+7FG8j96UHzARvEWW3LdIMw6ephDKFl/LzZMt6ms2Ict4b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188962; c=relaxed/simple;
	bh=1uEeGF9p7kz9UCL3FmlVdwCP0lAngpPAygjFaSOXfyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQqO+JJ2z7nJq1YR2XkJLlC1FA0Y8NAg3ntaWJnTBzHuYmXKIb796XmxRbRtXuPto/Gub+yIUwqdwjXKVeMW6jeXpAYcT6R82ZmCT6ZrRiocLuGqo+zMIY6nPkI1Rgbqd4ulO+btxDoBF+4tcJslGYsTMerAigEndzuhdj3rxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq0TYmkQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq0TYmkQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e97cso805040b3a.1
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750188960; x=1750793760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ticf1f4PmQmZwFcANzazYxHsrbux47xCzbGTbFHeNUw=;
        b=fq0TYmkQCKM7X8mxnMJzZf50qh0+dmxTvpnXOg3sz9/P2oPnIr57aFhzlR1Uwou+EC
         +cK7m4KXJc334hOfZbkKNYpxErMaF/R8jz+eYfqFNog2DMMuvPNayD7SnnSjVYGUglQE
         o5CemPcuoEOq9b4StzLu4DHjj8ov1NHltN3LrSzclivPsM84ERnu9Vma3DCkoAN6tIQ0
         Fn+U175XymJYLN+l7JLuiVZmAsDLUxoLIcUPCpTY9MW6xJwb9woXH5wTOGAmWGDMUVxT
         Ozugm4MMxsd3tHRgUCzYqAMG7vBOO3O+6xZcieT5sUg+nCQcbI/olsfYi9cFDYF7/VYm
         4Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188960; x=1750793760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ticf1f4PmQmZwFcANzazYxHsrbux47xCzbGTbFHeNUw=;
        b=bhTuBxHgJ6Ys8LvmoG9Z4eWa+RmDPCiJeUVw0GN0x1gN6WJXDusBgZ8YsIqdV6dDU1
         j4qFsly28f1JGgDZN2wAqKuRxXI+R+QmTwP/jbG9j+nCTrMGumG19bg8S90/1qZjTjNn
         fTRrUOf+9Kp+V2YiA3UpkCMLgjZoE4I6fvyDoX84b7jlUCyaX9YWfKuNNkluQpBmder8
         an+ZMiZYGw0wAGMgTI+F8qh4VTEwpMbZrVzANejbfbED6Udqeq37KJUxNJclV1Tc0nl8
         nR8VEtEuoG5EofsFoKH2AcEiJdStnfmFG3x9Ibn3s72W2DFA0M+Lotmcg0RaeHMdGPdi
         su9A==
X-Forwarded-Encrypted: i=1; AJvYcCWBq3mRsh0HUssdzhS05iEBUjJEwGozkDYRL5ZZ0rwCJvW4RO756jscNI6rvukpM2eXKJI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5f+KfvVIZV2bJUhfjb9y8DsPL1Vi3tqjXX0ylRW87rpM2UEI3
	KLlU/60bGWLJwP/EkItDm8gzVc6T+FQGodn6QCvUWYxp19HO5l9DiL3D
X-Gm-Gg: ASbGnctUes7UYS+SiqnL+ukAGUzfw5Ke4U+wxaVlgYe0ionlOaKP5zXz2/bR8H0Qr+6
	XEZvA9vmYWU5G9eBKRgOmjGp9vNOzByGP3Z+xbivbDQRZ4b0uT160lthYlZVZ5j7V7lyGnX0gTz
	BgaWKeryj80Zi/imkpoWhMvHEvx3RX/6T1gZWu+pag8ukC3R8qUFXm3iIxiK//36F9D3s1GQRGg
	SmJPZ/EnV+hVYv/2c2UrbvWQXGy8cnfsoXfbZyZdUQw6vCepm4hE1DuBKm0wgdocTh0skwEz1Hb
	p56mDL/d+dnGrOU6XQznbAvP2237oEz4OBvKMLZjSDSTrJ1taJ+8C3mJoNMdVPhCJ1BbXHCbQ4B
	oIkdJKQZc
X-Google-Smtp-Source: AGHT+IFusaGvuCb7ZR1Ws5Y5oPYYDpHSdWxbRb5ZmiLNV78bJUEaevAuOwvHQpQaXM6A0+dTKeJfPQ==
X-Received: by 2002:a05:6a00:23ce:b0:748:de24:1ade with SMTP id d2e1a72fcca58-748de241b57mr2814970b3a.7.1750188959655;
        Tue, 17 Jun 2025 12:35:59 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7340sm9648582b3a.179.2025.06.17.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:35:59 -0700 (PDT)
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
Subject: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Tue, 17 Jun 2025 16:34:47 -0300
Message-Id: <20250617193450.183889-1-hiagofranco@gmail.com>
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

v5:
- pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
  checking the return value of it.
- Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
- Fixed missing "()" in dev_pm_genpd_is_on description.
- Updated dev_pm_genpd_is_on() function description to be explicit the
  function reflects the current power status of the device and that this
  might change after the function returns, especially if the genpd is
  shared.

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

