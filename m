Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D128C85E
	for <imx@lists.linux.dev>; Wed,  7 May 2025 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633724; cv=none; b=krO4Bh/t7D5ofcwbFIa353avVGboXwvbn2o8C2ZtnIkF/oAzQHcE6W3WUAWOlCrgP6AQ0aaM40t+pvjooTMvFd/QhBA66n+E4juiXNoSDxI0Wb1zw7L9kmouog4F8P+KoVF5IcnDbg/db0d8JPkmku9BWkOVN705qbOretEpgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633724; c=relaxed/simple;
	bh=cTjBmIVvQ5tleYSwTnurFm1RmNLCa4KLJfhfwkC+sdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sZw5qH+z0wxtwJPW0Eux/ful0fWddDJe3y4WZWNjEDTH4rGxEILt95laPns6gGwWqV/vkQcfjtvTiXj2/sIj6UJd4BDlfk6eUTFTy0y7bDVWSdm2E+ye5AdjR4I1Wks+K6jLDqMOS+QA0LWsZSQdhNl1IDXOcvWPlBEcgzWQvAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIF7aWCk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIF7aWCk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so77445a91.3
        for <imx@lists.linux.dev>; Wed, 07 May 2025 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633722; x=1747238522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO45tkjbLYjYtv/CvK6w8KfE5OYOXfvwguuZ43NCctQ=;
        b=hIF7aWCk1CbdZL9jTHmKaLc/3xDXxO/cjlkFzm8t+J5ACDvRbXCkEMBVF5JnQyvxN8
         sSehsBxCGuP5Np+Ea8M7NgTt1sqISe8seJsDMuZD6sZhikNPBE75uaqy13t0D0ZmQu2o
         9lrB0yVNkXmXenijpBTOYSk/IgfuCtKgeRfAKTO55QiH1DzlfzoLa1LfiODi9WTd4ijw
         /aObImuc0Gc0HOIkc/WpE8E0MSjOgUSlbUycFaqPErEtwF7G3eIQf8IFeTTlPzy6OXvL
         gHkEPBH2DzqlVp+9HkauEIBqVSkFBemq96F2+EdpLuXi6dHJ5yOKTuM0RQpWtRwVWZus
         3psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633722; x=1747238522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RO45tkjbLYjYtv/CvK6w8KfE5OYOXfvwguuZ43NCctQ=;
        b=wcHgcDbpwFHDLpwgKGMDGPtsGmWlVfwyUKJbclZaCV+1HaWOzWiaT84U0zOnJ7IDzI
         IySB+JSOC4Lk31pd1nyCRqXr2yqZpteMDRuw30cknGoc1DTbS/n6VPtOWPuQ3QWqhe2p
         lr/UQcF0G2IS8NKZb4zVnqJF62ctQiA1EKB5HbNSh0JjfKiEbHXFZwyR27adtistYdBK
         jdMTKOoHwRzgmklLNeNcAYQJsXpxK63ZcTiljlTxECa5zp1sLVk00w4dQMtqBC4vOL/M
         tQ3XUc00+weSI/YGvg2tBya8kE/VTcQp+fsnEQuGnolyU+tujpa6Cd22NDHBWTWEVj1W
         pbJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfWeRDpiyjYLd9/3+IZ0hnoZl2G1B+QJhrLLjHBEB+6AKMkrwzbJKk5Z2i2Y3EFtVlMU0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr+bkzJtlaWr483YfuvQfvEvN2cy0JRs0ZcEmFZTeK19h6/dMn
	wMMaVW5MKpYvfZNK4XnlTIOwq6F2pgRyh+YqKTgNg4/rQ1ZeLvfg
X-Gm-Gg: ASbGncv6eGjCXYc51a8s3JR4qAqqYAO6KM+PMGVljViQpU1nJLOo13h4ckvQFXKKLQF
	NohgB0tvWjWcFp1fmZ3JIQBM+0HpltYaA7OWLONVwB0ora9qGiIjsTpRdCBfIwRsgPMAon4aJOC
	j0G6GnQ2ER+LRj4r0cgwBzmTV9yEnPPlClt47Jjt5swL6rmGEBWzx84GyNMOAHJG5zJfXyFnECq
	pyu99QpR4YUt0w0/B06JedwfOt19CGuJXe3ZymsKeOdWYVYbzhBrB1J74Is8iY+wIgSwIzZdD2k
	wAulztb3ZyGL5o0Do+bK1kxK/VvpYTteBV5aQSZK+FKjXG9H2q7YNXtvghVb2YQ=
X-Google-Smtp-Source: AGHT+IEmJOhnycByNLVKMR/CtrELFdJfDJP1ErBRH92r56MtV1Kyb3oVdVNaoaxWV8fLKFKyiXWbdQ==
X-Received: by 2002:a17:90b:554e:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-30aac2837bcmr6500291a91.25.1746633721722;
        Wed, 07 May 2025 09:02:01 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:02:01 -0700 (PDT)
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Wed,  7 May 2025 13:00:56 -0300
Message-Id: <20250507160056.11876-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
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
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..9b6e9e41b7fc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 				return -EINVAL;
 
+			/*
+			 * If remote core is already running (e.g. kicked by
+			 * the bootloader), attach to it.
+			 */
+			ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
+								priv->rsrc_id);
+			if (ret < 0)
+				dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+					priv->rsrc_id, ret);
+
+			if (ret == IMX_SC_PM_PW_MODE_ON)
+				priv->rproc->state = RPROC_DETACHED;
+
 			return imx_rproc_attach_pd(priv);
 		}
 
-- 
2.39.5

