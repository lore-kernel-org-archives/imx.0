Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF140759D
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157308; cv=none; b=CedzrnAyz2vjgjcgK10SV/BWDZh4RmObpiWVl2OHLzkq0hr5lJwUdgURgQtFkJfoEA2ZtPuPePW+w8UQXqx8AdoVzz2bpLo7xg2XyAf6fLeVECK2oz7Gzzsrli1SMEs4K+wpVTVUohVnXxjzvRy21pALhvi6IiTiG00r/iaLuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157308; c=relaxed/simple;
	bh=+ZPiM//4lIGxRvpupe6jIkm5VqvPAXmrdCFoiWFZuXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taNWPyf2RNA0pT/PZhg4Hodlh73Y6iVjTSmQ4rNtXtDmde8fd6yg38gANy2neanin7IFA78xjP8/ZBsAvLPfyPjMdw/XQZZyscHRwVlVNGHYuMvHQ1xk1Sp6SP8gQhjOiMzRfxbOXRFxD74H5uBoSsFhKaNF2ni273Crz3aSFa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=AoIU4udc; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="AoIU4udc"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3ty1n3pB66/J0W8hWvA8Cri+8z31CFZgFbeFSf27es=;
	b=AoIU4udcVtrvloL0RAUojzM9mVJGcwtKEARhov52yCu9wo2oPByV91TNb1H9IoH+AlA7AR
	FvxxxwhJVneFRZeqXbGWjHJgHVFUcmACeTaqTz3tv6qcCmOOBYjcDjd+3qWsEQ3Noc/iWW
	q5d4rnTw1LyrAmP87yL+tFkMfXXcQMkGjha9Oo1D40sZXuM05zy9a/C8MrzkkDSSVdHYUq
	EYvaub9OmiV3phMbFx/1xhb9pjokL2H8biyPTALyQS8/qWgHlWF3UUuwPALlTKJ+Bujz3m
	unl3wJmTkpU3V3x9D8WulWsEt3X3Xf3knJyiv7XLIXVk1xWjLUDecqvtUrtRtw==
Date: Mon, 27 Jul 2026 15:00:46 +0200
Subject: [PATCH v4 03/11] firmware: imx: ele: Export API functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-3-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13673;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=9kYctPws8ziiBjjJl/zAI3aZm7jEa0WQaazitIF1VVw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNWKp6t3ZYhs6rSIibtdWrnhXGvW8juP9ywVzavZE
 Sl4Qn9uRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESYaxj+Z3v6aIUXPhddVrbt
 b737Uv+dDDZ2s0PPHdwgpty72vfbToZ/tsVbFy15UlX5hL/eUrUn0ts248Ry4/muKtoXvnr1ZfS
 yAQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Export generic ELE API functions to send and receive messages. This
allows drivers to implement functions based on the ELE API.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 42 ++++++++++----------
 drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
 drivers/firmware/imx/ele_common.h   | 14 -------
 drivers/firmware/imx/se_ctrl.c      |  6 +--
 drivers/firmware/imx/se_ctrl.h      | 14 +------
 include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
 6 files changed, 137 insertions(+), 52 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 28b835f2880f..a4ab45efdd63 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -8,6 +8,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/genalloc.h>
 
 #include "ele_base_msg.h"
@@ -106,8 +107,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		}
 	}
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
 
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
@@ -120,8 +121,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return ret;
 	}
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
-				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+					  ELE_GET_INFO_RSP_MSG_SZ, true);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -156,16 +157,16 @@ int ele_ping(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
 	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
 			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
-				      ELE_PING_RSP_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+					  ELE_PING_RSP_SZ, true);
 
 	return ret;
 }
@@ -196,8 +197,9 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+				true);
 
 	tx_msg->data[0] = flag;
 	tx_msg->data[1] = addr_size;
@@ -212,8 +214,8 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
-				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+					  ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -248,8 +250,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
 
 	tx_msg->data[0] = lower_32_bits(contnr_addr);
 	tx_msg->data[1] = 0;
@@ -260,8 +262,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
-				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+					  ELE_FW_AUTH_RSP_MSG_SZ, true);
 
 	return ret;
 }
@@ -286,8 +288,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
-			    ELE_DEBUG_DUMP_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+				ELE_DEBUG_DUMP_REQ_SZ, true);
 
 	msg_ex_cnt = 0;
 	do {
@@ -298,8 +300,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 		if (ret < 0)
 			return ret;
 
-		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
-					      ELE_DEBUG_DUMP_RSP_SZ, true);
+		ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+						  ELE_DEBUG_DUMP_RSP_SZ, true);
 		if (ret) {
 			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
 			break;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index fbb6e584341a..f9c56fd42af0 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -3,11 +3,26 @@
  * Copyright 2025 NXP
  */
 
+#include <linux/export.h>
+
 #include "ele_base_msg.h"
 #include "ele_common.h"
 #include "ele_fw_api.h"
 #include "se_ctrl.h"
 
+/* Fill a command message header with a given command ID and length in bytes. */
+int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+			u8 cmd, u32 len, bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_se_fill_cmd_msg_hdr);
+
 int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
 {
 	struct se_if_priv *priv = dev_ctx->priv;
@@ -261,6 +276,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 	return err;
 }
 
