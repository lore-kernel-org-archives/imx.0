Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2896A175D53
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483221; cv=none; b=dw/wRAW5tfmEWzZtAuczEv4fodBP3wsPTJIMVglJyPOplfsglwCjATb3xUcA6seg2ExKN13ZDh9Rd0cPOF+u+4tR1y61ns4YKj9HY6UoQsEBbzDZETvO+LI/2MGJrhq40T7yJYXvtlLcmHNPnjIofiZwEKoMnzsOOGCuyWlvGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483221; c=relaxed/simple;
	bh=Ey72OPsSmpUH6hcCG9cbHDrh6u+W0gYAKs5MnbTd5ew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pveNGvvleljuG0t4lBZOf0YrwxxlbW9QrpwN7M/OS0GEzCvPl1qykFrWG/rhv72dPkbq360ptSGbTwrOwgfsgsEIhzVLjRDLNtSHbwjKAfHZ3W1tkgHvAjPWPS4YKc0Tg65Lbaf3Or8PZiG95zBDkSvz391x3sTBCMzO+3rLvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zi9cpnTw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zi9cpnTw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450dd065828so30130445e9.2
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483217; x=1750088017; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvtGT/gXZy9G0z7KUPcczavaKT2KAY8YSEGerfvgk+k=;
        b=Zi9cpnTw4Gj9LChWKgAlFloYlbC8JGAZ1SL9zOpbJj/2bvZ+hqAwQgq1biXl3eBvF7
         Xuzd572vVzzss7fCRqc8IW1vgd14rKcQJExFT2vn4S8Vo9fL7IQCu7S1bTCgFLaOjFxt
         SLMK9F8/ipWPQ9DIU7pObBANEOyim1gvUkJJeeciMns3W66e3KkHBn+qNA9WpYkYWUUi
         RzXM48WdQOMo5P/ETqtwQj9Iol+1Ih8kxm4wBVpIjdmaRyiE14yqzfFOxzvp2ynwS3oG
         VdoiQRowVM+o6yr/24krSfrm316LI6qRYvA58+6s1RkYD0nDDLxN8HejpkbYrsus7zF5
         FV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483217; x=1750088017;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvtGT/gXZy9G0z7KUPcczavaKT2KAY8YSEGerfvgk+k=;
        b=IYcjsBUjtMXdr35mkTmqs+kOmqQJSlDHYyOYYBfy2Xf3nkOiMu2xGxgDzZkW5uP0oX
         mXGz3pNTsHt2Lwn7Kd/JkLhnhwJrIDjC0ZnZ+Pwpb8AP99FVs1qGS82I5+cnf+bbTmHp
         RRNVJFMzvgL+QGIkJKMrhz5+1pQqhtcjfFby1ZYDVI3XOUZyFtv33mMQ5rf86IsbsHXu
         uH9c+5YYfc27s7l+wMXAe1WldvUaaWN2Z/zZuc+9aRiPULwxbcxh1BhxHk3ax/s6oOlM
         Wk83VmmMweBObTfM4nf2gk1niVJEtI1nTQMZpl/LoTSKpU7t8nyEpOIzIsqH30T9l2E4
         g5zg==
X-Forwarded-Encrypted: i=1; AJvYcCW/wv13ATxAzef+MSPTpqmSTjufnwrHr4aajsOzCNxHuhaTG5r6Rc7oBjpx/pZ+k1tjEGI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp8fyh00wjEWcDDCh92YaEVDIj7Mfz3hMCza7UZGX9m85QXJvI
	VbCjYVxKzock+LDQq8q+0hFSssbDvjgtj6PpLEUlqFKwoj2UdYVUHNMhEmqIWJfRNQA=
X-Gm-Gg: ASbGncs7ljAOttO3ngXCi9l34j7hDN+AioBH8pnZKe55N49+yl4Jq/zg4c9UQVmC9ga
	1+IPvdrr8JudAiOUvWLhp9sy1lqp4Py2jWSLoLmllpaZ6n10DoqpiZQBZq7zKiEeYYS3z3XOQ27
	Rk5ZqxxHLTeKTmH5A8SNAef46zoJ7VyGWS1l/ONZqYMOXNrgdxZrT6szEVXxetBuU6RTUCyq5yA
	me9N6KMLlaXoNe38CSwhuLpE/vsS9UIAqU6UAzdIRfXkks7H2XoNgS6dMEjMcmcS448BOyAeI9U
	mLNQMVHyIwhIFOV3gXZ5JQM1mkoUNonAj1mVIpGsrDKzr/aG6M+uRoZd6nVPS/FcXJOAaNU=
X-Google-Smtp-Source: AGHT+IGUecRwAIMHRhZ9jzGvMSqw8sw1BbFuESQIxyKOrlJ4Q6pTMh4lszRudkvpP6BGsmhYVVJ00A==
X-Received: by 2002:a05:600c:8212:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-452014b39dfmr121204185e9.29.1749483217347;
        Mon, 09 Jun 2025 08:33:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
Date: Mon, 09 Jun 2025 16:32:37 +0100
Message-Id: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJX+RmgC/22NQQ6CMBBFr0Jm7Zi2hgquuIdh0cIUxkhLWkMwh
 LtbSdy5fC/572+QKDIluBUbRFo4cfAZ5KmAbjR+IOQ+MyihSlEqhQ8zUUK/zphmxn4yaOr6Spa
 ss9pC3s2RHK9H895mHjm9QnwfF4v82l+t+lNbJAqUQlekLiQ6p5snexPDOcQB2n3fP+qH+z+zA
 AAA
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>
X-Mailer: b4 0.14.0

Improve usability of target mode by reporting FIFO errors and increasing
the buffer size when DMA is used. While we're touching DMA stuff also
switch to non-coherent memory, although this is unrelated to target
mode.

The first commit is marked as a fix because it can fix intermittent
issues with existing transfers, rather than the later fixes which
improve larger than FIFO target mode transfers which would have never
worked.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (3):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfer
      spi: spi-fsl-dspi: Use non-coherent memory for DMA
      spi: spi-fsl-dspi: Report FIFO overflows as errors

Larisa Grigore (1):
      spi: spi-fsl-dspi: Increase DMA buffer size

 drivers/spi/spi-fsl-dspi.c | 128 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 26 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-james-nxp-spi-dma-a997ebebfb6b

Best regards,
-- 
James Clark <james.clark@linaro.org>

