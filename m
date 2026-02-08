Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516126461F
	for <imx@lists.linux.dev>; Sun,  8 Feb 2026 04:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523457; cv=none; b=NBSBpkTxTUmoZ2XMXyccuBwGFO7+R2bdQYPrKJkYNJFLLfeXa6IxoirBTGhBkPgQlCE9zLadRlMPU2Wr5CdEKgFwMD3LPaZBL36P8l4wMmz1XePLcJdrONQGYGQ4sHMn50sWctH2tn2jNvMcUJMzc+jYFzBK2ZEl4ejwHiAVwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523457; c=relaxed/simple;
	bh=UJz87G8Y0ORGtLcqOEYAMn9sU9uvOZ+v8CVug7VuQno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRdRUNtdviUAGUBpVtyImc1aSYnLrFtgfXPg4Uk61NM47/ZQSTFGBntS4sgs4rQCZWE9gcFbqOE4LA6roQb9I+bgEQbCads/joC7ApFrlCmXsyGziD8ssQAw6+Ai0vA3AO3hlzcg8bmdUPAYMIIfuZRXYk+R7V/N1tTMJv2MML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F9lRqI4M; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F9lRqI4M"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a1b4dd40so6661326c88.0
        for <imx@lists.linux.dev>; Sat, 07 Feb 2026 20:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523456; x=1771128256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2/KpZ57tlZKoE0FDCGiBRE/ls/IVaskc6zgTU7KwZw=;
        b=F9lRqI4MUoDl2jYtMSL9yJ0oMfeT8nGQqt8w/g4nMEFZ0KLQ5X4qBelvIpkt52lPAI
         g+Pr3qKNPpKjBM/0aW29gDkDtHf5JXwyYnF7nYvN5ETtSwIPt270jD7Z9R0KK6HCPRyZ
         Zo4+GYuUf5Gh9cfvsw66eO3BC6gYLa7dr7DB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523456; x=1771128256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2/KpZ57tlZKoE0FDCGiBRE/ls/IVaskc6zgTU7KwZw=;
        b=kSqiDotAI62vk5iEMXW0EIeyVScY/wlO5wJf+obwbLUBEeKqQr5PX6BVOZGmPhkOp9
         MS2SfnQpRvlbUQexc4ZmohvpWM6uLryYjZsbGZDKgc2HxxJECWJxo3R+7WA9XBSxQghH
         2Dctd5ULVHPAaKVNSGai8+UJ//nwd9WJJbWurmxehm/36vjAcgq0G/3flXrcGCPWnIvV
         uLeT/KWot/sDL6922BhLJPKfkK80Q1KAxhVFuJI8ayNI32cAXCQQ1zv8PmT/Lni53X1O
         SQZLOZrVsHMlrfHj1YEvoc4tZ8Dw3kPIN+v4R4hRW1ncov2KhAIu+ta/BoV9bX9LMBVz
         V91g==
X-Forwarded-Encrypted: i=1; AJvYcCX3thllAn15o/8a+FkgYjpltX0GSsLKOcM3sTlqSKOeIU80iPznNrqkTpLDzT22toHWNhI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7efWxz9NKtZ1XuCIdzSax7ezs85eaDVby1mADBRpCbd7F5xSH
	eN7rcd+otMBMbrAzmQsteIB0Ris/7S/gMMbePWyZ8VWfoSp3jiwbAEM2mcwyug1rhg==
X-Gm-Gg: AZuq6aLPxowhPhA/bZxrBU7GA3VX79Z306lqn4zISUofzQPrPH4OPugxO4DFNFU/1R0
	Z0rmXnC5PemMn3Z+zOv2b4y9IH4jUEbqwCdFYJA1i2qUxs5fkSnwnurWsTNdhBy6orRlKO4rTW/
	ac9lywtX+0zjZblVI5s9/i1eeumiGEnwx1pLuLYmkzZo0vx6rwOc2qTugkATAAIKvI5NhksNIyP
	ChMM+Y8a/j3zTKREpIaDARtLE5HLkW5ntdE2ZUDZFe4+L6krl8Lf9nBLjDRLTPvrnbH7FRcqYF5
	35G+owYpEZiaIv8m4hglIG8O6pnYZ0dtP41MBSF8fytgfge2u8g9d86v+yZddqAhFCN0DfQUnbA
	kfO2f8BYTxhA6YBon0lAhaEFKfkAetKD9/+aze4BoUtr6a5RGOYmdO9mi9egSv5C88bRbYjZ6OK
	jzfx1MuXeN9DdqHq5LjEh1oVh0JjQK4y/VuTaBrKkscnCZdJkuYE5fSy+oidGlKmsc53RZjks=
X-Received: by 2002:a05:7022:24a0:b0:11a:335d:80d3 with SMTP id a92af1059eb24-12703f9b5afmr4420639c88.22.1770523456083;
        Sat, 07 Feb 2026 20:04:16 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:14 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:26 -0800
Message-ID: <20260207200128.v2.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/imx/imx-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..231e9f841226 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -30,7 +30,7 @@ int imx_dsp_ring_doorbell(struct imx_dsp_ipc *ipc, unsigned int idx)
 		return -EINVAL;
 
 	dsp_chan = &ipc->chans[idx];
-	ret = mbox_send_message(dsp_chan->ch, NULL);
+	ret = mbox_ring_doorbell(dsp_chan->ch);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog

