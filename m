Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61346441D
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461168; cv=none; b=oGdb5cCiDeVSBf5KYYuCxQT1tCowryUcQIHfWewkq2pGQrJZswuA0eMP4v7r/LHCEXTJ7SAViWM2BTNv3xPirsvsCFifC9xtU3HIceDBowqzjr/huF+iwybpUhXlwTcW92qoIa5BG50tSf98JDpJcN7d71kQ7Hv+NwL3TW13l5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461168; c=relaxed/simple;
	bh=tZ4zoQ7+fGa7qXkuJICtHotCFwlzcQ2J7vhk5NZh5kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oudnW9p9dXpYR80FB63wZIn272unmvm+Jrglw1+b62JEPNlB8ZN8if+m6iiMnygJIYLzK8VLvSjLMKcpvy4tKeEwFRzCE3JOglCEe49Qwxf6vP3pLpeEgEgYCIU73YHlUQWEn5N4CkKtQzcqpiuZXC8Ji+SOghCsAuU5bvK8N48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d877dab61fso3302288a91.3
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 07:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461167; x=1726065967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/gRRuRqrbg0AurY1sJ7Xea56DowsKJuBt1BAJTfT7E=;
        b=sr8FBnWoEZ3LjyMWxZ2kDSDrDAjwX5dx+OOYYqV5e+oJEhyXMGmYWgNyJsTN50azLT
         rVHGDlf1xdoxTdRQ8uS1r8sl81mPcqT/oA+ZEzh7hHtEHJt8dWqFM/GbUnnF6bIRF/fB
         53VbzUF00ndH7vp0m/2CcIbeh3CM1Ofcl0M6bb5muMg8BFmN4dp8TPsJwtkAIKVqCOaQ
         CkVnzovdothTxpcXriYe4u+ssEE/9jcHQxSC9RkbwB3z7lhYsJ/xxKe1yyVNcvSMxmos
         YPXvzKDnWWzk0ZB47ktnqIWoEt8ihtyPY7G/yKeA+jrUNxlDbC6ekGbr6yyyVO7vvrlL
         W1dg==
X-Forwarded-Encrypted: i=1; AJvYcCXFvGl2EEN6TZkt+dzKliFYUMsAJ0i48U6VLTzMyBjQOKaHSsX96Zl5cHRgHO2nF92y8I8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3b9TeOYIt7elKlFtqGpTW4NtiG5x4Y36OZwfG1SZ/xc7kBgcS
	mGjsqKnMpuV6xk7th2Tabt/jfxvlHDqgeLfq6OT/Fg0NobK+L4qT
X-Google-Smtp-Source: AGHT+IEFMGUmWkfIoTMckkMOZIt5S/YmaX0JZJtpZBVyk/WvpQWvlu8kAsbTAAvWVLa6jsYzlr7VSA==
X-Received: by 2002:a17:90b:4a48:b0:2c9:9643:98f4 with SMTP id 98e67ed59e1d1-2da55924209mr7514672a91.5.1725461166596;
        Wed, 04 Sep 2024 07:46:06 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d84462afb6sm16048198a91.33.2024.09.04.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:46:06 -0700 (PDT)
Date: Wed, 4 Sep 2024 23:46:04 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Olof Johansson <olof@lixom.net>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: PCI: layerscape-pci: Replace
 fsl,lx2160a-pcie with fsl,lx2160ar2-pcie
Message-ID: <20240904144604.GB3032973@rocinante>
References: <20240826-2160r2-v1-0-106340d538d6@nxp.com>
 <20240826-2160r2-v1-1-106340d538d6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-2160r2-v1-1-106340d538d6@nxp.com>

Hello,

> fsl,lx2160a-pcie compatible is used for mobivel according to
> Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> 
> fsl,layerscape-pcie.yaml is used for designware PCIe controller binding. So
> change it to fsl,lx2160ar2-pcie and allow fall back to fsl,ls2088a-pcie.
> 
> Sort compatible string.

Applied to dt-bindings, thank you!

[1/1] dt-bindings: PCI: layerscape-pci: Replace fsl,lx2160a-pcie with fsl,lx2160ar2-pcie
      https://git.kernel.org/pci/pci/c/1a1bf58897d2

	Krzysztof
