Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22B3B1EFC
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354308; cv=none; b=D1k8z4mDEhPdtZOS7FE+6Twj7DSVKoJxDwRlKdPPSCVoQJvQx36B1kCkisqrVHWBn+Mn1RzUQ36fI+SNalZjLaU9FqN/ufR1SF/OmX6ZLsXcKqquE5pv09vMkM/IwcQe2dHpHAvg84aiPyLdLj7kz7mEJaccgbhJ38OFxXANi04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354308; c=relaxed/simple;
	bh=2M2xeAgdsVXI/pfTvlb2yIeWwS0e9oCjUL8hkbV4lvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EI/O5B/MrIL2TNepDPGu6faqn6vhF55ctkDtHLuwJRHvqpk+3EckJ2gSPv0S2IH32Ny2wD8l0qwtG4FqJGzdHNm5p4AxAPGR49ZArtnuMQl7AA8VyaJuoETT4o1rTA+1ySm+o2M0f0/Wq3FlcPn8h21CRh/AVZ2x/yX1lgh54mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCiHeL6o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCiHeL6o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2108373b3a.3
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354306; x=1786959106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=LCiHeL6o/GLyUn0Y8bJCh7sVSce5T5lYJ8di+PuKZhSW65frHbz67CTQstXMj7M/lJ
         UPSUlFVjoFV4isMNDXxf1Jk+xmWd+E0i0SJP1v95SStj90fHrIdqfOA2Nk8K40I6pEgM
         Y6HpJGvH2nJg8SO5rFBDtyx5LImGd88xUyyNntcJvpDoy2AWCDQ3jk0Fxd4UnodnE28P
         VV7Q4Jz2W25KTwjwuPANX/X/iHRh4UjVfnOJo2jUWtkiR13OPlKK1MyRPj3MQITim7+a
         CltiQToM1asE58KlP/KM6TLVn0bN4i84PiXbO2p6Phn5q7l0+QIx/V93nRyz5KBpFTW5
         koBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354306; x=1786959106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=UeO6JcH7qhA2c9M4QcfMxu1u2+Zp5C+J+TzwOTXYO5ldVtYrxCflXxPXb9flA3s8Ns
         i4uGHZBpd/C/ylfZcw3hBOGI5LkEB7wC9s0JfuTRup84JmDjYPN+u/ZWq1n6C/r4O4Hu
         r7kkv2eadTmNr3bQxOaC5fa6OilzsABV2yYHm4AV9lI/31HFth6PpAY72jur/Z20ZzuE
         8Dz/newZXWFw7mLG9x6qT/ZZhGAZcuV8LFQWKthqRYHBsliYKNal1v81UFyGcF/44TcH
         s6OnwBMpiUvP99K27X54HIJtYRvzVgWmQCjtsrlC9xd/1Rwu/h9D299GupRyJmxT8+tJ
         1Hqg==
X-Forwarded-Encrypted: i=1; AHgh+Rptgcxo3Jniy91obsCCdpYabL/CETJs6Z2fy7QOvAWlZaT6PqDC1PI8JFuLYwSdg6B4Pjk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Y0PjoPBxdYkE3JAAlKcfHZ+tTLnWnbIsQ9bQSnEZ0TNpUx8y
	SAcR1q9ZIhv1fwygWJOhp1WtifFMYxJjQ/MsMXDe3i1OoAWroFQSx/6j
X-Gm-Gg: AR+sD10NdIxmJwhcbD7VSnzz2YK3fvFUnHi0pL6zpmRoEgx614jF2zQgEJTKYC7HQ8o
	JLau/jEPWhuMstc5frzEVztPZq6pq9H3gyt4XIyVzLEbGLPVNZ6DKQO6DiVTF97y4hbO/JlTMb6
	frqhCvuQy4qCMNCg8/G74Spib/Bd46GooVvQRCBQhlRzrasWDSTJcn4OJxTk5o0G0ymMDWrvHVK
	3vEXEeqVfxKr0Xdt4fDlQbVOzLF6Wq1wB8LIC0jKay215W81Jhr+3Hl0at31yyamsGbmdNH9/xW
	9j7wBeQ6IkK/gZcYFovcVg4S8LDOiPc35DjodIkUPUfkjPM/67Vaprcx1puRuisd7vcTQE7POgW
	GC5JtNjIUGQ5dVusG5JImmPrvgAdotV3NXIJw1K1piECa2ojFlSvCVJmmvk66blk+341FASyPL6
	vPtgVDn2dsxLggRAq3ItrjPF6AYY/DQqi37ltocJ/gbpHpfqX4hHgPYTnUOGOAjnwYyVazmeBpz
	UjPOPdiodoeVCfSFwI3Q/nKBKw1ANx5DmKLjdYxtIKcTl4qpWTUegIGCRIB3xZqCrZcMTFAsjZJ
	aYMZ
X-Received: by 2002:a05:6a00:3c81:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84f5e068579mr22565587b3a.21.1786354306343;
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Mon, 10 Aug 2026 16:31:12 +0700
Message-ID: <20260810093112.47807-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810093112.47807-1-phucduc.bui@gmail.com>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
was logged with dev_err_probe(), but its return value was ignored and
probe could continue with a successful return value.

Store the error returned by dev_err_probe() in ret and jump to the error
path to propagate the failure.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9e529398c607..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,8 +532,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0

