Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690979;
	b=JX9AOS27bbxcq5Qd9oM+4gNBy0GyzxSgIoVrTuKxD5H0yRaIJ4w5u0KXtAr879TbeTm7
	 pWnZMT13JYcOZTGtAanjMMQy8l3qXktf9LpahhydGIKC98wY6ePFVxskBMh5oH7zKXieg
	 /HFHmrKCbgBvJ95DuM0zOqrds6KSy4GHGYL9r19Q2Ob8Lqojxwo6QRhDat38zd7bqpOHp
	 p0YLYOeFbDBFExh/IthPF7TzH0nedBtSHYhtTfnyigyeVjqWWYxFmq64LDttLvG4O+OKB
	 CzYgCWwkKSasysV8vHf/KZK9ueHN8+k63mNnbN7FJJV8moX+0r4FfMvmA2CtinCtsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690979;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=;
	b=Q3dIiF9FnrtukXMT9ktDVuIgnYXTc4KyUi0QjU2SqZtuFscrlXpw1nn5/qVDPmeCHJAs
	 g5ctioILYH8+3rhX0EW+1tcNk3xlxPUMkdTcQeQDfy5gkSAIG8wSwzyxBxsOqVZp63kTh
	 Jwqs9N8t3ZlTbHKn6orM6QUzGvesExaW5aiOVrGQzzwy35HwVOFEC4JCBwQwXLlsSate6
	 NbuBNBb1KaHwc94CjBmmCtXSyvNNmXjgT1B77CzWmqBm/ff96f+rHWh0gma1kJqu0UspV
	 4EwiULo7pUxtc9zhlAjmjVyp3YQfh1Yrb4dk/1wk4LIEvcZsbwfgK5nKsvA/iuOOdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=pkbV1Xpb;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0DD606A338
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0DD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=pkbV1Xpb
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xWXFa-00000003rRM-3D7H
	for imx@lists.linux.dev;
	Thu, 26 Nov 2026 12:02:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=9IdHMMbuye28MG1N1+EIFoZNhCivuWQFrrAdjyqCNjo=; t=1795690970; x=1796900570; 
	b=pkbV1Xpbo2uoyju2oqaXdL0hFNNCbCXV8cXMgWePz6HGiJKesJCMIjD8MkWxbn3fFzUFRbPbz+i
	bJLrPd/lXDgmQFI6eJWF2k3wIt3VdJV38T8o8lVth0C2EcGR3A0zS9p2iaG1eMBTxWmrJeF4lyfCC
	E4rxqBAom8qmVNQ9j9SoLi+g6dAIC5GcotkxqkfN+/GkEhr9YbsvwxME0CcCX/w45uwPfqNIF3Z8w
	aKitk0iVt2HOD4EFSv8ECFfDjoeulLmi1gRu1tuACXaWiS3sr/f978XoMC8F6phyXdh7IbvNZCWXp
	rvA4Exuvce6qtXagsZl6hl+dB/AbZmwvMXmw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:55 +0100
Subject: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
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
Message-Id: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=0tK0It/89Mk1v8dt4LN/eij+sq22nwXBnCv/qcnypmA=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBG8ghAnJK74UD2DhFiwPDN8rbNLchU+k8vxF
 8E8guv9xTKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRvAAKCRCEYUX6QCjc
 8Y1lD/4kc436aFhE40SpSwZ0oxIDQ0Au2qpEokCgreptv67OD//tKduETpSG5Sa+/BDEKZEHJrU
 0Iniv5C4fhe0D0B/Kzwv2pqSuBNIPVKL4kPxcgUq6C85FhcVQ0r0ZTNF3YG0uPY821DjqOHRp0P
 Jr+xIpC86nIeK5GZiuEorldh3rhtrmXZkjZBHZdrz8Mt2HVyqDQxLhk+fE2QAwGy93F/WhoKgRm
 /1Bo9YIWjCND6t5UiE/GN5Ewr39TwxL1v4AVc9s7QV0NSTQGQV/Wbp8FvaO+Szq53TrYlXm+DZa
 gHXDgrcFLOHDMVjG9ZI+mgfkyzEqRVPE5X7Ofuc4yapfhvp264ertoOeyyaXhZa9gAWze85BVpx
 E2SkKHDmtoYNz8h6zzCyHhhiiYdJ9V5/vpgUwQMrobMG8bIfsW2rdm7zVtq/90cCyAt02OE4JwR
 bzh9SyTR/rP61eacPnqXrgCPz8Me8vmeTCCQsQl09QAxZ4uNUp1ARuexIJk+bDrpc7sMCMUeQEk
 lFIJdDkw5zM4mUAeCSVK496y8Py+TaVGVnNMrm/HTJ40y7o2BT4CNCplyfQ3Ho21ANF5KfYIRBL
 tKv+gSz5VwRk4waAahFKsjZsNovdMijRK2eObPxQhfltC3vtH9HRLTcgXmSMvgnI4KlhqCXnGcg
 vJFfRFhBa0qvVvg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, prepare for
using the 32K clock by configuring the clock source accordingly.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clocksource/timer-imx-gpt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6ce..85fd36fe1c760 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -50,8 +50,10 @@ enum imx_gpt_type {
 
 /* MX31, MX35, MX25, MX5, MX6 */
 #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
+#define V2_TCTL_STOPEN		(1 << 5) /* Stop enable mode */
 #define V2_TCTL_CLK_IPG		(1 << 6)
 #define V2_TCTL_CLK_PER		(2 << 6)
+#define V2_TCTL_CLK_32K		(4 << 6)
 #define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
 #define V2_TCTL_FRR		(1 << 9)
 #define V2_TCTL_24MEN		(1 << 10)
@@ -271,6 +273,7 @@ static irqreturn_t mxc_timer_interrupt(int irq, void *dev_id)
 static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 {
 	struct clock_event_device *ced = &imxtm->ced;
+	unsigned long rate = clk_get_rate(imxtm->clk_per);
 
 	ced->name = "mxc_timer1";
 	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
@@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_timer *imxtm)
 	ced->rating = 200;
 	ced->cpumask = cpumask_of(0);
 	ced->irq = imxtm->irq;
-	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
-					0xff, 0xfffffffe);
+	clockevents_config_and_register(ced, rate, rate == 32768 ? 3 : 0xff, 0xfffffffe);
 
 	return request_irq(imxtm->irq, mxc_timer_interrupt,
 			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);
@@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer *imxtm)
 	u32 tctl_val;
 
 	tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
-	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8) {
+	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8)  {
 		tctl_val |= V2_TCTL_CLK_OSC_DIV8;
 		/* 24 / 8 = 3 MHz */
 		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
 		tctl_val |= V2_TCTL_24MEN;
-	} else {
+	} else if (clk_get_rate(imxtm->clk_per) == 32768)
+		/*
+		 * if powered by that always on clock, it is feasible to let
+		 * it run in stop mode, too, allowing lower idle states
+		 */
+		tctl_val |= V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
+	else
 		tctl_val |= V2_TCTL_CLK_PER;
-	}
 
 	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
 }

-- 
2.47.3

