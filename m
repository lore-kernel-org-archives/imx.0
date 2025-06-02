Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE87221723
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870399; cv=none; b=BW6unjpafWYO1ggjszbqQgcdncjd9jWt3HzswL8yAH132HFR1anEAXTMrNs63IoxBtzgfTZd4twAbMz/ZIQbub2FIwPhCkTxm4rb+2+WeoeNS6JRNpbBINcEYp2khKS1KlfpUqG0XV3EDg98C3W1K3yB3hAgh/jP3N5LJoDheLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870399; c=relaxed/simple;
	bh=oL2pBfAmXooSdMFJKON1dq1V6xiD8s5/TFtFSgq1qmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ULfMtKsr+V5nPPIF5Jt/EI3H/TBD0Uz9qzng0NHjc+6uji4d58WniCVYaQethd4E2TNA+u+vBGAMyeodr3iaWWl+L46JuSJVsOyleYpvdQBgPpAbie1mZFWTEG0XFKoNf7wmwJ23H7qOc9hHZGic0Md0aiGSw1xxOTo/d9hF6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd2J/SoK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd2J/SoK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30e542e4187so3022916a91.3
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870397; x=1749475197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pcvAbNlPqy8avpN6kp5KhushkYLoqeoRe8/zurysr4=;
        b=Kd2J/SoKMSd4ezxdrTqCvxFdV0YpaIUVUjFcBzT6eX4Xbf7qEKspCBL34DTQ+AXL4N
         ptsUh3NHu/aoxh1lyK4T0UHK/jKqUkNLGBAM+4C392Gvc8fuSWcW8NxvrltP0ruNXDiS
         zPnrK7icaZMc/+pNBMQbSLsrteOrdTmd8RCPJT30foQ4oyIC7wKae4EolyzBK/5+HPmU
         HnXoH8ZXuIZ9bz0xS2foElU1nA1Eo8wBrJT6s1dM1VbzDR54/2TxIwZfeiwYTcjzgVsp
         MOEnUz455KWIs7hmqnw3dZaUmk2rmnQPWss7TTkEvQc5eYJCAQ6nDJgxNhDFmv2/foVE
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870397; x=1749475197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pcvAbNlPqy8avpN6kp5KhushkYLoqeoRe8/zurysr4=;
        b=V7MUI2mrXXWSHajGHHBDaUzkpAP23NMwLbGREN5t8tIk7OKiZKTpY8sXjM+7CdWn40
         4x9przU69Z5mvwGooszXd2KqnRJLn2jQ9qNiYJ4gn9ZEU3K5ZUbc2jSyflO4RgLFGUlX
         OadqEvTyr8LO9OMqVRXuMdU63A5HG93i9ddXySM2aRi0a3jaMoF0e7qK8hSjoyu/hBbI
         Njuri6tlIhPd5/b89sBSZx1uvhvQPmvYoIuGUK4T6GPx1qQbjHqRTUJhSz+8oCofUIm8
         tVwEduE2YyxYHEZBxHUF2+aEjaxncT/IPYuixIizJWRMP7CbCQH/8X72agYadngjRzNB
         xZVg==
X-Forwarded-Encrypted: i=1; AJvYcCUTvJjgLqZe7ilv2zjFltobXsphWxcvuAcfT6W1H/u90do+XD8ksogUtLe+ROK45J/cfJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ptshylUkSAIh/jIztG9JEHTlDabmJeUv8VjN9LgFfkC4TdqQ
	tUw0z/PDzqjU0/h7GSk/L2I9ACnt1cHNA5z0wjUjpvpDb5ftYVCVcpHR
X-Gm-Gg: ASbGnctAspuxghFOHFyHQplZBkP37RV0MyqDnST83YnD2ynp06GJnVR1OTcY3sZR9b+
	CXbQ3HUkyxeK62Ap0GV7WK8StBbtfKFgp+38rBwihoOLXLagM9LugbQxI+uCY+ebV1uVnkYg8vd
	I2TqRnIdN+tfI4pPu2IxGI1NNc5LrFV3SOUvfbT+iKx6UWmMfx2V1pvjnlo5gHgYmiNO9yDcBsP
	eqfSQLnBOJ4JzVim5H29At6ZtCR3SLbo3I1eQMEaJ6DX5p6af1iPirxj3GhaXL6Grw/DNJaIM9V
	8bhDvYyRk4BA0IyXbnqTskBA1p+IWMsu5lU9+BzV1I454jLF2zru0xmjT3wxxhHIbD/a7PZXgF6
	cBXu2mEmH
X-Google-Smtp-Source: AGHT+IGmdU9yIWWKtV28WuEUnscGkG0AjD3tLXlSKHPKML0pCpHKekiyfiKqp/DGTPbox5idKuB7SA==
X-Received: by 2002:a17:90b:1a88:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-3124100ca0dmr20343807a91.4.1748870396838;
        Mon, 02 Jun 2025 06:19:56 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:55 -0700 (PDT)
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
Subject: [PATCH v4 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon,  2 Jun 2025 10:19:04 -0300
Message-Id: <20250602131906.25751-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
by the bootloader, M-core and Linux are in same SCFW (System Controller
Firmware) partition, so linux has permission to control M-core.

But when M-core is started, the SCFW will automatically enable the clock
and configure the rate, and any users that want to enable the clock will
get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
fails because clk_prepare_enable also fails. With that, the M-core power
domain is powered off when it is still running, causing a SCU (System
Controller Unit) fault reset, and the system restarts.

To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
because SCFW will automatically enable and configure the clock.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4: Unchanged.
v3: Unchanged.
v2: Commit description updated, as suggested. Fixed Peng Fan email.
v1: https://lore.kernel.org/lkml/20250505154849.64889-2-hiagofranco@gmail.com/
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

