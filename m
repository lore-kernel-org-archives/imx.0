Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD6314D03
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227649; cv=none; b=F9GuWhtgeR/Vs3kBHa3smC5mHiabd+2JU/WWzuP9gPY7UGA5WkluRBC4lcgK3N/mbq5O8/bZ3cVeUCacD1ksfhxQ0EFPbt+dEkB/KNCsG08EXYOx7lm3r9VDYaJ3SSL4J1smofPG3QiIBRyzvulJu333zrontOhGB6QnMssCIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227649; c=relaxed/simple;
	bh=LegWMLbCeHe5PZm0Ub4p2iXUO58hksEwiYKg1a+m090=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ns3yTgh88zjhSGVsTCbEEJP6gFvyeb9dHN77DnU7WKPozD+Jf1JiGRRndmFr8JNXXnvIXKQ4i/mey1JGiEDUQCPxK5C1RdtON46cI1oxxeM2GpenixNX6n4in6RpYP0Ard+vSZ75GrZD+qToQB0hStRmwFRPrFi2bypYx4UrQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zE9vnPps; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zE9vnPps"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so2747345e9.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227645; x=1764832445; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=zE9vnPpsmiF+Je8ns4RtzZ2n1rM9Cs+e1rI5YAZRF7EPuBYXqEgGquhSkCruNnLCWc
         15y/neVLSN4UKkUUgCMQZnzp9n8P3h61BQ7GBFtVDp8EqkK6pIy3LPVA2rC1/svtVw9y
         npzqK+sh67tOszIN/q+PO42aKgO1C1FkL5hRE+j7rFkzkakt7h6JE6kD+GUTySHkVpTj
         cYqDsvm2YfNeAOM/X6qVeqUU1/30AKok276IApVNjmmOBcoMvJqDXo4YE8KZ43f9wB9V
         BrQ00XTwjBdbcy+cYuAqAdHm7BPxk6HJ3iXGsrDnOs+Q2vMtzMAOYn6Q6QWck72AH7U7
         Ob5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227645; x=1764832445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=eud6u0K+kmje8NQ9Dq/vuaCjcYJGApbJSMMCCjxn8q7mu2GfFJDGhgFCdGuNUpxJuL
         /TU9RyBbqzScrqX6+sPQie0L8bC9P34KjMmKy10ZLJsiXnLflCobyShOIpbki0gzZi8O
         ZfI8XL0SsI9Di7hXwyJ80WYOO25ftvYS5m8Cy7vyXnuA7k4bhkBHEO3S4VagYRwKOB4w
         Njzxh7+Gf6N8qZdXlhO+YNG2W9KqGgoRS0cMOEy6/VFhXhIefi7pWY+z3d/TBFWapXMJ
         /KYHMgMbDp0UAvwJLenwPeshnxy805mVYK/teBrpQqllZ+XeazNrLpkLHL8igVDKBSZf
         +tfA==
X-Forwarded-Encrypted: i=1; AJvYcCW7hBWjPUlToQXWMUTAWyicBEcndpwTrIsBKfX/ZzW7wr/NiST260LEvojF50c6StZp0Yo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv5+eLq2bStZVTxAwvMywt7QsJW9ZcDWBYmZTr7+kS4ZjvWSiQ
	lCZahBajS4j57+i+huWQ/AOpU2RP935srFMex9SI+qevAX5mKzcvPczCQYY23IyOWkE=
X-Gm-Gg: ASbGncutsE5fC3afkmnuxhvvRaIL//CW2pZ/rBJpnFydaej9KNPmeswyD79UGkQwetX
	dqGXhouP93G7LZkNl+VW2QSczz1J1Ty6nBiMwzVsGob1oSfp6FXxTkiGJGEUz/ez6z1HeS9NG8s
	7qpgT3qaQ/PJsfxnZ9TyorFKa/5bJeqDlM8anpn88tznU/XPxmWAc8rv6/BwUGeNMwp8AEUgjNa
	QLvDE97uRuwIm98W/645JtL3eTEfHAasenQt5hHw4pmitLvBgnnRwFZastTi0wR4bL1ozf/0Cxn
	R2YL3tj0xX0ox9qZaZbgomk76FZI+pKIuXcDZtxLdrglrYu7IGD//KDa1BUWj5hdrXPpGIYi9wc
	4Qm3OWRQTveUcarT9DIgV9ftGVnaeztX+u/IhslRNZWoPCy8/1dZicAgfZmhQj1jUGPUV9vpNkP
	BgrxZLm3S/6CcmhLN8
X-Google-Smtp-Source: AGHT+IHh2yafLn0h6WCQ3rAqHrBsqui/zuUk1dGdvyyNWo27ENOUkyCq/IzM8raGe5NR4RM82hlgnQ==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr172473655e9.20.1764227645302;
        Wed, 26 Nov 2025 23:14:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479110b6da9sm17043815e9.0.2025.11.26.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:14:04 -0800 (PST)
Date: Thu, 27 Nov 2025 10:14:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug in
 imx_dsp_rproc_add_carveout()
Message-ID: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index be83b5f20f15..5130a35214c9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 			return -EINVAL;
 
 		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (!cpu_addr) {
+		if (IS_ERR(cpu_addr)) {
 			dev_err(dev, "failed to map memory %pR\n", &res);
-			return -ENOMEM;
+			return PTR_ERR(cpu_addr);
 		}
 
 		/* Register memory region */
-- 
2.51.0

