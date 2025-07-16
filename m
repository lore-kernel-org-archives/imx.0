Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6592E2EF29B
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705999; cv=none; b=F0WRMsITmaGM5XxdofUePid+Kz+4OYlIhdc6iGzL2Y1Ys+YyX4w4pAkv1hGdMcKlDMfxQjVv1BimescUZocaLHMGJZYOExi0R18So9n+HGyOrbXsVatNYtUNYWgtNt1t6+NaJf9vPMecpff9q8P65qLLsceiU66KkGpEjf9KlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705999; c=relaxed/simple;
	bh=S7zflZfckkjVA+Sb60lAmOii8syH0HQaukr1eAjN8hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEqJWk6WNMEglIStIrrniO1DuAziXibUIbdS/zST7xsZ2mWJUaRRaHg6rckjfBHCyqNJAHFWqSb4N6m67kcj3PWYE/6Q3ggyy7+XKIsHiTkakC19M/f9bAlPbAg3Rd4jpOK4/p6xWPdgig63X4gm+pvsLUgpmOfBvomonUx/PYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+TBuw2c; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+TBuw2c"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-401c43671ecso239468b6e.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705997; x=1753310797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u/YC913AnORCbk7RT9GNyXowu0h11qkd01RjAkHwZc=;
        b=w+TBuw2ci1WcUG+K6wPv1Nf5k+eTgFea2ohouY/GuSfSQD4+VD1XpmQlLG6j+9RCYI
         dNldQaCIpkHxpHUTCsTOwwOxnql4EapCmZ94+h4Hvzdtz+LMDmU00bU39FkgkcWbVem3
         v1IbiA5rxlFBJplz+qA/Xb8wlPsPwfqPNTtJCLlmBxgrXVVOjWP3hHwvhJ65iNzeI434
         eiSphGdXzL+9/CxTrXYxgo2enKzS6wAOtBBj08j+zkvNV3szuifZfVEQkTKfFLRJkbLr
         vnFvdl/Nl60qxTD3qg2W/7uTHiEm9KoEgAf2IUD8cXYW7fDDdPhtveP5Jm2GgvJPFpfh
         0JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705997; x=1753310797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u/YC913AnORCbk7RT9GNyXowu0h11qkd01RjAkHwZc=;
        b=U4M09SquvFaOJiya4zys31P3rJeiq5SkWO/KLmaGaOsFLNslYSwxeAOGZAp3UYbOmK
         cx9RJdmAYZImb1Y5xS8aKXkgZIz/Zvh9Q/JOSWb4TfomwLjnYgps9RvWr9P6/PUfcnq2
         1n8Bdd1VnYIQzgcZkIKutQy/p+0ncuPKnQlcymHEkTvaM/ZWag2rJm+BFAyiflUbjmvI
         jenmTAKpT8OvsJyF7KVI1iiePwBN3EjA4fMzlpjXmGG2TA1DP5Epj1d9ZqAvShNqzB6F
         sJdCaNI0kHV+gYNHw3ifA8HiUtHsRlWF7Qbhk5JfYojB4qzqGQL0YHjXpr9JzLivmS+T
         RQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcKEEjOc4Xv8S6XSStnty0jnZPVM0PG4ILaVCMcNTN1bf8jmEqhol/msG+kSMg49bs92I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxot57zvA+CQTHJZRN2YHIMPa9kbVd5gYA2EeZ6qHR7XiBELMDm
	AOkGrq7iVdYOXOdP5U5KPbYRDtWMfECIVqFB9v8ssp8TILO0pYkXjTV0esfHg5HyQEA=
X-Gm-Gg: ASbGncvgvs6pyK/IFzwl8Ac0XakKK9rSERBSLnVdxyF4VEjvqwElFt9aI6cc0s+db+V
	XOO2mNjScXw1mmoUN3lTw1DQD5zU8n97a0QDSSTo97+EnjBreeOSNFb8AbUUiny1nfi93+gh56a
	R/H3vpox14kb+4nU/HV4Psv5PjDg/nSEhj3IYzxF7AIYUnxhTuxc0l3iS9eyyaAoN4fYYtkntom
	q8B3Vni+Jv/AbwCqqcOJyGWQCsBSUlUclpIixRCE6yivHSi8cwcrU24C9uaF4eAS/OteM9gyWJ2
	wIx3WORpP/T/tKQ+bj4dl2jqjxF20l+6Gcl8uPc44NIbyVx6wPJ6Lp2FKZ52tlKOMZ86hOCAGLM
	BLJwsfdUegasJ+nQQv2eRbFskS0S7uA==
X-Google-Smtp-Source: AGHT+IHW7jvGVN1nZDNV19D23iLay5SH3FruLv6n11izEuEkrlyk9Tea64PpmwgpUO6OAQQLBc1AXA==
X-Received: by 2002:a05:6808:50ab:b0:41b:2876:a93b with SMTP id 5614622812f47-41e26d2426dmr821249b6e.6.1752705997476;
        Wed, 16 Jul 2025 15:46:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41dcf3be2a7sm466494b6e.23.2025.07.16.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: s32g2: Re-order usbmisc device tree section
Message-ID: <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>

The compatible line is supposed to be first.

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 089f54415571..6f700085dec2 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -424,8 +424,8 @@ spi2: spi@401dc000 {
 		};
 
 		usbmisc: usbmisc@44064200 {
-			#index-cells = <1>;
 			compatible = "nxp,s32g2-usbmisc";
+			#index-cells = <1>;
 			reg = <0x44064200 0x200>;
 		};
 
-- 
2.47.2

