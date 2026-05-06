Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A70241695
	for <imx@lists.linux.dev>; Wed,  6 May 2026 00:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028635; cv=none; b=UZamBdASz0kp9sQPsrf8HLzGGyieDBKbD2hTXWYE5hCNM3LmDaEZnTUmS0jQyPPBoInThXEbO5poHlDYEyovSdby2crrwf3KVg/VU3YGuu1mw32+cC/AVF1uIoKOmbTXiXUDg/j1X8vOuJmunVir/GCGc1nTF7NuMjKc1kTDmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028635; c=relaxed/simple;
	bh=9eLgOe84G1+qgxzBhagvDPxImGCu+A+SFA5V4275HKI=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=aiYEoFVS3npx/5L1am4yvltw68tTJhadq9d3cW73eyVMYHNV1HTHacGhvfSG5B2uPIRxzHePMjj6uYmcQjvckvTKtL1xp8dPce3ZTDwdWqEN5ufHx0MI5DsmYqpoKrlMtWvM0leO2VttZk24H3xPmb3Yq8R3axjXu3JH3I4hniA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahrtdzqh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahrtdzqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
	b=ahrtdzqh6SRLRNSrnhHrdm8VAhcaHkqSMbLJTlh33zen4XJaMtBFB9fm7nK37H3iqb2Tgm
	rzk1kCJ7a/G+0qX5pf4D5xmVdIfp/f1G71XfaMN3QzbKnVwoSE78nfDJJ8IjQ2XEkYLvE9
	6jTumw9AtTauq/p311F7LpM049HVvm4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-74E-945bOIWIIBk7iBNFmg-1; Tue, 05 May 2026 20:50:32 -0400
X-MC-Unique: 74E-945bOIWIIBk7iBNFmg-1
X-Mimecast-MFC-AGG-ID: 74E-945bOIWIIBk7iBNFmg_1778028631
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ece46c4ba9so1140698785a.0
        for <imx@lists.linux.dev>; Tue, 05 May 2026 17:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028631; x=1778633431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
        b=TWXNZLr3GBLj5yh+xC57aivWcx2jPD3rObZOjQeGIRARwHar0U6oWIiJHkYZWd61cu
         j3EWZaNhjNipn7PcXcr+rJp5zxayHwJSLbLNV52pHYpcCQN6ZllnOhZRV4FW+4Hc4ef5
         nBMy4ANQi/g5vBtjwv/EfLOAQUDaUybsHukOclGUI/9dVW57yA4ubWP2pEdekIQJ/OgN
         KufqTh0Pu42Gx9Sg+xdeS2GpIvrm6zDRtuv6tin1MbIcEinZBPlNMd1+ExFmcXy3F5xS
         IKMrW9R6zOKto/r9nEwO4YvCcwt01rqiFtVthA2JFHflMNVkBUMyT4iwdcJZR3S4DAS3
         63Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/7JRQLzlkpn6HgWc/mH8iMOaMjMzAzOatN1h+bPoo5fq23W3nOd4txr6/Z0E6MWKs9rpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCq10RfdecFTY7tgtCSzD+2pn5XA4QEvIsVd/nPJ2ApV0yR2O6
	lAtB9htDrr1SO2QtNm7zNQRKrF9jcLH9Zr4aHqcXi3N411NRxY9h6MVebvSCP75CwucyMB7pIlv
	1cWTRxC7W1YaUdqe4XbL/8+ITUyTD8GRdCgISIdVVZrCbyhC7o/75xg==
X-Gm-Gg: AeBDievyxC9dDyasE+XZU0QwhoMMOUZh1R5rB9kAGos7/RmIb4Ne88NVUdebcq8K1ii
	bbXRV7p8W17FuJO2hM9SsIube/zRrl4xVnQr5Fn1GUsCuKlSJW0nNl8kqb2UJrx09mdha41qlh9
	8PfvTK4QNzKj1xQGRFc4Zni3+KFVza6m2fxPxhjRyr36YQQIsBWS6kPKyVdy22pdzpcZAIkz9gI
	tPJ624ebPXgG5Y9DPWfSX3sABpe2v8iuCjWtpFms43whn/sytVlmy4RbJXGpbo0ph7WFPB5VhaV
	G30hEEdIRt3cgcYb7WziUF40FuEIOoX7xuRf+Xe2q5B3PJqGBsaqX9GH+rxApxqYckr01eQsOrQ
	EjecTn7mH01q5eDMKGbASI1J335bFniLnQ3V+wgQIL88GLz8XaEWdnInUf+YsmKWt2hv7Ba7C
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224561585a.34.1778028631314;
        Tue, 05 May 2026 17:50:31 -0700 (PDT)
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224558885a.34.1778028630882;
        Tue, 05 May 2026 17:50:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:57 -0400
Subject: [PATCH v3 01/15] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-1-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9eLgOe84G1+qgxzBhagvDPxImGCu+A+SFA5V4275HKI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXANuDRLyTWHUaDKdJaMwAzB7R3Pfnv5yCwtvfb6U
 ddMzn7vjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSrsTw3zFTdlNm3AUz4Xtf
 7Tsey7+LnPmRUYwnJ1vGaX/d7ndVHxn+1x++IHLLq5njd8Jpswt3Snfeyr//rde/ev17i+l3jge
 eYwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pAilSSEmPppKUtnR3VB5oe-EpqtEQNttTjKBsMrnIfM_1778028631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ec..658b6d94de9b 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.54.0

