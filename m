Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1F2C21D0
	for <imx@lists.linux.dev>; Sat,  1 Nov 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003535; cv=none; b=s5EDkcofZd8t1BJeRx7epfP7d63KknNxX3FefJEsQewfIjB4NrYShA3xwBMsvVsZKx2i4LXQ+nnfa3loPiN4isrE8u8HEDda7eYtIWmJQ8haxnhm+zXhLv34JxbtBJC/J/UWcDYTZc/pMyDYgcWln6plRfvXCBE/tQU43lWYM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003535; c=relaxed/simple;
	bh=Z98SLm/EfpTZZ+75oYqs1vAnViW8qDAEJMAoaxRjcMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rp33CBEu1CD/ydQDxs3m2ylAh58ba754L0dlUc75sUEpRxMAoKoMuQoSv7MVrEzWdjZ7SQcE583i3pFlFGy3U7fgc0fSz+zs45+4ZdWykQOlt8eC6HZRLpurxL8Z/8gkCSgakOLqLwaystyHU5YkV6z94ru87DeoSjtUbnC3SI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBV1DnYh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBV1DnYh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so24810385e9.0
        for <imx@lists.linux.dev>; Sat, 01 Nov 2025 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003531; x=1762608331; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=sBV1DnYhyDkEj+cCD/Bafrz3M6jO7LqdK4jeMZzljL/+wwQs+IX1mIg4RzeXS1D6qx
         Nt/Kpj4fkARz7NVUh49oB2oQv6EgYNc0JtFkpHYFY0TYeSlkDf6I6wgXv+GvsZg8UZa9
         LrGJY+9unqNiByk+nROkEW96L2hdReu28AEzhLbCLJXZjp12pjE0wZ9Ym0FCXQqX+7H5
         WCK71gh8rXsWxsL19BOi3vjNcCQvG9rV+cbMBy3NyZTZM+N1nZaEZ+mHGLa3WAjRnmP1
         Pa+KmPY/uBMR/K9OKhV2yTA5IVmvPJZBseeWIxnxosRLVvltYKFQjyUC/POdvp+NCTle
         CgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003531; x=1762608331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=vKUrSklO34XU2E/Rp4NISjMErlQSiqq1Yhrle6w537Tf5zBt/DMnUXSbOhShZt/+GO
         ANcp20Tka2tgj2l9zfBugcHWEOGg/9LEtYViqfWNyQru7eg/IepwcIPb9lrjfqgARedR
         YrNybBPYvV4xlG9R26HOWMxSe6ERMtayJmVFQhw6XS2UyZ9MTG/zilBECPz453kqgQXT
         TvBgfgz92pH52wePiYVMZ+DEXsO0iWb1pB7eKyjvSCEK4mflRayHgWWMrIfmdFUT1qPw
         q3nZJZ0pA5dzfnEOn4yF8wfnmXoawyYv42bXl3CrQ7+sCM9UvCre2AaFicYUzsThRR4i
         w7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUUgzlPqfZg7LtVcqQVPGaBVnrR1Xm6VQefEJMOGOcA9ZQ2zmj/OJlyAN1L+QNS93OB52Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNivqIUmlcuBqCtcxF0iFvFrexPKx//oBQEKLYCCjIjbbWxeh/
	qHLoSTrrolWSKceWUUykr2gRFf3EEjN0v5ru14VZdBUoQpMlrjiL6n0/g1/TQ+E/Was=
X-Gm-Gg: ASbGncuQuiPrDmwuzk7LyMhlaBVPDQoPXac2qAy44jlipp76rEFihoem3dqcA7Vn2ci
	n+aP3NOaxbA5ALA6bEMwetEXa2YWBXdxs9qHhi/RfR6qFx9AA+WxRXx14bXyKXZVmOi4OY3rTm2
	HxyLDHmDW9+/+Pdy06YqEKIcUkGSCVHSftBnA8a7YxGEBMkG3W/lUd539I2/Tlu8NGUnw4kHKgJ
	RKQXSB/sB8Nnm8PvXOgPxbufqyfTAdMJzl7jQ9KB+OWwTD/jQuEMq9evHqt3sm0Ksvedz23ogja
	Iln5b7mlkFgkdwyEjH3fnbWY0oFNPshJJsIM8PYRcFGOqKpHrTTpDgwoTI+KSYmGSsSwDT8DmlH
	luUygP6Dh/BYJChGkylQYGQhQ9S892UsJvtKFMGlS5eQ8F7Y2ihalgY2+R66HVfxmLNDRqAXRAZ
	W2Ovh2aA==
X-Google-Smtp-Source: AGHT+IHfkE8YJK+hEniklXFT4GhX0FQkyrWL8TAH+8xEiRGBmRw2WAmAAnJ/Iz+FCPOhsKJuLyo9JQ==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-477308aa8acmr60161545e9.25.1762003531066;
        Sat, 01 Nov 2025 06:25:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c48de65sm47854815e9.1.2025.11.01.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:30 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to be "priv" but we accidentally pass "&priv" which is
an address in the stack and so it will lead to memory corruption when
the imx_sc_key_action() function is called.  Remove the &.

Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/keyboard/imx_sc_key.c | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f6..b620cd310cdb 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -158,7 +158,7 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
+	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, priv);
 	if (error)
 		return error;
 
-- 
2.51.0

