Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E168277CB0
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506854; cv=none; b=DUXg7BUajVTm8I/eYjfPXpkExyOP9OBwmA/BsXKSkqawlCSXDVDLGveQxZiizTUbm2i5alTx42VmuThMqH7sRQ9px/hfKiJGc+tHnarjfNbA0P442u7Y8tD9/pCdGaRxRamXYR8fVnKTZy+1gQKDSwHVHvfIlzmORxL2hFfA6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506854; c=relaxed/simple;
	bh=BFqb772XKvnkGz/X/GiHYC9tY0Kc1FlOx29S2g2BP6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Puxl9sSA2KETUHjvUzUrO1ynmhrQs3WQx6wt/nvQ/h1iSBV/tV8NCCDA8x1iRosKyrLmT4FdIDbBlgMad8uGDTkBf9iDHCdOcVxfZAgxxz2RAq+KVgn84SFCszSOdj0XYy0AOJ4t7EdJL1Joc6Pc/KEht5iH2OBHsL2svTpoWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caUrM1V3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caUrM1V3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b67a951so647916a12.1
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506851; x=1756111651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=caUrM1V367Gq6ljfzx5W6QmQzFtlLhiCc6VFQf8gbdg7HSiCtzyH7f7GR5YPy8wS5Z
         +zbV8u1iJpqNk2baMhEohmpkt93Ws4oiJFDDDZk+KMprRojJTb0ifajOAyTXEuhiHfYA
         HnXcptIv5qiJgqmqXs0aqD8yfnsHlxH4VKTpLnCquMKfb1mJcFR2sK+ORTGjPJPgo4i5
         M/I89yelzhEPGZXt8vodVrpgIkIOLGrjR1sIDUw1X026D5Y2tzHkPEG4ZBaPClowSxR+
         8ucHXxPPO7CSxXFn6R21lc/gpsD3ifIkFoWInpWUxMt4VI8W5yFHkbVjd6BLJUavf/w7
         LNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506851; x=1756111651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=Pk5n8SqMqfrwyRmjvUmE3cMpoWIR+v3bK5m6mp7hLnSYHw5Dl1ERD+BadxQUOMoaMQ
         mbinwvKZ0g/J64P7ZXbDUkFXkkMfRIgzHqmTHlWlCMYqx2UzcMl5EkCi2smuEFQ3L9Rb
         E8bK02Xhhn4S3zX0jTUudtmI5tzmhaJybL8UUxUT1B2yku7spMKUo6V0+fSrrH+vn9ar
         cE9WdXtxbrIrVrqr6eYWRwaGQA8NXX1gCTqC3uznJp96HPPzgbjeHOTmv1UFwPbLVe7D
         PcJUOk8iFs0yjl+bH/sKtx+j3QIf+EpGn8Hss5o3dZ5Xqi37CDgd4gxuzTdGLql8xzrc
         0Wxw==
X-Forwarded-Encrypted: i=1; AJvYcCXy2IUOjMAEYhbi/tS5GFoe0pOmh8E9BFE7hsfFS7hZYF8hPzwkvEa5ZGu0ypM2hOlHqgQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0OCSiUg12YmLZxeu0+mGXimzFuuVVDvCZmx4o7IyJYzcaXBtV
	Or7oJ4fQnKpTnXZWJ4G4EJuMmOF1CZT6NkY/lltxC8bhkS9JGSj4iFuvJykbjAH+qbU=
X-Gm-Gg: ASbGncvLQdk56DaQ6Ph9rZYnHkaARPv3hQvINBPEy4X2agtRCgYc61LfIsRqq7tdkVj
	TWmbJ707IiyMobrN0X7t9Qea4aLZ9D2yMTHMy8PL/CLEYpf2V3sdlf0ds55wo5NxRaTU+Hu+qyF
	3Ub1kuonb2fsuBqPXPhU/NSD5jngeX5BbUurP8m5HkPh4Ojxs2u33se827UY5zqvv0VPQ8NKHGO
	ZYK/RL6tURSw4bYtQxvbVCGiE2bwe8qIYRiu1MDQBvckAeZwR/7Awe6soo68Xb0wShEd2Siwkyo
	GYOK1lRhw+yYiD9b/MEkgxs8S/PGhfcoLuOnFhC20V6hPMkaw1E3RXrABoOfk8A5MWFqeHqx9U7
	slkoT5CUdcb1z8RAVawqFOnE0w7smimDOme5Hsqi7VmotWdwn8g==
X-Google-Smtp-Source: AGHT+IHnFT/QiiX+/jyxr6JrjJHBnX2ZgiTGkz6V56Qs5+zyrhsCVsoAqUSeVCMOf8wng75ASWqViQ==
X-Received: by 2002:a05:6402:440a:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-618b0865203mr4787283a12.7.1755506851453;
        Mon, 18 Aug 2025 01:47:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-2-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
 <20250814140943.22531-2-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI
 clock macro for FSD
Message-Id: <175550684881.11777.14718777449068060989.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:32 +0530, Inbaraj E wrote:
> CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
> assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
> and CAM_CSI_PCLK.
> 
> 

Applied, thanks!

[01/12] dt-bindings: clock: Add CAM_CSI clock macro for FSD
        https://git.kernel.org/krzk/linux/c/5576d8098052952a6c95af86ad3dcb341554ac75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

