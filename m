Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534CE44E052
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085814; cv=none; b=P0v9V2hpVm/jdAC34e42I4qMSb5aCwfbVwa+P/Hj9EtExH0Z7rxx/XCeAC+BVRuLZsxFYUmCzPrqQ2N0iFS+yiLZCCXFLPW5KluO95voondE8AcK4Jswg1nwUS2qVZEzXoDNwn7JVU28RtgcmzV8OVERML7W91mk5KHqSL9FNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085814; c=relaxed/simple;
	bh=WOwt4OMhl2uD+0uwyR8iejjpuq9Iqazk9t/oBC4Snos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4RllYjc99YyS7bOR1/KiIUUlIboyIGQsNdA46T9a3qA2WqBLtYr0fcRAO/C+VDd7RtEl/w+vIld1uGEbFcNJ1fWR5YFsDn6MJuXumRR850tqGv0fS0zlONE4KtOrdHnmWOlyoVWELMppdlcTg7plu7UQ8HrOiQCovJGPU9IdgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3+u8L9w; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3+u8L9w"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso39510265ad.2
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085813; x=1786690613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=j3+u8L9wYTrsGH2JtKgnQQq2vHO4ilwkCHSZ5KPFFE9jVTWtBn032/ZWWugYgLg6Lh
         cGZyNYkfR9cFGuNGJYEA2F2U28I3szaCOyDx40kXS1mpXC735OEkUN9YP1jR9N/YprQr
         lwZ7IZonftmicLXh0WtdZGS3oLl8bovwEMt2fCVixITFA/ee3i8qsb9kh1fRjYbyPQw3
         GT2cqARBuD5kZceMxGUgFikrl6FYVFdMn5xJd04OhcoWGjyzuDvXQjyaZzLFjAnNMXmX
         eiuTGEUpEQ/vgvhUcUZPylRDjACz6UG14HNPM2gf5AinYqbke22y2Lc4Wj7fmOeShgUd
         nojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085813; x=1786690613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=h6GodmU3w5BBuDcuPBOo+OMTHpIGAt241YY7DYYdJCRvg1G8CbX2asj7tpU3XQzTP6
         I2321l/7EZI3TS9sj91Xj8YCX2eirBXlaQPJsp7vyuS4NRjkBxY6iN9FKOZS+4iECmtB
         DmL6/U3Zov1NjPr0Cw/rv+/Iv6Zpl2EyDotTlTHYR7KN/dV0hQs7LfXDyDGlUzPuNnNp
         ayeX7WtMNbUvK/eak9YLEMosxuq95pEVSSyBoPmnnOL2p4cdrnMMd3MbVHytHd/uWLR3
         xBMhkgW4cBjQrfRo15tG2VrhM+FTYohAEff+0YYm9ZlxdU96sJVnoNN2Ucc/CFPm59hn
         WOxw==
X-Forwarded-Encrypted: i=1; AHgh+RqWUeDL77iC2PNBWwsy6GWWDehyjujXMVxyhhGkWKiDO/Tb5e8oliHinE8v5NpqGV/b2zs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxep4FXCld/YEpvMUgK930Q+GPKainWdiqVk2P4dvJzNAou7+5z
	0rDBOuGgEpnHV6EuO2fD+FP5NcJpRRyiW5rDcOk9KS9Qq0lzL3ubplHifUl6dQ==
X-Gm-Gg: AR+sD120HUb9IqYFhnfzqZolBCiq27KqddQ+1pGxIsc+b8Z+pLZmms8qoL8eujXKfkm
	uMs3vhBI9/OhcxxSsbsukJpjq2QAzbX2NoD22M+Oy4kV8U2i6GnWLTxBQl7k4HjUseDjBo0wQqX
	KpztkE1pwkP1qyQW5lbPJ8heWZ5V3N/sIOS0OudIab0Zh/YBKS4lAkuXy8wlC0C3Mk1lmtraTtH
	laCC4+7AA4+hNVTriHmj7zjOKsUTFsbRdmWoSRHyttGjNqBC3ecs0FShD3NW0qJ29BCSLLFtHXp
	qqFruM6rq40v5iBFUh5GcgmdYT6JlGGMYT9trT6/9ppwYAq0ldpwbwKCTB/uTv2yUPmujdAdhll
	mWNvCs1WtYY7hAa3hmfC/hW2VJVk4KKWZDiskFSZbw0FcWcGRFag0nVDtowWGsWi7iHj6CHbHzQ
	sICocS9c7JtGWFel4flB/fd0WrSJdVulzI6qPNZZz9zBzn2BwF5Q9LSs9LZwT1nblVbm6E6dr8A
	S1yMoxqk5BQ+YFvWR/Rb/7IpBjWsBlh99zEjIdCulLVOL2dIupq4xI7YUTM/BOr6NvTcOUmqnDe
	SU3R
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr245369825ad.17.1786085812605;
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 13:56:18 +0700
Message-ID: <20260807065619.30604-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7387c9903e80 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto err_clk;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0

