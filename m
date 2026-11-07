Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082385;
	b=nbygo0c1DKLyHYd2TnQxQo31oMVdV7X25xnrCqXC8guR8g3efVYjEGIKWpnjUG/eGyaQ
	 TEzNCJn106pjmFwvgHO5mExQTk8XajGRPvbBxrsXkXfxh9e5J+Pdv/XDRe7hbgXjZkA8l
	 82JooX/WJv9q//A1YQ1K88iHe0bAienfpEnlDcCzsTa7b4VgWSxpCbeFN9+dc5eayUO69
	 iwYuqb3jiy908c7XGXLIinRkw2XwsP14V4lc+tAwbIWelBXg+mMIjbqZzi234vZ9d1Hdz
	 /qpWbkcVZvmFZOpnLLliozqoJqnuocDOG8iMXHZ+ZLmqFHhH5Bqrd63PfbfTahQxQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
	b=jzXZJSgVIzzkbKu5bJQh1gLoQFYgPdov5LmrYFt0X78L1jNfOv4cKL5MxF19Zo6oMsrs
	 buVz6NM1XwpR3CebZto/iozgJXJRCXkgbfcUZZmf8vAR8fSrwzRjmPUFhrXtiLO/Idz/L
	 iaKGq+lDlVNlA29HLAmuJ4NrJEnhkUD5Eu9TyBnX34Etz07YwTLza0i7NA4AVWWF4bUwv
	 QsmmLz6pxj7h+IdYNHSal4dTHAiedHqQ0M/78yXR2oaddSsUq3UFkWiDoNpeTSdGF86ym
	 CJaA6mfpG28ncnT+TrJypY3CfG3vaQ6nnAskbao39nCLMioqhp229/4ypStVMfvEonQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA25606D816
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA25606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4d7034a99a9so4941b6e.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082384; x=1794687184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
        b=RhAYXnvwizreXG4ME8W1diSLoqBHrPsTutQyD2JGGOIpzsGAXh7rMbMGpSf0AI3PIX
         9U0FthF5TOOqS4WYdCm+faI3c2PHkwdS+ggCZwGmXHBFg6f8UzyL3mvQb4zOfJx/Er1o
         gjG/A/Fi1Gt9pXyFhYcb8ChDtPniYM9yBzkJE9RMf70j3WdQk2drQy9N7qdfYqTtFl+N
         nRZwbYLjIhMeXI7TNgh3uR519LF797xiwxGtgWd+OPHcxq1UfoAvByJ0PT7a3jlDNxd5
         2yMRHzOKtqjyT3aOFD4bPzqKzHVYC9PCqIbrseFlwc6cIe5n7C91/99OjyqCvGMDF6E1
         1H3A==
X-Forwarded-Encrypted: i=1; AKwUvBwncc4QWQ+SNvBR4uTQJhXyh0IKg+SbY9DB1cVcrNpKLJqOeEBhpWubmZgPlAf7aT8v7hc=@lists.linux.dev
X-Gm-Message-State: APuU4Z84byhXdgWHbNTjYAJYfat0LEZT8dWHrHckznt8L4Iqv+VziZ8N
	ZFbZrtJlg10So35BkIFmhnbPPDMfO37orOLTbC6PwIzuR+aJ14ua72e9z3UvhvrSvLk=
X-Gm-Gg: AYBFou10C11awYYy+1uFPZ8dKsn5zCXwtf6Mi1vgnJ1213L4vkSPomdc2aboK4y+Vhw
	adtnp0VNMlh/gFVWEvv2mAtocHF7BAwkgnu3D/25dnk3q0UjN8D2pXYNYvCC9iDqRkZuoBehhi5
	fyZ7KXtHZIpVQOJszUAE1HoecAPOkUlb1NdX1nTAmngUOFHnOvkqF10td/ZYk2tfiksXQTJl95K
	DrOP5yJsR54LFg/IF0Mv2r5vZ1+7i6DyI0h2zq1gtMZRcQPcrxOfxK+Ixpvgkk6P5kOcSQnFW0M
	PKjVd55deHE2Jz/IlZrbR2zRxTD0myHwk2iXJCMfUfdOmJeSszigR/lLGBhBvtHtae+SByB0c5M
	Zn7h/gisafIR9S7kn7Lib+QH+LH8We1NvA4NAMQQBWsP/3WPIMgcET6bLVc4FewTYHtcOflADB0
	Aj54oC8VZXh5z6Lq7WRNwuHY2RSX4T4JInovRuj0LoYWeT7+BecMa8+16eM4qKMnhvLs+e9ONri
	t69aTqdxmsW9+VflNeTJuXQmj32PdmF7cD+24riiUEmjUJZuojHFwDhqnCy4d+m42f8SNDFCyPg
	mCCg83OZ5X6gDr9FNgzgbRO+h3BQ8sgmKKaC1X2J+2J9neybCJU8lNd0ZOhy
X-Received: by 2002:a05:6808:238c:b0:4f1:c824:fd06 with SMTP id 5614622812f47-567e14c28c5mr4851806b6e.14.1794082383637;
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:28 -0700
Subject: [PATCH 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-31-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

