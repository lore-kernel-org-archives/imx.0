Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107CD198E76
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697884; cv=none; b=faa4b1dTkxt/Hb26gSVe54zwrWqdieGiS6jnlYvieARxwqrFUisuX7eqIjnojvU0iYVG0vws7xPxesaoN4/7v1R46kXMFJSxfYGsona0b/vbg2loHgwRVNvfMf4quRR3tCiIb1tpUtshSk0oZ9eJGmqAPesfH3Z8CsT25fuHiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697884; c=relaxed/simple;
	bh=i9fHK42BYZRW42DIn7gTi+isZVRv8GhNgDIaA4tO6Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1GChowBYH0sOzeDRExcIOdEI4bxtXr/7pmm6lxCqBfKjrMGQrZNWF4Y5a4jECP19Bc4Z+Ihx2JD87nxqFAaTup2vqeAtXBb5eG9Ixjz+auuE/ENSJflxMW21Aqsn85W083vFai8emSn9Kgexe4rbtE/E8nlvYJd0E1KFRA120c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UqGmC+oq; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UqGmC+oq"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e1baf0f764so1288408eaf.1
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697882; x=1728302682; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JjigCj7wmiDgTIVi8lxvvE6Xnwp6vOIIL7mEoeKjLo=;
        b=UqGmC+oqTsEbLhWpf87zedKUo3bU7kAGxY/Zsc6ntaGPuqFqgfTeywPtbYlZzDZwO0
         FOuuTRmHU1LBbxxvS8G05iv9jPaCypXZszuMQ4VpmDrzfIW2yMJefK8a7Ky8QrhiASsq
         LayKdZh9bDC6PdOTGhEvFkVmYlHkjS7apyoVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697882; x=1728302682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JjigCj7wmiDgTIVi8lxvvE6Xnwp6vOIIL7mEoeKjLo=;
        b=IblLGmYJPu44HbVAQ18P51F5Zy7GB5LXf7l1TW1nnpu5UqaPf/hYcuYlJ/JLR/7yt+
         q7uOJn/2US2/qzCAhKAZ151lQW5DPvqBZIHSf1TuRop97WDd6woZyuR9y3QhG2qcqiSC
         NN1mMSgJu1J5Oem36VsHLzHwLbacs3+6Y/shQAZ31VDB2IRJ0ymsaDzjXlcZ0FaecLRF
         1KtGFt1h1Y+/Cb6dmrgy//x3I/H5nkgF8yPXNanP+3TY3Q/KfS6paOOZC2bbSxOErUXy
         N0queQJWMjtEkX/2wk916NQeIk3g4MwFDK5edEQxsDDWLs2JgHeZclWQOHTsrQDSFz0H
         mTAw==
X-Forwarded-Encrypted: i=1; AJvYcCXgQ2lRPBVG/C8ymMTE978TRDASraw0tT+kX2gSvav52eni46TTphtaOFkEZTsQv2gFpsY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zyUsyOwZQCb7T4jJRhdU/3cfZda92IQxcgcg29HozQnKVc8N
	HOAt+Fy0QFZBt3w/y0Ash0AvgSM0GaQW/kO7/76JlUAjt+eeibUoRTivjvRr6w==
X-Google-Smtp-Source: AGHT+IHorNkcL7CG7P94wqWnm5CxVPJz+Rc1wLbNEDwAbC1i2AVoPfjS6B+31QnhNxiGPZOH/d/JVQ==
X-Received: by 2002:a05:6359:4c9a:b0:1ad:10ff:341e with SMTP id e5c5f4694b2df-1becbb397e3mr239386155d.4.1727697882114;
        Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:13 +0000
Subject: [PATCH 18/45] media: xilinx: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-18-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/platform/xilinx/xilinx-csi2rxss.c:415:3-27: opportunity for str_true_false(data & XCSI_CLKINFR_STOP)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:409:3-24: opportunity for str_true_false(data & XCSI_CSR_RIPCD)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:407:3-23: opportunity for str_true_false(data & XCSI_CSR_SLBF)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:403:3-29: opportunity for str_true_false(data & XCSI_CSR_SPFIFOFULL)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:405:3-27: opportunity for str_true_false(data & XCSI_CSR_SPFIFONE)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:424:4-30: opportunity for str_true_false(data & XCSI_DLXINFR_SOTERR)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:425:4-34: opportunity for str_true_false(data & XCSI_DLXINFR_SOTSYNCERR)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:426:4-28: opportunity for str_true_false(data & XCSI_DLXINFR_STOP)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:892:2-19: opportunity for str_enabled_disabled(xcsi2rxss -> en_vcx)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index f953d5474ae0..7ddd9b265162 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -400,19 +400,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "***** Core Status *****\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
 	dev_info(dev, "Short Packet FIFO Full = %s\n",
-		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
 	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
-		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFONE));
 	dev_info(dev, "Stream line buffer full = %s\n",
-		 data & XCSI_CSR_SLBF ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SLBF));
 	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
-		 data & XCSI_CSR_RIPCD ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_RIPCD));
 
 	/* Clk & Lane Info  */
 	dev_info(dev, "******** Clock Lane Info *********\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
 	dev_info(dev, "Clock Lane in Stop State = %s\n",
-		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+		 str_true_false(data & XCSI_CLKINFR_STOP));
 
 	dev_info(dev, "******** Data Lane Info *********\n");
 	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
@@ -421,9 +421,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 		data = xcsi2rxss_read(xcsi2rxss, reg);
 
 		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
-			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
-			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
-			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+			 str_true_false(data & XCSI_DLXINFR_SOTERR),
+			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
+			 str_true_false(data & XCSI_DLXINFR_STOP));
 
 		reg += XCSI_NEXTREG_OFFSET;
 	}
@@ -889,7 +889,7 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 	fwnode_handle_put(ep);
 
 	dev_dbg(dev, "vcx %s, %u data lanes (%s), data type 0x%02x\n",
-		xcsi2rxss->en_vcx ? "enabled" : "disabled",
+		str_enabled_disabled(xcsi2rxss->en_vcx),
 		xcsi2rxss->max_num_lanes,
 		xcsi2rxss->enable_active_lanes ? "dynamic" : "static",
 		xcsi2rxss->datatype);

-- 
2.46.1.824.gd892dcdcdd-goog

