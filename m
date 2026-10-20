Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489023;
	b=Y18Afi8sEfmEDe6zUVSvzhdC7obyxg/dGirlpSR/vg6b/kuuVw5v2mNV9BmJ0XN38YVY
	 Bh5BCVlHQhlKlVF1U71Q+blcA4KAfG5k6jFORlwPet9KVmSonJYs9oiqTLobqwGnoWyjs
	 eaxLHnVOIN5X3WpVdkyaBwvhXGjyIw998GBEaISxbVfJhEbWhbpfL0YoKPVvNMar31wIq
	 nUFiOg+FzXTDNiOF3qL/IeCgw5IUPMi8ofKTB+lAvhGcsMoQZLUvHehmdYzzOk7ARIQcK
	 u6BQUeLvNa10e5WUqUm8nHcrswAGzLZAQrwgwqpczyuvY5YVJ5xnIqHdz3Z/m+NdgdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489023;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=J3R/yD9txiKhDcdkpR168UOWMiy5EvmjNi1jSQMpyTg=;
	b=vnX8d1oKWNWShYObjprPgHDiTKDfN3xuKn+IGKQZslo+rI+QGYl2EbcZecKHCB8iku99
	 5zQf4Fnju9+KcZUu8/Lhko83U5mHigVkPxk9hchMKxc4Yz4TS4aY7M+I7sjzChrmXETgF
	 Z/13FA761dJAwSoYXNB65bBsxHPHJHlmtFr0zIn1BM5H/D8hhdmh48z733QRolLD23wnV
	 ibLTK8TnMmTXRiwJh6J1XYLSj96FYRTq4B8CeKrDXAU3wjgcQg8yjkqwZIbTcwRwACEL1
	 dDCXs9KNlOyXRkKc/4QcUrqEbUiPALSRcxoJfyqexHoHvKJqwMQJSMZUm9LjZijk7vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Japwh3Kf;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF0606A32A
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDF0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Japwh3Kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=J3
	R/yD9txiKhDcdkpR168UOWMiy5EvmjNi1jSQMpyTg=; b=Japwh3Kf6G0uYqhpEZ
	LW22YhLSZ2jVThdBByZYXRcWi3i6HfE2WMHbfKFjnAUR3BMGCGbcO40RrlEv0gsg
	/5ENuYM4Xo8AJp0E7SN1jD6Mc1g3sM//+IWoFF5pkXCQJroBAPQtemaAynYbC3/m
	d+mdgDB36u9gDcoklHYl8Xfeg=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S3;
	Tue, 20 Oct 2026 17:36:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/3] bus: imx-aipstz: reject devices without match data
Date: Tue, 20 Oct 2026 17:36:33 +0800
Message-Id: <20261020093637.1654161-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020093637.1654161-1-yaojiale02@163.com>
References: <20261020093637.1654161-1-yaojiale02@163.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD3_4ImNtdqupV5Aw--.29320S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr1ftrWfur45ZryxXr4rAFb_yoWfKwc_uF
	Z5XFyxZF15CF1Dtw1rt3ZxZ3yakr1Iqrn7Xr4xtasaq347Zw1fXrZ3XFWrCrZ7u3WIyFZ8
	Gry7ZF4fuwnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8qhF7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wkoYmrXNimKSwAA3P

Platform driver_override can bind a device to this driver without a
matching OF entry. In that case, of_device_get_match_data() returns
NULL and imx_aipstz_apply_default() dereferences it.

Reject devices without match data before applying the default
configuration.

Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/bus/imx-aipstz.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 83371e5b35a2..9f74cbcd47ff 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -61,6 +61,8 @@ static int imx_aipstz_probe(struct platform_device *pdev)
 				     "failed to get/ioremap AC memory\n");
 
 	data->default_cfg = of_device_get_match_data(&pdev->dev);
+	if (!data->default_cfg)
+		return -ENODATA;
 
 	imx_aipstz_apply_default(data);
 
-- 
2.34.1

