Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5013368B5
	for <imx@lists.linux.dev>; Thu, 28 May 2026 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000237; cv=none; b=YWZMH4UCV4fx1F5PoEaX3LGIm6V5e1eAbFWUbYanSyzMfftvyofTGpl1mXvwJFI3kqhFbYQV5h0OIJcEGA6zy4jXNVqgylNb/cUZZCKCMnVsXe3zw0hB64HZ9qqaooVmNENRnZGulz9x01+JV8PxwOSw/Cn1sd9hBLf0QNWXiyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000237; c=relaxed/simple;
	bh=REJQ7rBnQJpIiLyuuNmPWn7oGf/gdM2oe6iZ7QI5fPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gl96T1gbSKkhai3eHqsYQVW4ARQp4D9ayeLJXpsrdAUBt1QzxQWPBqpLvDqnhEVr4gZojv7voXbMYO1dIZMRT0x+qZABXVcWmZGueZlLcbloj+DtW22MEsrFWaunP+uVmisJ2gDA4FgrJj98cg0H6Vc5+zwUDCYSM3m4mDAmLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIiRs0Ee; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIiRs0Ee"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf02708e8fso8931725ad.2
        for <imx@lists.linux.dev>; Thu, 28 May 2026 13:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780000236; x=1780605036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDIXwe3ooO105k5CTV06eh6doyUKsBOeZuBsSpw25Kg=;
        b=JIiRs0Eefv+UZ4kPG3wCR2vhBtkGAJEnlPtSwdHY50W6K3k3x+3dtqKhaSgtdfbW30
         1YE8rT+oDCMPfj6CW9Zltcp+FSURwXbKh+rpRVU6SvnycqndSg3r9/QWKw7yd4qqap+/
         cG8z9Tn8FHOZZV29sMNqO+wBj/4NbkviKD5hxxQcju/tiOBXiu57N4J11vt0rdLN5cmc
         ki6AzEF7BXdtstiSvhK4w1fo78Txtwjn38PFl4IbBP4K36P3FtaR/qLtEcSM+W+5RsrQ
         Zrhcw3A7NXqeb6ZuC3uS4iEn5IWd4b6srr6liPf/EOlq8QK3UnH50crDL0/hKdy/UMqE
         SRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000236; x=1780605036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDIXwe3ooO105k5CTV06eh6doyUKsBOeZuBsSpw25Kg=;
        b=jiAXkGaNaC8cljpA//rkLgF5F72I0Fv31FvCI248lyvf1bzpgFqX5wGfrJ4i7WyNKg
         Jdq7vgYk5mTWN3bDpLfS3Bc3CesAw2pL26z3Y4AH+pUMlScPAQhGJf/XydFnMnaBa6Sc
         S8hPchVPzBAB+K20xLHnbvwQUVcDo92ttr25lBsGbLyiYVvT0yV39jYXzTL+W6fC2A1i
         nop4m5QqpXclXNkxoXYF0b5zohdVBqkZQwnBjYtG+dfOjw0+i8a4JzYaXwtMDZnds7to
         6aFeO6J+UQ4YdpomignMmlBl/A+9PlppbPJyG02J/hVXhU9FIRhotpZPpLpGnNGzuDSI
         P/0A==
X-Forwarded-Encrypted: i=1; AFNElJ8KZ3S7y72Mr+Zpjx+sIOSpVOONZhv69WDLei0eoH5GaqaPE6R22W11/bGTC7afJZB6G7M=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfamcd9snmV5HJnQ6HO8sFHtbRQ/M5KW8cyGTmSY4NR0oioqXy
	9zF7uLoKN0c7vTVseKEh0+CHFBBQr7wdd4FhBqCg1OuDjSqOcv2sLaUG
X-Gm-Gg: Acq92OEo02H2faHW8N0j24NHODobXTXzuGx/WOs7FoqU7ZSO3WFuFjPnExAMlatxepw
	ESpcEWkzX44ph6aPaVe6RavGDVCmz9ai4VoC5GWPZBiS7Dbqry9Mf6t+oa31oL+FvfHXgB8OLHr
	8YkEe7jjSgWYMgKV8QcgUwBp+wvlturQKBhmQQ+p7rqqC8p8g68NwPRwCP/QfeEuUrfjK5FEzDy
	zR0EMhtGG1S6T4LQB+wk8e57rcO0G6mvCcfCdGSgc2bb0hqMmemCzdy1qLzTErKrHgCPJ2JDnt1
	hbVoBz6Zl3CJmIWWMnW6K80GQgAGar8kLn5pAKrpMhH7R8XE44cxhe+ZPmaJr2Zh05tYrYmvZ1/
	dPKc5s6YGQT/rUh/p1Q2sCRbn4YhwG5cZ7HCO7VLEqcTiZM++9G2MlpOfeFq4h7iDwpHb5SvWTP
	+qwdrJGUCfcovXwFrr2L9u9B0gcUjbmLZLmAvb0noZJwpRrJYy+byHN4XlrjVgdqoOuF3ABqV3q
	52JIhx3BVWFYnHIa/x1ccJJXxVZriUAINJVqcCnFG26lQ==
X-Received: by 2002:a17:903:2347:b0:2bc:d1ec:9f09 with SMTP id d9443c01a7336-2bf1ed5e4bamr3535035ad.40.1780000231091;
        Thu, 28 May 2026 13:30:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf1e604dbesm1786475ad.25.2026.05.28.13.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:30:30 -0700 (PDT)
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
Subject: [PATCH] serial: mxs-auart: fix 64-bit cast in probe
Date: Thu, 28 May 2026 13:30:11 -0700
Message-ID: <20260528203011.137338-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_device_get_match_data() returns a pointer. Casting it directly to
enum truncates on 64-bit platforms. Cast to unsigned long instead.

Fixes compilation with W=1.

Assisted-by: Opencode:Big-pickle
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

