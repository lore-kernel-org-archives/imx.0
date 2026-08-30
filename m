Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571693B42CB
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105766; cv=none; b=pPMlCGyAnIknEhFHwa0K9tGnLmfN9O8utJyIIZQB6XsYhV3r3OaqVyola6TS8MHd1n0NU+CSQ/Xs1+LVakYHfbFIyEPwW/Kt0Ue1f+entNb1OSA+b7aZbbiycicqqGI/TDdh7ELNOCnCzvlV85sU3PXU95kAr1htNiyqVxbo1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105766; c=relaxed/simple;
	bh=izFkUJVrZGWtWRP+0Tn/5mmA4bhWogEsegWu0OodXqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qy8o0UP5n/2OdM4y5y4m6ImT7rsXXV8Kt49aQdDVSaoGgv5q4Op6YB5rtskjL17XfkG656u9dmA+HCiJYDy7chJa2dZLON+itG4K2/v4Pugwhc8BaX26fwpqJHLqQ8xjd2KlvedOVrz+up3taZU3+tQTIeMR7JKkqbMxMTtkHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj3X40RC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj3X40RC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84830c774a0so2896505b3a.1
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105765; x=1788710565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=Bj3X40RCN4ggbbm/kTdMbu5kc5siBOERRpoI/Ndc9yPNnhiCw9JdthaBz0T1QT+KfY
         Pv65/rBLdgRubvEC2H0HvX9RTzZKb49jjuxWFfKTxybX2rF32bin9u5Os5ZM+jQNSoUK
         9RWR2aB4DZ+wTQaGRf4SqNQOBGXiyc2n86+Y2abDNIS8QIXAjjerzNy1jduXYXyPOCOd
         l5qU5VNNM7ywLitw2diyrTeRadt1uu/AZUaylglBN9m2FUjE0rOb6Llvgbl53WC6lGdb
         R/NDOpBGpjnBEjty1RZETcWbvXf+DLUA3nLzo/439VBo31QuldMRP7GhIsbdNbdko6al
         SxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105765; x=1788710565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=BCzVZ1LzMX+Lz+CJ10MhgVXn+NpSi9XMt7IjbzExbx7zc8QRtrRpP8aINUxKNqd6kq
         x7U212GQbJikkSoMOzn73HMQ1/FabHtPB9fZQd2cEQ+HK4mK8DaQV+sqSnzPeQR9Eumx
         kAWjqJDQ2Cf82kpZ8ynsIV/CUvJ+StIA4RUR3DPTkaoCbPBBnpY9qA9cuqOq1Q10r56G
         Fa9cp1ZEr1kadQYHRjY1WU5n311IDq0vfha2d0QzVw1ertpEjGq5xXaiNkhLYy9FBEAy
         KOeV9SfpNxbzrC+9PvGoHi1VAf4jBpC+ifkC0KrR30JpfaFta5QE18mYKZpY2wjGbhch
         Bdiw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj7YENz6EpMSYSNka4xaTuDHOzT+exg4cmVJj/rdATD3A1kwacXx/Lnqnb9FiNHhMcmGA=@lists.linux.dev
X-Gm-Message-State: AFuF++nJc4J3O7tqvxGRZ1V2PwsF6j8z1r0VYcDQyfgrjG7UqQJrb4GN
	Wwb3xzlrz0TAv81gEO2xjUavlmcJ7qwsobuwiDdwfI1pc2LnFLgj0ei8
X-Gm-Gg: AR+sD1342zAuVdV5mFJwKzUNJxsrZuC/T2YmQkIKow2r/IjBOwekLPYmXyloH/VwnXT
	bDCFprqcDS6wl3lVQ+NW2jP3fLi+iMjn+QMvoNVluHI56/FcxRgX78lroeMTY+TWyyo1JGE34gA
	jvn97oJsWWYD2yQDTKUubAXKJk+2XMAyoVCUSDu0sVv3zE7mEZ4MZYzfAVbkwWsHqBKHtvMu6nz
	4KiAICztc8SvXvmQfFWZQd4Vs2qojzlUmMTTpyUGDZqxIQDtZpoxZOpdndct/+91vThzU4h94/s
	sGbjoNv1TD5JWjqrXUuZ0UFzUBH/2FlLqdDrgWKKv9HNA8K7na8zNmVddCKvsFPaw+NV3M0m9bV
	DgiHQ4wSUl/GSqgkEabedllFJJHC7HfDMvZPuOBR76LCxm4HqQZyDTuzzc3ljgEFVv2r3Pzob6I
	uhFe8DU4Zjg4SLyFgZRizcAHqOpL1PZPBzn4SohcUBjtO5lc8m4iQ+O9DfrmLrF+KrhzmjCt6TY
	Q1yFTNe6f7QKeYir2umT2Y6tZHKdq/+JbOvvu/orf+Sbz0r/Gi+
X-Received: by 2002:a05:6a20:4322:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d3af85fc5bmr16153694637.26.1788105764564;
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Mon, 31 Aug 2026 00:00:21 +0800
Message-ID: <20260830160025.211384-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.55.0

