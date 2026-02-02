Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE137757D
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045060; cv=none; b=D/7DL1Wn5KmAxoB1q/oj6IU89eQNTbjHPkKaH0IYgm1HqwdqsNcFHhVtWwcCRm37TG6ga0eo6tqj1t9cjliYdyUokEId+1GhuGpiLPJIeaffYg+vIEYlXnEt2a+85XGfADFiNbAVIpslYxfpXdp0AyrtglWBf5y+YlLb4IP3lUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045060; c=relaxed/simple;
	bh=btc952EXnNWwdQlMg+H9RbtOd9pcgav+Aeu0irDTT9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LushL1UpiT3Q+f1ZSIZZ91Ujs4Hi4pE5ZOQH5Y/wy3XRNj9BJOsWotY46nktkOdHD8VJGj0y5kk1OXpzjmtcMalGfHxVzvvBuxEjVGZ5aABluU5h/RC8brHRG89YFoKeKQJfrvuc+lNnwoTOtXrGeyVPWWLawixCNa6IIi01KUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ardud0C4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ardud0C4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2670932so4209624f8f.2
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 07:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770045057; x=1770649857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLQJlIi1xp3GOgxJrSuyTGl+kKtHgLV5lTV9J+BYkDY=;
        b=Ardud0C48Ml1k45lVZOQO+63njtKHvzPIvEfFiHROTJxnAhV90zLA53xbNK/EfjEcK
         0Jf88d4S2rqWGgwsgq+TjhdrkrH4LNGSgQygA1oCwl1sRScOk0o02FZFGIRG96m725rx
         n3M+ro0/LpqaOY6jyuaKn2kygb8DnC+agshgjJ8b8qoIE3DZWdG71++vFk8kE92ke6KG
         qU1MUsEx5/NndtjIyKeyVD0DF+nKsUqCvY0XWbjShHIRtU7t82Yglb1JQ6oBey66UuCc
         NdqH4d3K2eUnWfeBNM85TkIe7sGE54F81lPxk8GerOgb6m8PqglCEPSNze7x9TZG0jWL
         2Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045057; x=1770649857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLQJlIi1xp3GOgxJrSuyTGl+kKtHgLV5lTV9J+BYkDY=;
        b=ps9HT9GVgz76WdtEIzT6FxCghyzPFvUF1v6OSASkSbWO50TIXbvQgSUFRCoMALPby8
         5MZ+AqW7o/C3ppqA/FB/4hkREiP/4X6xOuUaH4BFD6A70GpFlBiP+m8wkVynDOlc00R3
         CoJzxOLvmZTRuh37gNAx17OYKjEyXwEn05wm85oOHQnqQdi70iTKig7gyQmBzaRSC+6C
         T4C9KEyFwNYBBVKPIxNQajS+JqjPrwA1w3IJv25ALgPo01RfO+RkfUH5Wo41fUcMPWMi
         1rOSShTNKgDXkBgcuM8v54Kxv0VAbM+tfhkh+4xuNzWT0w19VnNKVdVVPbOKyOGmmAyr
         04ag==
X-Forwarded-Encrypted: i=1; AJvYcCUbB0XOncETZCUjPkHllyUdlQDNAJLyNHJJ4+OmmWDvpx2GyzOVdQ1brTGTqk1X+dD3ZuI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLqo65yp8RHqMvU93JG9A+0l38uoxKN5CChco9djHuHHQNMmbC
	NFyGy/q8NAuSxGShWCNS2JBtpwMc1LlniZBFXIT5/BL2Z51zzaUt0RXUusf+1oTpLBWNNKaqSl8
	09Scx
X-Gm-Gg: AZuq6aIEkENWG69TbFlig9Zi+mTygG9mtCNunY/g1ASK+p8E1hEt3gT3T34TdgYGo6N
	RqJfw68OjuqdTZ3disynDXSuA4JIZXz0DLUhzQNKGuh8Ot4iXukEivWDaAhheLQLFjPDhYCQn59
	ybBWPlyLoxePtztOZ5lb8RiFxn1/7RcsqgS5Ee+UvfrEt7XZ+t8bKGdSLoedOx0AWZ5jvAths/w
	dqcCcOf3MkFhVAk/0ITaxxx9bb1/aczA5Ztpuud78sGWIA8MZjx5uKzBEjELC2td77QSJHM2btE
	IpmtXXPIRkHbEKZH9WfdL2qh3/kFzR9TosbHz3rRQhfrE6Mbke9nLuj63HdBqbrEBjY+UC0kADm
	fKNuvcztXU8MacGn03kbdTL7XB9koa9A3EWfTMCy3gfLPg7f7BpffabwsmhZY7xDuMuAQIggiU+
	9YwmOnKgvjk3DeIF80fSRO7AZpnCo=
X-Received: by 2002:a5d:64e6:0:b0:435:982d:97ee with SMTP id ffacd0b85a97d-435f3ab9a44mr19652025f8f.57.1770045055569;
        Mon, 02 Feb 2026 07:10:55 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7cf3:628:f0e:cd4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm42845021f8f.17.2026.02.02.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:10:54 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2] PCI: s32g: Fix ports parsing
Date: Mon,  2 Feb 2026 16:10:50 +0100
Message-ID: <20260202151050.1446165-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No error return is missing after the loop resulting in removing the
ports from the list.

Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---

Change since v1:
- handle correctly the case when there is no child port

 drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 47745749f75c..b3ec38099fa3 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 
 		ret = s32g_pcie_parse_port(s32g_pp, of_port);
 		if (ret)
-			goto err_port;
+			break;
 	}
 
-err_port:
-	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
-		list_del(&port->list);
+	if (ret)
+		list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
+			list_del(&port->list);
 
 	return ret;
 }
-- 
2.43.0

