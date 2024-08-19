Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E07F15DBC1
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058278; cv=none; b=RF+BC9G4uU7uxjjylyxyhjgyBpKmrZzb+NnAA+ExVRVIQd7cJ4B/fXgyy2acVN7U+u3cId4LXJaLN6/mmmlzeRrqTWDDhC3KQjXkcf5MYHL60FKy0+ZrURAhXt7HC07rNdvIeJoodG3uAF/n6M4o4phShKdnoDdz/Ok/IAEwqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058278; c=relaxed/simple;
	bh=EGcprhy5mZbPF9sfa+PupUNrxqcOBkimo2HGnH8hWpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l40PsDvKgrL3PWoTaOUlTZVGtKsDActwIzfEw3ZUpJjFxSnZdnUX1gbRqeKeVb+54a+LuJ7HD/YVzeptlxWsUXJBAxlwyppc/r5awIf+/XJlOXS+i8WMJ42Q9Aic8VZloGPZAKGGaX74f1tqjuYo6LcHlYN06X8pH0ZlqDanJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJHds08l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJHds08l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428101fa30aso32315425e9.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724058275; x=1724663075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73KaV9INZpxIDOJ2Xw69bHLb9GRPh7H+PU9DOGB19/g=;
        b=lJHds08lmgWNkHXkrWMu6SPtZIFQ5+jwEx7JbptzPMAJiJf5XFsFjcJeiMfdyORhbZ
         nzMPTOJkaFTecCpaUtSs5oFeCu84jOyWXnBuYVTRTvrgdw9VLE6AqcAgvCDQPCFu9OGz
         qIDBUs+He11P7PpDJkFq8x6w+at170CdKbfyVJx5JbM/KZuXpMFepLapNtHVF3I9jorb
         kRVXS2VXykBTirp0uaPv5pFPZRAmvxdZODjSERtMlbJfQfP8TrbeoX++q31BXIOMnA/n
         9gLa/ONMCWi7ahJIlLAEpWJE9h8oh+S9uKVfCZYtzhQNf0w81kVTVa9CAFU53p0CPRDr
         DNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058275; x=1724663075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73KaV9INZpxIDOJ2Xw69bHLb9GRPh7H+PU9DOGB19/g=;
        b=xFO/psHaKJhN3kukZdcXIZzL5ow3iqb+58E5yFgon1SjA4zWbLMwQxwQVit/o32Kre
         SEYSYnSapuHVoAyOpb3u3+btVLmENgSTeYHESXQlksuE92KU4MvjrQlDLalapmdSVDEe
         RcDx9l1u3NtCCYkabl0lL9NG/+mvolHavq/zpOlLOVULke5mPEP6dEebo5bXywGPj0AV
         MRGbNf4nVzx7YSuVWjAnBUQ9Q0n0Z4X6iHlEa22HaxgJBOrtwTLVQ8tJ00mQHi6EYFmb
         /afhHWHSiqGz9Bvs/zsmJlc/MKhjnpdnxhCmHHPiDjQxzKx2iiIZB5xY14039LiQfmTz
         Ln0A==
X-Forwarded-Encrypted: i=1; AJvYcCVD9UdiyqWghSO2y6NYxKF+TlwQaFT8+mB6JOUZN4wzHOcEOpLbFlPYWXYLlMbDxESanQc2SZz1USBl1PXWq01ZcsoT
X-Gm-Message-State: AOJu0YxNC6ySEmmeHNVbZLuQkIQ/JiRtlknmKRqsbRkySppAklOCcJqk
	44nqzmRbpwog0IdNE8lcjMLSqJ497auEJaiONq+u5D6RvJuY1CsB
X-Google-Smtp-Source: AGHT+IFj0i36M1XtioC1FP1u9W1VBkISL7S6BIM5YHh9arQA28kGUfNyxyAdUgfl+WXFeQvQpsZc6A==
X-Received: by 2002:adf:e78b:0:b0:371:885f:73a with SMTP id ffacd0b85a97d-37194695bf8mr6200443f8f.58.1724058275150;
        Mon, 19 Aug 2024 02:04:35 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19627sm154672095e9.5.2024.08.19.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:04:34 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/3] PCI: imx6: move the wait for clock stabilization to enable ref clk
Date: Mon, 19 Aug 2024 11:03:18 +0200
Message-ID: <20240819090428.17349-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819090428.17349-1-eichest@gmail.com>
References: <20240819090428.17349-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

After enabling the ref clock, we should wait for the clock to stabilize.
To eliminate the need for code duplication in the future, move the
usleep to the enable_ref_clk function.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index fda704d82431f..f17561791e35a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -632,6 +632,9 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
 		break;
 	}
 
+	/* allow the clocks to stabilize */
+	usleep_range(200, 500);
+
 	return ret;
 }
 
@@ -672,8 +675,6 @@ static int imx6_pcie_clk_enable(struct imx6_pcie *imx6_pcie)
 		goto err_ref_clk;
 	}
 
-	/* allow the clocks to stabilize */
-	usleep_range(200, 500);
 	return 0;
 
 err_ref_clk:
-- 
2.43.0

