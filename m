Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B54357CEB;
	Mon,  6 Jul 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350059; cv=none; b=H5aiTL8YilDd/HNX4Ax/CU6EthExSclnh9Yv9yCDLre1rR9Q/ZwseAs1Xd1EG5LUhYk4ign12pHv5bY9+lZk7LsKcsP0uQWvqgEvbWX02UShoIKE3ZUfzqDg/CLLWcUzDBy/NfNQRjnx0O488tV5qVZjB1FJIH+T5cUKWX5ZTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350059; c=relaxed/simple;
	bh=p1aQrkcPN+fQivXMMQmK09YEeUqcBajsiU+odNVohdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ce00f0LygI0U0p2paSfFheI1JBSCAu+fuCsd3q/xsiPwADkhY9K7WGxbYFaBYjyE+uv6LWyBuQj1JpZQ4Cmtm6BRzq01DCD5AiHE/r6+ryk5xrPNUrTEUDP3XktbeChMRKX+UIFOKQsqU3iKw+ICjIQNsjzxk87mTPCvQlDZaZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uuIwb48o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uuIwb48o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBB51F000E9;
	Mon,  6 Jul 2026 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783350058;
	bh=ghC5E/nQqDUgC7b4pTVEjkxiYLeyeS4p6Le3XE4+ohU=;
	h=From:To:Cc:Subject:Date;
	b=uuIwb48ofsluyBJR6qvm8nhk/jruSTDVi9Vg61sRo34q7yWXdxnVz2iG0KCzotvBI
	 IQMYrs9eQyCyjdSQS+LyF7mD5FgrEAg+iBO43Dl+t5NO7EAWLIW0jZaWtEt2XnvoUx
	 wmbTMjQ1ekthqiCYJK7e/cYsyk44mdrKu64Yk2pI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] soc: imx9: devm_kasprintf error handling
Date: Mon,  6 Jul 2026 17:01:11 +0200
Message-ID: <2026070610-regime-badge-e99b@gregkh>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=TqmVo1HzTj+zEIzqsglcgJcQoMrHfo9lGn6qW7K8IT4=; b=owGbwMvMwCRo6H6F97bub03G02pJDFneh82i/puevb/Ilaetb73FH5Fs18PfUl69/P+BY438N ak3W7uDO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiSaIMc3h3Bz1i6v8Y86y6 0urAQlcJH28XJoa5Uj2R7M0ztxyOP7Ce0d73nW3FRkl3AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Griffin Kroah-Hartman <griffin@kroah.com>

Add error handling to devm_kasprintf functions in imx9_soc_probe().

Assisted-by: gkh_clanker_2000
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soc/imx/soc-imx9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index 58eef7d4f908..23b54b7d7502 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -35,6 +35,8 @@ static int imx9_soc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
 	attr->family = devm_kasprintf(dev, GFP_KERNEL, "Freescale i.MX");
+	if (!attr->family)
+		return -ENOMEM;
 
 	/*
 	 * Retrieve the soc id, rev & uid info:
@@ -52,11 +54,18 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	rev_minor = SOC_REV_MINOR(res.a1);
 
 	attr->soc_id = devm_kasprintf(dev, GFP_KERNEL, "i.MX%2x", soc_id);
+	if (!attr->soc_id)
+		return -ENOMEM;
+
 	attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d", rev_major, rev_minor);
+	if (!attr->revision)
+		return -ENOMEM;
 
 	uid127_64 = res.a2;
 	uid63_0 = res.a3;
 	attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
+	if (!attr->serial_number)
+		return -ENOMEM;
 
 	sdev = soc_device_register(attr);
 	if (IS_ERR(sdev))
-- 
2.55.0

