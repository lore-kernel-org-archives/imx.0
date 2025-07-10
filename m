Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3762FEE0C
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181897; cv=none; b=BuXsLq3QkGfuVa8f569qiIK3QRF1eBUT7ZfBNmK2kRUgzBOf74i50h900hvLJZMA4MsvddxAHJ+wK5yGugs7EWYb+OYpqm581DMYNHO6C6cZLmqHbRgYiQpJUUVg8FmIFC8SuCm+XSdP/AcO1uddwhXW57c+SIzzQ8yqkD6/AKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181897; c=relaxed/simple;
	bh=FmCXWb+BuxfKsiZrK/6kC2xW6WNc9yFq8m/tSU8l3Ak=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=lfG1T79C8kTHyX+dSQPp5u5wr7k/uo1BnuA/632d6DHuEPcFDu5NgjtVvQeR92DH93MDmm14mllFN1zdv0JBvJgwRnWYGvpkmpgoqmLO+ZREojL23d7Jmiv+wIcqJH8rlSZ5fp4IAPecoJXRNTeqgAGq55L6he4ARoIUQeK/Y/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RgNvr+gw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RgNvr+gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OdI2n2BbI6O31Zan070+SCB6OSAX+67NNWJKs1Y8dU=;
	b=RgNvr+gwYSSp0pIIpfqFmgMoqQOCsb+YFtq4xtxc+err/UliRLVqj5h54hpjFPJ41mtjGy
	JS1yCiFUpFMILqJsHJHLBMKLJ967qMoSYhmrC9/tyVyKFfWGSzj18PWYJF98N4EVesr12S
	qSh/f+dREHiAqaAV9IVQ4Sey4leViXI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-luMAsODeOrWbFiQfm2-vzA-1; Thu, 10 Jul 2025 17:11:33 -0400
X-MC-Unique: luMAsODeOrWbFiQfm2-vzA-1
X-Mimecast-MFC-AGG-ID: luMAsODeOrWbFiQfm2-vzA_1752181893
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so14330895ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181893; x=1752786693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OdI2n2BbI6O31Zan070+SCB6OSAX+67NNWJKs1Y8dU=;
        b=QP+pXm5GTP9EqrHCF1KZw6k/VaezA6fFmrFTDuUdpBkjkepfhzohxRF5ce582PdNLk
         7ll8PRIpwhJkpY24e5vanmmsiwpWkENQ8pJxn2sGA7jGDTFTPqnAiAqxYHB+PBG2I/Vm
         IDY79kkHs2cSfXFmq71abh6DMFcubzXBzoOkvScnmU74KkHo5o/QXryqyMF7nbyZjqco
         JYIYjlOzJ+QE/HDCBTPxUdi0AaH5bdZWYUvoGJTCVOaV6wqGu5/L07JRi/nHTfldWsrn
         HxUkdRPG0Ul7uP9J33pOVhxFNVb3ie4BGA36aFtufqOqiRuG3LuKlBLAWLuIzuGStMiF
         BX0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcpK25kqtZ9NSYAG8RYqhZ0RxcgD6e/IBKYxSxAFpUDTvRCAkwjwXJSZc0vehG2EN5uYg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFeV/BCS0PTZ9UAQkZH1lkeq8nMLtHAPOGM3Wa9F+pcWCJOaqQ
	9sf+nbfDtdueGsZL19RLvi66oOfewnzFt7AB8b7pACFiBcbzSOmGwBfkiNHhim3wkdOudQyjBOw
	gcSWHWpCEHIJN5ACCqgU24oMkrwzDCp4oYP9uhnII9FWHJvEua+Vn7A==
X-Gm-Gg: ASbGncv/irtidDgHvhAtg0UPVAWIGNA5CIYH4CYbZfrN1DHbxwQNSlFMGqS0ubVRvmZ
	lpqJAFLaWG43SZK4WhCDpTZXKTVuJKQDE5TfEmu/089l5zHFTXqZw4LtfXM1lwThCPfoohUUGM1
	B8vvI3lpG6174t3JuJEwQydqUu2y6tfPrmVkPZ+DmzCHBI9ZbRblXQG9+R6MHmXdlFjItAY5VpD
	0WOHFW1/i7bltcMlLmDxq6qUPUOngATXwA5bIqgY5u3pa0MqXpIBj82hxPCMT2uuZAl8fAh8Jed
	vJ/BTo4aJPeAIZL3P9cVALTcIK4M7HWXFsT/KVWplNw4VQ==
X-Received: by 2002:a17:903:284b:b0:234:bca7:2920 with SMTP id d9443c01a7336-23dee26e1e7mr7066125ad.24.1752181892837;
        Thu, 10 Jul 2025 14:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAu3uiVY2jtZDcVPMevBM73tyCaoBmEhvedjxReOqIZVBYPZ2AIvZ/v7pzQGp0pUiWsezqJw==
X-Received: by 2002:a17:903:284b:b0:234:bca7:2920 with SMTP id d9443c01a7336-23dee26e1e7mr7065935ad.24.1752181892473;
        Thu, 10 Jul 2025 14:11:32 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:37 -0400
Subject: [PATCH 05/13] clk: imx: fixup-div: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-5-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1723;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=FmCXWb+BuxfKsiZrK/6kC2xW6WNc9yFq8m/tSU8l3Ak=;
 b=hclBooQtsYlgA2vFqMcl7brjchHA4Ks2oNDabec40XP6enmczIY/tMlPLkAvRmJvAPEBVB+de
 m+Reyr1sht6D3e09RWi133tloOn8bbGLpkWznbErndPrN6S8OmRbddA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F5CYd0mTPSPX0dBaKG3KN8-ZegdU9VectRgz53is3ak_1752181893
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

The change to call fixup_div->ops->determine_rate() instead of
fixup_div->ops->round_rate() was done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-fixup-div.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-fixup-div.c b/drivers/clk/imx/clk-fixup-div.c
index 100ca828b052d701be84b62378844c1a9fcc1aaa..6af8fd065fd3cd71b66713105aa68b3b19a22810 100644
--- a/drivers/clk/imx/clk-fixup-div.c
+++ b/drivers/clk/imx/clk-fixup-div.c
@@ -41,12 +41,12 @@ static unsigned long clk_fixup_div_recalc_rate(struct clk_hw *hw,
 	return fixup_div->ops->recalc_rate(&fixup_div->divider.hw, parent_rate);
 }
 
-static long clk_fixup_div_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_fixup_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct clk_fixup_div *fixup_div = to_clk_fixup_div(hw);
 
-	return fixup_div->ops->round_rate(&fixup_div->divider.hw, rate, prate);
+	return fixup_div->ops->determine_rate(&fixup_div->divider.hw, req);
 }
 
 static int clk_fixup_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -81,7 +81,7 @@ static int clk_fixup_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_fixup_div_ops = {
 	.recalc_rate = clk_fixup_div_recalc_rate,
-	.round_rate = clk_fixup_div_round_rate,
+	.determine_rate = clk_fixup_div_determine_rate,
 	.set_rate = clk_fixup_div_set_rate,
 };
 

-- 
2.50.0

