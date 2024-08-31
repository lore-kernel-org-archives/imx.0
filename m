Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331617A583
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100114; cv=none; b=mrN2UnCKqCbi6s6GB8eBeXK26NdXPjie6DvShI7s6zt1p/feKuOU5QvKOg7cOklYxJqCnC31/3xHUbJISASnCL0ZHM8kTe1L9SojfGH+Rn4W9fGuORcARBZjldhz5TqVaHE18LgxsaAalkpTyI/GqtstHhWoQCQ2qCtYo+gspk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100114; c=relaxed/simple;
	bh=fMi/F2bWFx1Om7N2GGtWy8mpA2P8Y4HhuLM31ItDwwc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XSpKVROQ9dhwSc0wyYaGp69UKGuVFkhwe4i63ip7IY0y7hN6zGW9dZxyUTFGcFBKU7o+7hAx7q6Hp7ANjieQvzaq21Dl6THCaGkFaTvGGs3k/PFKkvVZWPvlV1BEA3TwaIDzZtuiePQTKsf8Q/Va7V/65julHJfpJzVbDJ40U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfJELBVK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfJELBVK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb8ba2814so3242775e9.3
        for <imx@lists.linux.dev>; Sat, 31 Aug 2024 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725100110; x=1725704910; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOBAoeM78CK6pZ7Wc41orjui+qXbEjwvrk7Kb2A5zBo=;
        b=YfJELBVKNKf12c2zFRnvipCQIff0tkviDyfSdnuYnSMhek4KNdVGy2A7V0mYdc2Sm9
         8o0IU/Xr3Es0Mgt81tT81xXEgyP5KuhUWyjCEsc/m3MfIQWXJT3HNx8DrEk9dtbmMijd
         hncIbJWCASUV0kMbr/LuedrHOT9baYSHHhDx7IBTTMtcUk7yZiaLCUUYu+ShI/sWQgK4
         xy+9NNfxdm9U1HGetB/xaKSmCL41QVQ8fLAZzLgnrHN29hWjgffo/8xI3QAGj8Rlimrp
         iANijBrHgvcCuibec58tN1Lce+BuKxmh/7a+IkCihx/2/32Jz+mDw66rLTuU81PTR812
         rtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725100110; x=1725704910;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOBAoeM78CK6pZ7Wc41orjui+qXbEjwvrk7Kb2A5zBo=;
        b=COHiirdyiqaA+uG97T+CMKnAw0mFyrudDamb8X9NyQpgZPTe0hjCbOJhBh+X+eNKcW
         AoDaWQDes6isy1hMP2LmaPLMHT1px+SfxxNjT7rqGKcBQUQPticXtlSmaXXW3xCmOaeF
         UXRKmoLgw92RBjsKq7xCZAC8ydNzzsK2fhal9JByHKIzj8+noB2mv9ZGIIVaikm829eS
         E2fDP3lJiNvFZDi54s9B3v62+kkD6wAOz71k2JuENG+pPSjp5VCXVzykYGLGju34gG1o
         aCWm4Zs8BbaZyZGHyBwxZKI4kUCJkM0vcVZqbKOJMVMR7JLvQQ74ClKDXv6rhtjYA4cg
         a8fg==
X-Forwarded-Encrypted: i=1; AJvYcCX0+Uf1x71PU4SUJ+Y/uuHnKLDL4pf5iFR6WnbOQyM4lJ5Puvf3dWVNEkdC7ooRunL83os=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfqZmbwcK/gTDZqBf8ZKvQQcM08Aoz5KOSyl/ZHp0jaQ7KCmg0
	8eJ7W/nwKwt4fMsqn0jdPznaH9MmYuVCpC4/4L9/CmcLScjaG+lNWSp1MmZGV+M=
