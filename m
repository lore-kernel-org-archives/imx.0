Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0C253F0E
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165601; cv=none; b=l1ONFeTNCPe8tC0n/SL6EDauuIxum+0n0ayqfGGHAkhcBKtpus1Pydfc1NFg0gzcjQ14HpzSiJcfobxBSHYFqFUb/q0+KwWb0ZivOrdcG8Stu9590V3y1hngke8rfrca3PtY5GTuYT8xcTWNhJFdB3m8RPwnQ+oOM+IM4vakgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165601; c=relaxed/simple;
	bh=kOraS8IqYhByuh3EYq/JHZv1tOR/Rwv4bGyv8G1S23I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9eo7T2jAQmKOFIM8iaODKj3lUykmK1NSBIU7irM58f2aGIQVGYZQRb7OGnHDvArL/+AUvA5TcDolHT4jldhnbXycKawV/7YAk+skMN1j3e3xdPhoIDDcK52OtSM3iTixH9Od8JuMqBmuayJaM3nZMY26OiJ+zuf12vhwtxCpa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrsIg5O6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrsIg5O6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb86beea8cso458480666b.1
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165598; x=1740770398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PW85pz5cGLvJh0OtF1LDKynxXRX33ioDpLb0ZUqgao=;
        b=OrsIg5O6GZ6DpGbUr1B+AXsNuugAhR+gC8/tOdHUbZHHSiLcVI8qPQ8DBgZfFcGp1+
         D9spESRyuGytftzc55VER/oo55/pSNPx/8jjoq1rlo2VYKfnl+NR6W/Y7jscNbu0EVO1
         tzHY8MRDFURgRec26rld5DQScsv2gZ+q0xNwZedxAe1rxgy95rF8J85c/3zLcXXEL7sJ
         gEUba9IC1AUjD33siWUCssfCRVyQ4+GYwc9k2dFM1XDPXCeuzleEiWl3fJLrHQ5RUTDT
         Rh1hx9jt5zJhFbDZG/As9S6Prm219/vWxr1etsKYOTPJxueoFO6+Q+ULrmxtMi9uItj1
         cVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165598; x=1740770398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PW85pz5cGLvJh0OtF1LDKynxXRX33ioDpLb0ZUqgao=;
        b=I9WqbmlXkFJNzOGqvfjBrksvNzrfYRmrJq5GNMGI5TobDvUum86PBEZu53dLHlYVKo
         6hq6ojH4I5MlMjrzNT6hOjs3S+5pHLYs8Qo8kVWKCJNNBq3TbiNrgUPbG4+LPC0Bs9hR
         dwSnfh55Z/f4qlRrQtw5ojbND940t+DV6UpQ5ZHsIPdNDO9urL9cqgCERYPDEZtydBpp
         TncrnXccqhDDcpr/Ht6x6ggLY/WgPHjfuxTgHQQd77g9tfamC1whDTLl2q2IdF1WV1ln
         i26u7h2/FoZRpH5tF/SaAJZlfWai08te/nQvlI3U8QIAMjot6MjLPnko6E79PTydtJK9
         WXIw==
X-Forwarded-Encrypted: i=1; AJvYcCXBp5ZKvhIM56lX2Y+OJrIVH+5AT2O7gO8PfCRtzKtWQSEJ3vdoA8vCnk8jBCMjlYD991g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6J3sjvwGYi2vwFbiNL6f92oBvNsm8rNBrNrFTrnp5WmTCb9xe
	CUlFm/43uu77dyi7Uv+WlNvVRgGThTz0+Rg6ASsoQGRfi3IIeMCA
X-Gm-Gg: ASbGncv4SvBJPWscKnVLYoACQIjMNudlaqy2SyhVc3PuM+sDx2rDJFTDvpraPTmkr+g
	tyw9OzrP7XLwJeUCIGAEWmu5wkX0xTp7siHFk6dcRs8x62QTyatYwqPKr1t0vzRjPEX0maDTES/
	+bZFKzZE2TxTcl7foLGtLqvG9t+AsRwIcFoydopAbyN/fZ4A3GlMag8rP5uCLGsabKgQRrHmdAV
	i7LcnS1KqJOyIp5rRnuBFF9bIyC4ZIq0MRl+XH+/lbVjmEPKqXb4yxzFlr4aGrRDTYBKiVCuKSw
	PCaIuDPVX+GZwL0OXChZUWDlAs9JLqQP4PKydgVN+SZmYpfj/N85D4iTous=
X-Google-Smtp-Source: AGHT+IHGNlBjv0prPEJON601/v7KmS0YwqUhGMf4lS65c24qSw6LwRCeA8Y99uRFtQLi0vwiyNDqXQ==
X-Received: by 2002:a17:907:6e8a:b0:abb:e95e:f2c3 with SMTP id a640c23a62f3a-abc09d356f1mr472726066b.41.1740165597467;
        Fri, 21 Feb 2025 11:19:57 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:57 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Fri, 21 Feb 2025 14:19:09 -0500
Message-Id: <20250221191909.31874-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP may want to access peripherals on AIPSTZ5. To do so, the
security-related registers of the bridge have to be configured before
the DSP is started. Enforce a dependency on AIPSTZ5 by adding the
'access-controllers' property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a1d9b834d2da..9ec51e7e6678 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2423,6 +2423,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

