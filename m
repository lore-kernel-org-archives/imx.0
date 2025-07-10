Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0EE2FE39C
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181893; cv=none; b=lSB+dNKJ7gAOIsQCNenvAyJq8ZX2uNaCzkhZuaVlLMYuGTdCxgL5/H9pIiKTIYbyPV1xr5wZJdhoEFYbRiEmJPHBBognuvTgk5Qhk4RxxYLR1h233TniQg04H6uNYTcfrpOwQjG07hHfQg530HTSY7MJL7fa7cPFet+U6baXK9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181893; c=relaxed/simple;
	bh=3XjDCzSMZEsGst/M49lew0bIUSlQF8Nx3FY6tvatUbc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=csBJxw1nsIRXu8wLzKERSh/MNf8rqNjybferXHu4cIzThTgtjYobnB0thi8qforzHo0U1nJ8vlJev3q2r6g3cClQd6edz6voVQNyJma34yIzFH5DJLgWv8F/gGxkoZNdbcLwoMnLf2j1dSsK/qsGaLfvEqG6NinU7agNoITLJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0ABL9+P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0ABL9+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
	b=i0ABL9+Pog1jTY1TOTLW+CJr43Su+9LZCq868rPGXnu0P5RolFt8OTI4Z1LDr4nsjwwi1U
	d/IOZ3HtYaMByGBoFVEOUrrQ9oTVUg5tHzg+OAGoAn8BALrYIyuOwxQdov/I5IAfKYx2OZ
	YnDeU/6WVYwqycIsyFojjh8+U1q9qU8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-5GtqqYBgPIO6RpFGt_fAow-1; Thu, 10 Jul 2025 17:11:29 -0400
X-MC-Unique: 5GtqqYBgPIO6RpFGt_fAow-1
X-Mimecast-MFC-AGG-ID: 5GtqqYBgPIO6RpFGt_fAow_1752181889
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23689228a7fso20492875ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181889; x=1752786689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
        b=u9rRkjskAueolYSTQs84bklqaN8i8OZz8+EzoLhhL1i1JZDJROjYHkkvF6yjm/cF99
         lnOjJY4Oo/8POlxTgVW225nXa6NTt73ychP9y+8NtblCGmlfACQBe5UfQ4EyWqKOJRa8
         UlFxqtbuZ3n/TAgtsqPzMbCsM2hwCqke7jucee55o2qCdZcmw+4JDoGal+4u+ZV/GEO5
         qDkXjIgZeblAPfakDkJWqxh5L9GydK7x3sr/JTijekH2E6jdhrLubI8P4qwkTnwFi0XF
         K79B8M0+Ob6X7WrVaV228X3BOabSgEDstFH33EUZGYZCxChhhmAFlG0Yo3vbu+zCveUl
         ub5w==
X-Forwarded-Encrypted: i=1; AJvYcCVE8ce/l3chkP26DFrN0TMaqBdCrH2s7rCpZRGSWhdfAeFLhk3F1a8DXuz3/bevUESnV2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC6FkJJPxrd8XZLAPyiUjFUKfBMrDvM1O4iufIz0cySCGwIpHW
	/3xf0qzSvGOG+BIm3gjVh4ENb7YS4SYhbkUY9z+Vs2OtVirJwbJNGXh1cIpCyLtA9yeHX/eJK28
	sMPQPhbyUhcf90YBicGz6jlQRoQWuH5kXLRxEsugB7m+TCaZcOwsItQ==
X-Gm-Gg: ASbGncvcSDbVJMrheWyE/Crx+DB776iKqg6DT5VpPI/x06TnORcQUXIM9HEMg7qYZf7
	jYaQvqdY3aP5ynywJi1qf7uEj/QA4HN+0HlxegBt2U/3yif9kiB0PwTESiT3Z1dH1okBe97sZ4A
	YZ+0a436/rtLetsJo/CIihiQCkMWZ/7zt/7eevQx6M1Yje6MaP/ZIk1FN/CAnPcHzmeoBGPa6zq
	HgLydfCXu7aS5NGtJrOCzByGvLhpEyBQDngjDv5TeVXvX739bJM7oDqptAfy2GMoy5jizdi/uWZ
	BgtRHO94zKQQE8Bs8zGhIuC5xU0jDlhFTyFgp5rylVALpA==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187555ad.45.1752181888752;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH40itlo9Q3VPwkodph6SX00btge58CCSKjrR52Pux2HyjpRrEkkomBu7+5GLThfJJL/+J/yw==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187315ad.45.1752181888452;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:36 -0400
Subject: [PATCH 04/13] clk: imx: cpu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-4-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1427;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3XjDCzSMZEsGst/M49lew0bIUSlQF8Nx3FY6tvatUbc=;
 b=cZExAeUB9HVwWRLw/pA+Ktj6jaDvyzLQbPvJc/XdM+3G/yEOb+NDOTlZV8oaiYClRWR49P9Cu
 xqOnNjF0BFoDoL6ivjtSPWRBoBq1R6/6yfsdfsJwfwgf2c4wsH9udFq
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ypl5f2rHtVvJkAP6g1o4ksElO5a9kTOQfWdkTw_ady4_1752181889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index cb6ca4cf0535bab2d9d519c46a84564711aaf209..43637cb61693845f54b3bd1b92f548b43bc30caa 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -30,12 +30,14 @@ static unsigned long clk_cpu_recalc_rate(struct clk_hw *hw,
 	return clk_get_rate(cpu->div);
 }
 
-static long clk_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_cpu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_cpu *cpu = to_clk_cpu(hw);
 
-	return clk_round_rate(cpu->pll, rate);
+	req->rate = clk_round_rate(cpu->pll, req->rate);
+
+	return 0;
 }
 
 static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -66,7 +68,7 @@ static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_cpu_ops = {
 	.recalc_rate	= clk_cpu_recalc_rate,
-	.round_rate	= clk_cpu_round_rate,
+	.determine_rate = clk_cpu_determine_rate,
 	.set_rate	= clk_cpu_set_rate,
 };
 

-- 
2.50.0

