Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045692045A3
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268203; cv=none; b=SQ7D/YxDahbewtRo2to1UUG2XuACILEmtK3gH5Ybj3b/9P2uchu7i+FdLzt6A6owzz4d+sfmPYtF9Ta4sIfajVEOufP9zC1FrLY6rDGdg8sIfdegKZkdT/iSN/lgUjrkK0v4bdwsmx/TmwPdncKgc6FXticmm8RD8f/3jq/psNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268203; c=relaxed/simple;
	bh=YNMWPXST4GmkU82cqtCWweSG8CvPoxSqJXedn/pDLfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGVl6JqIw8b6kNuXeyw3Zm23/2Mz6v2OgbsxwairDOu9TXkbLr2kqdwuDx6h3eDzhqGJWpbLd90I/CDEh5gou6LymOl98HKezdIuZu+SPgX6B6jikrj+EJhijDPWVISup+rlL4aepbP9QwaFQG11a984B3nPTWAUjdoPpEsClqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrcCrFCf; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrcCrFCf"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e39d1db2so25373785a.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 23:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268201; x=1744873001; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQNsJ3ZOiZBcYiwdRb4mVkjkRmdE4On94lqt+0SKelw=;
        b=IrcCrFCfbQrbur0mGV1QwEcZBqx2wv5JR/msncgY4wd0Fl6pwEFAvn4jV7LT664Z3g
         t31CP2qx/XmFlvWoYyOedrdnFwjxxlzBUWrhIPOQ2vD5Mg9dfFE3APgBivVu+/byJOyb
         bUNgi11zrVgVl5zyIryACDiofJdroVu8elT7zIAqTjrST7SfVExZZ9USYrFeOT+LZDz4
         nvzZZ0MlgOcKxgMEm2q4RMSCO30T0L0rRPqY8/oqdP07IwIukD3RwiOebSA7CNJ267pj
         N+xGKyQUCBGCZ+YR3jz+1m8sZMaPz5xde4HcTJybIzXtOI2HOEfbbTn/GM88sb5Kidet
         oYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268201; x=1744873001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQNsJ3ZOiZBcYiwdRb4mVkjkRmdE4On94lqt+0SKelw=;
        b=qw5EGTqk8cHANUwmiNaGuGI1NQRnltJfjl4FBoMZxJuaR8Imb+dKNSSqZOKpYm/6eg
         2rZoOv1tcv6ZB+pN3q1ekzwLJmhoZb62Gvx2TOtBUBOSYj4NdejxUT8XBbNuMYUkRg4O
         +EhFaa7ok2hW4tvbZqvL/OtNGvk2el5hvrQ0cahrTdcWZilhrHSuzeolKVreBsUp7GIC
         KUdLlgg7lewv6Sqr+ITR6G67raeZHyqbOooRWeGCGQmEMJdGOs9tVJi5+a83G1UcSpBa
         CTX4aOyG7hC9i46e1WcX+8Z+7sGPT2JjX3VFxaVvYuoQek067MOuTbKL5FZYHU6HwOMB
         m7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWElZyWpJqOumBs6ANK7XDqe67z8lqNwNZfF2HIlArzOFTAje9AnZWqByJOUdoEVaTf3Yg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXbl7y6G4jujLySKeHEiL16ZzJl9mp2rFDhGvCcHIiOdbcbefK
	+BVlo48m4xKnQ1o3w/b6vlMVqKLqc1OdP6pEq+icO8ji4DuSOVu328VeHh3Q
X-Gm-Gg: ASbGnct4y4MV5HhHd6ERasdwwMhAnBO7oOTEnlNj9GHUMUZijv9Xe0aTGaiZPI2h932
	Co3A2IboovniaazUbnWUse5mgyEsB1lSRfpDN+iPi+TxtFav/w+Yg0sXMBHezgVHZudTM6VKCjQ
	/NKhGLYH7N4c9CbbPFLNX2ar65NfoA6CO09w2kKZy28dFr96KvecuA757CCrZcCjA++kX9rZ9lY
	AtA5SSUcVFWI4QjdMSoVSvpjJmLgApkAbhLay20hrl16FgpOxICEtzhjOW+BX6pmsiawaN4X2Or
	/3rrR0o0/RANxvoeV5f8GQDiy6HjVK90+Zv0kbxU83txRzadnAw=
X-Google-Smtp-Source: AGHT+IH8Rh4oQxmbv52IflL2wfwTmNN62cTX1Kblk1rng58eaLwD7Uk6UckMElDU3x7WC4HYPwlgCg==
X-Received: by 2002:a05:620a:178c:b0:7c5:464b:6718 with SMTP id af79cd13be357-7c7a81c077fmr192043285a.54.1744268200969;
        Wed, 09 Apr 2025 23:56:40 -0700 (PDT)
Received: from localhost.localdomain ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89515e4sm46547285a.26.2025.04.09.23.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:56:40 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Date: Thu, 10 Apr 2025 14:56:10 +0800
Subject: [PATCH 2/3] spi: fsl-spi: Remove redundant probe error message
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-spi-v1-2-56e867cc19cf@gmail.com>
References: <20250410-spi-v1-0-56e867cc19cf@gmail.com>
In-Reply-To: <20250410-spi-v1-0-56e867cc19cf@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.2

An error message is already emitted by the driver core function
call_driver_probe() when the driver probe fails. Therefore, this
redundant probe error message is removed.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/spi/spi-fsl-qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 2f54dc09d11b1c56cfe57ceec8452fbb29322d3f..b5ecffcaf7955e2ec9bb3e2857f8bc14d73a2f90 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -963,7 +963,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 err_put_ctrl:
 	spi_controller_put(ctlr);
 
-	dev_err(dev, "Freescale QuadSPI probe failed\n");
 	return ret;
 }
 

-- 
2.49.0