+/*
+ * Send/receive blocking call for external drivers, operating on the SE
+ * interface private data (the misc device context is resolved internally).
+ */
+int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+			void *rx_msg, int exp_rx_msg_sz)
+{
+	if (!priv)
+		return -EINVAL;
+
+	return ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, tx_msg_sz,
+				rx_msg, exp_rx_msg_sz);
+}
+EXPORT_SYMBOL_GPL(imx_se_msg_send_rcv);
+
 static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 				       struct se_msg_hdr *header)
 {
@@ -402,8 +432,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	}
 }
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api)
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api)
 {
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
@@ -450,6 +480,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
 
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
 {
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index b63a3fbf087a..8f0739960d4d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -28,20 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
-
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api);
-
-/* Fill a command message header with a given command ID and length in bytes. */
-static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
-				       u8 cmd, u32 len, bool is_base_api)
-{
-	hdr->tag = priv->if_defs->cmd_tag;
-	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
-	hdr->command = cmd;
-	hdr->size = len >> 2;
-}
-
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 3c14964830a6..53f252d2f111 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -911,9 +911,9 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		"message received, start transmit to user");
 
 	rsp_status_err =
-		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
-					cmd_snd_rcv_rsp_info.rx_buf_sz,
-					tx_msg->header.ver == priv->if_defs->base_api_ver);
+		imx_se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
+					    cmd_snd_rcv_rsp_info.rx_buf_sz,
+					    tx_msg->header.ver == priv->if_defs->base_api_ver);
 
 	if (!rsp_status_err) {
 		err = se_dev_ctx_cpy_out_data(dev_ctx);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index af7738ad76cd..76082e8b977c 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -7,6 +7,7 @@
 #define SE_CTRL_H
 
 #include <linux/bitfield.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/miscdevice.h>
 #include <linux/mailbox_client.h>
 #include <linux/semaphore.h>
@@ -95,22 +96,9 @@ struct se_if_device_ctx {
 	struct kref refcount;
 };
 
-/* Header of the messages exchange with the EdgeLock Enclave */
-struct se_msg_hdr {
-	u8 ver;
-	u8 size;
-	u8 command;
-	u8 tag;
-}  __packed;
-
 #define SE_MU_HDR_SZ		4
 #define SE_MU_HDR_WORD_SZ	1
 
-struct se_api_msg {
-	struct se_msg_hdr header;
-	u32 data[];
-};
-
 struct se_if_defines {
 	const u8 se_if_type;
 	u8 cmd_tag;
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
index b1c4c9115d7b..90104ecaaede 100644
--- a/include/linux/firmware/imx/se_api.h
+++ b/include/linux/firmware/imx/se_api.h
@@ -11,4 +11,82 @@
 #define SOC_ID_OF_IMX8ULP		0x084d
 #define SOC_ID_OF_IMX93			0x9300
 
+/**
+ * struct se_msg_hdr - Header of the messages exchanged with the secure enclave.
+ * @ver: API version the message conforms to (base or firmware API version).
+ * @size: Message size in 32-bit words, including the header.
+ * @command: Command identifier.
+ * @tag: Message tag identifying it as a command or a response.
+ */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+/**
+ * struct se_api_msg - A message exchanged with the secure enclave.
+ * @header: Message header describing the command and its length.
+ * @data: Command or response payload, sized per @header.size.
+ */
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+/* Opaque handle to a secure-enclave interface instance. */
+struct se_if_priv;
+
+/**
+ * imx_se_fill_cmd_msg_hdr() - Populate the header of a command message.
+ * @priv: Secure-enclave interface instance the command targets.
+ * @hdr: Message header to be filled in.
+ * @cmd: Command identifier to place in the header.
+ * @len: Total message length in bytes, including the header.
+ * @is_base_api: %true to tag the message with the base API version, %false to
+ *               use the firmware API version.
+ *
+ * Fill in the tag, version, command and size fields of @hdr so that the message
+ * can be sent to the secure enclave.
+ *
+ * Return: 0 on success.
+ */
+int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+			    u8 cmd, u32 len, bool is_base_api);
+
+/**
+ * imx_se_msg_send_rcv() - Send a command to the secure enclave and wait for the
+ *                         response.
+ * @priv: Secure-enclave interface instance to communicate with.
+ * @tx_msg: Buffer holding the command message to send.
+ * @tx_msg_sz: Size of the command message in bytes.
+ * @rx_msg: Buffer receiving the response message.
+ * @exp_rx_msg_sz: Expected size of the response message in bytes.
+ *
+ * Blocking send/receive helper for external drivers. The transaction is
+ * serialized internally and the misc device context is resolved from @priv.
+ *
+ * Return: number of bytes received on success, or a negative error code.
+ */
+int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+			void *rx_msg, int exp_rx_msg_sz);
+
+/**
+ * imx_se_val_rsp_hdr_n_status() - Validate a response header and status code.
+ * @priv: Secure-enclave interface instance the response came from.
+ * @msg: Response message to validate.
+ * @msg_id: Command identifier the response is expected to match.
+ * @sz: Expected response size in bytes.
+ * @is_base_api: %true if the command used the base API version, %false if it
+ *               used the firmware API version.
+ *
+ * Check that the response tag, command identifier, size and API version match
+ * the expectations, and that the enclave reported a successful status.
+ *
+ * Return: 0 if the response is valid and successful, or a negative error code.
+ */
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api);
+
 #endif /* __SE_API_H__ */

-- 
2.55.0

