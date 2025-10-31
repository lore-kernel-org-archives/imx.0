Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CED3254A1
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915071; cv=none; b=BXIi9GbB+syKixKA7amkAAkF8qe//C4hJCkp+aAyrSbSO8NxtSF5mro9/WMifICPkTxFOY8EKC3ypUD0xUJsW2H4L+V8pkP/rCLEP8Fk2l7hsBiU6PvWfDwauU+C6DIaehrKLu69IWgcsWdQRmo5wiA+ays4wcADHy0l6/buxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915071; c=relaxed/simple;
	bh=Yu/2j0GxwZBaEKqZGl6yxDClZc58fe7sUMa878UE3Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKAZg4GOg848sX3ZKTNG2jIuEWd9zjve575FG29BBtFrGSNAAV+zePrczjscB2F4YH8N0Z5h7IZ4umxA/CvoCuQAqd4gn5MMztmqOs+GolUY8MqQMqdp7gDmoT30olleFHcpXSxK892GPZfqTUPeeiuaN3i9GaKTOwXiJ5OaIrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frkqnY19; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frkqnY19"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ece1102998so1575366f8f.2
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915067; x=1762519867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvXLX7+QZgiVzZvZ0wG+LadEzSHLnJ6P5bBzFMwgkSc=;
        b=frkqnY19klgnjTP9b/t/ca35x+wg2GUF94tBLeoSPmw6yPhlkDh9a9zxL1m8WQB22v
         5iVEU1C2vgJyTWQmpC9+p9KUXkR+56rPQ1vaHwoHY12Hb2Qnrp84JszeArtdbgOfDEm7
         swebhxt8WlHW2GEuqogc5bU5LP/88yZGbu8zuKdrtB4VvSeDbjKV7io163e8F8NiJmsk
         ArSow7ldYRjNmjyj9hxGwq4r2In/f4WskY2oZJccQEy7wX9zZeaJqowvybkkSQ+kkyAm
         0AtAWCDmpgLSDfrk98l1HS6PGOKEo3mymKpouHBuJo3R0sLGe8UXY4CxBpy0Rsj3zfQO
         8u6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915067; x=1762519867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvXLX7+QZgiVzZvZ0wG+LadEzSHLnJ6P5bBzFMwgkSc=;
        b=mc/zsNtSxADx1zY8U1S2+jB/yVdqoP49NN/NGhLEKJ+ImhgvgEjrehaX6jibPmbY1i
         Ls59KnrLWpabNX6CbsMtm9P33bxyY0D5pTHtgCkl7s8rRaSdwHAnKmbf0Pq5RCFsj6eu
         +RJNrYue8r8JhT86oQjZHBk/9IQpPS9mqauDa7RSESYUA1FMRnL43uOb08XjZLGyqtlr
         IBXvskK26PWGswPEgMPbFd4OmBkLL105blNG32lVFt89bNoLsP4PlAa7M4jE54pPvtos
         W0szjhsSEt56wl/6jnKbJRQ4HUzv5pTnaZkt+ADF07o1Jgb4lQLHcOlPBOdSgjySNH2e
         Iqiw==
X-Forwarded-Encrypted: i=1; AJvYcCVnxZbNgeAYM5wZJvGT+EvgJ17ds7iHgULhElmfnJp/ui7aYeaeR5/9mbYASRjVWeTjGb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbN7gRJwguJNzWpyn9yEsO0fWoPk1674ke/6CJXXVwfOX3bIHC
	ku0ltzCryuMF7ECllDD1Ha1XVkJoWKjzgjji28VGSVhMN40HEcKDydQv
X-Gm-Gg: ASbGncvxupgqHyN6x+bhoIs5blJJ5j2oOQnJsauMg7L6kbIYzwmUbjUgYHhKjzQDkCj
	16f5gqUE604BTuEjv0SzBA3QTzLsfTcuGhHlkuW64xz7qFeItpYMAwvbqb/YuK8J5qc48bNOoor
	iaFl9MRwCpwDmTvfhQ6D4dG62e/stiEx9ICCxQSKAVy3ecIt9B4ruOD11oSPk0amqZHWxmESiqj
	eqvmbG5L7sSiC7/7sXUww91rKgdWsuGuvBnkDTtthjX1YgcrnRIz9undcps1bo8/EuQxL1YsFc6
	NeEfXeHqGz2D2yVUWHRY964jwBDMpXo2x1MVRFlH2LmPvkW2G+RJN0VhqvKVNuFQeuJgI9d+DDp
	7MQZS9atHkZzM6OgNQBX59jte6tcHTMCSljUkXT+CTHlYujzE4y7+bT0b0guci7WFX6jXRCpdsl
	Z1DdjwCgYux763T4EoludyRGdUKsXb910llptuZ1rAjUVYVIH1SvWAJcpBuCgaQiTTa6EKN4VWn
	DRWCg==
X-Google-Smtp-Source: AGHT+IER0uBeKPOPxvxxiQO98NZsaBc8tk7mKIGeshxcLGZG7k6FCf35yqXCrk9lgrCyQ4EIIt8pbg==
X-Received: by 2002:a05:6000:4713:b0:429:95de:163 with SMTP id ffacd0b85a97d-429bd67bd22mr3151971f8f.20.1761915066584;
        Fri, 31 Oct 2025 05:51:06 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f1d4csm3144559f8f.39.2025.10.31.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:51:06 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] arm64: dts: colibri-imx8x: Add wi-fi 32kHz clock
Date: Fri, 31 Oct 2025 13:49:42 +0100
Message-ID: <20251031125003.275033-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The Wi-Fi module requires a 32kHz clock to support Wi-Fi/BT low power
operation.
Setting the pinmuxing option on the connected pin to 32kHz is all
needed to generated the signal.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 318fe4db1b64..32bca4c6f37e 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -490,7 +490,7 @@ &mu1_m0 {
 /* On-module PCIe for Wi-Fi */
 &pcieb {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-- 
2.42.0

