Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082214;
	b=xWXunOvSAV9U1lh1mLVAspBvKAszHpyM/qIexcSWHrbnYV6v3qCIn60Har4p5QhofLxD
	 lZUCAh7D7BU1r96lBMIiwhVQJxR/+pHFpvtWs3V2virLM2fHRcS+L8DlP8VtrlakmnHaE
	 md12etUUVqf0dzE/9qH1I238egHmF8AGYkNUna9GKNclX3ZopcSJ8zlv/cvkR0pBqslOQ
	 ZgCPXAVJ+8Nnjsp/lI/rkbxVgUNRVy6JE2mBNZjXTnJHCgURx2ilYnLadIWHrpl/zZJRz
	 M7NhmL+IDzYY9X98JYRI01HPQhTppzUgoNjq2pX9cgw4zIstLqamZLut4tsiw+5oumw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=x4yrtew2ZDFOvfl7G9QVp1nGR2NFcf6e7vJQkaBWyRs9IIlOn5UTryjl11IlocPkB5BG
	 0bRK8K/mIiz9EIX/S2qd8U6Cy3lMa9ke8rIPkeBrwbWDXhed5sQ6lx9ODb9mLoKJxbIoC
	 bF+4SVYmRqFRQCgYhOt5YmUp/K/QBrtoIdLSAAM4xJHqUWQBbN/363P0z+/tKuC6zJtkc
	 IiFMn1nwBnNhq0CgBUtFcEmTk0LIHRWVustauJ/XnK5XtN1CoOqz9oJSeUHGIi4Uh4Lki
	 6YNu9R3Pt+0pL/tXx9+qBdLJIk8EcWqKjkybJa/+W6pZzPXp2FVnqnt4Nf6NId+LFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835AC606D825
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835AC606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49429181ce9so6742fac.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082213; x=1794687013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=sdrLzbqwKegBSREuOyj1quxIZxKP0Otnu2oae3GAACQbKmsf9k3j1FNu/svuKA/ecM
         fdlhNkJdeQzHt5UqziBWQDsM2ipr/fbyeyFeZKngWlLLRc0KsgCEEztEYO7kVC2V0HLe
         ix8Z7+v9aU0wTyVhSmzWDge35urBZ6bcIuGItUo//lEV6MmJ7pbOT0Pv6RicnW4vqr8y
         9FsLhQrT4Rp20qDoK4zS0VNHkQgIZf0xM/sY0Ar13YBczJ28x9IGYCNTt3sm3klispJw
         q7bjX8LE5kvJHkuZIrS9OtFZJGXT/m3F/2nAxGGnroyZ5gdRN8CwRjiTc/do7pcMYgnT
         YTTA==
X-Forwarded-Encrypted: i=1; AL+hErEZDOS1va+HMp/+XFBeHyspvIgn4RsdL8H0TnadlitYnsm/WRI+gtdl1TKhAl8Usr4MPKE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/0z3YceqMqz98UgxS3wr0EeMq7+gn9rT7CF8n1msD5udD1gRHJ
	n6rXsKB/MKaV9tqb37i3s60rwVq+dPTn7hjGjdKDKwHK3FNTrIZ+UnSt8yvfTQGzsOs=
X-Gm-Gg: AYBFou31qiszLL5eyYivIXHfE8SkbmT29NLJjmC1IuUAxrsLs44/tIf6LIOU6Z850Fb
	5wrHvIeDxZnl3pWP7lWuWeVHXMAO157w/kwZa9fHUeaqiJ6nhnURUEIS5zNxMjRr1m/vv77lush
	hKGYY5EYsCq5ky95/5bmJW/U/bFwGFl5s4lRgyvL26wzSF+85zTmHT1Trr0TmFIQDuN3zchDrTS
	N17W1Sz+ESajJs5CoqpxyWLYGD6OaTWbbBV/sqnVCC/M57oGdDVLd1Uo+tJTpksVSxVegNLlINJ
	MiKLnSO2ssMLLTNVoS7uJlQ1bPzmmwyp+z1CYhVFwrjXz4QYNl996xuEm5fW32JsRpy/7xG3Rvz
	8uS5phrLEMy9Ofn1jmiFzp13OJ6UdJ8QX/Dx6hTd/X+owT70mGEqXZyW2SVlhFve9Y7oDa0Pehe
	1K/xS8EFvjhZQ7yWcB+tZkTk902r30byFMo92jwdiVQRAPbtTWEWALKQLOT1QlFw1KRiWjg5U+6
	JKoa2LujZAAxR4MrTKnvWsVvsTF8JRYNUtheVu9j4AbYSBMra6jUBLdpMuBqtrwYiYnCOqA6it/
	70WwTUZZNMkjH12MvbPogi61EPsNoL1q4mqUrjtYbXh8mq11CJ23fhYDLW0=
X-Received: by 2002:a05:6870:4507:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4ad98b59767mr3847741fac.24.1794082213294;
        Sat, 07 Nov 2026 12:10:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:39 +0000
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on removal
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
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-4311be01fa4f@gmail.com>
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

