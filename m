Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899658;
	b=W75Uda8Rmj8McYfHaD4GotwWEySBkBqN2e8CDegHWX/D91O/4+845S7I/HFMq6Ghv9W6
	 bbQgfbOuu+8JbOMjyDz+5LJY9KBdh7Vg20D6kUNo+auNwrpcWP1s+phYl4sDl1v9inbxw
	 YVNR0DdSU3dDIwWWmaHzvkWuWwpC2oVORhj+BSerdtTYHqTP/49h8mpLawX/+FoTbc77b
	 v0CTwJ4i/EuBeuCDLsUDdfHcRG5zJc7t53csV5WjfofRgo5ad8skQhh5arN44wGlv6OB7
	 baJq0Nx/r6wOG2h3nUGoZElQorQir3uS3pmZ3kSchTXsOvDjwFujIGdma6yLBadEetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899658;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=D+ILkG4wXbd8ldPQ9WAnmbHHAWHtJfFJtaeyi08GqYA=;
	b=i8Z2rF8JXHEOF7Qovgf7HU0QDhuVcc0IaLrSX5t9N3y45NBEHEuzkLOzR4mj3Ln6+aAD
	 0nYy4d51iUQo7W2MWEjjabRmnEKy101p3B2tZAUSpeISo0DfFDaeir/GThhiip5m1ntwD
	 dzyYOMqfKYD7MKBTkWaiGQolPT8pmS3UFS8g94V3R7CuIhNBdvt1kIFqyU7TqJZYYIXPI
	 A90MM7xKBjOs+7aV8mu15aP3mSO97Q6QS+ForZNU0VYBr3jzstiHBbj+FLxL2YnPoYmVo
	 orbUoOE+8hjj/zEwgzkwQdE3PpRznipc/weGI1yJKIZzHFRMFR+6yaybqTcahmVLmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fXfRWtDL;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E327606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E327606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fXfRWtDL
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=mvsYp9GPf/gfnr4IAxsW1KudKK0j8pKaTP5yb2G8/28=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899655; v=1; x=1795504455;
 b=fXfRWtDLvbzoQXsSG/Yd7042rKZRUWKAGHCNG4JZdeKBzSUGXDUAOZttpOP/a01h2TcER84d
 fxHIpdxoNCyoXpEG4G01uDcMAoV1BFwh2Npb3xNLbMq+zk/H/edXROSmEq2+gRhGBehg6ieeEa2
 McafwWVnASNVwV14OZow/Ps0=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0e4be3b1e41aa911;
	Tue, 17 Nov 2026 07:14:15 +0000
X-Mizu-Trace-ID: 0e4be3b1e41aa911
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/8] irqchip/imx-intmux: Fix and modernize resource
 management
Date: Tue, 17 Nov 2026 15:14:04 +0800
Message-Id: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3czcCt3MvJLc0gpd86TUpJTkJItkI4MkJaCGgqLUtMwKsGHRsbW
 1AJJeQHxcAAAA
X-Change-ID: 20261116-imx-intmux-7bebdcb8c20b
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

When I worked on guard_chained_irq patch, sashiko reported pre-exist
issues in imx-intmux driver. So I gave a look on this driver and found
more that need to be addressed.

The first two patches fix the error and removal paths. Probe failures
leaked IRQ domains and mappings and left the already-installed chained
handlers pointing into driver data that was about to be freed, while the
remove path never released the child or parent IRQ mappings.

The next three patches tighten the device-tree input handling: propagate
all errors from platform_irq_count() instead of carrying a negative
channel count into devm_kzalloc_flex(), reject a zero channel count,
stop WARNing on malformed interrupt specifiers that can come from
user-supplied DT, and mark the multiplexed interrupts as level-triggered
to match handle_level_irq() and the type advertised by xlate().

The last three patches convert the IPG clock, the per-channel IRQ
domains and runtime PM to their device-managed variants. This removes
the manual probe/remove/error-path teardown while preserving the
existing runtime suspend/resume behavior, including gating the clock
after probe.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (8):
      irqchip/imx-intmux: Fix probe error path
      irqchip/imx-intmux: Dispose IRQ mappings on remove
      irqchip/imx-intmux: Handle platform_irq_count() errors
      irqchip/imx-intmux: Don't WARN on malformed interrupt specifiers
      irqchip/imx-intmux: Mark input interrupts as level-triggered
      irqchip/imx-intmux: Use devm_clk_get_enabled()
      irqchip/imx-intmux: Use devm_irq_domain_create_linear()
      irqchip/imx-intmux: Use devm_pm_runtime_set_active_enabled()

 drivers/irqchip/irq-imx-intmux.c | 57 ++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 26 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-imx-intmux-7bebdcb8c20b

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

