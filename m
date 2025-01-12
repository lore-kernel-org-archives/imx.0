Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4B1B87D0
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689157; cv=none; b=k1Pex5S8pYAokQAx1CU8hvrbzOPwNYX5N/KO7q9pirfVbOLvzIxwyp/i5KJzp0vF4+HCEwPn0oNCZ/FwEIgPo/UlvqBtfAy6E9DFsSlSEIBisOOVCi4prPbbGZddwr1ICUc833yXndbV0KiY4ppHMFdsarRrJ3qv8gvKJzM0Tvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689157; c=relaxed/simple;
	bh=xwSxcTgpz0V5yXRtTiY4r8e2MzVXviCXnTPUR+OLILk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DU3yXdADSJCzxlEO9ocTUiwuWsjYClufEPi5K5vLKt3PfFFHdtYnlNu9QpUpUCB4SJnOfHAhAKZ8A2/t1+2O8mxZqLqmf8ZUsveJNjgKhWXcTiwM5206nodGbGDmUdtkwg3hcEHMhyufvafVGzJdtjfO+AaJ/TWkyMzJSucUggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuGKhTPl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuGKhTPl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43658c452f5so2950985e9.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689154; x=1737293954; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=CuGKhTPlQn02GpTBTwTLjIjQWPVkdSeHKCYmGoU7HiHrekqFM4MsXCjGOjGdM5ZkCb
         oPCsB3Dx1euOcnLh1XhpyZi/QxgLoLE67tPe1KIdqBXU4W9717Yb7KXbxJtkkl4vbY6D
         BVgWAyaTcYbzw6IK/Zf8yWy+sFpbrUJavTzIi1bPcm15s0xjgd8wkqbWjTRDOTRHKDwk
         wURTiAOEoUAGbRS2s1wsQRBcKWuYiu4yu0YU/r/q1X5+L9HLkui+2utoDiv2uL31JQKG
         dftWUZXAPHXnu0kVihCMzp6AsJ+9y8UEMTp3C5q8YYnUfCSMXVMfBn+wQvHUnPyebEan
         RZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689154; x=1737293954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE2H5VemRTsToLsccovLxNOaroqPN7uFot+UTGgYNy8=;
        b=kgeC8hjKjm5JwDtRgFWAZkLCKrskZAtuqYQfEYD0RABhPdZuEBCek368J/MvZAlS0v
         XnwCPdo4mnk7NON+ZxbQzz6aAsMB3elhGLUGPo+a5b7wXGzFeQhbf6gAYZjxGRXajt+s
         WmE9rJI8DfMi0b6TXMXdU6T4ajME56D/WNYx7KorpmIYQRZXKkmZILbrLVnHUUAR9MPb
         aODOUfpPV0HBzIStHqQzY7Tp6iEza9sxH/0BPz5mMF85HSptuL3rACBEMWp/CYtVxZiF
         bq0IbwgaoebeY5fIHsVew78Thz0TOo95dQWYg9nwbGJLI9nKiulnUaM2w2JTtd/VZRDa
         2/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX9LVz1ZUj9HeaX/zLUm6rYHEwsOZG+dHntweuWJxxmbycjTlLPZPAv+YssGrNoy1sVPMg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxHs4N9k7IwetIozI23cFjAkqsTj6v0pxBfrmyZHegsHmV08r6
	sJTd5b6sqqfCKcvLZVMqI+sBNH9HZMfYxaUYsmUX1TaN4G6Z72MK1dSdG3cQESc=
X-Gm-Gg: ASbGncv12lVIOLbCygLB9oy8O1kuWq+tqwizzFBF8aALifYnXemuyPRjI4C1pgjegPv
	L2nx1VznFn3IoZwRXrPLRmX7dfmgRFnMtXfFvHMtbs4MeOxv1RlbyoYWojQW5/jAE1ritKGf7kY
	Aj+SRv/oKDF+OELvpCUIqJxrth2Ftt6oYveVCJOGk4fBYVPkA3YCY5T1tFatGUueZzw9A7o2STU
	SKV8iSW3mwnot0Rub0ENwvcK4y6282Nm1WVH2i073/7nmzHSpLGxVKW3St8+eRyj6iDvy3s
X-Google-Smtp-Source: AGHT+IHa/wlOBb5BLOSfZHKhJOKZ66IHreWI0aFAGTr50Xgpw10Wi7ykrB23Ux8LPFxNTSCfVkbaWg==
X-Received: by 2002:a05:6000:18a3:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38a872d2e1cmr6158761f8f.1.1736689153919;
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:39:03 +0100
Subject: [PATCH 2/2] PCI: dwc: layerscape: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-pci-v1-2-fcb6ebcc0afc@linaro.org>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xwSxcTgpz0V5yXRtTiY4r8e2MzVXviCXnTPUR+OLILk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X583ThdqsNd+ai1Rg32YXT0CpzKBfUsuy7+
 rVM3hECbbqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF+QAKCRDBN2bmhouD
 1xFpD/wLpb8jbZTwROWh7xkacIWp36gfWl8++ftg72bpoJgL1J+cC+JgxcgMYugfFbWP6qRzmUx
 hiaUj96QLiicIo1r1hgKftiuvegGo9HdhvbMVhE+7l0G8O+LtC2e4p0oP2C/UkKFmQ9n3Cv370d
 6Lf7OMg8A5s9Ngoiz4e3Hm3GwAKIYBAbNLTu67FEYwqKABIVtqF17ylKCD2OkbLU3qq4Rci6t0S
 dTgPPWNFq2k2SD6nItw9XUmSythajF3r6e0Bpc4IMb1TnFaijuSvzkZwlMtXrmLUbz2flgLH1TS
 BuhYMNBhpDDaHyMdyrPv/dbwZsgzISRIXyIRttdR8cvTv0tDDnz0bS7tvqnBWHztTjLpA4wSgwQ
 SOokV7tpa4D4XdhoZ9w54GbaKwYvx57guoSBJxmoWaXmDxvejiAcONb6YZ9fM8KpVAdYlemsd0i
 Z5wMMCkDbNUJskVmpA290eOz6cLRUTCSl/Pq7YGLvDsjORqWvs+EsZ2VefmLQ+wIpM046++/UNV
 jzql0Rvpd0glIlC8i6MKRTFuJnxF+HjqVO5LlsMPSnug5oHwkIEUJHaMzlf/Q/ErJsZpR5Scfk7
 QIFMUrZkwPpRWIfXEM7fI2hgVP+OUrs/xnyDNgq9ltdcqBcWM5vMFkxa0yY/aaiuicwh0kiS5Sd
 wYC2d0drGiCb1FA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index ee6f5256813374bdf656bef4f9b96e1b8760d1b5..239a05b36e8e6291b195f1253289af79f4a86d36 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -329,7 +329,6 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
 	u32 index[2];
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -355,16 +354,15 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->scfg_support) {
-		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		pcie->scfg =
+			syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							     "fsl,pcie-scfg", 2,
+							     index);
 		if (IS_ERR(pcie->scfg)) {
 			dev_err(dev, "No syscfg phandle specified\n");
 			return PTR_ERR(pcie->scfg);
 		}
 
-		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
-		if (ret)
-			return ret;
-
 		pcie->index = index[1];
 	}
 

-- 
2.43.0

