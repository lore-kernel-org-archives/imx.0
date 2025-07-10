Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6B2FD886
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181884; cv=none; b=eE/2FwYfH3yqTdIBQoiEKjcm0vM9mKDuWSpKTNCZUsfvd4JFgFl5LKmqogdNXJOgEFPcsDIB7bmwNmPZSd/j8IdXVm20Qu0bq9B5PKJsuAkpqt4v8TlIW4/EplvXg30khLBs56/Uqf5yPYuikAVR7toC6yckglGBJqDeloW/kQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181884; c=relaxed/simple;
	bh=W9rMxhG+HCQaTapcDP0EemGdUyiHL/4QZlLhjcozpqg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=YGLDWdyNA6A0bNGHzKOXr3JyyPvSjjRUs5Ed34Bk/kON05nzKBQ6M+x6pAzBybC5chFjzoPU9k4jLoH5JN4Y2QsS/zHJZWVe+JFkGzTHIDQ/1X2gFZqB0LdEk+znU06XUpz8oxC11lWwOukC5bzsRM1dfIT4J4HxsTE627XxZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MrkyeE1m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MrkyeE1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
	b=MrkyeE1mK5l3arpR/iuDYR2KHMZa2lonV2q9/dsSP5XGq2wrjVAkJAzq6svazQLS02pFLE
	33mYQajQOg+6ABKVjv8/FP8jCNdcQVsgS+ktN14rXh7aFazI3r7Tdm7i8G+a3SA0cJ95BJ
	VumRkbWp/UczRhCtMruBq/DgcRZAjaY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-5XnrVrNiOWyS8M2DKYa5Jw-1; Thu, 10 Jul 2025 17:11:21 -0400
X-MC-Unique: 5XnrVrNiOWyS8M2DKYa5Jw-1
X-Mimecast-MFC-AGG-ID: 5XnrVrNiOWyS8M2DKYa5Jw_1752181880
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so14345055ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181880; x=1752786680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMHMdgb5Ozof1oVF3d9/wmVqM+1K8QcysVII+1gO/dg=;
        b=DRsOruE1caYt9RWUdJ7b+EtP+nRwqhNbAVaU3eVkAeX+CltLAwx5jIk7R4xVL1SCAb
         0brXPofmeE70logdS3YdXgISa+dgVmUAY012ne+dzI3G0ERbo/0vR3FA1IYHnN9/5TNu
         2TSMVEza46jhSeECgGqhNG2kr4beAF7OSXrnSQXV2WM+sVEp7J552anrhANL6sNwvngT
         nA7omGPxjS+I+gfhvp3LSkWI5uOvT/TtKLJzN/6axVySfejj9HLXedRLFy8wkkiVfWy4
         XZHwCR86pBD9Y6mI2nTwcbVGoQKdSIh6jzBeg9R6LqC+GG7I8GULn7MWyJ53x57lZdrt
         1FFg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyiRUJyPWVP27ovciJCtAA+zCYC2vx/9Hb58a1vouvmROt+Fk/KGYRD7jpiMFGn5ahLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMi9TkRDg1mnUIj7aTmWpVFp/OPAw1IJrszMM22obu2QwryHSx
	yGh8wQFiDVARe15q2QiTvA8uduD1kcPiC4NcR5CRm7j1T8qw6VpTXfKlel2OALC1lQs2VGUmjM0
	OA9GY/3Z+vRXmA+0az5cAy2fmcVQPGwF3bDDTB5uh3uHFFSBvtYttQw==
X-Gm-Gg: ASbGncvE8bAY9vNmb67J3Jh4LpmFav2NM0p4YAexrh6tiSNJpTmcr2F9Zj6PUR7K3xi
	mOpVz2xZLJkMCgGUQlaJvpL7VF0tJao5jsIG+TrmRRuD9MHJD4tUeJAzoIfCEsbHwRnoOcKDae+
	McrVWclxndgw3WfYs9ZvAeGqirSygtUXFmZgCNnCv1iDj9XmIS9nhsqr3ELUBgWwEgLzWBKOXi5
	hM2GGq7a73CUemqoYjg34uPFSSjFt7AzkMYOsSpUxge8g/gdtM4M0PMnwGoWTZ8FzQ8ku4qciAF
	KLsF/hzCiRAHY/Ex/QFrJyF8e/2aWX+7mewIRDzVAxXHmg==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7262205ad.15.1752181879789;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHNiFYs8CFWRvSPbrkmIE4I8ntC8YkoPHeEDzjwj0c3EHunXltU+7bpHWVRTS4Tk67n9W2tA==
X-Received: by 2002:a17:903:4291:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23dede396bbmr7261905ad.15.1752181879329;
        Thu, 10 Jul 2025 14:11:19 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:34 -0400
Subject: [PATCH 02/13] clk: imx: composite-93: remove round_rate() in favor
 of determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-2-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1593;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W9rMxhG+HCQaTapcDP0EemGdUyiHL/4QZlLhjcozpqg=;
 b=p2JvBhXGzB9Q3sTJCTzm0qM4XowHtLIbgUuGE85J8qpMRH1G/aHuClA7A/B83bKS/w2DVERZJ
 SrV4qAgn3aMDET2A7EtLIFuerX32CaXdZX7mJGyO9y00Vbcn4xmkqzv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1NVh4oVaNunGcyJJ-eLnioeRaH7Ol_9s0WTwKz09gCI_1752181880
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-composite-93.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index 6c6c5a30f3282d4d128751147714bf24b64c52f3..513d74a39d3bd391c61db2e9a5b7752af611d3b0 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -98,12 +98,6 @@ imx93_clk_composite_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_
 	return clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long
-imx93_clk_composite_divider_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
-{
-	return clk_divider_ops.round_rate(hw, rate, prate);
-}
-
 static int
 imx93_clk_composite_divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
@@ -141,7 +135,6 @@ static int imx93_clk_composite_divider_set_rate(struct clk_hw *hw, unsigned long
 
 static const struct clk_ops imx93_clk_composite_divider_ops = {
 	.recalc_rate = imx93_clk_composite_divider_recalc_rate,
-	.round_rate = imx93_clk_composite_divider_round_rate,
 	.determine_rate = imx93_clk_composite_divider_determine_rate,
 	.set_rate = imx93_clk_composite_divider_set_rate,
 };

-- 
2.50.0

