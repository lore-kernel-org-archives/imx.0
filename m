Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7B2FEE0A
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181941; cv=none; b=OkXMjZGlblDbWZI2hlJOdABTYSqGpd56oYnUdb3+r0671NQmmhHfPD0MSAfhmFXqoaGjoalHFsdp1EOlkDwvufvj0oeJSIUJv/3ulMUkb9KrDHiG6Y0z7IZB1XtKOhXUXnF/vofTwGuOChW8pH7ZWiZiOm/97mdTCaDCdzCVYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181941; c=relaxed/simple;
	bh=v3hdhBOHK0qUhvNSpx+BtyoEKUPgUNG99ieRMqbb8UE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=JwtldmtPPw0mSUFJ1uTBJDPDZ4lD0EI8R8+tL+J6GAxhR2XoU9Z677uQtbfttYr3RsEgJlxMvJ9SNsZie9VVl2gUq+DjGlxrjlvwIg0Rp8Mbok9J5wI9bVTSBfLK00UGRB3xT97+nqiIxknZZwJntDz8PxaN795JZc8UymWwgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIribfkF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIribfkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
	b=UIribfkFIPpz19RVNXwDWvs52fxspzjnhoDPPxdd+svW/Exsj/Qytce/W68bSVDnDyrCsJ
	p4FR8eIZpXM8QUfoVPlOcTtmTpAk0CKvB3OdkFbA/CcTob37oBzuGtJL3ArcutaH3/JIoQ
	O6KiNOlNSgkUZIGy3rdfVdbyXKbllnA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-xXceQTElPQ-NZnMY9L0AHA-1; Thu, 10 Jul 2025 17:12:09 -0400
X-MC-Unique: xXceQTElPQ-NZnMY9L0AHA-1
X-Mimecast-MFC-AGG-ID: xXceQTElPQ-NZnMY9L0AHA_1752181928
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235c897d378so14349685ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181928; x=1752786728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtfKlLhcG/kkS8hkYuoUj/IIA4KAh790Vr1OByvwXU8=;
        b=SStjIErWvWIMQ5izS6ZB9e69K3lFO66F6OX0dli9tLKehelDjtIsx+PpTbFq01awL9
         RDFoU7YdrC2ChxszOLV3I12jBmJLpTr2ltgamHV5cxAlPavEDPvlWBgNcwYIKsGa90XY
         sz8w81C9KGMvolJhkb0T+6zr7JShcA41PqnGszWNmDuYfPympn6G6l0Xu1z89x+cZLFw
         doIfh8haVgAtJ2QGolnPfGzV/xk9Xff79ZxiD8h0tg/DX8aMGtySGlc/7JST4DCEhupP
         Z41FOGXejCfK3isg1qOBJNa/iN++e0SAFOEeIonNa1+wbA6UIk1ZsJHv1QXZV9SESThS
         BylA==
X-Forwarded-Encrypted: i=1; AJvYcCXO7wBDj2yMS2eVxApCoueunnQxKE9afah49W8LAFk5DBCz4khbxQ1nLKJ2WTf5aE4jJSM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfngtdvd4iel7MwZ2ZZGYvkQ/SS1zpRKSDoJjIDtlckhiK4Wcc
	ChfXkLy+qa3KehPax+ggm8iuUu1nFOXkV1SsTMnsF99yT5Zw3iYeJhGtgB8QHTHCemNq++HoXe7
	ZdDYTGr97rWI5bybvsb/iB0KCd+ZlrNKV89H3l1KOMyKFqLEqu95ESw==
X-Gm-Gg: ASbGncvgI47Kl16TR3sO+DXg/lTKgEO7SbZbj0lUTuwW4oZQrPo5pUa8EZteKi5B/bO
	beD4MBWzwEXe/U4ngk1bm3l1Ltln2AxBu6AqgP2FgD/1EDm5aP5K2CNTAEBq+wsfiIll+r5o4BB
	4cxwuKlyc9VWtdgB/11WgOHROZV3XqZEwIe/Q0MycLfdQmatCuqv17GdJyy4+zHfEve+ZsLP/FG
	rF+iw9H38EcGvNIT38ROnOJn0Yly0vEJiG71ixaq/nvzb3/J2D00Nw3DYolGONcxvwKCmGWGbkK
	N6CI5L6YdXCJQicDPplfB2LjsnzIVfZKZgxm3Nemt+gvbQ==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885845ad.8.1752181928453;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfqFdZB30s9Ns2OTuViOndMsHrV92VUKAaa3t7UGJI0pLP81WIaExo2hP4WyXbE/2+Ovdog==
X-Received: by 2002:a17:903:4b24:b0:23c:7c3b:4c61 with SMTP id d9443c01a7336-23dede2d292mr8885575ad.8.1752181928069;
        Thu, 10 Jul 2025 14:12:08 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:45 -0400
Subject: [PATCH 13/13] clk: imx: scu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-13-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3280;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=v3hdhBOHK0qUhvNSpx+BtyoEKUPgUNG99ieRMqbb8UE=;
 b=8ZgfFYF2KZsuweqpz1xsyECauFflmi/TsZyTLp4K/6NlZj8L/AQUvX4HpvZ6yVLmtnZpaXBYR
 CufxM/OrxNxAF1m7eYGGkqwIl0G3siaDy/4VyAsIls9Ss5jZ6J2R9M9
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vqsGICUqVW7h8rtasKiZD0GcuFPb3qw2MWR0SUa30cI_1752181928
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

This driver also implements both the determine_rate() and round_rate()
clk ops, and the round_rate() clk ops is deprecated. When both are
defined, clk_core_determine_round_nolock() from the clk core will only
use the determine_rate() clk ops, so let's remove the round_rate() clk
ops since it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-scu.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b27186aaf2a15628910ea6a3d4aaa5320ec4295a..77c4cde8a72bd71653bbd2e95148bc1357ec1aae 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -269,24 +269,6 @@ static int clk_scu_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-/*
- * clk_scu_round_rate - Round clock rate for a SCU clock
- * @hw: clock to round rate for
- * @rate: rate to round
- * @parent_rate: parent rate provided by common clock framework, not used
- *
- * Returns the current clock rate, or zero in failure.
- */
-static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return rate;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -454,7 +436,7 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -462,7 +444,7 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate  = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -766,15 +748,15 @@ static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
 	return err ? 0 : rate;
 }
 
-static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_gpr_div_scu_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	if (rate < *prate)
-		rate = *prate / 2;
+	if (req->rate < req->best_parent_rate)
+		req->rate = req->best_parent_rate / 2;
 	else
-		rate = *prate;
+		req->rate = req->best_parent_rate;
 
-	return rate;
+	return 0;
 }
 
 static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -793,7 +775,7 @@ static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_gpr_div_scu_ops = {
 	.recalc_rate = clk_gpr_div_scu_recalc_rate,
-	.round_rate = clk_gpr_div_scu_round_rate,
+	.determine_rate = clk_gpr_div_scu_determine_rate,
 	.set_rate = clk_gpr_div_scu_set_rate,
 };
 

-- 
2.50.0

