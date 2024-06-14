Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B48F194A71
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358399; cv=none; b=KpZBQCG6WGjcxSg1bTQjx0Q5+AHCL0mD0d/F/YsrNAgHYWx38lsL7LOwuOkJj6WslZoy/rO7TEAXtov0N+sXNOOnmpiKN2lpsmSNwNd3bVi6F6iTjIJEtJAhYy8VK6m8WaHnEEO0VyJvfnuriZ81TWDY60BQHIwdwxOV/attPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358399; c=relaxed/simple;
	bh=OL1bThiSTDRnxDnX7dUSElkuAerpOnM4wbDcCD9Dzlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjIvcUson3I0T3I+gH4oGpanWFP0BAbj1d55Pn4w92TJ4ZI7OQ4Z+t5N2gb+5Nl11Ow+R87HW8YTj2xLVHQJPSB1zvSQfTcdD1lxQJ9JXgbvSWhGM3apP+GnXPIUACV5Waxb/5tOSyHGSJc8p6/L8kzSFlAY+mCjnykJpGORqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zms8kehs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zms8kehs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a62ef52e837so264448166b.3
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358395; x=1718963195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
        b=zms8kehslt4H/rFeJYMGy13Bb9CJykR2wICSujqCLyezh2nzWrYHKvqJRhsoC0CzTK
         hCXJkEoEGQoxwSQaG4u0gsZI+GuUaUj+/YpPS7bNtx5EcdXogHP5UikqcC8bTG9mzh4f
         ovppzAK210olHauhIBBmFDvL6BZHMCkr4Zfa3dYyW956Ya++t72QsIFsni7MdH7ss5IK
         J7jWQxUSxcwmsS4v8L/f2RXBxmjM3mon8tqYkCkwdja+0YFbXKXo3pliMDM3DS/SVlU+
         b1+G/8eLl5b5o+soFc0/h/61dwUJw/lZDjb6YM/+848W97LrYApNUXypH2q7pj7EzgfY
         ncyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358395; x=1718963195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
        b=QuLslqdwH1ct/3sOCCgmFudLW4RPTBVrmLLQ1KBwmDlCM/H7jn7QwagTNpUlLDqdiw
         OxvDF9R02kzgyQWdC+YcmZqIW6WOvYY1I6J//7pi320Dr1ckf4WZBj8ELZtFJYY++xnL
         p9a+2TYfzU0OdE8iLFVm6SQljxucxAJR04+gcvOJCxM3al4S3Zp0qESctaJw5DGzH0YZ
         2gMD8otnuuNr0N8Pk1vgm28ryPjjDmf9Nxc7ttT917jJFIzdVfIC5nSGWsrThBU2WjWn
         gvvu6zKVycXWBDKlFtsU5GkBXYlZ7JgRDak/7YSyl9NmhcqRmn3EblMHCToPIzYdp/EZ
         4Zeg==
X-Forwarded-Encrypted: i=1; AJvYcCVKlBzoEtaFj55uhNUl8oreLfnUE427GmmgJxMNr6hp3Lhewa+xTPp8NnP6dl+ydqsnFQ4GJlItotkFmEIoMXfVlIQ+
X-Gm-Message-State: AOJu0Yx2jN8NPGU9KEE7nAlAvt0GDLfOEjvt/UbfZxdokpQXPdjfv/96
	5mu0Ft3WZWyVOqQlvDtC7814b2FHglcVLjXjnrAyFWTcqErkcIurmOyClFYAau8=
X-Google-Smtp-Source: AGHT+IEIIi7f/khX+DL0ElnKeXbkTkqu3Do2h2qNKYCQfUhMKe+WvRGDBSKEB/3Hlft5tLx5w1488Q==
X-Received: by 2002:a17:906:ecb8:b0:a6e:fb9b:6769 with SMTP id a640c23a62f3a-a6f60de5fd6mr154292066b.75.1718358395585;
        Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:01 +0200
Subject: [PATCH 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OL1bThiSTDRnxDnX7dUSElkuAerpOnM4wbDcCD9Dzlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFhz93LdRptZhTU1GW4iGarOwOO5EBiFYLFd
 wFDJHK7K/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYQAKCRDBN2bmhouD
 18s9D/9LP9unfX0MSkgXF8TFjscV8gcBK408X/8oxDWBhIrJxkLZCwMssuTlysHZ2OYfyKJHsGx
 G6Y1+icUV6gklZsPxjJ03/jABHwNj3xRb9AQPOwWQ62xpX/+zxQNNaEcW6AKyNmY90EgCBRRrwx
 +zhCuMur8Gg6isM+gl3qHVZsMSALb5gwAMQDe3KP7A2Sno1hJw+giAAb3KI6FtfvevD2XtkMgab
 x1xdWHM5YlOGmNi6acFw/2dtzcokVRiNbkNGuBpupXWq+vZL0n0mPr26qRUOIGhKqt/t5xQsemZ
 L+Mr4ASMWruC2cyuxRkPN6WXiOqU2PWSej9kVH8O1xuNjE4e/PQHH91KA761ii2PhPs/7y+OwqF
 pctdv1ol8AqI0F3yHRz/o1pCSJ8swPRC9vEXoLIwXfRYvwqouz1kVDofMzUcA302kDb5yZk+EgG
 9KCfyKlubN63juUO4jfkwe2WzfAcEXpi7GKMv5Gky8SLAPPRYoGewIbSvc/Zog++OvMxg+kMDGp
 +C9mjIWV+rrT6bt6c5KjBkE/42bqZ5THaEoLUfgzGuhP/PUHKyI5JxC3F+owxWNpfB7kDtFeA3z
 Yk0Am2y1AAsjqTGzDLnMJpNuFIZZoghdpcYJXcGJPZk+cauVsVa4n9fxRsSpvMdZFo6Fl7Qrb8i
 h+5fgjivCVGsZIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

