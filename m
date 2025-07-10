Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935EA2FE305
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182143; cv=none; b=euChxRuqpqH0k/6+Hc/stKoJVtjgTfsU4QMINfVvX+mfrIAWUig/U3gYrr4XjrjSZ/VH0IxTdvsWAdPziStv2iEYlyO6FQ75ZPNGqdhV5jHYZdAkuRk0W8HMYZIFbzH/GonCxnYZcggwCSDXpJJariw3UtepyruEsXO1WbEVUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182143; c=relaxed/simple;
	bh=sfg1D1VawT3AeNVMpNc6Mus+O16Hxr+I3BmqtW+ekY0=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=EMSqLXH8vU5PhU9//skS+aTcRTcB5XJpV5QC1hKLuU/7nsJ4rYdxtRB2oYHYYBvn+t+1sFs7kiiQT5jR1FwocSqiSV+2lpNr22x/XBimOAgQnyMSGRTfMmf1ofr5Fnw2GN+pogX6ExteW8T94dpmC7SjJJZCvjWaCdqF56Dzy8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSMdh/Qv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSMdh/Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752182140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
	b=iSMdh/QvNiaUcj9iqaQh+3e62MtngkGuOJV8e+/vmdsAgV2XkaA9oY6uqFjyxgbdsqTajb
	u2CKV/0tSTXqhS3TcQGoAlHvX704Aw9ILckqg+BVk9gBWAYTqHxQAwr7b94LNUy/K6MurK
	j2kAI723D66JJclgjiI45Ay2FZSHcQ0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-Sj7ykNviPn6LFq_VMANaIw-1; Thu, 10 Jul 2025 17:11:16 -0400
X-MC-Unique: Sj7ykNviPn6LFq_VMANaIw-1
X-Mimecast-MFC-AGG-ID: Sj7ykNviPn6LFq_VMANaIw_1752181875
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b115fb801bcso1553286a12.3
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181875; x=1752786675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
        b=LFVoOhGqVjO7eOmIxv4uenLGuEl9DLezEUJB5QfDbgaboKkjF26yY/BH0tea8MtQs4
         ZTHCRHM9RJF2BUqBHKmV4sOaq2aisVEGJpAoKj3bOR3eL1h5Bh2GgSvqdVQczUU5C/71
         8yaOerNdirZI//W0OErrIUejjtfvXJPjgO+oWxHk36zV12/PKmyjUIDu4s4ZqvJYVd5Z
         4E+oE5Ujlx9AxE1kPEbY0irHfO/J5AmhjtrHxjaUyqhmIz6njDhXE3OB8OH1QkIyapwO
         JEAakxxFtV7NSl+1LoZh6BbnCuLkQgem2YNvA4Br7PUXRWwdFqEeO1p7drlVAqvCn5hj
         Wwhg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Wm/at1GONSDR4pHpBj77P826r0JjCa35d/rFsezeNIXjDv2S/WH5lR31d/sQiu9o0Vs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTxx/Ju8Y/t+IwNKMrP07LgGdW+Qjekcgo5us6Y25C0XxhlMbM
	jtIMsU+e8FXZRvcCQ1740bhm/issLBRM6mlxN0BIODVkyhq+sbP4VF/aSMuJ4nvbrCpc/B+kNhQ
	tU0FJS4vKESnw8eGUvOskK81lj1VUbMA7JFfUd3C0ZrI6VTvx4pPDzQ==
X-Gm-Gg: ASbGncu2raHk567AzoA0b8b7kg4DuzZwQ2z7/w9V2838X2PhwzwrUbOFQK0Njr63ODH
	71VHaz7hLZ2rdenNizelzFDgpjPj6EuNGPzqta0p2WmC/kYjn8fkfcM/8KIiAeg3hi6hHGJet0V
	hT0+D9+XpAOVhXC6X41RnSu6TPvQE2I0iKiBvzXfUpPN1kOSjqZnCKlGLiu1rOPu6c0mL0gBYva
	6b/CB04n+qP/B7E4112NTkM6EMtfsb2rGlqDKvad9Go3CJRlThtV8PiTD+AxxoKldBrj9Uf1Juy
	Q+fRjTj3Il3aZXEdjnXl7lak7Av+zxd6WwSTfvWqeVENhg==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041935ad.39.1752181875441;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtPLby5dImEh4am3XdyrII2Yntq//gK06C7azIRRxqBEH0aY25p3N3xI1B7mTgwV0/nXxQcw==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041625ad.39.1752181875042;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:33 -0400
Subject: [PATCH 01/13] clk: imx: composite-8m: remove round_rate() in favor
 of determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1717;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sfg1D1VawT3AeNVMpNc6Mus+O16Hxr+I3BmqtW+ekY0=;
 b=Blg+J8i6MkcMkoaGUje1wzbwYgk1ZyPQvX73Fwg8TLuepmHSDlLAj0LMghIN3/KasFrhpihnH
 tnb3i6CqC7/DhjkxxkVAc+yA7mEN3HuU1bi2XXgEYAMrcDuURfTP3dC
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lrDpqs8O9W9uE0y2ah2lpzb6V904aQVSeWd79dqqmv0_1752181875
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
 drivers/clk/imx/clk-composite-8m.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index f187582ba49196e3cee2b5dbaba9bdd9b091bb40..1467d0a1b9341bc4b0a40591bca00392eabf7cfb 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -73,21 +73,6 @@ static int imx8m_clk_composite_compute_dividers(unsigned long rate,
 	return ret;
 }
 
-static long imx8m_clk_composite_divider_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *prate)
-{
-	int prediv_value;
-	int div_value;
-
-	imx8m_clk_composite_compute_dividers(rate, *prate,
-						&prediv_value, &div_value);
-	rate = DIV_ROUND_UP(*prate, prediv_value);
-
-	return DIV_ROUND_UP(rate, div_value);
-
-}
-
 static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
 					unsigned long rate,
 					unsigned long parent_rate)
@@ -153,7 +138,6 @@ static int imx8m_divider_determine_rate(struct clk_hw *hw,
 
 static const struct clk_ops imx8m_clk_composite_divider_ops = {
 	.recalc_rate = imx8m_clk_composite_divider_recalc_rate,
-	.round_rate = imx8m_clk_composite_divider_round_rate,
 	.set_rate = imx8m_clk_composite_divider_set_rate,
 	.determine_rate = imx8m_divider_determine_rate,
 };

-- 
2.50.0

