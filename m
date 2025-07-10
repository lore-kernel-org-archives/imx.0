Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEC2FE38B
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181918; cv=none; b=gtYfqfGj1bHMeNOxaAUeBxvnIrKneuK4UPGZFBn9peZnqtkFPkrr8KIdVt38rD58Vcwo3+FVJ1pZrD5Je73zGz/50vC7SqthAnSnMOaraGOTigiTZK8j21++qYuE7BYnOY7wOXg/iLK3wEdCLcakMOTj5lsmcNs9xcRUuonFkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181918; c=relaxed/simple;
	bh=iCQSW+rl8jgN4muSCz6LT4Tmu/x4mnNV6P0yGM90s2k=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=lKY7TnXr88CO99DnDXJMOiefPkNfsfDkfluITdnOAVBnYULJ/3LTl/dW8vpB+jKRK5eUyozlQeI+W3MDw379ZdddXg3kkSoZuob+Yz8qNU+c0I115a6DmHb/03gdzKt1PWjBAYnoPszf8A2pyNNri645N4LNPf0/TTDiySeS4i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QL6BRWHX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QL6BRWHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
	b=QL6BRWHX4vmqslbbhmDApNgzQJfhOeeTRy6QImnN4RLKM1NwZBGoO8TuopvW0a1I4/K5+n
	k2LiCb1Cp50T85hWCtYGfu1xbKGg7wnsvuQtFMFZYYEv0Ggs5RTcMpfWvNHX2AEZvFR+BR
	e+Rn2Usf8hc/TxZJSyp/hRt1wBJ+ot4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-nAoZTLjMOLa9SIz9UeSRMA-1; Thu, 10 Jul 2025 17:11:54 -0400
X-MC-Unique: nAoZTLjMOLa9SIz9UeSRMA-1
X-Mimecast-MFC-AGG-ID: nAoZTLjMOLa9SIz9UeSRMA_1752181914
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2355651d204so13975365ad.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181914; x=1752786714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3pKi7gmbdRxDMGvDHzDBTkqcBdnugIWLhOTnp7NzQQ=;
        b=a+bydCEC6IJjSXi/bBp+KN4bf5RM/DqXAi7JSmcGn7o1QxyEs+2yROfNJfpfbQA1K9
         zS/o2ahGGfz1+KMLq6FjBFWtZSlpdaFogV+ZlkNTk5LmU1R+rr2BRITpGEtRHTzsnljH
         WOKFBEsAODeZFBsGxfRfhhTdoU9VaKnm13rEvjVUC0+EZiSj5slRd0cZZLHS4wKlpA4g
         cxXRxeqfjyLGmgDkAnd2L507ju3b0BVhu6Htd5oR0VcNsMLFYYd/r1YTUXrRJMCcwkQ8
         7UVXl8om4UNF18CTrawRmf3ocqcKNLCK6PQGHAZuKmV/J3h/Ru7+Gl7xDC3bwlXq4SW0
         GKkA==
X-Forwarded-Encrypted: i=1; AJvYcCW3v6zk3gIH1i9Mzk8sOPlaGRck97wvdup/Hb+8EbYP6WnI9Y+NgIzNCGfP6Gy79AC8Euo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz273q/D8jpHX7V4DulFcl2bEMWVHBGFViNqFIRrpHbRWqBwdqs
	8DZJBSKq5I/3txsN2J1gQ2TFNLgN9sywZ9D5fHCvTmqn2cj51dHn+xasGXuUW5cTGDT/Hwc6WRe
	V91T7swK9ZuM+1Ro+FKh6KGQD6SY8RCxdXRIeDg+1yabiPgUOQtHOZw==
X-Gm-Gg: ASbGncvMaeGWI8+1dtYQWesu3BpZI1saG4/ZS7IWVJOYtM4Osa48iPFWnAuCgPsR1em
	xZGEDdpqm0qfojkG7E2z+Iv5QzU1nz8uivdmoWwO6qvzdiuQaoxH6Xwhc9+aMHhit+gi9FHZrfT
	mAyIU+Dh05uYz7343Qiq726ke5qlvzwYhQqfpxU3CVIHOSBZoX/+bWDSsMbeksrbbJgemJELjXT
	PBAX+NtUqknCeg3T03gW8VThHwCfFD/TOoxelMtBogo/MC6bjJFNdeobQRaeHj62YCMknQlB6eS
	t1CGYFKofgdxiZwizleYroGg5Fgwp/CSuZASMZynWsixfQ==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8791335ad.5.1752181913818;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWwN/SjCjjk2C16hRtldR9Jrxr/5SqinWuYstCSC8yLg+VOTRMI3EYy8AERYnpIRY/BjZpw==
X-Received: by 2002:a17:902:d58c:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23dede2d32emr8790995ad.5.1752181913451;
        Thu, 10 Jul 2025 14:11:53 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:42 -0400
Subject: [PATCH 10/13] clk: imx: pllv2: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1831;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iCQSW+rl8jgN4muSCz6LT4Tmu/x4mnNV6P0yGM90s2k=;
 b=M715uGlNOTk/hsTjTOR0aXywM6syQIVmVaWNxKJVhBAQ3BGt2e3g40om9S0M0IRyr3SGLc/QR
 4mUGYd01DGABxTTGx9atuBwfFNnSmN4pS6Y2gxrB90u0wvVApCNrTSZ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GSBJNCiY3Ym9AGpnkO90gXezk2k1AqupJJ0ANjgQtzs_1752181914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv2.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv2.c b/drivers/clk/imx/clk-pllv2.c
index ff17f0664faad23d826d384fa8f972e21ebd7da7..bb497ad5e0ae3df923e8f01eb2b8af710f8f8f29 100644
--- a/drivers/clk/imx/clk-pllv2.c
+++ b/drivers/clk/imx/clk-pllv2.c
@@ -178,18 +178,25 @@ static int clk_pllv2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_pllv2_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+static int clk_pllv2_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	u32 dp_op, dp_mfd, dp_mfn;
 	int ret;
 
-	ret = __clk_pllv2_set_rate(rate, *prate, &dp_op, &dp_mfd, &dp_mfn);
-	if (ret)
-		return ret;
+	ret = __clk_pllv2_set_rate(req->rate, req->best_parent_rate, &dp_op,
+				   &dp_mfd, &dp_mfn);
+	if (ret) {
+		req->rate = ret;
 
-	return __clk_pllv2_recalc_rate(*prate, MXC_PLL_DP_CTL_DPDCK0_2_EN,
-			dp_op, dp_mfd, dp_mfn);
+		return 0;
+	}
+
+	req->rate = __clk_pllv2_recalc_rate(req->best_parent_rate,
+					    MXC_PLL_DP_CTL_DPDCK0_2_EN, dp_op,
+					    dp_mfd, dp_mfn);
+
+	return 0;
 }
 
 static int clk_pllv2_prepare(struct clk_hw *hw)
@@ -235,7 +242,7 @@ static const struct clk_ops clk_pllv2_ops = {
 	.prepare = clk_pllv2_prepare,
 	.unprepare = clk_pllv2_unprepare,
 	.recalc_rate = clk_pllv2_recalc_rate,
-	.round_rate = clk_pllv2_round_rate,
+	.determine_rate = clk_pllv2_determine_rate,
 	.set_rate = clk_pllv2_set_rate,
 };
 

-- 
2.50.0

