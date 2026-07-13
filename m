Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3233FE36
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955092; cv=none; b=gjxZMJ0mnW7Ek/FFwukbUy6BEFWb5UmSunpfMl0KBg5xPgdoi5WAXXQo9Em8b5miMr9nApmN735CvDK0RUNDj/sQvDnUdpS4h/gRle9Fsj9igUAe/ccDluPsR4ClqlQZleG4LgesU/83+0tAr1/2gIoMI31hXpzNe7Ki5m7YwjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955092; c=relaxed/simple;
	bh=fVlB055JR14n6vS48L1RZLQm+AATuuwoP6ITnDTBiIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nL2CPSMQB6s3RApq0C8RQjOSGmfm3jLVQEO76grjeiLA5a3bFny1Z7fjGy1eNn1S0MMfvPZ+3Td77Y2tQkoPyHQluFIEdcEVbKDVDmo3kS99w7zpJE/uQhbU6/WuaEQXmssWsRmWlIhyxD8/oxv9mqnmdf43wwEoG75wMr7Ln9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=HQarINlR; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="HQarINlR"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdWbFk5dfgCFrtTumGsxzlaKJCNHfWv89PeF9IkFsqU=;
	b=HQarINlRbM/Z8ihQ/RvYvIBbV6FtOPF1NPa8mm1lsumIXG9lIIE0aWXfqlqv0xKzoJO+ni
	yMP082n0fawLy6eU1go98w9iI/s64zF4Qq9L+cMv6x/oOuEc9RblBQ3oim0vSxfzXUBYyM
	J10WIEdQCRj/3iq0zzHOiItX2r6Oy0wyttJcNElt3lAw/xKW7LfAAWysFTDJ7ut8ZNBtOl
	vQ7iqcFyy23VeLt4mo+UAhluWgpKhPI4Dw1P4Phkdnt31K6HmIEptIxtdhKqIVIfz7yWOl
	pL8XrAbQmYvHBQWGY5EgttYqCN78hpJYca+kz2QGIS9leYVvLS0QgkLpYN1cog==
Date: Mon, 13 Jul 2026 16:53:39 +0200
Subject: [PATCH v2 03/10] firmware: imx: ele: Export API functions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-3-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12738;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=82aWrS74faGdiktevUv+md5sBCcaZfTuW2ECsJQUTOw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT+CErJvijkatgWIu61sPzZLk5unP7nps/lH8yBz7C
 1KiLy90lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATGQuDyPDW/eUwC3flj3OWb2M
 u/EfC3fqp54lZ39OXZi7QHLuo6VNhxkZDrSxer163TBB8nvdRqt5LkoflzZWFFdyOZ78+T1kNdt
 kHgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Export generic ELE API functions to send and receive messages. This
allows drivers to implement functions based on the ELE API.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 47 +++++++++++-----------
 drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
 drivers/firmware/imx/ele_common.h   | 15 -------
 drivers/firmware/imx/se_ctrl.h      | 14 +------
 include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
 5 files changed, 136 insertions(+), 53 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index ec718d322abc..69e70fd6a0d3 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -8,6 +8,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/genalloc.h>
 
 #include "ele_base_msg.h"
@@ -79,9 +80,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return -ENOMEM;
 	}
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
-				  true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
+				      true);
 	if (ret)
 		goto exit;
 
@@ -93,8 +94,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	if (ret < 0)
 		goto exit;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
-				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+					  ELE_GET_INFO_RSP_MSG_SZ, true);
 	if (ret < 0)
 		goto exit;
 
@@ -132,10 +133,10 @@ int ele_ping(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 	if (ret) {
-		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.");
+		dev_err(priv->dev, "Error: imx_se_fill_cmd_msg_hdr failed.");
 		return ret;
 	}
 
@@ -144,8 +145,8 @@ int ele_ping(struct se_if_priv *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
-				      ELE_PING_RSP_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+					  ELE_PING_RSP_SZ, true);
 
 	return ret;
 }
@@ -169,9 +170,9 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_SERVICE_SWAP_REQ,
-				  ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -189,8 +190,8 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
-				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+					  ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -225,8 +226,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
 	if (ret)
 		return ret;
 
@@ -239,8 +240,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
-				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+					  ELE_FW_AUTH_RSP_MSG_SZ, true);
 
 	return ret;
 }
@@ -265,8 +266,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
-				  ELE_DEBUG_DUMP_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+				      ELE_DEBUG_DUMP_REQ_SZ, true);
 	if (ret)
 		return ret;
 
@@ -279,8 +280,8 @@ int ele_debug_dump(struct se_if_priv *priv)
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
index 76bd3841acfc..81f3057aa7bf 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -3,9 +3,24 @@
  * Copyright 2025 NXP
  */
 
+#include <linux/export.h>
+
 #include "ele_base_msg.h"
 #include "ele_common.h"
 
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
 int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
 {
 	if (!header->size || header->size > MAX_WORD_SIZE)
@@ -155,6 +170,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
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
@@ -239,8 +269,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	complete(&se_clbk_hdl->done);
 }
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api)
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api)
 {
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
@@ -285,6 +315,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
 
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
 {
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index bdc13d1b715d..792b0c6d9dae 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -28,21 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api);
-
-/* Fill a command message header with a given command ID and length in bytes. */
-static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
-				      u8 cmd, u32 len, bool is_base_api)
-{
-	hdr->tag = priv->if_defs->cmd_tag;
-	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
-	hdr->command = cmd;
-	hdr->size = len >> 2;
-
-	return 0;
-}
-
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 7f9b0d199cfc..70a1ba369a06 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -7,6 +7,7 @@
 #define SE_MU_H
 
 #include <linux/bitfield.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/miscdevice.h>
 #include <linux/semaphore.h>
 #include <linux/mailbox_client.h>
@@ -73,21 +74,8 @@ struct se_if_device_ctx {
 	struct list_head link;
 };
 
-/* Header of the messages exchange with the EdgeLock Enclave */
-struct se_msg_hdr {
-	u8 ver;
-	u8 size;
-	u8 command;
-	u8 tag;
-}  __packed;
-
 #define SE_MU_HDR_SZ	4
 
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

