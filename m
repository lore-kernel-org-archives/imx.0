Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D632FE308
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181888; cv=none; b=OgafB1ywg8ASnacZhIyP2YenZ7YgjoRk7xzDzwNE+0bNId7vn3Czmp9anHb6mL4nfLIuUeghjwjYh0GOoiSeQOPQmIyWkRzNgYjfxbhmxYUXtGnNjDFQ+NELNtasduNN0FDKuL3u8nx6PqB8fIk2yGcHc2BtGEZ9Fn58SRM4n3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181888; c=relaxed/simple;
	bh=lPrXiqoaFyoeQgppqZyKjenf8NouReQ9MLOykK27dRU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=RfIQdqETCTv9x09hh2QOpeGGoOkziUYXL/M/KK263AnLPRksSt1rPZT9fHkRfAAiUF4z04NYVZ1yfzI0K1VhrOJvJOPA2WkGUDhq/BkqjeOn1eQz3iRiDcN5JQ5i9TeOeCmrBY3dJDEw4Mtk42V6sQPqY2LPOZHdcjBVtAWOz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQoDoCa5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQoDoCa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
	b=BQoDoCa5NKXePxcDt4YRVOFT49fPXKyPpRcLSCXLPLcxJKAaDzdXE+rCbxcV7vufnWAJgR
	uN9NH4Xcc+esIoecieQuy2ggCC423YAd1cxk5rlYOJcZV/POib2RQ+TKk4y86iXfCoi9sH
	8ae+9xgpJLzM74KsnV6KvBUux5tQDKM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-5ieBMqVgPfSs8WRdv7C0fQ-1; Thu, 10 Jul 2025 17:11:24 -0400
X-MC-Unique: 5ieBMqVgPfSs8WRdv7C0fQ-1
X-Mimecast-MFC-AGG-ID: 5ieBMqVgPfSs8WRdv7C0fQ_1752181884
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so13635715ad.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181884; x=1752786684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
        b=Ts13v7WUItxFzvvpkOSSHRMIcawqRET4Sin7aJo3JOPblH/jLeAcCN7uShCv7Ou0g7
         Zp1IX8hTdyBPJl+NlcBd/RQPTM2PcZaV5TTUZwtNQHW30hg3wIXvEkILTl0MyxA/K70S
         cUBYMcrTbd2yCoKddneb0jcqvy3NXB5NVySvuLsNY95PQurl9ojwuxmKMC0Ihv9CPNwe
         BLgOhlRjscl25cHatt4nTKQi/3g+TBfifgoGoIXdRlHXq9LNK1zdROpoYQuhTUq2xbfi
         L+RB9ZYgS2IS4FEwNM6aAfaQZvl5CVFpTiql85i8BvxfC+VLHJxP2WYvlwWnPuSZKcfi
         PRcw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+dpuEBSAQco9l2qqflse9JGaJzkkA4h4hWtmb1i/ACyMgIqdf7WH8MXK1eEKPLPzHAU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9PEuVUONod5kk4PO6mTZPoYxLH3bizCYLNrc+vZqTGb0+TsOG
	+Ue4sSlO82r6vD+/Re/1W5QScVMd44sxOcP2/IQ7XINiBihK3d8A3xc6RWa5H0bW+qzrpkmZrCw
	6gfkYLvQjCBqm5uqkps1ao3NpMklfN2vS7sEgRczn9RPTQqOtwMt4kg==
X-Gm-Gg: ASbGnctjq4ESsuztvLVl7MSZRzydC421TgNxGknjxld8aGnvHCua1eu9INN1cvEx3yW
	850SjwgzIeCmOMRzmFsa92n8L4tGvOpqjZm3963Ep6gJLFNi1rDJ/DqW3pdYs/O6OCwCXgqWb2y
	oay5F5Pz1wfDmWdS1ZgSGWjy3/gz58TgSTGpcpp+clt2G7kJqrSxqp90WQZhE6pkh8OD4kYvvgF
	4Cw10VcCn7AcUvahg48Jy0m63HXzomnVP5aNPIGx03ajfCAkYdVe6791qcHTMomrU8S7ZhNrVhd
	/sKR1p7P6GKteysnqv0p4MljOPvu5FnGcQs/RtXwjvdAWw==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506695ad.19.1752181883918;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNa2UCk5k7FTMLWvw6UQJNvfPCttMnQwWDAo/7rPurjR8kL9UheWUSDb7RYnWa9zSSn9KGA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506465ad.19.1752181883603;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:35 -0400
Subject: [PATCH 03/13] clk: imx: busy: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-3-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1695;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lPrXiqoaFyoeQgppqZyKjenf8NouReQ9MLOykK27dRU=;
 b=ciEnG1A2klaYkTSHYFvVaoRa/pN2wjKv7PEVsBTn7Kp+Jk8Ywliy431QYRxSaXvfJ65Sw7ubU
 j/w9HsVKxwvCcqSklIqFbpTvivNQM65pYXU2jaE1sXWg+NoqQfSRPs6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gdEvU_VtN-eau9lKIkRap-hGmj0ttUXewUwud5r7jsQ_1752181884
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

The change to call busy->div_ops->determine_rate() instead of
busy->div_ops->round_rate() was done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-busy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index f163df952ccc65baf300b62048f4303b0050fd75..eb27c6fee359d12eea8381cda981eab650ddcd50 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -46,12 +46,12 @@ static unsigned long clk_busy_divider_recalc_rate(struct clk_hw *hw,
 	return busy->div_ops->recalc_rate(&busy->div.hw, parent_rate);
 }
 
-static long clk_busy_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_busy_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_busy_divider *busy = to_clk_busy_divider(hw);
 
-	return busy->div_ops->round_rate(&busy->div.hw, rate, prate);
+	return busy->div_ops->determine_rate(&busy->div.hw, req);
 }
 
 static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -69,7 +69,7 @@ static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_busy_divider_ops = {
 	.recalc_rate = clk_busy_divider_recalc_rate,
-	.round_rate = clk_busy_divider_round_rate,
+	.determine_rate = clk_busy_divider_determine_rate,
 	.set_rate = clk_busy_divider_set_rate,
 };
 

-- 
2.50.0

