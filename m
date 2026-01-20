Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D893AE719
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941554; cv=none; b=pfBEyHvHZ72ExlRGw29QPH1Qkmxp7MsUIlR5aAXw0ClsKOUGIoDrw9elizXrksq8zAzlv1Il1XkeVqTUX/EO8gwpf3OV9U0yrF4e3j+/KOXHNkXv+rTrvDdTONh4TggPctdhVJ+woe6E6UGYSg1hizoetVGcUH1LJFlYWMfljKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941554; c=relaxed/simple;
	bh=5CiX2WUsbI2m7w6tFZKJqvkgdJH3bNVYQSdr5b3zvHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKIrKmH1GUPvLyGrcGHeRUxPMpXQTALmaasWOxLtySZrPy7f8tItD1phQE1Z9rLlykuybkG+OMzFUFSETUpXhIIMbji7gk84yrlwpzBH6yRm3GJylSfzeem42YO3qouNolL/y7vuxrVEzaDEoU5bIwx8aRPHB5uSh169p8uY9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX7TP1AD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX7TP1AD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801bc328easo50104115e9.3
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 12:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941549; x=1769546349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
        b=aX7TP1AD31sjLpH+eL3b0DbmogQY9bpCIokWyafsgZt5mSterEHsFWp/yrdaZqQEYq
         nMknDkOO1KtwTAqg09lGzROoqr3IlX2z+2y8KrRoSCzAGZHBRpLMzSxBEvtthLasYiGh
         imFB9acQuxJZ0iQe7Z5xQ+CpO4clWNNZfgjO/19W4dtcK0EZORT5QCpenLPGIOWamIoM
         RH5BaM8U8hC0/tBrBvho9Wy/U6U6UXbf/Cl32r9+tE5IDIX8NXhSJPpubZ4DKd/Cz+tj
         IJl2s/o1qsHS3MTcAJ4JEKGHYbxVT9Bp7vxMEPbbFLPgd6eo+KemHRV3l+H/DIGKV0pK
         4//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941549; x=1769546349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
        b=YUqsjZyjsaKfV4mzozQotNjoAo7gT+l/pnn8IPmzNtW8RUPTmaZIpyzlfPwJFxO7RZ
         SH5X96cIAPNyTvK6wzk0mb2h1PiCOxTOHTl59IQoz9Wt3lAV4zz/BwDDv8q9AAJK0T3j
         amu7ecydNepUcKhX7/WbPFK2s7kRutLXkEZZ6F9iqMqDBidlbdIMvfKxWhM2W960xrzP
         NS/ATjy+fyxkVIuUE3EL4J7IY+18QnAOjwVk/gcXPxgZ3MeNAeAoc2fapfnsmfcLkJ/D
         poMBE04eiLWC5qCfhSfLERXQ/t+q6kZj1k8hrJp8Pegc+1uAs4Opc77JP4rAr/tD0DAN
         +dxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuyp6PM8PesS2lPq5q1HHHBsJ80V8HQn6U+u7GBDbnyDWsaDO3SiCx48qaWd0VdJPM4C4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbxDxI9Ya5LbZA7fuG7iAVNmGu3+jSMAHujFo0QEG07k9dlnCo
	cvCiIdlLYefbVfd4yXKkT4uC9zC80t443UzViDRtTzbMjPu/iGHflW+vWeKNGA==
X-Gm-Gg: AY/fxX61Sv4svOc2PBPUfNmp/CqzNYzjmmID7t3YarPq94ybKHg/ERuCdkkZm9op3DW
	/6tbCdzG2nVFr3uVGvDwsSH5hfJS9Y1slB+MUWv3/auIFqpOtnyTkWXpNuirNA/ONezSAOdBqkk
	VDF8RAqiYkzMTKRqJzzhOtLFd4rdLUDjwSeM6dxVwta1GDtdeH+Bzfab7q+2doUMBfJqO3FMe6d
	lc19kTDSdhQ4J8pCm2QBVoeZl4EOJUiMEKWZ7dyixBgEeLfsTckYMDMzN+TufN1v9WldUUd8C1a
	PdwsbK9R7vf/VQe+gQfswwgEW0AYhJSIaRNFmUQF6l15jA0vUYdmwoSiM3YHnyfnDf3dspRSTh1
	6htB4WwTL2CaSs9LD7e3j9ejrsuJIHP93BpJsaI00c+Kit29c0J4lsug26EP6Sekk9n3TJjdYse
	XJUz+L8xfHILeUokxypzTxz1iFfE8=
X-Received: by 2002:a05:600c:4e0f:b0:47e:e779:36e with SMTP id 5b1f17b1804b1-4801eb0375amr194243815e9.19.1768941549092;
        Tue, 20 Jan 2026 12:39:09 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:08 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to keep preamble before sfd
Date: Tue, 20 Jan 2026 21:30:02 +0100
Message-ID: <20260120203905.23805-2-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
shall not remove the preamble before the SFD if it supports it. MACs
that do not support receiving frames without a preamble can set this
flag.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 include/linux/phy.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index fbbe028cc4b7b..a978173c0e2a1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -802,8 +802,9 @@ struct phy_device {
 };
 
 /* Generic phy_device::dev_flags */
-#define PHY_F_NO_IRQ		0x80000000
-#define PHY_F_RXC_ALWAYS_ON	0x40000000
+#define PHY_F_NO_IRQ			0x80000000
+#define PHY_F_RXC_ALWAYS_ON		0x40000000
+#define PHY_F_KEEP_PREAMBLE_BEFORE_SFD	0x20000000
 
 #define to_phy_device(__dev)	container_of_const(to_mdio_device(__dev), struct phy_device, mdio)
 
-- 
2.51.0

