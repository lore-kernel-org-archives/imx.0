Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378693FCB00
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535859; cv=none; b=Cc7/cGQs6uLFCLddi3v3Am64nIkNlK+ZZ3IKGjknOyhHo39ATHvSEzpcwaqLGB31+QYtmx9mKo+5k18xNFOb9PCbK+ywz4j5o/biFtRixyQBCZ0UlSpWkszyk+G8M0zcJsyR76jeyTSsnezVwOgfaYyqYM8EGx9GeeViBcquMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535859; c=relaxed/simple;
	bh=F0duyRcsT8AH6l2yenI1qefeUWrcLVZCaJdSuM5TBZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSjNQ9JuFvprEXTByvDYTRMhXsF+QO4+nb+bPOEhPQ29W7KDu3AHH7sRHj6GB0p/SeNTvMen0jsLysKVnES9jRB/HkWOmAy0NWL/dmlJfKuiAeNfkrc4599WzcG9gBaCDnnzQoDNETngmpymfk/LmlTVyH23JrZc9mCqPqUx0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY1UqXjA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY1UqXjA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso10917945e9.2
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535857; x=1775140657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=EY1UqXjAZ4r5v+nUpF8Oy0UXMMZaw9p8KjgMvSNVImIzXnBI90xcYY6lVfGJZrsaNr
         aYdYme1XzN3sc0KZLiXPa1s4NxeNMs4XKlR6PIKazCXXE9NYIYolQxp1C2s22JADZmiP
         URpu+85711IeUbfA4UkQlRwPHSaysryX0M1zI5nEdRaOD9Tw4MAilmrJBAdk3vCPP2KJ
         SAhkaudIK54T75hXactYLbAdREkb6bjoIsfd6QTx9V23HvKlZo7LNrN+wAPbJwasBJyh
         qKydoicXmO+McpEHUcRewUxHYolekeHO0Z5S1K7+ER+Hzm3N551l+ic09UDqMxPk6nqk
         YBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535857; x=1775140657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mM0UiIcJttTcdCI1/5YlbfPbmrdM8cHS05utyZNdE8s=;
        b=grubowVK4cNh+R2h69SFbIgpHz10ljEokkWvtMWqHq8boEhHwzsq6JoOQwWOnBc2Vo
         9LinDVgFOurxesdIRX4VawlT0jGDNpD/0sjx3bZKqG7zO5rCX0IELritIxTuKuB0n383
         PdxwiklbtDapjyfIdR/5XRK+ok4VbcnZaU7uaQNspp8ZYZfTLdc37hC3lxicPcF2hKmd
         VLGdJqEzZBR2birQWikcR5qGt7FwcNspqP0ud3Lqes1l+A1RG3NpuCqSOfTZdy8fphax
         PH9OwRZcjPG3eLE+hxMKwinyJFJ2nJ+QVK2+VrIHieOH5Xs1gLXHCMIpVp8um9k/VwmE
         kZqw==
X-Forwarded-Encrypted: i=1; AJvYcCVHqE5cFv3GoAlQhnrOfJSO936mdSlCaWAwioLulgz4zKF2C0jZQP7HhcFTxpnOCd1tJq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQn6yc5UD3MDp39Iyalx1QFafsyAKPeiju7iM0sHdjuZx0N3sZ
	mdgE9AcPfqnLgwG1QQVvTGdmYZXLj6/Qfgyh6zvX9zQYL0fSMvQGxD+4
X-Gm-Gg: ATEYQzwz2jb3HKemzmvXlR4EsIDWWOSq8k/Ss+LgD20FW4glgG6iwMzaJCLdjQ1Aph/
	HBQ/jMY66eMgEhEe/AEMhuuq+cAr4LBtG6CTl9VMcKpn/5SH/XiaIK1cC+QpKr2YEmlR8v2MlNM
	FPQLZLHztLz0HikcwiCwuHIVR430Sl2YfQKL8wzlMQ2OMY7sKZzDdgkW5H4iokGH78x0PFLHBvn
	Sl19753U8+HS7ZPHng3gkGOb1Guy6b45vkp+R9A98A5ioxTAy0OaGpQt+7+SAljN1CcMnDxJWN+
	NtON1wEpHbPCS0kcT/W5SxboqNUH0DCHDS7qe3C0P92zzMnLcJCgAtXqBTwEifbHBFU7y76IvGi
	B9lQV2EaeQ7WpQ15iZwKBu6pTzbPRcYwOZQVE59/P2Idw9ViWR9xApyUCQX5UlVUj3FpztnWT/O
	lgTY0IM5CXDGzlXH8G5PYvdxcKpi77tyMvxHQTy2NzeDTY+Leu17NrywOaIzMaPINtVwGoAjY64
	8DercWbAj5J4TcBJdNHI1FL6CpEL58hyWgnl2jixT1hefcSByd1FD1JeTZet5Wj3bWs86JU+nEv
	+g0OoSuYK30Da5h/i74b
X-Received: by 2002:a05:600c:5296:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-4871605ceb5mr124171915e9.16.1774535856243;
        Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Thu, 26 Mar 2026 15:37:06 +0100
Message-ID: <20260326143711.143462-4-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
JTAG. The WIFI_UART_EN signal is used to select between these
two functions. A GPIO hog is used to select the UART function by
default. This DT file is going to be used by both Linux and the boot
firmware, and the boot firmware will configure the GPIO hog way before
the Linux kernel is booted, therefore there is no actual race condition
between the Linux kernel BT UART driver and GPIO hog probe.

Configure WIFI_UART_EN as a gpio-hog driven high.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..8eef26eb0f87 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0

