Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35030C629
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044657; cv=none; b=ij+utzVYl10WdYzUjk01oqks2M/kyJTENAG0uPwckZxm5mSuglP5Pj89ROQIH9OiN2xrb2rXVuK1FmnHqURS1WDInty6Jpp/8cYq15SXdxwr3zGQdYMwLvc+OAs4DNU8jF8x2eNgKmrY7Tx2GAXJDPIV0wXRJjge8vq8U8XfOKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044657; c=relaxed/simple;
	bh=p6T47j0sgurR4ZBcE//kHSmTLcJbYcotQm4TC59HSdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN+1xpEuMOcgT7O3hXHV7PDB/xYoQpz/4c5o6An/sBfGfRTEr48KnTjMjoojGyZKp99tgVUMs2FCqWl6JA35q/9feIPNN/4PXaPj0f9xcB0yDZ2aPIk6IvAPyrcV6E/xv9Gl9SVIXRfg43WnXaUpsgxN2dlJgj9LtpYXYiMynio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEq1+sVs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEq1+sVs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so51369035ad.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044656; x=1781649456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=YEq1+sVs+d4OD90tqK5BAkzLFc3Ny9cAQut8QkR2EvFQdL6AVLWvl7fCMxsIQVUV1X
         x/Ya2wnN9RE8JIx+zJO9nmjBwwQDef2hY97YDky98qYcDtHoKZcA/+eLA9+55Tnx/lI6
         xwVm+bUw+uziJdizH25P/i29Q4Aydxh5kLq8DQw1q/PVjgOZm6mo4u76GkDXhx7bTO63
         3jXzblvJr3LIG9V1jQO9oWGtjjKlg/UP1jRk7XD6NB+V/2C3pnQUpKZiKLW9fGTbZR39
         PZ/RVFpjdtJP/NMuv82luKV+eq5tzZ8y46DJkJWz/53Y4LlsJnon47XgoDzu5UxF0KJu
         bmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044656; x=1781649456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=YJf2UksZNh9Bw+D1hcX6Pq1okIeqg5rKSDAsSQjzEgL11u0cJz2pTwi49OsMpYwvJL
         tboptQOHNTI6p60rIFBiK6H3ZBwRTj0Uo3tY6wrtGG2ppbyUKryE4O+XxCCJsxUneBBK
         WvhqUZp4nuaShtRolIP+5BSosy7wcFqsLt5zhkbHStJFcfvTnMnrfhXrnabXdHjJj1Ou
         r1g0TCCPPY1Ef6wlESzI1dVQFzJQ4oo+dAdHYBarl+jj5P4OyQBOBTfYJrYXd0+8Ud5F
         lSdAw/edplvw31ET9MfMFKHoYKG5TObHb+ejkd48w9aePeDCqy9sRiWU2CWJD9fZN4Fl
         GIgA==
X-Forwarded-Encrypted: i=1; AFNElJ9rmD3TRilNfosTyshjGaoV/zR6OFjLn13FXalS/gKJ6PDHuL2lA3qIKAHt3PxxFe9OZQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBRGHt/5Ba4zMotSypjaNWEQOGE+FfvpUJdmTJ/KV0d2APVSxJ
	yTr8oy6Ggg8Y9psScSJMJwv7+afbEGPs/xPDcgSX79ddaM5nGXmaCYos
X-Gm-Gg: Acq92OE2wFUtMjQeBsysWkKEFhzMDOAS7fNxGV/dE7Dgc8M+LSg+8l58KH1Nd7tx7Ni
	LdkwZuw80bFL9jfE1tWvMCBnK3pSCjJODkUgz93bnnBmHikfAkUbtydtl5dOGzAkWtYZiVTAAnj
	OSPNzyHIPElfoPFcUjtmdMVdBk3BoexaS55Tqdwkm5QxIVivoyuLMzv3co32h8uxKwxn4X1oQmL
	uzcgW2KQsLxZyzhEpwLGAx+qtAUJfygO2dLgAA9kyPHVg0QlO2OKoS+J93atbCJi0Q2rYQZo96z
	iSlb+zdVLN/leI5wh4BgpzaZ7bujHdUIQugELNPYUNU60urpSSf83ThL9b2M5byzGyCXPSRaEmO
	u3sqVMNYm43tRwJOzu5sDSK+iXLGt8F7up9V6mJJSKm40/tG1cHek8d5evPcrrHEx+zv/nsvjJi
	5ch3GfqvqdAU040BGGmNQfw7G1evoZVNCvSu3kF/ohMKovLWNgoHDZgSr7eZMhmGCkho9rBwiVq
	vP1HcsOxDoCTjy0OwaHl+B9X6DCpCeC26inrNRLCPT5WJyYWRXr7IYE
X-Received: by 2002:a17:903:19ef:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c1e810bd1fmr283197445ad.21.1781044655930;
        Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 1/4] serial: mxs-auart: fix cast type for of_device_get_match_data
Date: Tue,  9 Jun 2026 15:37:14 -0700
Message-ID: <20260609223717.41670-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..de97c0f74e7d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
-- 
2.54.0

