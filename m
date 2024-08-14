Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DFB1B013E
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631772; cv=none; b=p0Fb3tmcNVZ6PC0ATtKYTQXevZiiaCba4w4yPcsjLVMk5fmjXVKLmjiVfvENIVTD5SBZ8ptXjEMbTrT7Flf26otOsr8e12+NEIWE3wRVOGWr1/XvKWBlg+DGr3dusWCN9/aM+Ar3BDf1DLCe2ooiHG5PePdyOgYG3mh9ztK7WOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631772; c=relaxed/simple;
	bh=cvPFMMR9o434sytT/dR1qucAAqA0mR0xlD7ZHF+DVrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grL/tHGcciZ16PAjrGmwgogIPKe7cB4OY+98vKk4lkVS4ixG6dVv0rX4aKCzdjT3Ev2wRh7IgBL15BNeQKQrdZZ0VmFh97nsz8zEs0zfYK3Kg2d65+5IgsbJbDv3BzPa29rxcMLlla3nfhoGgc7u5/WDaNK6YtZNJ33QluXyG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndOdYUEi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndOdYUEi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso45053735e9.1
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631769; x=1724236569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdA2lN2q6veoMIbM5LLb1wXxxOsZ4MbHN1OFqGaeSQ8=;
        b=ndOdYUEiT5k3QEFhAaNPcALr0c7zRty0o5wQ6jC2Z7pnp29FQ6CXMVsHCiitLyWwJs
         XEmF5oz5sGo6f4K60/V8by4erewOc9KXEKS7FmBv/OqG6Z/mLAQLy+tyoRVh/DgeGt4o
         xY9WzfECAjpP3lrFNNKqUSAgwVzT2hiJ+X5BG8DLxogRgRlT+buunEyjgQnDIvFOKqTN
         uC/SFshI43vmWQpnrGxA9jSCpUcPTRiPz+8IRqGM+3tJwvU+IiFl5xdLId2oVYlJVSl3
         L0Gu4hLJD/u4Rir8wQkFE16rZu56PfgoxsJkkGjOvkX8Y/xS988XXuU08zQ3wheN/6Cr
         6RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631769; x=1724236569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdA2lN2q6veoMIbM5LLb1wXxxOsZ4MbHN1OFqGaeSQ8=;
        b=PjrcDYBnd583SUgreDdPyk45MxHqO4eAj0SJJomjQKyAYdYNltCi6EIrpZelslfm2g
         vOvGOzH9IhUAwfjjP3xMKusIxZNgxxGVNtJxydWk0M8YUk9l66h5t/QwyLon5RJA3nKM
         kHjcVe9kq07OWiI0xXirpFMlXX7dAZGCliLL32+A6kjk8IZ4aWomQhdGcAO9P/8o/CKE
         Z/IGBznASM1dyACAK+WGv+/7MHUWamfqmIlpyfBTU6FpoySmZKKgfLgcNSMLQlxKlaHm
         33+IC1lXU6gPfAw+M04doX+ZLlttO2GwkeBDzl+SmKgIVEf9jbXa3ZNtjGdpTYYI06N+
         36Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVMfZe73vDl9at3/2FjWNubXWHfUoaATm+QpkpOgMyaZtd+a9ur+oMHxoxAih1kmZQVKxWAXx/Yv78RydcB12+N1rxu
X-Gm-Message-State: AOJu0YzrOCqraqCsLcCnlRirSTXVp7yZwxegQMOZhK9C0diHIuT3Jo1w
	gsWJIHdi9z6/MMR9yKUcCHlQlYRF4/zQv03m3QM4M87dgnLR+ZnAy2MhmLGDjzk=
X-Google-Smtp-Source: AGHT+IFE7qRnDKvcYh/oUsXuqZL/PoY1UtTYsAQZ/ZIKOt+fK4aWCLBS7UFZjbC1sOwdQ9LTP2J2gw==
X-Received: by 2002:a05:600c:450a:b0:426:62a0:eb6b with SMTP id 5b1f17b1804b1-429dd2364e9mr20506945e9.13.1723631769418;
        Wed, 14 Aug 2024 03:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:43 +0200
Subject: [PATCH 07/11] usb: dwc3: qcom: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-7-95481b9682bc@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cvPFMMR9o434sytT/dR1qucAAqA0mR0xlD7ZHF+DVrs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiFOSGYZ3MyWgBlmp4elS2FxVZLfoOlKKVXf
 nEc7sNj/76JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIhQAKCRDBN2bmhouD
 12HdD/0SbhZgsdPxESEXiWrmD2MmSlZYaHIFK04QnmtTGzG7t0Jh9HWfChuRvbauueqiX+o/xmb
 1xkdBCsIc82mGS/7fxIw7wVpbHa7v1f9VHg4JI015V6ZIXRjyn1XB10nbWe8VVRC1mgwmyG7jth
 kS5I5vmPYOjF0aOtGMcRiRm+1S2jGaY/gKkY+A7n0/SmuIODqDGlYeL/923e4abPDAwVOKvtrrD
 AIHf3MWiqqurK+VEKKKsumGSousFEwSvqNnyZd31PsWq+a1bsnJjlJMCNCJQAnVeGzfaMqOloRK
 o5uxNYmc7M319TY3v2/4NO0NgBBgqt8qD2gYIwXE/w4Su9w9vJ9RAFcsARvZ0aznTWdHfOvbD6T
 OOD48G5lh3b6UYDC4+tMcKkGZxVabxXS4REYNSfgNJNTTZ2Q3odosHwb+Y2dUzvjb+uk54Er/Q+
 3Q8hCccVDKI6cy4edmZqEeYtjGolF+krVLeSsHLWo2U6fjRi6IP2DbAYjTKwhPYoxEQBCyFIeIO
 G4hLCP9N6ofmZJ4jjLssM25rSsHQpYICn06Wcu56RK4E1EA3ro4j06nqmKErn0sKnFCaoFD9Lk4
 CLBigpsWJC2CT/8OdwgPOptlM/IYzBsEntE1q+WQPA66K6AMI8NUjL9w0I4H1bS0Sfl9siH2n9m
 eMa8s7NeLt86+RA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 88fb6706a18d..03a8f080078e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -4,6 +4,7 @@
  * Inspired by dwc3-of-simple.c
  */
 
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clk.h>
@@ -702,11 +703,12 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
-	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
+	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
 
-	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
+	struct device_node *dwc3_np __free(device_node) = of_get_compatible_child(np,
+										  "snps,dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		return -ENODEV;
@@ -715,7 +717,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		goto node_put;
+		return ret;
 	}
 
 	qcom->dwc3 = of_find_device_by_node(dwc3_np);
@@ -725,9 +727,6 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		of_platform_depopulate(dev);
 	}
 
-node_put:
-	of_node_put(dwc3_np);
-
 	return ret;
 }
 

-- 
2.43.0

