Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C835A384
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129863; cv=none; b=Ht4OhZRd+k7q8ExXCOAhifno4xs/xA7z+W62arqxg60/GY5zVhaDdqq+gj+fmGWs3eqg9NYn8gHFssAKLf2i3GqMzT6QOxoxBVOsNYUkY0cyL1ArDz0R3RHqhkjn3sntj3zu02Jdg1onk3QjujwLy8zbR4M9o4QORsizHpFuk44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129863; c=relaxed/simple;
	bh=QA/oDtTW/MklJzlzkqeDnO3jkZ3ncrUHMklBQka/GKQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=E6OJXo5+pUpllujmrMROkUWr35Q7+s+buQA/BGqyTXLLmhYBIxsbHFWMg5OzrcFx4lzSyEVIaadcgw32YXDf3IhUMCHu0qurZijLSU7luhMrN3M/mON0b6FzU7P0gZuaO70YNfFrFefngdwXGY5VLwOFIU997P/FtCMS98tph/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVVY8IUa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVVY8IUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
	b=TVVY8IUakn4stR7o0i4WX4zMfQKrl+r6nVKEtjD1WQs5rccLCKHIcw1urMIN9LsNQcQWmZ
	c6+jHxLSvBsFWDF/FRs2z+dwJdTtItGUs0MyxFZage03hK8IB8YdH+Cln2wrXMEej4oLnX
	lwwUB9q5xa6clNM9uK6GlEZi6232EuM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-SNbGzehxOzOvZHJKEoiz2w-1; Thu, 26 Feb 2026 13:17:37 -0500
X-MC-Unique: SNbGzehxOzOvZHJKEoiz2w-1
X-Mimecast-MFC-AGG-ID: SNbGzehxOzOvZHJKEoiz2w_1772129857
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so756758185a.1
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 10:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129857; x=1772734657;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8QKOBVmvfZrBhcXhbKXa1XP4Mqh3aZ9oHJhophil2g=;
        b=muw0BYXQquVr+0jOTL6SlR90IwCHPxh9MyUZ+FICnDwWnj35skIbP015UmLqFQLMFT
         +NrThZfddpnnRpI2/f4S77ylTA8aNA+tqCaBHN1NVHCrHDAduUoTpJ6oPsw4CkRTO2HK
         L73Az5sdOpmrRAa96ExwDOdiyL2FMxIYJeaLgiwv+bcF+Fq8DgQoKnKXjRGOwXC333MY
         noU8Xq0wNzNN/gzQikj3bNFue34k2JXYv7Vh04VwoqHkYb+n1dAtJQCb6DNL/XfcXAKn
         rBklejQDcGPzHDNpPWYjii7J0l3bW7/DhFjGO8NLYIPCs+zkDIyt6wVb4WJGPRu2Z0un
         bjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Q2H/dUapQzynayKYLE6BTpaMF7akEZm1fS1rWHJ2rOwWGlxif/NteM76BmvGwJAqFOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YycOniadPKYeWGb9cv0Kmr61WkbDSd13HwXYoIGZARbwCQm58fW
	GbpR3dJULicCCRIYU/2gc0Cpskb/iyhFFDFbf5V2RDlg2xPAozYklNRQfPSmtvJ4cuacarB62mt
	86hbGglHCwMXtzCcH2jhbhyI2JfjnA4zMCOyaSOMt21ht1CjhXBWqIw==
X-Gm-Gg: ATEYQzyWxltacUaRIDqNwJgG4Mc/1G0vkgXaYIWbJ+pY4n+fOjpQrskvmUayZHyC8d5
	rNsD78zozsUT2oPWng60RAorLUQZ+v+clAfaRaAegfDJa5Z4Ygfb+u9loAaXGlnBwwybRaKrq0X
	UnDkDBpgw9AoDfdpvMwmBXsUS5JHna/mjj6+YAzpJfZNy401omz6TxvAPihdpTMH1haiSrVTZpJ
	tMgMDK9vWNAYBqHu92jcPGY9DSXG0fAXnKSAiMvsFWdcvaejcpDNTm6EBBVkbT6Y67oe6mcRHjj
	HosFwRiUtYq1fdj4/40g0T7f/wOHH5mYOTGQfakr8apkDJ01sDd/RK8WINo3C9J02PB5uRpJ6R6
	lBRJshfnM3aXS+kBKI52FV4b2LK/oDl8sAUHmk1IuNs+Y0RX+8fxCU0ScWSgE
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498304585a.80.1772129856796;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cb8ca93060mr2498299885a.80.1772129856254;
        Thu, 26 Feb 2026 10:17:36 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:32 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Date: Thu, 26 Feb 2026 13:16:44 -0500
