Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F047361DD5
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 06:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675508; cv=none; b=HmfPYDBcRYQbnNn/6+zg4psAQzaS2vC2FhqAb6INaOc3aRtm4ukaIIUY/a+nVwMdmFXeIrATambvxTV5ztdLz2uKTnffGvFNUk0SxUFuz/LllrDrWSN6cHlEBUXULnUpZHJBFtkvbRXUeGQEUJzsEtNJaJgBXiG5MZXOSMIGEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675508; c=relaxed/simple;
	bh=wQGtAlE1eynbFj/BV0uC5lWh+rlGyN0+AtVzgyTUZpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDG38OmNx4Vy+hig8NcOZpWYWbXbefEAS+4Z113EaO+HdehKws5a3AiCaUI+KH3m+4emAOPLEPUb8hXO3cke4bAe5OHPNAyzXykp0/2YaRBMErDv5IAn+nzGwIOSr/FYVnP9TGSKMWKh5nwoWrRp/UvUImD1Ge+cSVEWgGt80mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcPPml0M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcPPml0M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d032846c95so25769415ad.1
        for <imx@lists.linux.dev>; Sat, 05 Sep 2026 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675506; x=1789280306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=RcPPml0MBihPUf8YxHowMojofFxjwfyrwUM5ozpOgDO1RQrcie64yMSnU0SLn0cHDt
         VkHP43yX4TF2Gr/DPZYSDHz/Y87crWe1JjAQQzHvhYsCMpCbLxcTFPQVhJTsa2alcaFs
         ojpqmMI6k66KZyuxY/r129wvM68rmJsYn3/VF9enPupvSr2+KSZ20hNOhyWzgsq61kUm
         RsJu57OuOOg9SAi+dFpIYYw0Az2OaWQGIanEa/06CsoItm9hwf2jLu0kxKj0V7+BECY1
         KDOx+mhgdI3qHwoHAXiilupdglw1sm370iNldB+wrug9bbRVDhkSc91Y25hWc+gov66x
         +F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675506; x=1789280306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=Xzf/jd3Va83X4Tgd/OKIDMCGzl/0v1DFzbmznSXpC6c23Xf9cOYyO8lwH4Y/t4fO1a
         k9QQ9UIJ515cpnw15swZxcZ5F6v0ZA1SNNIX7WhW3vOpB8XBUFCaTFZIwugbQVvnnRxx
         sndGEoTUHiKmj5ocMHMZufjPdplqWGU8z5UPQ5VfHvUpqsoMKnSaLM3u0XND3z0fyLmK
         RkPE2KJWo52xCCq0Eu78Knd9XaipIZySAZvIuYFZGzD+4IDyNQzbFaO2b37RiOnXMoLD
         HVVOPqVBkWqVy4iQ6ElnjKuoaH+no+TSoGkfqdRnBXuyf4wQzhmnJzI6VCNE/EaPzF/v
         cjbA==
X-Forwarded-Encrypted: i=1; AKwUvBxukh/+R1VF5IBop+8N2fE8ZRA6RxOprNeL8Pkv1jXX39tEVrIkmd50JGLiqUAzjlG1qtk=@lists.linux.dev
X-Gm-Message-State: AFuF++llGLKYgd3oI2WfZ2NG9xnGz1J8JjDhkaDDHODaCKl4oLfD4+J7
	xX6bfEkFYUMFiTQayGFuR92Sz1gb+aO0woGm6U7z3vs83fm+fbHRA02R
X-Gm-Gg: AYBFou1/VWd9wrPYiLmWYDKnZtfuewG7TYQT9Uy5zXb3ABMULxwqF+WZU+CnzSw7DbA
	U1rIIfbi4Yzp7uRE6zn7lhmSl4W31w4wCzKA5kt43ksiU/hTaVZA5dBOisxEAMJQENl0G7Eojk0
	tdtULPkNLFI2caFzv+JPGjFpfY/6dyumWyHykwn+ekDerFo0eYgmCLMJn0PkW6SOuPxovHw62Kf
	a7KLUhkQe3P2DDpw0vuxD0dQ/0GHSEEc1pnmquI0F7QKeNn657uxpCsj498nxoB2pbhvB9pkTmE
	LSAE9t3hZPXFL9QgCAQj2p2FxTogQyvRqzsDU7SVHh7YJS9uJCwNt70gBB+bb9WltKvgy78HqoG
	c/WuIJuDLXvlMeDrVlUOetGcNU8hdL3Zvh+aIxNhRDKJ/7Y23le5M8dXd3xXZ5nRXXrEIzWXMsn
	eOmxhw3g87yY5G4whe0akV1QyETB3PpC5hvKEE0qIvnd4Z38CltDsa6XvJuV0=
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr22181806a91.21.1788675506361;
        Sat, 05 Sep 2026 23:18:26 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:25 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 1/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:50 +0530
Message-ID: <20260906061755.5103-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug() and dev_err(). The %pe format specifier prints a symbolic
error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled,
otherwise it falls back gracefully and prints the raw integer value.
This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c  | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_rapl_tpmi.c
index 73f36d9c09b1..6baaad3c59ef 100644
--- a/drivers/powercap/intel_rapl_tpmi.c
+++ b/drivers/powercap/intel_rapl_tpmi.c
@@ -408,8 +408,8 @@ static int intel_rapl_tpmi_probe(struct auxiliary_device *auxdev,
 
 	trp->rp = rapl_add_package(info->package_id, &trp->priv, false);
 	if (IS_ERR(trp->rp)) {
-		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %ld\n",
-			info->package_id, PTR_ERR(trp->rp));
+		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %pe\n",
+			info->package_id, trp->rp);
 		ret = PTR_ERR(trp->rp);
 		goto err;
 	}
-- 
2.43.0

