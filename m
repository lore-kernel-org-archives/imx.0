Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84015B971
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058273; cv=none; b=bYnmpRT+ThmGlKB9vArVOxfwAIY8VcaCcF9vwI8gqsoweHgFHMMyiSzLbEofgs2cCi/RRcx/CtfY9PLN60PjiLQ2d5UuIgRdjh353RHZlZRRKChHKnkm6hQelzP4yo/Wc1BvYaKN9UBAFrNzz8A8iLN0jDdsauWv4aZEMvwMkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058273; c=relaxed/simple;
	bh=9KeAJ85mARaA164U631pYrL0Sb6s2xqY74y27QZM7sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMi5mBgVDUvRVHknNgWDFXb44ojCtjcCrH+IOCL1UnzFu9rhV82CRlQOVqFeMGR+z/LlpXgLb/OGi3u12wETBqAh67dUTRSbkSeWUxOuh8Hpr1lmInOkMHzYfWTvL+CGT3TDE2UlSk9rMLNg1SwKZ9ZLZdSXGOx2xOVr9nsC3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQSbYuPu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQSbYuPu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371a92d8c90so1040926f8f.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724058270; x=1724663070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYk/Np4BRVvjkNNwkVfXEx5Cn133dtofexIhTAAA2fo=;
        b=aQSbYuPuTVi0VkSY7EqtLS5qQ1acgObw+JenPb1Qt7OsEgjM4UJHw9iFlS2DCQflZ4
         6ercoqH9SvhPt737NvjsneM09RqrGL1g0/O7gvbMUScf4fmVXtPCg0znMoHssBIm2iZU
         7HiNfFSfQ0rSq6gjfhaaQP5wh62tU+af+L6t+NRkDE05sofWeFCRqVE14xFUXS5ZPGWE
         Vj8O6Y6Ds+7IeXunp3jfbypDLJHgKfiptre3xJdcz98Fxnup+yNpJBJWrAoJGpqqGor0
         xij1ZL61nZnpG0yW6LBjZGfv/5hSBTTFHLnkTJTSnF7hq4arKzzAo27iO3n33JMgZzf9
         s9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058270; x=1724663070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYk/Np4BRVvjkNNwkVfXEx5Cn133dtofexIhTAAA2fo=;
        b=CFBtptnZpfOQm2zvMIgYeJ+YaZMNvi0TauWhV7NwYs5EaplHLyb3uaxpns+gIU2a4R
         zuAtWfK1UoJ4EBVTM4mSS6+5RTOM7o68rxgByveZjIauXhUeDtBv4+Jg1+jqZakajlZa
         92pLk5CfWlBjIJIAiKI4AfY7p7Je9XrznkVSnWDNoyJvck9C+Ll0Mlmlk3hE/4gJoeEj
         iySHsY+aSNhiDbBm8j+suKukdb2m8MGwpiiDDDhRawBm+GxwQMj+1UnukDsXZgjoOU6c
         ITq6PFiXh/TTECBP6yKuP/Wglm8kpIjsQKJ9EUvlivgzLpemBChIqfXn2Fq+Av15JdhL
         XlBA==
X-Forwarded-Encrypted: i=1; AJvYcCXznEU6nryTdJcNL5Zqg/RuN7CxKmBjoajRYcWiBkgnvVERtrm0XDADbBAvK6+bF+CR1Ybsvrs7K+d3aX8zxVgl5gON
X-Gm-Message-State: AOJu0YztZJ1dn3uz9ReGUehOqtT+PdW3rwgsUWFdkgD/C4Neh4/VVigw
	PysJgJZXXDUM8/3LRlLj+tZ6UXmJ6DqGKwQzHhekhTSViZ+crEU7
X-Google-Smtp-Source: AGHT+IEbU1HgO/yej+WfZeaZhOMIw5v7VLZzInmznYjHixqxo9k1PPUaTG3RO3a5m4gtSHIAvWU/XQ==
X-Received: by 2002:a5d:5e0f:0:b0:367:4d9d:56a5 with SMTP id ffacd0b85a97d-371983d5ea0mr4843461f8f.44.1724058269951;
        Mon, 19 Aug 2024 02:04:29 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19627sm154672095e9.5.2024.08.19.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:04:29 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] PCI: imx6: reset link after suspend/resume
Date: Mon, 19 Aug 2024 11:03:16 +0200
Message-ID: <20240819090428.17349-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the i.MX6Quad (not QuadPlus), the PCIe link does not work after a
suspend/resume cycle. Worse, the PCIe memory mapped I/O isn't accessible
at all, so the system freezes when a PCIe driver tries to access its I/O
space. The only way to get resume working again is to reset the PCIe
link, similar to what is done on devices that support suspend/resume.
Through trial and error, we found that something about the PCIe
reference clock does not work as expected after a resume. We could not
figure out if it is disabled (even though the registers still say it is
enabled), or if it is somehow unstable or has some hiccups. With the
workaround introduced in this patch series, we were able to fully resume
a Compex WLE900VX (ath10k) miniPCIe Wifi module and an Intel AX200 M.2
Wifi module. If there is a better way or other ideas on how to fix this
problem, please let us know. We are aware that resetting the link should
not be necessary, but we could not find a better solution. More
interestingly, even the SoCs that support suspend/resume according to
the i.MX erratas seem to reset the link on resume in
imx6_pcie_host_init, so we hope this might be a valid workaround.

Stefan Eichenberger (3):
  PCI: imx6: Add a function to deassert the reset gpio
  PCI: imx6: move the wait for clock stabilization to enable ref clk
  PCI: imx6: reset link on resume

 drivers/pci/controller/dwc/pci-imx6.c | 69 +++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 10 deletions(-)

-- 
2.43.0

