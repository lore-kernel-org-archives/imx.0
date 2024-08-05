Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17891494DA
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880141; cv=none; b=EuuLnPQc3PtMI3j7oNM0SNF1AgBl2n9wCwJbmAK5wU+2EoXvAdjgQ2O1gsWR3sjAeRtWO+gMSAVB2xMTgJLeZdbV+RU3e/4200WjVOcOJ3ejIINV9zU7Con8eH838E+RyajVgFVncRDJugHNDsmb/U1aUldxvpIZr30DLtE26v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880141; c=relaxed/simple;
	bh=llFrI7pvte/r84mBKKHnaJ2age4typJ3eCrZg47lo38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XqptI3ZIWgGYoNfWSUg/Ia1iOy/QJrHLXCPY6hcS7QXdD5co287Dkfh0VLwFzaWNf11qL3mkbQ1RAMkuBz1YSSxjg1kYI5ePku3PXQgAj/SgFR2IZoj2BYE/xisldY2q3cw2I7gysWX/8LVGkbGjTgNZhsIQAVmZroQsru3yA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSVFrH/F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSVFrH/F"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc611a0f8cso79363095ad.2
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722880138; x=1723484938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn4rsXYYUAtI598UTIBkOn7PpCHc0T68WG9CUGnshMk=;
        b=dSVFrH/FKtmZ+tIrkxGLs0ez7K6v017JfTXejkcAlqOVMfZllzXWjc+7h/T4mz4u3h
         XlEnlmCzy8Cbru61BdLOffSDl+w0v3j7pu61Qx6bc2Zzt2XZxWkLcOZsD/1s5D55WOfq
         yU72rdwL1rBKgeM6H7sIjsT+u9X7czU/MQANSvP6vKsUWg8Emv1ahflOpikruPQPGMDS
         RDOHz4omwzgQtFb+DsYMRsK2hdZ1xkEyAsJ5M/H96hcKAkCONgug2ybORdCgfZosupNc
         KKjO8hJMSig9TgXF9wnL00r3kG7L/2MORIQYASymAUlLPOrzlEWNXacnPcbGoimtKmix
         CtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722880138; x=1723484938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zn4rsXYYUAtI598UTIBkOn7PpCHc0T68WG9CUGnshMk=;
        b=XD5B0HaqcvQt0oHOu4D8pNMgoWgNxiI7NWcSJqvfoq5sed4jGjl8odVPBVMp7xAjdF
         kY8iYDfXiZ5LLCYL0k0DJ5CGxoEFLCBZVuwVeeEg/LjAlqBCPyoxjbSg8Bu1ITZl+KAM
         jKdBSbWJ7LM3JAzldaCp2b7+pVSx1YP3XTzUdVHXXJUhnls2Yh+3KIhBsxUSAJidJnV7
         VgNtqEHQkUOcNta4s/pgEhKrBk0fx4WbPPFW1N+t9kz0Fx86NciNZGZQlDYu7eppz5HM
         aGhevUhOabAauAOO7buSj9ofuIiqrlUp9mDdQvbkAhTxB2PSfacJv5wo2pkTnvf6gYM4
         Cjcg==
X-Forwarded-Encrypted: i=1; AJvYcCU0lXMApinVXs91TyoumoVe0BjceWHbfe6KjzrRbt3GcTxuVwSHpsWnaT+BxYE9tuu1JVdoggFCLTvglD2eaerBL2ay
X-Gm-Message-State: AOJu0YyLOC+we4p+5UH0nmPuK/d5CHkVWock1ujUjOJ/EpFtQ2g1K3sL
	wS6SnAXXhA2Uvrhrv47DDYnVaYt67mBl1b7zxMaARcZ3fOGwXFHi
X-Google-Smtp-Source: AGHT+IEIriqBf4CCVf+NnuVLOxRFwo4euNZOJIjez7hPS7Rm8hIVN0671My1phGGrk7peFmNy9R8nw==
X-Received: by 2002:a17:902:ecce:b0:1fd:9a23:90c4 with SMTP id d9443c01a7336-1ff574e40e2mr133971405ad.65.1722880137802;
        Mon, 05 Aug 2024 10:48:57 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19eafsm71442335ad.53.2024.08.05.10.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:48:57 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>
Subject: [PATCH] arm64: dts: imx8mp-verdin: drop limit to sdio wi-fi frequency to 100 mhz
Date: Mon,  5 Aug 2024 14:48:14 -0300
Message-Id: <20240805174814.1944742-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

SDIO frequency was limited to workaround some instabilities, however it
turned out that the instability had nothing to do with the speed but was
because of an issue with the USDHC IP that was fixed in
commit 52e4c32baed2 ("mmc: sdhci-esdhc-imx: only enable DAT[0] and CMD line
auto tuning for SDIO device").

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi
index efcab00c0142..cae06cb67cd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi.dtsi
@@ -75,7 +75,6 @@ bluetooth {
 &usdhc1 {
 	bus-width = <4>;
 	keep-power-in-suspend;
-	max-frequency = <100000000>;
 	non-removable;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi_ctrl>;
-- 
2.34.1

