Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271A270EC1
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192340; cv=none; b=jwmnlnrQYz25XHonbl3KOKjZB3mPwwQODw5EW+dS1sVcrt1efYRaR3j5gUuzo+c0cawDXRoQzhD706b3KI3RqD1Gr0UjkoYLSYzeFRaHJzhAWJL8utDk5ZmG92/JfUDAF2o+vPZe1RxK8DpEZ6sSTdcumznWTnoMIxhsWAMDDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192340; c=relaxed/simple;
	bh=5m2pAtLwQAG5n3tjRHX6phbB0BVWp/5Ljs87oOwdj8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OBVWfV97+Sg7zAdqxLSuHJPMXPs9FXQ3DtGnddzJEa4nKiMTyRJ9KrdHuHuXTX5nC7F0L03RvLMzQfiuXbfu+aBC1ho99IfG4Q+uyf9jMe3hHRgtbsfIIt3hfRw2flq8zuFoPswgOQjxv72ysHqpSyOPkIk15LQbz2+3IDnykdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+yp2vhx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+yp2vhx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f47610542so1385556b3a.0
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192338; x=1769797138; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWeU1UwAO4pe3zvezy5Kiy+/X4gvo5C+nKCDnSN6RYs=;
        b=I+yp2vhxxxdvYMB2MH0TRTwIFQRJ7xGLl9CMqsvL7FCZQ95+ibAZ85d96wYXSHJQGi
         DrdOxiIITlV5Us12aYetWwGEfDbbpOi7NpoCjJLGukiTHk82yGQodi6l4od2Z3FAGzZg
         vYQpMX+SWww2s2qVplQ6oQVLeA8cm3P6KXG7Dr0h0WQ/w2XXXuWQIwj0oIyB2A4QZYwX
         c42yERMgaC9q+BYPXpllQxqkegD3EFsQHZqk3KfdISBW1QsOTg9OKUW+KN99G+iuAlqG
         MCMT7E3D3jL6a8P8zYrfaqjvXsUB2w7ofGV8zaV85yCAqzrbqLB803gj2Xkahdv1UU40
         bRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192338; x=1769797138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWeU1UwAO4pe3zvezy5Kiy+/X4gvo5C+nKCDnSN6RYs=;
        b=OJ8Myh+j2A0a+cm9X4HK0W7joNKl/czpTeO/BXkkAiTzM7xPHaKKIEsj7wJJITZ3+8
         RKkbMdNliU/vhCEgO/nTbjBWNfBqyXMr/cePEwrSlyBk3jIZYIepTluQmGBtn7Zc++ht
         9ETMZBP9Bg4g8xEmcp49fECV3SIRDM1vxmVdow73GN8UR6B042FRGECEONHxxP6NZ51P
         QVS5ZLLH+1gZBVBwVxP9tnafoFllW9egk2wbP5SebFV7RFYz/4UpHj/QMrzEeR2lsinb
         txV0U4bd0uyZsJNEl23YhVWMu6pvh+sdm+6ausO2dtU8nFvAHS5NT8Yubo7xADVMkKbs
         L1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQqtY/IRGjJVboc4aMwKbJcMVRr2Exm9zXo0h/Bp0mMGSpBaLNn2e6T/T7PgiItBE7DWA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzcHWp6zrC6aBeiFWqTyOI0Mde0zgsURp3rb3MlcbiM7k8RINO
	4JI/p9U+x7rd2Sx0UZGpepoIeZX27BRVvzYN48OOZqshmRUgt1Bj8vFs
X-Gm-Gg: AZuq6aI/KAEkrYIEPryEEqHfkb+1X02PoNV/cPD907WlS7STBEJGCLmtf5Pxfw4E1jR
	mAMUfZB2W8f+tP6oxh3316QX+BNXfzSAJuMBDkWJv/I1N8M7l60cks3o4aB8tKyO7exqXCaL3wP
	P7D1WqrelhyFVoyY+VEqVkgLs878QMsWuNpxmjhINbDqdqAvRhVOrKzjXRCLWR5GjepehkHqKgu
	JDru+LvmvV+d1au8ias51OuBOOMywXhHnSbau0JFsrBkytWrPCLN8rSDqeWToSZN1ih+rJykl7T
	TRLwzSd4SvtsoNQVUIv3E3YkOKfzZuPENCTZg7HvOHxpbnjsf6rFCIjCaXoLuAL0yqlsoMFzoLn
	093wGsna0k1Bq0+CI0AZgapJjAK+GfZ+/zbgbmnYH9CVk4iWgbTUzlChD90h4mWxPM89q8HL/xq
	wbZ9CsxNRD1FxbN1dFj9dO2WxO
X-Received: by 2002:a05:6a00:e0a:b0:81e:63b9:5830 with SMTP id d2e1a72fcca58-823215d894cmr1814046b3a.18.1769192337818;
        Fri, 23 Jan 2026 10:18:57 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873fa99sm2737765b3a.58.2026.01.23.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:18:57 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 02:18:49 +0800
Subject: [PATCH] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIi7c2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMT3YLkzPjM3Aoz3TRL8xRzAwsL85S0ZCWg8oKi1LTMCrBR0bG1tQD
 csCPOWgAAAA==
X-Change-ID: 20260124-pci_imx6-f97d70887dfc
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769192332; l=1059;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=5m2pAtLwQAG5n3tjRHX6phbB0BVWp/5Ljs87oOwdj8o=;
 b=c1kmFZYTjUboD6aDt5uIFJ4j1wdUwKwQCWHZWpd6SRlVQvVyjHEumpT4BDWjLBheMuh5h0/MJ
 gOEw7yXl6kNAAkxZ6ysWS9FtiCJsvPbL0qMBG7hJkMn20pzp7jVkVau
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In imx_pcie_probe, np is obtained by of_parse_phandle() and must
be released with of_node_put() when it is no longer needed.
Add the missing of_node_put() after of_address_to_resource() to fix the
leak.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1d8677d7de04..3ae02712d3f0 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1675,6 +1675,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		struct resource res;
 
 		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
 		if (ret) {
 			dev_err(dev, "Unable to map PCIe PHY\n");
 			return ret;

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260124-pci_imx6-f97d70887dfc

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

