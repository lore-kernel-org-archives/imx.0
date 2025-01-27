Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC5201025;
	Mon, 27 Jan 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982012; cv=none; b=CU9lvRNH5VsH9scTopWFx47LNX18kKpuQ0XQm1IT9finNyk/IY6gf+A9lH4bM56G1jbVp662mAy+nnOWFd4uBLoqtQpXmVAycfDWX/7oCgeXJR2nDOvYlGBOxDJ+1xTelvhOc0e7zZcDa6sHeXyBd50kexmG9bgZyEpiDd6zlbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982012; c=relaxed/simple;
	bh=RduU4fzm2S8yXhoNskJ0+TWDY47QJ0ZCJVc8mKi6Q6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6NnS8dCO21qWcwuGsgaIRBNLWfkIPY+N9sU+gJidF6Lmbf4hrMG3Em59wYjkCQ4toO6JKAmCVePzahJ6AnVWxUzCmylX3CnFV7p8oK4iqsyBfQLW7SzTag/RTCPlCJjT2BUNsMC9jG3r672M4/lxeL03g6cPM1MtWfWPun0H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJCX+m2c; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJCX+m2c"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2490247f8f.2;
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982008; x=1738586808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=UJCX+m2caz8M4WqJ5ucmji0eXEcGT4CFjv55nJ24oZGIt56Cou/ddzplyqvF/08l6E
         LX0ORgqHwPzTMNovm+PZW9C1QhU1rz9JkU33FN26GzARcth8xaUOExxQoeWHhKM5IH73
         MGp4fIJNVZg67xV2R9jf4B7reqGwH/Ws2aP++B+d7dm5rIXc+hZVTs1KqvGEaRA0oQZn
         yTt49ndqnJqYgNbfjO0aTqB8Jd1QSU+seMkTTP2swc0I81AD1UGQWk2G1ml0cthdjCFb
         h65X4ils9Ht1UgfaOEWaXDdbKyZq10xxCLViZ0Lp9SPRjgHP4DRBW4sChINJQ+DIEsKh
         pQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982008; x=1738586808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=Qh8L2ycdIOJ9s27GkgvL1U6UGDaaQ/kn+iE/PILw8TBL7Pqfy0BT5jILFCU57dpgpx
         3ATzwXtLE12suHin4ivHje3SuzEb33z4UijASfzXN+b37k5LeezwqxMD5OpljbgNep7G
         I0lU8evrKlAvW1uW1TC7L2G0h4tOfSQn9CeAI31PT8JUB1CpwoO7QShcKC/ogoa0lEth
         pcKQvfkmLsat7Kuyd+zPSuvA+aG1FVEHQUVUtkqqp2hXEvcNk6uSbLFAdMY7jJnti6QW
         6cGsRRDfStvj6k/f7lKRR5HtOfRueP/PhLohKvrD8sqfTgmDLUgztwgJXhsDwJY7lJTf
         arTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAQ4wm/H+2KcBDNXeZdhYfh5eIwV8+MdZMlbs6+IR8DaXwCNjUoQQJlQumHv438h+vcwI=@lists.linux.dev, AJvYcCXXB2zqkicMeQqFJJK4kwzDcTobn4g6a+1sLTAnf3PPa4z1FcZ4truWvUpZ/TguoNgFensfiQE4UhrlJak=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVu7oeP9dcnPo7ZGfv/zlwT9aTGMYbJSDDoFVX82T0EBtH8lqe
	E0ddqy3q3fTfabEC+4eZZ/Izhcn3txs23NFlYnlars8cgnSFfaZs
X-Gm-Gg: ASbGncvQ8oXFP1vDdqkG3eyQv0PtsLg6g4jkmKSVWPSuJSG5JcZXSyp1UzQBkaFQA53
	3BV/fg8lrUV88rRU/XP7edxirWTfxJPqmOLEA8nkGUAAaNWlCHWfH15ytaUXokCb0CavzI4erLg
	xstp1B9UZPdExjJaZuP/CXGaL2033IgqVGMTGSBbDXlkxCqb67tyxwwlfI1GQ9G/g3S+jzWv6ga
	gkZ/0lTE31obfvMlf4+R7kf4enJLi/wolMNMWjNpndWORtl5vrorA8kWRVXqiTRl21KuX4xSONp
	FxOo
X-Google-Smtp-Source: AGHT+IHsX9fH6pHzf3bCE6qbXfxbIlFTpPyDWWHgJOqmqyR1gPb9ILP3sU12vqEYpKUdafd4H6jDhg==
X-Received: by 2002:a05:6000:2c2:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-38bf57a9599mr31959724f8f.42.1737982008403;
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176538sm10795823f8f.8.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:07 +0100
Subject: [PATCH RFC 12/14] ahci: pata_imx: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-12-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RduU4fzm2S8yXhoNskJ0+TWDY47QJ0ZCJVc8mKi6Q6E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Asu66s73cxW3afxzdcBdIOeskJ4QvLePjmL
 oaiUlkSOWqJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tS73EACMRajQZc8Z1sdLWV/SZIXg7nYvK964ydiGMezg7pqnDcMaSYXnamkue4xk8YysWf76r6q
 rAIFBZxGxVa72BcdpYNyoxdGNBJ5f1QW+OTmmg9LRSUVFNAeA13SfgT3pIw7CTNB1dnliTzbSR5
 GS4aD7UnS0Dh3GpOdzcGelDLJtR+sc/OXaK1viecqgLA7ZJ3++U/18rFhwQzukJSzGdjNkKaTse
 sxLzAtXw9ol/+193Zcxih/qbp72pO6avHOcSiZh4LQYHDSxTxQ1hdD91bLM3lx7CwuUU5SbCMqe
 EE4ztvnAjkzJrPcixcsE3l1WLe9bZ5xwYSGUj9Rdw46fwKSObdpfCMcZEoaL6lc4axzOoAxfDVU
 hCBda18r0bikrIbRH64hrz5s//Evqw1DgvyqglLbLNHTxkhXCd1ge+4KqHDqizV/kHtTQBzHdV9
 Qq01VP9o4MFgfHJZmAFp0wHEmo3MlL5C9u/irRELaCBV2FXJ3sa93XxO6SWDALiWzv0dbJ7sXgL
 P/oB4FwJKL+02n0knMyZWDG0Hb4bG+1N1i7GipLIzXLx4YaivcE4dX0nzXPZWx0PHQrTcPNIeaX
 r+U1dlYiTSU4v+XAjGJTkDKy9N8YZVv4PJkrbfgrLQzZ0Kmxjrqu7nMTaeAqdUYlqeK/8YjAelw
 FUg+FQ0FzBVVD6w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/pata_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_imx.c b/drivers/ata/pata_imx.c
index b37682b0578f48ea9d51a103d19e40fe91c4729f..533de2782c37fb21bba4e4b8361c48c0f2878175 100644
--- a/drivers/ata/pata_imx.c
+++ b/drivers/ata/pata_imx.c
@@ -201,7 +201,6 @@ static void pata_imx_remove(struct platform_device *pdev)
 	__raw_writel(0, priv->host_regs + PATA_IMX_ATA_INT_EN);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pata_imx_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -234,9 +233,8 @@ static int pata_imx_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
 
 static const struct of_device_id imx_pata_dt_ids[] = {
 	{
@@ -253,7 +251,7 @@ static struct platform_driver pata_imx_driver = {
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= imx_pata_dt_ids,
-		.pm		= &pata_imx_pm_ops,
+		.pm		= pm_sleep_ptr(&pata_imx_pm_ops),
 	},
 };
 

-- 
2.48.0

