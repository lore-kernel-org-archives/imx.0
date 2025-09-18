Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B831065D
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210768; cv=none; b=KKX1ugQxF8Uh25Ful+gs4RLBAiaezeWCoHDS68gsJVbKfQZsIu4OBs2dKz9Z/xJSgVNOfcJwKl9El/Fc7y7h2YOMW+Dfen/rqg/t6DJ6Et7tqKFh766hsXSW8YR1qSwZk3WftSMECGDM8KOQp1HCcDurPaEkVo+KOR8Ly7PpbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210768; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+7rk/WnOhfkhd8BZd6rTLjWiJtrjNngi4oQeJHSSrVsnzX+LHlcV5Qstdhijw+IOJQpp5rplPHMZzzCU4jtOeYMp+N0H/fxCLQQ+LlbbMYlftboAPfz/YEV4o7+0MQoOGvsiLlrSBNYWLXQFb580lfzzzgcVCFV6vFqZLYt0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=PaQnlumD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PaQnlumD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07e3a77b72so319871266b.0
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210765; x=1758815565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=PaQnlumDoYGp9KLvgQkUrHZOTUmHOnUnIfN/BrmyG0D6sI9xEP8qKWLN8/JXSeAjT8
         nY74yQcQa2YdZWkpxtvPw/T2kJkTVGXJLMkikAfTRB7CoGedx1jbyb1EEQY+S5FGCc7l
         nplbz+BsLPcxLWc58pnKA3+TNoMqzIWwSyBwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210765; x=1758815565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=BWzLU2XMMSo1FUNfR2XYdF0pduNnTXZJtHHwdK+o7umfGXlVHDmXhIjX24D/hN96A0
         A7c0o5F8QKWO0+EtCWsaF/uVw7bolfOCxbHLyCPkppK/1lP1nCjibiaRm6OMe1tX57xJ
         AmvsYbTE+oESjucjPyNQTb+Rqj2LycgHJjvPm5nTy0B/pKBJlxfwSxiMFieIVsrnl0KV
         8Wd6t/+GMAnkxwFzLx0KD5L86jiTABWl8BECzFZ447nDO7x321+vSWYZvLncIiLFxk6H
         PiOIfausM+JtYgdAcY9O9OJY6Q89cf4xeqkhKSgjt8+ieiUXWUYVQYTFxhO+vRNcC87J
         BJLg==
X-Forwarded-Encrypted: i=1; AJvYcCX+hnxVXd3vMokRNS9odcpq6yoQOaw0+IpNiLG1Y61ZSiN63kqbhSxNgfFS/7FWveSDjQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaOQI/suIY4x2XJqd1KGCYfLpO2J8cS0tHJ3FDYiyg3WfAJhUO
	nBsHPZpWFQf96rqUUcyNaECQZaJGatU0ug6pSQbNHt9igRZLL/EDmYC7AousspdKd7w=
X-Gm-Gg: ASbGnctqdzBV6WswoMhZuWNtixYGQLQ2/Xl6neooxyphH4SZnirSQnm0gZwhRTbGtod
	SC1nARtLJ8A/Uppmqq6b9Cf/i5wsLJpNzXdRUZ+GEO7/u8snkgnFrkYgxbxilfVTprRb+Z1F7Ge
	paolm3cIbgiX5RzLgJiTGHz8S0MgVkCQmfsV28JDoiKtVab6r4DMCDBHs6NatGKJ1oKEP2T3ac8
	3/mRFe/a2VO/QZEzZp8jhXtKuFTuyOG+idWcRe+0IFQja+wdLASXiCH1nYV8a/zmepR8p9B61T0
	/GpakYNSwDmjcWk+VRgY0ZlN4n/otzYk2EYw+LIVJz00gzNbsKPCo488SiXZAH9xSp/P43YTq9j
	OTcql1+T3kiHPRjLcX7K/OXDF3hWgwAoHWxZrgtVXwHKpnnZZ/4cANhgRF2ntCbKQR8KISZez9m
	1tj1dUqUuFce4Q2yJqR6AoWv4FzFACNxKihdO91hC5biMuJbQd1a9oKKPLtOp9DUV9e1av9ZH4k
	c/5U2IflWI=
X-Google-Smtp-Source: AGHT+IG+gvq9vJTCt+5pyWxiCzEcIfQz6BO4MhPzenmoiqj/1PmPt6GDmC6QwRXxUKbRTif4JvBq0A==
X-Received: by 2002:a17:907:d7cb:b0:b04:1d85:7106 with SMTP id a640c23a62f3a-b1fab24299cmr333418466b.21.1758210764801;
        Thu, 18 Sep 2025 08:52:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:44 -0700 (PDT)
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
Subject: [PATCH v5 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Thu, 18 Sep 2025 17:52:29 +0200
Message-ID: <20250918155240.2536852-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v2)

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

