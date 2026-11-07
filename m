Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046589;
	b=d6IuPoC+/jVwHfMrztMW8ywmQPvqScB/F1AeyZH47XPygv9SYoBur85DHp0Q3XMVyg/J
	 XEs0KJ+8ZPXtapM+zflasI3iy+gxHtSPqgYZ512bDfkGXADa65ak+wnw4X42I0NANQpNI
	 otSJ57w+2lHsjCgalh6sDLQC3f8wFlyec7Onbn9yWnqMhC6SEXGlRgitwS1GBHw9JA0uB
	 MljV23uWCmHSQh3jQyFf0Kmme6dX/xFmOaRDIWVbtuDd840ylVZsLOzJMf1JcPL71XhjC
	 KQWaqP6W3TA1J8BRMJXopnUBMmVHvMx46QOO/6z9dm098+IR+vNfvlgCiHUWZbE9oaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
	b=EkQFRvPpbutOQSzSd3n0hELllrKjkWEeujRrgys0n2DAUSVLgY+/5+pOq0PtLLXfAilr
	 pY57ngNki0llTYiokyLZkq5Dg/eYoVOvN4wyenjPNednEHu1/lrCxIEeM4E4M/tRtWzHs
	 0pyaSoSpTyNNBP7ax2UKG/QriJrcnR+f/8SRq9cnzUtR4ySLZjqcWd8br1KwOlW0kyu58
	 az1rtn87plnu6VMYrYaTQTtQPgH4DFaz69YeGxyDZZXqfy++XqYn1EJraOCR3RY5UC8pg
	 6cuOov9XJ3O3t1NPukuW2D7IQ9H2JyzhkHPSjlFDy6hCrKiNJDTt0CxIuLdpnP5Gaug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E38m5IMW;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94412606D824
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94412606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E38m5IMW
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-82109f51565so590237a34.2
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046587; x=1794651387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=E38m5IMWdtIN3m7Kb/LaoQMKW1Fz1h2Mp/7LU9PS08BMsY1gOgYr6n8nOl2PDG7ia7
         y1bB7Fojc+YzMVV3uxlOaUwQQdW9R2DlnZLqfVI50tKMzKRVMASO/w01cnFzWl482RsC
         b2KhDrgzKt+jofY3sReq75BCQNfFVh8nhhAeiVB+7eYUKpGqsVzNgcysU3umEw7Xs+Lg
         94TFVoW573BdjSMHMXLte0F75UpbCbT5HTd/I0zmY2t7aXU4WVNZeYX8radk722HupsC
         lhbWbAhh2efdFa+dp324a6R8C/2gEMVmEyvdhuf/GCx6Ja3Osnv4fLAAnukrzdVgwZmi
         ACnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046587; x=1794651387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=W2pjWEtp1naQGPYUib9Gyf9WzJnV2s0ZIMpm4qyO242P0lgzrw+RsVUCzYAKYsWoyp
         rLZCwRocriqW5dFgAe6B1yvrssy5z3lEOgNF9KwDWaI2BP/dFNkNst2p/+ya+VlG0puX
         PIMcBOT2nRgAYirLyZRzS/B8Ywy5nTpImyQnjYuqJVlVvOqTKL/80Uwz1QsRP5Z9l+uF
         hJbxD711esp14pVidffz63qVYSWGUEHjUkui39MyEX9VmnaNZ2QVgCPWZpN1q7pkcXj8
         seR3bR9GBBYdug5Xa6ROomx1wvMjJDiV4uAc+SKKe4tEiVFb5tGchb4mUPysh9BLHuBY
         K/dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXaHSqVmMjZoq2PtqQ+eUbAjaApq2weqxcfT3p/oNYCndjvMh9lLr07FayVaLXx33BpN8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+88p9wC0tSdu5hQ/VsG8uFpL0A/qgjHMLDHMaTPzkEa0tlzB3
	XQEfKvkFCnB1K1MJrJQBmGjU21u9/O5mMhzJL1oXkp2e47prgAyVcT3T
