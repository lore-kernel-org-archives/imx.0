Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083EF14A8B
	for <imx@lists.linux.dev>; Sun,  8 Feb 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523443; cv=none; b=YxeRmJ5c1sMu7ibX7R7kN8EXO76epiPsd/O/2DNxU8WluIKGof9dzu2Son9HVxiiRfCX46wD/b7FCYT7X5PXk3ZisVHyD2BCdntOo5keSEpJsK13CNIDyv5r7zGF/uJaMhH3EMRcas3jhQNIP0L9xULkgBwMCWn5RMEFzRcpcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523443; c=relaxed/simple;
	bh=gVLYpM9coDM1ziPBdzZCYGdJwdE7dELsKzKbZ2xsotU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibZKX1Eo/63syKK1FnxVjTcF5d5d+pSq8B1HnaryCjTDsdQEVmqDTWkqnOupf2VSDhGfDbKKM+/qxAmbbU1uvneEvQKLtbiU8Qd5L8qUYq6LlPht2ikODqvacqdbXSEy/U6P7RusHjz9rBRpKs90pbEcGWDURuyoAxcu6seI8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C/4IUF/4; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C/4IUF/4"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1270adc5121so1642060c88.0
        for <imx@lists.linux.dev>; Sat, 07 Feb 2026 20:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523442; x=1771128242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=C/4IUF/4kKZgJk+xYAB9qGScXs7zfoDhuy9VfsJEl2yhxMIPX0gMasxaMAU1RlXznd
         ZE/UblCw6u+3vNl0r+1EuPFSEJp5ttfermBpNLKypxY0NnJ3HH+Z2yq6IKDXJw6Hc2a6
         DESEOVCqMbRfYGhOis9NJLA3ROkJUIl7LKdZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523442; x=1771128242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=D62RAmqMW6+VT6AMmq7LeqJOqpNiM/erq1mxK6nAXlQYLnsW9WuK+Da1rdDTThWB4m
         Dfe2D4D8qKkKsb8RBNKNPRMIYR1PkpxKghWZ5S6D/muyr/UIdMUzxq/AD5qfRcx7Fqrp
         +THkfinJRQ36mrkLJCtW71qfLie6lz3LaaXitNmzQCD7qQJqEwI4edT/Ly6nwQU8Yj4s
         /gtDOTgs0NpbFrtW+4hhGQjVUV69w6gQBeXjq/u4Cd/fm9nBpGuVgcQRw7irnZ0YGmif
         9iJoR5bvXF0nMyEQrK3EaBUvXKHuYQgndmcnzc/rMGJI3prRRR3na++pw+9g0YqyzNY6
         EuEg==
X-Forwarded-Encrypted: i=1; AJvYcCWrHh5B4521Us9PPiAaRd8KTJ7KEHmIUsy37ePD98hA4D9t02B7A9iqiMiQOns6ZM7Aagw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy05a82HI++25gOIWD0Q9sG6AhhHcyuBMyEVw9EkEkBCkAkDl/0
	M4RIa81gsvvIKA8r9k6VAHs7yYQVkwx30PrtXcte6jF1K2F2ZWOcAKeU9O/jrCI4cg==
X-Gm-Gg: AZuq6aJ/zJTO8juoacL+KOaIpOtO2/BDRdyVHRoKt8p/B4YJdvsIG1/nR0audo8vSzX
	9zfW076T4P7M4PEnN/EKeNnV0KPynDCgdS67CvrqXX94JaCxrDrODvdFOGN0ld+uDmmHF+Cb4Ep
	GBBXaFM6zzjWtk71WxuyQttPoMtp1QT/p9utCx3moMGCB3TfuWJL4Zah2mCM+NVww7jK5yC8Zf8
	TkgCHnvfPZAjWVxpfkMEqBkBHRoNg2wtyEB/8TPhlI1b8MX2YyocfkZBWFDcJcTItHnCeKdcqdi
	W4lwGF+F0SMg3OtGzlJueKhY7SCoheea13z97IqgEgP0WciSxRp6OMu5IalTLYLBbxq3pnylDAg
	G+6/r+4eXghrA6jCfRMGShirD4O+XYkkKVl1jP+6pPBLzpTun0895IehPQP17Q5WAscbsQRwb25
	QUZ+oUe5U/EDh443fbSxLSj5vbcrH781Ku59Icukf0qFBjTvHFZ3EasAWL3mqBetEHiCDFn9I=
X-Received: by 2002:a05:7022:6184:b0:123:2d38:928d with SMTP id a92af1059eb24-1270405aa72mr3860925c88.36.1770523442099;
        Sat, 07 Feb 2026 20:04:02 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:03:59 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	shawn.guo@linaro.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 00/15] mailbox: Stop sending NULL mailbox messages
Date: Sat,  7 Feb 2026 20:01:22 -0800
Message-ID: <20260208040240.1971442-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As talked about in the first patch in this series, passing NULL as the
'mssg' argument to mbox_send_message() ends up causing confusion and
quirky behavior inside the mailbox core. Despite this, there are a
number of drivers that pass NULL.

It is plausible that some of the drivers passing NULL may have been
taking advantage of the quirks of the mailbox core. Specifically, they
may have been taking advantage that calling "tx_done" wasn't truly
necessary for NULL messages (it was a noop) or that NULL messages were
passed onto the mailbox controller right away without queuing.

This series introduces a new API call: mbox_ring_doorbell(). The new
API call tries to mimic the specific quirks that were helpful in the
old behavior and it's expected to be a nearly drop-in replacement.

There are some subtle differences between the new call and the old
behavior, but it's expected that all of these differences are only for
cases where the old behavior made little sense. The description of the
first patch details these differences.

The series attempts to convert all in-tree users to stop passing NULL
for mssg. As per above, there are some slight differences in behavior.
If any of the patches are causing problems, they can safely be
reverted while debugging the problems. Eventually, all code should be
converted over to stop passing NULL mssg.

Changes in v2:
- Instead of just documenting NULL, introduce a new function

Douglas Anderson (15):
  mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
  ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
  firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
  firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
  firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
    message
  irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
  remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
    message
  rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
  soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
  drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
    message

 drivers/acpi/acpi_pcc.c                       |  4 +-
 .../firmware/arm_scmi/transports/mailbox.c    |  8 +-
 drivers/firmware/imx/imx-dsp.c                |  2 +-
 drivers/firmware/tegra/bpmp-tegra186.c        |  4 +-
 drivers/irqchip/irq-qcom-mpm.c                |  2 +-
 drivers/mailbox/mailbox.c                     | 82 ++++++++++++++++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c       |  2 +-
 drivers/rpmsg/qcom_glink_rpm.c                |  3 +-
 drivers/rpmsg/qcom_glink_smem.c               |  3 +-
 drivers/rpmsg/qcom_smd.c                      | 13 +--
 drivers/soc/qcom/qcom_aoss.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                      |  8 +-
 drivers/soc/qcom/smsm.c                       |  8 +-
 drivers/soc/ti/wkup_m3_ipc.c                  | 10 +--
 drivers/soc/xilinx/zynqmp_power.c             |  2 +-
 include/linux/mailbox_client.h                |  1 +
 include/linux/mailbox_controller.h            |  4 +-
 17 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.53.0.rc2.204.g2597b5adb4-goog

