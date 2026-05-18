Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3837351C22
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127356; cv=none; b=OFyCgWThfcfmcToe6rNhILUQgWGexsIXnhq1RaMySubXfDbQqNdEdhgB+6+y6lHBezys8XxFNzRfBOF6zDYZ0xSb0iliwhJzdITAoFmjORjmp2WqLqppsxwgRBucd2LXQEMjDHeJMX2yExA9HkEy1GpTzIKHKFiZ/siJKCeebNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127356; c=relaxed/simple;
	bh=+EzzxgqWIWtl9fpOuLcA4N1A62StxktT0wkipKF9bQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8pS/YBJzTXWp0zL6P7cB1uAhimtgjxkIbVGsyzPCqdX2/g1cBuo8cgVn0R2alBmTVGz+EXEf0GzOyUIszoNXlDsxRtsOehU8K4vXcrvr7OI5GaMJrPiRiIHTc5/uquud784NzLOURwS5xtpl9rp1dpS6xiAP3ilQ42Xl/d7RL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=z6ghaNZp; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="z6ghaNZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127354; bh=RDtWO1bQ5DXpi9puwzpO7ZNdN3UnLZgsoflq5+aG8Jc=;
 b=z6ghaNZpIrjoJT6scbQh8SGXYYJ9TVwK3OS6E/rsIWXalh/DIg7pKMyUe51JVYSdIEiBLFtft
 euBRQz/Z7/xc/wWlzEWHeGrTpzMpufTu0LS3s+f8vFRacKJ7kk6uGpF6gV/oOym4nU4op6Jab90
 4qqHRM8O4nCIRRpk7qYL8CwhvsBVPpdiG5kDtMjcpSRGnHP0SqlVxqvxo6bs6Jq2hguVURuHidw
 41gS3qDytf2I3RBxRLHvoNbGYljrTBdeUjTpno54y0iXVEC06tXXDY5HrjPjSZJa/h4KbotwL9d
 dsFZgJt5CsFz0vRxTlgpvyVG+rNB4fxbq88mvN+6MWVA==
X-Forward-Email-ID: 6a0b5432b84dbc72d2274de5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hans Verkuil <hverkuil@kernel.org>,
	Archit Taneja <architt@codeaurora.org>
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
Subject: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC adapter is unregistered
Date: Mon, 18 May 2026 18:01:39 +0000
Message-ID: <20260518180206.2480119-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt allocated with devm_request_threaded_irq() can be
use-after-free when the devres release action try to free_irq().

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq during unbind:

Call trace:
  [...]
  dw_hdmi_cec_hardirq+0x4cc/0x560
  free_irq+0x48c/0x7e4
  devm_irq_release+0x54/0x90
  dr_node_release+0x38/0x5c
  release_nodes+0xac/0x130
  devres_release_all+0xf4/0x1b0
  device_unbind_cleanup+0x28/0x1f8
  device_release_driver_internal+0x358/0x470
  device_release_driver+0x18/0x24
  bus_remove_device+0x33c/0x4f0
  device_del+0x2d8/0x790
  platform_device_del+0x34/0x1e0
  platform_device_unregister+0x14/0x3c
  dw_hdmi_remove+0x74/0x180
  [...]

Freed by:
  [...]
  kfree+0x1dc/0x5dc
  cec_delete_adapter+0xd4/0x118
  cec_devnode_release+0xa4/0xe0
  device_release+0xa0/0x200
  kobject_put+0x14c/0x26c
  put_device+0x14/0x30
  cec_unregister_adapter+0x20c/0x280
  dw_hdmi_cec_remove+0x8c/0xd0
  [...]

Explicitly devm_free_irq() before the CEC adapter is unregistered to
fix this possible use-after-free issue.

Fixes: a616e63c56ef ("drm/bridge: dw-hdmi: add cec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: New patch

KASAN report a slab-use-after-free in dw_hdmi_cec_hardirq when,
  echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
on a Rockchip RK3566 device prior to this fix.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 9549dabde941..67a2a242d3ca 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -309,6 +309,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
+	devm_free_irq(&pdev->dev, cec->irq, cec->adap);
 	cec_unregister_adapter(cec->adap);
 }
 
-- 
2.54.0

