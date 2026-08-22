Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5A23393C
	for <imx@lists.linux.dev>; Sat, 22 Aug 2026 01:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787361745; cv=none; b=mkpOEglvIynOBZXoEk+gSUww2yrrmpnO3eLUjq1O536jnrwbxiz1irwktURSU/Jmk/R75jGhWHiPf1diVK/xliLQIIRKQUeUN9vcyfThW6Xi6tV6Av7epwIGV17g0IPWR9EJdXYQTLC9nqh/S4vp8RpN2X+umm0ldjxdet8AaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787361745; c=relaxed/simple;
	bh=AURKOmGEjz8Y2p/odOo8yUCzmm57mPtXY6UFzZRhmi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1LI8PCbuxBkUKZeeGendZm65aTO9ti8KAQ0LQblny3Yu+dVgCdJwJdPtv67QnbDOB4+Z9BLW+q3i2/3kbnFwg6hoOM4Y4xeTo8xmM551elddIty0h3lLTY43yaLuG5kkkA2vNtINDo6U/mVYvH0Rs20L8dbP8hdKBUWxqvPYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQoi+8We; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQoi+8We"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1201638a12.2
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 18:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787361743; x=1787966543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNcfeMEYwNlJBKitvYBP+hWuT3fX1KTsmGqaiTl4+vY=;
        b=HQoi+8WefMKV6fQgLJ8z9NciGr7jIiF7A5sjA5pKNqhQw047XKt+bbAnYL2Qv1MoPG
         xYkPBeq4PRxaPsQfvgq3YuIJrlEOJGc1PEdENDEorRr9sLV956Gn+yp5ic6VCc9G1xOP
         PBQ0WGnUdmvoHu442FrLwNCWQtohnokJCsqgJK8rxnceNaAVNLkxO9emKWiuji4enVKR
         oFrXyxBqveEYWwYOCbIJSwXmO8LH0jbDbu6QbtJMr4i2lCdOotqiyC2D2qdVoDnUZt7y
         5gkPaEUwBPjogHlBbH/pLvTVdjqKdvGJxdVxiNleMjMB7UCMEn8RYBeZtcIdiYrg2fFt
         RQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787361743; x=1787966543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNcfeMEYwNlJBKitvYBP+hWuT3fX1KTsmGqaiTl4+vY=;
        b=ghj4wTletw2v4TlVqUr0omQdK5j7jO6U5nVbN5aem8GkgTIx+Sy7VCxyWPd7zTfqwI
         s3qyvUgd7juVHi23Pb6hN/q5C0FMmI0KzEPpze9ICosBuT0kESeh67q+NsBeX8KQLtRo
         1rai9uVD7alCbw2lJTkN2gv944t8p5Lkh/kTgVRqun+pyB7ve6GDqgmhCbvbJrW5pl/v
         sv47i/dyMc3WQ7BC4C1JcLXTyGlPkK9DrIJ55T0MG6lkVD40IZdr+PkBem+5HCrrjnJK
         SsHOHrfud8DOCgdncIFro7cXcKDzR49eW+bHg1zj/vtIQAteXZOOkBKEhTbLD5QyPtdQ
         XcdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpneW4SBSlp0Mw4mtJ7p2dYsX/x87dQ/7xL5esH4jjxgyYjTZmgqzVw0obVin0GA9tXQAk=@lists.linux.dev
X-Gm-Message-State: AFuF++ntxSIs0YXzwZFNgg4uzG1LifZPCVZDk9p0kAlFvrB0YbLnKUYx
	QqdQvYDROLT7mP/gSOmY50PpaBpiqrOek4fU6sYipORXqanvAJar/CGS
X-Gm-Gg: AR+sD12pLOHf7rRA7FaOpbeoby8nrVr8D0642SzhtXczcUv9GYc1aK56Fn58rHnjzgV
	zcH73IcgXoh/meqjSD7noOCikpfyemN8rlakqTVRkQM7ZYbYz1GYqqz5CwGGFyVsZx6mqIg1KHI
	sc/ps740e2LvZJ3tPiWJ3S9KvmE757hjGct7eBV2g3oUS0Rji3uQOtlLdhRanbIPOxX7FsMN2vN
	f1o6Cliy6gC17Xrl4K9bemmBzkZqrXrvlaMqFg1dphSKof6OokLAE1/mvdQDX93qqeFF71TAAFx
	SX0QauuX+ZPwvlrwwCx6AClMakv4/pbyI5MEqbFo3k/DxuPImqc2ZZ4ZaoFP2upaQNpHLxckVsM
	fpf1QRVbwt8fJUEq9+kpEb5bd3vUCjSQynglnKJ6w1IZNyKEH0/Au9Y1sSbvRZmcasQJkePMD/8
	G5jqSlP/E2uRyckZN+CDF5fYpPyJOYD+zPaFlEj+UTw2oRho9mossWa8NrRezPK2CqTkOa1hBjV
	1zCf3QV3gnWNrH6A8faja6W9P25KuQyuLXP3FHVoMjsRjElFPJwhXCzjTri43I=
X-Received: by 2002:a05:6a00:1407:b0:851:8394:1696 with SMTP id d2e1a72fcca58-8520ba16a9bmr3668474b3a.12.1787361743351;
        Fri, 21 Aug 2026 18:22:23 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b243sm144370b3a.31.2026.08.21.18.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 18:22:23 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] PCI: imx6: fix pwrctrl device leak on PM runtime setup failure
Date: Sat, 22 Aug 2026 09:22:05 +0800
Message-ID: <20260822012205.2459806-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In imx_pcie_probe(), after pci_pwrctrl_create_devices() creates the
pwrctrl devices, the error paths for imx_add_pcie_ep() and
dw_pcie_host_init() both jump to err_pwrctrl_destroy to tear them down.
However, the error path for devm_pm_runtime_set_active_enabled() returns
directly, leaking the pwrctrl devices.

Jump to err_pwrctrl_destroy instead so the pwrctrl devices are cleaned
up on this error path too.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..616c42932 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1975,7 +1975,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
-- 
2.43.0

