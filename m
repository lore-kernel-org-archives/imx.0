Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046603;
	b=r049jLoOGPan2HoxZ8MRijvISxh90IHx/0XdeRolPLx5MBuDaLuADkKa+s8gk1uHXnkb
	 84/ehbFU401faMbNDdpV1sNlSsqI9PuaQZeB486VDl2oLvLDhY9PTb3++pvWC++b7DYOD
	 6piwP4uSaM5TMCZ68Y++uXf3puZOaA1aJwZ+94qrxkHfvFM+AfgZGxXmY2jzm/k3E0WVo
	 8yI5G1xJZ4atp+INBWa8aFus8NYGRGI9WuLB5nlsneaCtvVpg571y56hi/EMGjtuTzja8
	 TQIUaUoWeSQbzRZBS3vS6gXjw+o0IFTx8Hx8uDSdNHxypEeSr+C3lMWcPL5WK5c334Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
	b=R2mdyaCprJyw9KVcWfe95ctoSG5jVmV1lhkFZ8nqVZMiXdxy3cAeVcziILm1NSeJ+ACF
	 mI/LZhCGb9IjEPNwBE6oWI1lM5Swwp1Fld9MDZCSu0BfG8w9WZ3KVVMRZoOZXzMKu+kGL
	 wN0UCL6N8f3hnduD9huYJOKzFQksMlsFImv5M4/R55yWa6H3p6+Hee4NqTaywmBB/egPL
	 lHCSxYTqyYikCnR36thwaDTPWSEcJcFfeZuhrigMKlYxvI1E+z0RtthqudRYJiPNp8SKM
	 Eel2kdBKdrGF6gFzgcmrNsrf9TAk2MiHcN8+MIo9lQxKytQeasUjihYJzIAod4Gl6QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSXtP4uW;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFB606EEB4
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DFB606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSXtP4uW
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84e513877a3so369773a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=qSXtP4uW7dR++z1y8mKjJUptWz4JZTgqIxt+bUiwnH3TCex9Eo1wHD7BTQMtDDIJEg
         X9fg8HnXTNCMulWuY6SL2AqRdy6lNtnAxPpAk7u+vbuFDMNBNNKx5tkaXWJDPtXdMgfo
         SmACqFZrygyawf+b6nU5mAQzlJBvaqrN2p7PmuNf/OgA214GRj0INkfvfGRtpHfq+wZh
         hbiKY3wf781kC224AxCiskPzFR7h8HqLvFHHoeRQ6CIOeEpZbgDS1QCeOY1SjrDeAv5a
         fFOe5Hw0ZpoYkQKb4paGd45fBXoWyJUAqmuXXjhracq1CU0AvFNz5+CdW1k0aHYGatxu
         GhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046602; x=1794651402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=mDRcJX8v0kdayrj7b/12hAVhC3v58URFtJPQarfXZmPxwydg5DIgPL0Yse4LgWGFYT
         VQAccLwPmuF7ChlyN8+vekL2p5H8n03CtsMDr/0RqNs1rfbJYcYuD9EwqbEwQNRzCO3A
         W+8GLPle3ZVmXX/lgymWgzlKBdei/lnFrql8cRIFxLa7YXF5mgrNOrMNjdILYDfif7lZ
         8UAsSdrIfQNeeDdMg9zCxQKyLYzWHwoD+GOtw3hLkmL+a2gI00MHulxYvVi8l9/wufm1
         8aHlhmRfibpQS9hwiEAJUrENQuGgZVfXYu+EeRVRDLnIzGioF3+ZmXFGl2pxfXvmOIw3
         6fNA==
X-Forwarded-Encrypted: i=1; AKwUvBzavu7ceIzjkq1FmG67ycYohJTffjuVsXBexmzDp+dMaGwV7XzwuT4S4E/KPEEB7IKSCHE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GHFe7j5pMia1y1SHhvmd04yjQcep2ASzhD0xuzf/GMFAZjL2B
	h0+fIunExC8yUZeniVXHMgh0+7LfeP2BCVaD61IHGjpOVTDtRLXKhVzE
X-Gm-Gg: AYBFou1FG3SXJ2RtTpZ7ZPp26rkPftIB6loMrXJNBRl2NqAyDXtAAwYmgfhwIyfCgXM
	2qiGWj0pJ/psHxykfbNOOclalwIlqolcmmQaVKSWhcIOOFIvrdtYErC14RSvj4Ez/cKymL3DI5i
	LYfdPEBQmg9GJj4RtZ4duoO0O4LktLE+vv9iev81S8UumdqxANjo0EQbCBoDuo3ohhVtwlTbDdm
	TcDlYoxMyRJ8N1SzZ8zRA4dMPttdjjOhOvWdhPJhGcUngFGC+EGJnRXVu5SClQnmyAVWw5a1TF2
	jnrCGRA2KwlZN33/r3yJjhKJhrBy3x1m+PKuVi9uVBLm+RYhTETd/GYxEjC+fAtT8LK17GjzpIQ
	zh2ffNegLfQ/VKjKEdXS1i0zb/Z9ePYX0RS+eqb67vuhUPzhWm0PPE1adUAGUsdGhhBwgE6MJR6
	Q3D7b7AbISNAVFUa/tTyChDKJqBfZuiCfU9ZyC8lmkig0Ho5fUnVK3yBNyiPTT+VbvjThUXHwtq
	v/3KLBlCPvKGkAAm6tRAOdrnx4+vj8R3b+qV4o2wltvf1MdTnY952BgfJjTsMkpZvCSWzAe6fzv
	9VVd3CF2kOzKnsN/WigOTO+MSV71BArrKsSSIurQEMPCRjYtb47VVhA4m4dTSMBIjlMociL3sqO
	Lc7UOHGkukd3dX6M2pdT8hljVOqVauar5tpBaO/iAZ6siEqXsThu5N5+zSBs1THW6J8xlya+sfD
	qshS/pH+sn0yYDXZewPqcf40TEjoDgGRvMngMf6l7jEz+c1Tc3rohBVbXfYrzqa0HXs+IDda4yy
	w==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

