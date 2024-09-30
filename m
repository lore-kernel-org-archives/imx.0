Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44C17B427
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693172; cv=none; b=PRlOG2rDTqPvGamdulFtPCmzcRIr+9HnwIoi3ARxat7c2nxxsbkXgUkN0EdMq9ntHDtCa3IqPziyU1nFr06CeL00JL5K+rmYlX1qK2Ub1LwTwElieC6mRn+uvEx+183mJ9OYm5igJnXi1bNEiaOW5+VR+I2ET4zMCLz6JknKdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693172; c=relaxed/simple;
	bh=WgmAWdhnVHJCqthbZexYZzR19w5rQpCuoBowws7Hp7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Om/7BMMMEu8atTrB35nR9aKBDoRmspTqSKfOXQOSpTzhZv7mtMooRk88CDQWxwVfXseE4HVmgp2M5tn75FuCsRY8vZdKnZ0NWuzhqjnYf/aYFcFdS4Fhk9P62GK9BIQnvZE6kQkRuRsnZWyO283es7qE/zWu3RKhQ/cNA36mUUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nwl1mDY9; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nwl1mDY9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c877f18276so653711a12.1
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727693168; x=1728297968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbHVTx2eRiNgxrAOA2z8vgvBG35XROi0+GKzueTB33k=;
        b=Nwl1mDY9cRHHNx0PghVDUHogR3sQFY02vHxblgcdNWzJJywHMYOUx3qnDNznNk3qS0
         0Z065Q4R8yRTTWzy9J3zszTP5Xa7/8XJx3khrtx3eaNk6l/FWwadm+MHB7CHGL7tm4Nj
         tvUaXF8aTikR9Wb/v55/em1WPMMP7ebFto0XDhWlFNyw8+Y7+KbpDLfbzw0F/fRasazX
         56lTvJTGU21+CAik4K7FttatuwN+JPuMxHRgvoil9iGU5tScPveC0vcCGneavLlC1211
         R5grgd5LyiceB4HV7X42k4mw/gwXheq2GUV16ig+aSIbm9ckVo/Mr+NMkxc/QrP4geTY
         z4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693168; x=1728297968;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbHVTx2eRiNgxrAOA2z8vgvBG35XROi0+GKzueTB33k=;
        b=AbvSzrqgHjUH32844JIVxo3KL2eDHdJZ7TWEJfZ5p4UzOCcMg5B7EqbctW5zbSgntp
         6V1uwlPvsDNJ4JCAVtuLxAJ4ekbfvXYoh3wmwlz+YWBgdioHCgFHSPUDNO6gRxCRA6eW
         slCrva5cIj/YALzZI6DILB2lGM4G6Cesmso8yHlgxO1biwD7XzCteZXg+TP63fIJEfzG
         x4FGKHbWFN1u0liXqcX+t9hvWCbpcV+0/9d/wF7iM+fCszpOM+KD02MatYyZbQ5qlPNt
         qTyfU0/Jv3IuUdwPDBH1ltZdRWMzQjY+JnY4MrTmCODvZQQR71SwnX0qIcO3bqRyc576
         S5iQ==
X-Gm-Message-State: AOJu0YwpRCl4Iz8kqP6rITgxwwlpa66+QYyzoNevmvRER33zMP7Z8ogc
	4oh8Sh3cQAyKB2qNc4XUQ+v+T+Ea9F7ymdcLf/9kSXu7U0g+L9W1gI5vO00ppk4=
X-Google-Smtp-Source: AGHT+IFHembOa8x5rUT1ds4+ai8M6G7orJf5YCQHOpgWKvx3ElxTstOvoPR6aBxDBnte1bb0kpLemw==
X-Received: by 2002:a05:6402:380e:b0:5c8:8381:c2a0 with SMTP id 4fb4d7f45d1cf-5c889b30e51mr2944919a12.2.1727693167742;
        Mon, 30 Sep 2024 03:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c885f5336csm3387933a12.97.2024.09.30.03.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:46:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20240909165358.2384975-1-Frank.Li@nxp.com>
References: <20240909165358.2384975-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/1] dt-bindings: memory-controllers: fsl,ifc: split
 child node differences
Message-Id: <172769316609.26942.4799733036157642363.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:46:06 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 09 Sep 2024 12:53:57 -0400, Frank Li wrote:
> ifc can connect nor, nand and fpag. Split "^.*@..." into "nand@..." and
> "(flash|fpga|board-control|cpld)@..." to better describe the child's node
> binding requirements.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/memory-controller@1530000/nand@1,0:
> 	failed to match any schema with compatible: ['fsl,ifc-nand']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: memory-controllers: fsl,ifc: split child node differences
      https://git.kernel.org/krzk/linux-mem-ctrl/c/89e6684538f59093d89eda50e30a6f2644b06ab6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

