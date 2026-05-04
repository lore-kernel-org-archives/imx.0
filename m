Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295953EFD09
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921900; cv=none; b=dxDLDwYM70kIXooAqKzjxeM+3q/r/Xr5ChrU6GtmHW3YBE37k1zbgIbzYRCLKP+KgsYtGrm4Ui9gOcmN5X76syLa+jjzfhkT2eeDHlpwb1NjKeiIhZn6IlXhPP93xqNF6ZRJyY4L9o6cguovrxCEbVRADnKzZyblVoXweSRXOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921900; c=relaxed/simple;
	bh=hqRlZYFxrvuqWnZ8IPT7bcBa9DVizXGW1aP0XFjs0OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJ0s9GpYadg3TvqLshvs3eyK57RFeathjJXwRPeOsO9A+zpnSF0nyGsLa9NLgUET/k7d4HXRwJSne81ZopqGlt+YuSL4/g2VR35rPuC2n7DX9Or6j+xA8QbVw8NTd+PfSyAhLira/+D4lKIWkBNqd+I2/ntiCybRO9u/xrJP0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=hphaL4CE; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="hphaL4CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921892; bh=Eqz0r9NoxUG15d+SsM6xXmv6FO2TpWy1OfhCgUezkIo=;
 b=hphaL4CEje0bc2ROR0q94Sje8OkaGjrL213cRet1dA6ZgXFJldvF6HmUMK8VPCTEf+aNBmYiw
 08pUjoFX1zH2isGTp1rwARxz01JuxtHGI0+UCL11K2QTpIc3bDsoGps0w2fXDOkkWHAYSDKPxE3
 63Qd30KqiSJ5XOd+LQZcVV0rwzp3+TEW+3UDqqVDRg7nYIVm0jVLiky/+PaNEI+8mt4BGZDK3uz
 bpvbBb32xHKYZnXLcoSnhMFV/09eGIRg+etIIBzlEe3Yx6jcB0GeXkugTzR9PCNeuqzCpmQAyLR
 uBCpuMsxDVJp1en2kKgTDCbDSe9MCQ7UYNFcLbxBDIHQ==
X-Forward-Email-ID: 69f8ef5204bb1dff846bb816
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.7.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/17] drm: bridge: dw_hdmi: Only notify connected status on HPD interrupt
Date: Mon,  4 May 2026 19:10:39 +0000
Message-ID: <20260504191059.275928-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_helper_hpd_irq_event() and drm_bridge_hpd_notify() may incorrectly
be called with a connected status when HPD is high and RX sense is
changed. This typically happens when the HDMI cable is unplugged,
shortly before the HPD is changed to low.

The original intent of commit da09daf88108 ("drm: bridge: dw_hdmi: only
trigger hotplug event on link change") was to signal hotplug event at
correct interrupt states.

Based on the commit message the intent was to trigger hotplug event:
- when HPD goes high (plugin)
- when both HPD and RX sense has gone low (plugout)

However, following interrupt state changes can typically be observed
when the HDMI cable is unplugged:
- RX interrupt:  HPD=high RX=low  -> triggers a connected event
- HPD interrupt: HPD=low  RX=low  -> triggers a disconnected event

Fix this by only notify connected status on the HPD interrupt when HPD
is going high, not on the RX sense interrupt when RX sense is changed.

After this a connected event should be triggered when HPD=high at HPD
interrupt, and a disconnected event should be triggered when both
HPD=low and RX=low at either HPD or RX interrupt.

Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: Collect r-b tag
v3: Update commit message
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 248454c45d6b..0647ec6632d8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3157,7 +3157,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			mutex_unlock(&hdmi->cec_notifier_mutex);
 		}
 
-		if (phy_stat & HDMI_PHY_HPD)
+		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
+		    (phy_stat & HDMI_PHY_HPD))
 			status = connector_status_connected;
 
 		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
-- 
2.54.0

