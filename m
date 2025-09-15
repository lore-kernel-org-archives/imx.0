Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7AD2874FA
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966035; cv=none; b=W6l9e6jAIbKcCrBbb0soyQOoV0INnODaO2DCt8r+5aUah7rxXzjCLwGxGX9wWnbC/ik7DQ2oWT92G8p4kWEGtFsMGY32TF9jZNaUkY8ox5JZfFZkwDHknagL+fe1pSkKO1CGBsrw9UftJGb++U15UBNkk7YouapeF5eXeQe5YZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966035; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNIDS7C7veXaHLS9MhTTBNR2iYQosi+jE4KxZLqPRrfQUqR0A8aUTFhnWQUEZ6u+JtFSUoXMjzXJvJKiJDV4TpJfwjincsaIILluQonAblFSjIuNQ/tuW3h5grOsRmWoRe+4Q2m1YTdmneCPu/ulc8aJqReCxkJ0UxoddnImYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Cx3A2JFN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Cx3A2JFN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so8910405e9.3
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966032; x=1758570832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=Cx3A2JFNQYu8l8fkY0Z3n1VDnHkNpwYnv6avflGORG2kn+9P+wkjBF2+Xap6aYHK1q
         fhlyf/l6j2ViOzsgQjpUiTxmH10/X13/XAD27xq7AeerO0DZMI+ZxWTXKZrFtU0jNdVe
         nr9zkuQLd3wXY/uDTAkQrRKC+raa/90RPvUos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966032; x=1758570832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=phEt/wZPEQKHBbHDWgXlJ7GOfcOZku5l8z2JAwUum/AdvkKgtU11XnZspHZWJIbOZZ
         nBFGltMXRyoiLngXK702N3YzlgXoxfgR/YKm9cjNQevdZfjohzBDb9O8vrwmjys3tMz8
         ZdJa0rzPlQZVt7WtEtfcBVNYo/8Cry4AF58brQX4LtCGAYjW6TitcUyLOhchUw54rYwM
         FNqOEkn9lTA1y2Sowsvec3CCIHY43Gx/Av2OiN/NVZ4xbpllRt+Z5XtMUBHB0NX5dIOc
         vBNJkU+fmvV3DX3fQOohPHA+J/MHvJy3ttEC62tk2R206RcYiukVPpwtJUizQEBVGndd
         8uOw==
X-Forwarded-Encrypted: i=1; AJvYcCU3SM/uTp8dunnEVbdnJtFgupLm4LJZG7voZAY6PyxdqRNMoHUCFEWLyeLunhqi9MVEaDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg8nNyo7nhhSsbxIndLlZfdRB+XjZDNTdFh9uOxluHTCXPh2Lx
	UUBnxTDuwxEEVxcaKKZrHSLqR7dmnQSJRVcHi0skV7a7CHjCpSqVgKKka4OT7+X2fxg=
X-Gm-Gg: ASbGnctWfBjyNmlNJw42QaLilEexUPrk0WGjNz1DV6TpesHanVgj5zLG6cIggM2UFHv
	Ge4UrKoHvE4yT5Rf2AT+8nJdH7jEpwJGYl4eccgHAKe2jeLroDpfmDmQHI4NLBiQhgxuhPUKzQR
	T5VNmRHFQfM7yGSHNN2Yn/tIQixowFJ0VADxEs6vrSeMpPa4MN3O7oridILgq/lHrSGR7jUkxHP
	A1jbfXbFAZcsdeJl8vlLAElfjM18Ny3qRVcp+EV66vEHtKfNHEpEJlJTQ3hWsQNP2xnXikEz4/t
	qsXMdh1djXmE3H/qtX7/rfCBhFY8bUbyGEi3vsrdxwMVkHrMWKkdUg0IOew3Jau4ZQ9VsePWCHk
	xVa7oPa2bgM3GYLF3CCCMmQLpmfZ2yehcBPczjozJnHc4WOz+FpptO4SGZIoC1a5iyJgAkUcI5t
	/s4Z0ugq1D
X-Google-Smtp-Source: AGHT+IHfif4UVv4IrK9t7pQTUnYShPYNK5zEJaWSq2zpbicbbJiow2T3/MUB/cRMHEEknTaIP9xExw==
X-Received: by 2002:a05:600c:6a0d:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45f211f6b70mr128799385e9.24.1757966032348;
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
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
Subject: [PATCH v3 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Mon, 15 Sep 2025 21:53:03 +0200
Message-ID: <20250915195335.1710780-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
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

