Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573B267713
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975183; cv=none; b=EN6dqxhxYsVextDgjSFCGu3Mn0t0PxJDKjUxdkEP7E5g0cUKoFnF3xUJEi+ma8yy+3g+pJHQGAxpBTz6Zar1xq+XKX+drdqz4mMgCpmPLBOsdam9B57+wW8K1MF/WmFasmtWpjakqL/ZklIy/StptGaNJ2H/qEeH0VttkX6BNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975183; c=relaxed/simple;
	bh=HGCefvJVkJYHUUtIEx37dq0fjaTZbRZcwkr3/SvRe/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCNcJBFJCFlKX4Hio6m0dLfc44mu2Ny8u25fBYnW/724Zx1Z8CKBTXBY8m+NFsb91vgIQPGYqb0CUrDJaXThUjtILODj3561setp7xfOW2tP8xowipMy9ByI9dZLtM/rhfaWCiJGYH15S45MB9F/rGTYmfAFO7FjVZWGW9dYTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgA42abw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgA42abw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33677183so16664835ad.2
        for <imx@lists.linux.dev>; Thu, 26 Jun 2025 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975181; x=1751579981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19+6eq/UcLTUhcGPnlhBGclygh3KIPHQ5cqQpFzjJBc=;
        b=PgA42abwCK+j3IIb+xW8wtOriGV9DUiJXxhBudhZ2TNYyjslT+0mwhJ6Oe+PFw7rsg
         dXCb7bKmbh6DZjVw34xdE05OUsbeBsdHl02BaJAfwsAN5bIrcq5RTWc+4/7qRs3tGQEz
         cFCpxYyFKuQzQWCZgFUdTZFqSomWKCmUQ8PNEkg9OVwpVyvP/vtL2fsB1Tys0CbM/NUY
         bQz8HeKALKNYLalpPiI8e92t9xiWzVsCQ4tSPwydzHrWYMkPdo0YIspEZ3sFOTqZuynK
         YB1enpK5P6IBEeNqTw4p6zpbBSua4E8OkmdIQgLB6h1c2RtOSM+0nO1NMw8BYnu3m0We
         WrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975181; x=1751579981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19+6eq/UcLTUhcGPnlhBGclygh3KIPHQ5cqQpFzjJBc=;
        b=W5f52HWt6eN7v18MJxYo9vTxpCNuEAO0OMAez/7WkxQYJomrc/8KXvGcDDYr4ZvJcx
         jgk5y64m+jWasMKnvsbv+lwA4eaPefgpf3hTwS0sb/KcEVKcMbPv8hzXRzzCXh46MZ1G
         czG+uW+IY+SN7fm6ZIqbcyp0wJv4F+W8I2Q/cGkbupOgMN43CDjIZuXk9Pyei0NXGfkO
         JQHNy2UJMKNyOYm1lutoMPzsR6kG6CLVbgC4KOV1I33kX50ZQdgyEhCu6+JdqFNav9XT
         pUUvF3/4MrnGNjaIz6B3sOeq01187OAD+kcGQUD5G+35pXzDIjEe2b54idZ/Z/Jqgag+
         mMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAkjVnu3NnE0B64LkGtmmhg1lE+GJypsgZwobm7KrtVaGnbQhEKw3OqvhOD7iRnbrN2nc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlvHlZTfepmYes8MLnAoX02wNO2bhRKRkvxrrLxKBHZsXP061V
	GB/sOzSLcTewWOVZ6xPBJHq8I1krZz0VNikUce+SyBr8J5rLoAGhns16
X-Gm-Gg: ASbGncuOncBBEDo0LZQQrbtkYS5131TckoVyNLVLWNEjdwCZbrJn6N/UHQsmGpTx5qs
	QJE/dnIIoDIdBAD28IZ7lnCTyv31bX4uc7OhAhUxKz4JtWN+PRJ1HATWampGSkQ/j03HH3fyeDv
	D0BfWETo19uSc18P+FmXaAzZlrx9RFlQrTnkuaU28BGjC9HNsJtBZjd/GrVJhRPVrMnPaEI0B/E
	7g9pib/tov0VpU0ivGivPGhan3JzhR1D0Iv6Bt296KzSU2zOjQKYJrkeyjGF4RfSJIJ1hU6+gR1
	UXpaZLOwMliDNmFDWTgmP5xpCpTqwL5rgCz4UBsVlzWb5ciByVE0Wwhm5mgWRBX7dAwBl2eljrC
	WGMM=
X-Google-Smtp-Source: AGHT+IFGHYw7pNh3YY2ppWd/GXJ7nll6kZo8n/rfheAtH7R1R5QnYe8TH6ojABszFWMLG+uP4MGkOg==
X-Received: by 2002:a17:902:ec89:b0:234:8a4a:adad with SMTP id d9443c01a7336-23ac46824a1mr12395525ad.26.1750975181615;
        Thu, 26 Jun 2025 14:59:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:40 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v6 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Thu, 26 Jun 2025 18:59:10 -0300
Message-Id: <20250626215911.5992-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the Cortex-M core is powered
up and started by the Cortex-A core using the bootloader (e.g., via the
U-Boot bootaux command), both M-core and Linux run within the same SCFW
(System Controller Firmware) partition. With that, Linux has permission
to control the M-core.

But once the M-core is started by the bootloader, the SCFW automatically
enables its clock and sets the clock rate. If Linux later attempts to
enable the same clock via clk_prepare_enable(), the SCFW returns a
'LOCKED' error, as the clock is already configured by the SCFW. This
causes the probe function in imx_rproc.c to fail, leading to the M-core
power domain being shut down while the core is still running. This
results in a fault from the SCU (System Controller Unit) and triggers a
system reset.

To address this issue, ignore handling the clk for i.MX8X and i.MX8
M-core, as SCFW already takes care of enabling and configuring the
clock.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v5 -> v6:
 - Commit description improved, as suggested.
v4 -> v5:
 - Unchanged.
v3 -> v4:
 - Unchanged.
v2 -> v3:
 - Unchanged.
v1 -> v2:
 - Commit description updated, as suggested. Fixed Peng Fan email.
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5

