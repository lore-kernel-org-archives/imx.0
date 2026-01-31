Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F015326D50
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847112; cv=none; b=sL/I/2lwNY6C6KZYz4Y25Oj7oPAa/T547MvAMsBVKWLd/zuqGZFGVvjIwyuSjmUdxssI8cKC8NPdXkbp3wVsQX7ZGSUVvkMrUhjX/hEO5+Z5SSeuLttHnNF0HXhgcFgs+/xZfgJset1Qipf2iE/wx7Qnei8jxwqGGpBPwkgUQmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847112; c=relaxed/simple;
	bh=8z6Jwe22roU0IcUq5EjPKimwprqUXrkhxOXSXzExrCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Djg4hTej3tabpSXaygepJdgCNORKPd01JOv8A8Vad6uKv6+jmL4q47t3GcrjIVjsRbaN+A0hP4Mm7B4tlYpJ/Z0nDPrktzSFMWSUMhAzzvfNC1Y7nUzHvUIKDE7Fq6v1TPpUrQ/p4NLeA/bxP97o2PDZvckORxvyiewzuX6X7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmkzTpnc; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmkzTpnc"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a1022dda33so18589465ad.2
        for <imx@lists.linux.dev>; Sat, 31 Jan 2026 00:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847111; x=1770451911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=NmkzTpnclo21WOtz1Nb3xIqHtgMDgp0au2BkU5csObEzplTVOWRZF9SAL/3TTj0QxA
         4N/aTC0duumZrRsrQ3m9VigUmfzIu0GfgoJjAbWPY/WPjqfgUihkuEEkpVEgQUPYCDO0
         TTq8ZTs7fOkJIrMYr6b1o/GSpXVxhUTEzQl1WPtWAikoXE59ZDOE1Xw17vPnLlDZIntR
         FBAbImT/2lLP9wbqI4vJg2xD817meiH5bnevupWhx6WZuaGmrEX8KsFRmuGpMO8CjDXr
         Y7nwlJL7M3ISwbkEIcHPPT6ChnrU/KTb2/F6YCQh3KBvLghBEGvcukuAa1HzQJksJF2X
         6cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847111; x=1770451911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=RgLh+FZeoc5NcuqtSVszeqZsD50Hkv6QpkLHcmHFFRWwIzX6y0OkQf3KVYYOw7IkZh
         Vh6Jg5DdDK2c0UzEPMI9oeallBWRwZa5mQPKvqhHRSpuOCJ/hHNK58TUo+M0l3Vo4mIp
         uMpkqo7QCBodtrOgGLqZecRTqy6RXRVJtfz3fFjbzsZ6jYENyE8I73gSa4dksdtaC2xn
         /XWbNgEipPCwbZ4NAA3ht2XjIuIgoOit8JITpOfIwzc11aATzCh8o+4TxNOIUinR0jdd
         tjEJJ8/uMAT2CalU+BhDTaOgRroYoKukTKTynqjJFfuzJJ5Km+4/JnG9NjrcUo+LvSbK
         TfIA==
X-Forwarded-Encrypted: i=1; AJvYcCVsYR1sSN0z0C+mOF52aW+FOtPjpgjDCAITXbH6us78JZTg8AICvJRtmrmVXlzc17sWAyY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpeQP26yaZoyGB/7ZYC6z8vlktmIkZVLx5SkF63oMuV0NHvZ/m
	zkNqOORJL6k0/yah/nf0w/vnTbFBvQFkgPCo8VEPIsVH1fzUxBZJL0U/
X-Gm-Gg: AZuq6aKMsHZVPpaUKwTwiavryFoBBKJ1M5UcmdmwCJ29PrE72MDDZhgGdNKQBVnB5ZN
	u6Z7Hy6bJXOftfpnQ9gqmp52TlmLHvohczxr+kTRNDZJoYAwVFVzSc27+pFqIwNtp4YE6U0FdU1
	tJdaEA6blXicn74uKPPXZXKrpj9u0Bjg5iPZ93sHH3fYZ0WZtadsA+0c/t0h3JawDdzD+Z7G0f4
	zldaWaWRrQTQDb6+PdszdIXE0jjqzXjxVC4Dwt2gBywXJLSRnL4UaeTq6cgaN8EvcDMLTzlgTWk
	EC5fdmvH4LieVUPyf30gILTKBCkJ3D1TTEJHK96l2GjWa4WTJCmN3M1NJ0WD8PAdhm+NkrT1w6Q
	Y+n1ABro6jgy/d9BA+nWagQMcnYGStXwHeWKZQTFFyzgO21vovTeIbIcfX76gD4E816iRxZlxGj
	Xy6wPFcUs=
X-Received: by 2002:a17:902:f544:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a8d9592938mr50396115ad.1.1769847110853;
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:35 +0800
Subject: [PATCH v2 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-2-70471ddc99e0@gmail.com>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
In-Reply-To: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=8z6Jwe22roU0IcUq5EjPKimwprqUXrkhxOXSXzExrCg=;
 b=oiRk1okIysEjvHlGj/5wAp4PFaBltdhhMRDvFAiXGskFVm57xO67i5mEoNGJaNojLeDz5+wu+
 WdOTQp1dMycC//jtDtoXsQb3Te+V7M8qOzaj4IqkCVqdZ0e5zHzDORo
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing a memory
leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index 1d8e8f0891a3..58882dbc3a11 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 		}
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: parent clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		parent = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		rc = of_parse_phandle_with_args(node, "assigned-clocks",
 				"#clock-cells", index, &clkspec);
@@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 			return;
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: child clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		child = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
 		    child != IMX6QDL_CLK_LDB_DI1_SEL)

-- 
2.43.0

