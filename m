Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919494;
	b=MXrsndnSUU1OwXpuGBohwKjaHuAXQ2C8jQdGlDL9vVlFWddlhimS1NIx95W5HO3MHojW
	 RWFYuWpOMR4Bmh3wjbhFN/JUvmRGMKMAoJrA4OYF6AOPmot1Y4sZwGY4PDPOLtoKxhp41
	 az+2UzLf5HKB8sw4sb5cVw5W4a4sUYGJlJIakOk4cQNh5jwzfvx13jg22t0Np6tKyRu4A
	 ShRe/H24l3qg5gkPXzKi3/La6u0Nkvu/o5TUIT/1IcRw/uz0W4QowxyvFHCnXEwv1ej3p
	 +D/Xk1goNVMEtfi2Xs5PspfeJf0wIbH5+1CGdO2BhWQSrdcNTq6QAvGvv7YMrjsV7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
	b=C3IZRhc8kF2kbn+2TJeMM3DeYqomV/V2yRv+tEAfnXA9pdQAPyf5WPuM6AFhzcKi40vT
	 JPHoql60SiBbvDyXMYi8TVbTnYjcnLfglv2k7dS+KXjhljdbH0sTV4NmXV4tcaKgFjPsn
	 /0zThy5NjS68+yCfmKVQA9mPbbUcx+dkBLL09UQ66a3OdJZCfgFlTgR22yFhObnKuM/pf
	 RBlJswBhOHxuqTLayQOD/B5AOiGfJiuhUXjUO7c+NkpTPquW3wOHLrauKkl5PnIXCIDwd
	 Zki1juO/Y9xtXdPPNvXYkRbb5In4iIirB4hHKQoN+rcvNJUgVgbj2rKBMreDwcuEs4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXtiqSbh;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D9606A88E
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001D9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXtiqSbh
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efcf92af4fso6194465ad.3
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919493; x=1795524293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=oXtiqSbhCqD7MUptSFStI7II8lQAFg0n668bKeAfXt4fGFTvCRhPmwPj6s2Z9V2xPa
         mwQNpHWMnX20rY715P8eI45BwTwBTVzRkqfRYVSe9Uu5OpYkbw2yilbP/xYU2oLGkSnI
         /bzBx92JSVX3J4iy6V3HnJ3rCU8sBAlLAOxptU9ttOOqeNinLBxaytEVeX32fVfrgiM5
         0zc9yW5MPt1m3xkvenKgeSAJBirQpNVbIJPAJ2iWsXBGcKLeSQEu4HTs/QfA9vsoRbPP
         sWL10cJuGsy91/IBr0YWAO1BiufKoaID6UYP1wXi1FEHLyHjMK+PoTwti9unEFMw0HTJ
         N5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919493; x=1795524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTQSBNyFu5FG64fJJQ7wrnnkB4xsmHATDHe8Yz9hOc=;
        b=ZS0gw8gXeiU8OmuzvEC2gbcdlOvnyJxM01TnmbM3N/H3MGbiYXcpHm5P8+ocraVwj/
         G8NvW0abaDQyN9uAkZhxb4XR4JamR1B3+klx3n92a5YkuZfYaoblWZwGUtJMQguYE3wK
         mek1ER08FjKIK8m+hJZw3T6TidDnSFjHTAbzh+qq1x/a2+RwkuYHWnv8N7IcKmGyWkHE
         ZA/QfOCju1k9HwWqjNwFOpqn715UNIe3AC49SzLC0NK3RD6q+pvqCFnlJUir7OqJaLPy
         Goy0WVqmnmOcGdxVp0CXdiC+mVDIzobATreZ+VQe4/vd5H4YSwOR10w2hoaE5BXoTcjZ
         iQ4g==
X-Gm-Message-State: APuU4Z+urb2VFn/TG4kPoZLiw1VHQv8mI7YTU4Soa25iAP6uENu5kOWM
	OFnTCQauwlgTc2TKLYzCUuSWtSd2HH4UbiWRowcG7iJz8wvGFNvdGACC
X-Gm-Gg: AZFdTZfBKmglmtYqSibl/VrLd7kVc1U+lBSGyQQUSuqxqVxczIKbyN1KlTaQ0LdTOcs
	Q4cS5AO/OkN8PDGWqB2PLvhZcXYgqs6WUi015EZZFtosp3fZa+PP8hGC+930tumvE+5nDT5GB50
	aa9QeAkViLCUFE4DbPFOc63uqOYvkPwsdn105d7lZhWrSPqF57umg4xPB8FHemVj2KCpiB2Mlhr
	UYpp00oSDwnPtsHizD2/b3Ge1vXe4KOWWuLml8d+SJjL5wXUuj1uKK7KZ5aTiv44VcQSNtefFAF
	tfnLCocs/hvT4wavh+mjx21Bszde7xVCRQS2MUhkWKdQu9j9H7T8bsBhMDabgi/fMpnUfZdBWw5
	o9oij2VTFF2iZ+0XRIIh6DsMUG3HnxkCmM3MepXA9LNAB01NUyR/az3xsCRIlZZjywW4+KGcccM
	qVP5+4qJz0EN75eqCveTDbX+tEnw2A8rTLkmPlxjIol/BRPxbZGVc8efdMfbywl3O5n3DGJgGfs
	u9OigYE1IKufIahhI/2rR8OFh2zXsft9/sXkzMYqrHoRYyCgOMoLwMp8iTU6S78Z5Cm8pGpmkRJ
	cizoeiVttKTrgNONyV9miXNlzrtWa7orQQ==
X-Received: by 2002:a17:903:1aa7:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2ee0da31f96mr148127665ad.2.1794919493062;
        Tue, 17 Nov 2026 04:44:53 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:52 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Tue, 17 Nov 2026 09:44:13 -0300
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx8mm-verdin: Rename
 Toradex display overlays
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
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-1-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=7204;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=BwcIZ/VlbJg2I+2C67AXmg/i3dqu1nwSQOaQPkMofeE=;
 b=zTGHKRUj6+QU9NIEurqGNxE6+qIs8D/4pyarGxXDtGYWJ8gLa20jm7Ox+50i3lhQqvZTfyk4b
 I0EhtdF3zMjBAvrXHc5G1QeRcEQMgywvvyeCp+gsfFii5KIqDDoSZ2k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Toradex Capacitive Touch Display 10.1" LVDS, Toradex Capacitive
Touch Display 10.1" DSI and 7" DSI are Toradex accessories, and the
overlay names are their product names. The naming pattern
"panel-cap-touch-<N>inch-<interface>" reads as a generic panel
description and could just as well name another vendor's display.

Prefix the accessory overlays with their vendor, "tdx", as is already
done for third-party accessories on Toradex boards (e.g. "rpi" in
k3-am625-verdin-rpi-display-2-7in.dtso). The combined DTBs are renamed
accordingly.

Additionally, the Toradex Capacitive Touch Display 10.1" LVDS has a
correspondent V2 that is meant to be its successor. Encode the major
version number by adding a "-v1" suffix in this overlay's name as well.

Link: https://lore.kernel.org/all/20261026111149.GA46946@francesco-nb/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 30 +++++++++++-----------
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |  0
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |  0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |  0
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..0bbc4b6a6b537 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -257,9 +257,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -268,15 +268,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -286,19 +286,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
-	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
-imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
-imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
-	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
rename to arch/arm64/boot/dts/freescale/imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso

-- 
2.43.0

