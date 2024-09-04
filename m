Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC41DB55B
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461437; cv=none; b=jL7E/0E4Ag2061svoUb2L5FBAcDk3JHGW7408830EGypCKe67P5FmIFs8B6wPEZ1v5f7hSK+71wpxYmkNlEV6+haJbRdZbnVwqpuUDRT+SwXe5WifCy8DoFyrp4x6N2NqwbC3sjoCElVzmdir+E0eja+9ActuhMQs9/p5fZS3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461437; c=relaxed/simple;
	bh=IHDjp7R8AfdR7b9xx4X+wFFhr/egmeaUbj20wxLCXC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuSVvN14Kdhyyr4B8TX8R3aTLwQZ2qfJQ+dvX9kAjcc9xyqxSvBnxJX296KzQ1fRumTJCypI+VB0WWDtXm8Mmyy87z+OR5U+VnPs9onOD4tem3/Q4bKqnxJYNYTbQG3//J8QonfvMHCd+vWnYP9aMa9kq5wqls/9unSKSqBkPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277df202ca9so2164248fac.0
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 07:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461435; x=1726066235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clRtuBeNO4C+TrySRj7UAKnUpGGK0qUAKzAQZEajEsY=;
        b=CBJkUgTQK717QcDcrPJJs/mgqWmcdDsRdyaaRgwlGSbsQ1d/NUZOavnoxCML+GCGwa
         w6Ikt8VoPGmndSasrTQfU4svMmpUZZVsJzoezuHRtlvsGrExNM5IvT8ZLdYf4ECIkGAX
         tvdvUD01dsbLi3vrGXGkzMrWv4NMfiailGtxZAFhebcrHaOjRg2RqJd/u4OZYyhGcpM+
         AHIDvKAU8aWSxhoYyMzGjtjf4Cx9b2XcNY5SHUqKaPgfZjeJ4EvrN75Dedy1RfZVj0dd
         LOP44/+JBJS1HiUvyFJOxn6l489KMivG3wEqlPTqgzMPdU+Qz3UC/9esrtjayQKCorsf
         NOgg==
X-Forwarded-Encrypted: i=1; AJvYcCUeR8+bI8omQqO1mx5RF6felf6lJVMrmnD3XVOaqsMYMvHw1jrVKwt/5Hs6Avj9QznIOM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDsHB9DWS1yKqQc6t6kp4kRly3k++NYBLKaa6tFkX2UGuGQiMR
	CAe/+q0ZxBME4aWnf4wQ99NMxGVz1AryvxlgH+wGoKnrOjtE/2IT
X-Google-Smtp-Source: AGHT+IE2bhiFX0HeldKFR23jyWfRURDpvfYGpoQS8AJr/Afiy2UpJM6rB+lJP5by4vUx6dYbMZpB/Q==
X-Received: by 2002:a05:6870:b525:b0:278:7ea:99d with SMTP id 586e51a60fabf-27807ea3ddcmr9332024fac.41.1725461434859;
        Wed, 04 Sep 2024 07:50:34 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbdade9csm1728086a12.92.2024.09.04.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:50:34 -0700 (PDT)
Date: Wed, 4 Sep 2024 23:50:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: PCI: layerscape-pci: Add deprecated
 property 'num-viewport'
Message-ID: <20240904145032.GC3032973@rocinante>
References: <20240823185855.776904-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823185855.776904-1-Frank.Li@nxp.com>

Hello,

> Copy the 'num-viewport' property from snps,dw-pcie-common.yaml to
> fsl,layerscape-pcie.yaml to address the below warning. This is necessary
> due to historical reasons where fsl,layerscape-pcie.yaml does not
> directly reference snps,dw-pcie-common.yaml.
> 
> /arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: pcie@3400000: Unevaluated properties are not allowed ('num-viewport' was unexpected)

Applied to dt-bindings, thank you!

[1/1] dt-bindings: PCI: layerscape-pci: Add deprecated property 'num-viewport'
      https://git.kernel.org/pci/pci/c/b9fe09a1b293

	Krzysztof
