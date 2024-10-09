Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66CF188008
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479845; cv=none; b=jagBptFHpCTst3ewdHjSzgZDxIadqRA8ZG0Bw85eINx4WnaqPsjqhwoSd6N5v9xhhXttS3v3sYcxnvTnN/TyJ9ai488IXoR0xdcQU//R5ZkaOuDL6ba2MpKie1k2scd3WQW4NVUZvj9zUgVY+0yfiLF7X2b6kKvooTpDOvMgUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479845; c=relaxed/simple;
	bh=QP43FfA7My8gahNc45sWo1rrjbkokkUW9GQV39ezDRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIX4kcyA+Or/xULR9Xvy6WO46nr1url00T2e3aoGAUes6GVWEohIKf3u7roWRWFskQo6UnaDk2Hf4djKYiZpuLkLKkYaX2pxhEpBhQ3oTJJ/GVKr28nhnsdDz1Yz0FhqaUEd0JuHzRRurAu2mRwn0UZ+DYdfGrtjZJ/A613p26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG0CnfqM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG0CnfqM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so9329347e87.0
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728479842; x=1729084642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aPVZqKoHAIyYW4ZUYe5ZVOvVWla1BASLvw4osJ0NuE=;
        b=GG0CnfqMfDACEqF/VWY7+K5Bwfb9bzwqPIUgCsJTmHqvOqUxi34mGYqIxIDpd47RMb
         pkD64OifYL6cZiO0ZOQkf3a7k4gvueUc12QvPCT8x0IOv06WnlPOLEQqbhPutokAJDdD
         2KuvZmNp6heu5KnySOwy9w7UgxcQwER3Aio3OuRiP7LplH3czBDhGx+qB1gJ0QH7DptR
         Sgk7X4pM9vTBpTIRqceFKCuO2fCgJI55X1qjubobw5PfyriB8vLDxHDeVtFg08gQsr7V
         I9OkKijziiSWZsW7wZlOeSthq1x/4yrmW9ytZwv3hacSC2l99jO9KVc6TF2cgbhLdaX3
         YoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728479842; x=1729084642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPVZqKoHAIyYW4ZUYe5ZVOvVWla1BASLvw4osJ0NuE=;
        b=fnVhhqHkqA20bM5ngR0b37UC2wWPT19nasjW3eqY1tcwWtCAe5ZGj4wEe7QyssrgB+
         RilPJ17aSVf9mTZ2bevbzsf4mcZ32c7SYsYHfdESFBganPbAxhUS+un1tpxhhKk/6lU3
         psLvCTz5vlEqJvzJo0lNVwNSSV8KvdZoKHrMQ2KCNIJP6HjnLlO2+KbsqEwtd6biNcpS
         tWIxTegaqRXbrhol5NvQKKZSWgQlYvvSXjwNJrFYJjMa3PuaTZiHAQuJcKLdqnBjdiOx
         LjdpTkdYAEI+o5Y0KmrjbG+Bav3TJwXQtW5F+P4r6kXTDX4fJCb2R7ur1v0Se89xi7aq
         EVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp26zbLCg6dO3M40JZ3QuJIdLa73c5+2XtsQKeFez1nZGPJTfYbvETR8L2Kf4sTuZHavM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHEWCym+0FDRKK6II8eC5Rm8becxJL3IdERjhNTqeqF/U4Gh1p
	NToQh7PtPEdmtWN0YXKLNmD/oImxX/VKqmr64UDuGeXySXk/S18V
X-Google-Smtp-Source: AGHT+IFi8gXrgp3qSEUKJjN3obp7dTqaJsNxBSiC83wyzLDBc3Lx9ddW7vTT5a689gPE43Ak6IZ6ew==
X-Received: by 2002:a05:6512:31cf:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-539c48c35d7mr1710763e87.13.1728479841617;
        Wed, 09 Oct 2024 06:17:21 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d59b2c35sm20189955e9.37.2024.10.09.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 06:17:21 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.li@nxp.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2] PCI: imx6: Add suspend/resume support for i.MX6QDL
Date: Wed,  9 Oct 2024 15:14:05 +0200
Message-ID: <20241009131659.29616-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The suspend/resume support is broken on the i.MX6QDL platform. This
patch resets the link upon resuming to recover functionality. It shares
most of the sequences with other i.MX devices but does not touch the
critical registers, which might break PCIe. This patch addresses the
same issue as the following downstream commit:
https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
In comparison this patch will also reset the device if possible. Without
this patch suspend/resume will not work if a PCIe device is connected.
The kernel will hang on resume and print an error:
ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
8<--- cut here ---
Unhandled fault: imprecise external abort (0x1406) at 0x0106f944

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
v1 -> v2: Share most code with other i.MX platforms and set suspend
	  support flag for i.MX6QDL. Version 1 can be found here:
	  https://lore.kernel.org/all/20240819090428.17349-1-eichest@gmail.com/

 drivers/pci/controller/dwc/pci-imx6.c | 44 +++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 808d1f1054173..f33bef0aa1071 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1238,8 +1238,23 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 
 	imx_pcie_msi_save_restore(imx_pcie, true);
 	imx_pcie_pm_turnoff(imx_pcie);
-	imx_pcie_stop_link(imx_pcie->pci);
-	imx_pcie_host_exit(pp);
+	/*
+	 * Do not turn off the PCIe controller because of ERR003756, ERR004490, ERR005188,
+	 * they all document issues with LLTSSM and the PCIe controller which
+	 * does not come out of reset properly. Therefore, try to keep the controller enabled
+	 * and only reset the link. However, the reference clock still needs to be turned off,
+	 * else the controller will freeze on resume.
+	 */
+	if (imx_pcie->drvdata->variant == IMX6Q) {
+		/* Reset the PCIe device */
+		gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 1);
+
+		if (imx_pcie->drvdata->enable_ref_clk)
+			imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
+	} else {
+		imx_pcie_stop_link(imx_pcie->pci);
+		imx_pcie_host_exit(pp);
+	}
 
 	return 0;
 }
@@ -1253,6 +1268,28 @@ static int imx_pcie_resume_noirq(struct device *dev)
 	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
 		return 0;
 
+	/*
+	 * Even though the i.MX6Q does not support proper suspend/resume, we
+	 * need to reset the link after resume or the memory mapped PCIe I/O
+	 * space will be inaccessible. This will cause the system to freeze.
+	 */
+	if (imx_pcie->drvdata->variant == IMX6Q) {
+		if (imx_pcie->drvdata->enable_ref_clk)
+			imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
+
+		imx_pcie_deassert_core_reset(imx_pcie);
+
+		/*
+		 * Setup the root complex again and enable msi. Without this PCIe will
+		 * not work in msi mode and drivers will crash if they try to access
+		 * the device memory area
+		 */
+		dw_pcie_setup_rc(&imx_pcie->pci->pp);
+		imx_pcie_msi_save_restore(imx_pcie, false);
+
+		return 0;
+	}
+
 	ret = imx_pcie_host_init(pp);
 	if (ret)
 		return ret;
@@ -1485,7 +1522,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
 		.variant = IMX6Q,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
+			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.clk_names = imx6q_clks,
-- 
2.43.0

