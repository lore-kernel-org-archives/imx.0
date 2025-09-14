Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057726CE03
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 17:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870180; cv=none; b=nCP4qX/MM28kwmaGoJ33SzUlXnsHd/tASNPMKHZy9cv54ZhMG7nQnwaxZAcPed5gUQWXgwokpYPqXNdpBqOd69ybNgeYTQlURO3sXXbK9qWBTEleyedXG1/hoeNGqTzLGaln0mmyfG5LnRl5ZBaPANpb0+KryrHOPmfz98XykYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870180; c=relaxed/simple;
	bh=ipys+sa9gnvK/DvJjMtWh3ebWZIbOPBtZHEYTv7XZLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sV0CVa8/Go12eyTsqVMS0cm79hXUi/OdYFuqUd2bCn9v3n5gr8sozo5+LE03D4/ZgMlYHNElU7EsbWGvYmycARsRqSwS6gjAl35z2Mdh0D4eUZqiz1eCjxkHozEEdat6yQuYtUh2MhIGDYcZg5hfCvL/maYmadhdfZzYMHN/2SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lWL4JdFm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lWL4JdFm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso2113100a12.1
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870177; x=1758474977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=lWL4JdFmIQ+F/HTVZ611jkpciS0VoN3eh1XuLUDNzFP5Xq9tbK5+lwDz692llvI5SS
         k5UBh6N+5L/43qyXztnFvk32KNsvhr4ZNhiRVOLeRsy8yKYwBZWipmbt+1e35oRwx+Fg
         38glyAgZLalVpddhVo1xsC9iPdHluHY51s63k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870177; x=1758474977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0a/vjTQEtX+/yGwy3GQfrzKjZgyz27Pw8rW7Pi3j2A=;
        b=QUiRzEitmUh+I5DeprjrWV7BTvFvh7YHtHCv8K8C3t66Pb4WMJylr/X1dlUeYf1U8L
         C3wNcM46x5UU7a4HWsDQAEzTQ9fXbXIHpYBPYzpLthBsDbZsq/GzD1hzlWjNkwiCwQpS
         IbpI6EvcCYjh3BH8/QVqP6E6HlQlVr3NHGsQYuwqrVEOWeBdcQaYA+lXK+gKEI4eIFkj
         aZJ/M05EvIYQ/PpXVytv/97y1+a3w5y3rPe4j8TJR9wyIsRsjRP6COD81IcJN3CseYf8
         qpDHBJJyDPCYag5nGFagZK6Pl/FmoFk79Zav21QNc9ySZ4XUGVdjkEt5gOnKw54jek87
         ewJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZBysXQHe5pfuaKZFinkkjFofi2UhMfkyoGJeJDSBcTI6EJsMc4A+DH+8OlJu4XvBiSo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf+Dzhxz7X19SRMZ8wLXvvn6AUSAFYXGIGBLfXM7ol8OFkVpr7
	J4lJCvFDlztRXGHW/HmthLB/Bz6LWhNKgdrXqHqqoLIS3TiM2Ns5Wo9bHZ5CVwaiEQc=
X-Gm-Gg: ASbGncvvKLHxik6KpcE3306jyno7oXd13n8tO1TORgexiGoh2f/XVp3Z5DkrZgxuEhs
	/AXk0cu5bi4VnThA/5oEKym6fyuMC95EipiUTk9ActUPsHinLrXWB8Hq4yMeGReWYVqYuHFTljA
	hWNJfA0hXdn3Ml8JwYmZRiFf32CnilA1flfmEzRJBMQX+GUSQFy9DLVq51iQTGA+7Quk/QGRwow
	3vRLfPI40EKhq2N517ILUGS6HbmRxou8d5xm8MREj8A47F6oOdllqWOe55iqJ6P5rYfmw2XfiDF
	hlEw8uOcxR79nJoRXPJNGJebKx76Zyj/p6gpHMQvBHtHuo5mFhXALKARIqJm1kM/922GeysXWnG
	weQubh0iSKrOM3e12BYRsfm5phPOfh3JHYuuEz2Ms20SJgrWqMyC7eDPXDGp1phBC3ZKSfazi1S
	pQZiUrDCy47lXUJrS83Ic8gJp/IXiSnk+kiAElNzGsel+smHft7v/in+gdjdHVNyv7
X-Google-Smtp-Source: AGHT+IEvX+quO6ICKhJRdf8NKT/j6OYJ6Pe+ZtB6ww1NFEvD0skqRYkw1DUilScz0LuELvehDfDMmw==
X-Received: by 2002:a17:907:971d:b0:b0c:7269:8459 with SMTP id a640c23a62f3a-b0c726986afmr363002766b.7.1757870177023;
        Sun, 14 Sep 2025 10:16:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Sun, 14 Sep 2025 19:15:58 +0200
Message-ID: <20250914171608.1050401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v2:
- Add Reviewed-by tag of Frank Li.

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0

