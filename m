Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C430BF5A
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376137; cv=none; b=STXZYBwGxm7I5E8cs0J460IE5UxmUuLym027lwV8q8ZWs3H7EAuBqlqN+ARdUwKFHxtTwnDX4s2QE19oJ4zj9lgvqQI++Mra+IqepgV77yE8yRG1w5UrA8/4/8c/qgBYuoVu/3nwA51REKBnkeQieIsLx8kqU9N+ukGojlBE3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376137; c=relaxed/simple;
	bh=wV99yE6O3aUV6aiHyiCHUEH5emPMYemriCvZoRjSOR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0cUDWsT/CqyK8fczdlAKVoBHwslI7utJMaA8i+KANes/69S5pMdRVWoN+CBLNiyXCDj53tUjc1TGauLB/LUDuBphY2YeFPnHDhU+Lady4J6tLdknVfdNpQBH4m0vixaHFReoccSU+lu5tEMqEsa36W6s17H4PdZamJ0SmNynLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0PZ06zc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0PZ06zc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b629c8035so4327135e9.3
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376134; x=1756980934; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDhhY5HvG69Xs1o6vbgfFhudFKBTjzhr8voCZkOZ5X0=;
        b=K0PZ06zcALtrrj7oTtNm5jc/PP7fwzziJ1dQxZnnJFxs0WTsg8nt13ofT8m8TyfJqV
         Jf5uuVpZljE34PdCVjweZePtCKrFWTO88HIZKtPKmTdoPpbfGcxQMoSQoGkzopB/bV6K
         3WQU7BhKjXfzQ1YxaH/gpSMg9uMorSmgDBZ1bdQmmW7p5KkXOTpJvLY8MW1ZAkHe6GTF
         fNOzzmsKQAKK1ElrLU3kCTslwTSf+q5pTbjD0LHzzhKceEPyC8JFDYMqEJTTCgzP/ErG
         9O5bAemTPLJNih/mc14GSVtinYImf5vfqFEpRJAyhKYAY1dnL7G7gUAgbI/hmcG52n0q
         saOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376134; x=1756980934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDhhY5HvG69Xs1o6vbgfFhudFKBTjzhr8voCZkOZ5X0=;
        b=R4OOGgJsUdkXEKNtkdr/9jdiTSbapUki1ykN2DKDqdSrNuigxBup5E6iHKDsNZIk2z
         3nCIUGI3lIFaNuxsT41Y1cdXHm7k+47uz96Px3bGFr//8QzmdXT4RJyKCYw7qAYneu1F
         mhrlpb+Q1FWo7l8rObYxNWeXxWgDE6GYStzhnF6eLwiu1NJfS5C3UMAA5bErQeafyaIv
         HywXCeCjqzZNUGcic/tXQnrZAWHxgHGmxUNvlEyfz9FsofvyKu5uKc9K61C+JUMvMSG7
         Gc8EFoeiDhzZQGEQZX16HdD11mX+cSfV+dAurB1povwPZar8d4tjV+P/tCtIrNHML0Go
         FW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVX2sauxn/h7sQahXvspv+6hCBoK0JYejh8TIUUDbYvartKpB1aZzuCG21VxlxYotGXnug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8fN0K0LFbTZUEY1jFQTP8HM/w8edgrTBMtiEDUwfn/4fJM73R
	93mmiqWCNUHURSGej1VpXaBlQPSlPxWfDNZHW6pniWHiOmM7kCaCWC1xxrFtJvQDZ08=
X-Gm-Gg: ASbGncvFD7T7qo0GshHyJm1nRdFsHwXzcMI8kSCzLbvYePbQLNEG7DJx3GYrKoqYYSl
	ofpUJa1jzI0HpUVp6V8YkBGdSsxpP/NoTYhSQTKouT/tRLRvm+z0Sx26BhMQQKIorS4+/rnbfhP
	WDxrz5uU7BTuQpjC47q5F/vjT9kx6CVxQR53hs+bxs9XIubCs/9/nHGoiNnr63Tx8YB3AWe1k6E
	1jKHXSBuy/h/EnFc8eBt7V+KQX6yZgzu0WIS1LXT/cgKD00//2y849bfVy7kYb0vM0aDC26VG1L
	FPkZhDzZiiRMos0ERN9/P8V9/ncorDThnbwQf1ZMXWSsiE2x0V7PI/AIzz7qj9ok8ZtWU51cSAf
	BtVupKMIlfXnh+Phl/TzJ8+NG1GuXlmppI/BAIVwttQ==
X-Google-Smtp-Source: AGHT+IGrzpI1g4LHphInRHv2NogHJqDObuPLPd+CQOWu2AaDbp8EhCxG65HZRkwGpUMdtcy8AaZQJA==
X-Received: by 2002:a05:600c:19c9:b0:45b:6334:3526 with SMTP id 5b1f17b1804b1-45b633dcae5mr131802235e9.31.1756376134524;
        Thu, 28 Aug 2025 03:15:34 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:45 +0100
Subject: [PATCH v2 6/9] spi: spi-fsl-lpspi: Constify devtype datas
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-6-6262b9aa9be4@linaro.org>
References: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
In-Reply-To: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

Add const for all devtype_data.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index fc4d49f0717e..f16449cf42bb 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -135,11 +135,11 @@ struct fsl_lpspi_data {
  * ERR051608 fixed or not:
  * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
  */
-static struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
+static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
 	.prescale_max = 1,
 };
 
-static struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
+static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
 	.prescale_max = 7,
 };
 

-- 
2.34.1

