Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489078;
	b=Gl+egK0ATxheKjJa8HcRzCMEKJsNhj+5mmejovdeuIDbvYQ0W7/kD8PFn5ibNnqqI6m5
	 Zi7yTaiji1WxNLFddji7iVN1PR1tcLnp0LIw1xUlN3FzfTTPTqk3UmCHHj2gc3niN/0SC
	 AZGSejQIFHZK3gKvKPKJCS86GvqshV550xOyWa1q4bNIoPi+vipt9Wlk+bBe1gO+ycVLk
	 kH+WfNhkvh4A2AKyq2dtR2O8pWdVDvoFhfvFmG96J7/e/AwMAYtthLcDPG2MMQI5mNz3b
	 VqUljpQhmgF/s9Ul8eAxADuSazYBnrkkbyPh3tx3I3Lh43kANgRmKnssqYBLmgkCqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489078;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bpU4pmX+9zma9b0HMHe9OtZavzpqVSsVuDamqHfqBOM=;
	b=D+x4r77VSS5mw18NG0W0NbK52dX1Pje7xslC0zlD6yHX6jCwFBaNDK3TPW5vnBcIcapj
	 s5OFHFFFrNw7ZRbYT92mMD/nmoEOFKnebfGd6ymlEYnSWJeeDjKfliY1NCCJN1wqj0Fw6
	 weAk75JnuU0m1zylk1MNWI4BTBa7SNEcRSN36ugrA59vct3yG7xxhqyk7JIC7aI9H4XUi
	 05FlqWlm0HCGCUsiBHHbyvl8WSBV79IQmrAmzwgwYAORQFC5ygDg9yTc/MgOzdFGgWN2D
	 mh/8r2vP3dqaLj6LI6xoEOnednfLOJE6ih0qjKesnEYvBDs9po+Cj16XNFuhnVgwVHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mS31Dw1N;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6C606A31A
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mS31Dw1N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bp
	U4pmX+9zma9b0HMHe9OtZavzpqVSsVuDamqHfqBOM=; b=mS31Dw1N3PrN7zkDWi
	XwyomNptkrkBuly/amAqP+WmRRjI0TWr6DiJCqezSo/4vO5krC5Hr14I+iaRjKZK
	8QUVvFId3VA5yksxyZaF7ownrnZOx5VlX3RQovkSrw7Dr3GEqQFTWeF31QyQJ63m
	tFyyo8v6sP8oRkT6BduT0JPvY=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S4;
	Tue, 20 Oct 2026 17:36:42 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Huang Shijie <b32955@freescale.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/3] bus: imx-weim: reject devices without match data
Date: Tue, 20 Oct 2026 17:36:34 +0800
Message-Id: <20261020093637.1654161-3-yaojiale02@163.com>
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
X-CM-TRANSID:PCgvCgD3_4ImNtdqupV5Aw--.29320S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw13XryrKw4DWF43GFWUXFb_yoW8JFy8pF
	40gFy3tryUWw47Gw1UAr4UZFy5uFs2k3yDKFy8uwnY9r95tFyDXryFq345u3WFkrZY9a13
	tF4ktFy8Wa4UWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzmhrUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AsoYmrXNis04wAA3G

Platform driver_override can bind a device to this driver without a
matching OF entry. In that case, device_get_match_data() returns NULL
and weim_parse_dt() dereferences it while configuring the controller.

Reject devices without match data before parsing the device tree.

Fixes: 85bf6d4e4b10 ("drivers: bus: add a new driver for WEIM")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/bus/imx-weim.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 87070155b057..3ecad0e453cc 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -205,13 +205,17 @@ static int weim_timing_setup(struct device *dev, struct device_node *np,
 
 static int weim_parse_dt(struct platform_device *pdev)
 {
-	const struct imx_weim_devtype *devtype = device_get_match_data(&pdev->dev);
+	const struct imx_weim_devtype *devtype;
 	int ret = 0, have_child = 0;
 	struct device_node *child;
 	struct weim_priv *priv;
 	void __iomem *base;
 	u32 reg;
 
+	devtype = device_get_match_data(&pdev->dev);
+	if (!devtype)
+		return -ENODATA;
+
 	if (devtype == &imx50_weim_devtype) {
 		ret = imx_weim_gpr_setup(pdev);
 		if (ret)
-- 
2.34.1

