Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E03E5592
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791748; cv=none; b=aVOgtMn2ohWjGJD+sqEfZL5Wk1P/B8X2OCxWdUQ/SCShdBmuOP6gBwJ4ZgdFFP2RU/pSZ/3yrBmCgYNW/UTKYEafVXuzO3rpZBv+7P8JRTz3+rwgg7alBqJm/B0JK3Gx1lBA7O6keqRtC3YQbgiwoZh0B6iorHfFeru3pBowhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791748; c=relaxed/simple;
	bh=DvBLMFFMqhjcK/mtSmBXrkd1pVaKzFZPX4BOh+/c7bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuoXY5FUKEfsmz49obRh9X1WItR9nXzP3DHgIjQy0+3s8aiTqDgdUKx8lxxSqUZB1Gxhcra6bmOCxf0oyyxyd/zTsO3XyOdjnOzBuB9OiBYI1bk8ZrTAkyg5OXPZwoifGYL5dy60cvucOcogYuU1rVXpL0JKeIuCgHg/sFoEiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=LjzTFWvG; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="LjzTFWvG"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoQzTXuDuiokYI38jvyMnODPwxI+8Eexv4gmNuBhtXI=;
	b=LjzTFWvGOuzRHTPFYRuFYgr0XqFX2t2IUDZyykula8CQX/8UVSd1ZnukoMLfXSJEABPYZX
	VPNrWzcZXQNHobQ6ALYzIpedRzvMrV08L9gzuy6FXFEpyo1EbeP4jfrZArfe0Zn7Dz8Fry
	rnsZCSdaCz2T4kfqST3EmQl6BzVmPAbyip8DCdIHL5Y5wX9CIoLYk4XlP5bZzZuwHAAxpt
	iO78tdUeXhjPZYFQH63urgA8HSqj2QsVbfgWONUH//g0Gm3ojowP2yrlYhnHpsaZZxfSjG
	1NOc5jiQC/kX125iQTxBSt4l2OAxiLYhFNX8tKcB0z8qtouhfZkSxllvAp2Q0A==
Date: Thu, 23 Jul 2026 09:27:29 +0200
Subject: [PATCH v3 07/11] nvmem: imx-ocotp-ele: Support the ELE API
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-7-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=8311;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=bexM75HEGaMazdG9kbnGppPaWEavFDTLd0QOTQKGZD0=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0LaueSq854IvM34Ltk882LN9TYPIwY333cUlNl3v3
 f9jrYx6RykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETOuzH84S7/OVN7Uk3il5zL
 3ItXnO/UXFTaYX6Ecffqg4Kn1y98O4nhD+eP6bHnhTlWb9JKiNqpGrtzun7bXplXE64sm5p+0Xr
 mRwYA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The fuses inside the Edgelock Secure Enclave are currently not
accessed via its API but through the FSB block which provides
limited access to some fuses.

The ELE API allows us to access all fuses with read/write
permissions. Therefore use it as primary method and only fall
back to the limited FSB if the ELE API is not available.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 178 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 47ee6bd176a3..6ac7d588c4bd 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -7,10 +7,12 @@
 
 #include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/if_ether.h>	/* ETH_ALEN */
@@ -45,8 +47,113 @@ struct imx_ocotp_priv {
 	struct nvmem_config config;
 	struct mutex lock;
 	const struct ocotp_devtype_data *data;
+	struct se_if_priv *se_data;
 };
 
