Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650E3019C9
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187639; cv=none; b=jo0zWG4nj8ZeZW59Vpjp21SZ52Qd64IQCxK0tobEhu+UGhpPDvUHonqygLRtqtR1bz+tZ9ZIVTq6Rbh245iTZFbisngzlL3vCRIpDAaFvOif/tw3WQbeJ+3iObqjX6I3bImB4X9J1+PA6eERxq/nj/VBCd0g6RXkwVeo7G/pNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187639; c=relaxed/simple;
	bh=tuyFNbIZjJIEwYsTvCXnsEW/EVfjfUpA1Tb/WaZ6BA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEhCdH7qBY3PRvjw1gCeCg+aUCDMumOcr83ap5lDt1VVVaLS4gOxGs8oMmpk3SoDFar0WK/90+5TenuxnreJ1B8KBmjsIy/LXKNlm8hiLxUEWTRZB9XIoxCzeH7BucYHBGhKMp/Jek0UF2h+ULrLaHmU/jzz/TxpQYOpJHPJnRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwThG1bm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwThG1bm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so8670965e9.2
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187634; x=1755792434; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD30mQRry1zYj/pxkKOJqqK6h7OO9d6sUU7HFt4NRSg=;
        b=dwThG1bmShKf8XVRoTFn4nhSiUwPps9F7gr0+UrlYBvJC6Nvm7UJf9wNjU7iNZMN6B
         UNdE2ic+Y9Mirp3vZcSefJEUJakC0Cm/yVwBtPQRaf+sbDDya8XGxx47v5n9+xFkwLnF
         jymXxLaRmGiftp8FIIeNGb2cczbP+Kyg1F41ZSzAMY/+pbWe/pNsFlljpN8WY1DwqEbc
         M7zYZ6iJoq75gSYO0fSQFN9TdCLZeAKwDFvlUPks5fKyH80MvGk98865dd7CcYXmb3f2
         APcJdGPy0HY+8u6R8ZtdsSaNHxMUvJbDfNVUSYcsCzA2cBEj+4JBaqmCEnP/CSnUa4Jf
         e/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187634; x=1755792434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD30mQRry1zYj/pxkKOJqqK6h7OO9d6sUU7HFt4NRSg=;
        b=OGEF8/MHO6Cz75MJ9IohQe1/eRxrFCS9I4CLKoUFMKe7hI9wSg2uJ2kTGSYYJtz7qv
         Fqdz7owk2cvItDr59Q/uXVg1tn9dnnOBwo21fClJ6zFj5R8hBTUKoi3fmNwPN7zOQgyO
         Pp21Wu52NW1ANehnhncJK34YHkjpCcT2EuVhxpo/o9ONWwL6M6T3Ue56OZB5eHgkXPeV
         t6+Mb1Qzjxawb46Lh3IHiXRY/qMM5eGJCQQdpfcLrCBvrwrDz1obSgTqC/vnitN/ke00
         EQ1gdO1loZrc32qVy2cvUYjI1eAZSNlB3RFeR/1ZzutqZCM09qlaodiuDAkJE26GVxWd
         6EOA==
X-Forwarded-Encrypted: i=1; AJvYcCX6lM9CTdpp7Cux7xdWSMyqqwHsVgpcL2hX/adaJ2BgPuoUjvLLjgGfDKTJwRhTYUMXgSk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXXSQ4LJtH6CB1N9vOPu5Xx7SyLn7CB5o0NWAkxQjZJ+TOKZqO
	9uctWJzvKlP6fGEK4JRSQHunW3E1kFHqElPFdLZ1QY9qB+EzPqtjOJ/KmldLChfzV4A=
X-Gm-Gg: ASbGnctShIXTe+WU/rep5HptUZb7WdgDEb6bsstTkqmCn/f5OIoSk8A/VPB4WGPoRwt
	3trBEjg4zPPc01R2xVMW7E2ETD1K4c9SXUOo/8GAxKQF4HW/g/C9UfkZkMyS6WW7qNFAow9kWAZ
	8Rshofi7Jv1dNN/TpfmhfyTLk8oPr/0NtZDNmBw9y7Ls32SLg0+kqhhXsf6HqFid3L7bCao1ZNi
	P6PvBIbV7kIXbzvhjsNkIz1x08ucYrwArrpvkAn/ihUKYO9C73odfAY77nUHeWK0LEFDJM02PiU
	RzMwCqCPwcIcde4hPdNZBJEdji/UsQvx+/mrVkMbHXN5xpZC3w4f5DBEZXluYKHjcoRmpHWfsIr
	an7LvD6SjjNQ1ehw22/DWBR53Ty9mNK0=
X-Google-Smtp-Source: AGHT+IH3g7Lbg9BD0ijgtIIxDOgR9U2NbTxPGle12zoaibJgP+H7TGUyhDPESpYkX6F/UP8500PcEA==
X-Received: by 2002:a05:600c:45cd:b0:459:a1c7:99ad with SMTP id 5b1f17b1804b1-45a1b646924mr27213635e9.22.1755187634247;
        Thu, 14 Aug 2025 09:07:14 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:51 +0100
Subject: [PATCH 11/13] dt-bindings: lpspi: Update maximum num-cs value
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-11-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

As mentioned in commit f46b06e62c86 ("spi: spi-fsl-lpspi: Read
chip-select amount from hardware for i.MX93"), some devices support up
to 3 chip selects so update the max value.

This isn't a fix or functional change because the devices with 3 chip
selects support reading the number of chip selects from hardware, so the
value wouldn't have needed to be set here. However the commit states
that the DT could be used to overwrite any HW value, so the full range
should be supported. This also avoids confusion for any readers about
how many chip selects there are.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index a65a42ccaafe..ce7bd44ee17e 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -64,7 +64,7 @@ properties:
     description:
       number of chip selects.
     minimum: 1
-    maximum: 2
+    maximum: 3
     default: 1
 
   power-domains:

-- 
2.34.1