X-Google-Smtp-Source: AGHT+IF6f8j8De9d5fNwf9SYsUVlrLpIHXrtLpYGE+gSm07uV2ZLwuiJxGi1p7/8DDGiwBhSX0oC2A==
X-Received: by 2002:a05:600c:511c:b0:42b:af59:4209 with SMTP id 5b1f17b1804b1-42bbb483c50mr19175505e9.6.1725100109277;
        Sat, 31 Aug 2024 03:28:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63aba23sm104502155e9.21.2024.08.31.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:28:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ARM: dts: nxp: imx: mnor pinctrl node improvements
Date: Sat, 31 Aug 2024 12:28:17 +0200
Message-Id: <20240831-dts-nxp-imx6-pinctrl-v1-0-f5811032bd40@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHw0mYC/x3MQQqAIBBA0avErBswC7GuEi0spxooE5UQorsnL
 d/i/wciBaYIQ/VAoJsjX66gqStYduM2QrbFIIXshJY92hTRZY98ZoWe3ZLCgVqQsmpurDYtlNQ
 HWjn/23F63w8h7ht7ZgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fMi/F2bWFx1Om7N2GGtWy8mpA2P8Y4HhuLM31ItDwwc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0vBEMuX2Tus4Toct0KHgn72l/3lfg3LI4io8C
 5xgP2MtQSiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtLwRAAKCRDBN2bmhouD
 14KmEACE3FzEu4U2ntRq0wr+dhcT8ZXqSnSvq3sy5IgWYWvRMBUArzpIoj4JM1J5BCs6my3SXce
 LgV6fIqRJDg1Y470ONVoyZ9wDNgkZohmJPj3vDnpzgtaiBCg9A/6iHzPidHb/QhA1DejZu23ugo
 hkSABbr9/LJqoU8r9iwmf8EYOehWOrFfj6ZWkVqjzddR2kBE+amAEq2Myxu6gwIn7v7Y1jnWYym
 5Akq6IAweJAQNYB/B704A/PBaJLpcAbD3xqhZi2irtQIMiw7WedrONXNcRkxSYm53skM5xRLsRz
 1Nxed4lcJOgrGpjPnc4u76zxIqhG78u/hUhf/uVgAl5m8Y1LEcWWNrjQjNvCjaqxGSYpP3UN9IH
 AgmlhAMiVA+cyxUH3xGEFF1A94cNzDQtx6954aoOWXNfWDdoLb+81toQmTFwBx9noa1GmMOx2RE
 SQppar2ZNmZEHWpyCcUdEnN800dCYstGXRD9y8b3b7oCUvoH9zdJSvpAU2dt1/XFjuEsAjMsdjh
 yqpPtbbhQJ5+jO55QWg8noNT7x5+Dsw950W7e6iBYoPlB7xmx0/UYwFH3hLmvNN+JCDe1JcrRQN
 5wmmLY4oRSeZKRg3z/KBuimxJuz7sYE0wZeRrBa40X20lX6wpAUQFh9IAkNNL7+0ZvkOaRL6oZ2
 zzsef3WBAE44WTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Align the pinctrl node names with the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ARM: dts: imx6ul-tx6ul: drop empty pinctrl placeholder
      ARM: dts: imx6ul: align pin config nodes with bindings
      ARM: dts: imx6sl: align pin config nodes with bindings
      ARM: dts: imx6qdl: align pin config nodes with bindings

 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi          | 10 +++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi          |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi       |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi       |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi             |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi        |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi         |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts               | 12 ++++++------
 arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts              |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi        |  4 ++--
 .../arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcexpress.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts    | 14 +++++++-------
 arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsom.dtsi      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts              |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi            |  4 ++--
 .../arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts         |  2 +-
 .../dts/nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi   |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi     |  6 +++---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi            | 18 ++++++------------
 arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi   |  8 ++++----
 .../boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi  |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi.dtsi       |  6 +++---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 +++---
 35 files changed, 91 insertions(+), 97 deletions(-)
---
base-commit: d24ab964cf3b2fb7b24c3651b46f107037a358c4
change-id: 20240829-dts-nxp-imx6-pinctrl-80e6d6b1d8a3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

