Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62B204594
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268198; cv=none; b=oJMwue6+R/Cb45m/EYet/3Tc9ifYuWsapcv7yymUOEpn9BkA3tSNoiRlORTzT/YgamH96O5rfkWYUj8LaAHuBQxnaYJ3c+Wjsd5wxjEWcnq8Szq1UNbI32yveDRPx7vd0IwOKuBfafP/KJsca7OCXjpBzDQjZ1DXcpTjaS9dLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268198; c=relaxed/simple;
	bh=IR5zfONGQPrG/O5K6oH/e0DDicgiAHZk9hVpRV/9g9I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LosVU+gHyEyn/mkMWmXhf1r14S4kr9ckWujaaguIptM4A9x/viqI6x9ojoGjkHKmwhV3wCSCphfSBwntfPc5eWYp6jThQD5uFxuccE0W6yECl4MjAm17iUmL9KAwGpYtrX62ht6bcgNkfERB+S8KwlW8kAG9hwjMv8ctqn/ieA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBSQA1TG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBSQA1TG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5e2fe5f17so50455685a.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268195; x=1744872995; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stSZx6MxVd9/oupgvZW3EPBQ9cRhM3rlEoAObWRga44=;
        b=iBSQA1TGgkCxMRqVLzgTxhFTzJayMCa6rg3JeRk2NjI84y5s+Sp968YGfuCQFeUW5T
         x+M+lxNxn1hsqw3EFLJHIgcmaHk9nHUUuuglXRFHnziqKbVV1V0F/PV1P4DME7qfGASG
         BqCRmfiAnMFG8bWl5GaynQO54/gBCuvDtKsQo/ODskARSL6pP0BKkx+DI8W4OBp2vCnQ
         ydDc5WXeNDIvgKL9ABy8ue6PedVRu8PWw8YpvDUKwyL7w5OF+NQD3ZQAlw+aiIX7gndo
         aqy6yTEfzMCS3DHtTB69iDjpYNj2a1R3jAkANm7CdvJp22buxZ+we43j5+HROd/KrhWl
         HT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268195; x=1744872995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stSZx6MxVd9/oupgvZW3EPBQ9cRhM3rlEoAObWRga44=;
        b=apJSE4RPw7VD745ZuL7pJ81lqSikffN9nHuDeyKO5pucxMeLQhefuerX6TmZBy3+cE
         ajiaLZqr/kFNncOkbstLX+CkuP9FOjM1SIGMT3tpZAlVk/qu7CiY8IJZRAgTZ14fierR
         6SoalopQ6hFYwylA7UDoDMfu5qGbtW+HAL5Rm2M6PGy7M9OlNP61ETL8XPG+bhiFl5qK
         zpfH9CkSYQdLf5sT9l5R3WH8brsJlSGQCYF53O4nOVb4TrLfpBww+wg4XczxziEFo1aj
         OCyljpgbBeC8mKJAtuG6fx8uVF9Y75j8AkQ8Hz/9Y0LeR9qrpU6YJLaIc4qbTBKcMDj2
         XUEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQcJFfWyMZDXPRP80ZzaBptOsVZaLvtlEEcpcqy153yX8mtcyBw1cn2AhG5o7cikVov3s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx28SEzd8EwZDr9DbLliZVSrtrGSGNfxIvpSkze5QfWw4obiC7k
	6BdIA0Esz3IyVwNupX4I0c5PiTYKFBHK6i2ioAp8rngEyTzHffx3
X-Gm-Gg: ASbGncu1qxC8fviV47mNzjiPq50XlyzO2Xt093EsvcvrGPu/ZztAhngTmK40JCbA7BX
	AzQAM+uIjNEzorGJMbdvA14GPMrUKlURkPs+jT3sZ0Utibi1gndAk56z4IxzFmymREaSVMRBdF8
	QMsfdhZ+xEV2PxKnjIIeV7cuGXVM/g09NqnF87QKvFKzc95mGfy5pNrTPPa8+1vn4z/RCnh6ZL2
	tecbg8kKTY6jge9ZdMuBtz6yfZ3Bz4OVQlCzyVMLGyO4w0xshVOnH6LOErsR4t0qygdo3nGxSLE
	SPOdxlM51rD8ednGT6zXfDBjDcGcN+f/kPnDHnuD97W3I+xMTXo=
X-Google-Smtp-Source: AGHT+IGEzb8q4GErf4E2NhVLOjPHUdc4Kh3rGDJV2EoEuCzx8hGLlVjXwE9MK+5LWlUf1cjz6YXrXA==
X-Received: by 2002:a05:620a:3949:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7a765500fmr240369885a.11.1744268195554;
        Wed, 09 Apr 2025 23:56:35 -0700 (PDT)
Received: from localhost.localdomain ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89515e4sm46547285a.26.2025.04.09.23.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:56:34 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 0/3] spi: fsl-qspi: Fix double cleanup in probe error path
Date: Thu, 10 Apr 2025 14:56:08 +0800
Message-Id: <20250410-spi-v1-0-56e867cc19cf@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhr92cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0MD3eKCTF1Dg8SUZANLixRTMzMloMqCotS0zAqwKdGxtbUAgQSRAFU
 AAAA=
X-Change-ID: 20250410-spi-10adc098d566
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 imx@lists.linux.dev, stable@vger.kernel.org
X-Mailer: b4 0.14.2

This patch series fixes double cleanup issues in the fsl-qspi probe
error path and also simplifies the probe error handling using managed APIs.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
Kevin Hao (3):
      spi: fsl-qspi: Fix double cleanup in probe error path
      spi: fsl-spi: Remove redundant probe error message
      spi: fsl-qspi: Simplify probe error handling using managed API

 drivers/spi/spi-fsl-qspi.c | 77 +++++++++++++++++++---------------------------
 1 file changed, 31 insertions(+), 46 deletions(-)
---
base-commit: 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
change-id: 20250410-spi-10adc098d566

Best regards,
-- 
Kevin Hao <haokexin@gmail.com>

