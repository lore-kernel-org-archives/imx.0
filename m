Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B311C5F11
	for <imx@lists.linux.dev>; Sat, 30 May 2026 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171574; cv=none; b=klSCWZ+hkQnN5MB8S/DSksdTbepWAGzxctwRBrzoQ6MoOpIzSLoUcysClcuQjIAjRz0Zh+FgHJ2ZhZTRv0L7jmolRQk5dy+aSDcd2f8GOhJ+ohSEYGEN6ZwanTiUXdonRIKIOlGe1hKCxf4F7PDuh5CGe7tvLgirWonNq4ubiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171574; c=relaxed/simple;
	bh=cm+7oPUGXwscThq8v9br3e4nNphRaCFZBysh2owGR/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RegEiRfCHGO1xUB1U9zS0pB+ai/tugLePGAvw7FL7Gf/c8E2WAteLHxRZZiYbRJkO7GovfITqX1iplhhyFiYPHl9tl1DXqiHS3t40GcNjWxhnDwtROMth7pDlok9MrellckK/gEbtqDoM1xtc2EEcUEjJSq/pxO/YMpqshwTHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvLVPgPL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvLVPgPL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf18c30bb2so15709305ad.0
        for <imx@lists.linux.dev>; Sat, 30 May 2026 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780171572; x=1780776372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fBSNfLq7QUu4AmPks5xSIdwkB0r3aZw9X+kxcAAws0=;
        b=TvLVPgPL1Q32KNTHIMTY+mBLYkpvq+4uZWaCMsEENrzziqqiHDikLrfDTKj7uoSr9U
         Zc529gpVCQS7dFXRzPLoIEPXPVBkjlHVrtdWODe5+6FfmyuZPuZ8Q/7uZZ67x20IBct4
         8ynM8JxMi6tI2GTGuFALCXuNhyTYlRzeCx5xi5WSQCOktCquZispSR26g4FBVPshiHPH
         aL094vFdnjbkeOmR9uPiEiXZ4MERe02mC1eiLdN1+jGycGNoNTBTCH0uim2ILS0r4KA7
         S4Dn/hlSg7vREVV67e3VF8v/ymxcHlovLwUdut66VnVX165s00hoAj8Atnd7FRTkT6ee
         kWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780171572; x=1780776372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fBSNfLq7QUu4AmPks5xSIdwkB0r3aZw9X+kxcAAws0=;
        b=chh26VQeijUUMnxNEj04HHKLRAy78w0eFR9vAvJtOiccDswMy8Qc2DiK9+uQFDXf/+
         yaykGZy1uuO/Oq2Ifv4qCC3WF+k7V4etd1Wl3AUgk7bwIL40qjkrbl0vNxKT6S8auXZ1
         jqrguquc8vKl5NHqlXeqVgeP+bFuQv3GZHfSvRvMaRtj4FImjwpeE2a5ngO8JJWqWLDb
         Ef2Ex1ladXe8vyN0GcdeiQv+qol46RITeh+lizTlT2JXVL79bYfmcSZGib5gJ2eSxrZE
         VjVSzwYeJWz+O2olMRwxb3lQV633Ro7ojmQeqCh642I9MeYvMgOfSPu3GLlD/hUxF9qv
         6OZA==
X-Forwarded-Encrypted: i=1; AFNElJ+p9kKPoAXchjhTfMGQdT4meNYYLnn4TKqHKCWATsuyNdRRLb0yz4ElN7ZhZhLBG1Lr/EU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/CDHnBUkOL3WAgLU9FI4qQx73UTOFTPGe/xN6i8Tftgl5+TY5
	BynOnanq9kRGtvo9azo314ywg6tMOytcM7DbKqCEMuqZWHrXDOD5mxLC
X-Gm-Gg: Acq92OEVergn3ONBhjBV/Ca8FwhfJmaBYJ0ro3K7c4Rbt3wyzMlj4oQZnjUSj9P/ekk
	P8Y9479liNHW9VxFrE9YSejIqcK1eAvnJ5dYNOOp7/p5BF+sKCYBGkYB2AI9jlH5tGT5brA8ULu
	tt/XhRDrSnia7XsejnuaNw9ez2ASmzpj+0OCwXYdOGXJLRuYuiZLqU7SganCRq/7VLfUAEU1H5k
	e2HvidkWPknVs4tE8/Z3KiNeh7AQ+sxS8kMWCRLc0lbZ5xDNDe2kEP945s/YZSygdualt3dtddI
	yY5HKzm3TLF2/eO0bc0O9THECzHXieRlSK9XZJiybJnon5Amf1tYh6hiQ1pztZDN1CM7W/pITyF
	JN3qd7DuMPoe3DHeSmKNU/oOaEtZqJSSkSH/UIJvg/E3XJp978OaTdujtgatw1YZnxeuNqnbRUo
	mbKPaq5moaY9oev2tsGZJf+VonIvwxgszLo1v0E7RNEK+mstVGsP2pO7GXTfzp1QgPZXwUvcaGc
	Am2J2ZHY0W1BzXyZkWDy1oZJMjsBWZ2SI3AIzmX7l4wBQ==
X-Received: by 2002:a17:903:37ce:b0:2c0:b5c1:8e32 with SMTP id d9443c01a7336-2c0b5c192fbmr19092815ad.41.1780171572211;
        Sat, 30 May 2026 13:06:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4dd4csm58546105ad.78.2026.05.30.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:06:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: mxs: add missing kernel-doc for struct mxs_i2c_dev members
Date: Sat, 30 May 2026 13:05:54 -0700
Message-ID: <20260530200554.8415-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kernel-doc documentation for the struct members that were previously
undocumented. This fixes warnings when building with W=1 and ensures
the struct is fully documented per kernel-doc conventions.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev &lt;rosenp@gmail.com&gt;
---
 drivers/i2c/busses/i2c-mxs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35..4e07babea9c3 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -108,6 +108,14 @@ enum mxs_i2c_devtype {
  * @cmd_complete: completion object for transaction wait
  * @cmd_err: error code for last transaction
  * @adapter: i2c subsystem adapter node
+ * @timing0: I2C TIMING0 register value
+ * @timing1: I2C TIMING1 register value
+ * @timing2: I2C TIMING2 register value
+ * @dmach: DMA channel
+ * @pio_data: PIO data for DMA
+ * @addr_data: address data for DMA
+ * @sg_io: scatterlist for I/O
+ * @dma_read: flag indicating DMA read
  */
 struct mxs_i2c_dev {
 	struct device *dev;
--
2.54.0

