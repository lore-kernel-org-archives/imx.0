Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8F1E9B38
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355225; cv=none; b=qQZ/lOcUbPsPdkTQ8zdS3T5s1KY8YDOph+hiX0sbS3w7mbTXRH36KHUac0r4zLT2BCqJwHfLA0HhJT8b6fijvvssvN6VrXK/h15WMikzG9LpJQmg/CY2c+Eh1BhtIWM9ecU58Z1FE5NOHwx4zarF4rTgYj99kjoIVGHZQ8rOC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355225; c=relaxed/simple;
	bh=e5Off40XHFoCO/BOw8hIt3VBxArBQ9+c579hYcqw91M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XGXepQllxHqHUpV29RIaTlAs1frxMQHKGkU5FHtJegJAuf4hSLYLrI/n2jeXJvRjwbyf25z8E6MZbXuarkFJIiOKU2s1Mj52g5CFhven5w4upYLddx1FAMfDgQHwfKhJP3l2CW+U7HQNfp9tbeS0KYApwOmdOOvlr9GVnctChEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3fG2ip7; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3fG2ip7"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4768f90bf36so15141651cf.0
        for <imx@lists.linux.dev>; Fri, 11 Apr 2025 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355222; x=1744960022; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuEiiuDbtuItZWmpzYJ6Hp9H23sHGSswKm1wezRu+84=;
        b=i3fG2ip7II5y8onQGyZjaAnoiJq6DuCACW7iXjwHbpVUjaNll6wiHwvJSlErFcOhT6
         W6JK5t5keAvxT2+EnoFwLdUMBcmO37/GOrBJRbWJxmYJmfMtuPdrZDCAzyqP1canloLb
         ff0Mb2vPEV6kvSm9Dzq2L1KNIlljGgZiiBoIqGQHdWedrqqzG5PhPneNNucjhxBLyU3z
         N9H5JQC4hKBmC/2/QRA3vUNXx86m5zd30TrEC+2/b9WC3p70lnqS8BMvZkkmXqYTYv7L
         vJOO4XKMxqYHmcA/Xc9sF3YE7tvwkp7c9qtFUao6omEYJ/D11m06+eDr0ivXqDrcfuDf
         j5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355222; x=1744960022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuEiiuDbtuItZWmpzYJ6Hp9H23sHGSswKm1wezRu+84=;
        b=Y0D2+W1AC/rfjZt7A9PhVsLOXV67+4phF5aJwKWooxciJaUxsV/ZkK5Q0LmybFjm/j
         L8yebwHWkmWy2fY/Tm+k/rpbBDjWHB/wdFl4Oubh6J4P5MYhGSB3zfqFbpeVFy7sbIyZ
         7ELN6FdIv2Er/u9YP2mhbjABSn9fl2vhXYJgjtqonrMWLNbdmJC8X8F+lV7g33w57rjp
         4X962Ar01Tvj+YFnQ3MkouBvBdAKGOSlgiWCGat3KKzGI/ouAuvdzUykgLK4w8wABwq3
         zUDqPJn+qbzfKYFYoPXikVsE91yItlQm8X2LRW+oDMRUB75hp9j6md6OVzwokIT8E6IO
         Ih6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvCi0u1w+uZd1EEZpCntc3FbZrQXLCAopgfQy6cfQ3Am6b/xEMmiFHWb+LOVBnw0BQLBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhkJRn/nRLPaMKkYTIihiT1mlL7fHBvdv96hVEdicni094dDEe
	hMoMt7ShsWPMaoTzTHiBmMlvz1Tk5ByCXGuRSxJXx2kOivxlntrQ
X-Gm-Gg: ASbGnctLwUooZgQd6/hRKG2XOWmCJUMgD2TKC+M5kPJw0hVhCU6NQxoLeqqZWlfVnOt
	eFA53Xv733X2F9seKvf+2xqQuApdyeVUgQryoUQX6jsOx1dFBwk76hwa/Di9jb8xjVZJEigTpEr
	gWD6dJ9criZJdZ8OBz4oFX4Igz2RoGtSKpilxSGU7ASCvWQQYEVq70z5vAnslx8oL+/FSp+JRr7
	mnxeEFtjOGoRNMPZ3GDcqHoU4fWShKZ63Ue1gvShPw5OSp3AVIayZ5EbIMgIW/Sgz0NDpkHIMQa
	iFXBlLD1H3mpme1HAADF3hmDS3B8cKyC3im/AzJyh6i7a2uLpRE=
