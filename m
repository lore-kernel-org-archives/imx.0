Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB82BEFE3
	for <imx@lists.linux.dev>; Tue, 22 Jul 2025 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180638; cv=none; b=Ejou2QQKRmA6KWJSHGaq9JqP+0aVkI1xaJp1EfZiDj/U9T18vvZm6T65M/CUGNXMn1RTuiIPyLswPFUE4cnplE0UMAr6aWO7RYZpL+dG8doouuGLpAKFD8zdy7MXNnD56I8Za++EO1MxvaD9VsrqW/IjYzV5IfqoDZPeSIQ5JHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180638; c=relaxed/simple;
	bh=Uu0KyPQm4WIIkWykK1EPIZXCY66nvgOqnqJpxxXLb8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkbnOU27yVGTeGgxvPcOg9l9+cHvT6hm0jJcSTCCSX7F256I4xyOJ5mm80s00UyLKG+gqzemiOp5xHxbS9it3RFDyYOwkj1SKZZ0cdo3wD4WSifkDzXSg2wNAOsrEs8NzIiqmUJKEdVd7k0g472OiXTwFmtR5LkytgATsdDPvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j5CbixVS; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j5CbixVS"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so11250565a12.0
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180635; x=1753785435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=j5CbixVSQ67cyIhl9FyqYrbK8i847M4cVbl4BlChklSzPTFruq65qBoh/bgBXDZGrb
         nxrRylznvVHjJhfMh5pSNEiVmuT/qfG2hPuBkc7kKHNuaiMWHxj6n2i11IPdeA8wwTCw
         hsXHcm2cKLegw0C0iZCa5jy2jpc38kxAlhLic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180635; x=1753785435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=mLbsL8qnlF3FfAPBZxUAq+GCYl1Dq07g8o+g/m5oFm8LF7HnVPPah963j2JNRcdTiP
         n4xYbmcZv/1310Oz3Ms+BYvd23X+tnwjxI3FBEiAQ3yHnBtDUQvub+gG2rdKPSu+gD3Q
         FqFiEEhrA/wfja/lUNPiqUo1GAeTGtt5OlyBJ2bH0hY+qTEO7Oe4WYuSK3Wc/AlxsldG
         dfplp/2epxPGXvqc0RRU+nHo8CdH7PA/JnlSWCp97+sWV29HB7ySIXTeQJvnn0Ps6QgE
         L6B93KHEeTOy+WVg1RMrsxeZzUk5o0YHcdu1bZJhWovkQUN11su1kIn0w0EXn/Xsud7t
         nW7g==
X-Forwarded-Encrypted: i=1; AJvYcCVT2OtWXj6hJI/RJMlzmxZngL1CNpyT572atHxskZHsDf/7u0Tp6zNmjfQqHvyT9rhX1R4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Qk4C83qmPu6enUt54YinMgzWg5w+f8DpzqqhI+iWjQ6HyTg9
	VubQ74u0qnzTkxuvWpw17W4QvOFgKJFSxqQCaOlH/T3LvYys0UB8FBTf1ugut7V5v6A=
X-Gm-Gg: ASbGncsj6OamqWomaCRPPTQiaYj2z8uk7vGspZ8W16k7GW061tzTeow+3SnoX1l+vT+
	udp6+ETd2FQ225XEsehsslPzEIFXtKM2LdlbHxhXhT9GAj539AhqItpLbBFUJChoGQpoJOSGPtT
	Kp4F60WHlW2jrCsAg9BuzIuVVQPWI7YDwSZUCTLYwdTfTiodlR6H4QZkbtC/efuN87pk3L2HfAz
	AsWHykxF1nOTf8EI4kiVUdI/gwGSY+PE6gIraOl0BTIkE6S7NwZ1Pk1+RGMZW4LTUz37tWFu4rf
	SkdxYocaYvHi5l6JXioSnA0s1+tK8skEzUHQxZ65dHv+ha+YC2fn+nJEsgkFf6E0gNeneATETbe
	3tlrSrBq77wQc3rzY+j/RqYGdc7p40+N1h+SNTmoiPU4iTwW3tx9fzEYR560=
X-Google-Smtp-Source: AGHT+IGu/rHAsJZdTDesHIy4THsJpwWha/3OdhJMXkmdfz+OLlrTD1ZQyBKwuFnDcJvQVIDplpGbew==
X-Received: by 2002:a17:907:2d20:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-af153339173mr333989466b.16.1753180635127;
        Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 22 Jul 2025 12:36:15 +0200
Message-ID: <20250722103706.3440777-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
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
---

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

