Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCF238C1F
	for <imx@lists.linux.dev>; Sun, 29 Jun 2025 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217945; cv=none; b=aXzLlMevwoLNBS+HIEma1uJubCh1yH3AHbvlm/4x9GsjwI5n73vNM3kPEbyb1E42IkAjtT6a2wNuqx4SHTcOJncv8bu5XU5XmjSniX40U0sRItCL252V7SrjEw1qnhynrzv7CLX4osr7YsII7xBsjxBzz4tEUKSlzOucy1yU9S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217945; c=relaxed/simple;
	bh=tFhG1J9WX6lkOz2RvO67ATCtV9LPDz6zL613qycQaQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d9oL3tdvlX08ls5+EUgVzruAKD7ti6aT6wLumprLC3MiLMBNzbqqiol3SIDn3PTqy3AlZ28eYPR/jY5lbAq9yBX/brUo0qy2/TMX5RwUGHrZ8JewDTSjgWqY20pivIy+0npxgf0vSsIhmzzKseXguOhZ9YgAKTzNc9UZM8iWJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkuq0G8y; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkuq0G8y"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5851764e1so79901441cf.2
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217942; x=1751822742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBbPPcEdQtei5+NuNnufcyttJ+zLeB0/TIiitwhS+8E=;
        b=Gkuq0G8y7gwF1+SbF+wQY5hkSPlpNx8+buW60bTaezw91PQbEUYcM8GUbccDaArtRj
         3idjr8iz4P9jOqwy1y8pfiR+TJyyOVbLgGL93rJ9W4nQGN2NqPb8lb8FOGEQHDJVF/IA
         fKEd4jDS8UpYxZbWyfCZIepniY8UOocq7eRfEMOPVOs7scKm2HAzmeyM3bbhCES99D/E
         okAp6oYmPRR5ro6j4YlHbg1XbQ97b1QFBpbeMTpgEAg7XS0J4mS8PRCNB8iD+W4heMxz
         7p7LLHk4bi5sGhLSqmJTGNLgo09Dsbi0sVJtNSwP39pTyjEUDzGN9EydSTYlCzs9xPmQ
         IFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217942; x=1751822742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBbPPcEdQtei5+NuNnufcyttJ+zLeB0/TIiitwhS+8E=;
        b=PBEPd+ftcYuAGB8LKeFJAXXDxF56sbddGBkQashUQmYyWSC6OGTp05vRpqbJ+ePK4E
         r+GZsOVrHhui2FAoDgorsqiZctNucV0MnxDhV9Q1DgqVSAoVUHDj7PdHLmHI869WAcLI
         0MgRP30D0Ly4+6wsSvIi16BW3Y+mD1EDnVPZ4NjBT8mtg3qYhcrrO+aDqIsAq//jmTUy
         EDNbjjKzM8KMjoGAdKYuf0PtDOkrhPmteZD/NUrE4xxu5b57ciizyg5M9BpXCv7kfr7C
         YX11zYVxn3+lIqoIe6Ag2LXT5fym95ey0SIn4VD1u7fBNjl1M4bHkXz5LYJOEp39nn23
         +6XA==
X-Forwarded-Encrypted: i=1; AJvYcCWk5OjLCt/weFToMnCWczzBxbgtR7oI3jGeJ4crUk/doXe3XeWNuf6L2syn3mPuab/S4Fk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBTy5PRopqvzPiKQ28QtLf0T2y/+IG2B6NzQ29hS1aPWuxs6cG
	MwEdeY+J/V3Gqq/Avtu5jmcnMLuDEpfe6Aq6n8em0aqddGGAs31g4M9m
X-Gm-Gg: ASbGnctnYxFLVwOxmjXE+IH81rt1wwDqKBm3aCYsAbHtRe/X2kyKAL11djUFdOQZtYh
	NCcvxo7SQbi98AGZWo/q7HSTXb+1ktRDEIG8qISHqsk+W474P8B0D8viAvPKaCbEg/6qVfxmSS4
	iioeg91yYB270/r1FnyfI1YhsC2TNRFzrTK6mye9LUSXnn81vWZa5KyXxQU8ydsJqk/HTP5OjYr
	IjmtXLNsyYWnVqeAw549ij9dgC3qsd4+kV75jnOHuSxaQv+Olfy+WtNO8U1mXosrctgju0mZ13E
	3i2ekmaGrVVSVpbMXZIQdntieP0R42ZRPP+xOw8jydwyPLQm2hZxCy5oEDhRt5tPXA54D+YrV/n
	JuuI=
X-Google-Smtp-Source: AGHT+IH0oA4OuFF0x2nQSxRW9BOpq3H9adGI3VCEA8SilmvSk/JkXEeS26LmCye5qmOTPQlaP6fQKQ==
X-Received: by 2002:a05:622a:506:b0:4a7:f683:975d with SMTP id d75a77b69052e-4a7fcb3aacbmr184575131cf.49.1751217942253;
        Sun, 29 Jun 2025 10:25:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:41 -0700 (PDT)
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
Subject: [PATCH v7 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Sun, 29 Jun 2025 14:25:11 -0300
Message-Id: <20250629172512.14857-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v6 -> v7:
 - Added Peng reviewed-by.
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

