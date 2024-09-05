Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEB479F5
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725515048; cv=none; b=psweKJbuy77yNRuHXsIPrA/w1EkvPyrKMAdEBhxfB6Hp1UrbhPW8zpgmeV3UqmyJUEwtMr19q023i5qviExpSjKlArYLv5y8NKbRw4gz/fYU5giLm5eBE903aBD3lzZLUomKEckMEmHmagVmjw05bPQhldCswvNgknzQuMPVUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725515048; c=relaxed/simple;
	bh=CdJAp/tUMWFGhcz1c0UPGBcC4IuszSHGI5lDno6dzRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNDmhX+WjQUM3j7JW16v83cBmIebRo/c15S5XGBc5Wl0e8IQC+V5qD7VB5cO0Bl2mySC3d5YTRKA49fixHHGyplOH7Ku9zKm+U1JayQL1HoFsdpkOpaiy5vGg10+nZ2TFw/+Mnne4NBI8wbnGgQ6VFMX90Wklk5wrNsuf8AhGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vgzud/is; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vgzud/is"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d8abac30ddso301451a91.0
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725515047; x=1726119847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbsO7GDIIJTt0xgKGCjBgrCED+h3LnKu0qaWwuQvabM=;
        b=Vgzud/isyr3LDScUHklSTwpx1jLRAoJUhai//MLYDNnoX+NLBvzk+cF2zNtbUjpsGV
         XM+BWCa8w8MdBLw181UtGltsq1pu9gDUJGQT/8xY0gco4gCuoXrvXcki+ufsegbwxZlB
         4laWXvG4bhO/+iptRUQVnBJ1Qix/GO1y8SwEcP1VSIi+X2+Rk7r9GKKgRk9/BiacfjZh
         vLk+OVqLpcJaxo3w0TzhLm8i6yt0E2eYUo+4uruRXW+IYVOY46X6XoqigD+QQHbL/zMY
         uMpp2ralaeaO/OyBied5sdlrzTzyvGUda6aToa/l7U7ddnGhuzm8aCVUR4gWBskI6uei
         FESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725515047; x=1726119847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbsO7GDIIJTt0xgKGCjBgrCED+h3LnKu0qaWwuQvabM=;
        b=dkhxFuVhLKxEOUSGF3qcRliUzxQZH0NnmP7pldQhrN8Lv7CT1DgqS8MGT8vLCtCKTZ
         3/Gl+OLCvZPVGSQF56VcrT9YY7pdTHinkqQKUYyG8wCk+JiDkVLtwiFuGjvK/THekgfw
         rkTgAYgRSTsmg4ZAIR6XMxToTZgFykJ76+7qeOAbUawsENVBTkVlEJnc8AX4ByiK6fTy
         4KkP3ypyyshVNZSENoWwvC3cWIZti0nxAK+PrGwn/BYIHHaljS3q9vMG58PFm8All87k
         aYlFoy9aPUB+NV3vqJwrvStRZhrxn2v+qjJtb5Xeejx5GxNMMF6c4CY1eb7HmJ8ID5gk
         48cg==
X-Forwarded-Encrypted: i=1; AJvYcCWhCOsT7yghc6c2rSAgv8qAEFKQYZ2SX8hQ/WqPvH5+FvsLLam5oVhJRSre+uIPcMraK2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUE48/wBVcvuNtUB/qGXofwBaHqFe7sdUiTTNt4/sp0oFm0sKM
	fu3xdvGHJrM0joi8jTZib97Py/Aao8ztnDxDA1fvk3st57+KA7nR
X-Google-Smtp-Source: AGHT+IFREtDh3v/rJbVgKE66ieWm7HhiQ791rRKVF2ym8Umg9iu1Hx/8lKh3w16vChXjPVOd1srCbg==
X-Received: by 2002:a17:90b:3e84:b0:2da:5156:1241 with SMTP id 98e67ed59e1d1-2da62fddceamr8295212a91.16.1725515046445;
        Wed, 04 Sep 2024 22:44:06 -0700 (PDT)
Received: from fedora.. ([106.219.166.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da63ac4ea8sm4930614a91.21.2024.09.04.22.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:44:06 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH next] PCI: imx6: Add error handling in imx_pcie_cpu_addr_fixup()
Date: Thu,  5 Sep 2024 11:12:55 +0530
Message-ID: <20240905054255.126676-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added error handling to the imx_pcie_cpu_addr_fixup function for cases
where the memory window retrieval fails. The initial implementation did
not have error handling, and the function simply returned cpu_addr without
checking for failure conditions.

I have added -0ULL as a error return code but what should be the ideal return
code for error handling in this function, given the u64 return type? Common
approaches include returning ~0ULL or another invalid address value, but
clarification on best practices would be appreciated.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
Compile tested only. I am new to the PCI subsystem and not sure how to test these 
modules. Do I need dedicated hardware, or is there another way to test these changes?

 drivers/pci/controller/dwc/pci-imx6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 0dbc333adcff..6af39852d2c2 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1023,6 +1023,10 @@ static u64 imx_pcie_cpu_addr_fixup(struct dw_pcie *pcie, u64 cpu_addr)
 		return cpu_addr;
 
 	entry = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
+	if(!entry) {
+		dev_err(pcie->dev, "Unable to get memory window.");
+		return -0ULL;
+	}
 	offset = entry->offset;
 
 	return (cpu_addr - offset);
-- 
2.46.0

