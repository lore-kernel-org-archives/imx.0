Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD582F83B3
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954892; cv=none; b=ga/Xw7lcvKyHglF215sjdzs7L9JAeal+01SFe9SwBiMI+Jo0idUYzkWh74y+Sb9pFzrLkD4kQVsEEt3/0nbDRzw0P+QdhZGY3Qv0hfzG1dztBFTmuj5x0UOLWwolz3jwTijTehNsjxgySl3vZi6tzFiQXc5ZwYIsaENeXCfxJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954892; c=relaxed/simple;
	bh=IthgwRg6yJ7su7+hxwU0G1XvJdmaJcprtOIDD6R14Co=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l6abppB4AprOIDQp2/fi2lECIxiRBAfJXT4OD9Nx2aaH1TRQYzpVi0omB2owLTDznVCAB4hEFmV7gMhveeYPMwjpSojCG32Tr4aP7p3z+w1n0BxlJif2kupRlRWJNOh7KFLsk0Ay9zfTy/rJlTIwj05QNxAayGZJNwPC9dWaH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sU0k0vSL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sU0k0vSL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b43a3b1ae1fso108046466b.3
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954889; x=1761559689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=sU0k0vSLJLSsWMxDC8qLt6YxUZkarMgJjVWomJzDhRJhLdEr9Dz6+XUw1xMS8CBvqY
         E1zFtTqmORkpEI0I1zFaLSemsjW3z1DoVxuHVqSZTSa0KKwuEqswZNGHR6YC/Az29os5
         viVG6davDz87QgjKL2rDrUKwy5XgwtyajxkvXvlMCpzRBcvfe3TOJHcpI9RbkyYGLO2s
         GDQSP/UNUpR4Nkd388wz1ITpdqd1tBsb4rSBT5qvao1g/pbBxmt+bc+CMC79Ht9jhBa5
         Rj/465d/QvtPmkzzVxAvuCRq1Gj0k1Vm0VqVm/j+mpDC/+xxgA3MMVCuvp2UdLqQukpp
         QE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954889; x=1761559689;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELGhRwkcey/M8p9/NQ4xSZezxHFCzELpwhxQQJfRai4=;
        b=iUvNryIgwtUxPy1wEVRfQEjDhlRpB4mWkqkWd9cezBlYggNDxhUbZTRQRGLMYuzNM3
         dYwyT0j2lSiA9tqwGUf7KkgYhP1U1VkZ9hLhuQ1uhrm0sb0IuhDnq0Ya9FukOegjIuw3
         imBDv44n9FuaHzAvZgJxXB0Ni5SnKN+m3ic1SZ8fSSB9etjVCZgVqtPLxSIfUGdyZyQa
         cBw7vdDx7WaGRfZiVTohCGJegTwJMmv/aX3mvinqRQHw1x199CqrJ55V0PXw0LKf30PX
         Rm1TFsDgH//bKWYYw/jAbw0QwYtEZua6gu5fsoIpQhXtq/WcQpGUVSvd1XGm3iZ1BmCA
         GKVw==
X-Forwarded-Encrypted: i=1; AJvYcCUCYHb4RWYanP52qzc8UR6hc053cHSlSEK4lIHD57PqTgcrZq7mN0jLfhuJxXWiHaMUFlU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpOJESB1Z1bQgmpUK/1ISRkR1eFbGXfvOOadHh35t7lMURRvNQ
	p8JbexBCRSjcuzpqw5qmJcUyB3359FYE/jdbovKb56h2yVfD/qSrUFHqmcVEQI/dWac=
X-Gm-Gg: ASbGnctc71WbROuWGcrKpz7EGyIEMmYzTyfe6HWy1EhK+HMGw1wRxxXPxRJowFjXB+9
	KDvjfObfeTjhvAUH+OlL4YSB3UGBJrb8gf42+7QHCk+Xs6CbLb04LgofIRZryzKVM6KJRj1k7ED
	wCz+yRW0t9CSuhVzpUPshQfRD7Eq4uiY9YS0Yy4R6mg459+SRpHCdJqHLzsR9AgYcqXQO+jEwq8
	9AAVw8sCHOiyS5ToXuA1ZhUJ7tALE7cr/FxX+MPYvBjFEQlvq4Mi3DPYg9ukYuYAiEdx2l1oC1f
	7kVNQlXJ3jPZJuemMB8rCeFkG4UgoYj9855tbgZ+v6JxphtBL92UOlLlJMW8yDqzD86CKffh9xu
	jAYAVs3LetZQewrk7La/NcYZi4Kf0MgrVLBoS52K/+h3hZpX+LAUcHBaQRShKC8vBBa0GxqNOfM
	5FKaf4uKZd5Pz1+99d6KiFxG9ST0Y=
X-Google-Smtp-Source: AGHT+IHb4qKarfFb2e6yhqx9qlyNVzUbEwguNDAebFS+BWqgt85Rblg9ZZAJ2S/IaUQJYck+aE3lyw==
X-Received: by 2002:a17:907:3e98:b0:b50:5956:482b with SMTP id a640c23a62f3a-b6474b2e281mr817509466b.7.1760954889230;
        Mon, 20 Oct 2025 03:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036846sm740987066b.54.2025.10.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:08:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
In-Reply-To: <20251009222716.394806-2-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
 Add "rpmsg" subnode support
Message-Id: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 12:08:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

