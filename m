Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046601;
	b=MOwLelyPIK40wAKPT3gl0I+cKchkCkfMSJdDfIUKBK2EMlKtmM0bzJ4iOnKvfVwF3WNB
	 ZfTEREWwhSzz4Hqnv89xTcpxOu6Swkzu4ASutqe/YXmlKTqKva1bZWvZVfePvVHstL4AK
	 qeGwhiBqXu7+0EoqzLj9W/ZsXVYSyy39UyBoIf8MPoBON+QJ5ZQvQUn/EYVJ/IYD1BHo+
	 NTEmkeRFQcqgJI1XV3GxoudsMcIAxbWRe0dzIfl60TP4wZYy2OUVvFgHnEi+YxUgQGWkk
	 s+fu9e0mUD6yvqAAtYSrm8ELHmB0USXBcGX/BWXiz22lKnjR1oONUfFKqKa/zbIi5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
	b=ot1KMv78Qmh41TpNcLFxvjV3VhUemRUm/JYFmsto7qxoKiY576dYHv/sLELKYvuCh3Eq
	 KegzV9q1TEV4WYc/AfVFe1whPTxCNsbiwhvO1MNOEH+fVGp01YH5d70Ut2dpVTOcVOd3H
	 oL27iGJo9KxgYWmm0XVD4+6Xlj5hfyTeM/d3+XIv73EkcoaK3vqm6F6vU5vTESFmt/mik
	 FQqflrFGTa14g4p2C3hLRYCgJdvVoRfXWeRKWuKVyPI5iJH/lXZ09xWJFqnAQTWzs9nrl
	 62XzegHh162GYLYQpN8E2wK5YsKHmDhTC3R1P/whYmJKhnX+6LWMzrAq7/8bExXKpdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XSjepiC6;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CD606EE98
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53CD606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XSjepiC6
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8479f46ecd8so674088a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046600; x=1794651400; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=XSjepiC6MAA5qyjT08pfAMJV/4pC4dCHBtYLDrzigsT7ra2DkY1u3IYv364q+622z1
         defQjiE9ainaifZiOiz0q2DHshOt+KnfoE2lT6tyZnYHNSQ17mdxesuks5ZR09KSzn0y
         U4yAjszEKrco7YCCkAPf93srml/MDllzCJyVYWNHn8u2rnxQ4eBKtRncu6nH5qJg2CsH
         3dvDwuHGICQ5Es6vzAFS+z2e3AsfSg9Ru7qwflVsTMgqvkFte7gEv24fU4PC7vy9t0Mj
         N8lVPySMdtB8Abwz5TdpyUO9hgEu0IXm6Lj/0D0DuEpnoirSmAt/RxIlkDhAoBH3xWBG
         jWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046600; x=1794651400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=2vPLEcbeoPGnI62vyu+NdSI8nfVFD620x9Z1mOQ8OyMRi1Z5xUhYK3FwQ15T5fJJKF
         bIAwyQC88ZAYkKyvSAHUpCvzQnTFz9dsyoGdIzuIzIR/OGj+R85/YD1uG9Nk8g6L7o7G
         QRhGJ6xc5wBZJ2izlKJW5qvdyhD2MEoq68VSRYTR7Asfdt8dexFPXG8Tg83VLNSjeKNA
         Mu+FzfO5IVrtXdfqhhAei68RZdNnTyElThdIcty+01mU4REFRwwXuostvkTDGdJ79X3B
         qlJCrXs6EpKW8OR4iQpXuUHXR4xZqPJGNAioj+4pk68KIKj0HxsVTsaU0ea8KZpYczjj
         ihCg==
X-Forwarded-Encrypted: i=1; AKwUvBxEA6Ywhb57z4bP4D+vuIzTy6OiJoyqI6jdzMDHsNvJd1rW2IKOH+ZbHk/6hNf6WUF7AzE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ctBYHxW5R0oj1RXEChnH84GfeRzr6uhLAJmma41ezD3og1k/+
	2zJf/pMEfYQUUvbmZrsXAd4RxqkO1p/gaxuqRUyvRK1BnVuHpkLMEXDg
X-Gm-Gg: AYBFou1HPYXQJTgND7iR+kuMgu3vkSKmRFU11ygEQdk8eieDkbEMwbb8wy3n/QzY8GQ
	vFyjR5kvAyCr9y93kmY5MsA0Jjhea8zf7O/MzaSioW14AcD6Gh0kIenqLjmDnaj4JdB2NuLt13t
	G0nfGL61tzUSWVW0Hx9z90LgXSol+L0yMs2ZHk6MSFKlqhLF0KxcxzTqKWvRDwoH6ZoHEJV9eOv
	2TkhEwuO4EkmAzXd93/awWqKPAR67pOHU2CISaLdbLhAmHLeQKWZangv1WML5i5t7kejCW6QZsF
	xEi8QYHI3ua2tBQmkQ3IziiN3icGL4A4Dbj3gBOtUePXsTWCiO+zVtihB3T4yNWGf5ozdqOekKq
	jv6wNEZSp5syuId9qDQ1No+YHPk8g02lkhmgRgBif4ysE4Mop90VCFgS14AucwciCAIw6dtINxx
	UR6lpr6I9NU3LjkXmgJHl89Iu8TSjwe3pM1P84z4GUBaiEwbRWehlW25LzMC3dnu3W8ibBLlYxB
	RbrtdmZdcPgjEwhkOpvXD1Ul/ttiCHOVFTHhpt+VI7aA2vdBNSJdkQVyacwPdv3yF6Ozi0fSxzk
	MV0BXMHp9g96aAnlHscbFaqCl1Q9r0guKLhZTeZEdoacIobm+iQI/o8/+fQwn5BWLn49eJIQnhl
	2arLNOUfBX6pjT1UTed2KP/YqVqwUpyCpvi/VnthrFWL+FiYWOHkhD0brRBmWHBq8+6YNiQsSqI
	QKISMXBXnSkULaAJNlnqMiVnZz4D/t9foLM7eGSvyoiJTp6s7fxUG/
