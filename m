Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567061DC1AA
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462222; cv=none; b=tLwUjQRuS7nwDgc70u8iQrYW9ZTlrwZnQR5q+IsjF+C1oY2zyw6D2AvHIdGHkmbwlGet+4QrhXITvI501wtNTtyzxFAtcC3mX83TEfkms2vsRW20+vz3ZTuBV+zWxHcM0FQhIcNhsQHl6MoSYoX0GDvqmjZF6Id9ExeKcdhYX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462222; c=relaxed/simple;
	bh=oAtw8QLJTfDJtAImTRmUn59QUaqixqWWWJkpAI+DRXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyOuVNQmP3MYTZkhpJE/YyBFYHAeXXvNVKrNh1+Rz0zKJEdP22UaC1xQ3b9E/+NlYf7zGQE5s/CgmREQ844tJD99/AH4JB5t6HRix4sEKpp5fEwE+rtFCHOMDv6h0aBFB3gTHMrbtWGx5k9eSWewGbT23LMdRin4V+mw5XohtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7142e002aceso5139055b3a.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 08:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725462221; x=1726067021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOC7waCCkQoMQkhqz0PBH9fJGvLRMTZyncgnFWYy3E0=;
        b=G2H/+cUDTEt1LpvkSB7dzR7zX+100psBaDE+KhviLoui4ks8LBRtMynTh/0n11fGuj
         J7mWDP5NZOdNyPVo97iHD7G+dEhiZ26+2s9ezyE50aXsHZzz/oWO8RfMKnQEzaMe58dz
         gCvS3tcqG7331Pkgq3haqYhd2XzHlIG1j9vsqTpZHyooPkyQGhXK/+BE0xwyRysgPc7Q
         XL0TwAchILYdYABPcspTs4t4ULxUZ9PhJyy2xLGsLPpG92YRkjjB4PxJ7joyvLgYSP+D
         byxrbu34wsUd21rAUbcQzlyyptRkPjAIwTJRHf8PkHUPYjP3AOTBCVtpqFmkhYhDbFP8
         BeEg==
X-Forwarded-Encrypted: i=1; AJvYcCX5KnbMlV436nXApqlZM2UyqB69Hea16SFz0QAvL4EEZ37vvSv9jv2gC0/WYVXAnWMWTzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLmoSFGiZ/hWeGkea/5GXGPzPJan82DqQhKeEvj/irYmYp63JV
	j9/9grYZxv/+KafrtNEzAYwDVWvor5+vOUHmeUOfBIJzazAKglkN
X-Google-Smtp-Source: AGHT+IHyKUc0x9KM8r7gfcsXlK+gsn4eBpyS8muEMq8I3FrEpz0HjjpC7yuRyiiRAMxAoDlUNTSa1g==
X-Received: by 2002:a05:6a21:4603:b0:1cc:e500:5f30 with SMTP id adf61e73a8af0-1cece517cd4mr15437085637.24.1725462220519;
        Wed, 04 Sep 2024 08:03:40 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8cccfsm1774651a12.22.2024.09.04.08.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:03:40 -0700 (PDT)
Date: Thu, 5 Sep 2024 00:03:38 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: PCI: layerscape-pci: Fix property
 'fsl,pcie-scfg' type
Message-ID: <20240904150338.GD3032973@rocinante>
References: <20240701221612.2112668-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701221612.2112668-1-Frank.Li@nxp.com>

Hello,

> fsl,pcie-scfg actually need an argument when there are more than one PCIe
> instances. Change it to phandle-array and use items to describe each field
> means.
> 
> Fix below warning.
> 
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#

Applied to dt-bindings, thank you!

[1/1] dt-bindings: PCI: layerscape-pci: Change property 'fsl,pcie-scfg' type
      https://git.kernel.org/pci/pci/c/f66b63ef10d6

	Krzysztof
