Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D0B2222AC
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505515; cv=none; b=BULj/6pvTfnxqoMrHQ1pXUa32CqMHKeoYPb0tsytNBBFeNeKnr3TI0wdvOu9retUvgIAXumII9s5RVeAQjzQ0xFfkHLfPcD+GJWZ+AEokYkYPQt076ao3FmI7ZgmKnCvxBNbg0wsYwPDUtN20Iqz78wYyz5F7atOFc36iLqnWyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505515; c=relaxed/simple;
	bh=xwQHtsrljpLUNJTTWYKrxa5N2l9IwyucZA1Mt1aK1Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aVxmDjitnN9XE0WZbtxHaBFbaIEsH8y1p78jq8xkSzlOlCF/WFe+okqUKWO5nBGMLgKj+fYks80jpx7hYGervPwF1vViIdBvq1Pnf7hP8nz9bQfTYMvpEtZ41CbaY6uU3l0EBX/1Aj6XRb8hZoPemlloVS2raNNCt084bBIkXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eQJn5awQ; arc=none smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eQJn5awQ"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160e831693so30156266b.1
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785505510; x=1786110310; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=eQJn5awQraL3SauT699JGLQiJAzXZUvwQC/NVvhHFQ/1JHDVUO6MyNkRSMQeXCJLNP
         ckY+PcncsXqsoGRHmfH48nr+ipk83Tpwc0C760i6NytRmEPykXYXKkPoSE2c91StZ18E
         gG270iWgp2Te8pgoRivzsjL2eNug6SwR5gqlA6N2o/qL1CxTUXUaxvzJdRbIo+DA4TE0
         KlQXSexbjAXasUR81P1BTbFnbYBPFRwVIpIP7FvvVy437chx+0mvPqDhMVCmo7vkzz1v
         67Hm43ig8wpDiCnbRwOjbMJIK9KgPZUupKYyD/j57sTDg8QVrb8jdCKOGMuN+5uyZK2u
         /UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505510; x=1786110310;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=Mg+psyTX+xD/DcJIFXr8U7l8fbfyQlh5NnYexLthnaEQQ1OqZdcUbA3rtozAnnOf4e
         jdHkOz2c/1k89WSdde1SCDSDdClLdlUcLwgywTUsaN4xBDdnnB4V2RxAFyXXjYV7gUbp
         8odQfvZEGhGdAq4ix7n9TGdB3L8HjjhL8weZrvtL3IZsuvsTVKGnFbjgiqfFj2D1JMEV
         XRJqCZFB2G8VTyAeAh/XKNVR6JTQoJ2yAFV5f2OtrDEgUYrfcOhzWSfxZvnCAX1OgTu1
         ZbRQiWLz05Vx1Uk0z/JM6QOBei2lQheHtOwa2iOj1gO3WBCK/SZ7KX0t6i6/8ixDTSfB
         cpVg==
X-Forwarded-Encrypted: i=1; AHgh+RrjXpQypk0e+QdyQ6Z4/zL36Lkbh1rDA3SCoHJLBIX72N5ncPsWSXmMC6Fyh9PlsrQ4+vI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM8t8OaxE7tY+fJw3peRVGFD97LAarCl/+eWn8gVKwKmJgSHNo
	JSqoleQkLDIA2NNNSsay0C3MAKMNMNYXKe7T+N12Cw0TYcxKgT1sl6XpGRwv4P1NgQ==
X-Gm-Gg: AR+sD12YV7TlvSjsYMeLC6c8rQQBQIGyXV5Ps+8PXQ7fvMGTIVFJG5mNRm0eM4kk6l5
	8rBPx86c96GYa6exEYH/wZOftt7J3AVsIZxCbuoUkMhRsviw8ivqvYtmsIbeVxSqh7ttacUX3ao
	AqckiVGOuGf+i71l4o/hQExMRPQOQBeuTBZVzVVip6V2L7qQSlxQWN0R04D5yBlVV8U94RSDOkn
	a2QZm5asFe+oP8scNTFIh79Bq9UbGGFuGfYgog9PpKmpr/t7WVuEUkO0g7BgrSrLc8CM20H4D/0
	MGvehYFhXcuo1ETsrsYzq+5gNSppY0ig5ODFyPsoRpOQCIeCzdx6llosX1Tr2qdDfD1HxSrIc5u
	r6EElbF41+2wxJ9BxeHUkiFc2mZAorha+aBdfdTK03X2BDQ39EYYx8OLJDca7ed4J1vpUwK5k9b
	tve6y7mD4hT0dr7v3bs8jaz7UGXkoJluIMwQ3NKKfOBL+jRvCVf7sTF26NJIkyGhe3H0Qa