Message-Id: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNy2oDMQwAf2XxuQbLL8n5lZKDbMnJ0iZNd7cPC
 Pn3ugkUehxJM7qaVZdZV7ObrmbRz3md384D4Gky7cjng9pZBhvvfHbeZ9teX6zoZhfe1PYve+I
 zH1RsrCQuQw9Q1Qz7smifv+/l5/2DF33/GA+2x9BceGvHkd9NqUAhlVYSNybPvgSPEJDFcyevD
 YIvqeZ798+icaWALseCAIJMriVEii4EDtiZRRKU+t8q0LACJWhJEDW52GJpmmuHWEOnSlHJZ/6
 1Kq9q29vpNG+7CSXnDISh55piw5FOSI6jG4vKEiSSF+pmf7v9AG4wZ05XAQAA
X-Change-ID: 20260226-clk-det-rate-fw-managed-4b8d061f31be
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QA/oDtTW/MklJzlzkqeDnO3jkZ3ncrUHMklBQka/GKQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9KnuOuJ6XcNWyYYj7ExcnUvVrhUq6ncvsXXmVDFFv
 53j/0Kho5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkI2TP8FemuVDc3P32hy/BM
 ysTr7yXqj3mZLhXRVJfPLf4vLnrNnpFhzSUGL9VghpOdinWLVOsKth37reYzn+/qAqe3hxxn+/7
 hBAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbxjH2l-uXPRrYgsbRnOgPF-sz8IEcjbK1FsCYKA2h4_1772129857
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

There are some clocks where the rounding is managed by the hardware, and
the determine_rate() clk ops is just a noop that simply returns 0. Based
on discussions with Stephen at Linux Plumbers Conference, he suggested
adding a flag for this particular case. So let's add a new flag, and
update the clk core so that the determine_rate() clk op is not required
when this flag is set.
    
This series adds the flag, some kunit tests, and updates all of the
relevant drivers under drivers/clk to use the new flag.
    
Once this is merged, and in Linus's tree, I can update the few remaining
clk drivers that are outside of drivers/clk via those subsystems at a
later time.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
To reduce the noise, I am only CCing people on their respective drivers.

Note this series depends on 3 previously-posted patches in this git pull
to Stephen for v7.1.
https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
Hopefully I set the depeendencies up correctly in b4.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (13):
      clk: add new flag CLK_ROUNDING_FW_MANAGED
      clk: test: add test suite for CLK_ROUNDING_FW_MANAGED flag
      clk: rp1: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: scpi: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: hisilicon: hi3660-stub: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: imx: scu: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: rpmh: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: qcom: smd-rpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: renesas: rzg2l-cpg: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: samsung: acpm: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
      clk: sprd: drop determine_rate op and use CLK_ROUNDING_FW_MANAGED flag

 drivers/clk/clk-rp1.c                   | 11 +----
 drivers/clk/clk-scpi.c                  | 14 +-----
 drivers/clk/clk.c                       | 24 ++++++++--
 drivers/clk/clk_test.c                  | 85 +++++++++++++++++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 +-----
 drivers/clk/imx/clk-scu.c               | 23 +--------
 drivers/clk/qcom/clk-rpm.c              | 16 ++-----
 drivers/clk/qcom/clk-rpmh.c             |  8 +---
 drivers/clk/qcom/clk-smd-rpm.c          | 15 +-----
 drivers/clk/renesas/rzg2l-cpg.c         |  9 +---
 drivers/clk/samsung/clk-acpm.c          | 14 +-----
 drivers/clk/sprd/pll.c                  |  7 ---
 drivers/clk/sprd/pll.h                  |  2 +-
 include/linux/clk-provider.h            |  2 +
 14 files changed, 123 insertions(+), 121 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260226-clk-det-rate-fw-managed-4b8d061f31be
prerequisite-patch-id: 59198edc95aca82a29327137ad2af82ec13295b6
prerequisite-patch-id: 8932e170649711d7a80c57784033a37faadd519b
prerequisite-patch-id: 91c7b1851c5d77e504c49ce6bf14b3f8b84e826a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

