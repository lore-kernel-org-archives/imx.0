Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555E37CD40
	for <imx@lists.linux.dev>; Tue, 19 May 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171220; cv=none; b=jWHwIhu528gBUlY5yTE7wkABq66HBhxuDycyxhtZIIt3Jg9z5hLkTBo2Pm2azA/zaJKKSJJeRL90MvYeVsxl4b7m/EQVrFA6IHjWDuKL3do3+horhrCRXZvmWelrk0/BqgCqr/jZz68mf9YlaLicB9RWuxZUuZZwos+nZWoNrUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171220; c=relaxed/simple;
	bh=BkN3e60PEXdoyx0mx5F/cbqqVlK6TvHKD+Ae3IxWR58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be39DhlqwmdSoLNy91AyPVrWJEDFATWJTVhEaIBKYY3L+8jXykJSGw2a52BNDhLZdIuoNdL/u8ANPMmWPQFXcCR65C2E9VReGcpQ+ehP1GaS9cVfObHTzhb+J5q8WuLlz3nyrzlpe30FCgDG6khPxzIu8WazNmF/H6V0/j/nlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpTDmPfQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpTDmPfQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a14580111so2285545f8f.0
        for <imx@lists.linux.dev>; Mon, 18 May 2026 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171218; x=1779776018; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=ZpTDmPfQibk8dHK1XHebcf1/5c/yV/4oIe0IysBg+UA7UuDhb3KPT/r2EB/o+TrBq4
         MsPj6vyWK9j3ttRrNMcU9nlP2Pz5nXoc4Qv22cPAN2F4BdfHlY34w5F8k38WQGaR1OZZ
         6nbPu4f/5b97oNh76v9q4We8ajLZ3F8cPvt2x6nayi+WP8zr6oZMOQkBxYCp5Gj2cwXW
         W76PKaBmAR2lGPrXxh4RyjUWOYeSk9NRPvRLlL2pbcMiYYSymmNwmJwj9jcACtxoSmGe
         gAQmkNVlmvEj1SluSl2tdH9tSP0bLgZ9f4asj98nJXwnjWJI0TlcMNIhYTst1ZYRdvPC
         w2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171218; x=1779776018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqjUL/F3PkV7mQ5AZkxkB+XxR2b2VNgyAxYreLVSeSA=;
        b=lJ3wORt9fdNuqPlhSAGFRVw39Xprjw4TKyEs1F2Hc7K5W3lXxTx6PvJ9naLX2GNVfX
         /H/ZExtZpz3J4eTtnLdB5EgRrVnp0Bd+6tPT5j4+0dAp+iJsMi0TwyUCma8lUeABHuPB
         K1HTLaykzGm5tiva/si60TYvo3DjQzn6+tlRZsOaEJ4NePxOJEbRVcafJOOi7vzzdxob
         C+yeCC7A6O2zLRTVbEz8qeZ5Fg1nVlCcjgNWxivV1YsC1Eo+hm1vXrBmFGZvFDs++UJA
         nH9x5JNMnOY4U76WLV02o9ys3Y0BZNda7zjE41jhWm7VVEx0cKaXfbZjLnEfEFA4qQ5o
         ApCg==
X-Forwarded-Encrypted: i=1; AFNElJ+kWS3ZrUZDyCfL2SxPPDE3ZzKHzA1UVI5E9evHLAhMHJFVUX2cFHZkexiQLZ5ql8LYKa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwodGTR9Pgt9xW06xpY6+W+LtUaVv5s9fg1oqOFfDfRGTbuKmx9
	EXXoy49nX7U+KtFLk41s8xIgnLL6VqQH34H96hPUz3UZoh55PIzWsmc/
X-Gm-Gg: Acq92OH+u5WkKx5RNYsFIHTvCsbRlj4jYonSOU5X4Zg78zwW2dUeo6Y5jRgIksxHDRo
	Ta8qxjcsft7f9olzhkJ707A+mWKww1cRXBaHfaS+igfgmyxcMmTXP1j9rGIWSbUjLXHy0HJKE5c
	rppQFF0AihA5pw5JtLJoQpqBzMa8ocz6nXmlEMgSxKAkddcpOb+bJwrL5lB5TLRuAjGIiYJ/lpa
	E6I+Z30gqnudJWkeputXIMdAi/4Bge/JrfYV/hOEnWIlZldJmxgNOE00JBs0P+OmW4o50ob3rn9
	UyIRRlECBOLVQRxkrbC5KMQCPMiD4f/wE5TLEal+kcbHqY2EpEh0TSN1ejce+CQ/qoMS467SJZY
	+nfhQ6/U7gD8aGl6Sl7PvGrUzH5ql+/pF+O8CgWgAst3ptQTPOwsCO5s8li2x9oQTAZ0dr8u/cp
	OwNubQEtqX+KZXRr+dpbk=
X-Received: by 2002:a05:6000:4021:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-45e5c5fd95dmr30269534f8f.25.1779171217859;
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm45974707f8f.7.2026.05.18.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:13:37 -0700 (PDT)
Date: Tue, 19 May 2026 09:13:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Message-ID: <agv_jhP-2CNTfQXk@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add a missing return statement on the error path.  Otherwise we have a
use after free when it dereferences "dev_ctx" on the next line.

Fixes: 63536a73a3bb ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was in the original fix but I guess there was a merge problem.
https://lore.kernel.org/all/20260514090457.2186933-1-pankaj.gupta@nxp.com/

 drivers/firmware/imx/se_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9327d47e4312..010af8221dfe 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -486,6 +486,7 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 		kfree(dev_ctx->devname);
 		kfree(dev_ctx);
 		*new_dev_ctx = NULL;
+		return ret;
 	}
 
 	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-- 
2.53.0