+/* ELE commands and message sizes used for OCOTP fuse access. */
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_READ_FUSE_REQ_MSG_SZ	0x08
+#define ELE_READ_FUSE_RSP_MSG_SZ	0x0c
+
+#define ELE_WRITE_FUSE			0xd6
+#define ELE_WRITE_FUSE_REQ_MSG_SZ	0x0c
+#define ELE_WRITE_FUSE_RSP_MSG_SZ	0x0c
+
+/*
+ * imx_ocotp_se_read_fuse() - Request the secure enclave FW to read a fuse.
+ * @priv: handle to the secure-enclave interface.
+ * @fuse_id: fuse identifier to read.
+ * @value: location to store the read fuse value.
+ *
+ * Secure enclaves like the EdgeLock Enclave manage the fuses. This requests
+ * the FW to read the fuse and returns the value reported by the FW.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int imx_ocotp_se_read_fuse(struct se_if_priv *priv, u16 fuse_id, u32 *value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_READ_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_READ_FUSE_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_READ_FUSE_REQ,
+				      ELE_READ_FUSE_REQ_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = fuse_id;
+
+	ret = imx_se_msg_send_rcv(priv, tx_msg, ELE_READ_FUSE_REQ_MSG_SZ,
+				  rx_msg, ELE_READ_FUSE_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_READ_FUSE_REQ,
+					  ELE_READ_FUSE_RSP_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	*value = rx_msg->data[1];
+
+	return 0;
+}
+
+/*
+ * imx_ocotp_se_write_fuse() - Request the secure enclave FW to write a fuse.
+ * @priv: handle to the secure-enclave interface.
+ * @fuse_id: fuse identifier to write to.
+ * @value: value to write to the fuse.
+ *
+ * Secure enclaves like the EdgeLock Enclave manage the fuses. This requests
+ * the FW to program the fuse with the given value.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int imx_ocotp_se_write_fuse(struct se_if_priv *priv, u16 fuse_id, u32 value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_WRITE_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_WRITE_FUSE_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_WRITE_FUSE,
+				      ELE_WRITE_FUSE_REQ_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = (32 << 16) | (fuse_id << 5);
+	tx_msg->data[1] = value;
+
+	ret = imx_se_msg_send_rcv(priv, tx_msg, ELE_WRITE_FUSE_REQ_MSG_SZ,
+				  rx_msg, ELE_WRITE_FUSE_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	return imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_WRITE_FUSE,
+					   ELE_WRITE_FUSE_RSP_MSG_SZ, true);
+}
+
 static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
 {
 	struct imx_ocotp_priv *priv = context;
@@ -73,6 +180,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	u32 count, index, num_bytes;
 	enum fuse_type type;
 	u32 *buf;
+	int ret;
 	int i;
 	u8 skipbytes;
 
@@ -93,6 +201,19 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	buf = p;
 
 	for (i = index; i < (index + count); i++) {
+		/*
+		 * All fuse registers can be read via ELE. If the SE device is
+		 * available, always prefer it.
+		 */
+		if (priv->se_data) {
+			ret = imx_ocotp_se_read_fuse(priv->se_data, i, buf++);
+			if (ret) {
+				mutex_unlock(&priv->lock);
+				return ret;
+			}
+			continue;
+		}
+
 		type = imx_ocotp_fuse_type(context, i);
 		if (type == FUSE_INVALID || type == FUSE_ELE) {
 			*buf++ = 0;
@@ -112,6 +233,32 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	return 0;
 };
 
+static int imx_ocotp_reg_write(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct imx_ocotp_priv *priv = context;
+	u32 word = offset >> 2;
+	u32 *buf = val;
+	int ret;
+
+	/* allow only writing one complete OTP word at a time */
+	if ((bytes != 4) || (offset % 4 != 0))
+		return -EINVAL;
+
+	/*
+	 * The ELE API returns an error when writing an all-zero value. As
+	 * OTP fuse bits can not be switched from 1 to 0 anyway, skip these
+	 * values.
+	 */
+	if (!*buf)
+		return 0;
+
+	mutex_lock(&priv->lock);
+	ret = imx_ocotp_se_write_fuse(priv->se_data, word, *buf);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
 static int imx_ocotp_cell_pp(void *context, const char *id, int index,
 			     unsigned int offset, void *data, size_t bytes)
 {
@@ -138,8 +285,10 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct platform_device *se_pdev;
 	struct imx_ocotp_priv *priv;
 	struct nvmem_device *nvmem;
+	struct device_node *np;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -151,16 +300,40 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	np = of_parse_phandle(pdev->dev.of_node, "secure-enclave", 0);
+	if (!np) {
+		dev_info(dev, "missing or invalid SE handle, using readonly FSB\n");
+	} else {
+		se_pdev = of_find_device_by_node(np);
+
+		of_node_put(np);
+		if (!se_pdev)
+			return dev_err_probe(dev, -ENODEV, "failed to find SE device\n");
+
+		priv->se_data = platform_get_drvdata(se_pdev);
+		if (!priv->se_data) {
+			put_device(&se_pdev->dev);
+			return dev_err_probe(dev, -EPROBE_DEFER, "SE device not ready\n");
+		}
+
+		if (!device_link_add(dev, &se_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
+			put_device(&se_pdev->dev);
+			return dev_err_probe(dev, -EINVAL, "failed to link to SE device\n");
+		}
+
+		put_device(&se_pdev->dev);
+	}
+
 	priv->config.dev = dev;
 	priv->config.name = "ELE-OCOTP";
 	priv->config.id = NVMEM_DEVID_AUTO;
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
 	priv->config.reg_read = imx_ocotp_reg_read;
+	priv->config.reg_write = imx_ocotp_reg_write;
 	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
-	priv->config.read_only = true;
 	priv->config.add_legacy_fixed_of_cells = true;
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 
@@ -169,6 +342,9 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 		priv->config.nkeepout = priv->data->nkeepout;
 	}
 
+	if (!priv->se_data)
+		priv->config.read_only = true;
+
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);

-- 
2.55.0