X-Gm-Gg: AYBFou0zasdNcm1z4pCvolmB2tUK4nJDGymDiuSWgP1S7gU8jaoYKd75C7hokVgPYMG
	SAReC/NAGAcu3/2+Yav3zu1n1uKqo5VzEz9KbfhLu1sNXy0SC0LQld1jgwqUlLElz0PCMGgDmoO
	ajd8it9jw/ctOmi+LjHnI0EfGSX7oK5FtR1vcHgs/glcYyrOO3crNwm78OVRhDHskYc51TAtr6r
	BvXfT2zSI8t5kZ1/X590goXWVX5+lS2p5IJBgrlQkQlArWuUJvn0eqRGBFfjWreWm4d1DUeipQV
	zoWlLKsEcXebXMtxtZd+FHoQYiOKJo7jdbCvqgYPC24VTGdax4uvZ5CQMafauNIEvOLUdjzFIAZ
	DxqT5W5pteSdvN8Fb7S/Rv0B6mGEByqEWWR6cZhYAVAgzbJSl2P2SevDIFs6UMDKkUk2xNT4Da0
	yr8iWqGs1T7zqpoqH+xJkfOQy7HfYmpa8IuYtI2u/j4TBq9TpkqZ93lVdR+JkAoEe1WwDUUL/AE
	+7oO4vyvNQyYxbPo0Twe6wvJSZm5H3DxCWXrSdAYsuhujH7hxJ6VGHyTMdYdrUneMkdeLTseZlO
	bqofw8hJlIiDiTQp5NFl5doyRLEBeT4TqvJtV308OLSLGzZBwVDwc/52GqCcmX8FG6pvamOjZIl
	rLKC9DiUAziyNl07INV7P+q9pdlqsr6ylr+Luk3ZAC1Wfj4wI3Bk9xGVzHgaNCyBGnEE9xr053I
	zoFp4QiWWRin/MMlPnABipsGWExTF5HBPgPYCJ28lh8StX7FsfTYWc
X-Received: by 2002:a05:6830:4101:b0:844:4959:e856 with SMTP id 46e09a7af769-85f1cf2dfcbmr4924112a34.11.1794046587358;
        Sat, 07 Nov 2026 02:16:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:58 -0700
Subject: [PATCH 01/58] mtd: clear OTP provider pointers after unregistering
 them
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

If factory OTP discovery or registration fails after user OTP was
registered, mtd_otp_nvmem_add() unregisters the user provider but leaves
its pointer set. mtd_device_parse_register() then unregisters it again
while unwinding the error, accessing a freed provider or dropping a
reference still owned by a consumer.

The same stale pointer survives when the factory OTP error is
-EOPNOTSUPP, which mtd_otp_nvmem_add() treats as success. In that case
mtd_device_unregister() can release the provider a second time later.

Centralize removal of the OTP providers and clear each pointer after
unregistering it so subsequent cleanup cannot repeat the put.

Fixes: e0489f6e221f ("mtd: core: fix error path for nvmem provider")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8efa2d88556e..558a605ba749 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1016,6 +1016,14 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
+static void mtd_otp_nvmem_remove(struct mtd_info *mtd)
+{
+	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd->otp_user_nvmem = NULL;
+	nvmem_unregister(mtd->otp_factory_nvmem);
+	mtd->otp_factory_nvmem = NULL;
+}
+
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 {
 	struct device *dev = mtd->dev.parent;
@@ -1082,7 +1090,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 	return 0;
 
 err:
-	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd_otp_nvmem_remove(mtd);
 	/* Don't report error if OTP is not supported. */
 	if (err == -EOPNOTSUPP)
 		return 0;
@@ -1180,10 +1188,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	if (ret) {
-		nvmem_unregister(mtd->otp_user_nvmem);
-		nvmem_unregister(mtd->otp_factory_nvmem);
-	}
+	if (ret)
+		mtd_otp_nvmem_remove(mtd);
 
 	if (ret && device_is_registered(&mtd->dev)) {
 		err = del_mtd_device(mtd);
@@ -1210,8 +1216,7 @@ int mtd_device_unregister(struct mtd_info *master)
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
 	}
 
-	nvmem_unregister(master->otp_user_nvmem);
-	nvmem_unregister(master->otp_factory_nvmem);
+	mtd_otp_nvmem_remove(master);
 
 	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
 		err = mtd_virt_concat_destroy(master);

-- 
2.53.0

