Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A7190072
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130694; cv=none; b=HXGpI9zSx7zoIUS5VK7ziX1Hl8kHr/v5al5MK84mjqjm6OTSHsTB357WMWR5iyiZwmZVuWmHaXh55UNvSu6En0HoomIkeaM/PuDrvBq6zxYoOjoMO8NKMSQoszBy3FDxdew2ds2zekEHogMnuWu7SIMZWUqCWysA6B1s/kdMWqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130694; c=relaxed/simple;
	bh=Wo1uVubrLXVDbQNlkmqIS7KChMVuXDCKLsDKDR3SK28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KreGafgy1pdkDgNHK7ZPbNpzPrPYI96xk/igdKr+C8CSHCufefwmW9krmH1bQWkn3F8pW8G94ZnM1pY7AKOmpYjgwIwlQXtF0SyfXtq2V9Ub9oHBBCN9wKunvGRH80O+UplO8lHs3EZBUHO/65Fgwq+IWh7gG54kCMpYRYwbBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1Bg3HDV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1Bg3HDV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so7991435e9.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130691; x=1723735491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNgkQMLQE8+c7qKYIRFHCA2sX7wd7anUiiLQP8dhzas=;
        b=V1Bg3HDViuU8C78M/eV02DQfLIxNcE/WnB/clIT50VLBCQee0CVKfqZw4iMLFHThQ7
         GhxCOT07srQ1CiLJT7ctXhgtDHpg9oOyoQ3E6QYsJ6cgeSStTiIlWxVquKjz3f26mwr8
         uOe0HeKx6j3pKlyTi2fcw4VpVdPmvRVwoGSAe+AZRxRFzqRqn051qbj/YK4zB3r2ZVhF
         MSZgMkHw+gZkVA66Qu8/aGqsG2qCwgIGdKXrERjZKZXvL9U9jg3Z0jfB5E3in1H/6xqJ
         57oW5rX8Gym5ppEaC93NLERuA/ZrVwu+GKSMpKrjbWsl6zM4fAtbXrFghmczjz+cPNlS
         g5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130691; x=1723735491;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNgkQMLQE8+c7qKYIRFHCA2sX7wd7anUiiLQP8dhzas=;
        b=rxXxcMMye/avoeDQsCRXvO804V523RaqgJ2hv4q43kr01NgwuwSOfKS3aQ37d1psQ4
         CNHpRjb38+N8W3KFPHpgzup3AegronEGvg0LiuCEswfUt87rTQe0c6u4hp2+LMqmxvpg
         nZmb2BVull/G1sb1nXQwAq75qUUI8mLg55PFANW0qUSUGXe6d62HWZJILaDugn9p5per
         nyy1KnJhACkJv9OfCyQgFS5nf4b1xcNV3KyNFIJhh+yVNJ0VHcYY8Lk8BZToQsLM067z
         nf9XxkedEWAdaKQqHh7Pt9eXmpYhzCbtfHY2TrY5JkB+8sZ7fJvs7an9fNjlLBiSlQSS
         WKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ld61XEJ4JjNC2ufzXzRez2pUmPlssEkvAHmpziS/r2cEtC04uU6J0P0dG7SZsfwHDdPCU6igeP+zg14hWCPcjAVb
X-Gm-Message-State: AOJu0Ywj619NIUbv/TLhMgDqC3A94dpba1nDdd8AENAaB4X9XQ2epczW
	9aweJxsE9Kd4ZsxIgFcpgKLA63P22TroOJzSJtO9tyrQahS9K9r0Px+tJa7tnzs=
X-Google-Smtp-Source: AGHT+IFwSuy9rZTyxbgXUFU394ThU+wzuDkXaMzgjP0+WXBqGd+fnnfs7F2pAnVzZN0s6G6X1+wgJA==
X-Received: by 2002:a05:600c:5248:b0:428:3b5:816b with SMTP id 5b1f17b1804b1-4290aee09afmr16572575e9.3.1723130690475;
        Thu, 08 Aug 2024 08:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c72d5fesm27692005e9.3.2024.08.08.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:24:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240807225959.3343093-1-robh@kernel.org>
References: <20240807225959.3343093-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: fsl,imx-weim: Fix
 "fsl,weim-cs-timing" schema
Message-Id: <172313068922.39973.8291623622192662969.b4-ty@linaro.org>
Date: Thu, 08 Aug 2024 17:24:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Wed, 07 Aug 2024 16:59:58 -0600, Rob Herring (Arm) wrote:
> The "fsl,weim-cs-timing" property is an array, but the constraints in
> the if/then schema are for a matrix. That worked fine when all
> properties were decoded into a matrix, but now dtschema decodes
> properties into scalars and arrays based on their type.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory-controllers: fsl,imx-weim: Fix "fsl,weim-cs-timing" schema
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e3e4e77140b4a240865309cc543141a593be4a21

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

