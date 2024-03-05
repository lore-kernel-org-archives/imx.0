Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65E79C4
	for <imx@lists.linux.dev>; Tue,  5 Mar 2024 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599753; cv=none; b=YMnuKUhl9BEVf6tF47+geNof6GcWpN2WckzMnR36cXj5eAR6ty9DSSTe1uG58u7+Iw7svJ/rruiM6cx5dnkbGsXHGPIm/qRfwGq9YxVRoFq0wb5oHfRUDQ1xy6NVEGi3Yqz8L7/9ceYP21uIUViEyT6Rq5Z3o/DuC893Cn2DKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599753; c=relaxed/simple;
	bh=Nyp5c8gmhPF5HW/cBtAcxcJXAGS/CFB5Nd6jStjHljI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AoDelb6RTn/uOvlq6zKyqLoxiYa0R3k3ch6LktqedAYq0yH/HiSjAk/WRIAhd7GjtNjCFBQWeajg+wQNkTVR7Elrh/XLcH/9EVQKpkArAjtABVY2wkRoY8SwZbYDKyJnGtbTLH2O48ClG0usc5XDCbmUFXDhXeFJM/uBYSKxw4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mI6szIzi; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI6szIzi"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36576b35951so651855ab.3
        for <imx@lists.linux.dev>; Mon, 04 Mar 2024 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709599751; x=1710204551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+BHVxrlI9al90zgfzMAMYGXo6UILvOU2ILHGRC0OBw=;
        b=mI6szIziRdWaP97HdVoeKm2SjfHOzclG/xq0v2tNitShoIw/GR2KzguQz1NNzikTZJ
         AV0g6155scd5p/rlmwjcm9pdiU+g9qovUhUFZg7c8Zdf74l20bUpm40sSADa359B2fNS
         LUEE3i+jy97uxw4b0FClTktumW27Zcz3IEjLp/GQ8PGJ8t/8eFpT9iWMXridrGlnAVok
         IQzq6AG88+WJitSOh1WYLXmpQPvDOzvkVNiX6rRhQacfEZ3hJ8dGJUYxrnl6Ux3s2fZc
         hQRapw4ayj+ycAG3jHP2cQ8eORC56d9nrGsP+oFvwDObYxSwUOnlKEaITKi3Rj4cyOah
         s91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599751; x=1710204551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+BHVxrlI9al90zgfzMAMYGXo6UILvOU2ILHGRC0OBw=;
        b=QmRQ/G6/e02/r4iu49D4ojmUhzAYvJulNLRPyz9cyf6rCWiSW0YGX23GEaMaowShdz
         JU9flywOkLCl2kZoazM//YRfwUWjq2TwKJ30fLg2lMqblIYxBwZs/+2p2j7rLC7Fm7Jj
         2m3EMw/Mgi2b2Uju3bZgU6f2cSftn//DjcRXkeX/U9yavWbzhg4xJnaQvAW7YaM8cENo
         HBp1O6TbQxu3imWGb+DNAxCkG8cRonAQTYA9rEsXPbaRmPibtjaJpANNXwiNmSxSOXcJ
         eC+e2a/kZnelOyvk8y5agksoMr6c5zfPF34Qrao378wXSfA0zOI3O7Giqk1eGnrWaRs5
         5Opw==
X-Forwarded-Encrypted: i=1; AJvYcCV2PanKddjaS30eWGro76kjQ5q5Qx4kkbWTzS2HpDBeP9N0/Fc1rEbd5Rx5CKVoj/r6JP+yMV/T6Md9qTvQf83kL6q+
X-Gm-Message-State: AOJu0Yw2aluoL5jTIWd4N1pg5ycB5sq6L9NuwWsyS9o0JX0gSPBTKrSV
	XU3WQwgBlVbbIdN+YUTfFsNLziFMbA7Wc26mCzcLVuGBZySoXjXS
X-Google-Smtp-Source: AGHT+IFcwi9gaoZxVBmlUA/f4yh+4E16WuLN4gryhMWjZuOM6lWeIU9uwmOYkkJrmY/3PWsDYKmleQ==
X-Received: by 2002:a05:6e02:1c24:b0:365:1555:9fe1 with SMTP id m4-20020a056e021c2400b0036515559fe1mr15026004ilh.1.1709599751378;
        Mon, 04 Mar 2024 16:49:11 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:8c4f:ad40:e7e2:538])
        by smtp.gmail.com with ESMTPSA id i20-20020a02cc54000000b00474d40f8381sm1931209jaq.122.2024.03.04.16.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 16:49:10 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com,
	laurent.pinchart@ideasonboard.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
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
	Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
Date: Mon,  4 Mar 2024 18:48:58 -0600
Message-ID: <20240305004859.201085-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
References: <20240305004859.201085-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DSI to HDMI bridge supports hot-plut-detect, but the
driver didn't previously support a shared IRQ GPIO.  With
the driver updated, the interrupt can be added to the bridge.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
V2:  No Change

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index a08057410bde..fba8fd04398d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
 		reg-names = "main", "cec", "edid", "packet";
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.43.0

