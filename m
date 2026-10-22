Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678181;
	b=v77v7PxNl5xjADH4AFQ1rL1hN53Lr0i0ImZ/Erkh/sTeOSOrrxeb4sK12k++JNUuVvw6
	 cOS/p6L3y83ylCSfWIGYID59hx4hcIRtDLBuMyGmDXBukvXa3ZC9uNEc2WTv5vziqoAO3
	 v8iINmU3ki7gM+RtabgqB5PRxTYo3kfop+TUW8XwcSgIKQFOhf8vd7nhBs5dzj788dH8E
	 8SZ61sJ6v34idA5h0kczi4+3UiJIWi/sWn84Ovnxm/HEdfYOnBOnNZpO3eZSNUJ5i4yrv
	 D8ki0IpfZlH3YMinZBbMrV+4TEQYZQLSOjAV0ZisJsiuwnLYtOCiPoow4jSy5Ir12IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer;
	bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
	b=EN5CYOMoLwTumee9odxxL/oVqdz/WuGqC+YDHN0ryuz/7vT5MGrtXkEYZF9d1d0ZooYt
	 PPt7DrTEvjCTSnPCz1cUhRzGLGFz7kgfMxFiJ8wfj9aVWw9uBR2uT6b03Iw4E0PM2dx/4
	 gJATh6d9jkVqbwIL5JrW9dfgdRT6o25s/XKrXldNsBJq0zqoIPgMqJXr/nABMbCqae5bw
	 uJtH977kwuhO7zLsY1boeV+6PVTuk9IKvgFS7eTvdDcQFwSSJzebXzJ+9qLHOico2dqdi
	 mFKrF/vYNPHiMbLFQEvYvO9s/YMzsl8PgkU5fMc3mKuLRGJLcGow68ITtzK3YMIAOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pgvxZFoW;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172ED606A322
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172ED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pgvxZFoW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1860076f8f.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678179; x=1793282979; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=pgvxZFoWCuR7OIm51+aPWn6Vp2Eq4gafvdUTDOssyhZghyr5OpgyA+oRXRJQw29/uw
         MZDXaJ8od9trtu9h2YpaSJFi5le6yBXn8unUgnqfrkryjND37V53BHvKlZzzsml21Iys
         LmanTETlRblj/xvCX+djC0cd2/9NLpYEmbtPVwLiLRqZAN7k/3q0NzPA9SA4qcSEzRHm
         iNcYC9NSNDbXrX9GjnlplL/w8FHiUVy4Vv7nwSUeDJx7/eqp4E1SCR5FLTlMDXYiZd3c
         TtGCY7AiC14lqGrsfEBKciBp9jGWWFolEEKiWO2JN+mfu7DNwVSFLtBvLUEzcHOtNmEX
         UTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678179; x=1793282979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=Bo7CnG8tjmmZJ6IH/rSB5RbtURo/Hh6GaRlpk7qbqMaqiQ0LRALzpqkGdbEM1BrcUd
         gQ6dPeBlnnQT29T/rEJuP4UmP88lu2QLOKJMcT6WdezZ+w4do+zemrzJyKQpTvdBE/ct
         oqG4JQlrcrDzt5Rb4V4fsv+PWuPlBR9IBhTKhPKWhyWRjO1ZHdadEncfS4JH+P7uOB/y
         wolCrGFRQKchINBxowaNKk4NVt4WSyxg1bCOlcnSD1v/E63f5rhfBPTOg8A4crHJUYhm
         zf6wU2DO/M4xzlSg0TBWpg16ws4fdX8y/xnhdjy5e62ysdK34oTeyPWcN7/9QVAMWxBz
         +D5A==
X-Gm-Message-State: AFq9FYKgHpWMZeRaKTi/6yYWC0dseHbjjYLcr1sUrUovd3rh3/QamR+U
	azHYukuBBsbR4I6taAqm3Q9YtXDreAMowXaWJnd0dMW2qFG3QKjHC9qj
X-Gm-Gg: AYBFou1qqID3p/xQi5yqSAEdwNKXMRfNTaVcB49M89yHYp5boZidQK25LytgG6P4DUQ
	CKMAncEQJkAvT1CgLtEUQ6LDLCvUsn1C8tqRii16qfnTy3ntWXogIxVAf8J3+rZIPu2EV7zLowU
	ivkDneY09+DYbUutT9au2TfkVMiNs7n+BdLlFy+HqHzOcquEodsGQHW2cKlAfLUE81dr06sFT4h
	4pkD/rN6hS+K0H8wPPS+VWOU8vLQmqtN8WP7lAyy2Yth5P57GcS5xhUpzXz0I/OIVY47tQJzEyv
	qYO3JSPS8ZFv54gOoAM1acYo+ZfIFToYEQqNf4CehAupZ7olTC1Lo3b1pi99QIs16of7UObnbpE
	RtAyXZEBy1rjUMJjBmj61bn2nrB2+mZDQPVjVGs85nQFSt+d9pq9z7cLM76Fad8wgizQU3HKggL
	LTlS9+edeCSJ7lJXEbL48ABbYsFhyLkil6mp+BdwaLWAiStrQV77OQIb6DW7jFep9lPoH7sipL8
	V3h4Wv2WM/dOOGot/1sXZ1AJecF7KDzzolykZ3LIPjw6P5yFsoOx/rrhuMU9U6N2ByP7osxVPjW
	KB4bdMOItHzS0rWdarcXSXn/+nQQy0fCAUwtAuENqiNtztM0Xktqba8=
X-Received: by 2002:adf:e00e:0:20b0:48e:1e03:687f with SMTP id ffacd0b85a97d-48e264c3ffamr7880482f8f.31.1792678179143;
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex Cortex-M
 UART overlay
Date: Thu, 22 Oct 2026 16:09:32 +0200
Message-Id: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIABwZ2moC/32NTQ6DIBBGr2JmXRrAnzhd9R6NC8CxTlKlgYZoD
 Hcv9QBdvpd87zsgUmCKcKsOCJQ4sl8L6EsFbjbrkwSPhUFL3UnUWiQleNmwFT5ReJk9ih5tbVD
 1rcUayu4daOLtbD6GwjPHjw/7eZHUz/6rFSNFh42S0ky2se5exmak7er8AkPO+QsnW9p3tAAAA
 A==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Several Toradex modules assign one UART to firmware running on their
Cortex-M core: Verdin UART_4 on Verdin iMX8M Mini, Verdin iMX8M Plus
and Verdin iMX95, Aquila UART_4 on Aquila iMX95 and SER0 on Toradex
SMARC iMX95. The overlays reserving it only differ in the UART
instance.

Label that UART uart_mcu in each module device tree and share one
overlay, imx-tdx-uart-mcu.dtso, which reserves the labelled UART. The
merged Verdin iMX8M Mini overlay becomes the shared one, and the
combined Verdin iMX8M Mini DTB keeps its name. NXP's imx9-mqs.dtso
uses the same pattern with its mqs1_conflict_dev board label.

The overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Share one overlay through a uart_mcu label instead of adding
  identical per-module overlays (Frank), and include the merged Verdin
  iMX8M Mini overlay
- Add Verdin iMX8M Plus, previously posted with the Verdin iMX8M OV5640
  series:
  https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com
- Drop the Verdin iMX95 NAU8822 BTL patch, now covered by the shared
  NAU8822 BTL series:
  https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com/
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the UART_4 MCU overlay
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso       | 14 ++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi           |  2 +-
 8 files changed, 32 insertions(+), 21 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

