Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423867;
	b=HbCyp2wacwtHy6PEtoho4zQ+K7fgNerUNMcgeqooIJTZcfFIVNAwLsLk3LOptqoZCvan
	 BXtwIsW30StHJR1aOXN0JBdgrhrbSiXuyeKm4Frv8ECfNEN2AnuA+/rs22ZkGr8U04UWi
	 2H/wiqrp9m6t28loqPvnugT6xu0K1SJydZtjoojs0MUp1spZURVcJy4sPGXgN71cxgBVL
	 EGcUILpEPxkriTS4eTds/ZKWvwb4oyms+S49yE6JBznT9vas809fniMy2RNxyCc5F2WCO
	 VnCaolW77jTUWPu7Y1K4z28CaLMD5GRtH/E/ocvowHukQIBZCZP0FjpyjU17sA8aB9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
	b=cWTnJE97p4qUSMEtTe5pbrOB6sD+S47BJvqa0NQKZm+T6hp8kgFfB8xIyEUYArczfOdO
	 H9KwQ5teT8Eenu9nVMOGiDcyFDtN00jbuaimKA270u4jnubYV8Q9oDsznE/P9D/DNvP8N
	 0Bnvmfs+A8zpCpaMVjDY/FMIcJmCqJS0LtzESTW5CRokViF+3HO36DaAQVncp5nXgX8d1
	 1omWNDLXqbwQUzYnWxxTK/HSAaR0SIA8M5IT8YFkJacwikJypbSo6tqNDuk4B3kfeQlWj
	 Nx7B4tn4M99lZANjZmPLWTNbewqBapsNlGJZ9dZ/h5a91YA4kJEkkQejFDOtAgOYGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSFCyFuA;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3815606A324
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3815606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSFCyFuA
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ede35b0cf2so3641375ad.2
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423866; x=1795028666; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=eSFCyFuA4hlRXxUvTxVlGTkEi5kR3LpthGA48zIgk6QNDjnM12XPpIFcToVjc8yI3x
         wZFqs8rw//XvqGAH++H/sNFPii3z2qk8rM0nrCqG8MmNiVKY1myQo7CVxVnPuy4/+gQ5
         PRy+/FMRGYLA5CnaSf+Ok2WIgQIhAPotWf1TJUxOoQ2+7oPT49izf5DFyzMlxV5mq3CO
         yvzMEWEQmsHjiwWhPMuHHj1kg3l/aG87oLjnBfMLdLWUEqI6G6By2oUPlcN8XzdRg5qu
         au7bsMpgVbhRlxr8TJ10ozPoSZhmXHlauIAutAXsIc0ENiLj4mulxIk2buYLu/LYZdsQ
         vqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423866; x=1795028666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=Bm7otNnnAGgCYKIY6THDE/BgJE6/YHcHOqaL/eG2XUgWhA3QLw2rz/Ezc5hzIyzu05
         5Co6SImPWW7w2dbnCcOcNnWJ8Fk3jxq9+gScFkYIYLvMTWYy+N82VArQUM06Bb4zNtwA
         yqDdGUQdJpPc6ICxdX/5Y5c7T7NVJazpCjlkH2+wGcyLXKprUAeSexlc3T159gFKgMWN
         ttnWRKtBLgMHfYk+LfMcLGMsK0Ukv5FSlwHHXiz3l8L+NcgVSVs98GXJ4DDkEdCDk/JN
         4oZS4w2LEwmAdIWu3d4BTsM6Z67C4Q7AZy9BfKRF8Fv3uHfdm9Nd/UAwrKwpAXLcE6Ru
         h2mw==
X-Forwarded-Encrypted: i=1; AL+hErEwrEEPp5NqmGk81CfZMZa/hXC6E5vG8ZzvAbjUcv4P8uXlPPuSpMBrTsC2N7HGeFelp9E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tU9wE9anHJEkQdJHMZ4nbYJE1GonLXiZGOsSFPc4eg76/MQH8
	ISSk2Vb/3FD0V6zwhx8iXvvHRAn5mJQR0+sRjXOIegY4ky6PDS2epFgg
X-Gm-Gg: AYBFou18+l5YGN6h+XHoUVnSOUoj1NKf6fO0S8BiwmWZGwfr44PwUUrBAZEVdd7KNoT
	I+D/+Vi/Rr/2ajPKKeaY7yHIlPPHVa98Ca4YQ6AD35c331nBHEpK+jZQSw7uBKZOdsdW29JYqcs
	+EtbkQgeVVsOo34HHzg89beFF5EWlMPz338rctwRsQxmRJNXxIheZDnb/bd5yfaZAAwDE807Z7k
	ArEmZCTMuRv7DHA/ikXJfS73U+T8RcoSI+Ka1Qd7swt7Hn+wdXcFTDHd7kq21cc+js/B1Ko2ItZ
	Aq1e4BZG05XxeDSlIrVyfAHcKAt3Lwni1LzMeSOVRjB7hoHICCQehMocF6QzWWmDhsnLtmrfWK9
	9elta0NJembUPRYg8mJR7FXftv5Lbi03/M0y6r6asOEXlSNzT0WWsjxtJk/7CqrfBSysMyD13HB
	gqkjlzO4hN4ode6qV2lWQ9IGVXkg4T4uuu7ED7gNZwHBXBYeQCLr9EbCgrv+z/AFpWL9q2i9cgT
	rfjVGJ2EXCKS8u5pOfYEMj4xk0LIYZ7/fSzruZK5iT9i7bc6PG9VPVld913n2PdeC99ENB16H/Q
	RdI9Fmj38PhPDV3XyJrSG8tQWQESeONwPpQ=
X-Received: by 2002:a17:90b:55c3:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b182f0ab74mr2979207a91.47.1794423865920;
        Wed, 11 Nov 2026 11:04:25 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:24 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:57 -0300
Subject: [PATCH v2 1/7] ARM: dts: imx6q-apalis: Add ready-to-use DTBs with
 HDMI enabled
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-1-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2682;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=IhvOHZocG3sOxkIY0mTZ8xkrqmTA96SIs4gUIqO21v0=;
 b=0RH9hyedCGLDxqRsacjj700/y3wjOOQwWdmkydZUbod6PkJsolk3iCEIm4MOXpWF1orItNp5+
 rfBds01kbYkB1eHbWn02cxpgaaF7avxlyA6n5rxwvIqVrSMcS/HJ2Vd
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Combine the imx-hdmi overlay with the various versions of the Ixora
Carrier Board and Evaluation Board device trees to provide ready-to-use
DTBs with HDMI enabled on the Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd4c8062e6783..cc0f5f100892f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -124,6 +124,46 @@ imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-vga.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -271,15 +311,25 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \

-- 
2.43.0

