Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B4B2417D9
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638275; cv=none; b=KPDuDbrCrE52u6CWwkeEPIbiAya1Pd0UnHvP832uu9XnFMw1lIn65kCRDNryW4kxWLvksz2I0bbWwMYppFQ/4ms8RZnnNeGt9UWbAzZuJtCxsWKgx356R50rE96nt+Oe9qwg1lKSwqBNaFNo/jWkRfsFA7mDEQDB8ljFZqBf3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638275; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6P6D6Ew5qIZcpfM9B0xVBWRkRUtvVDTZy5U81K7Qb0ZT/e0wyOBIbAMtM0SUxOHQ1Lg9+PfIQ25eOvbvxv3esAylOGsx/9ZHODfVXN8VvgdVrE3WFVsqTlBrXpbP9jZOhYgoStdjEmZPs6VDAgUTsSxqmLOKKVB6fAMEdL2gxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GJxp9oYd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GJxp9oYd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b2d92b52149so380230866b.1
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638271; x=1759243071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=GJxp9oYdWqpugYQzo17XraCLkhHowtlMm1sci/Rxmjm+9ihWOTWIpcErIlkSuzvUsk
         PmX6taCwLVfBd+T7+BzDrX4iqnWDWFYdsxob70U0+rOfXZVa+N9shNUSNNImfEaEJiCm
         fsX7tBHkxk31z+5/j0fV18mJRZbCVku2kCxjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638271; x=1759243071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=TNU3kw4VNg8RSRgkOuiHhxQ9MNh1k7rrli0VjqWKwudPeYBt3OZGFqIKKMQ6+dh8Zl
         SuVcLU62s4ScULuL6tSJyUqS0AjNBokoEuB3lOdvh2LP/q6XRid6r6H//gcaUaljk2OW
         x1mQrTtrq+XgpvX6BU6YLukLDrfMMMnVjmVkCsBs9Wv/Lank8gB/NfKtjiW2rLIBs5jk
         BpJx4WMMKfkF/o7D3IBzaDwCmrhN0kOIH1VQ1nvTW/lVQkdO64S3M7o9DD0pqZrh+fIT
         j1LQqhvpKIm3ZwHzLZGz0egeMVd7G7VT+0a4sC/MbDR64E/xv1n6oNPwZJe4VymvSkkO
         nP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUJW/0ONiBHG7ppF+ERB6ctPzgWcM/fm3EI8QTSiCjT6I/dd1UbxomHRiQwLhZYip7vRaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW9GMFNL+ivrCBdKhgMQmkXuSLUX70Q/p8LiZ4hWP+tqm6RqOm
	Axn+6JaDF8U1UmMj9Pr24mw2L2kEZECCclpw/u76Taeeic7/bVq0+fwJWWPmfKQD78o=
X-Gm-Gg: ASbGncv2nbXgBxNJ13P3o6y96qRQBKpjVS/i29NL8uajFaUTgeESWBdT51n3s09yNH/
	5LW1sN/TyODSY+LUywAeeM6vRokGffnk6WW/qSGZM7+F0ey/eA8n7l+VMJU4z8LNceXwLN3rjPS
	rs9DVtImczPXoa0s0dLKtFK9oTyNYU+I9X8OL/bGf4x5+qK9RS1F6z+ppQUF7Ex6g4KfTtcxWIW
	8/4GPa92hDDqqHSK2pNsGIPeIoSBYbC3gUH56ZbA/Hq76cNrq+qCode39yD4f9DKmsvf39TTEpZ
	YSqCWVzn2qwZdDC/vj2l54GSuZVBVLIU5pys4qEMwDQCVpsE1d3BziLK7HE6Zg7wUR8gHViPmwQ
	QB0caKBHVwmBOFQlvIYCwZt9QvkMgFW6/s+/eMmkkprjErYm37bBCgkAx2oMbqxCJuEN6OFvXG+
	gRj/4VBwBbh6Wjq8R0PrZTieJV0pa4YenR6h6tGNOKMozkXUuJtreHiogN7Er+4uVy
X-Google-Smtp-Source: AGHT+IHaqS5GNeMUhn9N2QSUvjss8/1xeAtf3qXgVO60HOyrcSqyn/pZRNK3lgknrBEjEWoU4iqXeg==
X-Received: by 2002:a17:907:6d22:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b302af24e64mr265873166b.46.1758638271431;
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 23 Sep 2025 16:37:32 +0200
Message-ID: <20250923143746.2857292-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
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