X-Google-Smtp-Source: AGHT+IGEFOBHu6HsvrQPL+zpG/VqrkoP9xU7Cgn8q5fgPDXNyPnCad1feQZCkHrTe2gAZJAQoHpBNw==
X-Received: by 2002:ac8:5f95:0:b0:476:5fd5:4de6 with SMTP id d75a77b69052e-479775b92dcmr23015011cf.40.1744355222463;
        Fri, 11 Apr 2025 00:07:02 -0700 (PDT)
Received: from localhost.localdomain ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9bd77sm21694891cf.51.2025.04.11.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:07:02 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Date: Fri, 11 Apr 2025 15:06:41 +0800
Subject: [PATCH v2] spi: fsl-qspi: Optimize fsl_qspi struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-spi-v1-1-8d6dfb1a9262@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIC/+GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3eKCTF2TpBRjo2SL1FQDi2QloMqCotS0zAqwKdFKZUZKsbW1ANP
 5gopZAAAA
X-Change-ID: 20250411-spi-4bd32c8ee08c
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 imx@lists.linux.dev, Kevin Hao <haokexin@gmail.com>
X-Mailer: b4 0.14.2

Reorgize the members of the fsl_qspi struct to:
  - Reduce a hole in the struct.
  - Group members required by each op (e.g., iobase, ahb_addr,
    devtype_data and lock) into the same cacheline.

Before:
struct fsl_qspi {
	[...]

	/* size: 176, cachelines: 3, members: 11 */
	/* sum members: 168, holes: 1, sum holes: 4 */
	/* padding: 4 */
	/* member types with holes: 1, total: 1 */
	/* last cacheline: 48 bytes */
};

after:
struct fsl_qspi {
	void *                     iobase;               /*     0     8 */
	void *                     ahb_addr;             /*     8     8 */
	const struct fsl_qspi_devtype_data  * devtype_data; /*    16     8 */
	struct mutex               lock;                 /*    24    32 */
	struct completion          c;                    /*    56    32 */

	/* XXX last struct has 1 hole */

	/* --- cacheline 1 boundary (64 bytes) was 24 bytes ago --- */
	struct clk *               clk;                  /*    88     8 */
	struct clk *               clk_en;               /*    96     8 */
	struct pm_qos_request      pm_qos_req;           /*   104    48 */
	/* --- cacheline 2 boundary (128 bytes) was 24 bytes ago --- */
	struct device *            dev;                  /*   152     8 */
	int                        selected;             /*   160     4 */
	u32                        memmap_phy;           /*   164     4 */

	/* size: 168, cachelines: 3, members: 11 */
	/* member types with holes: 1, total: 1 */
	/* last cacheline: 40 bytes */
};

Reviewed-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
v2:
  - Fix a typo in subject.
  - Add Reviewed-by from Han Xu.

Background:
This patch was originally created while I was working on a bug in
fsl-qspi [1]. However, we eventually adopted an alternative
implementation [2] to address this issue, leaving this patch dangling
in the patch queue.

While this patch is a minor optimization and may not result in
measurable improvements, it is still harmless and could be beneficial.
Please consider applying it.

[1] https://lore.kernel.org/r/20250321-spi-v1-0-b9939baa64b6@gmail.com
[2] https://lore.kernel.org/r/20250326224152.2147099-1-han.xu@nxp.com
---
 drivers/spi/spi-fsl-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 5c59fddb32c1b9cc030e7abb49484662ec7b382c..8f45d43bc502ac516ffa357f36acc7eece65ae9b 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -264,14 +264,14 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
-	u32 memmap_phy;
-	struct clk *clk, *clk_en;
-	struct device *dev;
-	struct completion c;
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
+	struct completion c;
+	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
+	struct device *dev;
 	int selected;
+	u32 memmap_phy;
 };
 
 static inline int needs_swap_endian(struct fsl_qspi *q)

---
base-commit: 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
change-id: 20250411-spi-4bd32c8ee08c

Best regards,
-- 
Kevin Hao <haokexin@gmail.com>

