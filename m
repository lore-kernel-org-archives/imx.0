Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE236C9C5
	for <imx@lists.linux.dev>; Wed,  6 May 2026 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059431; cv=none; b=FI8Z6Vq/yhQWvVa8gDsv3RDo3nHt8MC9X6qVoqZqiiK86D4pPoYPhWjABdW8wl1BZ/nAsZKAquu1XO4IIIy4HS3GiXCYaUJTfY3muEMAEWRa3cz/HFuI3nC/ITO6Qx5jrgoEeNLzyUsk/1TVkOGjy2aPS99i8pOdiMVA4JwvFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059431; c=relaxed/simple;
	bh=/JlcOXBa4uakAjtW7+ZH++g1+Oe2RazEmev44gZjRLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2BFVzy69jAjIQE08SSbL6UteQPwp9FAkM00UJ+jkfK1bN5FKpm7yFQalRYWXjO1zCID6AdiaD0XqmG4W+Gr11G4MDuFhfLadMwhLIpzRxkVTrgY/UYaeQ+TvWWSjvviQJKSXwjI6zLn44ghBtS6QRsiz+p7h5DjZ7+LaXCjIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pX0zQCl9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pX0zQCl9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso5021702a91.2
        for <imx@lists.linux.dev>; Wed, 06 May 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778059429; x=1778664229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//nou2Qb1FnpkEvM0SdcsiAXuxlLxSwwu1Tjy8/lIKE=;
        b=pX0zQCl94u0YuEPpXaQ+xwlvJjQCiNK0FgPWNSHGDEfoj61DdlqZdskMoxnHmPRdJr
         HVUh4E/BkAocnKtrzYGFP1gPTFEa3uRPXx4wg681Oo92d05SxPLQ8TrH8BnXxNJfeRAC
         WvIcpPniYWuUUr6HLcorAt6NKptTotQM3zeemMCnFfmutmyseto9JlU7nCw4Hz3e2zTR
         ZoeEm6LqRxW3yYcuNca1iUh0Ro+WbwiYlhoOJdRhnQY1N+LR0Y58Uf7EuLPT4GnA7szs
         O02UW58qXJAcXpEQGFdn3CeT75Pf4RZ3l3pXblyR9V6rb+WC6A0brQk5dzJGkHFl3pN1
         OKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059429; x=1778664229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//nou2Qb1FnpkEvM0SdcsiAXuxlLxSwwu1Tjy8/lIKE=;
        b=eJyK8/T4N+1Am+i572F4XOU3zVH8DJSMG8S7YgympE5TwzjkhH6vQwz13F/dCqhqbE
         VkrZ3x/LcIMjlHFNTy8DmOEB6K94VR2ReNPhSgEovTo7kiRcQVn6uTsuti3wXTqXW6CL
         lrfk0TGLFh4cmkOMyXbOKFD7AQkRldEKpJ2KCV8RlG6iwFCI49ewmkL0CmucgXbNvPWh
         Rqp5G0c/K23g65Zkya2mSzm2KElOEemz7AnjjLWe/LOV4GcTTcZN2Cg7SDN0jOZKeado
         FYnRYqR5hr+cQaRvyqEHPWjhG7+uRxqPF+/bRXYw9+cqnEb0fkp1jIZ21yNH1okp+2JT
         D5bw==
X-Forwarded-Encrypted: i=1; AFNElJ+SXomw1XI57wncc28B2ZUe6TPG42pzS8tVcYVlc66EVhLvZvtqAZxISUpb9z7WtEBQydI=@lists.linux.dev
X-Gm-Message-State: AOJu0YygHr3glsiLqMt6GI0jmMnx8ZPD1v0IFXMWPq03gacwmRKuUHS9
	hqEpDpomSY9B5mFD2kOKMtTMnKCIfXkknETnpeDMg6BuG42HjXPGQ4Bq
X-Gm-Gg: AeBDiev3BsVrTavfz/XzHfzpuR0N6NjhonoPoEykUsENi1JTd1b9DzQW5PpfLl68Jq7
	OGI4BFHHd3ugM4KGmByZYkst7pdgp4wWbQG80j1ZK8EAMsZ2UNyzVHOBJ9hh0DBm6Q9TV4ek7Im
	ApvViVH9y2VsooWCeg208n4+H9nofs1e+Vk4jwZ9zZTLSJiI+Ay+6bTNssfLA/wM6dYIVbU578O
	V3ixiuWHn6VH1LES5jia92nFYZCMNSilLFNzD1vkmcmBW5KZo6ZB1J2ikTmm8MBDhCv1uuouzWx
	dSjA1EFinMbD+Z61Wo3gmiF3u2kP4BJKBl2UibL6/aVmvl/saftNAsuR8DLGzYSPwWnSP50IT5h
	pxR5rMWwc2scMgDZQ94c/jndUGydvEs8FXKlHd6Al1vTmLoHde9Welcj3/30oKDPuf84IzdeMpo
	Hw6ISpchESmRmfXmpDb2UsaI5i7mM7BsUBFQ==
X-Received: by 2002:a17:90b:1c84:b0:35d:a3b4:2ef6 with SMTP id 98e67ed59e1d1-365ac47f086mr2457412a91.21.1778059429387;
        Wed, 06 May 2026 02:23:49 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06adc51sm716818a91.4.2026.05.06.02.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:23:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Wed,  6 May 2026 17:23:24 +0800
Message-ID: <20260506092324.635014-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx8qxp_pxl2dpi_get_available_ep_from_port() returns ERR_PTR()
on errors. imx8qxp_pxl2dpi_find_next_bridge() stores its return
value in a __free(device_node) variable before checking IS_ERR().
When the function returns on the error path, the cleanup action calls
of_node_put() on the ERR_PTR() value.

Do not store the endpoint node in a cleanup variable before checking
whether it is an error pointer. Use a regular device_node pointer for
the endpoint node, check it with IS_ERR() first, and release it
explicitly with of_node_put() after getting the remote port parent.

This keeps the fix minimal and avoids changing
imx8qxp_pxl2dpi_get_available_ep_from_port().

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v5:
  - Make the fix minimal for stable by avoiding __free(device_node)
    for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
  - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
  - Drop Frank's Reviewed-by tag due to the implementation change.

v4:
  - Drop the sentence mentioning the custom static analysis tool.
  - Add Frank's Reviewed-by tag.
  - No functional code changes.

v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..f64f57a33c62 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -264,12 +264,13 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
+	struct device_node *ep =
 		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
 		return -ENODEV;
-- 
2.43.0

