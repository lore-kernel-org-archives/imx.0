Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE94264FBD
	for <imx@lists.linux.dev>; Mon,  5 May 2025 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460205; cv=none; b=PZZT/Vv7n7sHtC2GUWXDzc40N4tREEq3GLhLeRaxvmXOKm4hvi2rSbi0vujwZIbagLYD1VoVjwyFfNq2eZxbeR71fgRHE4bPFk+qeLTZKhv4QMt6fWVQCA0Nay+fUk8q2T+W4BKbIM0HPBOlppGJYAJ2D6mcTyKaebJjMa09OGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460205; c=relaxed/simple;
	bh=kYiHN+nVO56jpSLDAYAFIb8zFBmSTO/Xrj6sX4vDXQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n1dDOCefOaOuCWqnjz1VMpIO2zJJfKxQlzrpcoJUcO8Bn3MryBn8HXDCj/qoaZIinmq/8cLwZs9YNiauTUglGSacmmMnlAhHm7gNzNHBua2u58cZrkqyXtC6O8otcB9YWx37x3dDPgOQSAHmLdn1f9aDfp9lv0rpcvNNgLaNT3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs3VzBHf; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs3VzBHf"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60219d9812bso1167897eaf.0
        for <imx@lists.linux.dev>; Mon, 05 May 2025 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460203; x=1747065003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzxoNjX13i4eG31sNq5COpLdWdwplkA/ut9vzb6w+YA=;
        b=Vs3VzBHfT2FgIHprtq/KhwOnV9ULo5Fe1dGicVFGoQ5/8R62jcQn/uMXc3N3gTZy4+
         iyY2Efu8fW+y/5WDS5NLRJDVK6318Xl5LSQNvA+uhMxCQdn7ibQa0FkH6dGpY3ZduG8u
         qNWoU0KZ5iRUTGgUZ7jDKuGDK5279STzON6+507u8F9ZzZq4ZqkVNb5YMC3cCHEet0eO
         Gu5f4HsdYoK9bl/GCw7UoApSKipM3Qz6EHUKUrWkfkaijITdIL3b8Bcuy2to1FrPGkM6
         kQadFHBaXLer/CYWsg8+DPS3CuXz/anaNuyLDp9Qf/iaRHsR+R63BzdZKJS6Iv2xCNbm
         Ce3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460203; x=1747065003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzxoNjX13i4eG31sNq5COpLdWdwplkA/ut9vzb6w+YA=;
        b=lWPP7rTPqM6BV7FTIjR4zR7gVpHr3RVda6u3MVVyMroI+mllMedcqo976DsuMGlFQn
         Iewv3lmU8h1m83UeHzwBaeNEQyjupWrV0y+ixC3Pr+WM1oKOJeTFxjr/R9nkDvBRAUZO
         dPEawl1dlWQ19s7pk8Ja6MuPlSYM4lLcdGo/pST68IVquukj13j1vO8AYzaKNUyksbYA
         sSAxEjszhiGaWP3swGHLoRRP3rImYLm0MI+2TpCBQDgxBFOd9VmgXvvcGlLv1DFmdNpr
         m9DEQLYYIPrwkx9SdVXta57qmJ9V7zMzHSj32+dne8MplseratJ0pjouMx3fmjls7Rkr
         dsvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5pN8yzPinrBk2zaqmXjSBE/fV5S3uTbxw/a9ctjcxnIF4PCOvgCvRQ5uR5cxae9cL8OM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNdMxQhKVjt2n8pMhVDSeIlpBCZ9NsqEE3+XSo0o2GtnFJna1e
	gnKDrY3cZhwyQkLZV3AKZvibbVidDw5syY4rFllJ3/dDKxKNeqjf
X-Gm-Gg: ASbGnct5Ts/ft5P4xCaGKphWDDULoQKa2L2Jiy7bdhj8a2ovxgcsfWGT+pWs6Xr5qPS
	vwsEBFzZNYqAWsxwNh+y6zjSmU+UE8+U2V4v8d5gNMpkWZ0Y8ldulQ8mgbEFkLfgdtL3HhExiKt
	1fY01ct/esvsHudYB2qFx2K+es0HS3Y9GjONlMinO+pzEeBnuEikLTv+xbKFmFmkDcasP5zGU/2
	hXSLUXdHHzZs5XvaXieKqkEGS3IfHsOmCf7SHN7JWtQm3SzXRLizq7Jq4YBlCWybKnUEntHJnzN
	BeUkJFRZHHgy+uHgvmrqkXUecYBwsBX8TJrmMtbBJmRFRbZOE9yseaXg2SB8/o4=
X-Google-Smtp-Source: AGHT+IFmXHRAfXFJOCHFZobnyaZvTqkwxSNtmF5ex7yON9mHi0l4M2n37VTw9ZY8eHmQoifZiTSQ/g==
X-Received: by 2002:a4a:ec44:0:b0:607:e293:95b2 with SMTP id 006d021491bc7-607fab26b1emr5755194eaf.8.1746460203351;
        Mon, 05 May 2025 08:50:03 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:50:02 -0700 (PDT)
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
Subject: [PATCH 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Mon,  5 May 2025 12:48:49 -0300
Message-Id: <20250505154849.64889-4-hiagofranco@gmail.com>
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

When the remote core is started before Linux boots (e.g., by the
bootloader), the driver currently is not able to attach because it only
checks for cores running in different partitions. If the core was kicked
by the bootloader, it is in the same partition as Linux and it is
already up and running.

This adds power mode verification through the SCU interface, enabling
the driver to detect when the remote core is already running and
properly attach to it.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..86541d9d8640 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -906,6 +907,21 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return ret < 0 ? ret : 0;
 }
 
+static bool imx_rproc_is_on(struct device *dev, struct imx_sc_ipc *ipc,
+			    u32 resource)
+{
+	int ret;
+
+	ret = imx_sc_pm_get_resource_power_mode(ipc, resource);
+	if (ret < 0) {
+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+			resource, ret);
+		return false;
+	}
+
+	return ret == IMX_SC_PM_PW_MODE_ON;
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	struct regmap_config config = { .name = "imx-rproc" };
@@ -949,6 +965,13 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 				return -EINVAL;
 
+			/*
+			 * If remote core is already running (e.g. kicked by
+			 * the bootloader), attach to it.
+			 */
+			if (imx_rproc_is_on(dev, priv->ipc_handle, priv->rsrc_id))
+				priv->rproc->state = RPROC_DETACHED;
+
 			return imx_rproc_attach_pd(priv);
 		}
 
-- 
2.39.5

