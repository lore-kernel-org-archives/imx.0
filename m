Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D50204875
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061074; cv=none; b=kgD8YqKdiEbWjxwoPjd2vAD7XCVqzS+ItCllNejA+W3t+ioLsTVFYwm83+DlJHwO94bioTtKCBNUUHbdKh+41td4usjRlHU4q8ELDjrttHhmqj/CbakrfKVVfxxZ/76VFQC+9Y3skLDmqBlM2yKtCWvr0M3GAQXYRONdcpAhPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061074; c=relaxed/simple;
	bh=CWodvW4NCBIlUv6/PqgOLyTNVvQ6Z0Bh5b4w0MpQRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmEbJO6ELEj+5ZtJQrKxF9uenuYuD7DUGHVHHKfxNf8i1goGeCzRHlSRBZkTuKM+n2h4OrTE0doH+UShmtVZVpJ2sE7ymGx8jW1rXkMUg7ovFy+rhoO5kF09bd0+Hd1s9yX/Q8ffz+HlLUdR/xrhgcTZJPnL4N0EdQPAjWzHdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzXI4o5L; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzXI4o5L"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso1521109a12.2
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061071; x=1740665871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=LzXI4o5LtrUAN6VAwnxXL9nodVCzD5qHDY/y/TNmgJ29TziuLwkFkR2VSgnYd8NeOc
         ZLmkf6pQ0Z1xE8FF3O+MQd6jvFaDLpyC2HLXTGu41DC7PVcZH0nvdvbtsCAfxBIePKa8
         MIrbRkeheS9yXJV1MR7h/seq7LY8Y7v+Til0ZE/wE+pVDwEXf4OqSHv2JrjFrTL8CFm1
         DkQ65K7KCAjvL0orMJ0pT+cmD5OLzt18d+QRr+Z2XnGM173IBbNKJF8HOlR+uA0uMKiB
         PZAK4Uzgk1PQw0B6SJlXsC0fWFGcZgTv9Xms+I22e0pJ186dnN+G9xYeEFiARIItmms6
         sDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061071; x=1740665871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=SzItemUJWGYe+sccq/paJ9U393l2Um6v3uZdoS7kvKkrDBLstxNqLzlEOVyrtJovip
         RPLWthYSUpzS2MyjlxxkniCI7x0QmW1fP2SqOw1ufOjXRidUdwPlFSg2dcC6i3enBpX2
         Rh96Oxo8dlUbjZjNawvuGDkvYZ42vzvLRcCNE0C0NZ9elpoowVQWGJ9zZp8rmTShb4JV
         dPtWTHa+QD2wiwkW+S+UHvU6WVkIKsiKKPuwy+e12dNFlouqR33wK0mRiINBRJ/Sst+y
         VYuuKsL4YcX09/gD8wIeq/rDE4zyoLWJJxay2xZiMEDMFPWPBjSf97XIcTc5wkb5NxHe
         ldnw==
X-Forwarded-Encrypted: i=1; AJvYcCUtucytDuDUEltr3899adLN+wNu1huRkqXgqh/V2dGqRPcdw+Abnka5Owrx4yOtoC+u77o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYlE1GEFi/9j9GwuDEUYS7CEJhU7+0i2htHHh9vKa05vqwrga
	7ChmuzeGmtS0d9KmI/jssLEEM//amKnWROsmlgomMyrH+bwTD/XH
X-Gm-Gg: ASbGncuezg9kIhmH8Cp9BTKbUR+kmBC3VEAN79vUFFvegfnsXmP6UHn6WUm1z0fGlyt
	ftJ5SH1FE9L1BMFxFybkhldVsgDE01Af9xSzDWWSrU9zv03ic2QSC+qu9o+FPyKlteTRg9X9H0H
	LWZF6MiifzBCuptIjFock5ALQSiNHdscOC5pDyqK2/VGt/WG4XT9xNmzRlrIAx/l3HRfPWazvrA
	sARBnS9nLJgX1YXYK6AFDEsovqpJXDgjTjPyzZoHNjuN5pD0sdDfzHoHdWrstInabqjE3abISQQ
	bM6v9MTimLOOvzQ6R650fkxJHMwB
X-Google-Smtp-Source: AGHT+IF+XJVyqbiTAhRVT2DX5gAGDj/R1pffrBAQNQzM7DfV9u3X2EU5bwoluW7W/73TKgTxtEDY7Q==
X-Received: by 2002:a05:6402:35c3:b0:5dc:1f35:563 with SMTP id 4fb4d7f45d1cf-5e08950fc04mr7944322a12.7.1740061070649;
        Thu, 20 Feb 2025 06:17:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:49 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 2/6] media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
Date: Thu, 20 Feb 2025 16:17:24 +0200
Message-ID: <20250220141739.228714-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
 include/media/v4l2-mediabus.h         |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d..97ecc01e1e39e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -129,8 +129,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	bool have_clk_lane = false, have_data_lanes = false,
 		have_lane_polarities = false, have_line_orders = false;
 	unsigned int flags = 0, lanes_used = 0;
+	u32 vc_ids_array[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	u32 clock_lane = 0;
+	unsigned int num_vc_ids = 0;
 	unsigned int num_data_lanes = 0;
 	bool use_default_lane_mapping = false;
 	unsigned int i;
@@ -208,6 +210,15 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		have_line_orders = true;
 	}
 
+	rval = fwnode_property_count_u32(fwnode, "vc-ids");
+	if (rval > 0) {
+		num_vc_ids =
+			min_t(unsigned int, V4L2_MBUS_CSI2_MAX_VC_IDS, rval);
+
+		fwnode_property_read_u32_array(fwnode, "vc-ids", vc_ids_array,
+					       num_vc_ids);
+	}
+
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		clock_lane = v;
 		pr_debug("clock lane position %u\n", v);
@@ -248,6 +259,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 				bus->data_lanes[i] = array[i];
 		}
 
+		bus->num_vc_ids = num_vc_ids;
+		for (i = 0; i < num_vc_ids; i++)
+			bus->vc_ids[i] = vc_ids_array[i];
+
 		if (have_lane_polarities) {
 			fwnode_property_read_u32_array(fwnode,
 						       "lane-polarities", array,
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 24c738cd78940..291b680d2a845 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -72,6 +72,7 @@
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
 
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
+#define V4L2_MBUS_CSI2_MAX_VC_IDS		4
 
 /**
  * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
@@ -94,8 +95,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
 /**
  * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
  * @flags: media bus (V4L2_MBUS_*) flags
+ * @vc_ids: an array of Virtual Channel IDs
  * @data_lanes: an array of physical data lane indexes
  * @clock_lane: physical lane index of the clock lane
+ * @num_vc_ids: number of Virtual Channel IDs
  * @num_data_lanes: number of data lanes
  * @lane_polarities: polarity of the lanes. The order is the same of
  *		   the physical lanes.
@@ -104,8 +107,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
  */
 struct v4l2_mbus_config_mipi_csi2 {
 	unsigned int flags;
+	unsigned char vc_ids[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	unsigned char data_lanes[V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	unsigned char clock_lane;
+	unsigned char num_vc_ids;
 	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
-- 
2.48.1

