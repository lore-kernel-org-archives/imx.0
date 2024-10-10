Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAC19D08A
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580326; cv=none; b=UolRudV0D87wlYUZ0XkaLSCHy843g7jfllmYyljIQXLr4KlFuIut0Sko7c7PDGpMfObK+VBH9QOdcn8AOilqk00LgxlG+rN5TSFRbaV4H2YJ2Z6tBrcnVZN2l8CwyDUYHDxz31EckOWCkTsEJNO2UQLT+xoHqLm8u2k0kHZAzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580326; c=relaxed/simple;
	bh=JETx5J/sKCvPOdMNztGgJW5e9rFQF1hAwJoodVFMVb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aodFBbRTo68KGlJw9rBJbtITn3D2KZxA5j6hzd1EHC/vEP4PFxnhS9eOHonUhZUJ0IcEWwn51c81eXy53xdOMKeOSvfEd9x+ol5KGXEezDQd03IYsGTFvDjR9OmXb3sI6qGiJEUd7zaT8dPpDXyDzzyZGZw24QnEHR/Fse5djEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCLHw3pe; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCLHw3pe"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e10ae746aso925519b3a.2
        for <imx@lists.linux.dev>; Thu, 10 Oct 2024 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728580325; x=1729185125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhYysHcCoTgAnQmQiLxk715z8ONeu/3OrInyTwPTwgI=;
        b=LCLHw3peDIVkT6cpRuC7wFJ6H8G3lbNVELdsB9SSwfcsYltRMO/o4lmK9QaMcMyNyB
         XmIgkUE4CyGgR9VLdR5b8C8nPy4zw+vmBsqwWuH021e+mpuLFGJl/ENdya5ks16KRfNZ
         qAasSoO+Q1Kk6tTuFS/14r9AlDs3foE5XmcVXYIU/e03XGw0djPBVtNsf+CAqYqrBd2m
         Fd1BaiqJeo8018dat4SEHGro0Kovn1h48vBEAKPvr/Rtdd/ggLOp70xdgvABten16nEu
         6DVhuCRwIeu26fq+tWb2sAN+n8oc3GJSBi+QvcovXss0LRawygjsS1T+Y6LvNLDcKEL3
         xhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728580325; x=1729185125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhYysHcCoTgAnQmQiLxk715z8ONeu/3OrInyTwPTwgI=;
        b=X+58lXFeRX3vUINBNhhNEcGA7Y13Ze0x7RFXvPkaqEhJ3GTuGNhkWF09LaXbTzlBdH
         9j51ZeHKwPlLIkYVRNmL25H5plfIqfSzohjat9+foWKeYAl31f36j03wBp0kNof2kw3R
         zudXVzrlOXv8GLkTUfXgjLp7kjf5SWezlnYsSgPWFxp52ZLfJ2B/kFOKT9OcdkiMIHyt
         Js3g1gUVPkzKgoHKDo94fqeJzIV2gD4ScHERTbi7wKBz0Is1bjxa39/0yEssOY+evod0
         j2LrX9z8eTUKbuJ5oyUljESaURjWCS5JBv/7uzcNNXWC6lbU6IUFuHsjoNhSMXxWirhX
         EnWw==
X-Forwarded-Encrypted: i=1; AJvYcCVZQiIZCjkVi8govmmOSgetycemetKLRWxWt4/agwgc9Mfjc/HMXjU/AkcH2a+uhpDacAE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRo7KXv6aL0Rkx//rSQ3/PftpveM1fHgmtRpcvBJ+Gksq9jIjN
	Pq6zHoLyEfeZV5U6pcS7WAnykBZcGR+IVv8auSxY9cH5WaVOJxTF
X-Google-Smtp-Source: AGHT+IGZGyCCyr54kMNwlY/KxnYBhNiDRLZg7Mrdzaj7i6T146Y18Up7pDtTXvONDGA8HVHSAf2/4Q==
X-Received: by 2002:a05:6a20:c908:b0:1cf:476f:2d10 with SMTP id adf61e73a8af0-1d8a3ce525bmr11403945637.49.1728580324810;
        Thu, 10 Oct 2024 10:12:04 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0b5d3sm1251245b3a.198.2024.10.10.10.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:12:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 2/3] ARM: dts: imx6qdl-colibri: Update audio card name
Date: Thu, 10 Oct 2024 14:11:27 -0300
Message-Id: <20241010171128.107819-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010171128.107819-1-hiagofranco@gmail.com>
References: <20241010171128.107819-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Update the audio card name for Colibri iMX6 to match its specific SoM
name, making it less than 15 characters to fix the following warning

fsl-asoc-card sound: ASoC: driver name too long
'imx6dl-colibri-sgtl5000' -> 'imx6dl-colibri-'

making it compliant with the ALSA configuration specification [1].

While this is a breaking change for userspace tooling, it seems
time to implement it since no ALSA UCM or related configuration files
currently exist and we are in the the process of creating them.

[1] Documentation/sound/alsa-configuration.rst

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index b01670cdd52c..9f33419c260b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -136,7 +136,7 @@ sound {
 			"LINE_IN", "Line In Jack",
 			"MIC_IN", "Mic Jack",
 			"Mic Jack", "Mic Bias";
-		model = "imx6dl-colibri-sgtl5000";
+		model = "colibri-imx6";
 		mux-int-port = <1>;
 		mux-ext-port = <5>;
 		ssi-controller = <&ssi1>;
-- 
2.39.5

