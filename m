Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E44657F5
	for <imx@lists.linux.dev>; Wed,  6 May 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072538; cv=none; b=YZXe3ECOd/HWI40n2cWqkRG70ox3l3nYHTepoBlda5WMrqrRDDQjSZt7JvbknkMX1x/eAlrpjJED1jcKg/8X4tyS8HNvXZezxG9n9VWwc9On6AKsYRUS4D/hOF78RNOzhJmkfVW8e/zZpynBOB7O1bEF8Fguwh6zQTkaCfIg51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072538; c=relaxed/simple;
	bh=utTy2N5m6iLLqToduaQBSAYCHJiDkqInO3VstDOPoxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecp2JuQEg/RKR9BTh+j/Wcnr4QaFU0x7G2puURvR/3thoTi9wjtfS/nDXn5v64dDfz+wkki8MMt7HsTAnNhmLQVJzTN5P4cXQUOO7fW9hFHNAdYyQkwCyVEDFaoaowI9ej6bheJsphRDHYTbs1ulecxXErnUjpqI9//NLDj5ixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhARoUxp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhARoUxp"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891febd2so741738e87.1
        for <imx@lists.linux.dev>; Wed, 06 May 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072531; x=1778677331; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=WhARoUxpJyDAaxUQHUc24kpjWtzOGcsYZfQMNQ0al/VWbkquJme7Jh92DdCeCLc6GB
         qnAXt6m3uzABk80XabucQOksq3LsdbhPztn7fCbkeVf2NyzIgcTn0951ZBsLx6D5yNDS
         KkfkF4tjaZ43U6fmAA4Kflk3lwr1db7fuvHjlBI1CbHJAOQbMOCM81PQBPBLVRlt+j4U
         dk1RD0QY8UzwpBpgVVsMlVChN4rBdpbt7L16ESR5Ojh+uN/SPHZLEyTG1ffTujRJVqij
         OFmlJ8H27DIsUzEigJaj9G5uOw0dIwmjHoeIAEZJS6bnBSJwb4GFhWQWnTp/2EdaK7Jn
         GMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072531; x=1778677331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gMeTRBDmDnSb/6bNUDbfXXIg58i3yRtlbEoK09izD2M=;
        b=Mle4gJILg7FeMD55NyqFTGpQ0eAPsUrtdQWZH548yNbrjdBW4wl5gRdzQUb5v1t8zH
         fyH23dJ2Ca1hYvTto6klAdMAN7BhmPdFFJ0JGRutQFsDW1dYxmLLKtElUREkbot+qkHJ
         zo78Es+G0cGLOwGKOhIWp1TbgP9WSeYW5HsflbM/BQiEmUhYZ0cCGZV/SX6PBYNXPXVj
         pEPc/jrkGsPWXi0xghK72NerI/geagZ9riHFTTLsbMSQ3uiJuEXg/mMp2KdqXk0lFhc9
         eUL1OGz7/0I49qnUkWFC3eyLI96UcfdSjoe4dcZojVfvxlEbCbwq7fwYemIUkvd80Vod
         I6BA==
X-Forwarded-Encrypted: i=1; AFNElJ/kxFhNHskh0HCoYi+VBROMo0fYeqrMGynuXRpvY0j6/+89/XjlcwXZS2/HhG+gr7zXZlA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrKdeFd9KiEbl8gojDv4yuaVrq+ZZw+19BDYoPZYfu13LBBuSL
	QoT6zElHcmFNbKKNpvtjVzlGYmHKGRKqCWqNoewMueAVMCKXJSTeInSK
X-Gm-Gg: AeBDiev125Wx+n0uxqYtgBYY7Bpf1AU1yIprOl9CIQqIEkQ4TG/UGU9QuPOwEq1F775
	5LjYE/KIWeDH9z4cIy7oRRh54FzyVp8NPBUVuALpPocnBdm7yptUZ6tx0QD3C44YrzVc7qm/gyq
	9Pi0Zfi3tLs2YoCqswxKsMJ9nRiYFmWN9Llbf0hrhGaaq5IXBA3iJWaCy3kNwWST0cqAICOCKeY
	12qzdUZwOMLYOZz/bqOcJ0wfWeMljHf79jPgV4bksKEcqHhrv263iTQ1zvhcMsQJPTGIKW+ou2j
	ZNqpUsps4OA8/MNOB2ZnVm542d/khVGeZdqinqjDntmX9v45PRXRzh6JKZfyb0Gizvr6ZhpC1G1
	4eZlrKPXin0WbMYH0jlUGUMJydWlhe8QCDELh4g2CgB/+/yRw3l5l1rzHcd6qiDnxrNfIMgu63s
	984cayuwcryTsxikCxSkQWBQprqNIukf4ZgZN/MLvv2G6h8IjuQvEETF4BeaFxVOGFnCKDnnfSZ
	y14Wdmv7lynvcFYnbJ5k3ajkn6vn5m8RiL6aEIC2tKivDP7pOz5R3ynwady0Y2OCPSbDu/JNFdn
	TUI/7//P8w8=
X-Received: by 2002:a05:6512:6c7:b0:5a8:9135:127e with SMTP id 2adb3069b0e04-5a891351b19mr136583e87.18.1778072530001;
        Wed, 06 May 2026 06:02:10 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:09 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 06 May 2026 15:01:55 +0200
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0

