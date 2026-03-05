Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46A3CF66B
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731500; cv=none; b=Z1RoZNy/cQ9jMZUdMiGbhLJThPKaEknm/QC/00w2OCE+4wXPInr7vctXT8UzrAGzvNV348scrogAOQQ1WvRjr/9TnrVjBQ3BtX5P/CcW/BG8l/TaSdNX7HEwTN5M/HsNlNYljf22Bd6vtAVa5SCWu//RhTSkSPRZnJ8JYgcd6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731500; c=relaxed/simple;
	bh=wkInOjrZaLypG+YJyMOElL91vQDlGMgZZRetwfb19jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZKaIrTOQvpNXHdz/ZcbbWja2hb9r7fTpOb/PLMvONdzEGNSBgvmL76hGk6AYK3TE1HjujVzJWxdFgm0YId99Bk9ECPxZ0tRz9ZgPFwVQaMJRQsesboMmwp92kbR5ApmX6Q31q2rVt4jNfhsrfkj/tk2GMefjMrdGlLTwjsQ2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ/NkLYA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ/NkLYA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48375f10628so55684165e9.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731496; x=1773336296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Zg/K+szC5UKXvUnRETUoIREZ/EKs2+8N6xJphLqr/M=;
        b=dQ/NkLYAjQE2yF8+HD7z+4movCydPJDc+lyWJylav/WwLEXTCtcndO8pKZYXpbLUmM
         D509OHLs694xzaprX5CivPOdmp3R63yYJ4uM4sdJnC7J718GGmc183jfjexWXk7Bd1B5
         bpMmX3Er3g6OX/m8i1NJitYDzcDri5NHkvG/SM8elzPcVFNI98RlS+b0ILNPH2uXGpYf
         +/of0w2tDGt6QPTl+K4GU339vFEjDqlHxCvWCaAkqJChPoZwWE6iuuKYgJA4fUk01O7H
         2CH2lonpDjG+laPaXXW6AmUR6aKUV3u59qEHy5zjPzy7RK409slD5FRYVoWj8z5HgWoD
         EeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731496; x=1773336296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Zg/K+szC5UKXvUnRETUoIREZ/EKs2+8N6xJphLqr/M=;
        b=fK8RPxVpUGGRgRiw8btHDwjajoBGzkE7/s/ys2Y7OiCFfAcQUmdAjUgFJKFmC4SXwC
         QcVK5pKGn6uS6sOmvSChR2FPISBb8K5q3dwOEiYRjPvu4c6+mEL9Q11h/uXv7XK1BmMS
         pbq0Cl3Cjm8ZjJSPBpGeQMgT/Nu+py9gHat1yf/Mg7LPktWgtEIp2IiFKueGqW8yF537
         aOgUMwtOX05x1r7+b6+t/thl1Va3u394qxSM7CV5NEFvmbEOZPhi0GRm+mnhfb9SaeD1
         C7rDPgyEKIvw+Gxz0RkbY3o/Gqv8g73Q9Iw6Vyuf9i4KYJ6Y49zCeCtvajmNFOthqzRc
         vGqA==
X-Forwarded-Encrypted: i=1; AJvYcCX8l7L6B4uA7x6LvDWx45EaKoqGJ9tXsO118xOikzJ6lfo5MpBuAYXhl58dViY5nseMuGc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6cH1Kmu8u6dpICguZS+eRDoftx87RcVrJRD97rmiEEyexCiwo
	jRUuF6n4lbta+4z0nbHpdpEbxDfr103+xgdTKBe5Tb15xi/9i73ADXdZhA71j3UU
X-Gm-Gg: ATEYQzwD3+XgWCn21dpx5oh2JDz6bI4c4buPFlqNGtufWx2W/UPrJ5BW9VTsjjWunAu
	Dw/iaqC+PNn9Dn5QO5oHi90eR0g8rtfe1esE1hufxtdX6GrbDgbVAs7+zl/yYiCfCT3OlLML0Eg
	6sHFiA/ODp/G5AzZPxUuGZtuJLPZEyEKGWz4wLwt2uU5iOGKdDPJ0pndF8XzHgGVSjdK6EAAyt/
	A3xfMkdgR6PhCEhrv+Yhkbptrpk7zkgbL7kgCR16+1C5L+gN/9sVnZxkJBu4iOgNCMJ6Q4alXSG
	7vVgNY0fO3U911Ks0GKgDTODjIFwdsntUwmKef9mnzHOnXmmgEb1xsvafuDH38CAP25+TYL5qCY
	vbNzeJ1rQ3CdSJhJTQJxm7j8eVRpNdILcNf7Z2vmGLWCipAW9vZyhK14AqF7UkxnlRt4vcJQdbF
	NbXY8j+KWf6BpLzhjPqIP8IA5RaYuJoWTB65xEGtkbM2oFeoV/Ts8CCDrWNCsliElXsSxLdF7+z
	94Q3qIxb6Hfzs+bu0TFSBRv+58=
X-Received: by 2002:a05:600c:3b21:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-485198955a9mr118647745e9.27.1772731496189;
        Thu, 05 Mar 2026 09:24:56 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:55 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:29 +0100
Subject: [PATCH 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0