X-Received: by 2002:a05:6830:438f:b0:821:94d2:83cd with SMTP id 46e09a7af769-85f1cee4f2cmr4595254a34.9.1794046599688;
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:02 -0700
Subject: [PATCH 05/58] mtd: rawnand: share retained chip and controller
 ownership
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-5-0181ef0cc4c8@gmail.com>
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

Controller drivers need to keep chip metadata and serialization locks
alive after unregistering MTD, without retaining their hardware
resources. Share the name, firmware-node and parent-device references,
the final NAND cleanup, and the disconnected-device open check.

Provide reference-counted controller storage with an initial
device-managed reference. Register that reference before managed
hardware resources so their teardown finishes before the controller can
be freed. Each retained chip pins the controller independently, allowing
multi-chip controllers and embedded chip structures to use the same
lifetime rules.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_lifetime.c | 118 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  12 ++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 619760138d32..7ea275a40fcd 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
 obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_lifetime.o
 nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..9518c9a4bc63
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+static void nand_controller_release(struct kref *ref)
+{
+	struct nand_controller *controller;
+
+	controller = container_of(ref, struct nand_controller, refcnt);
+	controller->release(controller);
+}
+
+static void nand_controller_put(void *data)
+{
+	struct nand_controller *controller = data;
+
+	kref_put(&controller->refcnt, nand_controller_release);
+}
+
+/**
+ * devm_nand_controller_init - initialize reference-counted controller storage
+ * @dev: controller device
+ * @controller: controller embedded in driver-owned, non-devm storage
+ * @release: callback freeing that storage, without accessing hardware
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * storage reference after releasing those resources. Chips prepared with
+ * nand_set_release() hold additional references until their final MTD put.
+ *
+ * Takes ownership of the storage even on failure.
+ * Return: zero on success or a negative error code.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller))
+{
+	nand_controller_init(controller);
+	kref_init(&controller->refcnt);
+	controller->release = release;
+
+	return devm_add_action_or_reset(dev, nand_controller_put, controller);
+}
+EXPORT_SYMBOL_GPL(devm_nand_controller_init);
+
+static int nand_mtd_get_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd_get_master(mtd));
+
+	guard(mutex)(&chip->lock);
+	return chip->disconnected ? -ENODEV : 0;
+}
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_controller *controller = chip->controller;
+	struct device *parent = mtd->dev.parent;
+	struct device_node *np = nand_get_flash_node(chip);
+	const char *name = mtd->name;
+
+	if (!controller->release)
+		controller = NULL;
+	nand_cleanup(chip);
+	of_node_put(np);
+	kfree(name);
+	if (chip->release)
+		chip->release(chip);
+	if (controller)
+		nand_controller_put(controller);
+	put_device(parent);
+}
+
+/**
+ * nand_set_release - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @release: callback freeing chip storage, or NULL for a controller-embedded chip
+ *
+ * Copies the MTD name and pins the parent device, flash node and, when managed
+ * with devm_nand_controller_init(), controller storage. The original name stays
+ * owned by its original allocator. The caller must set the name or parent before
+ * calling this function, and preserve any other metadata used by MTD callbacks.
+ *
+ * After success, unregister MTD, call nand_disconnect(), and drop the driver's
+ * initial reference with mtd_put_master(). Do the same disconnect/put on MTD
+ * registration failure. nand_cleanup() runs at final release, so controller
+ * detach callbacks must not depend on resources released during removal.
+ *
+ * Return: zero on success or -ENOMEM, leaving ownership unchanged on failure.
+ */
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip))
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const char *name = mtd->name;
+	char *copy;
+
+	if (!name)
+		name = dev_name(mtd->dev.parent);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	mtd->name = copy;
+	mtd->_get_device = nand_mtd_get_device;
+	get_device(mtd->dev.parent);
+	of_node_get(nand_get_flash_node(chip));
+	if (chip->controller->release)
+		kref_get(&chip->controller->refcnt);
+	chip->release = release;
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_set_release);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..313e0d88e19a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1116,6 +1117,8 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @refcnt:		controller storage references for managed lifetimes
+ * @release:		free controller storage after the last chip is released
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1128,8 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct kref refcnt;
+	void (*release)(struct nand_controller *controller);
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1137,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller));
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1285,6 +1293,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @release: Free chip storage after the last MTD reference is dropped
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1345,6 +1354,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	void (*release)(struct nand_chip *chip);
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1608,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip));
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0

