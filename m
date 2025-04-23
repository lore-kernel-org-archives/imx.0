Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE5A28935F
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423528; cv=none; b=mTcmbSekEeVRgh7F3ay8IqdAeMgkQnSqW89zRNDkml2Je4CfbEzfjduxbqwwzLG1G8iMtgS3DrtkP2NZaJYDC4zw1cMvNdl5Bf7X6Bobc5lbXK3MiT8QbFrXj0/bfak+iQjW8eiHtOZVOBYgpuzZ9gikXLh08Y3ljo8FOYZeDuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423528; c=relaxed/simple;
	bh=xyjs0rLrd34P5DK/m9PmTC/jCEqBM3B50Jzi+NTDjBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXeVdXQQte9yYxT5p9mA7qGWoenUbLtBMinY09L1ftPVvWJj1nmQ3YdOT915btd/4tn4i8xxQ+rIla7SwYax1bj3lkwsnIAD2vSjG027siY3Y2suC9iox1ZBKiUkxHTAMDMs1rmrV4mBcyxjEe6NN/WljS/9MideIeT4jYnrVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cia0WdNJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cia0WdNJ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b061a775ac3so5910176a12.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423525; x=1746028325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=Cia0WdNJqbuJgfUhkl/M7RwgyrGLgo5cyU0BmImJoaSMwZl2ALQTAdjT5LZtxMjVh8
         Y07U/sp7cBVLDRGZ5cYiba115xR0paril5j2KQH4O4kzaPfN4axPnI4LkpQFD0h6k0d2
         niXjQlxd0WXcJoqTFEIeSALxEE0vNuCcD7h2CdtYA4ayMFMN82YN4oXwtVeQYhQ5fVyw
         zIB0b44ek+81DJcomeUGLjONPew3Xj4zj9+1BnidmUsnk6kXyziHNSvLiQfzp04RyKpr
         5rbakV9/YQCx3s34IPuCRnZFcmv+hhB0Ua8d8++txlHWStWOE4Am3P6auQcHpq+JWGfK
         EjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423525; x=1746028325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=e/pg6b4KOUoHxBtbN1L8TGrhCwpuAKw94WAsRKYyq2Nj3hBo5Zn6C2tC8ZmR0TQnG6
         5xuhlslQpLLuPq4xvOEartfRqB7NRjsU9YQQI7dFqn3jyupRXGgG7kAYAbr4yhDW6I5w
         GNYXk8Sa1Mq8Ve/Iz8WgwQUoBMZahIV+TdCLYCgXpcQN1nCbxeNl53vvtYbdao+nMbwS
         LT7O0EpigKZylVan1ru6+UI/IciE3FIKuQL1BqhkR5W/zDDtg3HhZ4YIo5D2Oi+G5wM2
         e4gTEPr1SDOUbFSFTfUOnawR57wck/gG+5ypuca5ZETGprMTNxonmRt8H1vtv8+5xgL6
         0ieA==
X-Forwarded-Encrypted: i=1; AJvYcCXoMZn074a0ARftH1xVikHVZB6Ii1GgmibWUsinqdeSD6BmRHesVL/3PQ9515KPA322Sn4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70I16qQj8SZbXiJAIb3SOSwzjBrAmv3hXiT838dZKBZaSQmR8
	9T7iyJ0zTQkGSPiZr/YPjZHOoAvIWRiMVKzYEiD6UUn/r1++oEt5
X-Gm-Gg: ASbGncvlO4WlotWsAfr60rzuZ+WO3IGCbs9BlmMexlN6VfrUw51LP268RA+OCHEHNn0
	9jn0LM0HpbO5XrA1uAOYrndKC6mzwhUcKxyBeAciRHQ6MHPB3OEwrgFkc33ulvVJgOhF+r6fq5S
	YljzC8x1FRxGZZ7LXWcPUhkrtrnbIJBEeCzRE/6l+E+PopAXgkmpk4TNjVK8yN7bEL7Ql0dPJyS
	CtyOFeCnJrjck4fjDzA17DWaZxzD+5JRKRUXRALKiQZ2zn8+rH8lfsj+WpSIvBJKdyzhNSyx3Aq
	PeIj1HD5zkQwo7K2ag1QOPbfp0sa/UaS6aZ84rui9smpXiIuCw6IbMSY7jL9gvY=
X-Google-Smtp-Source: AGHT+IH9NXu1Zh4il4mX+tmqFO/fGM0azr6O1PCj5OfemeTOeltYbazHILrLFl2ZpdVQAwyq5Vkrfg==
X-Received: by 2002:a05:6a20:12cd:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-203cbc05557mr29541583637.4.1745423525288;
        Wed, 23 Apr 2025 08:52:05 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0228sm10598640b3a.25.2025.04.23.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:52:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
Date: Wed, 23 Apr 2025 12:51:31 -0300
Message-Id: <20250423155131.101473-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

The "clocks" device tree property is not mandatory, and if not provided
Linux will shut down the remote processor power domain during boot if it
is not present, even if it is running (e.g. it was started by U-Boot's
bootaux command).

Use the optional devm_clk_get instead.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..45b5b23980ec 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	if (dcfg->method == IMX_RPROC_NONE)
 		return 0;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		return PTR_ERR(priv->clk);
-- 
2.39.5

