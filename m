Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465987;
	b=sIGS1Zp2ahKbyOucrnLe9yatcCknhLIp+gg9oj1iiCMkjCMJxHIep6N1lg8PtOCperMs
	 gvbVQX299+J3wK0AO6Dl1wgJu58aGGAmJmkqTjzNU8oWht7pJB8mklw4DLrj3wgmLDFYb
	 o+7zl4LIlxQWFYaMB+ALaXxyzaK6tHWneRFsRsrDU4XmRtlSUQ7PFJ9DYFEKyECVfZ+KH
	 mZXHf/ccbZ5ZPd8vz4N/zALAZa7xcZjw43i3i/j8Uqu3ApPUvPxBRkR7AEBeO+gEGH3DS
	 MHaTFuPehOwZTuDcgrPfoyswzicp+cD0KqnEEjHyRCS3NISfm8Lac5eCAreEN74woFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465987;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=;
	b=oNpNxwj2C1b9wHqQ/mu73HQWNxUZdTwPokJbj+ez2QgfGOhSWcsVSOb9c2BWHSjn/Chd
	 6eUHfp8ib12KOo05Bvnk0HGAlyLguB9HAQkCV4IABQuDTBnX0Vn7aC6cvta/0iq72K8CO
	 hBRzviOzuq3d8OC7R4jXZ0rIHW05oYEHW4/AChFvLcz009dY1lef49ijg9NhY45gfth35
	 YqHTRNOFaRaQpGQif+8OzSYHvMBQVk7Q3aqyquIaOThsxD3tkIVYxY7A6q/ZQg+EKWkkW
	 I4EKb5VBvYh2i1CLy7E/rZyREsCwj0o8F9Wxz+W6lualMcCtOdIVYO0iZKE55urBbGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UGPj5Q2l;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64782606A32C
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64782606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UGPj5Q2l
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xVaig-00000003fT9-3Eou
	for imx@lists.linux.dev;
	Mon, 23 Nov 2026 21:32:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H3n6mAsS5DvYsC96ijuqCARg8ELNAIedKoWS8muN3HQ=; t=1795465978; x=1796675578; 
	b=UGPj5Q2ljk0gjSLQ3VPxTkTuotjL60prA6c4LKoIWWkVPzz+AVFZDuw0KusJdNPrPTWc9kCiltU
	Po5Xa/Fst3ZQO2Zqtd+klujoQZGE/XYKQ6N5WML5oLFov4v/G5eGehsvtyvqY12vSc5lxTcWHe7ov
	0jEOxghFKSJQtSNpe/kNsydgQqTWcLx0GMXHQoXb8nDYUCa8NidVoJQb1M4+4KE9vdH+3IrjB1YAx
	q4QNCSmlEZtJZrrW1pn7V6M/+lcs86UeH08i0EtP16ZfNGcl/0j1EVQxNjwmSF1IRCaGmrS5bWHsg
	XLSDuW47eLA33Vn7DupmM3dT8oRvawIFyhYw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RFC 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Mon, 23 Nov 2026 21:31:18 +0100
Message-Id: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
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
X-B4-Tracking: v=1; b=H4sIAJaiBGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3czcCjOgWE5qcUl+gW6SoYmJqUmipWGqmbkSUE9BUWpaZgXYvOh
 YCL+4NCkrNbkEZIhSbS0AaYt1WnEAAAA=
X-Change-ID: 20261123-imx6-idlestop-b14454a91e67
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2710; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=Hxj0SZ3rC+SPvFigy5m6+QiE4mX53fcOuVFZ5Bi27dY=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKmZbyCj/we5x+baOU/ADXBrxjmg0W4muH6x
 QEQOnJoAb+JAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSipgAKCRCEYUX6QCjc
 8WrsD/97uMR+tAVbPbcosjxxdibZzavWR3FLDAHpesQUukjgItYmQ/reMgRGvcD7NmA1/K3ovto
 82iQEefJnzz/LZdsOWBTfAQczC3Zabne1Str3ZFOXKwTQC8oLVLsnpSeqFh0zM75jDggNui4i4S
 NQQGOUjUYQT4KMeIZY5UYv5Cw7Fnauo9GAy5fmSZtJlCUNKS7cujlTYmwJabY41CtwI4I+vZgtZ
 R14zuNKX1Vn9KTYAzGBIcP6xGoRtOYJwTkC3ewULcLJIhRxMxA5V+HpJGaSiu2BiGLmlfwXNoSN
 zrXze/Ke2VydtJ8SskPhAoaDSqdYKXauzwaL2TX3aQdyHnrXGooriSMmydcGhy0g5rkrIw1UWJC
 ffbd0dba++JZQ1fidQrvw69PENWoGEg2oxbr6HTf7Llh1wKiUHCj0zI551gbQHL6DCPVA8Cs8Np
 Wf9V+uyFUDsLmZ+8S9fXlzCw6Xn14HgD7RpR7pP+u6xk8S1wUSU6AdydmGssVdYaIq+hGDyqr4z
 4suAH2XsgJlRB+ywfuQDCTnPIh5fcAZw0viEB5Jev3aJW+7C/IBkSlC4gBhdZ282ZIoASPRvSfH
 boY98KXQi2C89iq3RIA8MM5ObaCt7h5AupdBH0k/BdfBOqN7/9d7aj6VTdgSqSWAuFXgtiYiMvW
 bFPk5EimRzpa77Q==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

On Ebook readers there are often situations in which the system waits
only for some GPIO IRQs and no module is active, all the clock system
is using most of the power, not every clock gets disabled via RPM,
esp. those are marked as CLK_IS_CRITICAL.
A usual he situation might be mainly wating for touchscreen input.
Since nothing needs to be sent to the display continously, clocks
are not in use. Maybe some frontlight is consuming power, but if it
is not used in maximum brightness mode, the clock system is still
using a significant portion of power.

In contrast to suspend state, that is not forcefully turning things of
and wake up only on selected important things when the device is not used.
E.g. you might still want to have frontlight enabled.
Vendor kernel work around this by adding an extended suspend mode in
which more things are disabled, e.g. the touchscreen.

So rather add another idle state, which is only conditionally used
depending on clock usage.

System timekeeping is currently using a high speed clock, which is a
major blocker for this idle state.
The imx-thermal driver currently needs to be disabled, maybe some
cpuidle notifier block called by cpu_cluster_pm_enter() is the solution.
PXP driver is missing power management, so it should be disabled, too.
Also serial console needs to be disabled.

Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Probably patch 1 needs a more clean solution, Patch 2 should be good to
go, after that patch 3 can go in, too.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (3):
      [RFC] ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 +++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 42 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 23 ++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 13 +++++--
 5 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

