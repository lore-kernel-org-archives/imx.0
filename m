Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465986;
	b=5VM3nyAmRMlR7r82dD9BknlEzA+CUraSO+RGO0+KF/6mgkPYo2E7NOQZeM5tFlOlG+hL
	 Kh41SLdp8xVu9dUpz24E30HHebmfrVTI9c/DiWZbxaj2bkAUvUZUhHrQ5ZZdg0GKOgR6g
	 TA3UvALp08W6fqW0kVrhvGfqZ2XdwkP/zxTuwtcyPVz46lsgrNlgTgyxm649YWNRcqzxr
	 Wlyjfxn0WlFu/0RCSBbdodau4DUwuYcE3GJRR+AuSVlYptTjAZWAiLvqNq456LC0Hzav4
	 TtC3XOV5N/NZYFVcJlMO3JMJ24XazOUMhHK0frVN9opkOzpD4TQ7R0/lbadgSDfA5WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465986;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MeOL5WQuiPJrRNxkrcCwP2WQz32GfGwFwheiNLPGmRs=;
	b=kcLel8eCGQQJHhfb7y3FCsq+qH/MBxbn18mMLHfitYINcz2a3gfFsu3jf9rc3b7/acTK
	 3rPq5R3Kd/b6vagJO7iznX82NgN0EivuDsFoVCR+JjyQ0OBxrV7oNkiimXW9bUzD5Shr1
	 jBjPjqSvmWqnyYqIQzH2wZIWp2juo7TH8qk+gV7YhcLGAN9anOCDb0FXT8EiUyixLyhlu
	 p5bdjo/WM3xkr+QqCY/o+Y4NwvcYaEIXt4v6ykpy3bMbV/Ktc6NV8eyX44p0QoHAkByWo
	 YHltJpOxoFWyOwy3uHe7Mmr83kNQdbVzJImYkOKHWKYY9JG4RZEeDApHS4m3ft4mQ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jTbYdewa;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AB606A681
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647AB606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jTbYdewa
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xVaih-00000003fTE-2DwW
	for imx@lists.linux.dev;
	Mon, 23 Nov 2026 21:32:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=MeOL5WQuiPJrRNxkrcCwP2WQz32GfGwFwheiNLPGmRs=; t=1795465979; x=1796675579; 
	b=jTbYdewapIyjkgucxvX2O2iKY0gbh+/sfD+JA9D0N5TeB6hjhFQvrEjTZf6MMxuD441KgRw7tRZ
	Qq7OobUJyMnDBqt6ECeVsmLY9QFdZ/T7gsJ9HKQP5FmfFHRMphLvNZsxBM5bEeSzx5m4XtWLd6yoC
	qaSHtsHoS6a1ZsQD6Mj7EKd9HczKkO60l5oXmWiXij8/LZtUMA+RPoonnWJBwy1OTnBHMvx83SLCX
	NXeTDemnihm2PzJvNdfHjsCYELbC9UeU0NRM4Ty9MmFXqA+RROzQY2Nu658GE7rK89IE36qAqFjF8
	4BIhrlWgzjVN6eVNSrg7Hvk9nVJH7dG/GpYw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:20 +0100
Subject: [PATCH 2/3] timer-imx-gpt: Allow 32K clock to be used as a clock
 source
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
Message-Id: <20261123-imx6-idlestop-v1-2-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=OMgusFlYnyHNaF3mFmXvpoVMfUD10qiEbL98nAnPX60=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKKx0JnQSzWfDoJjNNYZbebVRLqsRoHC87Iu/
 wxiPP28pJyJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSisQAKCRCEYUX6QCjc
 8V+MD/4tj/iELyGTEIUG5cntzZaNXrbq8ktvputcge1aQ5MfnhJxBlMc+3KmmaWjVqBP2VauODu
 8uKlX2wy0kytjdUeL7WmO6cZUVVF7fsGsHBb4cfEdcf8u5V/WFUvN936f88rVBlWRy7Z+WlgHuX
 JOtlXQpe6/qEt3994+vdGQhyjCO/XpPm7EIfB5PA87gA4t5hWUGdJWW1I8kBuAcrafriGH9PkV1
 vz6pPDjHmhwqAxDNY5fOoxL3+6eG7BNwd9aHhRHXVfOq/NLxjE+iysd56KG+ctfyRrNQdGrTOJ+
 PSeDinod5Tu/icJBA6opBY+L95V8cCed5iPL7x79vPdI/jku/1GRRb/p3136u9eM0ZwZVu3PJt6
 m7eNLb8fKs0n+Uwj/ebH9IusKaqZndywD7dlyXxgtoUQ7b/cP640Pc2nSE+JxNSDrhFpQrjL/X8
 DZ2aZpQ0QQDVv/BeizU9GD8aSegNcqqYXVA+tC4MeZdVKCJdQEFUMM5eIIuDyDtW9eR6k69XjyD
 JPnW1BjNvH/uUiNZhYczZr/1V43zi7zVzMeCQg0qgaBNhC1Vyyx/bxvJ89kLdPowhQh7O9zE5pQ
 Rtp+zf/s23N2boQLuCtgCaFeQL8dCFxNfsMX7Wmayf5mZUckpSvx/r18L04NueLBnplvfZfI/yI
 ZDVrCauXF9X/WFQ==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, prepare for
using the 32K clock by configuring the clock source accordingly.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clocksource/timer-imx-gpt.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6ce..3c023da565564 100644
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

