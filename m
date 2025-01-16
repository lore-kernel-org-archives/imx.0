Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240448821
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 01:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736992071; cv=none; b=pJwL+OniJ7b1s7c3g+xf8NcHIa19w8HCzx9B2z8P9BDhR/pxKUJedxn7SiPEXkmzwhAiaqXKvFgIGvw+QLHZHAheG9Va08wk40jv3Ru9lVqlLBLSplkiJeVou793xoZJAGSftV7Rz322cbMZkEsv9J8XoDvoP516YNEINMLIHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736992071; c=relaxed/simple;
	bh=4mQyNmO8TAipm+1tJsd/yT/ncWCjs1Dsr5OhE7y2EOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXRtAvLjl30OV7HVIgJu/zTMGEL1Inslyl0s0V/8BnSUebUfB5hPzQR1/IEKBPj/IikENn+UkICK0+fh2FBTvIjNqMUYki807SZaLLV5y8mxz2sr3jfrHrOWnNPL/Ujljn1SzXeZAdT8PtChXg44+aAV0/atv7K8WOJtdtgJ/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso647984a91.1
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 17:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736992069; x=1737596869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QNPVQXecLokCMBNU0Zpch+WkI0Q+RjsM7OPeRvuUd8=;
        b=nRVliOqslpp2036d5AiQ2WEP/hXELcNAYLDuL43lOpSUFh68xtagzNHO3xS2laN1zx
         Z4fla4+cowAafXIVXyXYDhuSGkCS4S9wSOQZt9bIXK6S5h3B+Du5ShmGkVpB5fZA7I1c
         Lo4V5L+Szxr7RiZcZ78jQOCnAmbGvEx/J1AV2Gob/eEJktKbyYVaH1cSj5LRfE3mBYaG
         fgzlgAe4q4yHo7YBgIa2K1H2XtvB6cNkv6LSMZeudJKq7QJ0XfzLe2kic7RRXjE2IzvK
         /ZXKi4PMnyZ+SQ1LppfscOs5xoaE6UK0eA1dJios8KWXkrJB8/WG3kyiqnlV30pvISYl
         V0kA==
X-Forwarded-Encrypted: i=1; AJvYcCUbvT6HGHSq/R6y1Ji/CBh7cVuRR7infoTScQUV2ReE3rgYavbBehpm8sDXFS3bb+WgwBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXmMkk+oZLsIB5930NxQEBIet4hKAOMrMnqj47IOTCF3eMNyy
	/B3VagpD+nKtfzp3cycWbEVgKJwrjG3RFgnpejh4oxOMO0+JDq5afygMapYG
X-Gm-Gg: ASbGncsE+PO/2nLh3eElfVEL5fzPaobaWKFYYNRiQRA52TIzIb8yI7379YcOIDzaud5
	tG0a96W9bNs8W/LJmUCnr+10ZLrs2uDYpXYqwSwxSNOCYB+WXMznWUCUao0qq8jZeTogpuruIVH
	hpkoeZxM4BaeA1n65reyvNcObgRUqXtQwKT3Fe1hOJ8Vr9xNz9Fshdio5qYpdnyKZtcJS9Eu4jb
	4VyiW0fRIbgaqZoJKRr+jQM+q2c/ympAqSbfU9MzxkesKdczB9jKZtpHpX14ggoGH7SKC/3Mjty
	40SgTm656KHAf1U=
X-Google-Smtp-Source: AGHT+IHIPg+1+HCTsuijQC+DWu9OaoAsxoCVaqGsJ9zBPENZpCBH7mo8AWX3+7KImg14FW/XnuOBQg==
X-Received: by 2002:a17:90b:2642:b0:2ea:aa56:499 with SMTP id 98e67ed59e1d1-2f548e9aed3mr41058488a91.1.1736992069406;
        Wed, 15 Jan 2025 17:47:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1ccf46sm2071655a91.22.2025.01.15.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:47:48 -0800 (PST)
Date: Thu, 16 Jan 2025 10:47:47 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20250116014747.GB2111792@rocinante>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
 <20241124143327.6cuxrw76pr6olfor@thinkpad>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124143327.6cuxrw76pr6olfor@thinkpad>

Hello,

> The newly added warning should be mentioned in the commit message. But no need
> to respin just for this. I hope Krzysztof can add it while applying.

The commit message will include the following:

  To expedite deprecation of the cpu_addr_fixup() callback, warn its users
  if the 'ranges' property is missing from the Devicetree or the address
  translation information is somewhat incorrect.

Let me know if anything needs to be changed.

	Krzysztof
