Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308360;
	b=HoeaL3lZUg8j+yTlgZWaasvklprbBePFftV0lCOA18gcuxiA4w+sI68xZXYQsnkHUGL1
	 jBKjXfmfutw8BRlVPOsIP0OkJv4fE5Pg6L6pvMmt9OfxqKyNmdzysIUKaAPfWiOLyd/mh
	 p1LLJUwVIhpPl2HKKN9ITcykm9ky9b3HmDbEdXpjHLoP/iSpI2vMLpyYmgSZL0fpjYIgw
	 QiTt0nzQiFws6dXpylVDBiwpuINDV8exbh5wMuS0NkAQ3fVyXtOjiyUS3IZy7C+HiAnwM
	 V9vsPdfTl8795rZqj32+/hzu1AoHeeb+kjlQ2Zmjq1V8CYI/AFcD+N6UjO7PZVdhnzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
	b=ltymB48lSksN7AgPzvgD+y8i5e2izJUwBDA3+jIKldPBUlQ31p9HWTYBt8vRRD2hgcSk
	 mB5eF+T89qu4OQPHjhFiR4A3f4j8P+JFYaAQ7syLxvap2ldNF2ly4nRo+7wGKjvfjCanA
	 e2MEOgAwY2ZdDWtmqqK+Bn+JzIgrrqW+0TNSz5XbIhT9UsGqnD+h0Ua6uFS50RhXErHQt
	 gecWIQJVY/8AAZX2eJbv5yIUw8yITzoymhWIRZdWGhaCvWzIUzPjibDjXFLe2GifI90D9
	 fCjk+M8y4Q7VtRJoVWl2wfmpqsJM8HppcPE+0Wb73AiBFYfTZzsgergKmFfRWjHCFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3CrAqpd;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FB7606A33C
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FB7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3CrAqpd
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490585eddfcso1462441f8f.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308359; x=1794913159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=k3CrAqpd10sz+jzEUq/CrfS9vgtSetxXEW+bQ+evtjx8OpU37L0lf38fkTZsDIJn3t
         1zPkOwEWm4Kvw4fU79iji3Glg3g2t9AStFi4KxS7+qnGmI97gIn2g3sHkNvjUNvY67VK
         7ZFPiic9iHnWOA30p9jyXeB1ulyHVPC+QGzV5Zul4DlnFq3wt252daPfQRTawv5e22tE
         6af0oeN8gUBTCrSct8LxMwHFm2eYA+UVCpMrdfQ2IGCqEROQGroS9Zje4VgVKVo+hVjk
         mDc3cU6wdI8CUTZ2fWYZr32q51Pc/SHbB8dFeL/+qtnFpPa5mjcH61qyPQFoAbH+RhzI
         kCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308359; x=1794913159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=wVhPSSz8bScQ2VlFD7RGc8VZSPDgp/cYri09G7FpO/uhARyi58tTrBLFPayxLr7kT9
         GAyXTUJnLDI/Y3WlE8baoAAIlU5xg9RiLXnNRU6Gl4Ss20/VrbMaxW0gsKFS3DDmMNe4
         Jov1aFJ19c5MM6EP4TtACfA/F91voMf0BDTTmAvb35lAihhnw5YSXqYOPIuil8FBFJP8
         QHPSJALqDHBpLSE0U7dPpQH0Gtr+zKchpJfGBVP2LwpPbkmsrhDC7KQ9d8vtVlFpda2t
         tLMVegMG9x68/qjlmusMNzuP69i6rAJjunXiDmdjbHBW82AC9W7f5BMhihAs6ftZSF8o
         DrQA==
X-Forwarded-Encrypted: i=1; AL+hErFTHBYl/AnzqtsjOePjCB1p9yIEtIeKBYjQr9u6+vGLg5eJ7SQs6L8BrZSdQ+7+XcxMtEw=@lists.linux.dev
X-Gm-Message-State: APuU4Z966vLgn3UzdsohQKoT7OPtsoVIqBiPjsUjgH/ayPsIMFdmCv5g
	EkYBiyMU6J71asc1MVOM+hzInz8E0DjUG+5V7bByEuPoEXhi57sdW4V1
X-Gm-Gg: AYBFou2TGqimR+jjD2zcqDM4vnoGn/5H89LXIuoTtfHl+srp1a+QtNH6hrkKfMrn0hD
	D/Oc2Yn84c36djBHTe30AwNxK/7PU+NkHyI+DBpZH6EtJ+Z3ZWz0a4H0WEZL8+YGg8FitjNR7S6
	sL/oLfYHb6Bzvs3ah9Va/JtktOYiMnuOeuEzL6Xkv/Rd0jN+nbs7Zg3VbIg0SpzJDGMzY0w0Ap7
	i0pxyqZuwd6BQORyUcVZYkIs/PGqwm3cz+3a/j5xikC/f1KOliFW3plZmqadf7CNNAiyGA6cU3U
	ebCdQ8tq1FYz/XiPn1vIEMNfkyWKymQZzR2as81EhQYaOKOJg2VymFGsgyjq+b7PC/0BLwYl1wZ
	MzgdF9jryfmSr9Tuw/hzqoADr9IbvJB75n+5MFlgqgSurLQa0FjmDmAgjjtfxmgvO/pzykmW6xZ
	9Zy3thOFVcQGzpFULBJPvr5ytcliX2C6TRq5xaWaldPO23YO7wDuXtdDcMH3cgx14CVY7b+UOlN
	CN2yhzT8VfQHrnLQAqE7PTPAM2lOv9e+WHPGfjWCsIm5TqnNzH3qE6q0ALygQRaZL95uvjO3t28
	hDfSV0qoXZ7oZPcdVYx7MeF8FuQ6CJFwK+oT9oOT6SRGaGGBZHdR5XBVvjcKmiMJuz5TBPfj6+V
	1UqC1p34Nw5mMgVThi/TYfipM3VYVcsO9cPZWiw18fh9UZdSKmr4=
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr3878592f8f.51.1794308358680;
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:14 +0100
Subject: [PATCH v2 2/6] ARM: dts: imx6dl-colibri: Add HDMI DTBs
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
Message-Id: <20261110-colibri-imx6-overlays-v2-2-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=GHGYqwad2/GX2e2ukD9rodYOQ4ugyd56E1reFr0Fgm8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JM57YwY/5OWw3N9bT5oSubGevhsdjy4tI1LkOPaQ
 wvJBUxiHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIl8bGH4X+f75cqef15Gzrnf
 na48MY9zdskKWCCp+D3lskzszPRvvAx/Re6HWVxjT55rznBBo/CW/kR2pdtzg98nG09brFqn9aq
 ZBwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Combine the generic i.MX HDMI overlay with the Colibri iMX6 carrier
board device trees to provide ready-to-use DTBs with the HDMI output
enabled.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The DTBs are provided for the various versions of the Aster, Evaluation
Board v3, Iris and Iris v2 carrier boards, including the Colibri iMX6
V1.2 variants.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d03a8d2845e9..c72920658609 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -93,13 +125,21 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \

-- 
2.55.0