X-Received: by 2002:a17:907:9621:b0:c11:efec:6ca9 with SMTP id a640c23a62f3a-c1fd200e918mr139538366b.8.1785505509645;
        Fri, 31 Jul 2026 06:45:09 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9aesm2059189a12.19.2026.07.31.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:45:09 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Fri, 31 Jul 2026 15:44:56 +0200
Subject: [PATCH v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-l1-conditional-imx-v2-1-6016ee9148b2@9elements.com>
X-B4-Tracking: v=1; b=H4sIANimbGoC/22Nyw6CMBBFf4V07Zi2pjxc+R+GRSmDjIGWtJVgC
 P9uwbhzeZJz71lZQE8Y2DVbmceZAjmbQJ4yZnptHwjUJmaSy5wX4gKDAONsSzGJegAaFzCy6Vr
 JNfJSsTScPHa0HKf3+svh1TzRxP1pN3oK0fn3UZ3F7v0C1b/ALECAVkqrohLK5OWtwgFHtDGcj
 RtZvW3bB3cEs5zKAAAA
X-Change-ID: 20260713-l1-conditional-imx-c2bfd20ae085
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3162;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=xwQHtsrljpLUNJTTWYKrxa5N2l9IwyucZA1Mt1aK1Dg=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqbKbhd6STa3KbItAP4bOK6R6qv/8owrUVZ79/l
 eT+DTQOAE+JAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCamym4QAKCRBimpLMgN6T
 y8Z2EACdH7Z5EH7boQzskJW/YN42hEYIIeBVjKVlmUM5wxvYFMpm1VAa/kUE6COvGUX/shm1MrD
 Pl12ztVFe+ywQbXWGHaWc98cSB2najzZbS6/Q7A+4fDw3g/KX7bpwK8RxTSO37ksnzWs3zGIWFv
 wjKqY0831tZ8ZRCgFrWVCTnX+TVA+/yvocB48PPfdMvaHXrjHAwBFUbGFh1VSwofLjjy88EFzdR
 wQJ8BmXNfwmoX13f59mp3qCv8Q2xjD7kyOsIl4roIIFAf/Ti21EV/BtvtB56IaSMXF891Vdmk2N
 4rk+MYeJjsSMSjv9pwCsQO1c8bIP0P/+r7p8PFbWFZK7HkXkz9dTb9kkVhSqI3+APUHdHHq3TlR
 xX1wPGRByfHAEpueR6jogS0qiap0fwyTi6XocSUOLd0YF/ZjewO2tDR/TU396bXdfgg+JIThOik
 qiZ+S/pCBBrXGPjAS50z0moC/+lJ0M4eNPvAhljCXAgFnWXC3tZVh0vdi3uFAxz+quixD+JmG/Z
 6nY+402vHF9tq9AggXeomWSpPMQyfHMhZPmrGsg+2cDcsynUWomq++EoC+flKa2bodLXY1Ta/xJ
 mOyIX8FwVfEOj/CjJ6mPY//v1+2e8X1sPiwSyvlZLEbETs35Ph/iOgNCA42D9oMkSe1DxJuLsem
 lRJ0Aw80WCRfWLA==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C

Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
states for devicetree platforms"), ASPM states are force enabled
on all devicetree platforms. This causes PCI devices on some i.MX SoCs
(for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
though CLKREQ# is not supported (and consequently supports-clkreq is
not set in pcie controller node of their DT), which causes the device to
never wake up from L1.

Hence, disable L1 capability in the LNKCAP register if supports-clkreq
is not set in the DT explicitly. For devices that set
IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
skip imx_pcie_host_init().

Note, the logic here is very similar to 613f3255a35a, only difference
is that leaving L0s enabled does not cause issues (at least
I never encountered them myself when testing on the device) as its
not dependent on CLKREQ# being physically there.
Since there is already a way of specifying its presence in the DT,
the driver should be aware and disable L1.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
- disable L1 unconditionally on resume for platforms advertising
IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
- typos in the commit message
- Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132..1fdcbcd2422e 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
 	}
 }
 
+static void imx_pcie_disable_l1(struct dw_pcie *pci)
+{
+	u32 val;
+	u8 offset;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	imx_setup_phy_mpll(imx_pcie);
 
+	if (!imx_pcie->supports_clkreq)
+		imx_pcie_disable_l1(pci);
+
 	return 0;
 
 err_phy_off:
@@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
 			return ret;
 		imx_pcie_deassert_core_reset(imx_pcie);
 		imx_pcie_assert_perst(imx_pcie, false);
+		imx_pcie_disable_l1(imx_pcie->pci);
 
 		/*
 		 * Using PCIE_TEST_PD seems to disable MSI and powers down the

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-l1-conditional-imx-c2bfd20ae085

Best regards,
--  
Michal Gorlas <michal.gorlas@9elements.com>

