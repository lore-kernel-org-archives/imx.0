Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673495;
	b=gfcdTPXd6pdb5UeeyygxSHRMvC+ne+pjqxMzNLumAuc+nRSs+0P6lsrgEMiQj5yS8Wyy
	 MRKqK0000VGli5ndv9VlNwIlK66gbv7NG3jAY9WVPtVDIoOUSVmIRDjanAqPVG6lgMvGz
	 ac0ZMj0MKmWfzIe2NRg2vKS+jLYGBXso1I5YnJfNEwkaHT0AxvCxz0Rur34vMYWTETjpQ
	 nd4QPbsulB4nnsZ+0C/uOTuW6+1q6xS0j2rBVgoMZMhwG+x9zW0c1o9HU3FsXGbTmPUG9
	 LPD/hKiJWcpd0RxbODDDCcmOH0TApklWc2rapzeJIBylkktghlR0snU1ZBK+f5tWk+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
	b=pqHwrQGiMjzSexAth6EmIrvY6lrCDHVPbBnJBlNdfAQPjY70wuVAobfDR10FDVAt+MSk
	 YlkrMvrkL4ggjA0ffooFdPDxx4ZiQo6KnFzTW4YjlkJX0PoVLtfjab5lIUL1OysfEmUAz
	 7p5EKKD3LzjplAyjb3Uh+jUlxqeafYgQ3yfnkyx3YxSs/ZoetE63QCDdYtK3tmaryhc8m
	 HZ7ylA6mopb0LMCpxLnYiMyWLTbCV2ZhsK4onygtEvya5xQq5udglgzRqeGLs4LzQp/Yl
	 +etru6Els5rurA2VAe6xjHRlTh0b03ZqWbdNhI0FNPiQXEZwVq4w9Dckfvsx2bAIazQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=foTELnrG;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE84606A337
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE84606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=foTELnrG
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so5447775e9.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673494; x=1793278294; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=foTELnrGGE37nw02LBMc7bmre5RfKt44cwskd5KxScdSpYhjdNSIyUHa1Sw98G36bQ
         dLm3/lDuaqrmoeZLqkvVWWljc9SeXvxPZblxranAJQyV1r52BvouXNwBoZeBXDbvaQZk
         BrwTLh5iGmmICkjlhwlszBWirWnlOI8lYb5XRPNL+lUvhVuwBiwj90DkD66Hhwrp1DMg
         CRomKmNKWi5hN2bSVHj6tTZR+RsGOtNB2SmR+wF+VRDI+QNmYtso8UXxtYtsf09hNisP
         oQs8y78sWw6Pa8zL+Aj5UWzWMEtRhEr9Ot549Xz7mGk8Sr0H62iafmsO+KI5CaAUaQuK
         rRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673494; x=1793278294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=NK14yGb7KTYYm695Y/nQ1qKJiRh6wXFsi/abXzmaFPO7fY9lrvJFGJBnmCJ2fSE1kO
         OAmhnDoiJDyRPs8C/gcaK3tJDeNqu7m1LT2JwwdtXH87HJFqYtkEbbucI3JQCDyJqtq4
         PGV+9SJl8sdq3Rl6m/lw76GvW9ef+QOB1StxA6At2kSwib9I0E/6ZFOr5F+d0CfA0d+G
         I1oAkzMv0JtVbCErJ2lXDAzRQkjQdxD3lZQqs9xs8CaztqbA5KthY8O48sOHNJDGu9Zc
         /0jRPpL1/uVq2Uwrj1x8xoVWaVGNf7eQoPcpRHSC+vDiIvOCgk2bf3eg1no9AWlc60kR
         VfZQ==
X-Gm-Message-State: AFq9FYI/kfuI2MzewHOBHoOKHN62eCxvreO0Jz2Nksu1rEzorrVGtI5h
	6f+IRY+4+v3rkUhe/SC/fE1ae3tp3HqsSqayAXlnaDYTs6P3qKM/stOf
X-Gm-Gg: AYBFou1c27Eeu5M2Y31V7oQI2csFkEvr5wLIER/iWK2lWOAty68pEpdpN57p75r9cT3
	ufTR9ifKWa1NDDISBpvhC6hmdxwoQOHLzQ/3ZaO/h6RdkRYvtcq1XjoDaHOTQlx7g+cyijwlC3e
	I4KeSlLBF4BAni0HXZiew2Q0roljMDtFNlXl+NT+t4ysy8VDIwzGD3Opygtrn09vFX0kjSug00s
	IKIWT1Xy1H2M2TI+lQM/5lxqYZhxQ8MlEfftiRVDGRzjEu0WvasuVxlXfFmE7/L9B0rPjTnqQVE
	7dkuAAyMHi2/sTDWXzh0LsdSzuTeSqoXo2Md4WohJfWifzFo4t2bhOddu9cXfY1wQe4QgRxjfVd
	4VYVNO2YQj1XwBR9Rmy0RXZughUmqERaDrnZZNRLmKZd5FGzPCHotcUcCBlBXkw9Y5LDSDZhRly
	vQsZUCPCCY0QRb/nDqQPZWdtxDSsu0/vOXciLSWhW2YX3roamEH0hwKOMqGHIxDduaSX4Vw0Jyi
	753Hy4oqfrJpDwdsdXq9NnAVv6QdFfXs1gDj2DYHd8fTZrI9nysWzxY3jEzOW4TSkCzF7omEpNt
	onLrDSm08xxJ9PUh+aSDp0XESP5dacuUg4qkKa6eqoK5urWFc7mrgck=
X-Received: by 2002:a05:600c:a110:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a204bb5994mr34273245e9.15.1792673493483;
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:09 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-5-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the Lino
iMX91 and Lino iMX93 Development Board device trees to provide
ready-to-use DTBs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 18d4ed73eba0..ece4fbd2a904 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -859,10 +859,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
+imx91-lino-verdin-dev-nau8822-btl-dtbs += imx91-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
@@ -907,10 +909,12 @@ imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-lino-verdin-dev-nau8822-btl-dtbs += imx93-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo

-- 
2.43.0

