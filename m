Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690979;
	b=HfvPQc/IdR4ZSKaoPE8OH1XlxzNV5b9iP7DZifqVyopPT0qJTtukk5+dSveyhyp1d9AA
	 QWqdra9KH4eQLUbeSJV0+UUyJvwbp4uP4qPJauwoZmlCBmKHaeh8Npn+z/5KXE65f/UlX
	 4JRs8Qj3wnTjPzm9ZHweTSndmeVfc4TwCDZrtxzixh9ZWIzAQS2Cw7ZtaBzaX5aB4TC5P
	 895kdkqpI0qzdM9oAhi45h5h5ivRx/N6fTk3FB+aPF2VPJYGSpbC5GWt1CIj/UpGJSAPX
	 wNx0Qxrh08srEiIw57bKGGvIYUhfYnoEx47j3AHfEGYbjIFTmbsYf/n+qyOvXtwqECQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690979;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=;
	b=gPtG7EWv5kjTKOWRYbT/86U54hFNvVUOawtlsuZZu2JktzI36+9k4zJcQgjnqyz61M+k
	 KlAXl7A3L2DkFN8VjfwFULJeIdeWXo/DvrlRxZXKf07wXz2H47xBhRbvpVYZXYotVqUqy
	 KqyOblc72y5HdaR24T2dTDrjhZffQuuNPDIcR3uD5ufmxrKWTyvyPc8DB0rQF2vLDpkHA
	 QmmJN3bOLuheIBI+MMDCuozIiqle1xVN90Z/pTlXnZKGO3pKmfichx072ftQUSWtdWzdy
	 m9wNjuM8WCyPESbqEUOo3UeZhxpFtmRW0QweO/0IohjaOGsZDLwchB8oQ9vx0WefODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=ADFOvrTY;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC9606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=ADFOvrTY
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xWXFa-00000003rRO-2Qgg
	for imx@lists.linux.dev;
	Thu, 26 Nov 2026 12:02:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zQFj3ohXXKJNtzT891WGzt/tJZd/i4b5W1/3UD7wxug=; t=1795690970; x=1796900570; 
	b=ADFOvrTY+MWJXS2gLDrOsy6olKjRiuOgwfiQghEpzErMiVNFEc3mgXRT+I9JdxzqLb0S0yBYjSa
	//4AtkGwUksB3TfT8q0a9Rrmpp7RfyhvLKFr+U3PdvkffvGnSH338WL25XsQY9v5ztrdLKdYzKjx3
	poVACWDi/gz6Jhuvv/efq2fYzWCJ4VoIZnmXLsdY2s7dXS33GrD6k5h5hXg6VHeZOpnAr7uIlSo3Q
	8haE/7zteltASo67w7WLvWDD+F/7XzGQ+H+3EG+YOAUJf6ECZLrPWVamSmjUZgdkTHn45N//upb2W
	ogR6QBzIDtCDk2XekHzxrN6mkj7h4/jf6/3g==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Date: Thu, 26 Nov 2026 12:00:53 +0100
Message-Id: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
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
X-B4-Tracking: v=1; b=H4sIAGkRCGsC/3WNwQ6CMBBEf4Xs2Rq21Bo98R+GQ4GtrEohLTYYw
 r9b8OzxTWbeLBDIMwW4Zgt4ihx4cAnkIYOmM+5OgtvEIHOpEWUhuJ91yl4UpmEUNSp1UuaCpM+
 QNqMny/Puu1U/Du/6Qc20SbZGx2noP/thxK33zx1R5IIKadEqRUrb8km9My0d2dkBqnVdv4nYo
 de/AAAA
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
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=3y1MjYnUQP1b4i/yB5OBFm8L7NSHxZ/2T79EJ2IZZrU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBGo20QiKQj2Kk6TYiezX1vwmhPlg87VpjS5R
 MDTZEeHB2eJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRqAAKCRCEYUX6QCjc
 8doQD/4xNG0xsfpcIWVuJNun49d1/vLRPIJ/NmKqBZJLk2gZCbQmMcmLZ/UzMzp8jzUPNfm4dPp
 AZqRZKXCBE4rrk7A/HEPhOjnvCLkd7EuSL5iiD+YuFVZx5xVdg61TlRC2yOkfjLRZIIZsvnEfWU
 Ys9wA7fj5JHGCLQfyEmWBMDslmZgmCrJqWqRTdM4Ke/MHdsNzyiVuu2TZGv/Xz09AMi/NZmWNu+
 4qHNFJdAxi3Xkzrhx/3e9h4h/5N+uspi0YmGb3N2/zeFTsMYfzmrUhd2vD7x82jBFK8QpfiZD95
 G35+059aamcwmTtjzwK02f5ljVf4piOrC5xEwitb/ShWX2p/6RdsoTMJJ4dSg5o9J/iCpwYSc7Y
 6TxF116CgVXkAHyk+JAfrrTb5k/5UT268u1tMnZi8qVP/2F+0BYfvE1jwJeSXYfMRt5wBRhh/Ch
 F6GcgSpp/Hjuq03APY3ll1M4meKTCfLzJALhJnbBMmSASUGs8/rW/hczrJ6RRnQhlR+UkGy8SsX
 3RTRT+YTG2EwTLNfx/4gCNtEiFbgDQNN9xzYlZwHbSTMMWtOOnROjN+0MWl8czLKCe4/WG224YH
 gD3fjLusGdFRroL6dQGdCQpMkZF1NxEuZ2pjtYAIVHeY/z/XwPHi3dtSo6FB6ZK5Vw1wENGOUAO
 AOHHknY4VLyQJeg==
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
Use 32K clock for the timer and the clock source to avoid that
dependency and allow the timer to be used in stop mode if that low
power clock source is used.

Other things preventing entering that idle state:
- imx-thermal driver: probaly needs some notifier block called by 
  cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
- PXP and DCP drivers are missing RPM, so they keep clocks enabled.
- serial console: needs to be unbound

With these patches are applied (and the not-yet-upstreamed EPDC driver)
I can run a loop displaying the current consumption in every 20 seconds
for about one week. Power saving is around 70% in such
situations.

Patch 1 and 2 can go in independently,  patch 3 should go in afterwards
since it will break things if the timer driver is not prepared.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- honor disabled idle states when rejecting the new state
- remove redundant imx6_set_int_mem_clk_lpm
- more comments
- do not show new idle state on other cpus and when thermal driver is
  enabled. The latter to avoid misreadings until things are fixed
- block new idle state on dcp activity
- adapt min_delta for clocksource if 32K clock is used

- Link to v1: https://patch.msgid.link/20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info

---
Andreas Kemnade (3):
      ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
      timer-imx-gpt: Allow 32K clock to be used as a clock source
      ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer

 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 ++
 arch/arm/mach-imx/common.h                         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c                 | 54 +++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c                        | 31 +++++++++++++
 drivers/clocksource/timer-imx-gpt.c                | 17 +++++--
 5 files changed, 102 insertions(+), 6 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261123-imx6-idlestop-b14454a91e67

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

