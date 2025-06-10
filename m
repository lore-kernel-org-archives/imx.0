Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2427EC7D
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543816; cv=none; b=HdV51+v4ZpBlMt3gosqvfCN2Y+t0X4JCjFu0kUsc+olJAUwffo8UB+3ID6zDIz1K/JoANglp+BdsYrCOHqOC8WPRe5XnU16GH4/KGUbEONQePbWSDjjZB5S4PfhMZw+qTOvOaGk4S5bM6GZXmEd2PTen1v+6nw+KAz1igf2BwLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543816; c=relaxed/simple;
	bh=SL6XPe/Yo30TKebDlMiJ2hgSO2qPUQEt3jOi+MlzI3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hihMM4nppwl+nTwfNJ3uxOoRQJiPGSebkKE0w86ZZlFb9j/kOsIOGdsaKVT0NmRHGV4/YYV9T5KcMF1UKUje9f6dyDvyyePMKtTjHdKKlNrpiLwbv1iS/QaQ87IF0F0cBvnPv9K2Sg8MxXVU5VcoQXUYogGzmQDdyO4RHrfnLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvsmlCeU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvsmlCeU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a524caf77eso685385f8f.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543812; x=1750148612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ40nSv2sa867OYuo6sDTtT6TDdmiOb3whCWy8cFeR0=;
        b=cvsmlCeUMdx+MII3Hx6QTXNDUGuJZ2e+1Aw8qyQGUL238RuthgAe7NdhaL45NxAs5o
         c8FmoqjEfEMpE7w3ZpvyzWHMczzS3kRGPJeAbYmmUSDd/mlIdrVHJ0W0mH7hYppLh5k2
         yT0/UCVxSdgytJOzAwaQFSFEI76enQdceMZqVMUPyRc5b3RKsa2fMn+8BCLdFn0vG1ZV
         LRstFUe040+rN+TjpVXyNCjLcsJvRcviK6Rb1q36lQmg0l9bTaUWAn+HgV/h7ZjMRJSB
         arCoCn0PchKAL5f8VWyfhllwGJBgkQV9SQPAJ1I00uOj3wS/e7jXMvEsq/yKz5ZrsTPc
         9SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543812; x=1750148612;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZ40nSv2sa867OYuo6sDTtT6TDdmiOb3whCWy8cFeR0=;
        b=IdraAbD8xSGgNSFVch41a+3f4M9SZHSfPNfgNbcJ3mxKFS2sMp3g8vzbH0u5B4i06w
         EupFq284SD+N4MwTwY1lDUKixStwSFQbYAXbT6lWe7H2Di0Y0r9HejS3bI6DX1on33wu
         +fXae907PO1527vCglSTCECx/DAKEaEApYtLb1lnQVF8zk0sC2b9fEbtQT9izKE/+NY9
         /Vaix+LPzzpFnTrElEqtSG9ZinE1pfxfOUcjWDBsk7Wu0qr4DHZcPapHd+mOYHh3XQT8
         bRT4yVz6YelTVyHwHTU2RGtDT7vikjYJwT3d9B4X15vLH8JZQvz1AZewc2KbZrpw0rWp
         97MQ==
X-Gm-Message-State: AOJu0YyjaoqdTyZqU9aA54KXD6TPJ7tZV2JaDHdSlApap3MxU40vBAJP
	zuqcjmFqQgMqX9aQL2AxsZqZyI5Zro8aDkqWlDmpYE9XDVvOHJnhshhGjhMVixAGQSs=
X-Gm-Gg: ASbGncvlemikZ46ZcuP0ERxOzAXltWqXKPghYNv8ttebm/7aZf9EzewbP1SdfRz928R
	B+8Z7Uo8spn81rjd9e+sh3hw417RjbqB9MSv3idu4cdlZe8DuVgFFNGRoEeK+FFwDzWmGnVc0LA
	WOfZc0xy06TOd7sYWEsX3ej31SU9MjDy3E/prsghZAW7D0zVYPs9/96DVwi7C1id6aBKew+0hMS
	N+QRXriXrAqkooufrutvRFlWcJtVQ9orJbEH30B+trLwYUJqMUBcDHUKfDSByay5DfjwPOLr02g
	w/4XJPT6h7vg0gSUlRj6BLl+nrUGriXWmfZq1nFEIIpTwugCn+YPbQQDnFQrM+/31vZ1GRTnj9+
	k5F1aHA==
X-Google-Smtp-Source: AGHT+IFT30y+SRpOPyTJLVOb3Pput91espNfxr6yB+Z1bKms3iz5xi8X0GSEoKM0vX/+7UuhNP+UqQ==
X-Received: by 2002:a05:600c:1f16:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-4529abf70bfmr47500895e9.9.1749543811934;
        Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250602141246.941448-1-Frank.Li@nxp.com>
References: <20250602141246.941448-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: memory-controllers: convert
 arm,pl172.txt to yaml format
Message-Id: <174954381064.117761.3103173099824775147.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 02 Jun 2025 10:12:45 -0400, Frank Li wrote:
> Convert arm,pl172.txt to yaml format.
> Additional changes:
> - add mpmc,read-enable-delay property.
> - allow gpio@addr and sram@addr as child node to match existed dts.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory-controllers: convert arm,pl172.txt to yaml format
      https://git.kernel.org/krzk/linux-mem-ctrl/c/04de50163466a0d11b24f6bb418889f3cc219dda

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

