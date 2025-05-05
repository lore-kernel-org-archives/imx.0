Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7C25D8FA
	for <imx@lists.linux.dev>; Mon,  5 May 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460196; cv=none; b=kjib9GFcLI1s3bwV41WJUURiv8683EpRSMLREjfxguO7yersSwRS4Jy5lf2vIQKLPZHprgku2hJwXhEwAuqJxjIRXAfweInYWUFVi8IPx2QeXaQLwvYSoJ0GoEhK59bzsy7E18gJbKI7QmLK5bSYYZR8fF8DmEdy/A0Kbnw3QSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460196; c=relaxed/simple;
	bh=sBz0S7IFIbK4ZEXgBhD2c8M5U9d3QySQf/FYHBNgH4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nlOz/l7e5g2l8vLIupJMjIjb6RlGWSzjg61fkRfwDkbpqCCmdhprNX4REo401qGzGVksRI6tWnJFAonFcRrHzdmvpinREKYuOeUQmri1RD515YJaUiVa1vAFZgPpe7RlzNJKH+2h2tMbMxRYUwYxkdGrXgf1Q41B5oD3Bgh3BEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJtXzDP+; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJtXzDP+"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6065803ef35so919840eaf.1
        for <imx@lists.linux.dev>; Mon, 05 May 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460194; x=1747064994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrh837RVy54Gg6Y+qeX+8goZwlDp8QNNPgp6OA+KrOY=;
        b=QJtXzDP+IyK5ErBRHHUAsGsHtFawcoVVBOzu6XICR+r9k8lC/jRASUjF1LzGVmvcCo
         BTMPqYHcZYU4fzX90py5QCqZZpawapB63+8DL8MeQITdI8xAn6aINNh4A9lRY5nUN0xw
         zRi+sQe1ZffWfrsjwhEruaArLYMfBoHYSNJWwvp+e99q++HORQqZRew24Kc+OfJhz1Tv
         nQ4lx8NzTAajfII49FWWyNHcUrp7n+DEHncgBIlMabe3o9lKJEuyjWp357Jsjb1PVSVo
         BzRoIEkvmu4+s9WrBaxT6XrOBQZ4qt4lU7zz6U5jwF0MMJXL0AyUdfL1BJ/3cm895fcL
         YnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460194; x=1747064994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrh837RVy54Gg6Y+qeX+8goZwlDp8QNNPgp6OA+KrOY=;
        b=BMa3HtghH0b3HWQ8MlgAUOK+nxEVtBjaQDDi8EeAHU7Tpwc/EfBm9PJ4AxCe0iJQcw
         GjWRHD6Yk/V0w29gczOQdZJzwEg5xPjUe+qV9ZbsVL6iJ3xytIJxZ6Q88LGFl0QOsN3Q
         vwnXwu0XOx5CSD3NioClgYOEgM3j5v/PWEpYpqYIr75KpvSVSJVKowC+uLEC2XNA9tkQ
         psqmLEX0T4lxvVJFgazbQuePOju8IOvcX5eYcrEj6f1ybmR6AA36ARQG7rSGjYqfid6r
         luKqDsLJHSFwpNcaFO1fSIoxsr95pD0sI1mZJrJUagcKU1iNB3nTRUYVPU+5r9EgG84F
         oCIg==
X-Forwarded-Encrypted: i=1; AJvYcCUBs3Hu+zGSXUcWoORC3SEU7Jw4LpvW85kgXGgKzV7g31mNfrZpMRdxO6BBVW7Tnt84AZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCW7TFpMYCFTqfo5HEhG+EOnLFdKyJjCUMTrRQX0SNZeFpLZnU
	NI4jOQNuNlxjn4h2z3dA17rbCDs+T7+OKgb3ZwC1J8TXftX4y5x1
X-Gm-Gg: ASbGncuaAcL4xRmGfBxlH3GtokkmP1LWDe8QL2QZSctnIFx154g+08QnxmpSq6M6Oyh
	h/qKNRgUjhfFOAt2T3xr9gWqoVkb1A7Oxo5jO6L+yExTg39S0sdHXoYP/jHxhhYdAozDe63A99F
	Y7LXRQVDsQH4fmQn89xSgEw9GSqYmLHRF533Wh2vwsH7R8ntQCspqlkFnW/rpoJbC1gwHmzTqTN
	tVuChHD1mmbOK6MYbM+UfZQI/DeVe/gBXSQEZ2wM1vSZaPWaiZJ+IXa88MklbvZ3OcRj9OpBhsi
	vK8WHQ5mi21pxogpfGRFfuB/X6Dt6GpJm3gAA0XHN375T5b1Lz7ORHfHn5z/j38=
X-Google-Smtp-Source: AGHT+IHzxBFSeMM74yjOto3P7ALY8hiN3bLZVvyyH/Nc6q5335Rn3C/QA8sNLRqmd/RLKdgG+WebEA==
X-Received: by 2002:a05:6820:1391:b0:607:cc1a:572f with SMTP id 006d021491bc7-6080030f9b9mr4884601eaf.6.1746460193770;
        Mon, 05 May 2025 08:49:53 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:49:52 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Mon,  5 May 2025 12:48:47 -0300
Message-Id: <20250505154849.64889-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505154849.64889-1-hiagofranco@gmail.com>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
before Linux starts (e.g., by the bootloader) and it is being managed by
the SCU, the SCFW will not allow the kernel to enable the clock again.
This currently causes an SCU fault reset when the M-core is up and
running and the kernel boots, resetting the system.

Therefore, add a check in the clock enable function to not execute it if
the M-core is being managed by the SCU.

This change affects only the i.MX8X and i.MX8 family SoCs, as this is
under the IMX_RPROC_SCU_API method.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
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

