Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020618;
	b=xDqzPufbvfIJia4BPjSVtY0K/k4tOcgLfq0Du5lrKDd7Xgkzhd1b6oEAtDvDV+25M+aB
	 AKsbh6NLT6Khgmwzp6H2PXh/FIoQMbFFvo8ICH/WhtVuI9r9RBdtp9k2Af6GDJLIW3FIJ
	 CYgrdx5BzU62LnvvS5hwwqEhD+58vOEiDSkbuzh6+gVt98V1t9iGTCan1P6cny08Kv/vU
	 ogLxwFKDg4sOF7PiuHJd/VBjqzVI/c8fAIC2sH4rrzFKI8L97cPSlyjfMI9kYrNYhS2DV
	 7LNyqKbVI0FQcj7JCZwRH1D6bEoQE378R4nccKVCe+FDrvzKNpTSVwXeFRtNvOUew0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020618;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=;
	b=4+/vXYZzBM39woQENRjabgrviknodpWI0jRb1uKJVleD14f5qo6SzMnTOjAjEhD8Zu/L
	 EJOpvgyuuidru1wQ8W2O5xagzs7S69msRNvVhFwU0iyy7ZZ1cm3jo65wVh4lWVNMYbg8B
	 5FhSkikdXQ5ACjj2uPgEJKPNGaPWX9a+KWPoJnWPc6CsUqT936HOqqBX3UJjNQAO+a82A
	 ukuDFRJVGPaJkQz+B5G/uI8FcvKlOjN9hYAyFvMonoLgJPvxcLfLxG7UrYz4z7Jp5xAaE
	 lIj8JCaC8GhFcZMnS2JKMd1s3Q606nByne5E2Lnm8Q4KQeURXUdzmo1VMCzDr/Tl2CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qyeIgh6x;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34164606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34164606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qyeIgh6x
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB776C4F77E;
	Wed, 18 Nov 2026 16:50:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D361B5FE9B;
	Wed, 18 Nov 2026 16:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4478111BC2883;
	Wed, 18 Nov 2026 17:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R32+wDXxmTkP/gEthbKPhXatwdXsuuJxCRpBzoKrIWQ=;
	b=qyeIgh6x4ucm581lP0wWMexA6TrEj93OPQsjQOtKh6cJMzVQqPmftSOFwNfsW2koNJqOoo
	691yiSD/OV7ZSjB9GRNmXfh5btzuiU0TQWUlhvhNorDkEr9MEdUUwWybZVKg3m6f6Bj25i
	6YGj9Pk+JygO7QNYfSnMxPjnKS4GmlXnxPaTrLhy5D/xtm2eHa4ZS5VaMQbKtC6GPhjlpy
	ZHwXv28T16Q52CdVqdM1evEOtYTyF4fMvuA9XTj0uPqj2KQTGRfPJ9x6TmY/vHc3DS2jSi
	nHutQ9+ri5P1r9Dd66wQKP4T+ZN3CxzPJzM6MHoXzBL+mZEXBuAydKuYb4cTZw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:45 +0100
Subject: [PATCH RFC v3 02/31] drm/display: hdmi-cec-helper: add non-drmm
 API variant
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
Message-Id: <20261118-drm-bridge-hotplug-v3-2-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) add a non-drmm variant of the CEC adapter
(de)registration API, with an explicit unregister API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 60 ++++++++++++++++++---------
 include/drm/display/drm_hdmi_cec_helper.h     |  6 +++
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index b79c41703d53..81b271659ad9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -67,15 +67,8 @@ static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *c
 static void drmm_connector_hdmi_cec_adapter_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
-	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
-
-	cec_unregister_adapter(data->adapter);
-
-	if (data->funcs->uninit)
-		data->funcs->uninit(connector);
 
-	kfree(data);
-	connector->cec.data = NULL;
+	drm_connector_hdmi_cec_unregister(connector);
 }
 
 static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
@@ -83,11 +76,11 @@ static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
 	.phys_addr_set = drm_connector_hdmi_cec_adapter_phys_addr_set,
 };
 
-int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
-				     const struct drm_connector_hdmi_cec_funcs *funcs,
-				     const char *name,
-				     u8 available_las,
-				     struct device *dev)
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
 {
 	struct drm_connector_hdmi_cec_data *data;
 	struct cec_connector_info conn_info;
@@ -125,9 +118,8 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 		goto err_delete_adapter;
 
 	/*
-	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
-	 * drm_managed_release(), which is called from drm_dev_release()
-	 * during device unbind.
+	 * NOTE: the CEC adapter will be unregistered by
+	 * cec_unregister_adapter().
 	 *
 	 * However, the CEC framework cleans up the CEC adapter only when the
 	 * last user has closed its file descriptor, so we don't need to handle
@@ -144,9 +136,7 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	mutex_unlock(&connector->cec.mutex);
 
-	return drmm_add_action_or_reset(connector->dev,
-					drmm_connector_hdmi_cec_adapter_unregister,
-					connector);
+	return 0;
 
 err_delete_adapter:
 	cec_delete_adapter(cec_adap);
@@ -160,6 +150,38 @@ int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_unregister_adapter(data->adapter);
+
+	if (data->funcs->uninit)
+		data->funcs->uninit(connector);
+
+	kfree(data);
+	connector->cec.data = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
+
+int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
+				     const struct drm_connector_hdmi_cec_funcs *funcs,
+				     const char *name,
+				     u8 available_las,
+				     struct device *dev)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_cec_register(connector, funcs, name, available_las, dev);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(connector->dev,
+					drmm_connector_hdmi_cec_adapter_unregister,
+					connector);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_cec_register);
 
 void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index fd8f4d2f02c1..7e76a163e3a5 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -39,6 +39,12 @@ struct drm_connector_hdmi_cec_funcs {
 			u32 signal_free_time, struct cec_msg *msg);
 };
 
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector);
 int drmm_connector_hdmi_cec_register(struct drm_connector *connector,
 				     const struct drm_connector_hdmi_cec_funcs *funcs,
 				     const char *name,

-- 
2.56.1

