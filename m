Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673494;
	b=RRh+3AHWn1aA/Ew47gZX7+wx4ResQCtTsc+FBBuqTokfa6SxqBr1J2EzEDt98OhggcHx
	 qbXZ3zBQhRUwE63DaXMY2BahF8x7rjJ1r9l6C3SC3/WaakWhbqk2L9sBI0J0dxXc0lh4+
	 VLageJ/JTGkuyIz+uv3Mxs3wjf0f4UrZZfi25Zzx1W8mzOVfnoc7J6YO7Q3o6dBaObRU+
	 BnFqBHV/tX2N4i/0wim1eKfQceO2VImbz6L81gZNrkOPOCChD5e7h09QUZvD4ZERyd7sR
	 tse99eCEHYsvGaQx2drFsoxdzYhOfpj31j4Nu6dx1UE4enl3kLtAOU5fQjztGddGHBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
	b=yU6gSiEkleGTGhBHzCO7cIraBhf9RaNYGBVyfzEWYHj4km1cfPbdt+EubiHxNiA9s0Bj
	 /x0gIJ1JphKbYlBKcSZgL9ye5V+KqptcaOHmjDvnVKT9gkCE7hcrB/7T5tHeojt0SDqQ6
	 sXh0eQLBbCy1pllMvuW/PmKd7IkX5GmKVhDDXd0Vyml9K7u6iDCz9ytg1t5aY1HPe/TiQ
	 CPHCsN/zxQPirIQY13pZbi/FyYcZFE0S2rQTdeYxoX7Rc37zaJbs3AedQ/0CPJnnABKvz
	 3xkG9BgdNhXIATtNw7tC7g6sXp/jsESwLzs9R0HBBv5hcUmE3f3Qi4zEBm70OBE9Hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVJURTmt;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49444606A33B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49444606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVJURTmt
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3783335e9.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673493; x=1793278293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=hVJURTmtBAPpvGOiHBkMiojfOuZ/DjSWg1t0b8vyNyKy27uh3U8VVlGNk3NMzPNZuP
         xZ6pp1Y/UVQF7WkwnwzqcpNhXYH2s6mxhdlx8vCYrQwS6WWkkYqsf83TmfZxpMctN7gH
         gZpZuDSPtGstcnK2BxsPdifuRyRxSB3ZqxDm+BZmpulwLdex2ZeSct2E0ZY4C2AsPipi
         nXh7JT5jd1zAqZntnw4fBo4mdj7j+NogKgzlawcIxbU4PrOB6wGE7r0ts+hmBvQrhcts
         Cy0TOKb6RTBaZ5Zekzm9rdjawkIVrvFPFs9r6uQjhzkWuOy18SnkXT/HzA73Ze6zI+sD
         im5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673493; x=1793278293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=YXZrjoeJrDPGOgjyEQWBwVYHBGMcHsV1+3Y7ayt4tIo3RMnbPyzaC8nKCH0ZSBTRlr
         pP168r4ffiXTBoPxNMxEp4BVlA9GCOq61mF29mMX7JP4Mh85GIvJsBSj0VFKDDLthEEb
         rNmwfZkVH07DVQWCNiAtknB3RTBCEmu3PoKRszY0JGu1ZpAOD7yHKxR1ebW++MAxwhG3
         pMsN4pExDG69rCWchpNynOaGrYv6sFyA1bOyGVvRhmslDViHvZusr+RjkmgqC4Gd/Rea
         Ni2O68M+8oUNXxNtrLot3sGldLaPfdz+MvqAHyllLU+Cq/PRuFsX3lmr9CrQw03q9aH6
         k+xw==
X-Gm-Message-State: AFq9FYJetP5DtimSD93Y2nCwP240T5MIc9r3h+Cjhh5BC+SHBtf0hD2X
	UrnsDU53HxE8UUNLKfybA2nNqJVAwrZ6nJs6HojrnpApY9VyNggD751Z
X-Gm-Gg: AYBFou29+OysuZdeRAw8k3wCsRJS5LVmE/id8vKOo23a1UpfZ/aZ1Jcafql6GSkQuPL
	FZ3FSa4bEiOGoDXcvgukh/dWcAcPQR+M3DD/R0MhvpBIgxdIjLSlI+0pbq9eerqRfmAbXRD3nYN
	kGfsLDHVPMxWJ5/X+yG9MtnnEGNe/WrMaPwizjGFMRLn/C+YkifhRmNp3NAXD+x7lUOOeGOgF1z
	czqboaJ9YDXWwwszL3TwJwipaHUmGpcWGhaVP1QaJkmJ5NyIZhzmtmAtNBs1LzEYsMTj2bLwdFA
	glUwG7DUZOobWvN1r0TxMUilIhZVyBgfw5/QQUPObJu08xOGhhnPUy8FnGVrGhSpbEFZrpzf4RK
	soMGSuXWRWmZvzwYh3fKYGd1a7G31IdC9aZxquhSZEipSNqYgoj+iHBYgfSa694lb7mkCLc6alD
	d/XOH0Zxk6OqKBqhg/yOrqR9a9DXkDrSpyOz0DzAp9fRXSyIJssFQa9rGTuswNEwKIAnjponMbs
	m98fziGJ7HQ/HEJWp54oNS/PzSlC7zBSyUMfoxI8SlIiNuIMwE51lE/vmuIqgiMt2Onjw0ryWDY
	XXJMOJdLLuxMZbBUI0RaxTbZlxEcedVmiBf4FJm/i+rH3ZPV8Ri1cuU=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr105959715e9.7.1792673492547;
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-4-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX95 Development Board device tree to provide a ready-to-use
DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b8f497c5c6e..18d4ed73eba0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -985,12 +985,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 

-- 
2.43.0

