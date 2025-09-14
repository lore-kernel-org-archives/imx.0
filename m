Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B526F2AB
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870186; cv=none; b=VTHW1N9tSEGJ5Xk1EaGz4yrWEnWHlab64wDLtFdZHE5CobvkDe15SFk4b/SEGHNWx6egLhUZQHB51wqGAQTOiUutN4HFYydVc4AwDjsxFb07WDNH56uth9olprrYxmPEZseknjtasycpPSMoXXykxjbedq6Szk5NSkCtXs23y9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870186; c=relaxed/simple;
	bh=7R8rcOL3f1HwsUpPHaL0+BUAREAOiXb98Mm1tlgtyCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbUcrB6IYxY9VSxl78L4tsQEpaWkOFsM4TIPdPdA+7ArW+Z3hnORO7nLu+YeSFT1K4N5rXGlxe62NdvZwtdiOMcjCbnS3L6wVe7t6VHP+G/W6a5dZE4Xx2iGwYq68UftrrhjK1HxzJ10xD3vV3q1wnKs3K1/fIGRrZiunBtjH7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dhSBETYU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dhSBETYU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso6022438a12.0
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870183; x=1758474983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=dhSBETYUTka8rniz/3j48mYW7w0lEVpJnNpXR6emz2VZNQE1Kpi+6fgXV5JM6EgpQD
         MfQ59e+1/Ubhg2k+sqDMUtO0wbgHv1UXyLXeNtgzjPlHZH/wt0f7k6CesuETTCvy4ilP
         ZlNBCM8AcZ4XZ5BvDaDssqjjdHk4mbLDJrLmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870183; x=1758474983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=HmGVBBVQfu7qkH+ZRo31ESLZNShDjfmYwLOx3obbTdQbv+Y+ieavRAYfkqWPFKRAg7
         KBEKEUXlMu9uOiCsDiJlHR5MbPmuFMupDpXvIylz2DEbyZH/MkS58lyNM0finbfIpnY3
         Cug13IvHnXSIbOlY1fCnIV8NMYZopMNGd4ja9go/UyF5JQyCq14/QB7rRtnDwozHH+xE
         1ch9nfUWBco/BUo+fhy6Rq/xwVxcxlXV3aNh2hwG9eVwKUSNuMnGzevm3DHjWBvtpkXT
         3129Tys4/SFgzKlm74D+MDowlVVO4ybsuEx1jR4BcyCOafiGq/4ZS0kV/q0wjCmZXy69
         raxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+bETCKKslx398Mql7q4USFqhiThJ6aCwSEA/utJIJU16HOd/xBqIIB9KGSBFJRK4uC08=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOc70t0DYB2Y0OtyXsKeKLRaMo+Xtp/wYfZpIAC0b+a3CBIRaK
	0AE0r3fGAhs8l/ZHCOsWBs9RlX/gtbu5KpdGBC9+hHA8mj2bp9t4+IJuzYLYkn0jIek=
X-Gm-Gg: ASbGncurSD4vYn9NiHYoZVh4AmXQRy9+tfvpYOadct6yz1JHSRbwtS5EXZiKUFLPb4e
	Hwab957ikLSVU/XRDZfyroHp7naZJXqIGZA26im5ChchclHkJ+VUAh+L7psWH25vvhCMcKeqf2t
	mWzvcXfneIwZcC+oynp39qxdZwhOTZCFV8waaIJsEoB2xOPbBE/tu/vD1v4GtBSKSzAfCRvUiOy
	fARSZHC8e4MGlftrBcXfAa2LP78E6X79im9qmC8SBqUsKCVu2Dn4V1IzLFsKwhMTOfJ8RsoHmPM
	n8VjMnIjTXI8UaLEfVoKXpROspGattRIabYQDUJlVTDzkkrVdFNrq85W5jsXf+krAzAwTKv2NE2
	zTCUNqTJZkSLrGbBPFmvbRUCpB11gbAHWxS+nTngQFIR20NIGy2mp1xXbTj/d8AyxDEFuI7xtPR
	UOuO9ivJ6fE4aM0cTXkqTfiT6UcdDTTqKq9gRZ+A4F8RKkzmTT8ZCpBYiJzZmINFng
X-Google-Smtp-Source: AGHT+IGvSuqYu1iID/ihliDiP5cWiNfNXKYVhuVRH/gmTXAOtDLlKa3rm5WJL/vzrHXGf7HRci4VUQ==
X-Received: by 2002:a05:6402:1d51:b0:628:62d0:fdaa with SMTP id 4fb4d7f45d1cf-62ed82c5a2dmr9785589a12.23.1757870182851;
        Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Sun, 14 Sep 2025 19:16:02 +0200
Message-ID: <20250914171608.1050401-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0

